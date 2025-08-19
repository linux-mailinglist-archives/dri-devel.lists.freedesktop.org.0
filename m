Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBACDB2BD92
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFDC10E597;
	Tue, 19 Aug 2025 09:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="APPplgrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363E210E581
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:38:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c2f0eso3267366f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755596310; x=1756201110; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sz9qrbHKfImiU0wIEPpwysb9Rj1rHIdlAeMbcs31ric=;
 b=APPplgrG0UkgwZbCxQ3QiGyOF9eAAUgCxyymSqv28W/emAycuvc3F65PWOeh5IA/Au
 gMTGSQ//GCczYKI8LV3SWnPHRopJVKOq/5l45Df/mgyAl5V0UCVbyE3j1PIuKVNdH1o0
 hIf8CCJUDwSSR/+b0ENohOMYaP6L5gIkm62nD7n/40JMfhwPSrq32vFz9/p0O+TejEy5
 +KUEPmugfy6bMAF7dt+qMIKbAd2Ur6SgthdMtT2+DdZI7xp0sOSbfzF5nj2kZe2FmVaV
 psTnGutYnha9Gk1oBMrsQdGgZdSn19XRyBxu8ZIV3xrSAVxU4T5kK1ZucLF5MdnDGLn5
 CatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755596310; x=1756201110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sz9qrbHKfImiU0wIEPpwysb9Rj1rHIdlAeMbcs31ric=;
 b=vFf7iqaUa1x4KNlIyQ3DjjL5TbJsOggLjeoQ5857VNGrLh6ndNiptEBCrnEZQ3VWqN
 b02Xlzor5D9z0HoMkd8EHoEdlXwAby7cPT3GTmuSqqd+Qa1c9yFqLGGYvFUPgYCUjlHl
 b/m7w1ZbNleGM8nYogm+v2E61kwhffBOt3LiyMu417+Oy64dFSKf97sjXSbqCr9mhu59
 6v9DcSL5Zk2Cy81gGJKfDAP57E9ero3wlTwWL2BrLOxJzuusRUSN35zibkgpkop7t01M
 FYu9+zZeNN7pEoh4OhbnwfFj+Ql3F4W+gPEirplcx1xvoBzsEV9raWHBXsNUNJt3gQ3Q
 Enqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHCW116nHEq425X+JrotdU6XFwQDZVE/c+zeGDIHFU6+v3mHyfP1n0j/NBLoOpmrbAjx4Gqx5Chro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytJKRxSzhWRrdsfhd8ODkTroWhs4DXlEaqX4JcrEfH/7HsSUi5
 WlTfM4DhPIgg37eEOQYsCbFsi3wDHmYN+exti+ZMWfsAVve8dQmA20LHYbNJsYg7WSc=
X-Gm-Gg: ASbGnctRkLyQo4WMxDkl4sWgPXv/pKtpe01uGs8zbAJnxVEqfhYRfUOhHGUUThOmCu0
 MvVIPP6/tPkHYQ3RGaxVh1DYKDZ9K0ySomoMQCkGHUoMZ05Q2o8d9txt+SLvWMSeUJ/FO/BjGCb
 Q/ViRqQQLJ2dkQWlVZvx47xxaAJEPn84vsyCMjvPImUvUoHBxh4c/NYh6m5h2+om2qnZ2KQxnYD
 VZVM7izDDkcUgv3ShPc7wjKs6wNmRNGhuQDGSCcoiT8iiSF4rtM2eBcI+1WwS23+xL/ciDDcKXw
 Nxv+s/3Yq74buhwIPhv75Fqb6Hd4POXUUmP36Uc06uZOopravRbfiohTbQwz9bBx3mN/fELpH9a
 9Lj408oZcdKG0jhe0YYilMdPKbHU=
X-Google-Smtp-Source: AGHT+IHlXFQlXQqNpNupwtpvRJnPuKsXYXg5yse55qc7nSnLb1u0RqJ4oB2cIQ0DRGelvNX7cDhImw==
X-Received: by 2002:a5d:64e8:0:b0:3b8:dabe:bd78 with SMTP id
 ffacd0b85a97d-3c0ed1f32ffmr1300950f8f.54.1755596309645; 
 Tue, 19 Aug 2025 02:38:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c077789c92sm2905553f8f.52.2025.08.19.02.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 02:38:29 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:38:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/plane: Fix IS_ERR() vs NULL checks in
 drm_plane_create_hotspot_properties()
Message-ID: <638f3e0c648c3f7c1e3b61dd180d10dc102f52dd.1755591666.git.dan.carpenter@linaro.org>
References: <cover.1755591666.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1755591666.git.dan.carpenter@linaro.org>
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

The drm_property_create_signed_range() function returns NULL on error.  It
doesn't return error pointers.  Fix the check to match.

Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
---
This is a resend of a patch I sent a year ago.
https://lore.kernel.org/all/CABQX2QOoq3H=eHdM83_k5vgHiaMu9Zsto=H7S95QHxT-s16jEQ@mail.gmail.com/
---
 drivers/gpu/drm/drm_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index ad21fc855aea..beef2a06bc75 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -338,14 +338,14 @@ static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
 
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
2.47.2

