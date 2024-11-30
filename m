Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220E9DEE73
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082ED10EE42;
	Sat, 30 Nov 2024 01:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vMiy7yaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FA310EE3F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:53:02 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53de8ecafeeso2740905e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931580; x=1733536380; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z1lXYCxrn128DpMjUx/X3ynnQZTeAwK/ttm0jSS1k6c=;
 b=vMiy7yaHDJSKFPeV2ArixK1ShqjX5JexcvVmEIs9k8+7COaFPhW54S1/z9XEGeznYM
 Jfh1OA3NjketQT4mVpA1R4czSN1djf+B+GDNHehawZnw1waJoSN7DSFnpPcw8fPs+BNg
 xsbxN8GNQPHkFfXV0j8mRwYpHqBmgyVG6+mYP3FTEy7KwVVKqWFtnEpUmTUO6/RjN/zx
 BxYEffQxhZKoEO32jftQE1wqrBb2WLMxDbBbDVhhnuULgzE6zRrDIIOtIxKRCyFOKeI3
 Oh+16DiU3bYbrWkcYXMxmmRDMnHJudN/IR7kRcn8KfEno+P1GIYwyPwiSVML4OuCHWlo
 +XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931580; x=1733536380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1lXYCxrn128DpMjUx/X3ynnQZTeAwK/ttm0jSS1k6c=;
 b=pZo9Q57G4x6xlvf9bWqjwAIu7++dXp7x8afLlHKCFGemujP3wOeOSg0Raojb45xra+
 5r/Guh5l8W3Dcn0uSNIsFdZBpXrLPyg6SIoqsgVlyxmZgn+BHkh5j3yvrUBEKXnj/Cek
 d7AJQ44PcIT99pdTug9QNq+YseErLVcGIhlpMfsBuscB3CkP135r4PvM6XYEp92bZoQ0
 7wpm0X3DTm4INvxmnomjsTezshBAtGQKMIl7mi1v3IPBlYCNhTuLQ2hS0QZunW9xmWI4
 u5Qf9/DxNPV9FHAXQqdhzSLrfEGQxCnz/tHyOgTv1jGxHYWzSxRpeZ8Alxjtp39QS4rn
 L7Ng==
X-Gm-Message-State: AOJu0YwabfnXzLom1QgfK8Uu9laoLezLzigsE7ftxeVoP4d3kwsousfj
 RJaZbfbBlG5mZx2N0YweftlfrU+ydy69QdmvEw3Fo2aCqFYeiIdaSpwYWnmF6xE=
X-Gm-Gg: ASbGncs0IGBiR3IqTQZVKmQQlvq0YElqiJ3ADCvomMaqNOOBxRo3zYYh0qdRmzkjkwd
 w2fzLKM3bHKADVFalFJ+PDMFElSnvLpYiS9szx3DzjgUat56y7uwOEWuluZn8bDqihrOiGNrhQB
 vGkMNQfiOrMdI0oPGeF1Xx9L64N8ru/Ivdoi40rawJiRWaObh2B7/DLdhbRsbIe36sAThWTPly5
 z3a1tOZUjwUQIKi3cuiHyVwF1NMheEDVLP5ap3RhmB3BW2/8zRjQTCGuw==
X-Google-Smtp-Source: AGHT+IF1zZCeJZP0c56HDhB3dZvzfBBbMK+T1fbyelhZdZGvyXwekGQxsUf0KFWRtcl6qeCukozDbg==
X-Received: by 2002:a05:6512:3ba2:b0:53d:ab21:4e17 with SMTP id
 2adb3069b0e04-53df010e3dcmr8347283e87.55.1732931580177; 
 Fri, 29 Nov 2024 17:53:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:35 +0200
Subject: [PATCH v5 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-10-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tt33sNy4EHSANTDHQAExXai1314OqzFqkWnpPj2YPOw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/hEd3SJUPYNRrY3fgh17VdYvds7f7Q168Zy
 EaL3JawgciJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4QAKCRCLPIo+Aiko
 1X26CACq+Vplt9h/bOf8vjWm6vdUiW7JOHiBTGnHe70WgxSHu/ZuvlCePWg1uh99nqgs2ima6WF
 a9lLDOxqI+EJiL4HXVW/9rMgRI9+kPpvRo4ZpFhSzWDzSDLhXw69MnpuoryWhAMHZUyDDqAaP6O
 eiqfS2m9WWGLc9eup/Hiiuc2DkZeZRIUpCxUytQsfiM08yjPmolqxG1B6UJFaoNBNQnoAiB6NKV
 6yENKHrcdPICm1HbAhl90zh1cQYxOeCxuPr/++Vj6Lb/96pS3lioxQ+HZxLy35xyxCP5nSvsOIB
 IF09MJu53IVZkYd6054wQHgHWjrTHeEygEM+tXSOP4m5zQ6Z
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

Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
char rate check, with drm_atomic_helper_connector_hdmi_check(), which
performs additional checks basing on the HDMI Connector's state.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 54b72fe220afacc208b3fd48d5160031127ea14a..b05fd77870b00aac97d003f3fb9c2b98cb73abc0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -187,24 +187,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_NOCLOCK;
 }
 
-static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
-					     struct drm_atomic_state *state)
-{
-	struct drm_connector_state *conn_state =
-		drm_atomic_get_new_connector_state(state, connector);
-	struct drm_crtc *crtc = conn_state->crtc;
-	struct drm_crtc_state *crtc_state = crtc->state;
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	enum drm_mode_status status;
-
-	status = sun4i_hdmi_connector_clock_valid(connector, mode,
-						  conn_state->hdmi.tmds_char_rate);
-	if (status != MODE_OK)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -258,7 +240,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= sun4i_hdmi_connector_atomic_check,
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.39.5

