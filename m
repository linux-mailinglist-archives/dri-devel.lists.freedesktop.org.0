Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090FA2AA7A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A259910E853;
	Thu,  6 Feb 2025 13:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R6dVb+6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C16B10E853
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:51:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30761be8fcfso9383711fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738849874; x=1739454674; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
 b=R6dVb+6BLjEKRiAcYDaJ4lk0uNrCcYeG+alnQMBR+6xKSGxrqGOSyQaDj7qAQ4UzNU
 63cnu/hMx54D20BRQZupOZb8P1lzbN1G2wkYPr967jlfzsJ1Gajr7anJLk2WDUKIaxad
 iBzqWsvrP7GtYD9bw66XJ4ONy7LdorfB3TiLDeQIVuBmxLwztvrU6UfT6tAXvPkKbPJA
 0woGsY4OJz/ahCX6XknHzp0IgvcDObrV5xUholcmDOGy7ewlK8WZdTYeEjQuIEn89DlC
 Cp6sKekid9closkzAlwosWhQT8JniN1OpQQOytS+TKfVHR4zfcqtY7qj/iP1DKH5H/kR
 iNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738849874; x=1739454674;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
 b=XPWm+IzD6WrQhxpgRG4JHX/3EuwNwHIc8DhXhcCskb/HskG+TZmoLJXEpPxNC+SgFY
 o/ppAi5i/oQcjBqGnxNK+EtChv0eNaZrDjJlAqJMigbkbjxH1VzamkGl2GAPVyixT4Ts
 7vVWId/Sp9g5OJ0ySrTdpNEMlxg/0tt63eKs4su2csA0eUaqvmx7IekoyRaODALinHJt
 k2DZMKKO2bHiz+OsDITTktZUuAmrfVHH/05LQswguHko8y+GqE9WWjXWxyOvLyXfiw4C
 YYpeknGrpwr32TF5QVvBxkqrkn2sXy4kNMaAbW/T2MsTevLicCQKxXtcvp24xDC4SI1U
 HbwQ==
X-Gm-Message-State: AOJu0YyMU8E8SAjGP6JrKJ3DX487i12sVQdcdkKEa+HDgPZ798mGpbV0
 73rl15yLtXGAeY+b7ZZd3g2597Ihc0/WeWfxw8RiHibPLQugQl1QqtzUb2w8IW0=
X-Gm-Gg: ASbGncuERLZLb7uS5jt3c6tPPOpYeP9cPTI6qOmCn+k3iBbdP5VpKXf0A5d/QawIXjs
 LNvrP8qV7mZvJ1oRBDPv2oTY8A4lBFy4cEFi58PUKfF+gxQQ4+F6abQrdzxfytU0lyh+5mRwxpt
 0ztFgfzdw+XM30lbtKKK3snw/HOFrJhVWaPH0fxS+t0KSrGL6m4Lz8yuyNFeROWXep3i2g76u6a
 CjBa7/8jsE+Oaz3g0cbd09gdi5Y8BXtBkkmldOV81KvtssK+HoM6rlliQoswx2LlyBC8qLwrEBa
 UNPsbAslGxrraB6pBwzNKME=
X-Google-Smtp-Source: AGHT+IFVFDfXSZjE1F/bGlISaWdVp07EGr0sKbBBMGoJ9tmIeAf61QXHP/XAxmfmNjKasQbwOOV15A==
X-Received: by 2002:a05:651c:220e:b0:306:10d6:28a5 with SMTP id
 38308e7fff4ca-307cf2fd818mr19782961fa.1.1738849873746; 
 Thu, 06 Feb 2025 05:51:13 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2da11fsm1318521fa.92.2025.02.06.05.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 05:51:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 06 Feb 2025 15:51:06 +0200
Subject: [PATCH 1/2] drm/display: bridge-connector: add DisplayPort bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-dp-hdmi-audio-v1-1-8aa14a8c0d4d@linaro.org>
References: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
In-Reply-To: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5826;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mpzXyzeB8MzX6qw01rpg9ImZYnr1dtKSgAZWq7ewrIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpL5NvB6ifjaYuLuKli9fRX9kVvhLcwV5zckkk
 Lq5MI/ckfOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6S+TQAKCRCLPIo+Aiko
 1eMVB/9C5K8gG52o0STml3vvf1liB0s84Ks5LDHy2F5FdlMIwEL0AxG9pJhDTraRRWQxWhfcvdx
 iWeHDlaCIXi8RzKjv0OpVXsU4Z03b8ZLePuqEpF1pc/SfnSNTeVvQOdgPpFoD0yOXQmcVRyWtDj
 QiQuvB7cxu1O+bdPjgtmngnoXBpWlyGolJdbuOrPpPoC9OCfy8YGpbUDxmvG/ME1bajWeuVdKx/
 0/PLY8/irbp+KQlLRyb5y7WXztG2GuCyDVSzDHAXpkBKrF6/WilK//fdnEh+lM7/0CdHc4XPEFi
 Rong0q0dDjjHWMLQ2OKVYrcH2DdiGB5rjyI8lfDLCpjvH/Hw
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

DRM HDMI Codec framework is useful not only for the HDMI bridges, but
also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
define in order to distinguish DP bridges. Create HDMI codec device
automatically for DP bridges which have declared audio support.

Note, unlike HDMI devices, which already have a framework to handle HPD
notifications in a standard way, DP drivers don't (yet?) have such a
framework. As such it is necessary to manually call
drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
can be lifted later on, if/when DRM framework gets better DisplayPort
ports support in the core layer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++++++------
 include/drm/drm_bridge.h                       | 14 +++++-
 2 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dcb4ac09f3da23e4615dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -98,6 +98,13 @@ struct drm_bridge_connector {
 	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
 	 */
 	struct drm_bridge *bridge_hdmi;
+	/**
+	 * @bridge_dp:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DisplayPort).
+	 */
+	struct drm_bridge *bridge_dp;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_audio_init(struct drm_connector *connector,
+						struct drm_bridge *bridge)
+{
+	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+	    !bridge->hdmi_audio_spdif_playback)
+		return 0;
+
+	if (!bridge->funcs->hdmi_audio_prepare ||
+	    !bridge->funcs->hdmi_audio_shutdown)
+		return -EINVAL;
+
+	return drm_connector_hdmi_audio_init(connector,
+					     bridge->hdmi_audio_dev,
+					     &drm_bridge_connector_hdmi_audio_funcs,
+					     bridge->hdmi_audio_max_i2s_playback_channels,
+					     bridge->hdmi_audio_spdif_playback,
+					     bridge->hdmi_audio_dai_port);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EINVAL);
 			if (!bridge->funcs->hdmi_write_infoframe ||
 			    !bridge->funcs->hdmi_clear_infoframe)
 				return ERR_PTR(-EINVAL);
@@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_hdmi)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp = bridge;
+
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (ret)
 			return ERR_PTR(ret);
 
-		if (bridge->hdmi_audio_max_i2s_playback_channels ||
-		    bridge->hdmi_audio_spdif_playback) {
-			if (!bridge->funcs->hdmi_audio_prepare ||
-			    !bridge->funcs->hdmi_audio_shutdown)
-				return ERR_PTR(-EINVAL);
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
+	} else if (bridge_connector->bridge_dp) {
+		bridge = bridge_connector->bridge_dp;
 
-			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
-							    &drm_bridge_connector_hdmi_audio_funcs,
-							    bridge->hdmi_audio_max_i2s_playback_channels,
-							    bridge->hdmi_audio_spdif_playback,
-							    bridge->hdmi_audio_dai_port);
-			if (ret)
-				return ERR_PTR(ret);
-		}
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25da9ba9e2963f18ad6267 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -811,9 +811,21 @@ enum drm_bridge_ops {
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
-	 * drivers.
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
 	 */
 	DRM_BRIDGE_OP_HDMI = BIT(4),
+	/**
+	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort connector
+	 * operations. Currently this is limited to the optional HDMI codec
+	 * support.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
+	 */
+	DRM_BRIDGE_OP_DisplayPort = BIT(5),
 };
 
 /**

-- 
2.39.5

