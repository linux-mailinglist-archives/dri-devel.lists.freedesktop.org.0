Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFD93DD6D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 07:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9BC10E0A1;
	Sat, 27 Jul 2024 05:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rxr5q2BG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825710E0A1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 05:32:19 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-703775e4d5dso950064a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722058339; x=1722663139; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ll2tSeXkgEmDF6KKRHBsaNEm0CYvP0CwAGds8QRblZc=;
 b=Rxr5q2BGvjJpMPYK3/wXFKWQjOyrw9qYWWBxxKLRWH/yYVpHjwqbNrHbxBHXeLeZpc
 ln707U9cdmT20/2fZXrhzpgMe/JlPGgq3kFHqJyATZM47mQgjzc8145h7cini7GBUKrT
 mjF5xfqjT9bx+Fh3FiGQLLE18qVgsCTv9zaPRnaoZz/6Zm+7N7n8abMyZhmZC5lYqfyi
 4nuSrdStINAiILKKIpLsxYzJiBw2djCei7zI9PIAcjt39Jo8i9W6RhJNzEOZeZ5+yl5y
 t/lpFaO5nIXXseco3VanKGoQw3dKR6M6T8vXPVYbJjk0RiB5fTru1zcylLiSOCWtagbz
 34Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722058339; x=1722663139;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ll2tSeXkgEmDF6KKRHBsaNEm0CYvP0CwAGds8QRblZc=;
 b=sWHQnBMXRlT/m9dAtmx67KuBlzLGiogefUTmSA8pS9t+2qkAZt3PSYB/pFbqANHiRg
 IAuoL0OjPTUidI4mpyeAPMkLtGJY+Eo9fXmsNPGgzAOP5vaF2Lltkxn9iLVuW9jztlAq
 X8bMR0iHx9k3zRi55Tgt2hKzbpDXlJFQHSikn/spXrGwx/XKH1Pcsrqty+/zWTviECkg
 3QLIhOibgus8Mjcw3VHDSgjOV9sFObFg/tEJiXc9MgvTTOqhw+wn4digIjjmkL50FVS/
 QHn0yF664tOx0hJHC9hYF6zoOPGoDkgZ1YUiJF7ZTXZzeHjuB9WnWJ89cQsLEzFrHG/B
 ymQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg4vVlRF4XvozJx1PzPrkxv/DRBviZGFXHJEs+HKEJEYOz9eW/WEe1zqx+ivw47JUb2+PSanqHwThVRaLDNRnGroi4aKovoLvsHlBR2FhA
X-Gm-Message-State: AOJu0YwXDIvW048BZJGYz7KxS4cTk7dvbxawrBCsCZGc0E32vVg5qK6q
 UQ6ofO6UrhS4cx8E/zzjr23KXG71Ghu+hR4Q6UxEvaoRwwMNEZCiFFbn1ij/UKQ=
X-Google-Smtp-Source: AGHT+IHUCPIsi7uCYJwSWeWo164OHgRFN3CFwvOwVNjz9dDYRNJ4CXpR1iCMOHy3FSP/CtE+ihndVg==
X-Received: by 2002:a05:6830:65c5:b0:703:802a:98a8 with SMTP id
 46e09a7af769-70940c0eb3cmr2782964a34.9.1722058338829; 
 Fri, 26 Jul 2024 22:32:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1cb1])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7093070671fsm1112735a34.21.2024.07.26.22.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 22:32:18 -0700 (PDT)
Date: Sat, 27 Jul 2024 00:32:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
Message-ID: <83d9bb89-1a16-4ca4-80b4-1965fca498c1@stanley.mountain>
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

The drm_property_create_signed_range() function returns NULL on error,
it doesn't return error pointers.  Change the IS_ERR() tests to check
for NULL.

Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a4..4fcb5d486de6 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -328,14 +328,14 @@ static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
 
 	prop_x = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X",
 						  INT_MIN, INT_MAX);
-	if (IS_ERR(prop_x))
-		return PTR_ERR(prop_x);
+	if (!prop_x)
+		return -ENOMEM;
 
 	prop_y = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y",
 						  INT_MIN, INT_MAX);
-	if (IS_ERR(prop_y)) {
+	if (!prop_y) {
 		drm_property_destroy(plane->dev, prop_x);
-		return PTR_ERR(prop_y);
+		return -ENOMEM;
 	}
 
 	drm_object_attach_property(&plane->base, prop_x, 0);
-- 
2.43.0

