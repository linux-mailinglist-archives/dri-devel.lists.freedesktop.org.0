Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC79887C0F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 10:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1620210E0A6;
	Sun, 24 Mar 2024 09:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=g.clemson.edu header.i=@g.clemson.edu header.b="gUVbsVOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E50A10E010
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 02:05:29 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-609f1f97864so38470237b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=g.clemson.edu; s=google; t=1711245928; x=1711850728;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=wPOgNnxhTH834VfbDnhoBX94/Uy935Qj2z4r4xRfUo4=;
 b=gUVbsVOqYif8F/BY/xTb/F96FbDm+MSVUIMLAr+M1FKRmNBd55ULzyGQkIsvv/XyLE
 umHC6/bGA3oXemD1Afxx7NQ27IIHVZl3ZwinJvE9ltTKkl65NRqxpTQSsSzFvb4He3eo
 ZHvl+QHzD6z/hFkSfcDUEUcKyrqVo2XWIR7d3lmR8uHaaioBBH2lbKoFwm4siTgTAgOM
 u9A4ZyudaNYxhSd6yoZ//KuSrBN7reEM8/rA20JeESN8fpRTmw4H8MPEA622IVTgCtW5
 yzR2soSY9SBikDuWTA5/+LHJ5Qldx65K5SgpKQaFSz0AnFckqUBL8PNYgNxNeJqZEqXC
 RGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711245928; x=1711850728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wPOgNnxhTH834VfbDnhoBX94/Uy935Qj2z4r4xRfUo4=;
 b=bgnlFv9gY/A2Ev6/e6nGCOnM+tlnpkuCx215O7BENVLoCRS32xeEDWIsQ9RQBNWfgs
 wv6bfRIXd+8H1DH8jAfMkaOZ6hQ5tr3Fl1D1UnzvvfdoE97gy+VC+vjEDuzgFjhhIAbF
 juUgmuHTw1ot/WtbbQk4gwsQcauJzufG2PVofdTDZNbHulipLy8J1VzhZ+QzLia+2uPs
 JDXdA5XMY6E1oQ4G4bNBIw4oq2g8EmeHzabpsExY3gzES5T31zYSeWhWuKp24pFfW0IN
 vu/G8IA5hArUvHW1FgiOvzio4WxqBotNsmPXvgG8R9rGdYMHAQZXlVFcVqr55eJjmhaQ
 lVpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzJDM5xMwd0zm0LFDyvRbEa41njrD59UFiT2m6VPVv3z+icaFs6KD9qWpLlGL66RFEDbDEGgkg5w2WPoJACtHBZ+wCRLCwsbgMcZFT9JBm
X-Gm-Message-State: AOJu0Yytgows31xo3DahpE4aI6nPIqZRcA4aL9kNThROXgoycGpq1CIM
 JMx3esJf0xDGM2wuBVkdYQMKr/xKyT/3sYXsNR3/65cxmp/18F20KxDhrqHPdODFaunnmAPcLJ7
 uuQ==
X-Google-Smtp-Source: AGHT+IH/bSFv71pzGUE+yHsfzNnaW97p76jqbAD3qiBKUlvqoRcbCN8kCAZazr99fn8RExHpgpj81w==
X-Received: by 2002:a81:7c8b:0:b0:610:ce53:e274 with SMTP id
 x133-20020a817c8b000000b00610ce53e274mr3083194ywc.14.1711245928285; 
 Sat, 23 Mar 2024 19:05:28 -0700 (PDT)
Received: from mephi-laptop.localnet (130-127-40-81.lever.resnet.clemson.edu.
 [130.127.40.81]) by smtp.gmail.com with ESMTPSA id
 et2-20020a05690c2e0200b006088f2afc2dsm506827ywb.87.2024.03.23.19.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 19:05:28 -0700 (PDT)
From: Emilio Mendoza Reyes <emendoz@g.clemson.edu>
To: neil.armstrong@linaro.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/panel: Remove redundant checks in multiple panels
Date: Sat, 23 Mar 2024 22:01:56 -0400
Message-ID: <12472820.O9o76ZdvQC@mephi-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Sun, 24 Mar 2024 09:12:44 +0000
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

From: Emilio Mendoza Reyes <emendoz@clemson.edu>

The patch ("drm/panel: Check for already prepared/enabled in drm_panel")
moved checking for (en/dis)abled and [un]prepared panels before specific
function calls to drm_panel.c.Those checks that still exist within the
panels are redundant. This patch removes those redundant checks.

Removing those checks was/is also a todo in the kernel docs
Link: https://www.kernel.org/doc/html/v6.8/gpu/todo.html#clean-up-checks-for-already-prepared-enabled-in-panels

Signed-off-by: Emilio Mendoza Reyes <emendoz@clemson.edu>
- ---
 drivers/gpu/drm/panel/panel-boe-himax8279d.c     | 12 ------------
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c   |  6 ------
 drivers/gpu/drm/panel/panel-edp.c                | 14 --------------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c    | 12 ------------
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c   | 12 ------------
 drivers/gpu/drm/panel/panel-khadas-ts050.c       |  9 ---------
 .../gpu/drm/panel/panel-kingdisplay-kd097d04.c   | 12 ------------
 .../gpu/drm/panel/panel-leadtek-ltk050h3146w.c   |  6 ------
 .../gpu/drm/panel/panel-leadtek-ltk500hd1829.c   |  6 ------
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c   |  6 ------
 .../gpu/drm/panel/panel-olimex-lcd-olinuxino.c   | 12 ------------
 .../gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 12 ------------
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 12 ------------
 drivers/gpu/drm/panel/panel-raydium-rm67191.c    | 12 ------------
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c    |  6 ------
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 16 ----------------
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c      | 12 ------------
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c  | 12 ------------
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c  |  6 ------
 drivers/gpu/drm/panel/panel-simple.c             | 14 --------------
 drivers/gpu/drm/panel/panel-sitronix-st7703.c    |  6 ------
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c     |  6 ------
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c |  6 ------
 23 files changed, 227 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index e225840b0d67..fbb64442dd83 100644
- --- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -86,9 +86,6 @@ static int boe_panel_disable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;

- -	if (!pinfo->enabled)
- -		return 0;
- -
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -105,9 +102,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;

- -	if (!pinfo->prepared)
- -		return 0;
- -
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -131,9 +125,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;

- -	if (pinfo->prepared)
- -		return 0;
- -
 	gpiod_set_value(pinfo->pp18_gpio, 1);
 	/* T1: 5ms - 6ms */
 	usleep_range(5000, 6000);
@@ -194,9 +185,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int ret;

- -	if (pinfo->enabled)
- -		return 0;
- -
 	usleep_range(120000, 121000);

 	ret = mipi_dsi_dcs_set_display_on(pinfo->link);
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 0ffe8f8c01de..1fece22d144f 100644
- --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1450,9 +1450,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);

- -	if (!boe->prepared)
- -		return 0;
- -
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -1481,9 +1478,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;

- -	if (boe->prepared)
- -		return 0;
- -
 	gpiod_set_value(boe->enable_gpio, 0);
 	usleep_range(1000, 1500);

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d58f90bc48fb..9fcea02cb5db 100644
- --- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -398,9 +398,6 @@ static int panel_edp_disable(struct drm_panel *panel)
 {
 	struct panel_edp *p = to_panel_edp(panel);

- -	if (!p->enabled)
- -		return 0;
- -
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);

@@ -426,10 +423,6 @@ static int panel_edp_unprepare(struct drm_panel *panel)
 	struct panel_edp *p = to_panel_edp(panel);
 	int ret;

- -	/* Unpreparing when already unprepared is a no-op */
- -	if (!p->prepared)
- -		return 0;
- -
 	ret = pm_runtime_put_sync_suspend(panel->dev);
 	if (ret < 0)
 		return ret;
@@ -548,10 +541,6 @@ static int panel_edp_prepare(struct drm_panel *panel)
 	struct panel_edp *p = to_panel_edp(panel);
 	int ret;

- -	/* Preparing when already prepared is a no-op */
- -	if (p->prepared)
- -		return 0;
- -
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
@@ -568,9 +557,6 @@ static int panel_edp_enable(struct drm_panel *panel)
 	struct panel_edp *p = to_panel_edp(panel);
 	unsigned int delay;

- -	if (p->enabled)
- -		return 0;
- -
 	delay = p->desc->delay.enable;

 	/*
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 485178a99910..0eb2272a9b69 100644
- --- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -65,9 +65,6 @@ static int innolux_panel_disable(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);

- -	if (!innolux->enabled)
- -		return 0;
- -
 	innolux->enabled = false;

 	return 0;
@@ -78,9 +75,6 @@ static int innolux_panel_unprepare(struct drm_panel *panel)
 	struct innolux_panel *innolux = to_innolux_panel(panel);
 	int err;

- -	if (!innolux->prepared)
- -		return 0;
- -
 	err = mipi_dsi_dcs_set_display_off(innolux->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -114,9 +108,6 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	struct innolux_panel *innolux = to_innolux_panel(panel);
 	int err;

- -	if (innolux->prepared)
- -		return 0;
- -
 	gpiod_set_value_cansleep(innolux->enable_gpio, 0);

 	err = regulator_bulk_enable(innolux->desc->num_supplies,
@@ -193,9 +184,6 @@ static int innolux_panel_enable(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);

- -	if (innolux->enabled)
- -		return 0;
- -
 	innolux->enabled = true;

 	return 0;
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index f9a69f347068..694ee1109d1f 100644
- --- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -176,9 +176,6 @@ static int jdi_panel_disable(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_jdi_panel(panel);

- -	if (!jdi->enabled)
- -		return 0;
- -
 	backlight_disable(jdi->backlight);

 	jdi->enabled = false;
@@ -192,9 +189,6 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;

- -	if (!jdi->prepared)
- -		return 0;
- -
 	jdi_panel_off(jdi);

 	ret = regulator_bulk_disable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
@@ -218,9 +212,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	struct device *dev = &jdi->dsi->dev;
 	int ret;

- -	if (jdi->prepared)
- -		return 0;
- -
 	ret = regulator_bulk_enable(ARRAY_SIZE(jdi->supplies), jdi->supplies);
 	if (ret < 0) {
 		dev_err(dev, "regulator enable failed, %d\n", ret);
@@ -272,9 +263,6 @@ static int jdi_panel_enable(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_jdi_panel(panel);

- -	if (jdi->enabled)
- -		return 0;
- -
 	backlight_enable(jdi->backlight);

 	jdi->enabled = true;
diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index b942a0162274..10522b2c3e2a 100644
- --- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -584,9 +584,6 @@ static int khadas_ts050_panel_prepare(struct drm_panel *panel)
 	unsigned int i;
 	int err;

- -	if (khadas_ts050->prepared)
- -		return 0;
- -
 	gpiod_set_value_cansleep(khadas_ts050->enable_gpio, 0);

 	err = regulator_enable(khadas_ts050->supply);
@@ -667,9 +664,6 @@ static int khadas_ts050_panel_unprepare(struct drm_panel *panel)
 	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
 	int err;

- -	if (!khadas_ts050->prepared)
- -		return 0;
- -
 	khadas_ts050->prepared = false;

 	err = mipi_dsi_dcs_enter_sleep_mode(khadas_ts050->link);
@@ -702,9 +696,6 @@ static int khadas_ts050_panel_disable(struct drm_panel *panel)
 	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
 	int err;

- -	if (!khadas_ts050->enabled)
- -		return 0;
- -
 	err = mipi_dsi_dcs_set_display_off(khadas_ts050->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 17f8d80cf2b3..6884ff902ca4 100644
- --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -185,9 +185,6 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
 	int err;

- -	if (!kingdisplay->enabled)
- -		return 0;
- -
 	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -202,9 +199,6 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
 	int err;

- -	if (!kingdisplay->prepared)
- -		return 0;
- -
 	err = mipi_dsi_dcs_enter_sleep_mode(kingdisplay->link);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
@@ -231,9 +225,6 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	int err, regulator_err;
 	unsigned int i;

- -	if (kingdisplay->prepared)
- -		return 0;
- -
 	gpiod_set_value_cansleep(kingdisplay->enable_gpio, 0);

 	err = regulator_enable(kingdisplay->supply);
@@ -293,9 +284,6 @@ static int kingdisplay_panel_enable(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);

- -	if (kingdisplay->enabled)
- -		return 0;
- -
 	kingdisplay->enabled = true;

 	return 0;
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 9d87cc1a357e..57de85a9ff6c 100644
- --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -522,9 +522,6 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;

- -	if (!ctx->prepared)
- -		return 0;
- -
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0) {
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -551,9 +548,6 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;

- -	if (ctx->prepared)
- -		return 0;
- -
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vci);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index a4c9a5cb9811..954e884e7431 100644
- --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -492,9 +492,6 @@ static int ltk500hd1829_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;

- -	if (!ctx->prepared)
- -		return 0;
- -
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", ret);
@@ -522,9 +519,6 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 	unsigned int i;
 	int ret;

- -	if (ctx->prepared)
- -		return 0;
- -
 	ret = regulator_enable(ctx->vcc);
 	if (ret < 0) {
 		dev_err(ctx->dev, "Failed to enable vci supply: %d\n", ret);
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 33fb3d715e54..10b10781dd7e 100644
- --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -119,9 +119,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	int ret;

- -	if (!pinfo->prepared)
- -		return 0;
- -
 	/* send off cmds */
 	ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
 				 pinfo->desc->num_off_cmds);
@@ -179,9 +176,6 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	int err;

- -	if (pinfo->prepared)
- -		return 0;
- -
 	err = nt36672a_panel_power_on(pinfo);
 	if (err < 0)
 		goto poweroff;
diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 4819ada69482..37b0dd93476f 100644
- --- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -82,9 +82,6 @@ static int lcd_olinuxino_disable(struct drm_panel *panel)
 {
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);

- -	if (!lcd->enabled)
- -		return 0;
- -
 	lcd->enabled = false;

 	return 0;
@@ -94,9 +91,6 @@ static int lcd_olinuxino_unprepare(struct drm_panel *panel)
 {
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);

- -	if (!lcd->prepared)
- -		return 0;
- -
 	gpiod_set_value_cansleep(lcd->enable_gpio, 0);
 	regulator_disable(lcd->supply);

@@ -110,9 +104,6 @@ static int lcd_olinuxino_prepare(struct drm_panel *panel)
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);
 	int ret;

- -	if (lcd->prepared)
- -		return 0;
- -
 	ret = regulator_enable(lcd->supply);
 	if (ret < 0)
 		return ret;
@@ -127,9 +118,6 @@ static int lcd_olinuxino_enable(struct drm_panel *panel)
 {
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);

- -	if (lcd->enabled)
- -		return 0;
- -
 	lcd->enabled = true;

 	return 0;
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 493e0504f6f7..7445a9d38076 100644
- --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -37,9 +37,6 @@ static int osd101t2587_panel_disable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;

- -	if (!osd101t2587->enabled)
- -		return 0;
- -
 	ret = mipi_dsi_shutdown_peripheral(osd101t2587->dsi);

 	osd101t2587->enabled = false;
@@ -51,9 +48,6 @@ static int osd101t2587_panel_unprepare(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);

- -	if (!osd101t2587->prepared)
- -		return 0;
- -
 	regulator_disable(osd101t2587->supply);
 	osd101t2587->prepared = false;

@@ -65,9 +59,6 @@ static int osd101t2587_panel_prepare(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;

- -	if (osd101t2587->prepared)
- -		return 0;
- -
 	ret = regulator_enable(osd101t2587->supply);
 	if (!ret)
 		osd101t2587->prepared = true;
@@ -80,9 +71,6 @@ static int osd101t2587_panel_enable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;

- -	if (osd101t2587->enabled)
- -		return 0;
- -
 	ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 8ba6d8287938..bc63469d231a 100644
- --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -55,9 +55,6 @@ static int wuxga_nt_panel_disable(struct drm_panel *panel)
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
 	int mipi_ret, bl_ret = 0;

- -	if (!wuxga_nt->enabled)
- -		return 0;
- -
 	mipi_ret = mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);

 	wuxga_nt->enabled = false;
@@ -69,9 +66,6 @@ static int wuxga_nt_panel_unprepare(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);

- -	if (!wuxga_nt->prepared)
- -		return 0;
- -
 	regulator_disable(wuxga_nt->supply);
 	wuxga_nt->earliest_wake = ktime_add_ms(ktime_get_real(), MIN_POFF_MS);
 	wuxga_nt->prepared = false;
@@ -85,9 +79,6 @@ static int wuxga_nt_panel_prepare(struct drm_panel *panel)
 	int ret;
 	s64 enablewait;

- -	if (wuxga_nt->prepared)
- -		return 0;
- -
 	/*
 	 * If the user re-enabled the panel before the required off-time then
 	 * we need to wait the remaining period before re-enabling regulator
@@ -131,9 +122,6 @@ static int wuxga_nt_panel_enable(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);

- -	if (wuxga_nt->enabled)
- -		return 0;
- -
 	wuxga_nt->enabled = true;

 	return 0;
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index dbb1ed4efbed..cfcf99c940f5 100644
- --- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -267,9 +267,6 @@ static int rad_panel_prepare(struct drm_panel *panel)
 	struct rad_panel *rad = to_rad_panel(panel);
 	int ret;

- -	if (rad->prepared)
- -		return 0;
- -
 	ret = regulator_bulk_enable(rad->num_supplies, rad->supplies);
 	if (ret)
 		return ret;
@@ -291,9 +288,6 @@ static int rad_panel_unprepare(struct drm_panel *panel)
 	struct rad_panel *rad = to_rad_panel(panel);
 	int ret;

- -	if (!rad->prepared)
- -		return 0;
- -
 	/*
 	 * Right after asserting the reset, we need to release it, so that the
 	 * touch driver can have an active connection with the touch controller
@@ -322,9 +316,6 @@ static int rad_panel_enable(struct drm_panel *panel)
 	int color_format = color_format_from_dsi_format(dsi->format);
 	int ret;

- -	if (rad->enabled)
- -		return 0;
- -
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

 	ret = rad_panel_push_cmd_list(dsi);
@@ -406,9 +397,6 @@ static int rad_panel_disable(struct drm_panel *panel)
 	struct device *dev = &dsi->dev;
 	int ret;

- -	if (!rad->enabled)
- -		return 0;
- -
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

 	backlight_disable(rad->backlight);
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
index a613ba5b816c..ccd811c97c4a 100644
- --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -171,9 +171,6 @@ static int rm692e5_prepare(struct drm_panel *panel)
 	struct device *dev = &ctx->dsi->dev;
 	int ret;

- -	if (ctx->prepared)
- -		return 0;
- -
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable regulators: %d\n", ret);
@@ -222,9 +219,6 @@ static int rm692e5_unprepare(struct drm_panel *panel)
 {
 	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);

- -	if (!ctx->prepared)
- -		return 0;
- -
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 76c2a8f6718c..6a3be5bd9a44 100644
- --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -139,10 +139,6 @@ static int atana33xc20_disable(struct drm_panel *panel)
 {
 	struct atana33xc20_panel *p = to_atana33xc20(panel);

- -	/* Disabling when already disabled is a no-op */
- -	if (!p->enabled)
- -		return 0;
- -
 	gpiod_set_value_cansleep(p->el_on3_gpio, 0);
 	p->el_on3_off_time = ktime_get_boottime();
 	p->enabled = false;
@@ -169,10 +165,6 @@ static int atana33xc20_enable(struct drm_panel *panel)
 {
 	struct atana33xc20_panel *p = to_atana33xc20(panel);

- -	/* Enabling when already enabled is a no-op */
- -	if (p->enabled)
- -		return 0;
- -
 	/*
 	 * Once EL_ON3 drops we absolutely need a power cycle before the next
 	 * enable or the backlight will never come on again. The code ensures
@@ -201,10 +193,6 @@ static int atana33xc20_unprepare(struct drm_panel *panel)
 	struct atana33xc20_panel *p = to_atana33xc20(panel);
 	int ret;

- -	/* Unpreparing when already unprepared is a no-op */
- -	if (!p->prepared)
- -		return 0;
- -
 	/*
 	 * Purposely do a put_sync, don't use autosuspend. The panel's tcon
 	 * seems to sometimes crash when you stop giving it data and this is
@@ -226,10 +214,6 @@ static int atana33xc20_prepare(struct drm_panel *panel)
 	struct atana33xc20_panel *p = to_atana33xc20(panel);
 	int ret;

- -	/* Preparing when already prepared is a no-op */
- -	if (p->prepared)
- -		return 0;
- -
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 658c7c040570..8fb1ba69bd1d 100644
- --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -126,9 +126,6 @@ static int seiko_panel_disable(struct drm_panel *panel)
 {
 	struct seiko_panel *p = to_seiko_panel(panel);

- -	if (!p->enabled)
- -		return 0;
- -
 	p->enabled = false;

 	return 0;
@@ -138,9 +135,6 @@ static int seiko_panel_unprepare(struct drm_panel *panel)
 {
 	struct seiko_panel *p = to_seiko_panel(panel);

- -	if (!p->prepared)
- -		return 0;
- -
 	gpiod_set_value_cansleep(p->enable_gpio, 0);

 	regulator_disable(p->avdd);
@@ -160,9 +154,6 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 	struct seiko_panel *p = to_seiko_panel(panel);
 	int err;

- -	if (p->prepared)
- -		return 0;
- -
 	err = regulator_enable(p->dvdd);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enable dvdd: %d\n", err);
@@ -193,9 +184,6 @@ static int seiko_panel_enable(struct drm_panel *panel)
 {
 	struct seiko_panel *p = to_seiko_panel(panel);

- -	if (p->enabled)
- -		return 0;
- -
 	p->enabled = true;

 	return 0;
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 14851408a5e1..cf820d4e26f7 100644
- --- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -89,9 +89,6 @@ static int sharp_panel_disable(struct drm_panel *panel)
 {
 	struct sharp_panel *sharp = to_sharp_panel(panel);

- -	if (!sharp->enabled)
- -		return 0;
- -
 	sharp->enabled = false;

 	return 0;
@@ -102,9 +99,6 @@ static int sharp_panel_unprepare(struct drm_panel *panel)
 	struct sharp_panel *sharp = to_sharp_panel(panel);
 	int err;

- -	if (!sharp->prepared)
- -		return 0;
- -
 	sharp_wait_frames(sharp, 4);

 	err = mipi_dsi_dcs_set_display_off(sharp->link1);
@@ -164,9 +158,6 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 	u8 format = MIPI_DCS_PIXEL_FMT_24BIT;
 	int err;

- -	if (sharp->prepared)
- -		return 0;
- -
 	err = regulator_enable(sharp->supply);
 	if (err < 0)
 		return err;
@@ -251,9 +242,6 @@ static int sharp_panel_enable(struct drm_panel *panel)
 {
 	struct sharp_panel *sharp = to_sharp_panel(panel);

- -	if (sharp->enabled)
- -		return 0;
- -
 	sharp->enabled = true;

 	return 0;
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 855e64444daa..674aeb44a40a 100644
- --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -99,9 +99,6 @@ static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;

- -	if (!sharp_nt->prepared)
- -		return 0;
- -
 	ret = sharp_nt_panel_off(sharp_nt);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -122,9 +119,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;

- -	if (sharp_nt->prepared)
- -		return 0;
- -
 	ret = regulator_enable(sharp_nt->supply);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 20e3df1c59d4..3498709dd8c5 100644
- --- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -290,9 +290,6 @@ static int panel_simple_disable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);

- -	if (!p->enabled)
- -		return 0;
- -
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);

@@ -320,10 +317,6 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 	struct panel_simple *p = to_panel_simple(panel);
 	int ret;

- -	/* Unpreparing when already unprepared is a no-op */
- -	if (!p->prepared)
- -		return 0;
- -
 	pm_runtime_mark_last_busy(panel->dev);
 	ret = pm_runtime_put_autosuspend(panel->dev);
 	if (ret < 0)
@@ -359,10 +352,6 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	struct panel_simple *p = to_panel_simple(panel);
 	int ret;

- -	/* Preparing when already prepared is a no-op */
- -	if (p->prepared)
- -		return 0;
- -
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
@@ -378,9 +367,6 @@ static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);

- -	if (p->enabled)
- -		return 0;
- -
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index a3e142f156d5..3767f381d29c 100644
- --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -666,9 +666,6 @@ static int st7703_unprepare(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);

- -	if (!ctx->prepared)
- -		return 0;
- -
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
@@ -682,9 +679,6 @@ static int st7703_prepare(struct drm_panel *panel)
 	struct st7703 *ctx = panel_to_st7703(panel);
 	int ret;

- -	if (ctx->prepared)
- -		return 0;
- -
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index d8487bc6d611..fba06775ba2b 100644
- --- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -39,9 +39,6 @@ static int tdo_tl070wsh30_panel_prepare(struct drm_panel *panel)
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = to_tdo_tl070wsh30_panel(panel);
 	int err;

- -	if (tdo_tl070wsh30->prepared)
- -		return 0;
- -
 	err = regulator_enable(tdo_tl070wsh30->supply);
 	if (err < 0)
 		return err;
@@ -84,9 +81,6 @@ static int tdo_tl070wsh30_panel_unprepare(struct drm_panel *panel)
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = to_tdo_tl070wsh30_panel(panel);
 	int err;

- -	if (!tdo_tl070wsh30->prepared)
- -		return 0;
- -
 	err = mipi_dsi_dcs_set_display_off(tdo_tl070wsh30->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 8670386498a4..693f2342959b 100644
- --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -136,9 +136,6 @@ static int xpp055c272_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;

- -	if (!ctx->prepared)
- -		return 0;
- -
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -163,9 +160,6 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;

- -	if (ctx->prepared)
- -		return 0;
- -
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vci);
 	if (ret < 0) {
- --
2.44.0

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTcaZbABwnECYA0cZI0LAN3EqikFgUCZf+JlAAKCRA0LAN3Eqik
FmRWAP4hfRizwWg8aL4uyJ1t1ed5CxbNsGZJo8MoZre7k2z8YAEA/8zOll7HPzG0
t2MMzZ+MOVYJ4ZMBIbbzczEUnI+q1As=
=UPQX
-----END PGP SIGNATURE-----



