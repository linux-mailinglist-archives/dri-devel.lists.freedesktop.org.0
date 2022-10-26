Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0D60E518
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2293C10E3A8;
	Wed, 26 Oct 2022 16:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B0D10E3A8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666799998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpNq1qUZhKiifLu+KM9SiJRwdNZ6qs1ZpRyRyQhvDJU=;
 b=LWvhtCX3hdtUHXe/i+owOBFDSxOBIxZ/8PxWazH20hsoHxtOkx3dYf/xWIGD7Tmq8Z/Mf9
 bRa4tQJnjHH/W6/ft2TgaX3zDZZBb6rjQGzN0R1S2EHwhBQEveG+89453lNCZvfvI6G/yz
 4E/Dta1vtIuTs1RSwIbvttio3Cz54cw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-XcaonzF5P3uUxRWgmV4sGw-1; Wed, 26 Oct 2022 11:59:57 -0400
X-MC-Unique: XcaonzF5P3uUxRWgmV4sGw-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs34-20020a1709073ea200b007ad86f91d39so297804ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpNq1qUZhKiifLu+KM9SiJRwdNZ6qs1ZpRyRyQhvDJU=;
 b=lxXktbwS63EKJFv622xxyPSxbBDOmP12kTTuuz+ccB3Q+QciFmfZhA8OIW2iN4FtIr
 8tagozO+oLg9LiQRu2K2imgwZ7oGE2TD9PDaFhYq+iDAH51PjmxOW8BHR95JoGK/11jk
 ViJYaEA6Gh3iZBRpWawNlZptfwwHOtGqGycgZB1CoTYDTe9rWxN6tAWqAh1/G8R9TB7X
 fjFsrtAhWAnsRZBscahWYtSUFHQaxQ9ikrB5ehsHNNqa6XXGQaFQ8RjkbbeZpGnXmZzD
 AHeCLIuALqVG9GnifUDy/r6i+8j3lBQp9tQ4Q1gJDHef74jAtxHdsay7J6BCaueKjlTB
 Qc6A==
X-Gm-Message-State: ACrzQf1G9N9KwBWbRUkp+R5A5eUtfn/6y/MrPjBLLDu6CU67xSdy+1CS
 PzyjgEJiJPL/AFkfykK8NX+94mCWoFwJOtI9p+qjSagc69tNJUE9HYjSP6sXUQTIbw3Kjhmk3Sd
 IOHRpJwJzkpYEdey19bTV10SuF9Xq
X-Received: by 2002:a17:907:7da5:b0:78e:2c3b:55a2 with SMTP id
 oz37-20020a1709077da500b0078e2c3b55a2mr37640214ejc.96.1666799995809; 
 Wed, 26 Oct 2022 08:59:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5YrSAyisghiztcgWJNOopJzEmf3XBSlrRm9MEdt4PsEo1LmsNW0ikCNzTUPDQnoeFLY5vctg==
X-Received: by 2002:a17:907:7da5:b0:78e:2c3b:55a2 with SMTP id
 oz37-20020a1709077da500b0078e2c3b55a2mr37640195ejc.96.1666799995600; 
 Wed, 26 Oct 2022 08:59:55 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709064a4100b00730bfe6adc4sm3202386ejv.37.2022.10.26.08.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:59:55 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 4/5] drm/arm/malidp: plane: use drm managed
 resources
Date: Wed, 26 Oct 2022 17:59:33 +0200
Message-Id: <20221026155934.125294-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026155934.125294-1-dakr@redhat.com>
References: <20221026155934.125294-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm managed resource allocation (drmm_universal_plane_alloc()) in
order to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 815d9199752f..34547edf1ee3 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -68,14 +68,6 @@
 /* readahead for partial-frame prefetch */
 #define MALIDP_MMU_PREFETCH_READAHEAD		8
 
-static void malidp_de_plane_destroy(struct drm_plane *plane)
-{
-	struct malidp_plane *mp = to_malidp_plane(plane);
-
-	drm_plane_cleanup(plane);
-	kfree(mp);
-}
-
 /*
  * Replicate what the default ->reset hook does: free the state pointer and
  * allocate a new empty object. We just need enough space to store
@@ -260,7 +252,6 @@ static bool malidp_format_mod_supported_per_plane(struct drm_plane *plane,
 static const struct drm_plane_funcs malidp_de_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = malidp_de_plane_destroy,
 	.reset = malidp_plane_reset,
 	.atomic_duplicate_state = malidp_duplicate_plane_state,
 	.atomic_destroy_state = malidp_destroy_plane_state,
@@ -972,12 +963,6 @@ int malidp_de_planes_init(struct drm_device *drm)
 	for (i = 0; i < map->n_layers; i++) {
 		u8 id = map->layers[i].id;
 
-		plane = kzalloc(sizeof(*plane), GFP_KERNEL);
-		if (!plane) {
-			ret = -ENOMEM;
-			goto cleanup;
-		}
-
 		/* build the list of DRM supported formats based on the map */
 		for (n = 0, j = 0;  j < map->n_pixel_formats; j++) {
 			if ((map->pixel_formats[j].layer & id) == id)
@@ -990,13 +975,14 @@ int malidp_de_planes_init(struct drm_device *drm)
 		/*
 		 * All the layers except smart layer supports AFBC modifiers.
 		 */
-		ret = drm_universal_plane_init(drm, &plane->base, crtcs,
-				&malidp_de_plane_funcs, formats, n,
-				(id == DE_SMART) ? linear_only_modifiers : modifiers,
-				plane_type, NULL);
-
-		if (ret < 0)
+		plane = drmm_universal_plane_alloc(drm, struct malidp_plane, base,
+						   crtcs, &malidp_de_plane_funcs, formats, n,
+						   (id == DE_SMART) ? linear_only_modifiers :
+						   modifiers, plane_type, NULL);
+		if (IS_ERR(plane)) {
+			ret = PTR_ERR(plane);
 			goto cleanup;
+		}
 
 		drm_plane_helper_add(&plane->base,
 				     &malidp_de_plane_helper_funcs);
-- 
2.37.3

