Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0440BAB79B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD9110E4D3;
	Tue, 30 Sep 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="kEIXz/O3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E9F10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:14 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250930035527epoutp046a60f9b19ce674149ac70d3a0fada9b3~p8zJltT7G1826818268epoutp04A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250930035527epoutp046a60f9b19ce674149ac70d3a0fada9b3~p8zJltT7G1826818268epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204527;
 bh=BSBr8yFx9WBcmfMiEeqIr3+j6OCPbBkalNH3vdDG14M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kEIXz/O3A8tkbLbzJPRO6wiYUQHzdo77H4KcE75DCx35tPFw6mo1riaoGewGVUc7w
 Yrjuvfyo4nfHpS2jq3NIecUHDQYjx4jNCZoReD9IleBJkNpcMMQXi/BsvEbxmN7XEl
 1hKDEdiDncHVHiUgYlzODMIR8X7799XWo2DuT0Xg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035526epcas5p41bc3d59b8653b402b3d5f9d419e645ec~p8zJG7qMb2319723197epcas5p40;
 Tue, 30 Sep 2025 03:55:26 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPNF54QMz2SSKb; Tue, 30 Sep
 2025 03:55:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250930035525epcas5p3a1238a3a7bc6e52113838397187e36ba~p8zHi0lrJ2823728237epcas5p3Y;
 Tue, 30 Sep 2025 03:55:25 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035521epsmtip124585f13192326b1a3573b5d5d6e8b01~p8zEagPfI2885328853epsmtip1I;
 Tue, 30 Sep 2025 03:55:21 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 02/29] arm64: dts: mfc: Add MFC device tree for Auto V920 SoC
Date: Tue, 30 Sep 2025 09:33:21 +0530
Message-Id: <20250930040348.3702923-3-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035525epcas5p3a1238a3a7bc6e52113838397187e36ba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035525epcas5p3a1238a3a7bc6e52113838397187e36ba
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035525epcas5p3a1238a3a7bc6e52113838397187e36ba@epcas5p3.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

Introduce the device‑tree entries for the Samsung Exynos AUTO V920
multimedia‑function controller (MFC). The patch defines:
- Reserved memory regions for firmware and CMA buffers.
- Core0 and Core1 memory mappings.
- The main MFC node with basic properties (compatible, reg, interrupts,
  clocks, DMA window, firmware name, debug mode, etc.).
- Per‑core sub‑nodes (MFC‑0 and MFC‑1) with their own sysmmu,
  firmware region, and configuration parameters.
- Resource table listing supported codecs and their capabilities.

Adds full support for the V920 MFC hardware to the mainline kernel
device‑tree, enabling proper memory allocation, interrupt handling and
codec operation on this platform.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../dts/exynos/exynosautov920-evt2-mfc.dtsi   | 187 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   1 +
 2 files changed, 188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi
new file mode 100644
index 000000000000..49c61958467e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SAMSUNG EXYNOS AUTO V920 SoC MFC device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ */
+
+#define MFC_CORE0_MEM_ADDR      0xE9C00000
+#define MFC_CORE1_MEM_ADDR      0xEFB00000
+#define MFC_CMA_MEM_ADDR        0xB0000000
+#define MFC_CMA_MEM_SIZE        0x040000000  /* 64MB */
+#define MFC_FW_MEM_ADDR         0x9F000000
+#define MFC_FW_MEM_SIZE         0x00800000  /* 8MB */
+#define MFC_MEM_SIZE            0x00100000  /* 1MB */
+
+/ {
+reserved_memory: reserved-memory {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+
+	mfc_fw_rmem: mfc_fw_rmem@9f000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x0 MFC_FW_MEM_ADDR 0x0 MFC_FW_MEM_SIZE>;
+		alignment = <0x0 0x00010000>;
+		reusable;
+	};
+
+	mfc_buf_rmem: mfc_buf_rmem {
+		compatible = "shared-dma-pool";
+		reg = <0x0 MFC_CMA_MEM_ADDR 0x0 MFC_CMA_MEM_SIZE>;
+		alignment = <0x0 0x00010000>;
+		reusable;
+		linux,cma-default;
+	};
+
+	mfc_core0_mem: mfc_core0_mem@e9c00000 {
+		compatible = "samsung,mfc_core0_mem";
+		reg = <0x0 MFC_CORE0_MEM_ADDR 0x0 MFC_MEM_SIZE>;
+	};
+
+	mfc_core1_mem: mfc_core1_mem@efb00000 {
+		compatible = "samsung,mfc_core1_mem";
+		reg = <0x0 MFC_CORE1_MEM_ADDR 0x0 MFC_MEM_SIZE>;
+	};
+};
+
+	mfc: mfc@19cd0000 {
+		/* Basic setting */
+		compatible = "samsung,exynos-mfc";
+
+		reg = <0x0 0x19CD0000 0x0 0x10000>;
+		interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "aclk_mfc";
+		clocks = <&cmu_top 1900>;
+
+		/* for vb2 device */
+		samsung,tzmp;
+
+		/* for F/W buffer to support 36bit-DMA */
+		memory-region = <&mfc_fw_rmem &mfc_buf_rmem>;
+
+		/* MFC DMA bit (32 or 36) */
+		dma_bit_mask = <32>;
+
+		/* MFC version */
+		ip_ver = <0x1600010C>;
+
+		/* MFC firmware name */
+		fw_name = "mfc_fw_v16.0.bin";
+
+		/* Debug mode */
+		debug_mode = <1>;
+
+		/* Features <on/off version> */
+		mem_clear = <1 0x0>;
+		/* Support from v11.0 (except 11.2) */
+		wait_fw_status = <1 0x190122>;
+
+		/* Scheduler 0: round-robin, 1: PBS */
+		scheduler = <1>;
+		/* The number of priority in PBS */
+		pbs_num_prio = <1>;
+
+		/* MFC IOVA threshold (MB) */
+		iova_threshold = <1700>;
+
+		/* Sub nodes for MFC core */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Resource of standard
+		 * <codec num>		MFC_REG_CODEC_XXX
+		 * <op core type>	0: MFC only, 1: MFD only, 2: ALL
+		 * <max Kbps>		245760: 240Mbps, 122880: 120Mbps, 81920: 80Mbps
+		 */
+		mfc_resource {
+			/* codec name	{ codec mode, op core type, max Kbps } */
+			H264_dec	{ info = <0  2 245760>; };
+			VP8_dec		{ info = <14 0 81920>; };
+			HEVC_dec	{ info = <17 2 245760>; };
+			VP9_dec		{ info = <18 0 81920>; };
+			AV1_dec		{ info = <19 1 122880>; };
+			H264_enc	{ info = <20 0 245760>; };
+			VP8_enc		{ info = <25 0 81920>; };
+			HEVC_enc	{ info = <26 0 245760>; };
+			VP9_enc		{ info = <27 0 81920>; };
+		};
+
+		/* MFC core device */
+		mfc_core0: MFC-0@19cd0000 {
+			/* Basic setting */
+			compatible = "samsung,exynos-mfc-core";
+			id = <0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			reg = <0x0 0x19CD0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "aclk_mfc";
+			clocks = <&cmu_top 1900>;
+			samsung,tzmp;
+
+			/* MFC version */
+			ip_ver = <0x1600010C>;
+
+			/* for F/W buffer */
+			fw-region = <&mfc_core0_mem>;
+
+			/* Sysmmu check */
+			share_sysmmu = <0>;
+			axid_mask = <0xFFFF>;
+			tsmux_axid = <0x1>;
+
+			/* mem-log buffer size */
+			memlog_size = <0x80000>;
+			memlog_sfr_size = <0x1000>;
+
+			/* Device virtual address */
+			#dma-address-cells = <1>;
+			#dma-size-cells = <1>;
+			dma-window = <0x0 0xF0000000>;
+
+			/* Sub nodes for sysmmu, hwfc and mmcache */
+			iommu@19c70000 {
+				reg = <0x0 0x19C70000 0x0 0x9000>;
+			};
+		};
+
+		mfc_core1: MFC-1@19ed0000 {
+			/* Basic setting */
+			compatible = "samsung,exynos-mfc-core";
+			id = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			reg = <0x0 0x19ED0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "aclk_mfc";
+			clocks = <&cmu_top 2000>;
+			samsung,tzmp;
+
+			/* MFC version */
+			ip_ver = <0x1600010D>;
+
+			/* for F/W buffer */
+			fw-region = <&mfc_core1_mem>;
+
+			/* Sysmmu check */
+			share_sysmmu = <0>;
+			axid_mask = <0xFFFF>;
+
+			/* Device virtual address */
+			#dma-address-cells = <1>;
+			#dma-size-cells = <1>;
+			dma-window = <0x0 0xF0000000>;
+
+			/* Sub nodes for sysmmu, hwfc and mmcache */
+			iommu@19e70000 {
+				reg = <0x0 0x19E70000 0x0 0x9000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..f35441d29cdd 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1507,3 +1507,4 @@ timer {
 };
 
 #include "exynosautov920-pinctrl.dtsi"
+#include "exynosautov920-evt2-mfc.dtsi"
-- 
2.34.1

