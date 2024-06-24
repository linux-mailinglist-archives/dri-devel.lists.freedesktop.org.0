Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575CF915589
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 19:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292E210E00F;
	Mon, 24 Jun 2024 17:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lLQMfRXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7CB10E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 17:40:01 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ec5779b423so23500771fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719250800; x=1719855600; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X4I6nP/vTxwMdJ/dV3TQHmb3v1qJ/dluw5GaWCNXlms=;
 b=lLQMfRXAXx4p9dB+zdkch4cmePa+i0bdqeBPvWCgcjaB2BOAGyCHiUZMST1MVYvQ64
 Bs5qrPoStEG/4LA5wLRJJfqjbCl/wOArlQF8QW2y71SyUP2NzQS3wzM7DCjb45AlqodV
 fYl8e2VSScNzCO1i0kQPB7pyZyZlN3t7eg/jHhWQun4N+EmsDaqaYftI7g/jGfXKokAI
 Gs2CcP5R/W9AHm5cWASu823ppUR2vfWwjyaI/5KO5G1Zp/Lx+xAIgDwxhYMzoefd9sdT
 IucyoEAtwzkDgvTATbpPHlHoEDCEHsaTOgPi6Wl6agICmcAYEHfcbvyLBx4MPsZNZ7Au
 4ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719250800; x=1719855600;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X4I6nP/vTxwMdJ/dV3TQHmb3v1qJ/dluw5GaWCNXlms=;
 b=Xqc+rsC/dNUQfYlIA1cw+/uvQMZoiCoDduBVgCToqSM6VAGFfKr6d/rMV+K8uJStNv
 fOe/1Z4nuEbXJyLf7H6ijoF929cka60t4+fFFYHKpFd105Gj0dlUfHxmXhI4mP2qIXOd
 vtcEftS4KbEQIlWa3UKKE946Snm+1ZCShxskDwNZUNRsSTBSJL+D9MPGIjWiAG4Tn7Uh
 45UvPMVjS5jR9Kg72qabAFMelwmRTJYDGyIbeCKGz7bwmS/GvNZpLYw/7rxXwIs79v3d
 NRs1PyL5dD3rGmobJZTeJgcsQlAUMJTTcBA99nWW7ClIqXeyO4Iv8me6LQbe7hVuXTfv
 MFkA==
X-Gm-Message-State: AOJu0YxVa5DYKYU7/Iz5dgJCKYYmzNxegW5Af1O5V5boQNyd4UuU7S3l
 6rAeh/SNgocQa4VwcakPMto/diZB8NhTXyMfkxdGfuMdO19ceWRugH5VnP8SDIQ=
X-Google-Smtp-Source: AGHT+IEh/iyrIRntkObUotPBA+wdBYxw0BsT77HvhE4PadtEX9XW7b2sxv0RwYrWpQ0mB8zBTSgWgQ==
X-Received: by 2002:a05:651c:2119:b0:2ec:681b:5b50 with SMTP id
 38308e7fff4ca-2ec681b5f72mr4572391fa.11.1719250799656; 
 Mon, 24 Jun 2024 10:39:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5d2c3446sm5120581fa.38.2024.06.24.10.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 10:39:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 20:39:58 +0300
Subject: [PATCH] drm/connector: hdmi: shorten too long function name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-hdmi-connector-shorten-name-v1-1-5bd3410138db@linaro.org>
X-B4-Tracking: v=1; b=H4sIAG2veWYC/x3MwQqDMAwA0F+RnA3UWNzYrwwPXRvXHExHKjIQ/
 93i8V3eAZVNuMKrO8B4lypFG4a+g5iDfhklNQM58m4ijzmtgrGoctyKYc3FNlbUsDKOA1F6Ov+
 Z4gPa8DNe5H/v7/k8L1LoJTltAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3067;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rFspHFmOyiFGXqZvDfFVtBS2+jLZUsqxipNk0i6GmJE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmea9uPJTjZRiOibJPcz5nFHytq9vOX0HcFPm1P
 jPg/exgeCOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmvbgAKCRCLPIo+Aiko
 1WQDB/4zH94esAY7J/6Qv7nPTGRI9qb7iXNNoQI+f3yug4LgXeV2+rvQDDc2z7dPfb1VKWNFy6Y
 Et9nvs2Xv6lQ3QHh3xl0X3l/DqhzxOtfmg8XO7LhqRqS5KhWXA95CyrGzOLwuNgxVFC7R+GxX95
 qE18uh8iTr9U4iKLZ+FliIekM+kz+hAw8KkP3B7UqBU1PnTI7ZyerW6XS3Si6C6vcodm8E8gkwb
 IVljS88TG9+eOzSfUqrjqklLZYOsfQbGMnSZkrSHrXKFIN+fyj8y5QMfuSmVAmxOF4n0guNS81d
 CN7+Om6r/u9MJplaEeaang585QgXa4+pAvjXFD96gK+TNEIN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

If CONFIG_MODVERSIONS is enabled, then using the HDMI Connector
framework can result in build failures. Rename the function to make it
fit into the name requirements.

ERROR: modpost: too long symbol "drm_atomic_helper_connector_hdmi_disable_audio_infoframe" [drivers/gpu/drm/msm/msm.ko]

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 6 +++---
 include/drm/display/drm_hdmi_state_helper.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2dab3ad8ce64..7854820089ec 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -716,7 +716,7 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
 
 /**
- * drm_atomic_helper_connector_hdmi_disable_audio_infoframe - Stop sending the Audio Infoframe
+ * drm_atomic_helper_connector_hdmi_clear_audio_infoframe - Stop sending the Audio Infoframe
  * @connector: A pointer to the HDMI connector
  *
  * This function is meant for HDMI connector drivers to stop sending their
@@ -727,7 +727,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
  * Zero on success, error code on failure.
  */
 int
-drm_atomic_helper_connector_hdmi_disable_audio_infoframe(struct drm_connector *connector)
+drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector)
 {
 	struct drm_connector_hdmi_infoframe *infoframe =
 		&connector->hdmi.infoframes.audio;
@@ -749,4 +749,4 @@ drm_atomic_helper_connector_hdmi_disable_audio_infoframe(struct drm_connector *c
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_disable_audio_infoframe);
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 285f366cf716..2d45fcfa4619 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -16,7 +16,7 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 
 int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
 							    struct hdmi_audio_infoframe *frame);
-int drm_atomic_helper_connector_hdmi_disable_audio_infoframe(struct drm_connector *connector);
+int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 

---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-hdmi-connector-shorten-name-3122d804b6c7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

