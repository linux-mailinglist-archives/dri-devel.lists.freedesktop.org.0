Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B417DA6C3DC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 21:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B095B10E09A;
	Fri, 21 Mar 2025 20:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="DfXAd422";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312F010E056
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 20:07:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EEFDE101E90A8; Fri, 21 Mar 2025 21:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1742587626; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+sSLDnAdQaaRh1ug3/9steXZw1JYzt1ToQ27dvMkXSk=;
 b=DfXAd422TEJJklzGEddbwWU/OeKgZww3A3cYngRWzDYNyrTTbHl7JC5IXsa9Qkq9vmb8Q4
 kP0GxhPzzlaj+gYSu4507wgC/zWzgL5WeKWdSQTNcmQG5yJkhTBuZw2GneDpLImkWcNHz3
 wylB1+zTksd57JqSTE/wgS5MnmSH3cCPwAn/Lg11muqeiIjyvv1Dm7uZMe6QsmFi5t+92G
 D7AvpAlbnKxL+EzT8wDYQdlgwJANhnY5TVaNLeDs9RrsT0GWnWFtjqle9ajLuieDrlJmz+
 x3bsE+yL1Fwl49kFeUBHt+OZ5G2aM0aVZwMrcZRswxvwmwjja51uKhnIt6ubvw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: [PATCH v2 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
Date: Fri, 21 Mar 2025 21:05:51 +0100
Message-ID: <20250321200625.132494-2-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Document support for this reset register.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: - Fix dt_binding_check errors in example, temporarily use fixed
      numbers to refer to IMX95_CLK_GPUAPB clock and IMX95_PD_GPU
      power-domain
    - Drop trailing pipe after description:
    - Drop leading dash before const in compatible:
    - Switch from fsl, to nxp, vendor prefix
---
 .../reset/nxp,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml b/Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml
new file mode 100644
index 0000000000000..ca841db20d35b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/nxp,imx95-gpu-blk-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 GPU Block Controller
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description:
+  This reset controller is a block of ad-hoc debug registers, one of
+  which is a single-bit GPU reset.
+
+properties:
+  compatible:
+    const: nxp,imx95-gpu-blk-ctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@4d810000 {
+        compatible = "nxp,imx95-gpu-blk-ctrl";
+        reg = <0x4d810000 0xc>;
+        clocks = <&clk 83>;
+        power-domains = <&scmi_devpd 14>;
+        #reset-cells = <1>;
+    };
-- 
2.47.2

