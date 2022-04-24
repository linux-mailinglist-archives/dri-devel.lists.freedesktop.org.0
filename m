Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0952C50D349
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C000F10FB80;
	Sun, 24 Apr 2022 16:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AE810FB80
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 58D665C010D;
 Sun, 24 Apr 2022 12:26:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 24 Apr 2022 12:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817599; x=1650903999; bh=br
 GhkMg2GbwF8k+xeCGZMCp6rvLtDo6nmVpIA/QqdHQ=; b=YDPDEUkPrnxqry/mPE
 dBOiTuYe2lB3VNQWsE9IwUaNeLT2rX4c8yzMwBG1EffTs6x6m5efeJ1xE2AQIRim
 CRqgKnuR7Xt9CY3N1LEp2uevJCw5WE+w28zbF2HjwM6ozuBg80mplDQNhjF8BZHs
 r51/7ksUyHx+ERtEGZo7pOC/cOO/Xi+RN6Xbm+LT8fvKiSb0LtYLqZNQPDcNlCcL
 sq47tjGJVqvpDQHbuJmuBcjB0gn04bhxi+AiARmTQk1xJ00S8tyVMDWFoIRb1HuT
 yWNeh20pjxbQFvUlwR56NXywrBIVgzA4sbot0RUjliDbpBNK6Kq3o3C/MX4tvCOO
 vC6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817599; x=1650903999; bh=brGhkMg2GbwF8k+xeCGZMCp6rvLtDo6nmVp
 IA/QqdHQ=; b=GCEncY/ouKuwAAuiHV3eVgVuKNYvcntNDYfPMW+DrF3DoPZOu5r
 Hsc440jxidycety608JGMzwkgJQld9Pu18wrmrEEhzBZOYIyh8Ll8mQoKZRlr5G9
 3Q24mn8C3kxsSGlPp7J294jBkpHkOxYmP0CvUpCq06t1heYwURrNFPUF7nS9YFxs
 q5zgrqCGyVZrssBNe3CGcsp0dlVS5N6Df3e5/yi/YKvNOL0fHgZvBuiF5r0vBk8y
 rUwRhrkMPtuiMsrkw8OUK30bUna+TKPF2n6JmBNigwpVhH5CgZqDh78+4iG9mW59
 Nl7QgDuCRpkj9j0jEgsiRQ8rR09HdfyLJYQ==
X-ME-Sender: <xms:P3plYsXIHFXF4VtZYIbzVIbXh3I7plco1zYrE_bDaGR344nZ7atr3Q>
 <xme:P3plYgmWNE16pHjWpMwF5AntgjFU6RJJjI95GBAv0qorCCYjBiVWfO-2ucz7pklbJ
 1P-upcpXsSyZ-CJsA>
X-ME-Received: <xmr:P3plYgZQ3DOeCHfHaIzrtwIUJJFUAoR2JMpa_Df_a9nw2sG2htIqudHmIAMnZu8FYm1u4hVw4mw51brWX0jnjcAzk7bacLyuiAutZoKfqo_BRSWfvPKwbckPe8MPwJWKiu1ieA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:P3plYrXiHkN0fpK4_At43Es8tBiE1aI-i5FpMZyz7aefYhFHzLS_7Q>
 <xmx:P3plYmnp9IQRqjvd6Z4tqBfb5xNvw6oJjjA2aN_Rg5YsYXbQqXXjWA>
 <xmx:P3plYgdUrmHxEkoC_kvD70lOnqyx39-TLyyQL9X6zJizgjrP0hJX_A>
 <xmx:P3plYh9Fl-CGQitGJIiw4VAvpUsHqvZSmAy6djLwVTYp9FsG_QVobA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:38 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 02/14] dt-bindings: display: Add D1 display engine
 compatibles
Date: Sun, 24 Apr 2022 11:26:20 -0500
Message-Id: <20220424162633.12369-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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

Changes in v3:
 - Drop redundant minItems and maxItems

 .../allwinner,sun4i-a10-display-engine.yaml   |  1 +
 .../display/allwinner,sun4i-a10-tcon.yaml     |  2 ++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  2 ++
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 28 +++++++++++++++++++
 4 files changed, 33 insertions(+)

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
index 449fa99aa51b..845e226d7aff 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -41,6 +41,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun8i-r40-tcon-top
+      - allwinner,sun20i-d1-tcon-top
       - allwinner,sun50i-h6-tcon-top
 
   reg:
@@ -151,6 +152,33 @@ allOf:
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
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP MIPI DSI clock
+
+        clock-names:
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: dsi
+
+        clock-output-names:
+          items:
+            - description: TCON TV0 output clock name
+            - description: DSI output clock name
+
   - if:
       properties:
         compatible:
-- 
2.35.1

