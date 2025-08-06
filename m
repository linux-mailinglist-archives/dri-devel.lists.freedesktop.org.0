Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B9B1C53A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 13:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34B010E279;
	Wed,  6 Aug 2025 11:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v3Xa0oCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA5110E279
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 11:45:41 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-459e1338565so19129125e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754480740; x=1755085540; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9DepA2B68/EdYA4QL8eVRTLevm19pdHVt7YsUtnKFMQ=;
 b=v3Xa0oCKO7lP+NDBRwda/13MN5elFfsTCwH+Tvg5I22yTeigz8MiwoRV3ujLIKmfoY
 r2QIdACR1wliMbeIcriNfezhLMOqj7Fxv9vUHE+SUtGEVIEELsUU+UHcF/xgJPHyIghT
 yARAvBzagdUXLd3NEqC87V02f0rR5KtBxHVmD4q9R2zATfPjD0BG/1DMjLCDFxo40ALg
 lOcPYV9/xAkIqzXhHAnM+2wU3vyXvPqVnMjNQeMs9eZF8g/Uu67NwxvnBU688Ej/4Wse
 yrAvwOXxVL4OHnWLbd0E3MsLejFJC/E9zUNbX593Gs3ntfsqOfKlMewWpu5V3/VtV/jP
 WENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754480740; x=1755085540;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9DepA2B68/EdYA4QL8eVRTLevm19pdHVt7YsUtnKFMQ=;
 b=sf/PM9+YeZQmrgHAHZBCHjLEJRj5Wl+Fe0pQESUepJPFKkhqHrAbp9zgPhxsRY/2Yb
 z8govgZGGOwd2AM876e41iwKtLfNEXITBzDOKR7keWdUY9sM/mHo0nV/ydIWJOGkr77O
 WP3gXcx1fnswJErLilxkKnEgyHy8JUcyMIYLjyMeN28kcxUCUmapsa7kbqVQqlW43mT3
 07gcZgnD/TMZMzxEpOSNkg1xq//DJlzEBLOxndTUTXdQQqvG9+BQ5kZA72kro1J78O+H
 c67r7Er0MyI3Jue5NY26AlsUtoRtYNe3abDruUEMP+BsYHOpY/7gWEH0/MFIf4sLaskS
 jx2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhoFgFdR5yfawhnbpFD6lubcI3biUXI7WO3hS3roxZ5xp68CgHFXAhSXPj76neBRAj0LantnwhXLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHyxhaXWqVOTeY1q//nJfz4PcTwxmgkPSz3c9CVvvcYWqD6JAa
 lnU7p/C2Oehc7k8FpC8g34DWBSxw4eMmj+0IhbDMH5HtdxDpa39HD2lVf38SI1a5K/Y=
X-Gm-Gg: ASbGncs+p1GVJGb/aAYn2zmvtrBBVjZfLtdwv3xChdMoeuUNe8l6h1fwFr07KWLcMU4
 2mGagBk9J95bxipu8K6+zFguxdcw9cW1RN+H279lY6p9IDET1ivHX2F/jZVJekvcHW6sIi6jGRx
 M/x9BXlHPs6raC/rmbLTE0BJBo86g3exZ9DH3sAdai3xyvR6WAm1KPlIVUhWzhmASlQapgZrf7F
 GYJ1A6nIosz6AhCs9r4Sgrd/jDiwogdhMlYwCvn6r7LEM5VYdCUJ+B4B6IDrVCk92vfU6WY1OF/
 iCYVH/Zlob3zpFaGphM0e5JhwQvBZY6eYl6SKvAQVc/iUfhCyiCmT4irmus38SKtDkDLmFepBlB
 zfw10vaWrvSAhRE354pZwcWE98c/HisuyFtpM8A==
X-Google-Smtp-Source: AGHT+IEE3g4jSi9GsUDwto+AdTCsAW5WpR+TQz9Q8Z7q9dZe8YHCctfVsvsgs8q3UFKvnWq1hWll/Q==
X-Received: by 2002:a05:600c:1546:b0:458:a847:671e with SMTP id
 5b1f17b1804b1-459e74a807cmr19125025e9.23.1754480739775; 
 Wed, 06 Aug 2025 04:45:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c4533e6sm23416702f8f.35.2025.08.06.04.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:45:39 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:45:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: analogix_dp: Fix a NULL vs IS_ERR() check in
 probe()
Message-ID: <aJNAYCXKTaT1bjyL@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The devm_drm_bridge_alloc() function doesn't return NULL pointers, it
returns error pointers.  Update the error checking to match.

Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ed35e567d117..4b9b444bd249 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1474,8 +1474,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
 				   &analogix_dp_bridge_funcs);
-	if (!dp)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(dp))
+		return dp;
 
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
-- 
2.47.2

