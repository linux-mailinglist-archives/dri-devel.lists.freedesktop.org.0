Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D84FB2F9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C97210E966;
	Mon, 11 Apr 2022 04:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666DF10EB82
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7E89C3200F81;
 Mon, 11 Apr 2022 00:34:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 11 Apr 2022 00:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649651673; x=1649738073; bh=mW
 R5ESPxIyIK6AtQlGiBisdU+PBsLGGav25qxRmI23I=; b=hLO/AuqSkwnjZu3FI1
 YmygnSAzbdT1jDSgrk3zV8OMcKWRN7oF3Y5U+8fLoKM1CFmkmdflRhEMy0AZbso2
 I3cVlVZfr9Egm4HpsVSaC4nJoA72uxH33J4Xqp+XgYrhEv7oVViYjxQ4I8+8UrI5
 dMMGvac+1TcAJdp6zuRaDzs0z3+fMuOmxSpM8DwvmzuNYq+QEYYwF2ZxdcBMzEzu
 5MnRT7qL7Nkx0dPeea8doghdVhiNt2w7ZofGKB4HZd10HBVAVdxWlwgYUqYUwfMd
 jFhEVzlLpmIMAPQNv6CatFnSXqeFt/jvTkRiadkgcNvvW/2CA6T8jM+94Z/F71NH
 dXLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649651673; x=1649738073; bh=mWR5ESPxIyIK6AtQlGiBisdU+PBsLGGav25
 qxRmI23I=; b=jNn+D2/ip4Q811YH8eaiGZx6mUWwiIpEDlbpCj4UOF964JBrzYY
 9VBJLy+DGhWZ5ZJk6JABCE1QlQ29RGYT2hPxH1YLQ6kc+lJ8qtw+fWB5AHdowo0u
 GyARiN7KZJXznULoxcgLcjjlfK/XZlGORKmNWfIylKBxXcpY+qjQm6DvzJ5FDhYg
 86pvoWvrDbMobphdJbYk0SB6Z3JeCykH0akbhUU3O1L4/slnW56fjwh2acQZqSVP
 JYpEvxhLL+iVFVpcxRJo4Ibj5UCBpel/noOGvIEeixspe/tEA7u8jGSlGKZXTKAr
 FM0nGTKv/WFjjcnr6xceUA5los3v6oZR8NA==
X-ME-Sender: <xms:2K9TYvHAAFeFG6pUQmvHsPgJPiFiwyk43y4fhrxtQPOTWq5ElJy-_A>
 <xme:2K9TYsXIzNzO9IJ89xwp7chNvANRsirB0u2SeiqrqAoXxzce-R9dG-1AbBtbysXqH
 ueqmhue9LhtInYrqw>
X-ME-Received: <xmr:2K9TYhLSjuLHkfrrCsF_Duw47WLmwJ6AqobX5XpByywgcvGM5AIVt_Rvr2ce17sl1jNTb0fH6iOWEwdOF7MZzZ3xJNYKZrr9qaeYzZ85OgLHnLFAmjBD0GcRnwiPFgMw0EjymQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:2K9TYtEJB1Hlvr4HgxxAUVmcsoP-N4zDrrxwRz0g73LNFeR4DpUp9w>
 <xmx:2K9TYlW4wFkgGVMGFY6tpwq5neOSVUa8uP--0cQ6FJYRWvlihmR3uA>
 <xmx:2K9TYoN27YEkZwBIrvGTIE8BpBhmOgJZNYeRi8r6hFMiqDOz80qmgg>
 <xmx:2a9TYgMwKuqNR0bg3Y5oxpeh0c1VvQDO0Us7LcSPllCWB_frd8Xpsg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:32 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 02/10] dt-bindings: display: Add D1 display engine compatibles
Date: Sun, 10 Apr 2022 23:34:14 -0500
Message-Id: <20220411043423.37333-3-samuel@sholland.org>
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

Allwinner D1 contains a display engine 2.0. It features two mixers, a
TCON TOP (with DSI and HDMI), one TCON LCD, and one TCON TV.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

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

