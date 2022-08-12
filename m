Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2A590CA1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32969AD3C;
	Fri, 12 Aug 2022 07:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C05218A044
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:37:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B98575C0185;
 Fri, 12 Aug 2022 03:37:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 12 Aug 2022 03:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1660289824; x=1660376224; bh=0vomSWUYgz25cq0M/5SuumlfH
 1NhqVcmcXAH78BG0Ro=; b=CSCNL4vjOfBWUBIKzMHLUdL5JO72UJcw5KFlg/69j
 CF5KU+84gaRWu0+rTWpVH6NduN5x/MAA0b8mzT7BAu+4P504QpDIILGG10Uj9mYQ
 mdGsTfqHPqEZYGmTTLjQyLuuqps7TzaQqttMGtYAz+sxO1IfLWe3OOpLex5VizKf
 zGqB+CDYHOh4yKniX7Muv78ELx71ihGCD1Ah7YOqtHkZOSBuUnQmdVEiH/BP/uRA
 dPsEfCn1a83wPwsNFxQvezOJKTnGhGbtPTJs317ktf/25MViiaTpkQJtkyGxZN++
 s2Enhe5t/TjrnFHfs1w+qbef4NJOxXuaZxA5Hg3pTvbmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1660289824; x=1660376224; bh=0vomSWUYgz25cq0M/5SuumlfH1NhqVcmcXA
 H78BG0Ro=; b=f9h1J5ARtHOZZVRwp2sHuWrsT22gk5MWMwe2V7JK/RB33DSSmvc
 8LsAPI59jG7eviCgsbd/wUGrmtpQzVw3Y1S0Q+bDo8wNjFiAw+RuzZriauO2mf5v
 8k5sFJj/d4rvJkqQqKwcXM5+Fhmsl6SexiojDe+LzRXUl2krEHCQxc5rDf2t5GGv
 5YofMLj9KqE6sjshEIY/wf4Fe1REBnE3V+GZrzamefoS8V6/b8ULgFzSj8HU2BtH
 xQgSMTEQ0Lua266bJXmDAiy/Tfb/4VGcuflIaK2J/umwKErYH+1x68eAKe2BlCLL
 aPBvrAAWtRH/fZDVP226C3LcvqGV1C0+Emg==
X-ME-Sender: <xms:IAP2YoiprmhceXYihmGNyokxR2u5bP7m4xu63M4hZaeAtpiSq4q_4A>
 <xme:IAP2YhB7BAC0E3Bg_Mre68J5GVDZMtnx7zUexUd7AZfxh0jJ3vNuVJI3v7ddq1dck
 uJptI0bTfY0hCnXlw>
X-ME-Received: <xmr:IAP2YgEemVKtLl3JziUzXnc1TCan_9_jFB-QUTNI3DOZuy5wqscUF6W11p7s3-23asyNTfDZucfP0TIEnYFJYNUpOHQkBZjpXHUsuPxgDWPgntf72iXs6TstPdXTzdX7l8YXDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeeh
 hffhkeekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:IAP2YpQY9ofEqq7c6NrJ0gi3rv-PZ3CI7ccDRlu_paY48e9qX4tjtw>
 <xmx:IAP2YlwzkTq5TtKGzMkiGP9ZrVJuSuoQ50MjXXR1qn_fGjCL0Df4VQ>
 <xmx:IAP2Yn4irgWWHCp8oDUVPtl1TJsG4JrI60dkPTug07019q8nxhn4Jg>
 <xmx:IAP2Yr7QKe2bW58vetWDAUcgVy9ACiOo5M-H09QqEsnp_PuamCBfAw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 03:37:03 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] dt-bindings: display: sun4i: Add D1 TCONs to conditionals
Date: Fri, 12 Aug 2022 02:37:02 -0500
Message-Id: <20220812073702.57618-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When adding the D1 TCON bindings, I missed the conditional blocks that
restrict the binding for TCON LCD vs TCON TV hardware. Add the D1 TCON
variants to the appropriate blocks for DE2 TCON LCDs and TCON TVs.

Fixes: ae5a5d26c15c ("dt-bindings: display: Add D1 display engine compatibles")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 4a92a4c7dcd7..f8168986a0a9 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -224,43 +224,45 @@ allOf:
             - const: ahb
             - const: tcon-ch0
             - const: lvds-alt
 
   - if:
       properties:
         compatible:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
+              - allwinner,sun20i-d1-tcon-lcd
 
     then:
       properties:
         clocks:
           minItems: 2
 
         clock-names:
           items:
             - const: ahb
             - const: tcon-ch0
 
   - if:
       properties:
         compatible:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-tv
               - allwinner,sun8i-r40-tcon-tv
               - allwinner,sun9i-a80-tcon-tv
+              - allwinner,sun20i-d1-tcon-tv
 
     then:
       properties:
         clocks:
           minItems: 2
 
         clock-names:
           items:
             - const: ahb
             - const: tcon-ch1
 
   - if:
@@ -269,40 +271,42 @@ allOf:
           contains:
             enum:
               - allwinner,sun5i-a13-tcon
               - allwinner,sun6i-a31-tcon
               - allwinner,sun6i-a31s-tcon
               - allwinner,sun7i-a20-tcon
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun20i-d1-tcon-lcd
 
     then:
       required:
         - "#clock-cells"
         - clock-output-names
 
   - if:
       properties:
         compatible:
           contains:
             enum:
               - allwinner,sun6i-a31-tcon
               - allwinner,sun6i-a31s-tcon
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun20i-d1-tcon-lcd
 
     then:
       properties:
         resets:
           minItems: 2
 
         reset-names:
           items:
             - const: lcd
             - const: lvds
 
   - if:
-- 
2.35.1

