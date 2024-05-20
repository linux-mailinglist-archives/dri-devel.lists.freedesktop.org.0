Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE618C9CF3
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9810E616;
	Mon, 20 May 2024 12:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ci4e7uLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E367110E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:12:53 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5238b5c07efso3093577e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716207172; x=1716811972; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ULxxOqfo9Pk/FYLX1o7pjkmz9b8tvWaEdfCGOVJ/5lk=;
 b=ci4e7uLizpBb4w3JjMVYwFwFYNTv3uO1tF2AgnpGYuQWFjntccwF9B/T9W86hE0uxP
 0MSwrzPwIy4UA+jdPkNbqLQX0buryA26nBylgaSzZK0Bat8FCISWokoNjVCfW9cN+ZUd
 oJAtMPYenJ6mzR8l+p9lRBjWaKRidPhgoKMg72KYBp8AG60ziNtRfZVTepeQJ+fI3h+e
 ceYUBsAXxAUmB0MMWDxwTIWNSkb3XC/4qQYKu9JmARvYmCA1IkBAwYLWBXx5yYRYOV0H
 gEQUnElsReSfK2Sy6FJgSn8TbX0O5c+EBCma1UuynCAJWiU/ueVV4uLWfKwJm//9WfV+
 zLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716207172; x=1716811972;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ULxxOqfo9Pk/FYLX1o7pjkmz9b8tvWaEdfCGOVJ/5lk=;
 b=NVpz+aZla0DCSJaBfXRBeQcod6c/8kFlB3ya9vNBnYgaDSLa+P/6sWvqFNIrh0gnpa
 2Xf1mhuchVhfWSfap+QAk4h9U3t69HRCVWWTThEJZxD8XTF1h6Ocyr2Ny3tPYw9du+Wu
 lXBX1K/cRPXWEjT97gB9CMgQ7Nr1A3Hp1ulMqQx4fBsZcd2VWLjP9/y3NEbzizXy61wV
 MVW532dvZKgBLzxUHdd/emjODTt8bav3cjK9v0d7aV4jZlOHoCPBMVHgosIiE9ICtFvS
 FSA67aLuxEyzjs/eCHAgUPTOTgyNRYsTcPvzD4SnDY+zWfMm3JnNrflZrrAay0lx7spv
 dToA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeFMFjEis5jOrEc7a8XrzadNHqKinTDBoQTfz6jK19Ds4XJ4W4f0JJnyorkqOV8ctk4Z6jyPsno2++NJvAYONTwoKvg/1CeUmViY0F+ZZA
X-Gm-Message-State: AOJu0YxhNBsx2Jf4+1LtQsxyWkQbyiE2wzgreGGjGPDfSEGJBpUtPGln
 4V2KTypLS2OfLnjZZYcIlLOT9p+xQi7Af+y0Pw53/WM95N/a7uah7GFfQjFqwsA=
X-Google-Smtp-Source: AGHT+IEDFC64P7lE2vW5UORuevJHqYD3lJ0Q6Zft1XJ6vcIYM0CJ08aXQGuk8wnlRo9yyagOOlQICw==
X-Received: by 2002:a05:6512:131d:b0:523:6354:881e with SMTP id
 2adb3069b0e04-523635488aemr15069284e87.39.1716207172166; 
 Mon, 20 May 2024 05:12:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:12:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:49 +0300
Subject: [PATCH 7/7] drm/msm/dpu: support setting the TE source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-7-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7toqt7l/FlYTMysY7uvgS2eGA3+iqhKd5LCxscTShxo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz49WIb9pbWI8TEiPIPXPOC3FSWNeWUL14WsI
 Cl+eS3sn9OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PQAKCRCLPIo+Aiko
 1RnvB/9kbIvgXcAMipTZjqDLOnWLatyxEZ8kKnjX/HWgL2JAGdYCEGDObvhFcTO41hlHIOKoe9N
 9xxZ1mkjyG9+P4JGTWNY1JGLzwZLtB/N7TNfWj6I8Waqk+fJPORv1NZCAQ1hbBhSrW8q7s+0PWZ
 6WSW0+aGHoeCqTuDPPbRr+01mtXipqi38tfbtpwDc2nIArQJc1A4vaV+NM40dJkEQXdd7cA6Fo1
 aMsqoc3Cp/Ty8gAZ87mVwenhKHZmWo1lmzBKKqdrXQf5QcyC8VHJ2Dr3dy5d/VnsUuhVL7SgCzz
 L6eKGZWd/c8XhHZRsQj7dilyZX8mx8vkB4t1LEt69lbdDoV0
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

Make the DPU driver use the TE source specified in the DT. If none is
specified, the driver defaults to the first GPIO (mdp_vsync0).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 44 ++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e9991f3756d4..932d0bb41d7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -505,6 +505,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		dpu_kms_wait_for_commit_done(kms, crtc);
 }
 
+static const char *dpu_vsync_sources[] = {
+	[DPU_VSYNC_SOURCE_GPIO_0] = "mdp_gpio0",
+	[DPU_VSYNC_SOURCE_GPIO_1] = "mdp_gpio1",
+	[DPU_VSYNC_SOURCE_GPIO_2] = "mdp_gpio2",
+	[DPU_VSYNC_SOURCE_INTF_0] = "mdp_intf0",
+	[DPU_VSYNC_SOURCE_INTF_1] = "mdp_intf1",
+	[DPU_VSYNC_SOURCE_INTF_2] = "mdp_intf2",
+	[DPU_VSYNC_SOURCE_INTF_3] = "mdp_intf3",
+	[DPU_VSYNC_SOURCE_WD_TIMER_0] = "timer0",
+	[DPU_VSYNC_SOURCE_WD_TIMER_1] = "timer1",
+	[DPU_VSYNC_SOURCE_WD_TIMER_2] = "timer2",
+	[DPU_VSYNC_SOURCE_WD_TIMER_3] = "timer3",
+	[DPU_VSYNC_SOURCE_WD_TIMER_4] = "timer4",
+};
+
+static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
+				     struct msm_dsi *dsi)
+{
+	const char *te_source = msm_dsi_get_te_source(dsi);
+	int i;
+
+	if (!te_source) {
+		info->vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		return 0;
+	}
+
+	/* we can not use match_string since dpu_vsync_sources is a sparse array */
+	for (i = 0; i < ARRAY_SIZE(dpu_vsync_sources); i++) {
+		if (dpu_vsync_sources[i] &&
+		    !strcmp(dpu_vsync_sources[i], te_source)) {
+			info->vsync_source = i;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
@@ -543,7 +581,11 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
-		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
+		if (rc) {
+			DPU_ERROR("failed to identify TE source for dsi display\n");
+			return rc;
+		}
 
 		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {

-- 
2.39.2

