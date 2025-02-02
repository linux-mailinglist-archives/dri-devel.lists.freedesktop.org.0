Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F643A24DB9
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F4A10E264;
	Sun,  2 Feb 2025 12:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FazpbHsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5F10E264
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so3837995e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498043; x=1739102843; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BuE5UZz+cJnN2iWNBz/RDp/GoaoZW4HCu4zDpH0F6WY=;
 b=FazpbHspI2dly+5u+kWRTf/bT5/fxqMn09yVPf9gO+4OGH4XVwnpPSEmgyhRuZW7vT
 QxF3fTF8nPppQUGLDsT5GYprwQ7NdqiTxCe33CRBIDZfA+0HQQjfnlbxRIc9xvm/FKIc
 R60PAdx91QJ8yT47VJ0DFsWQ5VUni3rdrW0XpHHaAxUbxgNwPC2JNTFnKU5vXV8iKEs0
 FAAshtjHr2eHCp6u/hbAky6HA7hHh1S0EomxDS4lmMUOCAeuWAASVVVsoXh7+U+dJAa8
 A+Lb0JAhhKuqbc+3vdarOs5vy12e+nAlhyv76fHHvb91+AYnKA1BEOL76iVUZgM5QopN
 QPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498043; x=1739102843;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuE5UZz+cJnN2iWNBz/RDp/GoaoZW4HCu4zDpH0F6WY=;
 b=KUExXY/PsfHUZ/e/nTdt1JWVxwvO2vQp20KMoVEj4J2GNCdQtIuUNXqnenaLqaPb0y
 OsV6/0D0/ftTR4MflKPFZaiUvq2lROrk7uaJJfpnfYJ9GyDz6YgGITVKChOUQSuOBBuR
 Kocm0CZ4oXw5xhTOEVZpLQ/bZj1aQOKFvxK3gOCszK5hFKfdtg6xzsM2PWHu+GXo2rYA
 c8EZrf44uQQHP9ZN7BqxOykYMcRj6Pb1DeYdtmejWPGp6lp7HLmO6MQO7LiBgWCsG7j8
 ZE09aokvt5xZ6Qurj4ljyal113LPwQM4LhW+ZMuYIbhqppMuMng2oZC6ycMQs+H2AerY
 ncZA==
X-Gm-Message-State: AOJu0YzGK8abDqjlgvbtMc9YFMNJgluSDXxYhpz9X/7yJl5BdPIgi2qx
 gy6GHmTBlQ/Q7qExpaOXNlf8NPpS0urJ+iG05pj+KDlKsPtzSyPYptCIRCpWoxE=
X-Gm-Gg: ASbGncvwCqD659TAUX1MMM0QARClGAdqLkI6F//3DTZfc5f6dVPM+nBf6jbqkAOF5tT
 2LqO9XjDjo7q5Xyo82xfu4NUkHmLbKjp9lK9tppVW9UQ0g/sFcE2k/Adp3E4+beMaAltMhckJNO
 EM7B7m6k+zhek4EK41AjbX9RLdcmaMDPJfnmXjpp45K93u0MJXBAlqIMdD6bhnqXKzsMjtZZS7v
 vSwkK3DkeWSuoxbDPcBHWxzjAl0xw/3Two8gmT3a1BSjwLfPxM0MBTFpGTY4TMx6PrvFwe4Q7yI
 76mKUMqKOYoqqT/U7O6H3vw=
X-Google-Smtp-Source: AGHT+IHhKuZSfZysf15dskatOSlsO0er3UYdEBLmh1KotBNeQy4VZ9n0d7CGOLX8DBU+YghkRGkeJQ==
X-Received: by 2002:a05:6512:1392:b0:543:9b35:5abf with SMTP id
 2adb3069b0e04-543e4bdff84mr5103464e87.2.1738498043139; 
 Sun, 02 Feb 2025 04:07:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:10 +0200
Subject: [PATCH v4 03/12] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-3-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N35nxpcqv/VwAiJBDWTPiOI+qtC0Bzqx1moc2EZyRGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/vEceJ0AVRHfa8eoYTEwUn9OxWnesJPlP3A
 dW+x5VtskSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7wAKCRCLPIo+Aiko
 1QadCACEVwx8jVOTvfRK+G6WUSxCQI7BvAIklNfD9fop2nd1n5eD0ytwhdOz2aR62RW70jfe9Lp
 fHHycymMltPQVHqDGjvIN9O3QTxqQPEc8PUhAwJiU3BOodDX9rvLq5uB178/OjHD4jhythQFRhB
 HbU2hvHPGVdJGv67vgTAXhPD1trergimgiXXOlM6fTQmPQco5AKzIoGWyjvuZN5L8+TV4Gh0Ro7
 A1FZElbGd4hJk16UiMS0DZ33beE5HzxVtsqRsVZhczVpZmyyaCJRW6x1/nmsSuLDY7/xgsR32Gu
 1sBJp6GT1m/7E3VKeUuXGncBtFKUGKIFINmfrPQF+MZYcppN
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

THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
toggles whether DP_AUX_CEC support should be built into the
drm_display_helper (which can be eithera module or built-in into the
kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
selected to be built as a module. Move CEC_CORE selection to the latter
symbol in order to allow it to be built as a module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8d22b7627d41f7bc015decf24ae02a05bc00f055..3666e791d6d6eba58f095d7fb691de1fd0b95ed3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,6 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
 	help
 	  DRM helpers for display adapters.
 
@@ -23,7 +24,6 @@ config DRM_BRIDGE_CONNECTOR
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
-	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
 	  DisplayPort/USB-C to HDMI adapters.

-- 
2.39.5

