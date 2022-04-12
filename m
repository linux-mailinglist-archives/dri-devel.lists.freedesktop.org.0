Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761F4FCDD9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209BE89415;
	Tue, 12 Apr 2022 04:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645710FE6C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E5F2B320187F;
 Tue, 12 Apr 2022 00:28:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Apr 2022 00:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737695; x=1649824095; bh=zs
 X2tVT9WZjk69hIMUKGRDDFdV7ixr7Me1PsqoJ1G1U=; b=nFVGPOISdaJnrA/LLF
 AX5FiQui6VA+Lt8aeR9dBY3VgUfmyy4MBykm5sdDH14Lfexo3Q+/iUbVlmgGBsnR
 lLXLX+qv5ruQEzeoLGP+4O3MoQIaa80YjSfj7dyppT1rYiVI0LMzSFURJSkADdHb
 KX/bvyBKHuB50zHnjAmwWU2kZAz25qPMbDxIt6pBylzU2IkwSr2q1dK9TDN+vpY7
 eFqTHEUPq7qAh4s9VWYboPdt1rJ5kgVMmJU3AvxKM2lNnvpxBYH57Dz87jG50qtW
 TAUsfRLvl3U+WqoZPrpaGvkohXU1B+FGOP09E0YldLMcfFSvBvOAzjPPoc53miX3
 AFtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737695; x=1649824095; bh=zsX2tVT9WZjk69hIMUKGRDDFdV7ixr7Me1P
 sqoJ1G1U=; b=Kblv17LvPhrgRieKEuPhuQAm8wCSs55yyHW9Re0/WcpN48ToiKG
 E18+P4QcMjN+ZZGXt4dd1KqdlaIyGosIoYZB6S/mG93QOZEVk6FumUXMMlR19Vzk
 xUaFnRca5ErkG9/ZVLFHb9k3EOD9ybtW4I+XrVus4HXnPfwmvgZRofiEqZDhDgQ3
 tfJ8O3WbOw6mTajnCkQirlzazdM71naCNcpoII2eB3ZBKbxs7q7rSpAv4ALOGP11
 oGKoHDfhBg7vw/gNL1L5ENV3i2R9IeZ80zjgB9KiiT3gsbM3WkQB0yIrInvyWU7E
 u3hgfv2zbmZdZ6ZvqO5K8bknFfGb/JfpQrA==
X-ME-Sender: <xms:3_9UYqMFVxiPBdCF_jDtvSt9xIudxd0T1_R6YZ0kCAcB-PmJlMiMcw>
 <xme:3_9UYo_0V2B9_HMNDebXn-KWf5GSugdBoK84vZUVS9DOmxEL0ajBitNaaMqHArMML
 UQhrsdP_VCSaYqlHw>
X-ME-Received: <xmr:3_9UYhTzX3ib5kzt1huovZdSxnFVghR7aJRjEOOlWiNsj61s3obf0OOXkzr-GWXvIqMugLs6TxLpp8E0um66P52OENfrX27iACuiMxsp2d_i_-AZBdmDGbN_v0vmRJiQLJASdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:3_9UYqvjkSgV6wfllZfqM_LZlXQc_p7-enPdlYbFisc8fuFSngg3TA>
 <xmx:3_9UYidWkcCaDMhD9OQu17QTaOsLLYKw8MPLKF9exgFirCQN9wWDuQ>
 <xmx:3_9UYu1UI1Bv0x7ZpHw5_uQRx28mQrTHFTbv9mNk--oMCOVBmxHo9A>
 <xmx:3_9UYo2iJLlRzLLIIRl0gmSttHoLmi5e4tO-r9j2Y79syi8KbNYS4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:14 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 02/14] dt-bindings: display: Add D1 display engine
 compatibles
Date: Mon, 11 Apr 2022 23:27:54 -0500
Message-Id: <20220412042807.47519-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allwinner D1 contains a display engine 2.0. It features two mixers, a
TCON TOP (with DSI and HDMI), one TCON LCD, and one TCON TV.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 .../allwinner,sun4i-a10-display-engine.yaml   |  1 +
 .../display/allwinner,sun4i-a10-tcon.yaml     |  2 ++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  2 ++
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 34 +++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index d4412aea7b73..c388ae5da1e4 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -62,6 +62,7 @@ properties:
       - allwinner,sun8i-r40-display-engine
       - allwinner,sun8i-v3s-display-engine
       - allwinner,sun9i-a80-display-engine
+      - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
       - allwinner,sun50i-h6-display-engine
 
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 3a7d5d731712..4a92a4c7dcd7 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -33,6 +33,8 @@ properties:
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
       - const: allwinner,sun9i-a80-tcon-tv
+      - const: allwinner,sun20i-d1-tcon-lcd
+      - const: allwinner,sun20i-d1-tcon-tv
 
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index 4f91eec26de9..cb243bc58ef7 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -19,6 +19,8 @@ properties:
       - allwinner,sun8i-r40-de2-mixer-0
       - allwinner,sun8i-r40-de2-mixer-1
       - allwinner,sun8i-v3s-de2-mixer
+      - allwinner,sun20i-d1-de2-mixer-0
+      - allwinner,sun20i-d1-de2-mixer-1
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 784b267635fb..cc32e2faed91 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -41,6 +41,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun8i-r40-tcon-top
+      - allwinner,sun20i-d1-tcon-top
       - allwinner,sun50i-h6-tcon-top
 
   reg:
@@ -154,6 +155,39 @@ allOf:
             - port@2
             - port@3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun20i-d1-tcon-top
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP MIPI DSI clock
+
+        clock-names:
+          minItems: 4
+          maxItems: 4
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: dsi
+
+        clock-output-names:
+          minItems: 2
+          maxItems: 2
+          items:
+            - description: TCON TV0 output clock name
+            - description: DSI output clock name
+
   - if:
       properties:
         compatible:
-- 
2.35.1

