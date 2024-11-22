Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE839D5B8A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD96010EB08;
	Fri, 22 Nov 2024 09:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HG2H16ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772D10EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:26 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53da4fd084dso3071830e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266804; x=1732871604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+yuGfl/EBV1L9yZwllQ4z7rC0GCiUIVGF8V+6a/LgMU=;
 b=HG2H16kesLxyLEyEJkYkBYWAFMYXqksjXaChJyeyZbdnlxXnvCrwYcg/uegUxcEFnn
 6ydASDK+1hyf5nVMkogF8gnmGODuRINojh0pq2qsCcgFPYLzHxVn0HP2TxUMQmWrkr3k
 tV+cxkNLTuMlNzd7vhNXbSyGHfHHhX7FDpQ28M5+XD0WUp/9GfN5Eo+F+2r9coyMjbBA
 FRu2a57wXxnrDysdhZsyDDaEcCKV2tJbOSXgqwWSqXYrqH9KJJPm+0L+UE4do41lZTAn
 JaU0voDQXbWnHmAM4nmfcwzKKGUgrlMtl5Qdh02loJugCDKsDJz1XmDoK2Yt8+TCSai+
 LpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266804; x=1732871604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+yuGfl/EBV1L9yZwllQ4z7rC0GCiUIVGF8V+6a/LgMU=;
 b=BhSgrDiYMM65IUWrl6L0fQYPYV6xRkwGtWp0zO6+6sHPt7CzlNQFvgKobw3+tTDux1
 QG0yjK8Ohl/v5xXVm3DUNLWf3YTUF1Lx13EQTsZ7p3ENK0d1Wpy24rgMDz/pg2qYXsne
 eN7k+Tv98XPNySDpGU6ENO+1lVywBv4Yr0TWkhjCG/bvq8wNaLUz/qn6M4+1itnRZCbI
 KjO4LDxPsZ6+l1uA+Ohe97EtJNB8GRXFzbctQRFrF6ByS89rWy4IGkPSOEFGMpB69+AB
 2Myx6lx9LiVss/ujqKTbsjzajM8UdwV6P2Xy7OnVHmyYnHcAU3vo10gVYw7jQbR1ZIzD
 kGWg==
X-Gm-Message-State: AOJu0Ywk/pt5bmsNnZ6T5CC0aIXREKSuEYrHasEXD6nf6mJHwQSthP3d
 GtO5UY+f07EuPyaYQti7xp9qask+BPd8fMLmi0p4x+oDkAYUgRc4lAs/47V0J6s=
X-Gm-Gg: ASbGncvC7xoqjhzEa+uIFREeAOv5iLyAM9r5buhCaqi8RmfFAdAe5lgvIIe3nsT5j3h
 TNSnjDSM6vSBWzgf226xBwuKX3VY6iHCVgyheRw8xfHuFNjgKYzTgsW2IBxvXNHnFIWJo+Vq504
 QN2U/9qEiBCNZPUNIRDzA6pC6d7uEZVX/jv83kMGS0RZQL1tPrms6GO1dYBipQQuj/sbOsxSV36
 nVfo8szoYN1JkfSXzoJfqTXjXuxK6556Vy7l4F9xDi/EPXm4OyfvcPLpA==
X-Google-Smtp-Source: AGHT+IFLvHEAOMFsbgXw0Dwjm3ehikp3aJtpuOLNAA/Ny7NGqmxqJedFV/QSTgM4ejrUuhK9ANir2A==
X-Received: by 2002:a05:6512:3c8a:b0:539:fd75:2b6c with SMTP id
 2adb3069b0e04-53dc618307bmr1957531e87.21.1732266804495; 
 Fri, 22 Nov 2024 01:13:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:02 +0200
Subject: [PATCH v4 06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-6-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V4oVcdTHVT3mKFPFYYqaTi+sHqWjzKg7CIWwA7qtBbc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7qDt5JRalysFtfhpV3XJx9r4HUI7Mk6MKsr+cPD+3Hfb
 Jbz8vN1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiGk84GPqERKMOmjLumLjD
 MnKKz41Pm3N+pJ9/n8z0rvuN6cMZVyc75WV+fMW/4fbSA2vvrrVpMe45G3ww+9aP3vVvnz98rSu
 4O/isbPYRnyflj5ydRXks1ul3emxm9fvxfFpOelVarJm2RHEYa/6RS44puVXrtA+wmssZ5c0uzJ
 ygVmJ9LPPTud7Y0PcL77Sd/xHW+ob7VvMR38uiHV0XZA79iVnTJeCicc++kzU/JSzJ6oPkpn6nn
 mvqh9ltP5Y1VQhNcD2W0HDzreEji7nuNWpRnX37Lrr1bVsfapB0u+3tivnhToYGkh6Ov7Pn7ivy
 U2d2yzm0/xyn4Lp0CR2pL0vk/PYt+hT85/Dzhto1cnINAA==
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

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..2fecaac0df0acd865186ee928cf26449799fc7ba 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -580,6 +580,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
+	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
@@ -1752,7 +1753,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1760,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return MODE_OK;
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

