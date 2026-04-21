<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="badges">
    <html>
      <head>
        <title>Activity Badges</title>
        <style>
          body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f7fa;
            color: #333;
            margin: 0;
            padding: 30px;
          }

          h1 {
            color: #1f4e79;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
          }

          h2 {
            color: #2c3e50;
            margin-top: 25px;
            margin-bottom: 8px;
          }

          p {
            line-height: 1.6;
            margin: 6px 0;
          }

          p i {
            color: #777;
          }

          /* 给 availability 行一点区分感 */
          p {
            padding-left: 4px;
          }

          /* 让等级更清晰 */
          p:has(strong) {
            background: #f0f6fc;
          }
        </style>
      </head>
      <body>
        <h1>Activity Badges</h1>
        <xsl:apply-templates select="badge[@type='activity']">
          <xsl:sort order="ascending" select="name"/>
        </xsl:apply-templates>
        <p><i>&#xA9; College Productions Ltd</i></p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="badge">
    <h2><xsl:value-of select="name"/></h2>
    <p><xsl:value-of select="description"/></p>
    <xsl:apply-templates select="levels"/>
  </xsl:template>

  <xsl:template match="levels">
    <xsl:apply-templates select="availability"/>
  </xsl:template>

  <xsl:template match="availability">
    <p>
      <b>
        <xsl:choose>
          <xsl:when test="@level = 'beaver'">Beaver:</xsl:when>
          <xsl:when test="@level = 'scout'">Scout:</xsl:when>
          <xsl:otherwise>Cub:</xsl:otherwise>
        </xsl:choose>
      </b>
      <xsl:text> </xsl:text>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>

</xsl:stylesheet>