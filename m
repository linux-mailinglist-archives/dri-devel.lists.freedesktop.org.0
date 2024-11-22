Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05879D5B95
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3615910EB15;
	Fri, 22 Nov 2024 09:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TtP7f3LC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02710EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:36 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so365773e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266814; x=1732871614; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
 b=TtP7f3LCB5IToXeFSn8LrhdXwCWKlfAetZpNxxTHB4HztvoiRXjcPij05zHS1SenSP
 mX2UhXnpEnZNRTClfr63wQy+xztWu7E95gkT19oEsI03B62/Oi+Rg08ZjuONg7iQknrN
 cNcoQ93eYtyhv2z27YPwhpO0kJ7M5Q4smiSJHwnojHg0E1wF4x2rVg4tXyxhRCp8VYRW
 fM6q/3ftnzb1dMxzVyBhU3JhqPl8t7WSy3dF8i7N9Ma0I40pBVTRhWdITt1GuzaMyQNb
 i7At8TvZi94GuIyH1RmEd91ypQgjPZOki63vSSFz+jAelw06jyv52pdJlF25zNd1v6jM
 sT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266814; x=1732871614;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
 b=vqe7/NtgLKCcgXj5uzuY+7F2HJPQOfeHOfQhXiPdUYQ14uOvSxIPpwpjKP4lwUdSqr
 ynTgrhrlbyWUEZLmKjFCWX91rJzEpDoJMZEkBuHm6vZTWabfWrOWOXv5U5IcRZuv8eu9
 BeVG6rynLoOQT44H3qgH3eVtanBdRRB/nVSKOaCHDfq9FYf4vUbmyFpF4XOdNH9t0pYT
 RkqoVO3codSHHsQNCZWzYD4TdfM16DLjLVceIF9psGjCHv3Ru+hp1eB8XQYvrDnbSOH+
 zBFNYSR2YOThX3sBCGfm2Mp0KbVzz5vRUHHSnS//mdEri7mzUhcYBZ4odgqTziMcGs8r
 tzhg==
X-Gm-Message-State: AOJu0YxMITdaeBVJplONDeEy+fjm9vp8YV+ehqPv2IA6Ojv5ln1pfuN7
 nJkgI77zjix3eSYStPva6VQpGdayHOPj9sFADrPhBhp54fplwJBjSXAyexyjoXQ=
X-Gm-Gg: ASbGncvP43cks+fCmEVYAWBdFuA0KY+NPViu8fGNc9e2I4usWVJjmp9ONz4j3TvLpLr
 a6pnuJixL99FMtQCHpJtTv4dXZqNoubGwb8wy5j2bnC3mJiPg9U798kX6zRpZBb7kwdjG0I2nPD
 P7NwCPhzQ18z/Rnr3cvnQKIcbypJMZdE7mu0ArmgKBajY/1zhrvlqKmZKnfNj3EbmzbxSGt13H5
 zyc9r92y/hIAjacqU013OMgbPfwqTA/ZV5bvDPXwRc+WO5Ht5lDayBelQ==
X-Google-Smtp-Source: AGHT+IFuPDVVeiIBHBx+sqGVLigoH/J3FctzJhynNILKoVJRUYGgovyLxnstEYxyEorm8Lhl1P2kvQ==
X-Received: by 2002:a05:6512:230b:b0:539:f6c4:c29d with SMTP id
 2adb3069b0e04-53dd39b4d2bmr879301e87.54.1732266814401; 
 Fri, 22 Nov 2024 01:13:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:06 +0200
Subject: [PATCH v4 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-10-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NRpLumrdDZhSXCJcusWkwzHsBkwvkTsOwVSCIyGYQBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsiTDOV2BoHyoyOts+0adMkGX+r4MYsJsnPa
 Far8OQb/72JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1UrVB/4mHUMcziWq1wY32ABnFkVrTROOJMHkHk+6+aK4dszHbnC762R/MtVLV2lOqnA6MnxSNW0
 EVuY2bQWv4PVDAZe+RPKyAm1fyLq9OizOUvRo1l12zL/O2139m41O4x3tI0r6uFqif8Pn4rZMCk
 t2ZMyaLmzPC6ufRtblUgk+VXVLehNTanDBHYRGga0siqsAnC662tRVl9Nf7/u1NOCILS6qYcKel
 P1sPNcHJSvULZIp9OJpXG/FZB4M7PHg/tR5MlTQzjrj0PWaj0798D+vDyF6eDysiUqnzifGcaGx
 giuaughGqZtani8SvGv0/wuVrNdnUepnAPAPfoATeqV2sc3E
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

