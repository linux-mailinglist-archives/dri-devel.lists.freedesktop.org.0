Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC217180D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FAE6ECC5;
	Thu, 27 Feb 2020 12:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276CA6E885
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p18so2979643wre.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5f1Pooy00AQQBl1T3bhqw3NWEQnIeGJmfgCAqZdVpes=;
 b=naP9EBM/phmgv8EK80mVVAXMPTmFsf+TLSEG7qtQYZWcalKFHt5+155A6UfNIESuwf
 O1UQ2mJOmjpYh4lYqElypgsppnAcNeZLU1H7DLGJdgU8icfMzyhp5OZzDl/MWtzRJz+1
 8RxOzW/t29eYp4MRWj9HLix10iOitAL628WozW7MPU0D/heuB0KSKU/m0PbRBFWElIP7
 DiZugdRMyLor3mn/A0lnt2cO3SNkynaWEWzVFMtIaOTsFz5tiELIRjzfMSlEbIyeVOJh
 XKv763cwgBKLeKSc89z1FVEbfeGMg0tlbmD0yUQoL3KJ7j35rP0AgreyGskQih/mB32x
 0IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5f1Pooy00AQQBl1T3bhqw3NWEQnIeGJmfgCAqZdVpes=;
 b=OyMZ3Xh/LYkOQxjvkkpvL3RtI46DgGvTOZOen/N78Ism6QARSBAz++VnQjv2rBf8AF
 HvfmC46n/1pI+B94nb2OZrOg6nfHmTDNP5oCLctFuASgluH5A5djpa3z+0W98/MuPfNW
 ASCDMNuwgSXxAig72kBxM4ongzWUy9uavqAapagKscvqZZNLegHW5msIdPk8ZuBQa5CW
 tD5bmr/r+LLlBIDwgtFVVL1ANq52f23m1ehIbJ014ERy07voHvWgxuU2Ji2JiNA/SE2V
 LiWzWxreuSRVctfIWruitlnNAEoz+TNchqVOs+wv9YF+cVRL+GLLKMA7xmYGEVqr52Mz
 I2UQ==
X-Gm-Message-State: APjAAAVvyK0siEOqFyvC5KVN1rE2YIH+T7qAPqKbQqyhNdhbtpIuq45d
 kLpsQ7bPWxWylAsa3nvLs0Y=
X-Google-Smtp-Source: APXvYqwIsnHm8D2ianGvCwtS9l5+AocsIfAh3V7HgM2+E9Kro7erwT8QcQCDIs50vqz9YHWTwkVZpQ==
X-Received: by 2002:adf:fc12:: with SMTP id i18mr4562449wrr.354.1582805021673; 
 Thu, 27 Feb 2020 04:03:41 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:41 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH 15/21] drm/sti: remove use drm_debugfs functions as return
 value
Date: Thu, 27 Feb 2020 15:02:26 +0300
Message-Id: <20200227120232.19413-16-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails, and should return void. This change therefore removes it uses as
a return value in various functions across drm/sti.

With these changes, the affected functions have been changed to use a void
return value.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/sti/sti_cursor.c | 14 ++++++++------
 drivers/gpu/drm/sti/sti_drv.c    | 16 ++++------------
 drivers/gpu/drm/sti/sti_dvo.c    | 13 +++++--------
 drivers/gpu/drm/sti/sti_gdp.c    |  7 ++++---
 drivers/gpu/drm/sti/sti_hda.c    | 13 +++++--------
 drivers/gpu/drm/sti/sti_hdmi.c   | 13 +++++--------
 drivers/gpu/drm/sti/sti_hqvdp.c  | 12 +++++++-----
 drivers/gpu/drm/sti/sti_mixer.c  |  7 ++++---
 drivers/gpu/drm/sti/sti_tvout.c  | 13 +++++--------
 drivers/gpu/drm/sti/sti_vid.c    |  8 ++++----
 drivers/gpu/drm/sti/sti_vid.h    |  2 +-
 11 files changed, 52 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index ea64c1dcaf63..a98057431023 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -131,17 +131,17 @@ static struct drm_info_list cursor_debugfs_files[] = {
 	{ "cursor", cursor_dbg_show, 0, NULL },
 };
 
-static int cursor_debugfs_init(struct sti_cursor *cursor,
-			       struct drm_minor *minor)
+static void cursor_debugfs_init(struct sti_cursor *cursor,
+				struct drm_minor *minor)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(cursor_debugfs_files); i++)
 		cursor_debugfs_files[i].data = cursor;
 
-	return drm_debugfs_create_files(cursor_debugfs_files,
-					ARRAY_SIZE(cursor_debugfs_files),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(cursor_debugfs_files,
+				 ARRAY_SIZE(cursor_debugfs_files),
+				 minor->debugfs_root, minor);
 }
 
 static void sti_cursor_argb8888_to_clut8(struct sti_cursor *cursor, u32 *src)
@@ -342,7 +342,9 @@ static int sti_cursor_late_register(struct drm_plane *drm_plane)
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_cursor *cursor = to_sti_cursor(plane);
 
-	return cursor_debugfs_init(cursor, drm_plane->dev->primary);
+	cursor_debugfs_init(cursor, drm_plane->dev->primary);
+
+	return 0;
 }
 
 static const struct drm_plane_funcs sti_cursor_plane_helpers_funcs = {
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 50870d8cbb76..3f9db3e3f397 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -92,24 +92,16 @@ static struct drm_info_list sti_drm_dbg_list[] = {
 	{"fps_get", sti_drm_fps_dbg_show, 0},
 };
 
-static int sti_drm_dbg_init(struct drm_minor *minor)
+static void sti_drm_dbg_init(struct drm_minor *minor)
 {
-	int ret;
-
-	ret = drm_debugfs_create_files(sti_drm_dbg_list,
-				       ARRAY_SIZE(sti_drm_dbg_list),
-				       minor->debugfs_root, minor);
-	if (ret)
-		goto err;
+	drm_debugfs_create_files(sti_drm_dbg_list,
+				 ARRAY_SIZE(sti_drm_dbg_list),
+				 minor->debugfs_root, minor);
 
 	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
 			    minor->dev, &sti_drm_fps_fops);
 
 	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
-	return 0;
-err:
-	DRM_ERROR("%s: cannot install debugfs\n", DRIVER_NAME);
-	return ret;
 }
 
 static const struct drm_mode_config_funcs sti_mode_config_funcs = {
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index a0709647f678..0032e1830bc5 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -197,16 +197,16 @@ static struct drm_info_list dvo_debugfs_files[] = {
 	{ "dvo", dvo_dbg_show, 0, NULL },
 };
 
-static int dvo_debugfs_init(struct sti_dvo *dvo, struct drm_minor *minor)
+static void dvo_debugfs_init(struct sti_dvo *dvo, struct drm_minor *minor)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(dvo_debugfs_files); i++)
 		dvo_debugfs_files[i].data = dvo;
 
-	return drm_debugfs_create_files(dvo_debugfs_files,
-					ARRAY_SIZE(dvo_debugfs_files),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(dvo_debugfs_files,
+				 ARRAY_SIZE(dvo_debugfs_files),
+				 minor->debugfs_root, minor);
 }
 
 static void sti_dvo_disable(struct drm_bridge *bridge)
@@ -406,10 +406,7 @@ static int sti_dvo_late_register(struct drm_connector *connector)
 		= to_sti_dvo_connector(connector);
 	struct sti_dvo *dvo = dvo_connector->dvo;
 
-	if (dvo_debugfs_init(dvo, dvo->drm_dev->primary)) {
-		DRM_ERROR("DVO debugfs setup failed\n");
-		return -EINVAL;
-	}
+	dvo_debugfs_init(dvo, dvo->drm_dev->primary);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 11595c748844..2d5a2b5b78b8 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -343,9 +343,10 @@ static int gdp_debugfs_init(struct sti_gdp *gdp, struct drm_minor *minor)
 	for (i = 0; i < nb_files; i++)
 		gdp_debugfs_files[i].data = gdp;
 
-	return drm_debugfs_create_files(gdp_debugfs_files,
-					nb_files,
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(gdp_debugfs_files,
+				 nb_files,
+				 minor->debugfs_root, minor);
+	return 0;
 }
 
 static int sti_gdp_fourcc2format(int fourcc)
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index f3f28d79b0e4..a1ec891eaf3a 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -367,16 +367,16 @@ static struct drm_info_list hda_debugfs_files[] = {
 	{ "hda", hda_dbg_show, 0, NULL },
 };
 
-static int hda_debugfs_init(struct sti_hda *hda, struct drm_minor *minor)
+static void hda_debugfs_init(struct sti_hda *hda, struct drm_minor *minor)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(hda_debugfs_files); i++)
 		hda_debugfs_files[i].data = hda;
 
-	return drm_debugfs_create_files(hda_debugfs_files,
-					ARRAY_SIZE(hda_debugfs_files),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(hda_debugfs_files,
+				 ARRAY_SIZE(hda_debugfs_files),
+				 minor->debugfs_root, minor);
 }
 
 /**
@@ -643,10 +643,7 @@ static int sti_hda_late_register(struct drm_connector *connector)
 		= to_sti_hda_connector(connector);
 	struct sti_hda *hda = hda_connector->hda;
 
-	if (hda_debugfs_init(hda, hda->drm_dev->primary)) {
-		DRM_ERROR("HDA debugfs setup failed\n");
-		return -EINVAL;
-	}
+	hda_debugfs_init(hda, hda->drm_dev->primary);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 18eaf786ffa4..5b15c4974e6b 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -727,16 +727,16 @@ static struct drm_info_list hdmi_debugfs_files[] = {
 	{ "hdmi", hdmi_dbg_show, 0, NULL },
 };
 
-static int hdmi_debugfs_init(struct sti_hdmi *hdmi, struct drm_minor *minor)
+static void hdmi_debugfs_init(struct sti_hdmi *hdmi, struct drm_minor *minor)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(hdmi_debugfs_files); i++)
 		hdmi_debugfs_files[i].data = hdmi;
 
-	return drm_debugfs_create_files(hdmi_debugfs_files,
-					ARRAY_SIZE(hdmi_debugfs_files),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(hdmi_debugfs_files,
+				 ARRAY_SIZE(hdmi_debugfs_files),
+				 minor->debugfs_root, minor);
 }
 
 static void sti_hdmi_disable(struct drm_bridge *bridge)
@@ -1113,10 +1113,7 @@ static int sti_hdmi_late_register(struct drm_connector *connector)
 		= to_sti_hdmi_connector(connector);
 	struct sti_hdmi *hdmi = hdmi_connector->hdmi;
 
-	if (hdmi_debugfs_init(hdmi, hdmi->drm_dev->primary)) {
-		DRM_ERROR("HDMI debugfs setup failed\n");
-		return -EINVAL;
-	}
+	hdmi_debugfs_init(hdmi, hdmi->drm_dev->primary);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 1015abe0ce08..5a4e12194a77 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -639,16 +639,16 @@ static struct drm_info_list hqvdp_debugfs_files[] = {
 	{ "hqvdp", hqvdp_dbg_show, 0, NULL },
 };
 
-static int hqvdp_debugfs_init(struct sti_hqvdp *hqvdp, struct drm_minor *minor)
+static void hqvdp_debugfs_init(struct sti_hqvdp *hqvdp, struct drm_minor *minor)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(hqvdp_debugfs_files); i++)
 		hqvdp_debugfs_files[i].data = hqvdp;
 
-	return drm_debugfs_create_files(hqvdp_debugfs_files,
-					ARRAY_SIZE(hqvdp_debugfs_files),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(hqvdp_debugfs_files,
+				 ARRAY_SIZE(hqvdp_debugfs_files),
+				 minor->debugfs_root, minor);
 }
 
 /**
@@ -1274,7 +1274,9 @@ static int sti_hqvdp_late_register(struct drm_plane *drm_plane)
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_hqvdp *hqvdp = to_sti_hqvdp(plane);
 
-	return hqvdp_debugfs_init(hqvdp, drm_plane->dev->primary);
+	hqvdp_debugfs_init(hqvdp, drm_plane->dev->primary);
+
+	return 0;
 }
 
 static const struct drm_plane_funcs sti_hqvdp_plane_helpers_funcs = {
diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
index c3a3e1e5fc8a..0ee084049555 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -200,9 +200,10 @@ int sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor)
 	for (i = 0; i < nb_files; i++)
 		mixer_debugfs_files[i].data = mixer;
 
-	return drm_debugfs_create_files(mixer_debugfs_files,
-					nb_files,
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(mixer_debugfs_files,
+				 nb_files,
+				 minor->debugfs_root, minor);
+	return 0;
 }
 
 void sti_mixer_set_background_status(struct sti_mixer *mixer, bool enable)
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index c36a8da373cb..df3817f0fd30 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -570,16 +570,16 @@ static struct drm_info_list tvout_debugfs_files[] = {
 	{ "tvout", tvout_dbg_show, 0, NULL },
 };
 
-static int tvout_debugfs_init(struct sti_tvout *tvout, struct drm_minor *minor)
+static void tvout_debugfs_init(struct sti_tvout *tvout, struct drm_minor *minor)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(tvout_debugfs_files); i++)
 		tvout_debugfs_files[i].data = tvout;
 
-	return drm_debugfs_create_files(tvout_debugfs_files,
-					ARRAY_SIZE(tvout_debugfs_files),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(tvout_debugfs_files,
+				 ARRAY_SIZE(tvout_debugfs_files),
+				 minor->debugfs_root, minor);
 }
 
 static void sti_tvout_encoder_dpms(struct drm_encoder *encoder, int mode)
@@ -603,14 +603,11 @@ static void sti_tvout_encoder_destroy(struct drm_encoder *encoder)
 static int sti_tvout_late_register(struct drm_encoder *encoder)
 {
 	struct sti_tvout *tvout = to_sti_tvout(encoder);
-	int ret;
 
 	if (tvout->debugfs_registered)
 		return 0;
 
-	ret = tvout_debugfs_init(tvout, encoder->dev->primary);
-	if (ret)
-		return ret;
+	tvout_debugfs_init(tvout, encoder->dev->primary);
 
 	tvout->debugfs_registered = true;
 	return 0;
diff --git a/drivers/gpu/drm/sti/sti_vid.c b/drivers/gpu/drm/sti/sti_vid.c
index 2d4230410464..2d818397918d 100644
--- a/drivers/gpu/drm/sti/sti_vid.c
+++ b/drivers/gpu/drm/sti/sti_vid.c
@@ -124,16 +124,16 @@ static struct drm_info_list vid_debugfs_files[] = {
 	{ "vid", vid_dbg_show, 0, NULL },
 };
 
-int vid_debugfs_init(struct sti_vid *vid, struct drm_minor *minor)
+void vid_debugfs_init(struct sti_vid *vid, struct drm_minor *minor)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vid_debugfs_files); i++)
 		vid_debugfs_files[i].data = vid;
 
-	return drm_debugfs_create_files(vid_debugfs_files,
-					ARRAY_SIZE(vid_debugfs_files),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(vid_debugfs_files,
+				 ARRAY_SIZE(vid_debugfs_files),
+				 minor->debugfs_root, minor);
 }
 
 void sti_vid_commit(struct sti_vid *vid,
diff --git a/drivers/gpu/drm/sti/sti_vid.h b/drivers/gpu/drm/sti/sti_vid.h
index 9dbd78461de1..991849ba50b5 100644
--- a/drivers/gpu/drm/sti/sti_vid.h
+++ b/drivers/gpu/drm/sti/sti_vid.h
@@ -26,6 +26,6 @@ void sti_vid_disable(struct sti_vid *vid);
 struct sti_vid *sti_vid_create(struct device *dev, struct drm_device *drm_dev,
 			       int id, void __iomem *baseaddr);
 
-int vid_debugfs_init(struct sti_vid *vid, struct drm_minor *minor);
+void vid_debugfs_init(struct sti_vid *vid, struct drm_minor *minor);
 
 #endif
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
