Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C59A1C1D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 09:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2938E10E304;
	Thu, 17 Oct 2024 07:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q0u0n4DK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF6410E304;
 Thu, 17 Oct 2024 07:57:40 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso663290e87.2; 
 Thu, 17 Oct 2024 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729151858; x=1729756658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kEg0zeTWEzgOxEOcS7zMMhXVtwfnHJYFvRIaI/gF0MU=;
 b=Q0u0n4DKHuZhoaE/rt9aPaJuzzejddXq0XQrZBgZmV5wBj/ObeHdKUrtjhQMUxF4Mo
 pHrLWhjZcES7KCLFeWcoCsNQ/HH8cCw2G+V9BbCGGJkaQNQ4IQnFPI7pMfFjUdVZ1ixD
 us2Z3RLp2nckacnvy5fJ51JOECp3azg8jDsyAqibcH6IhJ+RY83BkCBe+2/fjJ5+QnC0
 XD/D1xwFYxiV6nV8QNmIeqMO2Csr1ZGKFnoZjVEOOEW05TA7tDf9UFAjhFnt5IfCi2fk
 C8u7me9cjhfnFl4CGVCZq3tk1I9O16JEYWnf8bRyNpsBo3LG61uk/Sg7NvWN4yMdpFBw
 0yvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729151858; x=1729756658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kEg0zeTWEzgOxEOcS7zMMhXVtwfnHJYFvRIaI/gF0MU=;
 b=HssvJHuVIgHJTcn4X24eBQGgakIMRx1mjzj+hz37fnOTmSm+3+LqASFr3TDmW5Leam
 vvdd2JjeEUqHLVo4JMvbv9ESyz+P+wMt8wiuji/2LS/w7xKWtfdDWl25LFbyvnF3Lph8
 pidRkrz6YZNXGh0FJgaTx/rLjEZ/7Oe7CFY3ENAB+VyCX92AhAFTRKny2luTubbUC6sc
 A1f/nk4cMZOqeKAuqiauhMtvmXr0pzpuig+nBOnKhWz/VzeCmyv+HrbJwBRoVxFfFiyN
 5YG+x0YLVvEEEDc1Eom3oiKufGs30eIkjugT6k8jGuxK2TxM45H/cW2KwCL48tJfGOsy
 pjLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKS6qIM7Qx/zXMX7IGKQ/8Kxg9sqXK4FR65keEE2zu52jWNRGQ0VX6hLGdinsA21H1BSPKlHVAwz79@lists.freedesktop.org,
 AJvYcCX+2KWTzYk3zwDv88CENFMaEuDVvIErVZMOwOhGqmKORkh3FN+Wa+9d9id5IjuRtDW83Onewb8dg7g=@lists.freedesktop.org,
 AJvYcCXKm5kBjZt9sYh+U4LVJf5lgVV2qrKyFgLuFAvLrbK23YheuHI3EaCsUveeU47wi86C4arfkCaZWG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq2RA1nEBW6jcpQrqi8jOetrBh4qNpHG8qk06ncXixkvRRWhJZ
 b5eesuWZcfkddyt2EjS+8JIrOfUgJbnqRejyirvp1arwcP39PEZR
X-Google-Smtp-Source: AGHT+IHc7cprvzcrGEg//WDzWKJt7hzqpefGqFa4tXnkGFB7777RAmwgm7rdKxdryrFGxYqTZIOxyA==
X-Received: by 2002:a05:6512:6c9:b0:539:9527:3d59 with SMTP id
 2adb3069b0e04-539e572854amr10138398e87.52.1729151857765; 
 Thu, 17 Oct 2024 00:57:37 -0700 (PDT)
Received: from giedriuslaptop.. ([78.63.144.185])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-539ffff3e5asm678703e87.151.2024.10.17.00.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 00:57:37 -0700 (PDT)
From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedriuswork@gmail.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/lspcon: do not hardcode settle timeout
Date: Thu, 17 Oct 2024 10:57:24 +0300
Message-ID: <20241017075725.207384-1-giedriuswork@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Avoid hardcoding the LSPCON settle timeout because it takes a longer
time on certain chips made by certain vendors. Use the function that
already exists to determine the timeout.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Giedrius Statkevičius <giedriuswork@gmail.com>
---
v2: add documentation about the parameter, apply 80 character line
    length limit.

 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_lspcon.c       | 3 ++-
 include/drm/display/drm_dp_dual_mode_helper.h     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
index 14a2a8473682..d14b262b2344 100644
--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -486,16 +486,16 @@ EXPORT_SYMBOL(drm_lspcon_get_mode);
  * @dev: &drm_device to use
  * @adapter: I2C-over-aux adapter
  * @mode: required mode of operation
+ * @time_out: LSPCON mode change settle timeout
  *
  * Returns:
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
index f9db867fae89..30c31fddec99 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -211,7 +211,8 @@ static int lspcon_change_mode(struct intel_lspcon *lspcon,
 		return 0;
 	}
 
-	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode);
+	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode,
+				  lspcon_get_mode_settle_timeout(lspcon));
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

