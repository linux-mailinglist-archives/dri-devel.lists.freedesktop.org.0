Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB394A6E8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 13:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39CD10E4BA;
	Wed,  7 Aug 2024 11:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="h+yhml9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7655810E4BA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 11:23:01 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723028874; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P3xNijDR3vvpK0mFwZdmZjRHypjEO4wkRbuLAnDj7eIqVTBKiLUivB7tRAAhJJ2gAM3UeKSpWBAKtBCjbB50aiNc62a+zRhpjZvxRy8FJwkv/+ag7uqCSHhq8RQx2ZDOaqp6KyvF1w0dpVzA8oO3fgZKpcMnDenddQIWteSsWWk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723028874;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+OngFyGz8aHtpzaAdp/JMBWtgnn7bL5qwgl/vBFveqw=; 
 b=PS94HwmAsMvjL6u3pedQWYuTgBiwRo+voamJ3/a3yMRI2F6JmHKxMW0vXspdtlThU/8di9P9fYpFGCO7m4unxJDiErzh4R/L96FtiOqRXyhCIsHud+i5/hFw6AQJ0Auu988HQEUvk+axH9DIY1vC9C7ZpT8aRL2szgZNRiMNBy4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723028874; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=+OngFyGz8aHtpzaAdp/JMBWtgnn7bL5qwgl/vBFveqw=;
 b=h+yhml9Isxm6s/jLHbvPnYXlpfTUnOicXHeV3uA0oi6kZDIMvrAsgtbG9SB7GkKp
 j9fbjFPZgZ1XRnjMen8yoLFJO+/HYMTdmB0XB9j/FA5EWmTzTZCHKNQq2VK1RCiTrpo
 LFJCE4Kp2suZM2Uqdagr1r6R58X+F0Suu8lo5qnA=
Received: by mx.zohomail.com with SMTPS id 1723028873924292.415881178096;
 Wed, 7 Aug 2024 04:07:53 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 07 Aug 2024 14:07:23 +0300
Subject: [PATCH v3 1/5] dt-bindings: display: bridge: Add schema for
 Synopsys DW HDMI QP TX IP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-b4-rk3588-bridge-upstream-v3-1-60d6bab0dc7c@collabora.com>
References: <20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com>
In-Reply-To: <20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
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

Add dt-binding schema containing the common properties for the Synopsys
DesignWare HDMI QP TX controller.

Note this is not a full dt-binding specification, but is meant to be
referenced by platform-specific bindings for this IP core.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../display/bridge/synopsys,dw-hdmi-qp.yaml        | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
new file mode 100644
index 000000000000..d9a2ead02f27
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi-qp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Synopsys DesignWare HDMI QP TX Controller IP
+
+maintainers:
+  - Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
+
+description: |
+  The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX Controller IP core
+  supports the following features, among others:
+
+  * Fixed Rate Link (FRL)
+  * Display Stream Compression (DSC)
+  * 4K@120Hz and 8K@60Hz video modes
+  * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
+  * Fast Vactive (FVA)
+  * SCDC I2C DDC access
+  * Multi-stream audio
+  * Enhanced Audio Return Channel (EARC)
+
+  Note this is not a full dt-binding specification, but is meant to be
+  referenced by platform-specific bindings for this IP core.
+
+properties:
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 6
+    items:
+      - description: Peripheral/APB bus clock
+      - description: EARC RX biphase clock
+      - description: Reference clock
+      - description: Audio interface clock
+    additionalItems: true
+
+  clock-names:
+    minItems: 4
+    maxItems: 6
+    items:
+      - const: pclk
+      - const: earc
+      - const: ref
+      - const: aud
+    additionalItems: true
+
+  interrupts:
+    minItems: 4
+    maxItems: 5
+    items:
+      - description: AVP Unit interrupt
+      - description: CEC interrupt
+      - description: eARC RX interrupt
+      - description: Main Unit interrupt
+    additionalItems: true
+
+  interrupt-names:
+    minItems: 4
+    maxItems: 5
+    items:
+      - const: avp
+      - const: cec
+      - const: earc
+      - const: main
+    additionalItems: true
+
+additionalProperties: true

-- 
2.45.2

