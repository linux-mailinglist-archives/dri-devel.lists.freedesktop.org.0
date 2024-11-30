Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F89DEE6C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ECA10E37A;
	Sat, 30 Nov 2024 01:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TdKJ08gO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062E110E37A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53df63230d0so2927856e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931568; x=1733536368; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=TdKJ08gOzaLSKECzEaTDOKdV3whIabLty2e3L2JziwbgWim7ImUw70qwhTbqhlqUTa
 90nJM4XABVcjrUeQxBxachCUlcjI3jdr5NLcxJtt2JnFDpR7s/CLSLLgOD0D/Y3uUcSl
 gTAatEAjUYPe8WCJe2AJkMBc2UmoDa+f701PSXYJ759HzWSIbnMKJhCunbpjrAwGLI70
 4w379MPuQBYI6IAmJDnxQax1vlpeeDmt4r2tqFwhMpKqD1vauVmwnVIvwgfC0yVj3k5A
 eE/Yqi+1UwbKvM1leakH9n3QaV7B0FuFCOcOE68bjnswIC0ptOJzc+GifC+iWtHokLdR
 XqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931568; x=1733536368;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=qxni+ON39Y43faHeFdy0kawZIoFNGUoVv9YfTfd3Oo/Zyf1njY+a9tzABbLM57++X2
 pnQMc4yV9dpUqYeumMso4f7uNTPvqSBa/nlxEY0I1oUnC5XY9CeH+7V/N3oQ6vQgzbXF
 g4MoF++3cO5t/ACoG0BSWQ4nkjI/0Q1A/MSc8NC6nSP5r3O/r/IOLd2u23n7bncRafVF
 tPAJkYm8C9FxntqMUVpsi2oxfU4LhXd29pzFP9I2WurP4IIEKgb9jAyv+JiXQlnMFrWv
 GQJyq6R4o99QPCqqZh2x892CKNI2GVurd0SB/ZDoyvQK99OGz//I7xQydo07GZWjSmsN
 mDVA==
X-Gm-Message-State: AOJu0YywerfWW6Pg4SCH0bV09DUEnJYts6VxLakJlfip/FLd6pghbMen
 0D0xT3ixJN7t1g5jnL4IhjBTypFtIh37gzusEZIMeEsj/lNc8piraThVzat/afY=
X-Gm-Gg: ASbGncuYR7fPdrnZzIEI5bzL21Z/lYovch7jzf9OSrwNNmYG2GUkEN6r9hCjW/XPkRR
 /5Zb94PfKon3tQR/LDgNxCMLWWz5pmAYxUdNoOdS7srSOPAvy7XAYpOxWSg/HfnjwChNE1j/mAY
 940Po81fkOEduQzgrr9b7kYiz3pUmfm9Ue8qGa1sKuQqgNmykgXX3/P6DFYm/rZe/WeURfQkVeK
 N/gGxWs6AvHQLOmAFDPy0QkEBnrygCQUmChK4H35x8vuk9Bpy34qALIlA==
X-Google-Smtp-Source: AGHT+IHetZrvEByn4fAHRWKEq7LSlZrnAwfYhcjJyaHf3aEdtAmIagniVhOW57dJZppA3z77RAF6Dg==
X-Received: by 2002:a05:6512:1247:b0:53d:e5c0:b9b6 with SMTP id
 2adb3069b0e04-53df0106d34mr8877433e87.44.1732931568173; 
 Fri, 29 Nov 2024 17:52:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:30 +0200
Subject: [PATCH v5 05/10] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-5-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gM3s8fwgp7qQxHuLKIwkRxeHDxfAODq0bs
 8MwPp9YbZKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1bIIB/4p8mwZtQM6b7rWJ6f/3RrJdOFSVD/lB0+qokriHsrz+a1eIjtwS5cFImZWoTfABbjChFG
 9bL3aHhp153Z6qRmB0jjz74wbZ0tim+a8QACdm70DR0qaxs4/HmpfPx399A0ZxyT24MreEgH6GT
 SIq6n5AETnEoWTkEcfkowDDKtLWggZQ1t8C9j1FkKDqPZx7h+bRIoX+PGcwIDcVLd5cC4hNGvGo
 am6B8uZXEeOE6xZdG45hkGyPog/MQ3pw19KTMqs9BjjoRcYkufrdv1X+Zy1tA6GGE1tfQ+iEDoF
 COYRba5H+tZGXE0G2E/PFi//GWn2JG40uSHj31ythluMJMYH
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

