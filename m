Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B18913668
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890C110EDE8;
	Sat, 22 Jun 2024 22:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mhx3JL8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74ED10EDE2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:21 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebe3fb5d4dso27515951fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093739; x=1719698539; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0wEX4Yto30IpkmFMs/2PNdUGRMDgLHDuNenxP6Onffw=;
 b=mhx3JL8b/R7KYyMZeNWpZlBmu0+b8HtDWXt4VLeZi/fnAiVMBUVE0Amz0B6YRf+hAw
 EtiGRZswiIWsArOjb1W6Vkzmp5fa6Z8uBNqKHqBOyOzDhCxvRExFXyY4RBhZZXGbqrfe
 ssdZDksw5fT4+3XgwrrB2V296ZgbtwenMviC3Ttt04dSnZVLG/Zpb5ZzdAT7mIMfwBeQ
 TJznsp5SgsyAzGARVYdyKbx0OQuAOJBKbNjaQaDEguHdUE00ejxXsq1LqzaD/Mnu/hHj
 1UlqeKt6rUyPNf8GW8AMaPUs9sxZOVDtBVlR7pyuGuTwj3Lt+DNJCFta8j7WdIwjZwuo
 A7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093739; x=1719698539;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wEX4Yto30IpkmFMs/2PNdUGRMDgLHDuNenxP6Onffw=;
 b=dx2drbruSjM5NBea6T0MzlKr2d6W9tpZr+/CIMcvAIdxRvZi+KkCxcGbixS9egluS1
 Fj8a6PEDwCD2Jj4Jf/Nj+p2Z+Iey4oLh0VTf7X5tSmQycBSD8T0PAeX5s2xcqHFACFLq
 z8W9XX0Ec+UYUkSIgK1c0c5W0UpmTgdAj6OhQ5pIDIc+TUVoL9pa0Lwja/VCYvyz5Kcv
 OIV8YB/MK11WlTWuJ9uTEqQEh47fWA0g6XKrIIbYrF7yTyEH3sMp6EkcsY+uBFmHSbkN
 zBj+B1DLlvsGeDIH5zQBlCKDgvP0DxUuia4qMTmBRyHOqv8T6r3mgpjjIpuGLXXo6ArT
 qg8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgbZ2wepnRa+dp6VuN/2zdaAThAsJOOtmi4bRDN1amtVlC4raFC4BiQ+QQFTaSO0owBIWe/4m2JLImHI7fX8HZf+haogs14c11CNiqInQ+
X-Gm-Message-State: AOJu0Ywj1Z9+ojv6vS59wAxAUP+/hORNBKg81fjhTil6a7HmNdFIdDpV
 SEhq2ge2+YTAMvMajpKnzSHSl3ik0iAODc2UFdB6IkpQKd66sSieaiEBMBiUeBA=
X-Google-Smtp-Source: AGHT+IEdI74CL0f7ufTLv8SMKdBOVwYB/E2BMf/MfUp1uHBXxRD0EMKOJuGq7/P8DqPrTwph+p61uQ==
X-Received: by 2002:a2e:8789:0:b0:2eb:dc3d:cd00 with SMTP id
 38308e7fff4ca-2ec56b8282emr5671941fa.14.1719093739578; 
 Sat, 22 Jun 2024 15:02:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:14 +0300
Subject: [PATCH v3 01/13] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-1-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3152;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QHJFLuLUkbw1F9+Kq0qmn518QlvE7rv63CWK8Jlxpns=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q554v+Ssamd1VLAyMOMNhyrcySWPbvFIc5v4yRa4l48
 soYyUWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjIrxL2/7UVVbE7b/w81f3u
 77TNokce+/1+ofbSdjPf3W7/Odwe3DkRLF+bb4s4/H6trJO8fr5CbieH+JMZ36QkZwUvOZPGO7/
 kl2rAfz85sYNbopSSBRPD0ycLLJTS/dj/vjtC5FXQjOccrTLJmoIOC+ZHR9/pnh1WveaAu+m52X
 t+SfZX988v53DgnLzzz0S9aRXnRRIY9qdvVq2MjNp+2lhGp0OgVuDtg4T83tXf2PR1f6wsVnabp
 RWiZXXqT/C31y/e7Nt690OkrdXEs2ES37eWVp8q+vq83vSUyOal6W4P9R8EncxrX9ZfGjOXMX2Z
 58O+PQ15dqwrHPO229w7kpGQy+QVPKOnxaU8VkOohNMIAA==
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

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
that HDMI timings should be programmed after setting up HDMI PHY and
PLL. Rework the code to program HDMI timings at the end of
atomic_pre_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 92c95b4bc1fa..438416eaf390 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -304,6 +304,8 @@ static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 	return drm_atomic_helper_connector_hdmi_check(conn_state->connector, conn_state->state);
 }
 
+static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
+					       const struct drm_display_mode *mode);
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
@@ -314,11 +316,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
 	DBG("power up");
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 
 	hdmi->pixclock = conn_state->hdmi.tmds_char_rate;
 
@@ -336,6 +340,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	if (hdmi->hdcp_ctrl)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
+
+	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
 }
 
 static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
@@ -360,17 +366,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
-static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-		 const struct drm_display_mode *mode,
-		 const struct drm_display_mode *adjusted_mode)
+static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
+					       const struct drm_display_mode *mode)
 {
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	mode = adjusted_mode;
-
 	hstart = mode->htotal - mode->hsync_start;
 	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
 
@@ -474,7 +475,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.2

