Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C309DEE72
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9CF10EE40;
	Sat, 30 Nov 2024 01:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W9gC5Phb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA5010EE40
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53df63230d0so2927897e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931575; x=1733536375; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
 b=W9gC5Phb0Lhim8yct+4937rQRDQU9JA2YTQUhK0+H1+lnqpoPzDs8NqIvzTC92JRx8
 V5kxIztw2+dnkl16W50G1A8Q9rB9sthdquDnPxYSmLgtHB+roxXESyq3FUuzkwcpQCq3
 8nw09VxxKYax3RQc7QNNAbKY0GRCXxxWqeR4TGWETpgsNt6bI/uG/wD+wTqzSgYV0Slj
 Eq0G2cpn3I1QQxWvzmqkfaFV5bKdqZ67bv5x0Ue81toniiVmSU3JxH5eFMMFy8un4Ucu
 TtrDLSK2nNuhlqS9QhoQIco9q3eLNrkGXsoQTfynDeqn8e6hhGDH6VfM3vkx96gIbKOf
 TZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931575; x=1733536375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
 b=LvhFyDEszv3FAoLp8MDySceA8GM1OMwUn0GXJ8bbM8oeDlwSRFds6wVUl3tQB+04Ex
 FKoD7l9am/4PdzqGIDr0UwjvGFDKnWRtdCRp+8i1zhlvEJhPI+GbNen9L7hwIGhqIif0
 UPlrjifpiWpETvr0BfG/Bciq9BTawHLwD4gYdfCbUnsojx361m0t6ymvTOvCdQXB8mXG
 UNgXhuulHb8ZcKFbGjulGf5Pk6rpRH3lF+W5ouBQnsy1mbUj/5+oSKPiX7Skdix0e8Fj
 n9vqbmqVjzd+xGUcrxbrvc3a8WKmOA9CRwb0IDShOmiLV8nucDw6OLM3PhoOoSBUpFUr
 LfMQ==
X-Gm-Message-State: AOJu0YyX91ic7Gvys2Htb6nktEJ68zpDwcp80uppMW+gHNKsOENbRKAB
 tjFKuPx6seeUivo59vWy53iHBcIEi6Kw/TacEvRaTJ4s2DSyoXGl05WDtBBSnsg=
X-Gm-Gg: ASbGncuAk1z4jy13i8fYikoK/o5MZ7vJnZWdYJQp97MhAgfs2b7nwsxhrgRGmbTOhM3
 MQVkMb5pRwSrp/FlClM676oye0buhGAz45ndWp069sipS0qTfZSdjLuvJazV89ovck1YZeEwUY8
 7GtEQRj6/HTtBKslZrMInxglRKZdWBUxNA/lVMxFLQE8Dn+1iKjx9jOTwAModFwzzsdI5FfY44+
 eBXF3RgqqQkFCmr+Wo8NCniXZJw6IcPizWH35/LWN3+E1G6ZhGkoXjDPQ==
X-Google-Smtp-Source: AGHT+IGpbKPr0jDpuxGiDeE7FvrQMAmAyXEng/ZnD9YgSk62wmodTKnHm1As1pVrSEzDd0Rvi+mmbQ==
X-Received: by 2002:a05:6512:3b25:b0:53d:ed08:5712 with SMTP id
 2adb3069b0e04-53df00d3c8bmr8073919e87.23.1732931575393; 
 Fri, 29 Nov 2024 17:52:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:33 +0200
Subject: [PATCH v5 08/10] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-8-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CHPPIcbOk/4oF+oFDkgVgA19LBW1SDNLoLgjIjG3wi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gZYVRxsPvBuVk2hROVkIaUSrjCIe8xd0oY
 EGWuQDCOl2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1TwnB/95gm5vag8iFN5M1sSaLORbtyefXMqgXK+UYyOyMGH3WsrGBMV3zrqFa3hOpYrpMOPCJ0p
 2qpzknExme8zQHyG/cCZzlAZZ0eO6hM0CQ4/s+rxguRsevb95fQ5hLPrn9R2wyESwkIQNRYRb3a
 2aXx6WQ49NUOzerBIcauDv7aYjXAkWdIRA7hLYiNDTUg5XaxsEmn/6wFvWpYIa8jK6QejHWd7y4
 sTqgUxNX89KPdleAyprS2KSf4PwrAVlhpqMiALo1t+TdddoHZRFuKOltrZOe72vM5ukHKooMl5i
 xPpLai8cV0tXWnmKjXAfd+Ca/6CUJ/aMT3RViERTh2qn2xln
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

