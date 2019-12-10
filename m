Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C411190F3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 20:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BE46E15B;
	Tue, 10 Dec 2019 19:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52066E15B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 19:48:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c19so21195917lji.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 11:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P82TMLYYn0H0Vk+7jkobRYRy3Hkk+TTBJg7MhrKH4/s=;
 b=n/OUSoF3n0QiwgzRbda/51QZk6gwz1q5i8U3McL2VBH+RktUL1KscXx11vRPU2n3Dd
 ziE3cYH0O8oAubG9SzUsa3B5zx21KSjTd6T7WujO8VGKGyNHM/lV+x/2Bnxo+jjL7BBK
 uQtdDfXynU5O08esLW6CXyBwGKX1vowHwALeEyszq96YkjyBa005IpfstV7RGUf3mXgl
 +Y4bXG/+nB50urHqe59gDfFQM90h07Hyt0ctaUlL3cW7RC8AwmRfXD6tA1Z/KEvT2i+6
 Nipny51NVCY2At21qu1DcX2xbV5anz4ZOlTZuDfpBvplae+XYyYpiNDvfy4y+fasbQhF
 uW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P82TMLYYn0H0Vk+7jkobRYRy3Hkk+TTBJg7MhrKH4/s=;
 b=jHmeBmbkHT/jTfZyWM8aqi5JxRDBP5qBfYRu3uIiRNz8YnI3pS4aiKd7HP+XvS/9AK
 tb+2IFOq6yjrjy0qRmlbM4KiKOLgS5O8JE07kl1EkcT2M+xnP30h6QiDyJM9irdi+92o
 L24SpZoQfyt8a33CnPZ0E25LpIPYIBpvwMsFCcOagEGRkRl6Z/ke2LRnDpcEYeFE9c92
 QCDoDNunfe4n5F3qG+5+XCSIm7esg1C6z0X1sOSUK3QCsoJZfqgjQUuMIFJ2yxo3kcKg
 /vmVnFDHEm3iP16r/EsGB+IxQiqkdTpMen0XvYt02yaZOQEi+8FY5hsvq42NKDD+yHdv
 sWcQ==
X-Gm-Message-State: APjAAAURReVl2vmWhWAqEBFulKdaqjEF2bJJJVf5k8tao/bqTTB7Vy7A
 sK6Oorx/FoKfDtwh/EftcmgWwRTaaL0=
X-Google-Smtp-Source: APXvYqxMcqThqjnmPpHv+veZ+fazzz/HwKfdb5pWYARoms85N0orQfmGUVti8TkdBcS0f0gZABLLkg==
X-Received: by 2002:a05:651c:8f:: with SMTP id
 15mr21439902ljq.109.1576007291663; 
 Tue, 10 Dec 2019 11:48:11 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 b22sm2394532lji.66.2019.12.10.11.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 11:48:10 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/drm_panel: fix EXPORT of drm_panel_of_backlight
Date: Tue, 10 Dec 2019 20:47:58 +0100
Message-Id: <20191210194758.24087-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix link failure for module builds of panels.
The conditional compilation around drm_panel_of_backlight()
was wrong for a module build.
Fix it using IS_ENABLED().

Fixes: 152dbdeab1b2 ("drm/panel: add backlight support")
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_panel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 03395ad4d907..79ff3fdf6f6e 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -302,7 +302,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_panel);
 #endif
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
 /**
  * drm_panel_of_backlight - use backlight device node for backlight
  * @panel: DRM panel
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
