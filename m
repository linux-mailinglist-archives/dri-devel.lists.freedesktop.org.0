Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F181382EFE0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5403F10E529;
	Tue, 16 Jan 2024 13:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F16010E529
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:42:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40GDfn7v071425;
 Tue, 16 Jan 2024 07:41:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705412509;
 bh=aZhgKfvmpDmT/vHDRDphJaSYdogh+5E+fwDnTAIZayE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ce6j5P/jyUuCFkwCdU7HutsJCyiCGK8AUBMRQaEtQ5Blj0HiFLNdWKEwtdblKOBSF
 IudktK+XbGQrTkw1NpBHyjWHGBjxK52Kb3BoYaImyxCFn5E0iAY8Kg+/NnOPo055XB
 D8Kur2Pwkx44nVk3T+yQTmPI+HaRU5RCnN1JUPA8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40GDfnIA027046
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jan 2024 07:41:49 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jan 2024 07:41:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jan 2024 07:41:48 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40GDfmRo063370;
 Tue, 16 Jan 2024 07:41:48 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
Subject: [RFC PATCH 3/3] arm64: dts: ti: k3-am62x: Add overlay to use DSS in
 display sharing mode
Date: Tue, 16 Jan 2024 19:11:42 +0530
Message-ID: <20240116134142.2092483-4-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116134142.2092483-1-devarsht@ti.com>
References: <20240116134142.2092483-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, j-luthra@ti.com, devarsht@ti.com, a-bhatia1@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This overlay needs to be used with display sharing supported device
manager firmware only.

Remote core running this firmware has write access to "common" register
space, VIDL pipeline, OVR1 overlay and VP1 videoport.

The processing core running Linux is provided write access to VID
pipeline and "common1" register space.

The VP1 video port is shared between Linux and remote core with remote
core configuring the overlay manager to set Zorder 1 for VID pipeline
and Zorder 2 for VIDL pipeline.

Add reserved memory region for framebuffer region used by remote core in
dss shared mode overlay file so that Linux does not re-use the same
while allocating memory.

Also add a label for reserved memory region in base device-tree file so
that it can be referred back in overlay file.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  1 +
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
 .../dts/ti/k3-am62x-sk-dss-shared-mode.dtso   | 33 +++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 52c1dc910308..ff832741b367 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -35,6 +35,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-dss-shared-mode.dtbo
 
 # Boards with AM64x SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 33768c02d8eb..8b55ca10102f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -34,7 +34,7 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
new file mode 100644
index 000000000000..02153748a5c2
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * DT overlay to enable display sharing mode for AM62P DSS0
+ * This is compatible with custom AM62 Device Manager firmware
+ *
+ * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&dss0 {
+	ti,dss-shared-mode;
+	ti,dss-shared-mode-vp = "vp1";
+	ti,dss-shared-mode-vp-owned = <0>;
+	ti,dss-shared-mode-common = "common1";
+	ti,dss-shared-mode-planes = "vid";
+	ti,dss-shared-mode-plane-zorder = <0>;
+	interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&reserved_memory {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	rtos_framebuffer_memory_region: rtos-framebuffer-memory@94800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x94800000 0x00 0x08000000>;
+		no-map;
+	};
+};
-- 
2.34.1

