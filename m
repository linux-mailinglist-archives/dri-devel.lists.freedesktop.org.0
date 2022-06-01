Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACF53A035
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DF810E95E;
	Wed,  1 Jun 2022 09:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F1410E957
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:16 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id g12so1321509lja.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lHg+elX4lln4pSU+PqI79Ffz0qaGQYq82S03QUpNFuI=;
 b=qrs5V6KqNR3h495zI7obnWysAHQrxjB+jAjYznWqtjtLLHPJomCtCMBVFhmwt+Qu4S
 sjnah9uRGBrbRIhGh4KlH4rsyJf48VFBa39/iYXmX8qxrnOon35z1MkYZIf0+i9HB0BS
 mx3c2yczbayBktEqCmqGhc0qZoXNvNB0Y2HGktcnswletPDmpYmTvNOdNjE1TI8Mn2oi
 CvJDdT/FSFDRMlCC8rT595OX1ykwYajwbHQmllp2UylTryxNnB9Ue8rIJqcgnzqU5p1P
 M9YtS858+CP3XANmvgWr8+Phps2ShkeI1vt/9U7OnmgbcO2mVC/cj8c4ugchNIagOqD/
 czZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lHg+elX4lln4pSU+PqI79Ffz0qaGQYq82S03QUpNFuI=;
 b=lxxjw2A19WGTXxT9qCQLAeZF0otmHQxfp9ZyvbMRb3WY6a8SuJ9uhxLH/2XY6YBNm/
 ET222DCAQnNNlsYQEON8iXzFXdM6C17WgsmpVgmwyGO1ITZ+UtsCstl/4XLVWg+4b2vF
 g5/Bk1TPa7t3HXtW7fJGSRmZvoqZFFeCt0x3UtfmRHrTx2oF6okkyQ3/leSDtR578yYL
 19sSlcdJr35Mk73Udk8+Jg7G+YO06hqzZtOJLu6SxNdqNQDHuUZDmritB1PonTcwAfPm
 BqravcmLJvFvbSj2u0ldgpRk8wohwK5wjs+MMjZ936hyXocnM/86aNPC43+9Yq/QVNgQ
 +ccg==
X-Gm-Message-State: AOAM531o3cJCDb4IUb3+vFf5O7T/kUuX76O08mGyPHAGTaUqMOIMrNH8
 UNA/5nYd418iTIhYsP8a9Pf2cyeV2pg=
X-Google-Smtp-Source: ABdhPJwv2N8OetYlAVmCOWlnojmkCrBDZofM8X1kpQUq/C99HK294W0eT0/vo0V0q+7H/rvSO+vxXQ==
X-Received: by 2002:a05:651c:102b:b0:255:5ca3:8983 with SMTP id
 w11-20020a05651c102b00b002555ca38983mr4605670ljm.423.1654075393959; 
 Wed, 01 Jun 2022 02:23:13 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:13 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/gma500: Use gma_ prefix for our i2c abstraction
Date: Wed,  1 Jun 2022 11:23:04 +0200
Message-Id: <20220601092311.22648-2-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
References: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

psb_intel_i2c_chan is used by all chips so use the correct prefix.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_crt.c     |  4 ++--
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c    |  6 +++---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c    | 14 +++++---------
 drivers/gpu/drm/gma500/intel_i2c.c         | 22 +++++++++++-----------
 drivers/gpu/drm/gma500/oaktrail_lvds.c     |  2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 12 ++++++------
 drivers/gpu/drm/gma500/psb_drv.h           |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h     | 12 ++++++------
 drivers/gpu/drm/gma500/psb_intel_lvds.c    | 16 ++++++++--------
 9 files changed, 43 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 6bcd18c63c31..36c72a379d9f 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -194,7 +194,7 @@ static void cdv_intel_crt_destroy(struct drm_connector *connector)
 	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
-	psb_intel_i2c_destroy(gma_encoder->ddc_bus);
+	gma_i2c_destroy(gma_encoder->ddc_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
 }
@@ -267,7 +267,7 @@ void cdv_intel_crt_init(struct drm_device *dev,
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 
 	/* Set up the DDC bus. */
-	gma_encoder->ddc_bus = psb_intel_i2c_create(dev, GPIOA, "CRTDDC_A");
+	gma_encoder->ddc_bus = gma_i2c_create(dev, GPIOA, "CRTDDC_A");
 	if (!gma_encoder->ddc_bus) {
 		dev_printk(KERN_ERR, dev->dev, "DDC bus registration failed.\n");
 		goto failed_ddc;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 8987e555e113..e87272c9d358 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -245,7 +245,7 @@ static void cdv_hdmi_destroy(struct drm_connector *connector)
 	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
-	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
+	gma_i2c_destroy(gma_encoder->i2c_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
 }
@@ -342,8 +342,8 @@ void cdv_hdmi_init(struct drm_device *dev,
 		break;
 	}
 
-	gma_encoder->i2c_bus = psb_intel_i2c_create(dev,
-				ddc_bus, (reg == SDVOB) ? "HDMIB" : "HDMIC");
+	gma_encoder->i2c_bus = gma_i2c_create(dev, ddc_bus,
+					(reg == SDVOB) ? "HDMIB" : "HDMIC");
 
 	if (!gma_encoder->i2c_bus) {
 		dev_err(dev->dev, "No ddc adapter available!\n");
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 98d9f5483a7c..02dedf5dfa62 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -329,7 +329,7 @@ static void cdv_intel_lvds_destroy(struct drm_connector *connector)
 	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
-	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
+	gma_i2c_destroy(gma_encoder->i2c_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
 }
@@ -550,9 +550,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	 * Set up I2C bus
 	 * FIXME: distroy i2c_bus when exit
 	 */
-	gma_encoder->i2c_bus = psb_intel_i2c_create(dev,
-							 GPIOB,
-							 "LVDSBLC_B");
+	gma_encoder->i2c_bus = gma_i2c_create(dev, GPIOB, "LVDSBLC_B");
 	if (!gma_encoder->i2c_bus) {
 		dev_printk(KERN_ERR,
 			dev->dev, "I2C bus registration failed.\n");
@@ -572,9 +570,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	 */
 
 	/* Set up the DDC bus. */
-	gma_encoder->ddc_bus = psb_intel_i2c_create(dev,
-							 GPIOC,
-							 "LVDSDDC_C");
+	gma_encoder->ddc_bus = gma_i2c_create(dev, GPIOC, "LVDSDDC_C");
 	if (!gma_encoder->ddc_bus) {
 		dev_printk(KERN_ERR, dev->dev,
 			   "DDC bus registration " "failed.\n");
@@ -652,10 +648,10 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 failed_find:
 	mutex_unlock(&dev->mode_config.mutex);
 	pr_err("Failed find\n");
-	psb_intel_i2c_destroy(gma_encoder->ddc_bus);
+	gma_i2c_destroy(gma_encoder->ddc_bus);
 failed_ddc:
 	pr_err("Failed DDC\n");
-	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
+	gma_i2c_destroy(gma_encoder->i2c_bus);
 failed_blc_i2c:
 	pr_err("Failed BLC\n");
 	drm_encoder_cleanup(encoder);
diff --git a/drivers/gpu/drm/gma500/intel_i2c.c b/drivers/gpu/drm/gma500/intel_i2c.c
index 5e1b4d70c317..6e9e2061ff3b 100644
--- a/drivers/gpu/drm/gma500/intel_i2c.c
+++ b/drivers/gpu/drm/gma500/intel_i2c.c
@@ -22,7 +22,7 @@
 
 static int get_clock(void *data)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	struct drm_device *dev = chan->drm_dev;
 	u32 val;
 
@@ -32,7 +32,7 @@ static int get_clock(void *data)
 
 static int get_data(void *data)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	struct drm_device *dev = chan->drm_dev;
 	u32 val;
 
@@ -42,7 +42,7 @@ static int get_data(void *data)
 
 static void set_clock(void *data, int state_high)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	struct drm_device *dev = chan->drm_dev;
 	u32 reserved = 0, clock_bits;
 
@@ -62,7 +62,7 @@ static void set_clock(void *data, int state_high)
 
 static void set_data(void *data, int state_high)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	struct drm_device *dev = chan->drm_dev;
 	u32 reserved = 0, data_bits;
 
@@ -83,7 +83,7 @@ static void set_data(void *data, int state_high)
 }
 
 /**
- * psb_intel_i2c_create - instantiate an Intel i2c bus using the specified GPIO reg
+ * gma_i2c_create - instantiate an Intel i2c bus using the specified GPIO reg
  * @dev: DRM device
  * @reg: GPIO reg to use
  * @name: name for this bus
@@ -102,12 +102,12 @@ static void set_data(void *data, int state_high)
  *   %GPIOH
  * see PRM for details on how these different busses are used.
  */
-struct psb_intel_i2c_chan *psb_intel_i2c_create(struct drm_device *dev,
-					const u32 reg, const char *name)
+struct gma_i2c_chan *gma_i2c_create(struct drm_device *dev, const u32 reg,
+				    const char *name)
 {
-	struct psb_intel_i2c_chan *chan;
+	struct gma_i2c_chan *chan;
 
-	chan = kzalloc(sizeof(struct psb_intel_i2c_chan), GFP_KERNEL);
+	chan = kzalloc(sizeof(struct gma_i2c_chan), GFP_KERNEL);
 	if (!chan)
 		goto out_free;
 
@@ -143,12 +143,12 @@ struct psb_intel_i2c_chan *psb_intel_i2c_create(struct drm_device *dev,
 }
 
 /**
- * psb_intel_i2c_destroy - unregister and free i2c bus resources
+ * gma_i2c_destroy - unregister and free i2c bus resources
  * @chan: channel to free
  *
  * Unregister the adapter from the i2c layer, then free the structure.
  */
-void psb_intel_i2c_destroy(struct psb_intel_i2c_chan *chan)
+void gma_i2c_destroy(struct gma_i2c_chan *chan)
 {
 	if (!chan)
 		return;
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index aed5de8f8245..58b38e359098 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -408,7 +408,7 @@ void oaktrail_lvds_init(struct drm_device *dev,
 
 	dev_dbg(dev->dev, "No LVDS modes found, disabling.\n");
 	if (gma_encoder->ddc_bus) {
-		psb_intel_i2c_destroy(gma_encoder->ddc_bus);
+		gma_i2c_destroy(gma_encoder->ddc_bus);
 		gma_encoder->ddc_bus = NULL;
 	}
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
index d1ae91fcd224..9a6de6ff8b0c 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
@@ -65,7 +65,7 @@
 
 static int get_clock(void *data)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	u32 val;
 
 	val = LPC_READ_REG(chan, RGIO);
@@ -79,7 +79,7 @@ static int get_clock(void *data)
 
 static int get_data(void *data)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	u32 val;
 
 	val = LPC_READ_REG(chan, RGIO);
@@ -93,7 +93,7 @@ static int get_data(void *data)
 
 static void set_clock(void *data, int state_high)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	u32 val;
 
 	if (state_high) {
@@ -112,7 +112,7 @@ static void set_clock(void *data, int state_high)
 
 static void set_data(void *data, int state_high)
 {
-	struct psb_intel_i2c_chan *chan = data;
+	struct gma_i2c_chan *chan = data;
 	u32 val;
 
 	if (state_high) {
@@ -134,9 +134,9 @@ void oaktrail_lvds_i2c_init(struct drm_encoder *encoder)
 	struct drm_device *dev = encoder->dev;
 	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_i2c_chan *chan;
+	struct gma_i2c_chan *chan;
 
-	chan = kzalloc(sizeof(struct psb_intel_i2c_chan), GFP_KERNEL);
+	chan = kzalloc(sizeof(struct gma_i2c_chan), GFP_KERNEL);
 	if (!chan)
 		return;
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 0ddfec1a0851..0ea3d23575f3 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -469,7 +469,7 @@ struct drm_psb_private {
 	struct drm_display_mode *sdvo_lvds_vbt_mode;
 
 	struct bdb_lvds_backlight *lvds_bl; /* LVDS backlight info from VBT */
-	struct psb_intel_i2c_chan *lvds_i2c_bus; /* FIXME: Remove this? */
+	struct gma_i2c_chan *lvds_i2c_bus; /* FIXME: Remove this? */
 
 	/* Feature bits from the VBIOS */
 	unsigned int int_tv_support:1;
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index db3e757328fe..72585a3df25d 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -78,7 +78,7 @@ struct psb_intel_mode_device {
 	uint32_t saveBLC_PWM_CTL;
 };
 
-struct psb_intel_i2c_chan {
+struct gma_i2c_chan {
 	/* for getting at dev. private (mmio etc.) */
 	struct drm_device *drm_dev;
 	u32 reg;		/* GPIO reg */
@@ -103,8 +103,8 @@ struct gma_encoder {
 
 	/* FIXME: Either make SDVO and LVDS store it's i2c here or give CDV it's
 	   own set of output privates */
-	struct psb_intel_i2c_chan *i2c_bus;
-	struct psb_intel_i2c_chan *ddc_bus;
+	struct gma_i2c_chan *i2c_bus;
+	struct gma_i2c_chan *ddc_bus;
 };
 
 struct gma_connector {
@@ -176,9 +176,9 @@ struct gma_crtc {
 #define to_psb_intel_framebuffer(x)	\
 		container_of(x, struct psb_intel_framebuffer, base)
 
-struct psb_intel_i2c_chan *psb_intel_i2c_create(struct drm_device *dev,
-					const u32 reg, const char *name);
-void psb_intel_i2c_destroy(struct psb_intel_i2c_chan *chan);
+struct gma_i2c_chan *gma_i2c_create(struct drm_device *dev, const u32 reg,
+				    const char *name);
+void gma_i2c_destroy(struct gma_i2c_chan *chan);
 int psb_intel_ddc_get_modes(struct drm_connector *connector,
 			    struct i2c_adapter *adapter);
 extern bool psb_intel_ddc_probe(struct i2c_adapter *adapter);
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index cad00380b386..07631891531a 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -49,8 +49,8 @@ struct psb_intel_lvds_priv {
 	uint32_t savePFIT_PGM_RATIOS;
 	uint32_t saveBLC_PWM_CTL;
 
-	struct psb_intel_i2c_chan *i2c_bus;
-	struct psb_intel_i2c_chan *ddc_bus;
+	struct gma_i2c_chan *i2c_bus;
+	struct gma_i2c_chan *ddc_bus;
 };
 
 
@@ -90,7 +90,7 @@ static int psb_lvds_i2c_set_brightness(struct drm_device *dev,
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
-	struct psb_intel_i2c_chan *lvds_i2c_bus = dev_priv->lvds_i2c_bus;
+	struct gma_i2c_chan *lvds_i2c_bus = dev_priv->lvds_i2c_bus;
 	u8 out_buf[2];
 	unsigned int blc_i2c_brightness;
 
@@ -525,7 +525,7 @@ void psb_intel_lvds_destroy(struct drm_connector *connector)
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct psb_intel_lvds_priv *lvds_priv = gma_encoder->dev_priv;
 
-	psb_intel_i2c_destroy(lvds_priv->ddc_bus);
+	gma_i2c_destroy(lvds_priv->ddc_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
 }
@@ -695,7 +695,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	 * Set up I2C bus
 	 * FIXME: distroy i2c_bus when exit
 	 */
-	lvds_priv->i2c_bus = psb_intel_i2c_create(dev, GPIOB, "LVDSBLC_B");
+	lvds_priv->i2c_bus = gma_i2c_create(dev, GPIOB, "LVDSBLC_B");
 	if (!lvds_priv->i2c_bus) {
 		dev_printk(KERN_ERR,
 			dev->dev, "I2C bus registration failed.\n");
@@ -715,7 +715,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	 */
 
 	/* Set up the DDC bus. */
-	lvds_priv->ddc_bus = psb_intel_i2c_create(dev, GPIOC, "LVDSDDC_C");
+	lvds_priv->ddc_bus = gma_i2c_create(dev, GPIOC, "LVDSDDC_C");
 	if (!lvds_priv->ddc_bus) {
 		dev_printk(KERN_ERR, dev->dev,
 			   "DDC bus registration " "failed.\n");
@@ -786,9 +786,9 @@ void psb_intel_lvds_init(struct drm_device *dev,
 
 failed_find:
 	mutex_unlock(&dev->mode_config.mutex);
-	psb_intel_i2c_destroy(lvds_priv->ddc_bus);
+	gma_i2c_destroy(lvds_priv->ddc_bus);
 failed_ddc:
-	psb_intel_i2c_destroy(lvds_priv->i2c_bus);
+	gma_i2c_destroy(lvds_priv->i2c_bus);
 failed_blc_i2c:
 	drm_encoder_cleanup(encoder);
 	drm_connector_cleanup(connector);
-- 
2.36.1

