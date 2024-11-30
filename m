Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A999DEE71
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F4910EE3F;
	Sat, 30 Nov 2024 01:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HHrhGqd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D87210EE40
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:59 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53de880c77eso2975280e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931578; x=1733536378; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
 b=HHrhGqd05Sr5ttIu3lDKAfm0FERP3doMVgZ40YWeCbKrqPKTTrlqXcGJMZBVQyZp4S
 ANtbXgqPVSxQqZGKYmsInhqYpnNJt4ZTDl1Onn7XTMx+WIPiK3FErilJ1oqUod1A/JGl
 aKrFr9o5RjHE+yXvLx+lL+lAQGP9ra/RGs6UDW0e5zGvsxQbOXTcH+NnXZAeXR4nN4Ey
 dAt7v8TISsp7AKYdQXq8ZTiR4IHB602aK7CzjC+NCf7sPKF0aj1X80e4hBliaG4+pfk4
 tu23RVhazBdwWREtzo8DGUYyPTRM8pR4cprl4Wsll+W5KlU1qfcLckmfPr5OLCA6p87Y
 TH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931578; x=1733536378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
 b=NGBDqJTeMk2+SVVGXOspo7nyTkMQJD4GnXuMF2BulSWsHYYyJhwhgXK03L7iqab9bd
 PjA9OL5ER7TLfE8aWohlCvP00PCv5PQI+fL/szyJnshyO3usnENNZSHzgBbapkcvGNJD
 zZk0oFVYpPm+1r8XJm0G9sqv+Ipx29C0ul8lM0bSSLKYi1cIm0UTCPRgUUFNGJaLktpD
 QFxgR7C6/Vi4pz0hYTLQTv2hoqHCt4tqu4MtogIQ/6fnn3iytxx1NRWgUm7sY6TDSQRh
 fsR2MwfnBhgijO0UBV589JTFrwUTLr9djOAbuJSna8uX1VhOiTkZSBfpBDnJBwaFtDLs
 VoMA==
X-Gm-Message-State: AOJu0YzOhadPGgUGdmYQNvECBzQCFoBXCbBT5qXZdQZ8L3A3oVg9leqD
 wc4hlm+t4W4OleVROCA/2wlpQFCv8k4+SopMVhp8qKSIiTJQPvLC2H74+QzjM4k=
X-Gm-Gg: ASbGncswXPudZbQq1d/L2/E0/GL4VnaTsJmr+vOOk3TA8rwY5eemQq7EHtksM7znDIA
 I1x8tj0ZAfR4WrwcNakHzNlZSvQKwUW4qAcl8sumOaZpwAjzba4fxkxKqM2WQp4plZxCB70Y6qE
 YqoCpoh0VoPuQGIEdPwaPZUCdrme2UzAzfoQGYeBzi5YX2uGUo5F3MG0KNaD3+oLYwnqJ6h1u9y
 pk3phMkRM4Ncebs+N3AoXUb7rnUwjhKrcQghASTLCm/uAoFkXvfOsg1Iw==
X-Google-Smtp-Source: AGHT+IEPMkwzovF1BGtYWQPhSNDkhj65yoNCvxf3xV+YxR9n/u9tv7nbpK4B1sxwKYxaX0pKkPUYkw==
X-Received: by 2002:a05:6512:3c81:b0:53d:ea1d:50fc with SMTP id
 2adb3069b0e04-53df0111f03mr8755501e87.48.1732931577781; 
 Fri, 29 Nov 2024 17:52:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:34 +0200
Subject: [PATCH v5 09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-9-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/hP4NTjv4z5OlKc/siHNPmPX53A9tMpMizW
 QagCkkZEseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4QAKCRCLPIo+Aiko
 1YEYCACSjhD/Ij07xD1HSZ7Kb4z+Son1xvlSmJAJ4SpssXNb9iPUFIVI8goXplbGswSwyMT7gN/
 TJA4uoW5pm1VZfjXG6tfbVQkLp1egYiDvrum1DeygQ92wEt56uRPyVIx4IdIfPtB4T4NeaaxRHz
 LQnkHZDgA5FLhdyenT4uGiwtnYN42jAeIQOKN9kR+a3UWYD+yYdlR7SqZ/7LE57ljVXynJbKs6g
 U1MS/hQbvYoXlzbGG88vk9XYuwEsCee0SN0HMVpBvPgf+iAWlBzry2fAO18n4a3PcxUb5yoO8pZ
 BJV4wpwjoTw7LieiIOIG62SIWjAAknBD03dVAhxa/2O9Jx3N
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

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5

