Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012587BABD5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC8110E19D;
	Thu,  5 Oct 2023 21:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D4810E42C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:09:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50435ad51bbso1821055e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696540197; x=1697144997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4l+rmSaO9D8iSzAn40goBP/fmnV3QN4/WS3vTxGlc4Q=;
 b=Tpa8HHSv0GuWsZClwgvFQ79gjzwoJlhtiGab6dLITC9dag7UQCVACsi4bNYNRuT7PL
 EDIL+HnXncPF6uYEsiCruQUeYFD9277dFbn0oRd2rqIzyDQGmO1dFxXkobButv9VfwSu
 94MlQXAxIxZoUUqUin/ouBhO86nY5Nv1lg65MXPWtlR1+m1Wvx1+sT60E/SHomLd0Ild
 aUfNXZEfbK0ukEgeSVbnc44DnrIfNCDjCNxFGkksTD4mZYvLLfdMRmCSMnVejuzeUmk9
 A47J3jIf/CVLqiD294HRHkqOPbbntmxahEiAjFab9pggrmlMKQIHrNS5ohyP1dkLJpMy
 TzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696540197; x=1697144997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4l+rmSaO9D8iSzAn40goBP/fmnV3QN4/WS3vTxGlc4Q=;
 b=XE6euo4C8IXKyelgPYus0VLMIpmL/vMcIRmMzOoXtAMSj3D5H9xqycKr6RJ+THbTWz
 1t3+Bku8hLOAmYDsrG05SmLyCFqIFrXjDoWR0IThUn3+5g/veRWgwYUtgYO8ChPRUIZF
 u+9K0f1R73BGx8WQPIjsspdwYh7pX3HpJcfeQxrVpwjSNondd5IEavjspRMMbludoNB6
 ttfJBcubAm90scwowS32EUZxPoA7cVz8ZUsLbZRMCvFaHEe6OjwoRB5Dklg0N+bEbRz9
 gCRB8JC6OcdYuVY4EVfkcoFHAJt4FeXPbufe5lIGNGN+byJTQ19/4OsS3GJ2jo1eakPi
 1UZA==
X-Gm-Message-State: AOJu0Yx30pUX4LkayChu4V72fR/AOhPdtjca7Nppcqm5d/RfIL1Q3sPF
 a19+NvNYK6ChOc45NwGMLTmWmA==
X-Google-Smtp-Source: AGHT+IEYVg+CSuQrNBKI48gPbxx4BwvxFlxcmM6lxBSIw2BuJU+k4acAlh6XKoVSZnul4P6Nst19Dw==
X-Received: by 2002:a19:2d56:0:b0:505:8075:7c17 with SMTP id
 t22-20020a192d56000000b0050580757c17mr5077413lft.22.1696540197311; 
 Thu, 05 Oct 2023 14:09:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l4-20020ac24304000000b0050481c400e9sm3440lfh.287.2023.10.05.14.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:09:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Fri,  6 Oct 2023 00:09:56 +0300
Message-Id: <20231005210956.2393366-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_helper_check_wb_encoder_state() function doesn't use
encoder for anything other than getting the drm_device instance. The
function's description talks about checking the writeback connector
state, not the encoder state. Moreover, there is no such thing as an
encoder state, encoders generally do not have a state on their own.

Drop the first argument and rename the function to
drm_atomic_helper_check_wb_connector_state().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Abhinav at [1] pointed me to this function as one of the reasons to keep
WB check state in the encoder part of the MSM driver. However after a
second glance, it looks like this function isn't really concerned with
the encoder state and checks the connector state. Let's rename it to
make this more clear.

[1] https://lore.kernel.org/dri-devel/9a2e3ab2-a95f-3dee-b89c-aa69ffd9387e@quicinc.com/

---
 drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
 include/drm/drm_atomic_helper.h       |  3 +--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 71d399397107..f32bf0212453 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -786,8 +786,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
- * @encoder: encoder state to check
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
  * @conn_state: connector state to check
  *
  * Checks if the writeback connector state is valid, and returns an error if it
@@ -797,8 +796,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
  * Zero for success or -errno
  */
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state)
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
 {
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
@@ -818,11 +816,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(conn_state->connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
 
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..56edec6f1634 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -48,7 +48,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	ret = drm_atomic_helper_check_wb_connector_state(conn_state);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..742ccbcd7809 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -50,8 +50,7 @@ struct drm_private_state;
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.39.2

