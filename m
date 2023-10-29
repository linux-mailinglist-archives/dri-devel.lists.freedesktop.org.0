Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB77DAE04
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 20:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE5710E1A1;
	Sun, 29 Oct 2023 19:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76E8B10E192
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 19:46:14 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dx_7uDtj5lt5s1AA--.45611S3;
 Mon, 30 Oct 2023 03:46:11 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxXNx+tj5lKq02AA--.51878S5; 
 Mon, 30 Oct 2023 03:46:11 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/8] drm/loongson: Allow attach drm bridge driver by calling
 lsdc_output_init()
Date: Mon, 30 Oct 2023 03:46:02 +0800
Message-Id: <20231029194607.379459-4-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029194607.379459-1-suijingfeng@loongson.cn>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxXNx+tj5lKq02AA--.51878S5
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfuF4rZFyxAr4ftw1fKFyUJwc_yoW8KFy8to
 WxXwnavw18KryIqrZ5KF18KFWDZa1Fq3W3Gwn5GFZrua98Cw4Yq34xG34UKFWSqr1Sgr4U
 Z3Wqq3s7XFsrZF4kl-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUYj7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8gAw7UUUUU==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the sharable subroutine into lsdc_output.c and refactor.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/Makefile      |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.h    |  17 -
 drivers/gpu/drm/loongson/lsdc_output.c | 640 +++++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h |  52 +-
 4 files changed, 691 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c

diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index 1459d19b2c90..393709e686aa 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -9,6 +9,7 @@ loongson-y := \
 	lsdc_gfxpll.o \
 	lsdc_i2c.o \
 	lsdc_irq.o \
+	lsdc_output.o \
 	lsdc_output_7a1000.o \
 	lsdc_output_7a2000.o \
 	lsdc_plane.o \
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index 335953c988d1..46ba9b88a30d 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -175,23 +175,6 @@ struct lsdc_cursor {
 	struct lsdc_device *ldev;
 };
 
-struct lsdc_output {
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-};
-
-static inline struct lsdc_output *
-connector_to_lsdc_output(struct drm_connector *connector)
-{
-	return container_of(connector, struct lsdc_output, connector);
-}
-
-static inline struct lsdc_output *
-encoder_to_lsdc_output(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct lsdc_output, encoder);
-}
-
 struct lsdc_display_pipe {
 	struct lsdc_crtc crtc;
 	struct lsdc_primary primary;
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
new file mode 100644
index 000000000000..8262c3f91ebe
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -0,0 +1,640 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+#include <linux/delay.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_probe_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_output.h"
+
+/* This file contain shared subroutines for the output part */
+
+/* Usable for generic DVO, VGA and buitl-in HDMI connector */
+
+static int lsdc_connector_get_modes(struct drm_connector *connector)
+{
+	unsigned int num = 0;
+	struct edid *edid;
+
+	if (connector->ddc) {
+		edid = drm_get_edid(connector, connector->ddc);
+		if (edid) {
+			drm_connector_update_edid_property(connector, edid);
+			num = drm_add_edid_modes(connector, edid);
+			kfree(edid);
+		}
+
+		return num;
+	}
+
+	num = drm_add_modes_noedid(connector, 1920, 1200);
+
+	drm_set_preferred_mode(connector, 1024, 768);
+
+	return num;
+}
+
+static struct drm_encoder *
+lsdc_connector_get_best_encoder(struct drm_connector *connector,
+				struct drm_atomic_state *state)
+{
+	struct lsdc_output *output = connector_to_lsdc_output(connector);
+
+	return &output->encoder;
+}
+
+const struct drm_connector_helper_funcs lsdc_connector_helper_funcs = {
+	.atomic_best_encoder = lsdc_connector_get_best_encoder,
+	.get_modes = lsdc_connector_get_modes,
+};
+
+static enum drm_connector_status
+lsdc_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct i2c_adapter *ddc = connector->ddc;
+
+	if (ddc) {
+		if (drm_probe_ddc(ddc))
+			return connector_status_connected;
+
+		return connector_status_disconnected;
+	}
+
+	return connector_status_unknown;
+}
+
+const struct drm_connector_funcs lsdc_connector_funcs = {
+	.detect = lsdc_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state
+};
+
+/* debugfs */
+
+#define LSDC_HDMI_REG(i, reg) {                               \
+	.name = __stringify_1(LSDC_HDMI##i##_##reg##_REG),    \
+	.offset = LSDC_HDMI##i##_##reg##_REG,                 \
+}
+
+static int lsdc_hdmi_regs_show(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_reg32 *preg;
+
+	preg = (const struct lsdc_reg32 *)node->info_ent->data;
+
+	while (preg->name) {
+		u32 offset = preg->offset;
+
+		seq_printf(m, "%s (0x%04x): 0x%08x\n",
+			   preg->name, offset, lsdc_rreg32(ldev, offset));
+		++preg;
+	}
+
+	return 0;
+}
+
+/* LSDC built-in HDMI encoder, connected with display pipe 0 */
+
+static const struct lsdc_reg32 lsdc_hdmi_regs_pipe0[] = {
+	LSDC_HDMI_REG(0, ZONE),
+	LSDC_HDMI_REG(0, INTF_CTRL),
+	LSDC_HDMI_REG(0, PHY_CTRL),
+	LSDC_HDMI_REG(0, PHY_PLL),
+	LSDC_HDMI_REG(0, AVI_INFO_CRTL),
+	LSDC_HDMI_REG(0, PHY_CAL),
+	LSDC_HDMI_REG(0, AUDIO_PLL_LO),
+	LSDC_HDMI_REG(0, AUDIO_PLL_HI),
+	{NULL, 0},  /* MUST be {NULL, 0} terminated */
+};
+
+static const struct drm_info_list lsdc_pipe0_hdmi_debugfs_files[] = {
+	{ "regs", lsdc_hdmi_regs_show, 0, (void *)lsdc_hdmi_regs_pipe0 },
+};
+
+static enum drm_connector_status
+lsdc_pipe0_hdmi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct lsdc_device *ldev = to_lsdc(connector->dev);
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
+
+	if (val & HDMI0_HPD_FLAG)
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+
+static void lsdc_pipe0_hdmi_late_register(struct drm_connector *connector,
+					  struct dentry *root)
+{
+	struct drm_device *ddev = connector->dev;
+	struct drm_minor *minor = ddev->primary;
+
+	drm_debugfs_create_files(lsdc_pipe0_hdmi_debugfs_files,
+				 ARRAY_SIZE(lsdc_pipe0_hdmi_debugfs_files),
+				 root, minor);
+}
+
+const struct drm_connector_funcs lsdc_pipe0_hdmi_connector_funcs = {
+	.detect = lsdc_pipe0_hdmi_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.debugfs_init = lsdc_pipe0_hdmi_late_register,
+};
+
+/* LSDC built-in HDMI connector, connected with display pipe 1 */
+
+static enum drm_connector_status
+lsdc_pipe1_hdmi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct lsdc_device *ldev = to_lsdc(connector->dev);
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
+
+	if (val & HDMI1_HPD_FLAG)
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+
+static const struct lsdc_reg32 lsdc_pipe1_hdmi_encoder_regs[] = {
+	LSDC_HDMI_REG(1, ZONE),
+	LSDC_HDMI_REG(1, INTF_CTRL),
+	LSDC_HDMI_REG(1, PHY_CTRL),
+	LSDC_HDMI_REG(1, PHY_PLL),
+	LSDC_HDMI_REG(1, AVI_INFO_CRTL),
+	LSDC_HDMI_REG(1, PHY_CAL),
+	LSDC_HDMI_REG(1, AUDIO_PLL_LO),
+	LSDC_HDMI_REG(1, AUDIO_PLL_HI),
+	{NULL, 0},  /* MUST be {NULL, 0} terminated */
+};
+
+static const struct drm_info_list lsdc_pipe1_hdmi_debugfs_files[] = {
+	{ "regs", lsdc_hdmi_regs_show, 0, (void *)lsdc_pipe1_hdmi_encoder_regs },
+};
+
+static void lsdc_pipe1_hdmi_late_register(struct drm_connector *connector,
+					  struct dentry *root)
+{
+	struct drm_device *ddev = connector->dev;
+	struct drm_minor *minor = ddev->primary;
+
+	drm_debugfs_create_files(lsdc_pipe1_hdmi_debugfs_files,
+				 ARRAY_SIZE(lsdc_pipe1_hdmi_debugfs_files),
+				 root, minor);
+}
+
+const struct drm_connector_funcs lsdc_pipe1_hdmi_connector_funcs = {
+	.detect = lsdc_pipe1_hdmi_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.debugfs_init = lsdc_pipe1_hdmi_late_register,
+};
+
+/*
+ *  Fout = M * in_khz
+ *
+ *  M = (4 * LF) / (IDF * ODF)
+ *
+ *  IDF: Input Division Factor
+ *  ODF: Output Division Factor
+ *   LF: Loop Factor
+ *    M: Required Mult
+ *
+ *  +--------------------------------------------------------+
+ *  |       in_khz      | M  | IDF | LF | ODF |   Fout(Mhz)  |
+ *  |-------------------+----+-----+----+-----+--------------|
+ *  |  170000 ~ 340000  | 10 | 16  | 40 |  1  | 1700 ~ 3400  |
+ *  |   85000 ~ 170000  | 10 |  8  | 40 |  2  |  850 ~ 1700  |
+ *  |   42500 ~  85000  | 10 |  4  | 40 |  4  |  425 ~ 850   |
+ *  |   21250 ~  42500  | 10 |  2  | 40 |  8  | 212.5 ~ 425  |
+ *  |   20000 ~  21250  | 10 |  1  | 40 | 16  |  200 ~ 212.5 |
+ *  +--------------------------------------------------------+
+ */
+static void lsdc_hdmi_phy_pll_config(struct drm_device *ddev,
+				     int in_khz,
+				     unsigned int pipe)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	int count = 0;
+	u32 val;
+
+	/* Firstly, disable phy pll */
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, pipe, 0x0);
+
+	/*
+	 * Most of time, loongson HDMI require M = 10
+	 * for example, 10 = (4 * 40) / (8 * 2)
+	 * here, write "1" to the ODF will get "2"
+	 */
+
+	if (in_khz >= 170000)
+		val = (16 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (0 << HDMI_PLL_ODF_SHIFT);
+	else if (in_khz >= 85000)
+		val = (8 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (1 << HDMI_PLL_ODF_SHIFT);
+	else if (in_khz >= 42500)
+		val = (4 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (2 << HDMI_PLL_ODF_SHIFT);
+	else if (in_khz >= 21250)
+		val = (2 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (3 << HDMI_PLL_ODF_SHIFT);
+	else
+		val = (1 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (4 << HDMI_PLL_ODF_SHIFT);
+
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, pipe, val);
+
+	val |= HDMI_PLL_ENABLE;
+
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, pipe, val);
+
+	udelay(2);
+
+	drm_dbg(ddev, "Input frequency of HDMI-%u: %d kHz\n", pipe, in_khz);
+
+	/* Wait hdmi phy pll lock */
+	do {
+		val = lsdc_pipe_rreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, pipe);
+
+		if (val & HDMI_PLL_LOCKED) {
+			drm_dbg(ddev, "Setting HDMI-%u PLL take %d cycles\n",
+				pipe, count);
+			break;
+		}
+		++count;
+	} while (count < 1000);
+
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_PHY_CAL_REG, pipe, 0x0f000ff0);
+
+	if (count >= 1000)
+		drm_err(ddev, "Setting HDMI-%u PLL failed\n", pipe);
+}
+
+static int lsdc_hdmi_phy_set_avi_infoframe(struct drm_encoder *encoder,
+					   struct drm_connector *connector,
+					   struct drm_display_mode *mode,
+					   unsigned int index)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct hdmi_avi_infoframe infoframe;
+	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
+	unsigned char *ptr = &buffer[HDMI_INFOFRAME_HEADER_SIZE];
+	unsigned int content0, content1, content2, content3;
+	int err;
+
+	err = drm_hdmi_avi_infoframe_from_display_mode(&infoframe,
+						       connector,
+						       mode);
+	if (err < 0) {
+		drm_err(ddev, "failed to setup AVI infoframe: %d\n", err);
+		return err;
+	}
+
+	/* Fixed infoframe configuration not linked to the mode */
+	infoframe.colorspace = HDMI_COLORSPACE_RGB;
+	infoframe.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+	infoframe.colorimetry = HDMI_COLORIMETRY_NONE;
+
+	err = hdmi_avi_infoframe_pack(&infoframe, buffer, sizeof(buffer));
+	if (err < 0) {
+		drm_err(ddev, "failed to pack AVI infoframe: %d\n", err);
+			return err;
+	}
+
+	content0 = *(unsigned int *)ptr;
+	content1 = *(ptr + 4);
+	content2 = *(unsigned int *)(ptr + 5);
+	content3 = *(unsigned int *)(ptr + 9);
+
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT0, index, content0);
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT1, index, content1);
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT2, index, content2);
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT3, index, content3);
+
+	lsdc_pipe_wreg32(ldev, LSDC_HDMI0_AVI_INFO_CRTL_REG, index,
+			 AVI_PKT_ENABLE | AVI_PKT_UPDATE);
+
+	drm_dbg(ddev, "Update HDMI-%u avi infoframe\n", index);
+
+	return 0;
+}
+
+/* Built-in HDMI encoder funcs on display pipe 0 */
+
+static void lsdc_pipe0_hdmi_encoder_reset(struct drm_encoder *encoder)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 val;
+
+	val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
+	lsdc_wreg32(ldev, LSDC_CRTC0_DVO_CONF_REG, val);
+
+	/* Using built-in GPIO emulated I2C instead of the hardware I2C */
+	lsdc_ureg32_clr(ldev, LSDC_HDMI0_INTF_CTRL_REG, HW_I2C_EN);
+
+	/* Help the HDMI phy get out of reset state */
+	lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, HDMI_PHY_RESET_N);
+
+	drm_dbg(ddev, "%s reset\n", encoder->name);
+
+	mdelay(20);
+}
+
+const struct drm_encoder_funcs lsdc_pipe0_hdmi_encoder_funcs = {
+	.reset = lsdc_pipe0_hdmi_encoder_reset,
+	.destroy = drm_encoder_cleanup,
+};
+
+/* Built-in HDMI encoder funcs on display pipe 1 */
+
+static void lsdc_pipe1_hdmi_encoder_reset(struct drm_encoder *encoder)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 val;
+
+	val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
+	lsdc_wreg32(ldev, LSDC_CRTC1_DVO_CONF_REG, val);
+
+	/* Using built-in GPIO emulated I2C instead of the hardware I2C */
+	lsdc_ureg32_clr(ldev, LSDC_HDMI1_INTF_CTRL_REG, HW_I2C_EN);
+
+	/* Help the HDMI phy get out of reset state */
+	lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, HDMI_PHY_RESET_N);
+
+	drm_dbg(ddev, "%s reset\n", encoder->name);
+
+	mdelay(20);
+}
+
+const struct drm_encoder_funcs lsdc_pipe1_hdmi_encoder_funcs = {
+	.reset = lsdc_pipe1_hdmi_encoder_reset,
+	.destroy = drm_encoder_cleanup,
+};
+
+/* Built-in DVO encoder helper funcs */
+
+static void lsdc_dvo_atomic_disable(struct drm_encoder *encoder,
+				    struct drm_atomic_state *state)
+{
+}
+
+static void lsdc_dvo_atomic_enable(struct drm_encoder *encoder,
+				   struct drm_atomic_state *state)
+{
+}
+
+static void lsdc_dvo_atomic_modeset(struct drm_encoder *encoder,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+}
+
+const struct drm_encoder_helper_funcs lsdc_encoder_helper_funcs = {
+	.atomic_disable = lsdc_dvo_atomic_disable,
+	.atomic_enable = lsdc_dvo_atomic_enable,
+	.atomic_mode_set = lsdc_dvo_atomic_modeset,
+};
+
+/* Built-in HDMI encoder helper funcs on display pipe 0 */
+
+static void lsdc_pipe0_hdmi_atomic_disable(struct drm_encoder *encoder,
+					   struct drm_atomic_state *state)
+{
+	struct lsdc_device *ldev = to_lsdc(encoder->dev);
+
+	/* Disable the HDMI PHY */
+	lsdc_ureg32_clr(ldev, LSDC_HDMI0_PHY_CTRL_REG, HDMI_PHY_EN);
+
+	/* Disable the HDMI interface */
+	lsdc_ureg32_clr(ldev, LSDC_HDMI0_INTF_CTRL_REG, HDMI_INTERFACE_EN);
+}
+
+static void lsdc_pipe0_hdmi_atomic_enable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
+{
+	struct lsdc_device *ldev = to_lsdc(encoder->dev);
+	u32 val;
+
+	/* datasheet say it should larger than 48 */
+	val = 64 << HDMI_H_ZONE_IDLE_SHIFT | 64 << HDMI_V_ZONE_IDLE_SHIFT;
+	lsdc_wreg32(ldev, LSDC_HDMI0_ZONE_REG, val);
+
+	val = HDMI_PHY_TERM_STATUS |
+	      HDMI_PHY_TERM_DET_EN |
+	      HDMI_PHY_TERM_H_EN |
+	      HDMI_PHY_TERM_L_EN |
+	      HDMI_PHY_RESET_N |
+	      HDMI_PHY_EN;
+	lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, val);
+
+	udelay(2);
+
+	val = HDMI_CTL_PERIOD_MODE |
+	      HDMI_AUDIO_EN |
+	      HDMI_PACKET_EN |
+	      HDMI_INTERFACE_EN |
+	      (8 << HDMI_VIDEO_PREAMBLE_SHIFT);
+	lsdc_wreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, val);
+}
+
+static void lsdc_pipe0_hdmi_atomic_modeset(struct drm_encoder *encoder,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
+{
+	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
+	struct drm_device *ddev = encoder->dev;
+	struct drm_display_mode *mode = &crtc_state->mode;
+
+	lsdc_hdmi_phy_pll_config(ddev, mode->clock, 0);
+
+	lsdc_hdmi_phy_set_avi_infoframe(encoder, &output->connector, mode, 0);
+
+	drm_dbg(ddev, "%s modeset finished\n", encoder->name);
+}
+
+const struct drm_encoder_helper_funcs lsdc_pipe0_hdmi_encoder_helper_funcs = {
+	.atomic_disable = lsdc_pipe0_hdmi_atomic_disable,
+	.atomic_enable = lsdc_pipe0_hdmi_atomic_enable,
+	.atomic_mode_set = lsdc_pipe0_hdmi_atomic_modeset,
+};
+
+/* Built-in HDMI encoder helper funcs on display pipe 1 */
+
+static void lsdc_pipe1_hdmi_atomic_disable(struct drm_encoder *encoder,
+					   struct drm_atomic_state *state)
+{
+	struct lsdc_device *ldev = to_lsdc(encoder->dev);
+
+	/* Disable the HDMI PHY */
+	lsdc_ureg32_clr(ldev, LSDC_HDMI1_PHY_CTRL_REG, HDMI_PHY_EN);
+
+	/* Disable the HDMI interface */
+	lsdc_ureg32_clr(ldev, LSDC_HDMI1_INTF_CTRL_REG, HDMI_INTERFACE_EN);
+}
+
+static void lsdc_pipe1_hdmi_atomic_enable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
+{
+	struct lsdc_device *ldev = to_lsdc(encoder->dev);
+	u32 val;
+
+	/* datasheet say it should larger than 48 */
+	val = 64 << HDMI_H_ZONE_IDLE_SHIFT | 64 << HDMI_V_ZONE_IDLE_SHIFT;
+	lsdc_wreg32(ldev, LSDC_HDMI1_ZONE_REG, val);
+
+	val = HDMI_PHY_TERM_STATUS |
+	      HDMI_PHY_TERM_DET_EN |
+	      HDMI_PHY_TERM_H_EN |
+	      HDMI_PHY_TERM_L_EN |
+	      HDMI_PHY_RESET_N |
+	      HDMI_PHY_EN;
+	lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, val);
+
+	udelay(2);
+
+	val = HDMI_CTL_PERIOD_MODE |
+	      HDMI_AUDIO_EN |
+	      HDMI_PACKET_EN |
+	      HDMI_INTERFACE_EN |
+	      (8 << HDMI_VIDEO_PREAMBLE_SHIFT);
+	lsdc_wreg32(ldev, LSDC_HDMI1_INTF_CTRL_REG, val);
+}
+
+static void lsdc_pipe1_hdmi_atomic_modeset(struct drm_encoder *encoder,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
+{
+	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
+	struct drm_device *ddev = encoder->dev;
+	struct drm_display_mode *mode = &crtc_state->mode;
+
+	lsdc_hdmi_phy_pll_config(ddev, mode->clock, 1);
+
+	lsdc_hdmi_phy_set_avi_infoframe(encoder, &output->connector, mode, 1);
+
+	drm_dbg(ddev, "%s modeset finished\n", encoder->name);
+}
+
+const struct drm_encoder_helper_funcs lsdc_pipe1_hdmi_encoder_helper_funcs = {
+	.atomic_disable = lsdc_pipe1_hdmi_atomic_disable,
+	.atomic_enable = lsdc_pipe1_hdmi_atomic_enable,
+	.atomic_mode_set = lsdc_pipe1_hdmi_atomic_modeset,
+};
+
+int lsdc_encoder_init(struct drm_device *ddev,
+		      struct lsdc_output *output,
+		      unsigned int pipe)
+{
+	const struct lsdc_output_desc *descp = output->descp;
+	struct drm_encoder *encoder = &output->encoder;
+	int ret;
+
+	ret = drm_encoder_init(ddev,
+			       encoder,
+			       descp->encoder_funcs,
+			       descp->encoder_type,
+			       descp->name);
+	if (ret)
+		return ret;
+
+	encoder->possible_crtcs = BIT(pipe);
+
+	drm_encoder_helper_add(encoder, descp->encoder_helper_funcs);
+
+	return 0;
+}
+
+int lsdc_connector_init(struct drm_device *ddev,
+			struct lsdc_output *output,
+			struct i2c_adapter *ddc,
+			unsigned int pipe)
+{
+	const struct lsdc_output_desc *descp = output->descp;
+	struct drm_connector *connector = &output->connector;
+	int ret;
+
+	ret = drm_connector_init_with_ddc(ddev,
+					  connector,
+					  descp->connector_funcs,
+					  descp->connector_type,
+					  ddc);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, descp->connector_helper_funcs);
+
+	drm_connector_attach_encoder(connector, &output->encoder);
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	drm_info(ddev, "DisplayPipe-%u has %s\n", pipe, descp->name);
+
+	return 0;
+}
+
+/*
+ * A common, sharable subroutine for the initialization of output part.
+ * If there is external non-transparent display bridge chip on the display
+ * pipe, we will attach it. Otherwise, the output is simple, we will just
+ * initial a connector for it.
+ */
+int lsdc_output_init(struct drm_device *ddev,
+		     struct lsdc_display_pipe *dispipe,
+		     struct i2c_adapter *ddc,
+		     unsigned int pipe)
+{
+	struct lsdc_output *output = &dispipe->output;
+	int ret;
+
+	ret = lsdc_encoder_init(ddev, output, pipe);
+	if (ret)
+		return ret;
+
+	if (output->bridge) {
+		ret = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, 0);
+		if (ret) {
+			drm_err(ddev, "Attach display bridge failed\n");
+			ret = lsdc_connector_init(ddev, output, ddc, pipe);
+		}
+	} else {
+		ret = lsdc_connector_init(ddev, output, ddc, pipe);
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loongson/lsdc_output.h
index 097789051a1d..a37a72687bdf 100644
--- a/drivers/gpu/drm/loongson/lsdc_output.h
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -6,16 +6,64 @@
 #ifndef __LSDC_OUTPUT_H__
 #define __LSDC_OUTPUT_H__
 
-#include "lsdc_drv.h"
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+
+struct lsdc_output_desc {
+	u32 pipe;
+	u32 encoder_type;
+	u32 connector_type;
+	const struct drm_encoder_funcs *encoder_funcs;
+	const struct drm_encoder_helper_funcs *encoder_helper_funcs;
+	const struct drm_connector_funcs *connector_funcs;
+	const struct drm_connector_helper_funcs *connector_helper_funcs;
+	const char name[32];
+};
+
+struct lsdc_output {
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct drm_bridge *bridge;
+	const struct lsdc_output_desc *descp;
+};
+
+static inline struct lsdc_output *
+connector_to_lsdc_output(struct drm_connector *connector)
+{
+	return container_of(connector, struct lsdc_output, connector);
+}
+
+static inline struct lsdc_output *
+encoder_to_lsdc_output(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct lsdc_output, encoder);
+}
+
+extern const struct drm_connector_funcs lsdc_connector_funcs;
+extern const struct drm_connector_funcs lsdc_pipe0_hdmi_connector_funcs;
+extern const struct drm_connector_funcs lsdc_pipe1_hdmi_connector_funcs;
+extern const struct drm_connector_helper_funcs lsdc_connector_helper_funcs;
+
+extern const struct drm_encoder_funcs lsdc_pipe0_hdmi_encoder_funcs;
+extern const struct drm_encoder_funcs lsdc_pipe1_hdmi_encoder_funcs;
+extern const struct drm_encoder_helper_funcs lsdc_encoder_helper_funcs;
+extern const struct drm_encoder_helper_funcs lsdc_pipe0_hdmi_encoder_helper_funcs;
+extern const struct drm_encoder_helper_funcs lsdc_pipe1_hdmi_encoder_helper_funcs;
 
 int ls7a1000_output_init(struct drm_device *ddev,
 			 struct lsdc_display_pipe *dispipe,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
-int ls7a2000_output_init(struct drm_device *ldev,
+int ls7a2000_output_init(struct drm_device *ddev,
 			 struct lsdc_display_pipe *dispipe,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
+int lsdc_output_init(struct drm_device *ddev,
+		     struct lsdc_display_pipe *dispipe,
+		     struct i2c_adapter *ddc,
+		     unsigned int pipe);
+
 #endif
-- 
2.34.1

