Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F55955FEB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 00:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538A910E178;
	Sun, 18 Aug 2024 22:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="He/xZesh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BFA10E178
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 22:30:24 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724020219; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lyFfFPx4YDENcZT6LyTuC5t3BYV7vf5LXCFyzKnyZGnEAf4PdEjsKh1yVJF4KPvPMCAOylnW77Tb4ULetcX/KTAJtR9nQEv91U1/6FroQN0mTx4QflhTq8oXltWfA6GKXSFMVUkGAGbS8DbXke/8vFjF15ajCQw4uxSsQtXuEwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724020219;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GUxI7Nryt2fJIoARGtRz+5S3ET1E1hMLQbOdW+WClGA=; 
 b=j36kkdoAtpoEgKCyrGHRrI03iJq6D2eA8PT+REWrMffW0jd3H+kgJ5qSFd3jMHmC5e3hU3PN37YaRvA8VythPOJrU1/ilVtq6TKjYqYJXHk8blL9ZVnr17kGjLc41xRVBB/SjAttPRk2ik5Cey1n/h9AP5D7IpVucD75iUx92/s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724020219; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=GUxI7Nryt2fJIoARGtRz+5S3ET1E1hMLQbOdW+WClGA=;
 b=He/xZeshsZQS+JdN6+c/r4Cnz8sVRqqoptGPQEorSFk4CrnAnC+gV7ay8qNQgBgG
 s0TOO8JQHeg1Qez14IAMDE21qG+qLMsdXEbpSPA14ZjWbz7GZGOrcrL6sMhIi58Vz10
 zXFjJ+Ye3keoNk0OWo27I/DCN6pVkHPEVWWxxOY4=
Received: by mx.zohomail.com with SMTPS id 1724020217463976.332429107037;
 Sun, 18 Aug 2024 15:30:17 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 19 Aug 2024 01:29:28 +0300
Subject: [PATCH v4 1/4] dt-bindings: display: bridge: Add schema for
 Synopsys DW HDMI QP TX IP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240819-b4-rk3588-bridge-upstream-v4-1-6417c72a2749@collabora.com>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
In-Reply-To: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
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
 .../display/bridge/synopsys,dw-hdmi-qp.yaml        | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
new file mode 100644
index 000000000000..771f7fba6c50
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
@@ -0,0 +1,88 @@
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
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for RGB/YUV input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for HDMI/eDP output.
+
+    required:
+      - port@0
+      - port@1
+
+additionalProperties: true

-- 
2.46.0

