Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D224ECDD
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D6C6E4C5;
	Sun, 23 Aug 2020 10:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033C589E5A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:26 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w14so6447812ljj.4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7l6jdZamlqEsFmZWjsOIxeaEnRE65B410R46FIxqF2Y=;
 b=NgHujceRWQ7T502W1AGoMKPrxJeM7G6girgvVlbeV+j3Sw48PkyeztD30TGatNEnzH
 RXh4XtKCx3Mvu5JeNREsvGW5q88XeG1KLo5g/aEyJX0/wD7oVgMOd0DGH/uhqiHMA39A
 SA58BXG+lwmz3eShi+x9CsrarJsjw6qP/B/gVU1dndE9mhD9DJdvMjpq/RgNSbU7EqMx
 atKR5j5wgVu3joTuCYQkwRA4T/YMiGk7G3EXM3KvbIuRanBR8X+BHCPqQrP64A5AfqLG
 9qwl2vU1M8BLf2x+SKUMrsCx+7Wl1SavV6CoS5P7sCcX/X340IJo55lfN0ROoxhTnQdS
 cfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7l6jdZamlqEsFmZWjsOIxeaEnRE65B410R46FIxqF2Y=;
 b=ufxaH+zPtSDmstN82K4ZjJSlWdqnGO+Gb1EFwdi4oN8Y5zeRkuNO0cd6Oo9yagEDiI
 V1J0Hgb4gzpohGd520OfkK2atxD9KtWbkk4l6wInbagT7VTNJsKHM9Lc3Ws76xR5ZWVj
 nCxhJLqpY4JWuzBFq178MScMixyrfoWcbb2ssIJ38pQPoF8D02l0vpfehetPsC5r9+/8
 UmAF5v8qnnslENDp6sXoqg09v5OTiZAlixrk9gnGIIY5ZcCXQaLkMrp3YjIlc81RIeHF
 jPcU76nHtrCib+s8IlWCXdvtTPvCUbrF+8Znbz5Ryd/hfpturHZwTx7zWoWzBOOQzttT
 xKgA==
X-Gm-Message-State: AOAM530+cFU2+rFBEhFpcPAEK4mNHCHA1K78rImj9gDvCbIruUy9NyIM
 MKdsv+zoldJZ4fSv/d9wokISRH5vSboavQ==
X-Google-Smtp-Source: ABdhPJya6ritx1IFagTY3VZYCPCibTXPllnn2aEVUQ08oCMufSBAE+kemNZ/qhACJp/hJuVtbECZ8w==
X-Received: by 2002:a2e:8197:: with SMTP id e23mr483132ljg.406.1598179584290; 
 Sun, 23 Aug 2020 03:46:24 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:23 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 24/24] drm/shmobile: Backlight update
Date: Sun, 23 Aug 2020 12:45:32 +0200
Message-Id: <20200823104532.1024798-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
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
Cc: linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use get/set methods for backlight_properties
- Use macro for backlight initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 .../gpu/drm/shmobile/shmob_drm_backlight.c    | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
index f6628a5ee95f..634b49e50ded 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
@@ -18,13 +18,8 @@ static int shmob_drm_backlight_update(struct backlight_device *bdev)
 	struct shmob_drm_connector *scon = bl_get_data(bdev);
 	struct shmob_drm_device *sdev = scon->connector.dev->dev_private;
 	const struct shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
-	int brightness = bdev->props.brightness;
 
-	if (bdev->props.power != FB_BLANK_UNBLANK ||
-	    bdev->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
-
-	return bdata->set_brightness(brightness);
+	return bdata->set_brightness(backlight_get_brightness(bdev));
 }
 
 static int shmob_drm_backlight_get_brightness(struct backlight_device *bdev)
@@ -47,9 +42,10 @@ void shmob_drm_backlight_dpms(struct shmob_drm_connector *scon, int mode)
 	if (scon->backlight == NULL)
 		return;
 
-	scon->backlight->props.power = mode == DRM_MODE_DPMS_ON
-				     ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-	backlight_update_status(scon->backlight);
+	if (mode == DRM_MODE_DPMS_ON)
+		backlight_enable(scon->backlight);
+	else
+		backlight_disable(scon->backlight);
 }
 
 int shmob_drm_backlight_init(struct shmob_drm_connector *scon)
@@ -59,21 +55,19 @@ int shmob_drm_backlight_init(struct shmob_drm_connector *scon)
 	struct drm_connector *connector = &scon->connector;
 	struct drm_device *dev = connector->dev;
 	struct backlight_device *backlight;
+	DECLARE_BACKLIGHT_INIT_RAW(props, bdata->max_brightness, bdata->max_brightness);
 
 	if (!bdata->max_brightness)
 		return 0;
 
 	backlight = backlight_device_register(bdata->name, dev->dev, scon,
-					      &shmob_drm_backlight_ops, NULL);
+					      &shmob_drm_backlight_ops, &props);
 	if (IS_ERR(backlight)) {
 		dev_err(dev->dev, "unable to register backlight device: %ld\n",
 			PTR_ERR(backlight));
 		return PTR_ERR(backlight);
 	}
 
-	backlight->props.max_brightness = bdata->max_brightness;
-	backlight->props.brightness = bdata->max_brightness;
-	backlight->props.power = FB_BLANK_POWERDOWN;
 	backlight_update_status(backlight);
 
 	scon->backlight = backlight;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
