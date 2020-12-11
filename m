Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029332D7A87
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 17:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1296E6E453;
	Fri, 11 Dec 2020 16:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BE56E44A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:11:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w206so4955192wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcgAlv73vEUDU74fbf2tp9Uw/scVqmobIWfJQ1/QSZI=;
 b=TMZK6wVNMmS6UnvQJKNvR8BU4h7qe2F8BL4X3W9vQmXVvWu4omP6/7MI8Iifd2b9PM
 t084AOo58Fzlwfo7B9L2HRONYR8yoCSlOYkg6/kUZSRkZ7XuC0VtzFihgUXTMxUopf/C
 Z5Ic0lEHcd4XOz6/cOou4jBFM0eylLo1QYPFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcgAlv73vEUDU74fbf2tp9Uw/scVqmobIWfJQ1/QSZI=;
 b=lY5/mI/3BNMee9wjeSPJTRhrhCSL/ysk6tA02D5w2sBZelDjLKKyLZz7Bbz7/Dcbbv
 o3juX/JQmbNL2tS1+hGXTiwU5OJvuqFURQ39YyHRO792yIdXaZS75zqZ4oilIevA42lE
 omZ5NkiKI3177oCxwYgvXmxSusSGL11BFzdKnjzYhGeMNZijKUFLKO1xCRCDLr640K7X
 8Z7TRx5Ifm2DZd68qUJriF6Ajd/rhoUXTdX97sST5ALZ2HmR48OQw9Q1qvLMBCRT3N6m
 d5lG9um9fI7oR0F7dtur7bqUrHKQBT0IRvdmfWHfCrzH039XUw6kNMEy5RaRkP9KRI1n
 EM+w==
X-Gm-Message-State: AOAM532F+t7gaQq7pTbqGOzlZpYNFSHj+yz/y88PiXwxGTXoF/0XXaXN
 ogwtqqcmfsqpB2CBLe8F9jygbnKp82C6mg==
X-Google-Smtp-Source: ABdhPJzjVIglpvy08VrseZujbyMTPVujxgVBsSxyTtDcytI5Osccm0Bucreq6OGHdlD388ua7yprQA==
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr14373708wmc.98.1607703080240; 
 Fri, 11 Dec 2020 08:11:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 138sm17399981wma.41.2020.12.11.08.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:11:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/vkms: Unset preferred_depth
Date: Fri, 11 Dec 2020 17:11:12 +0100
Message-Id: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a confusion between the preferred_depth uapi and the generic
fbdev helpers. Former wants depth, latter wants bpp, and for XRGB8888
they don't match. Which hit me with vkms, which wants that.

All other drivers setting this and using the generic fbdev helpers use
16, where both numbers match, for RGB565.

Since fixing this is a bit involved (I think for atomic drivers we
should just compute this all internally from the format list of the
first primary plane) paper over the issue in vkms by using defaults
everywhere. Then userspace will pick XRGB8888, and fbdev helpers will
do the same, and we have what we want.

Reported-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Simon Ser <contact@emersion.fr>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index d4d39227f2ed..aef29393b811 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -113,7 +113,10 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.max_height = YRES_MAX;
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
-	dev->mode_config.preferred_depth = 32;
+	/* FIXME: There's a confusion between bpp and depth between this and
+	 * fbdev helpers. We have to go with 0, meaning "pick the default",
+	 * which ix XRGB8888 in all cases. */
+	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
 	return vkms_output_init(vkmsdev, 0);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
