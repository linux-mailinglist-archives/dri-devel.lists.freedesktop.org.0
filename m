Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE912580873
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DD210F560;
	Mon, 25 Jul 2022 23:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB22A10F54F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793169;
 bh=RDu6MAHZT0LCVkJ/VwOq62N4VrK+pFSGRG881VZDoU4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SQH128wGEYMW4TWKle/meb+pnKpMrNbt0+Gx6epu/aEVgKpCnWP+6Z/F9xJhz8zmC
 dK6uYU3NvfmNZKGrW+3nTQdPji4tZ71qw/2lQB7oXPnDTkSgXXkibSMA83R69y96Qr
 KDs4xrVX0PqWLz59whd699NqDeaPEwJmULCt4xo8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MhlKs-1ncgOd1SoC-00dnqC; Tue, 26 Jul 2022 01:52:49 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/32] drm/via: Add via_drv.h
Date: Mon, 25 Jul 2022 16:51:00 -0700
Message-Id: <20220725235127.20433-6-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s03texgYlCTSOrmDpyA56+38TQQ1HE7+SwuabUt3SkjJuzmlDX7
 0Hh8Z8CN3q7ZEMrX3X02dTjfrKelRyAP+6az4L81GhYzv5f0JRGzbr2NgSNUzuEEuu0LmYS
 3WKFKg6NXlJYwx7/Byu/TKfy4nTRfEK//dpxr2LCi0+QrCHWaqoRsOQkRn3IKCPJm432kyu
 RqoUKCX0k7GvtyBF7S/tg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kT+Yeuu4fb0=:RlmjrJWZqTZTkanE5tzfpQ
 M2vFVvVPw/2lAL0CdeHLf+lQsZ+iqNXzRruofLLC6WrWBaboTWmyAepYysrYCXlQpit3QK7iX
 xCkeqyggR5Naj0XNly25GkF7BDBay94PGu9lv8yA/QcRdQkf1eln85FbUqGYi3M2XtNfGekyl
 gZbnknGNbVtgM+UAFhAm1QXEmFUS9Oa1/PI+x5PTkCf9+7IQ+7SduoxcDfbFgo+U86j4DB0Ab
 SRV6qtVLXPvOJO2ecUnrFXxW6fRhem7DX9dZJya1nvMH7WI+JrqWeDC+qrSKKkT+Pzb1uh0mw
 vhLmpiGle4c3efa0m110gwPYj9DXiRnxyszfOroqBpqhuE8Or/pw8XRLckE4qZlLCYbyfZ4UP
 wkqg0bfCSBJBD2ZpwXpA0DyCs15TpbZ/k5YT9NxE5/fwcvegEueAJpHMqGHOT+SGEB9Qu68o8
 RevJPPaw6vsUuvriz+F7+AtSbJRn9gaW5PHyrrB0UIIIczqFH2DeUxoUI0xaHVltOBPmdAhtC
 g/jtLTl78XQbkMlh09sG83w4qZLAIDlf5J9s2xnZbtA73OlKcHIOdqqU9UmlREjWUqB01A0fm
 sxUQ9tupM0yhfX2qP/IvRa4G+T43X3OVZmwLuJVZ5Srkr5YhBnR9aXGlvWRpPkOiMbodGtM5L
 gwI6md1Li0AQm8Jo8oXdnUDphKmIKz6Dbg/JDL7f+R5mUcyrYC7EO0bPAIFHK+4HdblhmuS8x
 Ef5YOLoS2pm41Uptt4ZTmcQ+czmV3h5unyb4AAzvDR3snFCVYereM41PowTCRGsWdfLVUDc3O
 b08V0GEBMjaoaop3cZcLVPe1USDF7STNMxAPgBI5qC7NBPvSXBldCsWAlel8V7S8aCRbGBf79
 pIdky4T63dEcVGs2421pF3LiztRN8VaNhmUOKJ2auqIwTL5xHHnKLKqSN3mKAGKI22IQDzaZR
 4/NddhYUHospmRYzaTKeLe/f1QTBHt4/GOkAwh0EWbs4k6MytM4k3v7nlaBMMrwgqrb68I9Tx
 Emi4eGWn7UNEDGgTh3roqkpqiqqH7g4xdE10nPGv2PTHV6egAg4SaQKXVaMvLQlrsLzEALeaw
 gCan21Xs2XNPgVDJqKKwHvmeEkDbHeahiS8AWHWTMUVdlm9sSJvG6sYFg==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Main header file for the module.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_drv.h | 433 ++++++++++++++++++++++++++++++++++
 1 file changed, 433 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_drv.h

diff --git a/drivers/gpu/drm/via/via_drv.h b/drivers/gpu/drm/via/via_drv.h
new file mode 100644
index 000000000000..59bc358e7a4b
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_drv.h
@@ -0,0 +1,433 @@
+/*
+ * Copyright =C2=A9 2019 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#ifndef _VIA_DRV_H
+#define _VIA_DRV_H
+
+
+#include <linux/pci_ids.h>
+
+#include <video/vga.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_plane.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_placement.h>
+
+#include "via_crtc_hw.h"
+#include "via_regs.h"
+
+
+#define DRIVER_MAJOR		3
+#define DRIVER_MINOR		5
+#define DRIVER_PATCHLEVEL	7
+#define DRIVER_NAME		"via"
+#define DRIVER_DESC		"OpenChrome DRM for VIA Technologies Chrome"
+#define DRIVER_DATE		"20220725"
+#define DRIVER_AUTHOR		"OpenChrome Project"
+
+
+#define VIA_TTM_PL_NUM		2
+
+#define VIA_MAX_CRTC		2
+
+#define VIA_CURSOR_SIZE		64
+
+#define VIA_MM_ALIGN_SIZE	16
+
+
+#define CLE266_REVISION_AX	0x0A
+#define CLE266_REVISION_CX	0x0C
+
+#define CX700_REVISION_700	0x0
+#define CX700_REVISION_700M	0x1
+#define CX700_REVISION_700M2	0x2
+
+#define VIA_MEM_NONE		0x00
+#define VIA_MEM_SDR66		0x01
+#define VIA_MEM_SDR100		0x02
+#define VIA_MEM_SDR133		0x03
+#define VIA_MEM_DDR_200		0x04
+#define VIA_MEM_DDR_266		0x05
+#define VIA_MEM_DDR_333		0x06
+#define VIA_MEM_DDR_400		0x07
+#define VIA_MEM_DDR2_400	0x08
+#define VIA_MEM_DDR2_533	0x09
+#define VIA_MEM_DDR2_667	0x0A
+#define VIA_MEM_DDR2_800	0x0B
+#define VIA_MEM_DDR2_1066	0x0C
+#define VIA_MEM_DDR3_533	0x0D
+#define VIA_MEM_DDR3_667	0x0E
+#define VIA_MEM_DDR3_800	0x0F
+#define VIA_MEM_DDR3_1066	0x10
+#define VIA_MEM_DDR3_1333	0x11
+#define VIA_MEM_DDR3_1600	0x12
+
+/* IGA Scaling disable */
+#define VIA_NO_SCALING	0
+
+/* IGA Scaling down */
+#define VIA_HOR_SHRINK	BIT(0)
+#define VIA_VER_SHRINK	BIT(1)
+#define VIA_SHRINK	(BIT(0) | BIT(1))
+
+/* IGA Scaling up */
+#define VIA_HOR_EXPAND	BIT(2)
+#define VIA_VER_EXPAND	BIT(3)
+#define VIA_EXPAND	(BIT(2) | BIT(3))
+
+/* Define IGA Scaling up/down status :  Horizontal or Vertical  */
+/* Is IGA Hor scaling up/down status */
+#define	HOR_SCALE	BIT(0)
+/* Is IGA Ver scaling up/down status */
+#define	VER_SCALE	BIT(1)
+/* Is IGA Hor and Ver scaling up/down status */
+#define	HOR_VER_SCALE	(BIT(0) | BIT(1))
+
+#define	VIA_I2C_NONE	0x0
+#define	VIA_I2C_BUS1	BIT(0)
+#define	VIA_I2C_BUS2	BIT(1)
+#define	VIA_I2C_BUS3	BIT(2)
+#define	VIA_I2C_BUS4	BIT(3)
+#define	VIA_I2C_BUS5	BIT(4)
+
+#define VIA_DI_PORT_NONE	0x0
+#define VIA_DI_PORT_DIP0	BIT(0)
+#define VIA_DI_PORT_DIP1	BIT(1)
+#define VIA_DI_PORT_DVP0	BIT(2)
+#define VIA_DI_PORT_DVP1	BIT(3)
+#define VIA_DI_PORT_DFPL	BIT(4)
+#define VIA_DI_PORT_FPDPLOW	BIT(4)
+#define VIA_DI_PORT_DFPH	BIT(5)
+#define VIA_DI_PORT_FPDPHIGH	BIT(5)
+#define VIA_DI_PORT_DFP		BIT(6)
+#define VIA_DI_PORT_LVDS1	BIT(7)
+#define VIA_DI_PORT_TMDS	BIT(7)
+#define VIA_DI_PORT_LVDS2	BIT(8)
+
+/* External TMDS (DVI) Transmitter Type */
+#define	VIA_TMDS_NONE	0x0
+#define	VIA_TMDS_VT1632	BIT(0)
+#define	VIA_TMDS_SII164	BIT(1)
+
+
+struct via_lvds_info {
+	u32 x;
+	u32 y;
+};
+
+struct via_crtc {
+	struct drm_crtc base;
+	struct crtc_timings pixel_timings;
+	struct crtc_timings timings;
+	struct vga_registers display_queue;
+	struct vga_registers high_threshold;
+	struct vga_registers threshold;
+	struct vga_registers fifo_depth;
+	struct vga_registers offset;
+	struct vga_registers fetch;
+	int scaling_mode;
+	uint32_t index;
+};
+
+struct via_connector {
+	struct drm_connector base;
+	u32 i2c_bus;
+	struct list_head props;
+	uint32_t flags;
+};
+
+struct via_encoder {
+	struct drm_encoder base;
+	u32 i2c_bus;
+	u32 di_port;
+	struct via_connector cons[];
+};
+
+struct via_bo {
+	struct ttm_buffer_object	ttm_bo;
+	struct ttm_bo_kmap_obj		kmap;
+	struct ttm_placement		placement;
+	struct ttm_place		placements[VIA_TTM_PL_NUM];
+};
+
+struct via_drm_priv {
+	struct drm_device dev;
+
+	struct ttm_device		bdev;
+
+	/* Set this flag for ttm_bo_device_init. */
+	bool need_dma32;
+
+	int revision;
+
+	u8 vram_type;
+	resource_size_t vram_start;
+	resource_size_t vram_size;
+	int vram_mtrr;
+
+	resource_size_t mmio_base;
+	resource_size_t mmio_size;
+	void __iomem		*mmio;
+
+	bool spread_spectrum;
+
+	/*
+	 * Frame Buffer Size Control register (SR14) needs to be saved and
+	 * restored upon standby resume or can lead to a display corruption
+	 * issue. These registers are only available on VX800, VX855, and
+	 * VX900 chipsets. This bug was observed on VIA EPIA-M830 mainboard.
+	 */
+	uint8_t saved_sr14;
+
+	/*
+	 * GTI registers (SR66 through SR6F) need to be saved and restored
+	 * upon standby resume or can lead to a display corruption issue.
+	 * These registers are only available on VX800, VX855, and VX900
+	 * chipsets. This bug was observed on VIA EPIA-M830 mainboard.
+	 */
+	uint8_t saved_sr66;
+	uint8_t saved_sr67;
+	uint8_t saved_sr68;
+	uint8_t saved_sr69;
+	uint8_t saved_sr6a;
+	uint8_t saved_sr6b;
+	uint8_t saved_sr6c;
+	uint8_t saved_sr6d;
+	uint8_t saved_sr6e;
+	uint8_t saved_sr6f;
+
+	/* 3X5.3B through 3X5.3F are scratch pad registers.
+	 * They are important for FP detection. */
+	uint8_t saved_cr3b;
+	uint8_t saved_cr3c;
+	uint8_t saved_cr3d;
+	uint8_t saved_cr3e;
+	uint8_t saved_cr3f;
+
+	/*
+	 * Due to the way VIA NanoBook reference design implemented
+	 * the pin strapping settings, DRM needs to ignore them for
+	 * FP and DVI to be properly detected.
+	 */
+	bool is_via_nanobook;
+
+	/*
+	 * Quanta IL1 netbook has its FP connected to DVP1
+	 * rather than LVDS, hence, a special flag register
+	 * is needed for properly controlling its FP.
+	 */
+	bool is_quanta_il1;
+
+	/*
+	 * Samsung NC20 netbook has its FP connected to LVDS2
+	 * rather than the more logical LVDS1, hence, a special
+	 * flag register is needed for properly controlling its
+	 * FP.
+	 */
+	bool is_samsung_nc20;
+
+	bool dac_presence;
+	u32 dac_i2c_bus;
+
+	bool int_tmds_presence;
+	u32 int_tmds_di_port;
+	u32 int_tmds_i2c_bus;
+
+	bool ext_tmds_presence;
+	u32 ext_tmds_di_port;
+	u32 ext_tmds_i2c_bus;
+	u32 ext_tmds_transmitter;
+
+	bool int_fp1_presence;
+	u32 int_fp1_di_port;
+	u32 int_fp1_i2c_bus;
+
+	bool int_fp2_presence;
+	u32 int_fp2_di_port;
+	u32 int_fp2_i2c_bus;
+
+	/* Keeping track of the number of DVI connectors. */
+	u32 number_dvi;
+
+	/* Keeping track of the number of FP (Flat Panel) connectors. */
+	u32 number_fp;
+
+	u32 mapped_i2c_bus;
+};
+
+
+/*
+ * Shortcut for using container_of macro.
+ */
+#define to_via_drm_priv(x)	container_of(x, struct via_drm_priv, dev)
+#define to_ttm_bo(x)		container_of(x, struct via_bo, ttm_bo)
+
+
+/* VIA MMIO register access */
+#define VIA_BASE ((dev_priv->mmio))
+
+#define VIA_READ(reg)		ioread32(VIA_BASE + reg)
+#define VIA_WRITE(reg, val)	iowrite32(val, VIA_BASE + reg)
+#define VIA_READ8(reg)		ioread8(VIA_BASE + reg)
+#define VIA_WRITE8(reg, val)	iowrite8(val, VIA_BASE + reg)
+
+#define VIA_WRITE_MASK(reg, data, mask) \
+	VIA_WRITE(reg, (data & mask) | (VIA_READ(reg) & ~mask)) \
+
+#define VGABASE (VIA_BASE+VIA_MMIO_VGABASE)
+
+
+static inline void
+via_lock_crtc(void __iomem *regs)
+{
+	svga_wcrt_mask(regs, 0x11, BIT(7), BIT(7));
+}
+
+static inline void
+via_unlock_crtc(void __iomem *regs, int pci_id)
+{
+	u8 mask =3D BIT(0);
+
+	svga_wcrt_mask(regs, 0x11, 0, BIT(7));
+	if ((pci_id =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HCM) ||
+	    (pci_id =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HD))
+		mask =3D BIT(4);
+	svga_wcrt_mask(regs, 0x47, 0, mask);
+}
+
+
+extern int via_driver_num_ioctls;
+
+extern struct ttm_device_funcs via_bo_driver;
+
+int via_vram_detect(struct via_drm_priv *dev_priv);
+int via_vram_init(struct via_drm_priv *dev_priv);
+void via_vram_fini(struct via_drm_priv *dev_priv);
+int via_mmio_init(struct via_drm_priv *dev_priv);
+void via_mmio_fini(struct via_drm_priv *dev_priv);
+void via_graphics_unlock(struct via_drm_priv *dev_priv);
+void chip_revision_info(struct via_drm_priv *dev_priv);
+int via_device_init(struct via_drm_priv *dev_priv);
+void via_device_fini(struct via_drm_priv *dev_priv);
+void via_mode_config_init(struct via_drm_priv *dev_priv);
+int via_drm_init(struct drm_device *dev);
+void via_drm_fini(struct drm_device *dev);
+
+int via_dev_pm_ops_suspend(struct device *dev);
+int via_dev_pm_ops_resume(struct device *dev);
+
+void via_ttm_domain_to_placement(struct via_bo *bo, uint32_t ttm_domain);
+void via_ttm_bo_destroy(struct ttm_buffer_object *tbo);
+int via_bo_pin(struct via_bo *bo, uint32_t ttm_domain);
+void via_bo_unpin(struct via_bo *bo);
+int via_bo_create(struct drm_device *dev, struct ttm_device *bdev,
+			uint64_t size, enum ttm_bo_type type,
+			uint32_t ttm_domain, bool kmap,
+			struct via_bo **bo_ptr);
+void via_bo_destroy(struct via_bo *bo, bool kmap);
+int via_mm_init(struct via_drm_priv *dev_priv);
+void via_mm_fini(struct via_drm_priv *dev_priv);
+
+void via_transmitter_io_pad_state(struct via_drm_priv *dev_priv,
+					uint32_t di_port, bool io_pad_on);
+void via_output_enable(struct via_drm_priv *dev_priv,
+			uint32_t di_port, bool output_enable);
+void via_clock_source(struct via_drm_priv *dev_priv, uint32_t di_port,
+			bool clock_source);
+void via_transmitter_clock_drive_strength(struct via_drm_priv *dev_priv,
+					u32 di_port, u8 drive_strength);
+void via_transmitter_data_drive_strength(struct via_drm_priv *dev_priv,
+					u32 di_port, u8 drive_strength);
+void via_transmitter_display_source(struct via_drm_priv *dev_priv,
+					u32 di_port, int index);
+
+extern const struct drm_plane_helper_funcs via_cursor_drm_plane_helper_fu=
ncs;
+extern const struct drm_plane_funcs via_cursor_drm_plane_funcs;
+extern const uint32_t via_cursor_formats[];
+extern const unsigned int via_cursor_formats_size;
+
+/* display */
+int via_modeset_init(struct drm_device *dev);
+void via_modeset_fini(struct drm_device *dev);
+
+/* i2c */
+struct i2c_adapter *via_find_ddc_bus(int port);
+void via_i2c_readbytes(struct i2c_adapter *adapter,
+			u8 slave_addr, char offset,
+			u8 *buffer, unsigned int size);
+void via_i2c_writebytes(struct i2c_adapter *adapter,
+			u8 slave_addr, char offset,
+			u8 *data, unsigned int size);
+void via_i2c_reg_init(struct via_drm_priv *dev_priv);
+int via_i2c_init(struct drm_device *dev);
+void via_i2c_exit(void);
+
+/* clock */
+u32 via_get_clk_value(struct drm_device *dev, u32 clk);
+void via_set_vclock(struct drm_crtc *crtc, u32 clk);
+
+/* crtc */
+void via_load_crtc_pixel_timing(struct drm_crtc *crtc,
+				struct drm_display_mode *mode);
+int via_crtc_init(struct via_drm_priv *dev_priv, uint32_t index);
+
+/* encoders */
+void via_encoder_cleanup(struct drm_encoder *encoder);
+
+/* connectors */
+void via_connector_destroy(struct drm_connector *connector);
+
+void via_dac_probe(struct drm_device *dev);
+bool via_vt1632_probe(struct i2c_adapter *i2c_bus);
+bool via_sii164_probe(struct i2c_adapter *i2c_bus);
+void via_ext_dvi_probe(struct drm_device *dev);
+void via_tmds_probe(struct drm_device *dev);
+void via_lvds_probe(struct drm_device *dev);
+
+void via_hdmi_init(struct drm_device *dev, u32 di_port);
+void via_dac_init(struct drm_device *dev);
+void via_vt1632_init(struct drm_device *dev);
+void via_sii164_init(struct drm_device *dev);
+void via_ext_dvi_init(struct drm_device *dev);
+void via_tmds_init(struct drm_device *dev);
+void via_lvds_init(struct drm_device *dev);
+
+int via_gem_create_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv);
+int via_gem_map_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file_priv);
+int via_gem_unmap_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file_priv);
+
+#endif /* _VIA_DRV_H */
=2D-
2.35.1

