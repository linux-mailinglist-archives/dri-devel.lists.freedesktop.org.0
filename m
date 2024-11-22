Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472489D5B89
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0FC10E1E2;
	Fri, 22 Nov 2024 09:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R+AXHNOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E731F10EB22
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:23 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53da24e9673so1984795e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266802; x=1732871602; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=R+AXHNOEBNKzhbm/SgGSO5gMP96ymZrMN/hhmyTB77tGj8lY+IyFNxlU5sAjIBbTVc
 dH/IR/m2NVAW4dzSw/qsKfmLRcXB8BTBqxoRbjdu7rc8dQuxQEspq4TSKUk0Dyg79nwt
 0NXvTpoSjT6qDE7prafvzNuiM2Ad7i0rriMsO5GUgzZvR5d8uWhRD1fP5hh+GrIAe4bp
 lCEh1PsIPEhSPwMe6qA9p0N8Awj7/q5gL+ZwNFDjhvu/apqZgpruha7rXSWck0lBb5tK
 9ZTXdX4QemSfTi6C7P/2/KAxTeW0cCfJ7h2UK8FAT96FeWo3H2/E2XePyfQHLGYfih06
 x5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266802; x=1732871602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=SyeTI1aduauCA1WHphNIWD/e2S/vN1qVRP+IKZiMiocjeziXlF5DF0xzR5KXXjv5HP
 CDtGGwoOlUmLzl4z2uRbglgjEyp/f1KZQNH05x0IizUtm4Ab1aQib8HYMR+Ve2ktbRz9
 LVYEkVg+AZ3koz7gSNc8XzUDsruIrMSa4FbvwqPHfWIwmZOdAaZResoa9+GTA+knhnFd
 HrzEp3wNnrNOEg8goQLHz14rgFR866iWzq4CaVmU2I/YxKac7ukFaw+WUbPMNqili1ja
 RHzPBBdY89+cBI7XeIFqMSjE7EDJnSJS79z7ma/doWjQDq2TcacbB+pTJ8MxaqoV5koM
 JD1g==
X-Gm-Message-State: AOJu0Yw7L73+OcIsXmgQRJmVB1FEjPv/AyDeBLdr/w2686W2k7F4OHpl
 ZwDU6/AcPKg4/t03p2gbXZjSOEdl6R2xU4T/+vl0zmzERJ7UXZ6ANQrLMgRVM3E=
X-Gm-Gg: ASbGnctHiWS/mCj/pznRFGoweteGeu+wH1LebwWOUSiBGhNeryfeLgLysmaWvcyer6R
 VA8A5DJQ4psNQZzMLbqBAwbIyerrmkNFrK8dwteb8hqnEXS8zy6T0pHo6zuwS9bpo2F2Dvvnhl4
 XJdJeczMIeAlrzJytDFitbcmijghDlf2AX2yAmxjn1Lc+2Gd2672KobZ8I9Mt/MGxPbaF+7nrz9
 d6X7hxb0wMHCTMoCdSZc9c+PkCy7/8V360USk2ntUMKH0icF8jD4nGsMw==
X-Google-Smtp-Source: AGHT+IGGtUj/UQVAqhj71L/+WsqH4TByvBEbJYS9Kr4E80g55FT15j0av7rsnKtHopezihZc5TlJsg==
X-Received: by 2002:a05:6512:114f:b0:53d:d5be:4bda with SMTP id
 2adb3069b0e04-53dd5be4be0mr678315e87.17.1732266802045; 
 Fri, 22 Nov 2024 01:13:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:01 +0200
Subject: [PATCH v4 05/10] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-5-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshvg15KlERBUKq4lR2p/TSqtj5mXXjddQL8
 zndDKhDnu6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1UswB/oDlMjmP0dYXrp0SYxKvIUkgl6MY851PyW708IlMOZOJbH5lo0GCNkGsMmCV16kq0l1ais
 KIus1wfQ1xA0lwo8KtUJJeX6gPpLRN0nWs5AbJm2S53M1m+XwFjW11vOEZYe5BEyvuq6cTNrqOf
 SP5rwIdTIFJYNqC/T/oVX3emjSYFRHp0mS6piDuxv9io3UFM5M9xGCDSP9ZsYwVCe0uwtI7lOx4
 VwYEaqqRz+m3DbfRHe6M2eQAtAMGgLCsyo+Rom/69e0SKJkKkWncfEMwKQez9slaQ8GeIXaA4E9
 KsJ/lbh1VelTpjfb+9nV77MboAKh3hm26Msd2x+zXcDXq7U0
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d5160031127ea14a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
-static enum drm_mode_status
-sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
-				struct drm_display_mode *mode)
-{
-	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
-							      HDMI_COLORSPACE_RGB);
-
-	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
 	.atomic_check	= sun4i_hdmi_connector_atomic_check,
-	.mode_valid	= sun4i_hdmi_connector_mode_valid,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };
 

-- 
2.39.5

