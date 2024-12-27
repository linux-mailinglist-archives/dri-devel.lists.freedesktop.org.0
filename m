Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16099FD36E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 12:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A926610E1D1;
	Fri, 27 Dec 2024 11:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="dKHwIouw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925DA10E1D1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 11:08:40 +0000 (UTC)
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
 by cmsmtp with ESMTPS
 id R46otd81xqvuoR8Cttxj8r; Fri, 27 Dec 2024 11:08:39 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id R8CrtkfXnENo2R8CstI0AV; Fri, 27 Dec 2024 11:08:39 +0000
X-Authority-Analysis: v=2.4 cv=ROK1HZi+ c=1 sm=1 tr=0 ts=676e8ab7
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=108W9xlQDzoLNeXj7ooA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iaG89kv/nDQri6+AUj/VvYcWX2dPo9unZTW0isixi4Q=; b=dKHwIouw1A+LZ6vBeMsK53gexU
 4EoZpenXJyapemVe6BFpR2uqs1R/HDUNA11e8yHDqmAksF33Hk/R+H8pgOtmMIetXaks7bW8djeDR
 TM+tF6tdaJFTqkri2Bg/GXlYgXAcuBUxz++Rc+YeK79t131RLVok2Ed8LsRSGmIXYCD/fDV9n23Pt
 N/ZjZUlPf+SMeCzwV7jLO/p7e25HBry6zKYqtUOuLNz3EFH0or324RJJVur/73mwc1ks4VQS28s9k
 uoQ3b47aiwKrO3pxx1sGl2+5hHl/atp6EcNfD0g1zhyI78p8KSH47ujfDKyOVUBXszyMgP2zoTvi3
 4NUaLgwQ==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tR8Cf-000bEK-2b;
 Fri, 27 Dec 2024 16:38:25 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:49 +0530
Subject: [PATCH 02/22] dt-bindings: display: sunxi: Add a100/a133 display
 engine compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-2-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=3186;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=buj54CCUt17f1cf4Nx7HHyU6fji1O8F3QBNHBtjCt58=;
 b=7f+/2lyNtA9ClRxNFGVgsbDuLVrtbMyTSgWSUOLHllta6RR9vdbcWmnBbk8oYinrrI2Urjlxr
 dSK9Ulbi6HyCqoOLw6YMdLZf9yXIihNokZw4UP2j+Rk0IEKN+oZzglG
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8Cf-000bEK-2b
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 61
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJG0i59SGoIjrrllTrCXlCB6VwmPr3Z2ShG42AzIdm+2bTjYTjctDD7I1AbsXlbrxeXbLG5t/5JlYhEPwINLpe2AWSmVGOf8ezoWrOW8WmielGWL40Mn
 ZIUEFOso29t9n1vWDb52ac7UGyH6Q4D8l8oLqBNlPETotQ2vEDSd62vvl3uV2DaM5IpgATgWZDGNUvjxim9LX9VVJOz6Rc3XbtD5phOdyihCfjeDQkZfNwfT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A100/A133 comes with display enginer 2.0 with 1 x Mixer with write
back support and 1 tcon top. Mixer can be used with lcd/lvds/dsi,
but shares the same GPIO bank.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../display/allwinner,sun4i-a10-display-engine.yaml     |  2 ++
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml         |  1 +
 .../bindings/display/allwinner,sun8i-r40-tcon-top.yaml  | 17 +++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..dc47c684fcb0 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -64,6 +64,7 @@ properties:
       - allwinner,sun9i-a80-display-engine
       - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
+      - allwinner,sun50i-a100-display-engine
       - allwinner,sun50i-h6-display-engine
 
   allwinner,pipelines:
@@ -96,6 +97,7 @@ if:
           - allwinner,sun9i-a80-display-engine
           - allwinner,sun20i-d1-display-engine
           - allwinner,sun50i-a64-display-engine
+          - allwinner,sun50i-a100-display-engine
 
 then:
   properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..ebcddca2efb3 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -23,6 +23,7 @@ properties:
       - allwinner,sun20i-d1-de2-mixer-1
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
+      - allwinner,sun50i-a100-de2-mixer-0
       - allwinner,sun50i-h6-de3-mixer-0
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..9b14b7fb2d2f 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -42,6 +42,7 @@ properties:
     enum:
       - allwinner,sun8i-r40-tcon-top
       - allwinner,sun20i-d1-tcon-top
+      - allwinner,sun50i-a100-tcon-top
       - allwinner,sun50i-h6-tcon-top
 
   reg:
@@ -179,6 +180,22 @@ allOf:
             - description: TCON TV0 output clock name
             - description: DSI output clock name
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-a100-tcon-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The TCON TOP interface clock
+
+        clock-names:
+          items:
+            - const: bus
+
   - if:
       properties:
         compatible:

-- 
2.39.5

