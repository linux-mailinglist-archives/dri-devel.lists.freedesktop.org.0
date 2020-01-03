Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A3D130217
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E2D6E43C;
	Sat,  4 Jan 2020 11:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09B36E30F;
 Fri,  3 Jan 2020 13:19:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so8585366wma.1;
 Fri, 03 Jan 2020 05:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7MNMC46L/ZLy5R5phEKgqsEJ5fPW0pXEGQb1S+WQ7H0=;
 b=M9xOLwRq3vPs0yI+fSX3UERn74IUU9+YGNtfF2Ng8qV6D/lwtGy7PjGjfASN99PiTj
 Nc3GnpzMRRfJ/Gqfz0B1o3RFuIErJPcK4XLUAVNqntTAV28pAYt1nNttYPjnAMW5m28i
 MrGwC4eR7MPjQHjNo1Ib9k1ikRBp2Xq0+AqNyGsIc04pknCK9yHLZZjt4sYkRpDrNIWy
 LcbwnxEWtNg1B+X+iJJsdNY4qkNGhytDZgSidny4j6RE4bfdZp48P/rw6tl5/TaEo/Bw
 cJ69Icnmv7EogGExcUd5TfEIY7QZpyLOAAk9xqUPk2mrmZIOxWkGtNUlkEzBXCpKesOo
 jszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7MNMC46L/ZLy5R5phEKgqsEJ5fPW0pXEGQb1S+WQ7H0=;
 b=BG6N8D1hACyLTwPeNDAu93QsWljbds4hMI6anEP7PZ6xmlyMuv40Kpk9pfA2vSPUIp
 gAi+p8HGimnCm7VQv4RAYyrRs5YZAgzI6Pn325FmPof3mmqUT2fWYrOkkF+TWr34GGYO
 p70/976F9d2cXcYfVdBBUjv66O+M7FXEDsiKpqK/NtwJ4QXd9+HIHqiuEM+EkXRucmZN
 wDSrfTDeggEBt046NxQkGI+AgHbsbGZsa3ppq3msHojdmAg6IngpeVEAxHuexFSR9pVR
 jfUSzFCg76oWf2+rtkDSW0clOHtYUMPj9FWeJPG9yQk4LbqQMCgbJxyx2n7f5KimmvGe
 4UGA==
X-Gm-Message-State: APjAAAUXa6IQ1ncQFoiCdIg1ZI6S9Rl5BJqxBl43mCT7i1h7t6Y8vV+2
 QrtQc5EBC0kmLpR1D8B7gnA=
X-Google-Smtp-Source: APXvYqzJDcoJXUwYdfBuRdf5nQmRqO8mMd5FgOZEpdbYqx6iEIs7isAHjwOJN8oUcszOVzdfxbponw==
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr19849978wmg.163.1578057558341; 
 Fri, 03 Jan 2020 05:19:18 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id p18sm12130679wmg.4.2020.01.03.05.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 05:19:17 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: remove boolean checks in if statements.
Date: Fri,  3 Jan 2020 16:19:12 +0300
Message-Id: <20200103131912.26681-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary variable comparisions to true/false in if statements
and check the value of the variable directly.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/radeon/cik_sdma.c               |  2 +-
 drivers/gpu/drm/radeon/r100.c                   |  2 +-
 drivers/gpu/drm/radeon/r600.c                   |  2 +-
 drivers/gpu/drm/radeon/radeon_bios.c            | 12 ++++++------
 drivers/gpu/drm/radeon/radeon_connectors.c      |  4 ++--
 drivers/gpu/drm/radeon/radeon_display.c         |  4 ++--
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c |  4 ++--
 drivers/gpu/drm/radeon/radeon_pm.c              |  2 +-
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik_sdma.c b/drivers/gpu/drm/radeon/cik_sdma.c
index 35b9dc6ce46a..68403e77756d 100644
--- a/drivers/gpu/drm/radeon/cik_sdma.c
+++ b/drivers/gpu/drm/radeon/cik_sdma.c
@@ -333,7 +333,7 @@ void cik_sdma_enable(struct radeon_device *rdev, bool enable)
 	u32 me_cntl, reg_offset;
 	int i;
 
-	if (enable == false) {
+	if (!enable) {
 		cik_sdma_gfx_stop(rdev);
 		cik_sdma_rlc_stop(rdev);
 	}
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 0017aa7a9f17..957994258860 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -2815,7 +2815,7 @@ void r100_vga_set_state(struct radeon_device *rdev, bool state)
 	uint32_t temp;
 
 	temp = RREG32(RADEON_CONFIG_CNTL);
-	if (state == false) {
+	if (!state) {
 		temp &= ~RADEON_CFG_VGA_RAM_EN;
 		temp |= RADEON_CFG_VGA_IO_DIS;
 	} else {
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index 0d453aa09352..eb56fb48a6b7 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -3191,7 +3191,7 @@ void r600_vga_set_state(struct radeon_device *rdev, bool state)
 	uint32_t temp;
 
 	temp = RREG32(CONFIG_CNTL);
-	if (state == false) {
+	if (!state) {
 		temp &= ~(1<<0);
 		temp |= (1<<1);
 	} else {
diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index c84d965c283e..c42f73fad3e3 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -664,17 +664,17 @@ bool radeon_get_bios(struct radeon_device *rdev)
 	uint16_t tmp;
 
 	r = radeon_atrm_get_bios(rdev);
-	if (r == false)
+	if (!r)
 		r = radeon_acpi_vfct_bios(rdev);
-	if (r == false)
+	if (!r)
 		r = igp_read_bios_from_vram(rdev);
-	if (r == false)
+	if (!r)
 		r = radeon_read_bios(rdev);
-	if (r == false)
+	if (!r)
 		r = radeon_read_disabled_bios(rdev);
-	if (r == false)
+	if (!r)
 		r = radeon_read_platform_bios(rdev);
-	if (r == false || rdev->bios == NULL) {
+	if (!r || rdev->bios == NULL) {
 		DRM_ERROR("Unable to locate a BIOS ROM\n");
 		rdev->bios = NULL;
 		return false;
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 0851e6817e57..90d2f732affb 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -440,7 +440,7 @@ radeon_connector_analog_encoder_conflict_solve(struct drm_connector *connector,
 				if (radeon_conflict->use_digital)
 					continue;
 
-				if (priority == true) {
+				if (priority) {
 					DRM_DEBUG_KMS("1: conflicting encoders switching off %s\n",
 						      conflict->name);
 					DRM_DEBUG_KMS("in favor of %s\n",
@@ -700,7 +700,7 @@ static int radeon_connector_set_property(struct drm_connector *connector, struct
 			else
 				ret = radeon_legacy_get_tmds_info_from_combios(radeon_encoder, tmds);
 		}
-		if (val == 1 || ret == false) {
+		if (val == 1 || !ret) {
 			radeon_legacy_get_tmds_info_from_table(radeon_encoder, tmds);
 		}
 		radeon_property_change_mode(&radeon_encoder->base);
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index dfb921899853..e42d9e0a4b8c 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -847,11 +847,11 @@ static bool radeon_setup_enc_conn(struct drm_device *dev)
 	if (rdev->bios) {
 		if (rdev->is_atom_bios) {
 			ret = radeon_get_atom_connector_info_from_supported_devices_table(dev);
-			if (ret == false)
+			if (!ret)
 				ret = radeon_get_atom_connector_info_from_object_table(dev);
 		} else {
 			ret = radeon_get_legacy_connector_info_from_bios(dev);
-			if (ret == false)
+			if (!ret)
 				ret = radeon_get_legacy_connector_info_from_table(dev);
 		}
 	} else {
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index a33b19566b2d..44d060f75318 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -1712,7 +1712,7 @@ static struct radeon_encoder_int_tmds *radeon_legacy_get_tmds_info(struct radeon
 	else
 		ret = radeon_legacy_get_tmds_info_from_combios(encoder, tmds);
 
-	if (ret == false)
+	if (!ret)
 		radeon_legacy_get_tmds_info_from_table(encoder, tmds);
 
 	return tmds;
@@ -1735,7 +1735,7 @@ static struct radeon_encoder_ext_tmds *radeon_legacy_get_ext_tmds_info(struct ra
 
 	ret = radeon_legacy_get_ext_tmds_info_from_combios(encoder, tmds);
 
-	if (ret == false)
+	if (!ret)
 		radeon_legacy_get_ext_tmds_info_from_table(encoder, tmds);
 
 	return tmds;
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index b37121f2631d..8c5d6fda0d75 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1789,7 +1789,7 @@ static bool radeon_pm_debug_check_in_vbl(struct radeon_device *rdev, bool finish
 	u32 stat_crtc = 0;
 	bool in_vbl = radeon_pm_in_vbl(rdev);
 
-	if (in_vbl == false)
+	if (!in_vbl)
 		DRM_DEBUG_DRIVER("not in vbl for pm change %08x at %s\n", stat_crtc,
 			 finish ? "exit" : "entry");
 	return in_vbl;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
