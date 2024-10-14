Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB999DA0A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 01:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4010E09C;
	Mon, 14 Oct 2024 23:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TRF2lKNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2757310E404;
 Mon, 14 Oct 2024 09:41:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43057f4a16eso35326305e9.1; 
 Mon, 14 Oct 2024 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728898858; x=1729503658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5a4qfjLxUFAWrjF7SBSebNnHB1LQ0GNam3wZT3QbPkg=;
 b=TRF2lKNq1lR2JPdVQYo7zsWW7ICxYtzvbKRlVfpQG/E2qKCjUZfdNjxVSVymNHBYso
 qI/x8ST0J+CbJ6XaW50WDxNznx29XliGRlpuBC9Uo2tuPixpZDKH3WbrnwPzuBxqbEL7
 VcGYJMI9pn1gpg9KYbxYcPO5twxeQyQKNQx1w4Y7hrELWmQdMllLlN+XsfukjnGeb/9n
 tK0Y6RZPXrcyzSauODAtKVo+uu2p49KMKpu44k48XCGougX/2hGi09FE9g21M5jAfziq
 8Jheg00vruOac05Jxz6YQlabludICKGPOhXFIOkPgWtJL6Guc60avglaF0o1jEALe8FN
 kFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728898858; x=1729503658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5a4qfjLxUFAWrjF7SBSebNnHB1LQ0GNam3wZT3QbPkg=;
 b=P9LfMPBjDChaFd7k03fwRGlA+UVHk3EHRd6wQNIun/zcgrvRc8F4GOHXLUisyULxT9
 w6f6MNpmzhrcBjhQ2taQReD//OtMGMUO3WW2m/3prksPn2J6aQhecEMIQGirCAc8wWat
 0/8La7I1Gag/jlqXPKr64+XDYEDurcdxVsIGBaNvkLnDI0ypKOF8mi71I4WK+zhT0/ql
 l4vqe7jFfdYQYAmShZewQanMXCXzwn3rfh0ssk5YF82ND2D5ynvA6uuLNG6Y2AL7sOi6
 H+d2JYeJ+W/3UKhuYlu5RRvRMFLH3u4wXXlzeaWioWilPMcURM9NljjQl2h8E9SUL6qH
 pLyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9HTwFKgURMDEwbcZLmPRw2kmx0uA2o3939S6D+KIWS3yMI/3Qv+/aBy41oUz3DeTElzYXrUuYqZ4=@lists.freedesktop.org,
 AJvYcCW3EPVOq5zxyC7V4p8qkCURXCm92ibIrM9fElRpOwUmiBDFMZr+YGzyHuKXRt0EQ1pZC6s2nc5qULL6@lists.freedesktop.org,
 AJvYcCXrO77YTMOq6aJYWnN8Ahho6NJTpf4vwNLa1GQBHiXk4H+AdIwbUkrX8TpDaa8at0okstdeqDGqQlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1O1PADT/1wE1ci/CDYWCgGLpaAolwTfQ7HYTT/PZXUwSW+dq7
 vT7rAz196lSU0ql44QuP+J946mGoQ/KDfMYwWf7ci35QGFr/SAUv
X-Google-Smtp-Source: AGHT+IHBDC3j3sVyvHElbDNRRmedDAgbyplgVakeUYKBKRQlyrc/vtKe3qcsRtcd4U4umqg8KfNKVg==
X-Received: by 2002:a05:600c:5705:b0:431:2b66:44f7 with SMTP id
 5b1f17b1804b1-4312b664514mr43060755e9.31.1728898858349; 
 Mon, 14 Oct 2024 02:40:58 -0700 (PDT)
Received: from giedriuslaptop.vinted.net ([92.61.38.146])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6bd03fsm10889481f8f.34.2024.10.14.02.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 02:40:57 -0700 (PDT)
From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedriuswork@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/lspcon: do not hardcode settle timeout
Date: Mon, 14 Oct 2024 12:39:12 +0300
Message-ID: <20241014093914.109162-1-giedriuswork@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Oct 2024 23:17:05 +0000
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

Avoid hardcoding the LSPCON settle timeout because it takes a longer
time on certain chips made by certain vendors. Use the function that
already exists to determine the timeout.

Signed-off-by: Giedrius Statkevičius <giedriuswork@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 3 +--
 drivers/gpu/drm/i915/display/intel_lspcon.c       | 2 +-
 include/drm/display/drm_dp_dual_mode_helper.h     | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
index 14a2a8473682..ae9d6b93136b 100644
--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -491,11 +491,10 @@ EXPORT_SYMBOL(drm_lspcon_get_mode);
  * 0 on success, -error on failure/timeout
  */
 int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
-			enum drm_lspcon_mode mode)
+			enum drm_lspcon_mode mode, int time_out)
 {
 	u8 data = 0;
 	int ret;
-	int time_out = 200;
 	enum drm_lspcon_mode current_mode;
 
 	if (mode == DRM_LSPCON_MODE_PCON)
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index f9db867fae89..764cf4898364 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -211,7 +211,7 @@ static int lspcon_change_mode(struct intel_lspcon *lspcon,
 		return 0;
 	}
 
-	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode);
+	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode, lspcon_get_mode_settle_timeout(lspcon));
 	if (err < 0) {
 		drm_err(display->drm, "LSPCON mode change failed\n");
 		return err;
diff --git a/include/drm/display/drm_dp_dual_mode_helper.h b/include/drm/display/drm_dp_dual_mode_helper.h
index 7ee482265087..7ac6969db935 100644
--- a/include/drm/display/drm_dp_dual_mode_helper.h
+++ b/include/drm/display/drm_dp_dual_mode_helper.h
@@ -117,5 +117,5 @@ const char *drm_dp_get_dual_mode_type_name(enum drm_dp_dual_mode_type type);
 int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
 			enum drm_lspcon_mode *current_mode);
 int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
-			enum drm_lspcon_mode reqd_mode);
+			enum drm_lspcon_mode reqd_mode, int time_out);
 #endif
-- 
2.47.0

