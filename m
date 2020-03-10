Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAEF180C6A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E94F6E3CB;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F196E1E0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r7so787540wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOH54Ra6E5FEat2SYnlWrpeeaPKiUSbYH0BwlHJnSec=;
 b=PVeQA6nCuaWaET2VwTzjSP/c4kOgF6xBwNfrz2+Du4lptKCW2B0R03GpAqgghmrbrK
 GWFq7ltAzW9lqr/s/BmEFSn6GwRwybMPmribqbDFpONxrH/bg9ncc8dH0lZTprdbjEqv
 2eknvWxrfJG43JFwnG1B/oDBPS5wWRdCUPgvtxRm0YidZIIjyX2EbZZ5agdHu0nOrAGM
 VYWg4eDdtZp4MNgtFi0R7ipUDY2ci6aHBnQJbGsUa2DceKgM/Wl9chQ3qVGz9MmKfhN0
 exYgeN5UQq/JhBf4debpWtvLCkZPgzcMJ7XIELwlefkQ87aKI2i4R1FMbuO8RlcEaqAM
 y75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOH54Ra6E5FEat2SYnlWrpeeaPKiUSbYH0BwlHJnSec=;
 b=buQRdY+UAtbg+4UOS4c5BPD+cASGUmyhYyF0+EhtXpehAByeEfAdPB8RCi79RhchKG
 w0qrhLipzJnN7oj9uFAKYYejlgm5nTyUWfnRqmlyGqeB0lFOrUUY96fg530McXrM/nuu
 eRZXEjvbkUevhckRzMjrHaMe6r0AYoD77hsQgwRZitX9JadEiTI0MM93j53Gp5yz4FdU
 CeiCHIQoi4OMJVFyIwiUe/y6LYyyxqoCum4qYMcde4Myk2Pqs1TBhZjwUrWW4uO0S23a
 4khTNMWG0HHZ+GLuE/0u4NOkQADq2Bc8eL2qhfHcCOQfKgai0ozhQuV/r/3K3OTZRafm
 PUmA==
X-Gm-Message-State: ANhLgQ2XH8djaxgoVRmKyZZwczxy7TYIkwGNZQid1xXbji6e2q0x9Z3z
 05kAiiIBEIOFJsNJ/j6ffjY=
X-Google-Smtp-Source: ADFU+vvEVRLl0J3ETdLH+NxV8XVVlMIvpVPp5F2Q2vbKI6d5wgeQ2ltOSbWR+IX7SAhWT104Bjyslw==
X-Received: by 2002:a7b:c854:: with SMTP id c20mr2100533wml.99.1583847110987; 
 Tue, 10 Mar 2020 06:31:50 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:50 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH v2 09/17] drm/sti: remove use of drm_debugfs functions as
 return values
Date: Tue, 10 Mar 2020 16:31:13 +0300
Message-Id: <20200310133121.27913-10-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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

v2: convert sti_mixer_debugfs_init() and sti_compositor_debugfs_init()
to return void too. Also have sti_drm_dbg_init() to return 0 to avoid
build issues.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/sti/sti_compositor.c |  6 ++----
 drivers/gpu/drm/sti/sti_compositor.h |  4 ++--
 drivers/gpu/drm/sti/sti_crtc.c       |  2 +-
 drivers/gpu/drm/sti/sti_cursor.c     | 14 ++++++++------
 drivers/gpu/drm/sti/sti_drv.c        | 13 +++----------
 drivers/gpu/drm/sti/sti_dvo.c        | 13 +++++--------
 drivers/gpu/drm/sti/sti_gdp.c        |  7 ++++---
 drivers/gpu/drm/sti/sti_hda.c        | 13 +++++--------
 drivers/gpu/drm/sti/sti_hdmi.c       | 13 +++++--------
 drivers/gpu/drm/sti/sti_hqvdp.c      | 12 +++++++-----
 drivers/gpu/drm/sti/sti_mixer.c      | 10 +++++-----
 drivers/gpu/drm/sti/sti_mixer.h      |  2 +-
 drivers/gpu/drm/sti/sti_tvout.c      | 13 +++++--------
 drivers/gpu/drm/sti/sti_vid.c        |  8 ++++----
 drivers/gpu/drm/sti/sti_vid.h        |  2 +-
 15 files changed, 58 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index c7652584255d..319962a2c17b 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -42,8 +42,8 @@ static const struct sti_compositor_data stih407_compositor_data = {
 	},
 };
 
-int sti_compositor_debugfs_init(struct sti_compositor *compo,
-				struct drm_minor *minor)
+void sti_compositor_debugfs_init(struct sti_compositor *compo,
+				 struct drm_minor *minor)
 {
 	unsigned int i;
 
@@ -54,8 +54,6 @@ int sti_compositor_debugfs_init(struct sti_compositor *compo,
 	for (i = 0; i < STI_MAX_MIXER; i++)
 		if (compo->mixer[i])
 			sti_mixer_debugfs_init(compo->mixer[i], minor);
-
-	return 0;
 }
 
 static int sti_compositor_bind(struct device *dev,
diff --git a/drivers/gpu/drm/sti/sti_compositor.h b/drivers/gpu/drm/sti/sti_compositor.h
index ac4bb3834810..25bb01bdd013 100644
--- a/drivers/gpu/drm/sti/sti_compositor.h
+++ b/drivers/gpu/drm/sti/sti_compositor.h
@@ -79,7 +79,7 @@ struct sti_compositor {
 	struct notifier_block vtg_vblank_nb[STI_MAX_MIXER];
 };
 
-int sti_compositor_debugfs_init(struct sti_compositor *compo,
-				struct drm_minor *minor);
+void sti_compositor_debugfs_init(struct sti_compositor *compo,
+				 struct drm_minor *minor);
 
 #endif
diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 49e6cb8f5836..6f37c104c46f 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -319,7 +319,7 @@ static int sti_crtc_late_register(struct drm_crtc *crtc)
 	struct sti_compositor *compo = dev_get_drvdata(mixer->dev);
 
 	if (drm_crtc_index(crtc) == 0)
-		return sti_compositor_debugfs_init(compo, crtc->dev->primary);
+		sti_compositor_debugfs_init(compo, crtc->dev->primary);
 
 	return 0;
 }
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
index 50870d8cbb76..5ab36f6001fc 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -94,22 +94,15 @@ static struct drm_info_list sti_drm_dbg_list[] = {
 
 static int sti_drm_dbg_init(struct drm_minor *minor)
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
 	return 0;
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
index c3a3e1e5fc8a..7e5f14646625 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -178,7 +178,7 @@ static struct drm_info_list mixer1_debugfs_files[] = {
 	{ "mixer_aux", mixer_dbg_show, 0, NULL },
 };
 
-int sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor)
+void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor)
 {
 	unsigned int i;
 	struct drm_info_list *mixer_debugfs_files;
@@ -194,15 +194,15 @@ int sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor)
 		nb_files = ARRAY_SIZE(mixer1_debugfs_files);
 		break;
 	default:
-		return -EINVAL;
+		return;
 	}
 
 	for (i = 0; i < nb_files; i++)
 		mixer_debugfs_files[i].data = mixer;
 
-	return drm_debugfs_create_files(mixer_debugfs_files,
-					nb_files,
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(mixer_debugfs_files,
+				 nb_files,
+				 minor->debugfs_root, minor);
 }
 
 void sti_mixer_set_background_status(struct sti_mixer *mixer, bool enable)
diff --git a/drivers/gpu/drm/sti/sti_mixer.h b/drivers/gpu/drm/sti/sti_mixer.h
index d9544246913a..ab06beb7b258 100644
--- a/drivers/gpu/drm/sti/sti_mixer.h
+++ b/drivers/gpu/drm/sti/sti_mixer.h
@@ -58,7 +58,7 @@ int sti_mixer_active_video_area(struct sti_mixer *mixer,
 
 void sti_mixer_set_background_status(struct sti_mixer *mixer, bool enable);
 
-int sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor);
+void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor);
 
 /* depth in Cross-bar control = z order */
 #define GAM_MIXER_NB_DEPTH_LEVEL 6
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
