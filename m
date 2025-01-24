Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B3A1BE1B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 22:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EEE10EA25;
	Fri, 24 Jan 2025 21:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rmPopzzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12B10EA21
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 21:47:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-540218726d5so2765667e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737755271; x=1738360071; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JhgOYJOSO/9HW8pwqjPKCM7ncfLkuDOo3BKPxNB2SGk=;
 b=rmPopzzvnM7kqoWcu/dTkO0lh1WYUT/pWpYps7RtW5hgMbJirTYLtN27QQtjRbyR3Z
 QP741FJlufhiplhe+8EouJBMfNslpdpP7yiGgZzp1stuxsMZpJRC4iFiobTWSQ2KO8qW
 pGvEd+KQQ9ltmiLpvEj33kHDVMDoGtLYuyz8ZkVAaYJqFULHmyuJWoaw/1ymipCfEvvw
 5acnAgTIzPYHh8wVzAT1xI1v3fibUQqHV3t9QIsjK7Ko2TqXL79ovQeVKWZjUdZhgnXj
 fBY8p6vhuYYXkVIIqijoEpjlZV1mor3nGr6igVq3K+21B5JmFKgAnfwy6EVoRH0WbW20
 tTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755271; x=1738360071;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhgOYJOSO/9HW8pwqjPKCM7ncfLkuDOo3BKPxNB2SGk=;
 b=seMGnDnJj6eznVECbUNswSoT6fu1cqbreu/jI6H98QQfZdk0LwJ89CZxu5gZykKWK2
 4++qXpq/tk+M4eFyBU7QobmGEDO0uaoyjnwy9i6v8ZJukYAdIQHk6w0ZTjXPvamp2Snp
 WYxrSwdyOrLqcEMo4UJTU1yYOpO8Mmqd+2gunp8IZjz/ZkbsB+5e6nDYojQiN1SrkWrA
 +AAbGLAEPJLGVAkzJ0nOH747ZLf6l/Lw2JE1+KjWdxJdCgxoh8Ja0H0zZ7yPE3Qc8eaB
 dcgRtuM9snpt0UWrQ/qIYXy3Gkvm9w9iCfYCSnn8AE16PNnFp/iuhqDuln0IMYTRn91K
 JOkA==
X-Gm-Message-State: AOJu0Ywi0RwzpBbs41vfXKf03VboHL2f5IAhuTBWMb/MJErbTjFEVNg7
 kOMZxX2daOpJ74zWT4vEgQa/Ifzmla8aGTdomxzbdGZtkbQ2QBuUiwUD2xl+xOo=
X-Gm-Gg: ASbGncsHQYdLXP4Rtj2TBPfhfeyNVsMd6pcI9OUhHR3MtZiWUnFvL81L8VxkqJjhxQI
 sUDvTrVCBNJKGpPZRRbicdV/aZ3rrX6rp2r7mrewsvuQkWmLrC+GLQcehR5HdzkFwQqTTqs5Cku
 vPH/B81kqL9SCpuaXHD81Tw+PjY4nFMzXauI1dRpcdk+H5YX+Z86rnzYhwFZ9mD/ODdJaCJIqt8
 OLmRgtpfSxEGjurda6tSbUzLK5IOpP6rVbNcPU+8zhO2qnpWZy+o+R5UWCyxdg8qpKKoYMmOp72
 U22X+p3Nrfym
X-Google-Smtp-Source: AGHT+IG3aO38brRrPH4wfS/ESF1jDMyHBbkUhw38gLmmUNsh6Y0+nVc1isQgg/XzuGkki5VpcQLIEA==
X-Received: by 2002:a05:6512:33cf:b0:540:202f:4955 with SMTP id
 2adb3069b0e04-5439c287371mr10458923e87.46.1737755270703; 
 Fri, 24 Jan 2025 13:47:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:47:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:42 +0200
Subject: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3301;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kSze1JGUTOGCYF8m3i4MYZAmp4xJmoIk6UQOajOdpeU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAp/oXLWfpEl1f2La3MXrLoICQDHEdQlVqJGS
 Hgv35KeEmuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKfwAKCRCLPIo+Aiko
 1ZuSB/9DaAKzIUw5clYrcanQGnGX9s9BZCzORMBcPpZTGFMZKIJKxqmI9pCa2ex2sDnjak/OPfg
 NCfGVtGE5BYeOSgfgwCO82Pk09Ied3no7INTtYIVVnLooa7Z2DTUhOJc26H1V3qwhHz1/4K3LVM
 WoHbtgpGyBUseefhJoX8mJy1nHHAdH1mfyzRT1DoPwuwDHDg5y+rAbpS1zegi9slnm0kO5yCjaJ
 gaYi6y0C5K6UQY8SFawJRHAJz6d9GDSHvAoycThmdjKhV7v1BPW3gqGiZoYet6InKQmngG3cT2C
 vKaFFC87Be6XJgM71aJisvBbNbz4hdqIANRYkHj8bnceCFIz
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
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
+static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
+					       const struct drm_display_mode *mode);
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
 	DBG("power up");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	if (hdmi->hdcp_ctrl)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
+
+	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
 }
 
 static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
@@ -177,17 +190,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
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
 	hdmi->pixclock = mode->clock * 1000;
 
 	hstart = mode->htotal - mode->hsync_start;
@@ -306,7 +314,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.5

