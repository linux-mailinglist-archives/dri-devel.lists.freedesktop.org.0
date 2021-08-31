Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C53FC1AD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 05:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF93A88E02;
	Tue, 31 Aug 2021 03:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A449288E02
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 03:49:36 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GzCl75jDVzbkSH;
 Tue, 31 Aug 2021 11:45:39 +0800 (CST)
Received: from dggema764-chm.china.huawei.com (10.1.198.206) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 31 Aug 2021 11:49:34 +0800
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 dggema764-chm.china.huawei.com (10.1.198.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Tue, 31 Aug 2021 11:49:33 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <devicetree@vger.kernel.org>, <robh+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <wanghaibin.wang@huawei.com>, "Zenghui
 Yu" <yuzenghui@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Jun Nie
 <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] dt-bindings: display: remove zte,vou.txt binding doc
Date: Tue, 31 Aug 2021 11:49:24 +0800
Message-ID: <20210831034924.86-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema764-chm.china.huawei.com (10.1.198.206)
X-CFilter-Loop: Reflected
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

The zte zx platform was removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform") and the zxdrm driver is going to be removed in v5.15 via
drm tree. Let's remove the now obsolete binding doc.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jun Nie <jun.nie@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 .../devicetree/bindings/display/zte,vou.txt   | 120 ------------------
 1 file changed, 120 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/zte,vou.txt

diff --git a/Documentation/devicetree/bindings/display/zte,vou.txt b/Documentation/devicetree/bindings/display/zte,vou.txt
deleted file mode 100644
index 38476475fd60..000000000000
--- a/Documentation/devicetree/bindings/display/zte,vou.txt
+++ /dev/null
@@ -1,120 +0,0 @@
-ZTE VOU Display Controller
-
-This is a display controller found on ZTE ZX296718 SoC.  It includes multiple
-Graphic Layer (GL) and Video Layer (VL), two Mixers/Channels, and a few blocks
-handling scaling, color space conversion etc.  VOU also integrates the support
-for typical output devices, like HDMI, TV Encoder, VGA, and RGB LCD.
-
-* Master VOU node
-
-It must be the parent node of all the sub-device nodes.
-
-Required properties:
- - compatible: should be "zte,zx296718-vou"
- - #address-cells: should be <1>
- - #size-cells: should be <1>
- - ranges: list of address translations between VOU and sub-devices
-
-* VOU DPC device
-
-Required properties:
- - compatible: should be "zte,zx296718-dpc"
- - reg: Physical base address and length of DPC register regions, one for each
-   entry in 'reg-names'
- - reg-names: The names of register regions. The following regions are required:
-	"osd"
-	"timing_ctrl"
-	"dtrc"
-	"vou_ctrl"
-	"otfppu"
- - interrupts: VOU DPC interrupt number to CPU
- - clocks: A list of phandle + clock-specifier pairs, one for each entry
-   in 'clock-names'
- - clock-names: A list of clock names.  The following clocks are required:
-	"aclk"
-	"ppu_wclk"
-	"main_wclk"
-	"aux_wclk"
-
-* HDMI output device
-
-Required properties:
- - compatible: should be "zte,zx296718-hdmi"
- - reg: Physical base address and length of the HDMI device IO region
- - interrupts : HDMI interrupt number to CPU
- - clocks: A list of phandle + clock-specifier pairs, one for each entry
-   in 'clock-names'
- - clock-names: A list of clock names.  The following clocks are required:
-	"osc_cec"
-	"osc_clk"
-	"xclk"
-
-* TV Encoder output device
-
-Required properties:
- - compatible: should be "zte,zx296718-tvenc"
- - reg: Physical base address and length of the TVENC device IO region
- - zte,tvenc-power-control: the phandle to SYSCTRL block followed by two
-   integer cells.  The first cell is the offset of SYSCTRL register used
-   to control TV Encoder DAC power, and the second cell is the bit mask.
-
-* VGA output device
-
-Required properties:
- - compatible: should be "zte,zx296718-vga"
- - reg: Physical base address and length of the VGA device IO region
- - interrupts : VGA interrupt number to CPU
- - clocks: Phandle with clock-specifier pointing to VGA I2C clock.
- - clock-names: Must be "i2c_wclk".
- - zte,vga-power-control: the phandle to SYSCTRL block followed by two
-   integer cells.  The first cell is the offset of SYSCTRL register used
-   to control VGA DAC power, and the second cell is the bit mask.
-
-Example:
-
-vou: vou@1440000 {
-	compatible = "zte,zx296718-vou";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0 0x1440000 0x10000>;
-
-	dpc: dpc@0 {
-		compatible = "zte,zx296718-dpc";
-		reg = <0x0000 0x1000>, <0x1000 0x1000>,
-		      <0x5000 0x1000>, <0x6000 0x1000>,
-		      <0xa000 0x1000>;
-		reg-names = "osd", "timing_ctrl",
-			    "dtrc", "vou_ctrl",
-			    "otfppu";
-		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&topcrm VOU_ACLK>, <&topcrm VOU_PPU_WCLK>,
-			 <&topcrm VOU_MAIN_WCLK>, <&topcrm VOU_AUX_WCLK>;
-		clock-names = "aclk", "ppu_wclk",
-			      "main_wclk", "aux_wclk";
-	};
-
-	vga: vga@8000 {
-		compatible = "zte,zx296718-vga";
-		reg = <0x8000 0x1000>;
-		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&topcrm VGA_I2C_WCLK>;
-		clock-names = "i2c_wclk";
-		zte,vga-power-control = <&sysctrl 0x170 0xe0>;
-	};
-
-	hdmi: hdmi@c000 {
-		compatible = "zte,zx296718-hdmi";
-		reg = <0xc000 0x4000>;
-		interrupts = <GIC_SPI 82 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&topcrm HDMI_OSC_CEC>,
-			 <&topcrm HDMI_OSC_CLK>,
-			 <&topcrm HDMI_XCLK>;
-		clock-names = "osc_cec", "osc_clk", "xclk";
-	};
-
-	tvenc: tvenc@2000 {
-		compatible = "zte,zx296718-tvenc";
-		reg = <0x2000 0x1000>;
-		zte,tvenc-power-control = <&sysctrl 0x170 0x10>;
-	};
-};
-- 
2.19.1

