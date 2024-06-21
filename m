Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEF6912773
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BCD10E2CB;
	Fri, 21 Jun 2024 14:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJXim9w8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418BB10E2CB;
 Fri, 21 Jun 2024 14:19:44 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5c1d2f7ab69so515531eaf.3; 
 Fri, 21 Jun 2024 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718979583; x=1719584383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oXKpEaOa9jwO4Fcxwahx5bh3MDEOAXS39GoWJwMNWKo=;
 b=VJXim9w8m0iwiNvIm4VwOnarMipnpIWGDuyt35zTbS1xeJujJ2MpEH5diwcn+fJELO
 rFkP3spdiaNypgvxwXEaaF+5MU6hDKy+TZO5dns4tq2drheuZMwg2bXROfpHmlwNrebA
 6cOYUjpuCDYElln9qkuhmk1q/yIxGHYztUoDu/mLEN2gBfxzFHRF37WVsSo34bzio9OS
 t+Gu6h+mZsxReOVfSOp1YXEAJdWdzLipgK67UH2trEAMI9KC+hD0Qjog/9oVKCFTftLf
 Q9DYKZGEwyHpJq8lf5UQeKrFvuM2JoQD5TdcJMPv6oTl82O4BBlgrEtogB7gIpPUGO/2
 Co8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718979583; x=1719584383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oXKpEaOa9jwO4Fcxwahx5bh3MDEOAXS39GoWJwMNWKo=;
 b=Sklf/l2mmvb9DWyW6Z4mVJMDH1LLBX6hoLQxwrLoOK/zkCjR9PULgxDSAsLbFHeVRB
 Lk2/dt6xXeDn62G8pBcPtfYxa1d4DTbqSIOhumYFR8f7oLHQ4y0QjlSw8lv9SfXDKQfW
 1Udxev7mSCT4miM0ImnxURX2Km2RaAzSIAgg+5Ors5CAo+Mtnev6olLC0HLazVuWemxg
 NyfaWVTKCYc2GQkj1BrLGR5QTs65GHdcizzBufr/sGAGqgb7BNJh/dUp5YqOfXEhIaaH
 kbBfYtaNnxPSMi8POsfuJMT4x6+2vZdUjRa7eIETWI5mZWxs1K5tR6llZdQanaqDKzgv
 6SxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvjoslifvHYwD6GGj+BGIuSjwmgSu23FFIHYBO8Q6Lp0YOgmArMqhTfR5V5npbU1f8QiutfRHw8YFAV9SkLGnh6rm7R2Ngbd5nkHRba4cEU8QPVLRpQMqsBEMB5jmXP2wNquRKjeN78DRc0Amw0Q==
X-Gm-Message-State: AOJu0YwMnIt2H6je1w4S3XAk+L4IhBn/7h3aIVTyfbd0No7pyInnMTFY
 C+GU8MUNU9JRMVJ0UmM7nNR8QDjBaH//vAPyubwfUhIl19fCcHRG
X-Google-Smtp-Source: AGHT+IE14ZnBd+JuKtUJiIG3Li8rO6Wykbn8CMy/R8LDpxSAjIofrdKaZGVIahfooY40E8zQhbV5Ng==
X-Received: by 2002:a05:6358:5e0e:b0:19f:4476:3cc0 with SMTP id
 e5c5f4694b2df-1a1fd396a52mr1110125055d.12.1718979582692; 
 Fri, 21 Jun 2024 07:19:42 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon4859w-grc-48-142-198-217-108.dsl.bell.ca. [142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bd711418dsm20484285a.4.2024.06.21.07.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:19:42 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 3
Date: Fri, 21 Jun 2024 10:19:22 -0400
Message-ID: <20240621141924.20033-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please see Patch v2 1/7 for details.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/r600_hdmi.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_acpi.c     | 10 +++++-----
 drivers/gpu/drm/radeon/radeon_agp.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c |  2 +-
 drivers/gpu/drm/radeon/radeon_audio.c    |  4 ++--
 drivers/gpu/drm/radeon/radeon_combios.c  | 12 ++++++------
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c b/drivers/gpu/drm/radeon/r600_hdmi.c
index f3551ebaa2f0..661f374f5f27 100644
--- a/drivers/gpu/drm/radeon/r600_hdmi.c
+++ b/drivers/gpu/drm/radeon/r600_hdmi.c
@@ -116,7 +116,7 @@ void r600_audio_update_hdmi(struct work_struct *work)
 {
 	struct radeon_device *rdev = container_of(work, struct radeon_device,
 						  audio_work);
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct r600_audio_pin audio_status = r600_audio_status(rdev);
 	struct drm_encoder *encoder;
 	bool changed = false;
diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 603a78e41ba5..22ce61bdfc06 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -405,11 +405,11 @@ static int radeon_atif_handler(struct radeon_device *rdev,
 	if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
 		if ((rdev->flags & RADEON_IS_PX) &&
 		    radeon_atpx_dgpu_req_power_for_displays()) {
-			pm_runtime_get_sync(rdev->ddev->dev);
+			pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
 			/* Just fire off a uevent and let userspace tell us what to do */
-			drm_helper_hpd_irq_event(rdev->ddev);
-			pm_runtime_mark_last_busy(rdev->ddev->dev);
-			pm_runtime_put_autosuspend(rdev->ddev->dev);
+			drm_helper_hpd_irq_event(rdev_to_drm(rdev));
+			pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
+			pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 		}
 	}
 	/* TODO: check other events */
@@ -736,7 +736,7 @@ int radeon_acpi_init(struct radeon_device *rdev)
 		struct radeon_encoder *target = NULL;
 
 		/* Find the encoder controlling the brightness */
-		list_for_each_entry(tmp, &rdev->ddev->mode_config.encoder_list,
+		list_for_each_entry(tmp, &rdev_to_drm(rdev)->mode_config.encoder_list,
 				head) {
 			struct radeon_encoder *enc = to_radeon_encoder(tmp);
 
diff --git a/drivers/gpu/drm/radeon/radeon_agp.c b/drivers/gpu/drm/radeon/radeon_agp.c
index a3d749e350f9..89d7b0e9e79f 100644
--- a/drivers/gpu/drm/radeon/radeon_agp.c
+++ b/drivers/gpu/drm/radeon/radeon_agp.c
@@ -161,7 +161,7 @@ struct radeon_agp_head *radeon_agp_head_init(struct drm_device *dev)
 
 static int radeon_agp_head_acquire(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	if (!rdev->agp)
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 10793a433bf5..97c4e10d0550 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -187,7 +187,7 @@ void radeon_atombios_i2c_init(struct radeon_device *rdev)
 
 			if (i2c.valid) {
 				sprintf(stmp, "0x%x", i2c.i2c_id);
-				rdev->i2c_bus[i] = radeon_i2c_create(rdev->ddev, &i2c, stmp);
+				rdev->i2c_bus[i] = radeon_i2c_create(rdev_to_drm(rdev), &i2c, stmp);
 			}
 			gpio = (ATOM_GPIO_I2C_ASSIGMENT *)
 				((u8 *)gpio + sizeof(ATOM_GPIO_I2C_ASSIGMENT));
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 0bcd767b9f47..47aa06a9a942 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -196,7 +196,7 @@ static void radeon_audio_enable(struct radeon_device *rdev,
 		return;
 
 	if (rdev->mode_info.mode_config_initialized) {
-		list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
+		list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
 			if (radeon_encoder_is_digital(encoder)) {
 				radeon_encoder = to_radeon_encoder(encoder);
 				dig = radeon_encoder->enc_priv;
@@ -760,7 +760,7 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 	if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initialized)
 		return 0;
 
-	list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
+	list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
 		if (!radeon_encoder_is_digital(encoder))
 			continue;
 		radeon_encoder = to_radeon_encoder(encoder);
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 6952b1273b0f..41ddc576f8f8 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -372,7 +372,7 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 	int edid_info, size;
 	struct edid *edid;
 	unsigned char *raw;
-	edid_info = combios_get_table_offset(rdev->ddev, COMBIOS_HARDCODED_EDID_TABLE);
+	edid_info = combios_get_table_offset(rdev_to_drm(rdev), COMBIOS_HARDCODED_EDID_TABLE);
 	if (!edid_info)
 		return false;
 
@@ -642,7 +642,7 @@ static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rde
 
 static struct radeon_i2c_bus_rec radeon_combios_get_i2c_info_from_table(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct radeon_i2c_bus_rec i2c;
 	u16 offset;
 	u8 id, blocks, clk, data;
@@ -670,7 +670,7 @@ static struct radeon_i2c_bus_rec radeon_combios_get_i2c_info_from_table(struct r
 
 void radeon_combios_i2c_init(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct radeon_i2c_bus_rec i2c;
 
 	/* actual hw pads
@@ -812,7 +812,7 @@ bool radeon_combios_get_clock_info(struct drm_device *dev)
 
 bool radeon_combios_sideport_present(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	u16 igp_info;
 
 	/* sideport is AMD only */
@@ -915,7 +915,7 @@ struct radeon_encoder_primary_dac *radeon_combios_get_primary_dac_info(struct
 enum radeon_tv_std
 radeon_combios_get_tv_info(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	uint16_t tv_info;
 	enum radeon_tv_std tv_std = TV_STD_NTSC;
 
@@ -2637,7 +2637,7 @@ static const char *thermal_controller_names[] = {
 
 void radeon_combios_get_power_modes(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	u16 offset, misc, misc2 = 0;
 	u8 rev, tmp;
 	int state_index = 0;
-- 
2.45.2

