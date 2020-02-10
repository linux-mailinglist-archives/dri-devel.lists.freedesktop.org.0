Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD16157EFC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 16:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26A06ECA2;
	Mon, 10 Feb 2020 15:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E6789319
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 10:05:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 347A721EBC;
 Mon, 10 Feb 2020 05:05:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 Feb 2020 05:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=OUh+BFLJI5/m/Us7I80+FqIdT/
 uSz30g4NJ7pLIJY3M=; b=IpUmhiskEa1113T6f3lghkmRosWYCMMN9Cso84Trkf
 ArHV2hNwHuA6RMAAyjbPfu11XeolabRN9LcO6aBrPd1NkABHDJp1wdmlVcvvG7nq
 dcxEppMISFZvbyNaZbuYgOHwq+IrJYKP0i00raNsmEE0CKfVnMEWREJf3AdHF+Hn
 qZEk+qVVOt8FniZ9Jrk8GxGQdoiXS2fw/ivwmzmZSv94tprbVmRWtI+sere4Bxev
 BXRw5Dxf8kcMzIMhR9k42tphKsMiXdXW3hhJ0HCAfYZEazBXTi8TlFEEESkFmR/6
 S+c48cjfPjsQSBKPEEZUetmcObqQgWFVDurGBhT7dAcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OUh+BFLJI5/m/Us7I
 80+FqIdT/uSz30g4NJ7pLIJY3M=; b=h/tiJSe5dVcST2lj26ttHoWFJPMC5oPBR
 sNK2eQk0KknT13rEWltwt7gdmT0NNoYwMCAaCi/qOlonHQAMSrk/dDTS2Msdjf1i
 0rM1ilFFCjnDp4dfqGDK/F62K9zLmsxD/sPrVL/rsaxXy1uAX//DfZXhq8w8rM/n
 UTEUdmUurvRKQUnaV1a8NdyvOz7HICUZ3TmUABX8ehRI4fmLpmZK3N8RTskVIwKe
 jg5v+9kUBJq1p0p8XT/J2eROjdbp8iozv++iDGleLmwAPH2pbG/V5oFNuIhqa3Dd
 NRWWDaLauyllFk9vRvDSq0fF6KTuKvvpZbIK0CG4cldYOIoAkGs3A==
X-ME-Sender: <xms:0CpBXo9OtRRWAtXpq6reQyhsyIVLBL7mNmGCCsmd61uUoGom4B1jHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedugddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0CpBXnA1BLfrQnBabSYNmIFZud7nzwWDPQO234IBYsmAKKf069ogfA>
 <xmx:0CpBXkDWmQl0oU5gTwsEAAl6pZoEUUHRIjraz-33PmGt3IytZ2QYpw>
 <xmx:0CpBXlxa-q7phvH-fovlB5hj2AaXvjgdKK5WHj6SKSggy901O0oscw>
 <xmx:0SpBXiLxGrwCfpjOICENL_6dZQoawTuMtVpdNF_2UA-1Yc9AFb3Agg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D97653280064;
 Mon, 10 Feb 2020 05:05:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: sunxi: Fix compatible
Date: Mon, 10 Feb 2020 11:04:55 +0100
Message-Id: <20200210100455.78695-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 10 Feb 2020 15:38:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
pipeline to schemas") introduced a YAML schema for the Allwinner TCON DT
binding, but the H6 TCON-TV compatible was mistakenly set to fallback on
the A83t's, while the initial documentation and the DT are using R40's.

Fix that.

Fixes: f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display pipeline to schemas")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 86ad617d2327..5ff9cf26ca38 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -43,9 +43,13 @@ properties:
         - enum:
           - allwinner,sun8i-h3-tcon-tv
           - allwinner,sun50i-a64-tcon-tv
-          - allwinner,sun50i-h6-tcon-tv
         - const: allwinner,sun8i-a83t-tcon-tv
 
+      - items:
+        - enum:
+          - allwinner,sun50i-h6-tcon-tv
+        - const: allwinner,sun8i-r40-tcon-tv
+
   reg:
     maxItems: 1
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
