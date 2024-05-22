Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF438CBF87
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C1210F4C3;
	Wed, 22 May 2024 10:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wYG2wiGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4636B10F4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:02 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so6899521e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375060; x=1716979860; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9dResiOVnD3KDBKBragxWJ8JzwAGCkXgZAm144m2F5c=;
 b=wYG2wiGGQxif2gDoCk2MZAHENyPKqkWA8SczaJZxzCF2ySzq9YY5GriqJFBHBBKsTZ
 yTPGSAiyZNmD1EgWig/aAqqvp3pTZr4kWBhNG683j2jWnXJb0v8CTwFbjram7dFg85Pk
 sNjUuW9iwr2qAqNnZWnQeMX9+2AMxDXjY5uaj3n0PIMDXqZUnSvyj+IHub9FC3r7WYvP
 0lY3soLXkVVer22IHFb7G9RNfG0bWtcjbxSd7SqaQnG+Fxz1wtRSR/RqcWqpLTkOdFyZ
 Iu5qxz7g/KF0aXUSMaeAZLI9Z5lzmG+1W8ciPPLCpCRm9EDPRnenZpU9+Gjj82y0mEYw
 EXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375060; x=1716979860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dResiOVnD3KDBKBragxWJ8JzwAGCkXgZAm144m2F5c=;
 b=Y4fdh3A2oaCw5vAFV9MZlIePyxLLKMOBCIzEkCv7MKnobKZlbsvYgWRs3ec+VDu9ch
 gukYQfAWpeav5CIbh1yL0mFXjUpOt96WYkKOjNpN96f4deObevcFsBBobQMKIzVwiRt7
 Gn3bs4M2aSViRv4LV9z/ETTfSq4Y7jtmxff8ZrMz9wZ4mDRkPjpbWojw4GhBB+yioIb/
 VEg3dUuqpxdu99q09WO8XhsyiSTsGBUJgoL3ebkCYhnVnTlsBa2vgu98Pkr3D7uVnjYD
 JDtVLFVpm9LcxhWTI0krYfKA1MCGcgRmbRm0Hz71+6DeeizxNGkxM0bgmbdlsHXLFjIf
 ILgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM+LiIQhzBw5HhocTVQZ8yENHibrBTmRyNtwlLpOvUuJ95lfYxrxNYFlKNnn0XgEVCyPovKEaPzZUV72M4ikTNb8F7BDujJDItmztKBqRS
X-Gm-Message-State: AOJu0Yx87+xcZTGsgCOS1EgGb2qYLNJWUuRnOGesz+fpJiNMf9wyhlml
 4lidcRNhjMGJsX5DIhRUzvtC2cBiMGigm6OHbD6UxULcT9lZ7mb+lM9naInRh+4=
X-Google-Smtp-Source: AGHT+IEOC9Mt121LUZMOGbgq/bBML1Pc3j8MLinnpLNjgkjcRolQAPuoJbIEqAzUiz7UiRJq4scneg==
X-Received: by 2002:a05:6512:1583:b0:51f:5d0a:d71a with SMTP id
 2adb3069b0e04-526bd694ab4mr1047130e87.10.1716375060602; 
 Wed, 22 May 2024 03:51:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:55 +0300
Subject: [PATCH v2 03/14] drm/msm/hdmi: switch to
 atomic_pre_enable/post_disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-3-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=osqs9uVQGma2pB7Uqqmi191XkOj9NO2HEt9nbTjIsVU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PCjd2hgbwjgDirDxBNAxSDUfP1Beqm985y
 mK3+UPx39GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1WPYB/9GLMl/u2GZ6jjdkuV0W4HL2lvbKpyLAgp7znyuLJlQUAPszh1vOixoX8xNGhFns22vham
 I4iJi+J8EkXyOxci+LIH4tRVsV/SxwHRSEW/e3Cw2bXrKQmcDYv7fd+0GHrCCLjcpCMyebaojiW
 zRBJyJl3CHbBr5p9gzsVLMJylnF0DZTA1ug30vaVjh9K08tofK+gyZ4Ispn4JPX3qyHCuXfciM2
 bPq0rZyOMrJ8bx5Jt46S0g3gIGzI3yhMeb83rVW7IeutOq0m1XsS63rQmH/ccGOypBcBVfxVRjx
 JO7Ny9cUSQ2fG1qG4VcrKyPdZonoRdiIM6VG2BeF/b+MX3uD
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

In preparation of reworking the HDMI mode setting, switch pre_enable and
post_disable callbacks to their atomic variants.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9eb4d06bdc0e..3c6121c57b01 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -120,7 +120,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -146,7 +147,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -292,8 +294,13 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
+
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.2

