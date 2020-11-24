Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FF2C2488
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 12:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B356E2D5;
	Tue, 24 Nov 2020 11:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC506E25A;
 Tue, 24 Nov 2020 11:38:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6807CADC1;
 Tue, 24 Nov 2020 11:38:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 07/15] drm/i915: Remove references to struct drm_device.pdev
Date: Tue, 24 Nov 2020 12:38:16 +0100
Message-Id: <20201124113824.19994-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124113824.19994-1-tzimmermann@suse.de>
References: <20201124113824.19994-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Convert i915 to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 ++++++-------
 drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +++--
 drivers/gpu/drm/i915/display/intel_opregion.c |  6 +++---
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  4 ++--
 drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |  8 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +++++-----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 ++--
 drivers/gpu/drm/i915/gt/intel_reset.c         |  6 +++---
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 +++--
 drivers/gpu/drm/i915/gvt/firmware.c           | 10 +++++-----
 drivers/gpu/drm/i915/gvt/gtt.c                | 12 +++++------
 drivers/gpu/drm/i915/gvt/gvt.c                |  6 +++---
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_drv.c               | 20 +++++++++----------
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  4 ++--
 drivers/gpu/drm/i915/i915_getparam.c          |  5 +++--
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               |  6 +++---
 drivers/gpu/drm/i915/i915_pmu.c               |  5 +++--
 drivers/gpu/drm/i915/i915_suspend.c           |  4 ++--
 drivers/gpu/drm/i915/i915_switcheroo.c        |  4 ++--
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
 drivers/gpu/drm/i915/intel_region_lmem.c      |  8 ++++----
 drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  4 ++--
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
 42 files changed, 99 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4cc949b228f2..8879676372a3 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2088,7 +2088,7 @@ bool intel_bios_is_valid_vbt(const void *buf, size_t size)
 
 static struct vbt_header *oprom_get_vbt(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	void __iomem *p = NULL, *oprom;
 	struct vbt_header *vbt;
 	u16 vbt_size;
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index c449d28d0560..a6e13208dc50 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -96,7 +96,7 @@ static void fixed_450mhz_get_cdclk(struct drm_i915_private *dev_priv,
 static void i85x_get_cdclk(struct drm_i915_private *dev_priv,
 			   struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 hpllcc = 0;
 
 	/*
@@ -138,7 +138,7 @@ static void i85x_get_cdclk(struct drm_i915_private *dev_priv,
 static void i915gm_get_cdclk(struct drm_i915_private *dev_priv,
 			     struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 gcfgc = 0;
 
 	pci_read_config_word(pdev, GCFGC, &gcfgc);
@@ -162,7 +162,7 @@ static void i915gm_get_cdclk(struct drm_i915_private *dev_priv,
 static void i945gm_get_cdclk(struct drm_i915_private *dev_priv,
 			     struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 gcfgc = 0;
 
 	pci_read_config_word(pdev, GCFGC, &gcfgc);
@@ -256,7 +256,7 @@ static unsigned int intel_hpll_vco(struct drm_i915_private *dev_priv)
 static void g33_get_cdclk(struct drm_i915_private *dev_priv,
 			  struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	static const u8 div_3200[] = { 12, 10,  8,  7, 5, 16 };
 	static const u8 div_4000[] = { 14, 12, 10,  8, 6, 20 };
 	static const u8 div_4800[] = { 20, 14, 12, 10, 8, 24 };
@@ -305,7 +305,7 @@ static void g33_get_cdclk(struct drm_i915_private *dev_priv,
 static void pnv_get_cdclk(struct drm_i915_private *dev_priv,
 			  struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 gcfgc = 0;
 
 	pci_read_config_word(pdev, GCFGC, &gcfgc);
@@ -339,7 +339,7 @@ static void pnv_get_cdclk(struct drm_i915_private *dev_priv,
 static void i965gm_get_cdclk(struct drm_i915_private *dev_priv,
 			     struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	static const u8 div_3200[] = { 16, 10,  8 };
 	static const u8 div_4000[] = { 20, 12, 10 };
 	static const u8 div_5333[] = { 24, 16, 14 };
@@ -384,7 +384,7 @@ static void i965gm_get_cdclk(struct drm_i915_private *dev_priv,
 static void gm45_get_cdclk(struct drm_i915_private *dev_priv,
 			   struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	unsigned int cdclk_sel;
 	u16 tmp = 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_csr.c b/drivers/gpu/drm/i915/display/intel_csr.c
index 67dc64df78a5..19cbcab69689 100644
--- a/drivers/gpu/drm/i915/display/intel_csr.c
+++ b/drivers/gpu/drm/i915/display/intel_csr.c
@@ -640,7 +640,7 @@ static void csr_load_work_fn(struct work_struct *work)
 	dev_priv = container_of(work, typeof(*dev_priv), csr.work);
 	csr = &dev_priv->csr;
 
-	request_firmware(&fw, dev_priv->csr.fw_path, &dev_priv->drm.pdev->dev);
+	request_firmware(&fw, dev_priv->csr.fw_path, dev_priv->drm.dev);
 	parse_csr_fw(dev_priv, fw);
 
 	if (dev_priv->csr.dmc_payload) {
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index eed037ec0b29..e349caef1926 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -425,7 +425,7 @@ static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
 				  const u16 slave_addr)
 {
 	struct drm_device *drm_dev = intel_dsi->base.base.dev;
-	struct device *dev = &drm_dev->pdev->dev;
+	struct device *dev = drm_dev->dev;
 	struct acpi_device *acpi_dev;
 	struct list_head resource_list;
 	struct i2c_adapter_lookup lookup;
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 842c04e63214..4ccb462bd497 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -167,7 +167,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct intel_framebuffer *intel_fb = ifbdev->fb;
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct i915_ggtt *ggtt = &dev_priv->ggtt;
 	const struct i915_ggtt_view view = {
 		.type = I915_GGTT_VIEW_NORMAL,
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index b0d71bbbf2ad..0c952e1d720e 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -840,7 +840,7 @@ static const struct i2c_lock_operations gmbus_lock_ops = {
  */
 int intel_gmbus_setup(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct intel_gmbus *bus;
 	unsigned int pin;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index ad5cc13037ae..98eb52a938d0 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -80,6 +80,7 @@ static struct platform_device *
 lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct platform_device_info pinfo = {};
 	struct resource *rsc;
 	struct platform_device *platdev;
@@ -99,9 +100,9 @@ lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
 	rsc[0].flags    = IORESOURCE_IRQ;
 	rsc[0].name     = "hdmi-lpe-audio-irq";
 
-	rsc[1].start    = pci_resource_start(dev->pdev, 0) +
+	rsc[1].start    = pci_resource_start(pdev, 0) +
 		I915_HDMI_LPE_AUDIO_BASE;
-	rsc[1].end      = pci_resource_start(dev->pdev, 0) +
+	rsc[1].end      = pci_resource_start(pdev, 0) +
 		I915_HDMI_LPE_AUDIO_BASE + I915_HDMI_LPE_AUDIO_SIZE - 1;
 	rsc[1].flags    = IORESOURCE_MEM;
 	rsc[1].name     = "hdmi-lpe-audio-mmio";
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 4f77cf849171..dfd724e506b5 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -247,7 +247,7 @@ static int swsci(struct drm_i915_private *dev_priv,
 		 u32 function, u32 parm, u32 *parm_out)
 {
 	struct opregion_swsci *swsci = dev_priv->opregion.swsci;
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u32 main_function, sub_function, scic;
 	u16 swsci_val;
 	u32 dslp;
@@ -807,7 +807,7 @@ static int intel_load_vbt_firmware(struct drm_i915_private *dev_priv)
 	if (!name || !*name)
 		return -ENOENT;
 
-	ret = request_firmware(&fw, name, &dev_priv->drm.pdev->dev);
+	ret = request_firmware(&fw, name, dev_priv->drm.dev);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Requesting VBT firmware \"%s\" failed (%d)\n",
@@ -840,7 +840,7 @@ static int intel_load_vbt_firmware(struct drm_i915_private *dev_priv)
 int intel_opregion_setup(struct drm_i915_private *dev_priv)
 {
 	struct intel_opregion *opregion = &dev_priv->opregion;
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u32 asls, mboxes;
 	char buf[sizeof(OPREGION_SIGNATURE)];
 	int err = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 52b4f6193b4c..ea6a630cf6ef 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -201,7 +201,7 @@ struct intel_overlay {
 static void i830_overlay_clock_gating(struct drm_i915_private *dev_priv,
 				      bool enable)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u8 val;
 
 	/* WA_OVERLAY_CLKGATE:alm */
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 9f23bac0d792..1b643ed71f66 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -557,7 +557,7 @@ static u32 i9xx_get_backlight(struct intel_connector *connector)
 	if (panel->backlight.combination_mode) {
 		u8 lbpc;
 
-		pci_read_config_byte(dev_priv->drm.pdev, LBPC, &lbpc);
+		pci_read_config_byte(to_pci_dev(dev_priv->drm.dev), LBPC, &lbpc);
 		val *= lbpc;
 	}
 
@@ -631,7 +631,7 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 
 		lbpc = level * 0xfe / panel->backlight.max + 1;
 		level /= lbpc;
-		pci_write_config_byte(dev_priv->drm.pdev, LBPC, lbpc);
+		pci_write_config_byte(to_pci_dev(dev_priv->drm.dev), LBPC, lbpc);
 	}
 
 	if (IS_GEN(dev_priv, 4)) {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 46beb155d835..98dd787b00e3 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -160,7 +160,7 @@ static struct intel_quirk intel_quirks[] = {
 
 void intel_init_quirks(struct drm_i915_private *i915)
 {
-	struct pci_dev *d = i915->drm.pdev;
+	struct pci_dev *d = to_pci_dev(i915->drm.dev);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(intel_quirks); i++) {
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 4eaa4aa86ecd..3fac60899d8e 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3281,7 +3281,7 @@ static bool
 intel_sdvo_init_ddc_proxy(struct intel_sdvo *sdvo,
 			  struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	sdvo->ddc.owner = THIS_MODULE;
 	sdvo->ddc.class = I2C_CLASS_DDC;
diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index be333699c515..5f8e4f53649d 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -25,7 +25,7 @@ static i915_reg_t intel_vga_cntrl_reg(struct drm_i915_private *i915)
 /* Disable the VGA plane that we never use */
 void intel_vga_disable(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	i915_reg_t vga_reg = intel_vga_cntrl_reg(dev_priv);
 	u8 sr1;
 
@@ -76,7 +76,7 @@ void intel_vga_redisable(struct drm_i915_private *i915)
 
 void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	/*
 	 * After we re-enable the power well, if we touch VGA register 0x3d5
@@ -136,7 +136,7 @@ intel_vga_set_decode(void *cookie, bool enable_decode)
 
 int intel_vga_register(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	int ret;
 
 	/*
@@ -156,7 +156,7 @@ int intel_vga_register(struct drm_i915_private *i915)
 
 void intel_vga_unregister(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	vga_client_register(pdev, NULL, NULL, NULL);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 3a4dfe2ef1da..f47dafdda539 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -35,7 +35,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	 * to handle all possible callers, and given typical object sizes,
 	 * the alignment of the buddy allocation will naturally match.
 	 */
-	vaddr = dma_alloc_coherent(&obj->base.dev->pdev->dev,
+	vaddr = dma_alloc_coherent(obj->base.dev->dev,
 				   roundup_pow_of_two(obj->base.size),
 				   &dma, GFP_KERNEL);
 	if (!vaddr)
@@ -83,7 +83,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 err_st:
 	kfree(st);
 err_pci:
-	dma_free_coherent(&obj->base.dev->pdev->dev,
+	dma_free_coherent(obj->base.dev->dev,
 			  roundup_pow_of_two(obj->base.size),
 			  vaddr, dma);
 	return -ENOMEM;
@@ -129,7 +129,7 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 	sg_free_table(pages);
 	kfree(pages);
 
-	dma_free_coherent(&obj->base.dev->pdev->dev,
+	dma_free_coherent(obj->base.dev->dev,
 			  roundup_pow_of_two(obj->base.size),
 			  vaddr, dma);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 75e8b71c18b9..08c9c25f1109 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -172,7 +172,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 			max_segment = PAGE_SIZE;
 			goto rebuild_st;
 		} else {
-			dev_warn(&i915->drm.pdev->dev,
+			dev_warn(i915->drm.dev,
 				 "Failed to DMA remap %lu pages\n",
 				 page_count);
 			goto err_pages;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index d4e988b2816a..71bd2e22e7c6 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1228,7 +1228,7 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 
 	/* Waiting to drain ELSP? */
 	if (execlists_active(&engine->execlists)) {
-		synchronize_hardirq(engine->i915->drm.pdev->irq);
+		synchronize_hardirq(to_pci_dev(engine->i915->drm.dev)->irq);
 
 		intel_engine_flush_submission(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index cf94525be2c1..591c6a2a0a8f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -760,7 +760,7 @@ static unsigned int chv_get_total_gtt_size(u16 gmch_ctrl)
 static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 {
 	struct drm_i915_private *i915 = ggtt->vm.i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	phys_addr_t phys_addr;
 	int ret;
 
@@ -830,7 +830,7 @@ static struct resource pci_resource(struct pci_dev *pdev, int bar)
 static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 {
 	struct drm_i915_private *i915 = ggtt->vm.i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
@@ -974,7 +974,7 @@ static u64 iris_pte_encode(dma_addr_t addr,
 static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 {
 	struct drm_i915_private *i915 = ggtt->vm.i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
@@ -1037,7 +1037,7 @@ static int i915_gmch_probe(struct i915_ggtt *ggtt)
 	phys_addr_t gmadr_base;
 	int ret;
 
-	ret = intel_gmch_probe(i915->bridge_dev, i915->drm.pdev, NULL);
+	ret = intel_gmch_probe(i915->bridge_dev, to_pci_dev(i915->drm.dev), NULL);
 	if (!ret) {
 		drm_err(&i915->drm, "failed to set up gmch\n");
 		return -EIO;
@@ -1077,7 +1077,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
 
 	ggtt->vm.gt = gt;
 	ggtt->vm.i915 = i915;
-	ggtt->vm.dma = &i915->drm.pdev->dev;
+	ggtt->vm.dma = i915->drm.dev;
 
 	if (INTEL_GEN(i915) <= 5)
 		ret = i915_gmch_probe(ggtt);
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 46d9aceda64c..01b7d08532f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -301,7 +301,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt)
 
 	ppgtt->vm.gt = gt;
 	ppgtt->vm.i915 = i915;
-	ppgtt->vm.dma = &i915->drm.pdev->dev;
+	ppgtt->vm.dma = i915->drm.dev;
 	ppgtt->vm.total = BIT_ULL(INTEL_INFO(i915)->ppgtt_size);
 
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index d7b8e4457fc2..cce53fb9589c 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -485,14 +485,14 @@ static bool rc6_supported(struct intel_rc6 *rc6)
 static void rpm_get(struct intel_rc6 *rc6)
 {
 	GEM_BUG_ON(rc6->wakeref);
-	pm_runtime_get_sync(&rc6_to_i915(rc6)->drm.pdev->dev);
+	pm_runtime_get_sync(rc6_to_i915(rc6)->drm.dev);
 	rc6->wakeref = true;
 }
 
 static void rpm_put(struct intel_rc6 *rc6)
 {
 	GEM_BUG_ON(!rc6->wakeref);
-	pm_runtime_put(&rc6_to_i915(rc6)->drm.pdev->dev);
+	pm_runtime_put(rc6_to_i915(rc6)->drm.dev);
 	rc6->wakeref = false;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 3654c955e6be..a49faf4ec139 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -180,7 +180,7 @@ static int i915_do_reset(struct intel_gt *gt,
 			 intel_engine_mask_t engine_mask,
 			 unsigned int retry)
 {
-	struct pci_dev *pdev = gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 	int err;
 
 	/* Assert reset for at least 20 usec, and wait for acknowledgement. */
@@ -209,7 +209,7 @@ static int g33_do_reset(struct intel_gt *gt,
 			intel_engine_mask_t engine_mask,
 			unsigned int retry)
 {
-	struct pci_dev *pdev = gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 
 	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
 	return wait_for_atomic(g4x_reset_complete(pdev), 50);
@@ -219,7 +219,7 @@ static int g4x_do_reset(struct intel_gt *gt,
 			intel_engine_mask_t engine_mask,
 			unsigned int retry)
 {
-	struct pci_dev *pdev = gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 	struct intel_uncore *uncore = gt->uncore;
 	int ret;
 
diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index ad86c5eb5bba..b490e3db2e38 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -374,6 +374,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 			       bool primary)
 {
 	struct intel_gvt *gvt = vgpu->gvt;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	const struct intel_gvt_device_info *info = &gvt->device_info;
 	u16 *gmch_ctl;
 	u8 next;
@@ -407,9 +408,9 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 	memset(vgpu_cfg_space(vgpu) + INTEL_GVT_PCI_OPREGION, 0, 4);
 
 	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].size =
-		pci_resource_len(gvt->gt->i915->drm.pdev, 0);
+		pci_resource_len(pdev, 0);
 	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].size =
-		pci_resource_len(gvt->gt->i915->drm.pdev, 2);
+		pci_resource_len(pdev, 2);
 
 	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
 
diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index 990a181094e3..1a8274a3f4b1 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -76,7 +76,7 @@ static int mmio_snapshot_handler(struct intel_gvt *gvt, u32 offset, void *data)
 static int expose_firmware_sysfs(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	struct gvt_firmware_header *h;
 	void *firmware;
 	void *p;
@@ -127,7 +127,7 @@ static int expose_firmware_sysfs(struct intel_gvt *gvt)
 
 static void clean_firmware_sysfs(struct intel_gvt *gvt)
 {
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 
 	device_remove_bin_file(&pdev->dev, &firmware_attr);
 	vfree(firmware_attr.private);
@@ -151,7 +151,7 @@ static int verify_firmware(struct intel_gvt *gvt,
 			   const struct firmware *fw)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	struct gvt_firmware_header *h;
 	unsigned long id, crc32_start;
 	const void *mem;
@@ -205,7 +205,7 @@ static int verify_firmware(struct intel_gvt *gvt,
 int intel_gvt_load_firmware(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	struct intel_gvt_firmware *firmware = &gvt->firmware;
 	struct gvt_firmware_header *h;
 	const struct firmware *fw;
@@ -240,7 +240,7 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt)
 
 	gvt_dbg_core("request hw state firmware %s...\n", path);
 
-	ret = request_firmware(&fw, path, &gvt->gt->i915->drm.pdev->dev);
+	ret = request_firmware(&fw, path, gvt->gt->i915->drm.dev);
 	kfree(path);
 
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index a3a4305eda01..c9eb4c7ac608 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -737,7 +737,7 @@ static int detach_oos_page(struct intel_vgpu *vgpu,
 
 static void ppgtt_free_spt(struct intel_vgpu_ppgtt_spt *spt)
 {
-	struct device *kdev = &spt->vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *kdev = spt->vgpu->gvt->gt->i915->drm.dev;
 
 	trace_spt_free(spt->vgpu->id, spt, spt->guest_page.type);
 
@@ -822,7 +822,7 @@ static int reclaim_one_ppgtt_mm(struct intel_gvt *gvt);
 static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
 		struct intel_vgpu *vgpu, enum intel_gvt_gtt_type type)
 {
-	struct device *kdev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *kdev = vgpu->gvt->gt->i915->drm.dev;
 	struct intel_vgpu_ppgtt_spt *spt = NULL;
 	dma_addr_t daddr;
 	int ret;
@@ -2376,7 +2376,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 				vgpu->gvt->device_info.gtt_entry_size_shift;
 	void *scratch_pt;
 	int i;
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 	dma_addr_t daddr;
 
 	if (drm_WARN_ON(&i915->drm,
@@ -2434,7 +2434,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 static int release_scratch_page_tree(struct intel_vgpu *vgpu)
 {
 	int i;
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 	dma_addr_t daddr;
 
 	for (i = GTT_TYPE_PPGTT_PTE_PT; i < GTT_TYPE_MAX; i++) {
@@ -2706,7 +2706,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
 {
 	int ret;
 	void *page;
-	struct device *dev = &gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = gvt->gt->i915->drm.dev;
 	dma_addr_t daddr;
 
 	gvt_dbg_core("init gtt\n");
@@ -2755,7 +2755,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
  */
 void intel_gvt_clean_gtt(struct intel_gvt *gvt)
 {
-	struct device *dev = &gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = gvt->gt->i915->drm.dev;
 	dma_addr_t daddr = (dma_addr_t)(gvt->gtt.scratch_mfn <<
 					I915_GTT_PAGE_SHIFT);
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index c7c561237883..65b1fb256e0c 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -50,7 +50,7 @@ static struct intel_vgpu_type *intel_gvt_find_vgpu_type(struct intel_gvt *gvt,
 		const char *name)
 {
 	const char *driver_name =
-		dev_driver_string(&gvt->gt->i915->drm.pdev->dev);
+		dev_driver_string(gvt->gt->i915->drm.dev);
 	int i;
 
 	name += strlen(driver_name) + 1;
@@ -189,7 +189,7 @@ static const struct intel_gvt_ops intel_gvt_ops = {
 static void init_device_info(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = gvt->gt->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 
 	info->max_support_vgpus = 8;
 	info->cfg_space_size = PCI_CFG_SPACE_EXP_SIZE;
@@ -376,7 +376,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	intel_gvt_debugfs_init(gvt);
 
 	gvt_dbg_core("gvt device initialization is done\n");
-	intel_gvt_host.dev = &i915->drm.pdev->dev;
+	intel_gvt_host.dev = i915->drm.dev;
 	intel_gvt_host.initialized = true;
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 778eb8cab610..7ffb90aa4402 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -221,7 +221,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		dma_addr_t *dma_addr, unsigned long size)
 {
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 	struct page *page = NULL;
 	int ret;
 
@@ -244,7 +244,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		dma_addr_t dma_addr, unsigned long size)
 {
-	struct device *dev = &vgpu->gvt->gt->i915->drm.pdev->dev;
+	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 
 	dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
 	gvt_unpin_guest_page(vgpu, gfn, size);
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 263074c2c097..b4d38f68a246 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1275,7 +1275,7 @@ static int i915_llc(struct seq_file *m, void *data)
 static int i915_runtime_pm_status(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	if (!HAS_RUNTIME_PM(dev_priv))
 		seq_puts(m, "Runtime power management not supported\n");
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index f2389ba49c69..22cbd45f20f2 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -91,7 +91,7 @@ static const struct drm_driver driver;
 
 static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
 {
-	int domain = pci_domain_nr(dev_priv->drm.pdev->bus);
+	int domain = pci_domain_nr(to_pci_dev(dev_priv->drm.dev)->bus);
 
 	dev_priv->bridge_dev =
 		pci_get_domain_bus_and_slot(domain, 0, PCI_DEVFN(0, 0));
@@ -458,7 +458,6 @@ static void intel_sanitize_options(struct drm_i915_private *dev_priv)
  */
 static int i915_set_dma_info(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
 	unsigned int mask_size = INTEL_INFO(i915)->dma_mask_size;
 	int ret;
 
@@ -468,9 +467,9 @@ static int i915_set_dma_info(struct drm_i915_private *i915)
 	 * We don't have a max segment size, so set it to the max so sg's
 	 * debugging layer doesn't complain
 	 */
-	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	dma_set_max_seg_size(i915->drm.dev, UINT_MAX);
 
-	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(mask_size));
+	ret = dma_set_mask(i915->drm.dev, DMA_BIT_MASK(mask_size));
 	if (ret)
 		goto mask_err;
 
@@ -490,7 +489,7 @@ static int i915_set_dma_info(struct drm_i915_private *i915)
 	if (IS_I965G(i915) || IS_I965GM(i915))
 		mask_size = 32;
 
-	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(mask_size));
+	ret = dma_set_coherent_mask(i915->drm.dev, DMA_BIT_MASK(mask_size));
 	if (ret)
 		goto mask_err;
 
@@ -510,7 +509,7 @@ static int i915_set_dma_info(struct drm_i915_private *i915)
  */
 static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	int ret;
 
 	if (i915_inject_probe_failure(dev_priv))
@@ -642,7 +641,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
  */
 static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	i915_perf_fini(dev_priv);
 
@@ -792,7 +791,6 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(i915))
 		return i915;
 
-	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
 
 	/* Device parameters start as a copy of module parameters. */
@@ -1094,7 +1092,7 @@ static int i915_drm_prepare(struct drm_device *dev)
 static int i915_drm_suspend(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	pci_power_t opregion_target_state;
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
@@ -1151,7 +1149,7 @@ get_suspend_mode(struct drm_i915_private *dev_priv, bool hibernate)
 static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	int ret;
 
@@ -1279,7 +1277,7 @@ static int i915_drm_resume(struct drm_device *dev)
 static int i915_drm_resume_early(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	int ret;
 
 	/*
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 15be8debae54..b5a33430f3b7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1295,7 +1295,7 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
 #define INTEL_DEVID(dev_priv)	(RUNTIME_INFO(dev_priv)->device_id)
 
 #define REVID_FOREVER		0xff
-#define INTEL_REVID(dev_priv)	((dev_priv)->drm.pdev->revision)
+#define INTEL_REVID(dev_priv)	(to_pci_dev((dev_priv)->drm.dev)->revision)
 
 #define INTEL_GEN_MASK(s, e) ( \
 	BUILD_BUG_ON_ZERO(!__builtin_constant_p(s)) + \
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index c5ee1567f3d1..55eb42e1c994 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -28,7 +28,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
 	do {
-		if (dma_map_sg_attrs(&obj->base.dev->pdev->dev,
+		if (dma_map_sg_attrs(obj->base.dev->dev,
 				     pages->sgl, pages->nents,
 				     PCI_DMA_BIDIRECTIONAL,
 				     DMA_ATTR_SKIP_CPU_SYNC |
@@ -56,7 +56,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
 	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
-	struct device *kdev = &dev_priv->drm.pdev->dev;
+	struct device *kdev = dev_priv->drm.dev;
 	struct i915_ggtt *ggtt = &dev_priv->ggtt;
 
 	if (unlikely(ggtt->do_idle_maps)) {
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index f96032c60a12..8d37f4987cfa 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -12,6 +12,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
 	drm_i915_getparam_t *param = data;
 	int value;
@@ -24,10 +25,10 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		/* Reject all old ums/dri params. */
 		return -ENODEV;
 	case I915_PARAM_CHIPSET_ID:
-		value = i915->drm.pdev->device;
+		value = pdev->device;
 		break;
 	case I915_PARAM_REVISION:
-		value = i915->drm.pdev->revision;
+		value = pdev->revision;
 		break;
 	case I915_PARAM_NUM_FENCES_AVAIL:
 		value = i915->ggtt.num_fences;
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index d8cac4c5881f..97aa2c0f27aa 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -644,7 +644,7 @@ static void err_print_params(struct drm_i915_error_state_buf *m,
 static void err_print_pciid(struct drm_i915_error_state_buf *m,
 			    struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	err_printf(m, "PCI ID: 0x%04x\n", pdev->device);
 	err_printf(m, "PCI Revision: 0x%02x\n", pdev->revision);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index dc6febc63f1c..f8fade6af492 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4354,7 +4354,7 @@ static void intel_irq_postinstall(struct drm_i915_private *dev_priv)
  */
 int intel_irq_install(struct drm_i915_private *dev_priv)
 {
-	int irq = dev_priv->drm.pdev->irq;
+	int irq = to_pci_dev(dev_priv->drm.dev)->irq;
 	int ret;
 
 	/*
@@ -4389,7 +4389,7 @@ int intel_irq_install(struct drm_i915_private *dev_priv)
  */
 void intel_irq_uninstall(struct drm_i915_private *dev_priv)
 {
-	int irq = dev_priv->drm.pdev->irq;
+	int irq = to_pci_dev(dev_priv->drm.dev)->irq;
 
 	/*
 	 * FIXME we can get called twice during driver probe
@@ -4449,5 +4449,5 @@ bool intel_irqs_enabled(struct drm_i915_private *dev_priv)
 
 void intel_synchronize_irq(struct drm_i915_private *i915)
 {
-	synchronize_irq(i915->drm.pdev->irq);
+	synchronize_irq(to_pci_dev(i915->drm.dev)->irq);
 }
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index cd786ad12be7..58aa1aaaeb85 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -427,7 +427,8 @@ static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
 static u64 count_interrupts(struct drm_i915_private *i915)
 {
 	/* open-coded kstat_irqs() */
-	struct irq_desc *desc = irq_to_desc(i915->drm.pdev->irq);
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	struct irq_desc *desc = irq_to_desc(pdev->irq);
 	u64 sum = 0;
 	int cpu;
 
@@ -1117,7 +1118,7 @@ static void i915_pmu_unregister_cpuhp_state(struct i915_pmu *pmu)
 
 static bool is_igp(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	/* IGP is 0000:00:02.0 */
 	return pci_domain_nr(pdev->bus) == 0 &&
diff --git a/drivers/gpu/drm/i915/i915_suspend.c b/drivers/gpu/drm/i915/i915_suspend.c
index db2111fc809e..2ec76acf778d 100644
--- a/drivers/gpu/drm/i915/i915_suspend.c
+++ b/drivers/gpu/drm/i915/i915_suspend.c
@@ -84,7 +84,7 @@ static void intel_restore_swf(struct drm_i915_private *dev_priv)
 
 void i915_save_display(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	/* Display arbitration control */
 	if (INTEL_GEN(dev_priv) <= 4)
@@ -99,7 +99,7 @@ void i915_save_display(struct drm_i915_private *dev_priv)
 
 void i915_restore_display(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	intel_restore_swf(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i915/i915_switcheroo.c
index b3a24eac21f1..de0e224b56ce 100644
--- a/drivers/gpu/drm/i915/i915_switcheroo.c
+++ b/drivers/gpu/drm/i915/i915_switcheroo.c
@@ -54,14 +54,14 @@ static const struct vga_switcheroo_client_ops i915_switcheroo_ops = {
 
 int i915_switcheroo_register(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	return vga_switcheroo_register_client(pdev, &i915_switcheroo_ops, false);
 }
 
 void i915_switcheroo_unregister(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	vga_switcheroo_unregister_client(pdev);
 }
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index 70fca72f5162..172799277dd5 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -61,7 +61,7 @@
  */
 void intel_vgpu_detect(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u64 magic;
 	u16 version_major;
 	void __iomem *shared_area;
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index e67cec8fa2aa..fab8b8770ca3 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -348,7 +348,7 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	}
 
 	if (IS_TIGERLAKE(i915)) {
-		struct pci_dev *root, *pdev = i915->drm.pdev;
+		struct pci_dev *root, *pdev = to_pci_dev(i915->drm.dev);
 
 		root = list_first_entry(&pdev->bus->devices, typeof(*root), bus_list);
 
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index 40d8f1a95df6..0fe49b3adade 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -26,12 +26,12 @@ static int init_fake_lmem_bar(struct intel_memory_region *mem)
 	if (ret)
 		return ret;
 
-	mem->remap_addr = dma_map_resource(&i915->drm.pdev->dev,
+	mem->remap_addr = dma_map_resource(i915->drm.dev,
 					   mem->region.start,
 					   mem->fake_mappable.size,
 					   PCI_DMA_BIDIRECTIONAL,
 					   DMA_ATTR_FORCE_CONTIGUOUS);
-	if (dma_mapping_error(&i915->drm.pdev->dev, mem->remap_addr)) {
+	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
 		drm_mm_remove_node(&mem->fake_mappable);
 		return -EINVAL;
 	}
@@ -56,7 +56,7 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
 
 	drm_mm_remove_node(&mem->fake_mappable);
 
-	dma_unmap_resource(&mem->i915->drm.pdev->dev,
+	dma_unmap_resource(mem->i915->drm.dev,
 			   mem->remap_addr,
 			   mem->fake_mappable.size,
 			   PCI_DMA_BIDIRECTIONAL,
@@ -104,7 +104,7 @@ const struct intel_memory_region_ops intel_region_lmem_ops = {
 struct intel_memory_region *
 intel_setup_fake_lmem(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct intel_memory_region *mem;
 	resource_size_t mappable_end;
 	resource_size_t io_start;
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 153ca9e65382..4970ef0843dc 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -625,7 +625,7 @@ void intel_runtime_pm_init_early(struct intel_runtime_pm *rpm)
 {
 	struct drm_i915_private *i915 =
 			container_of(rpm, struct drm_i915_private, runtime_pm);
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct device *kdev = &pdev->dev;
 
 	rpm->kdev = kdev;
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 1c14a07eba7d..4caee4d5c120 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1780,7 +1780,7 @@ static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
 static int uncore_mmio_setup(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	int mmio_bar;
 	int mmio_size;
 
@@ -1812,7 +1812,7 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 
 static void uncore_mmio_cleanup(struct intel_uncore *uncore)
 {
-	struct pci_dev *pdev = uncore->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(uncore->i915->drm.dev);
 
 	pci_iounmap(pdev, uncore->regs);
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index e946bd2087d8..52513d5b7d03 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -148,7 +148,6 @@ struct drm_i915_private *mock_gem_device(void)
 	}
 
 	pci_set_drvdata(pdev, i915);
-	i915->drm.pdev = pdev;
 
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index 7270fc8ca801..5c7ae40bba63 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -74,7 +74,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
 	ppgtt->vm.i915 = i915;
 	ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
 	ppgtt->vm.file = ERR_PTR(-ENODEV);
-	ppgtt->vm.dma = &i915->drm.pdev->dev;
+	ppgtt->vm.dma = i915->drm.dev;
 
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
