Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8487C4FB2FA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFE010EB66;
	Mon, 11 Apr 2022 04:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Mon, 11 Apr 2022 04:41:04 UTC
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38A810E9E9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5842032009EF;
 Mon, 11 Apr 2022 00:34:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Apr 2022 00:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649651669; x=1649738069; bh=uz
 54NS14e7zXJlOyUIZUVcf4KVhO2+zporksnlKNjNk=; b=BfRzkMNNWIIqQOHr7M
 EagAAanZ6v0dbW1NZlqfLio5ABfsz33OThVXdL7mfZZd+jwddxHEuTwQjHy2m/LJ
 6BwYzaPYic3iKoQtKp5tu0iZVQCN2JtI5+aZa737D6sq395S0cpMclqaaMdpuOQU
 UCqyT20WTf9h+Dg1Lc6Gj5EYAybGUAxON5bvNjeJn8Tl/spdBIgq6UeXIATIS7EJ
 7n0R6rkYVPoccXOYvrGTQxzWTn09cgYJqvT6FV9t07rLK+FzYk4S2YWMO9ddFVBE
 CU1I9Ty2egK758D4D6gn4COLLJ+i5KlaQOwpxwRTPMAdP759bhcs9CAK/0WBaHP+
 1GKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649651669; x=1649738069; bh=uz54NS14e7zXJlOyUIZUVcf4KVhO2+zpork
 snlKNjNk=; b=XTFrVSgraIw5wg8qxb+I9ZAh8b59dMn/i+5rkW6jIB1W69xQsOf
 WpmcuEA54SaMn+M1rirJxd9QIv5n6S+ghA2amo2epQ1FDF43WtDRbS1iQX2Nzv0i
 YtSC+gNSuxqe2LZdyKStVnWzmt4Bz0d48/7qUp1dXV6Hi0BnrZdi3wAjJIFtNje+
 6AqVh9CY5q6gEhE4z1kRLVygHm4lkF97KZkFTTbaTnf6Lcdw57nXss45Vvu5k5Gs
 SoHdXOiqLxj2e+Ob4WD4RjNT7MO95aQM64nMNv4ssUmBMxkchiBC7viNH0/Et6Ex
 mkoh2j0n+KSrcB/WuDcR+zDug5o0fQiLCPw==
X-ME-Sender: <xms:1a9TYpGSPtSQTSSuwjYTpGo2ajfV71tzSRmQ0_XeDs4q_9__0rkJMw>
 <xme:1a9TYuXJ9LlLNXQdhYlrfGVoSEil6g-Yxl4CDnCgaXFqN_b1m52wr1o-WY7wuh5mK
 PhWFPpHmBpsjT-fYw>
X-ME-Received: <xmr:1a9TYrIMGseNYjC_jPCnE6wUe_sjjk772tGOAoVdraJZoy_Cqik9ivreVttI9M4QW8fKDuzliJzJ6cDLiDTbeICcOhVIcgfyKOkfs1w3GGzYCIyNxQqrjz2SL6IRNMG7VsZy8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:1a9TYvG_eoLFcDNCsIHdkFhpB3PY_G1-iYTkLof7MmQqCTPyCFDvVQ>
 <xmx:1a9TYvUDJgMXS5bRQVHpaYsJefuoxBcNZz-cafJ5MNtZJe4Zkvc_OA>
 <xmx:1a9TYqNpgBtKfJ9NMS3atu07VoLd7-3lUExv2Oso1DiXy3PdkPNMXA>
 <xmx:1a9TYiMr4DjmxHjztURPW3onnndcoHDijs06OLVQ8JYuRC4p3tPllg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:28 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 01/10] dt-bindings: display: Separate clock item lists by
 compatible
Date: Sun, 10 Apr 2022 23:34:13 -0500
Message-Id: <20220411043423.37333-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411043423.37333-1-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So far, the binding and driver have relied on the fact that the H6
clocks are both a prefix and a subset of the R40 clocks. This allows
them to share the clocks/clock-names items and the clock-output-names
order between the hardware variants.

However, the D1 hardware has TCON TV0 and DSI, but no TCON TV1. This
cannot be supported by the existing scheme because it puts a gap in the
middle of the item lists. To prepare for adding D1 support, use separate
lists for variants with different combinations of clocks.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../display/allwinner,sun8i-r40-tcon-top.yaml | 111 +++++++++++-------
 1 file changed, 67 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 61ef7b337218..784b267635fb 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -48,31 +48,15 @@ properties:
 
   clocks:
     minItems: 2
-    items:
-      - description: The TCON TOP interface clock
-      - description: The TCON TOP TV0 clock
-      - description: The TCON TOP TVE0 clock
-      - description: The TCON TOP TV1 clock
-      - description: The TCON TOP TVE1 clock
-      - description: The TCON TOP MIPI DSI clock
+    maxItems: 6
 
   clock-names:
     minItems: 2
-    items:
-      - const: bus
-      - const: tcon-tv0
-      - const: tve0
-      - const: tcon-tv1
-      - const: tve1
-      - const: dsi
+    maxItems: 6
 
   clock-output-names:
     minItems: 1
     maxItems: 3
-    description: >
-      The first item is the name of the clock created for the TV0
-      channel, the second item is the name of the TCON TV1 channel
-      clock and the third one is the name of the DSI channel clock.
 
   resets:
     maxItems: 1
@@ -129,32 +113,71 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: allwinner,sun50i-h6-tcon-top
-
-then:
-  properties:
-    clocks:
-      maxItems: 2
-
-    clock-output-names:
-      maxItems: 1
-
-else:
-  properties:
-    clocks:
-      minItems: 6
-
-    clock-output-names:
-      minItems: 3
-
-    ports:
-      required:
-        - port@2
-        - port@3
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun8i-r40-tcon-top
+
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP TV1 clock
+            - description: The TCON TOP TVE1 clock
+            - description: The TCON TOP MIPI DSI clock
+
+        clock-names:
+          minItems: 6
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: tcon-tv1
+            - const: tve1
+            - const: dsi
+
+        clock-output-names:
+          minItems: 3
+          items:
+            - description: TCON TV0 output clock name
+            - description: TCON TV1 output clock name
+            - description: DSI output clock name
+
+        ports:
+          required:
+            - port@2
+            - port@3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-tcon-top
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+
+        clock-names:
+          maxItems: 2
+          items:
+            - const: bus
+            - const: tcon-tv0
+
+        clock-output-names:
+          maxItems: 1
+          items:
+            - description: TCON TV0 output clock name
 
 examples:
   - |
-- 
2.35.1

