Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C813B9D5B8D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D55110EB05;
	Fri, 22 Nov 2024 09:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nk/FiZxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E05D10EB0B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:31 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so365655e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266809; x=1732871609; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
 b=Nk/FiZxRZn6Julye2u2tZVWyaWUKcvHXWPO+abJiSCJDdYzu0zjANVWa5+yL7+zcpg
 dYCkeTSPEi1RM9GGgQXU4yo6VKLkoj1BtwMwFQOmciu1fTD2B4GBjDV6472yXdjIYmZ9
 udeTFc/R8VLZo0s8s5O/2logDoMhBok6T8+PQx0x7Uqz9u9cWvuvtCRBjv3czD+nudCl
 YmITUeHvj6QYXZfb6agcKNBXurLlyCLlohk5CHmxui9dP6bOpIacOoGFVXXmmw+uIgSF
 qTpEZ5DdLWCPrcoHFchJwXFB420XDQRww9/yTqPC4ziFgwCNBcN7hOQ6pEgolcgJj8SC
 fGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266809; x=1732871609;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
 b=NhJ1af97Q605zvBviSBhgJfOXSQOoHD9ZH0bBvtORbaodW83KT/IdOfFzt25tOf9Rz
 8BXP81qJ7YHpp4JozaTDqxt/Io1BvMed3A+DDdjFKevYAv+p1qGTyYeBug3e6pttjHKn
 jUnlwn2k/L6DZz4pRqlN76/kdBFEgUJ+DB/p6YEahuYQrXoCrbvVg1/vTWE6D+pNT/Ie
 povUaDMaaz8SGHtR9t0s7jszSiy7UUlZfc4FmmgoVi1Jv1TWgyIQSTzUkDlOg6hnDAqG
 O6ToWG8XkZPVXZ1SgbLXGErBm3k0Sml6gFtgpj1tgZviiU4m+CkCpSWqocKlNC1bEy/P
 UaKA==
X-Gm-Message-State: AOJu0YzXWzKYxh5stZk5dSAx6VYd4rbT+vwxb8wHXbVJcOYbq5cPC56M
 khuXEA8M4x0pKgfwsTMwP4IYd3kKwHKznh/xy391ZdY9a23NXKij765taFRK0pY=
X-Gm-Gg: ASbGncuQPhwTF3sN7zRPT8hnKjXBoK1+zTmcGv/AhJ7PwdjPaS/jPGl0eB8kb3dS9mt
 D9+59aAgLme2VdIm0ucTNJE3I+bQZKpUVR48G9/N0NRlN1Kz46BspJfdcmTr+Q3hOW5ZTbO0nuu
 ADgLt1DJkS1fIr3o16CaznliLRwgU+j2Zn4n6Zff00A6vGdA6iR9vuTuE8H8vTLKBctD/xvIDtZ
 h4lSPugp2Ow6PewCCWlAVMMNHOP+jRwmSculaxkAhzVySMbVyAgWo9aBw==
X-Google-Smtp-Source: AGHT+IEacF2R7IM1WOXDiiyEZw72yOQOODx70vgQAIsHBOvrbaiI7+vacg+XzA2nbeGhQv/5FVkoNw==
X-Received: by 2002:a05:6512:33d1:b0:53d:d661:ada with SMTP id
 2adb3069b0e04-53dd6610bdcmr495351e87.8.1732266809396; 
 Fri, 22 Nov 2024 01:13:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:04 +0200
Subject: [PATCH v4 08/10] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-8-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CHPPIcbOk/4oF+oFDkgVgA19LBW1SDNLoLgjIjG3wi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsiedj1vWQXgZXcLJ02DcFxwDE5gszj18sAt
 X34dCGJZmKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1bSCB/9slyF05dGTP/R8bS3bpgFrC80+3aCli/HGX/hh9ZecB7M0/4Gtv1SuBYM+KdZhbrux6LE
 pczE2VQiA9zmyEtW0G5wbp1FeQvVBM8ruyAQIhmvjHQQTlnjC8Upiw/vuPynB4nUVZWHfhhYQmL
 zAEr0NKRnfHyVcsBRwxOdxyoVLnAqyl4aW9Ms616ITIiIb8MXaArqLlDxULPZrDRxxX17OEl0V6
 PCmq7Qc1dmPgMoaJfFSHCVIrgBet7swGVQ7Bft4pgEsIeljuwq+YPquR/XJM8bitfAaIpRNn1BX
 frUWcluAbmUtixwbfjgPP6l9mfVYq5tjcrdl+FwRNElIvckp
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

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 8f25b338a8d8f95dc0691735ac6343675098f7f7..1ffbe473e4103dfc315a8cd3571e9407bf518797 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -757,7 +757,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
@@ -765,8 +764,7 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+	return MODE_OK;
 }
 
 static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,

-- 
2.39.5

