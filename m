Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7015B91B7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F8510E207;
	Thu, 15 Sep 2022 00:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4581A10E204
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuGypoVnJNhzQ829OSUgv+IQ/uot1AKSMTgWYQGrHy8=;
 b=HmB4kmLvyxwKAarsFeYnePQw6jbAonFBKCFQ4l1Lg8tGfJWtgbIvOq/usFJUeKSRXzBXgD
 joHhlzW+jIbh5q02J5Ug5/OBD8pAOMuoEktb4AKurppqKBet1+IHDtjR32fY6n8614TKfL
 bJvgCwk9tVH9UexkVO6KlAfoZPJEJec=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-YYCAyfpSNe-Qx-bNBqDxCQ-1; Wed, 14 Sep 2022 20:32:55 -0400
X-MC-Unique: YYCAyfpSNe-Qx-bNBqDxCQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs4-20020a1709073e8400b0073d66965277so6689203ejc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OuGypoVnJNhzQ829OSUgv+IQ/uot1AKSMTgWYQGrHy8=;
 b=XcCgI/Q5qIHjBwFwXUbHxymvVSwWZFPBB7dxgZw+8la6/DY+BFN2PEQWKuCwfA3gt+
 pcvMfumC2Hgn7PtsRLgPcDsxd2ihajPEXXnwRQ1q0HR7gjGrDD5zsjOLRWeUXOvTuFWD
 mBtHrumS8v/0R5JCT0gpS0kcIf45cHe5iFQdpN0CrCeJwefhDofC/6ZJWoymAl/MFsCz
 4a60EUzCmw/yMBMgm3qaFJHGWwzBJhtLF4Ib8Y+kP6zPvAV3M0cChxr8viFuwxhlS7Kk
 6J4Ka3H2KuQ/jUybufP69EvxP6S+8eYAMi/c6T+Jh5ZjeQBGlRHYXUtntkqvW/ejEe0H
 rf8Q==
X-Gm-Message-State: ACgBeo35s3rZmi/axXno49iuua92COnLOrr/H0xZIyNXbv2lvEdAJGRF
 i7XHgOk6/mId2i0DLJo5mzUk3W5s9RnsnZAPtQAXhJQbFdID7cgsIKbvf+zks6IyFO7dxRUlneJ
 /jP0JywRfgG17EUBOIq1N7aaKXWEI
X-Received: by 2002:a17:907:75d4:b0:77a:fcb7:a2cc with SMTP id
 jl20-20020a17090775d400b0077afcb7a2ccmr17036612ejc.480.1663201974087; 
 Wed, 14 Sep 2022 17:32:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4MNS6XjdMbm8wBWysxd/Ofibg9IanT71clyMWCRa2Ji1qtA7+ijOuAd2lmEatpGLIF+B5n7Q==
X-Received: by 2002:a17:907:75d4:b0:77a:fcb7:a2cc with SMTP id
 jl20-20020a17090775d400b0077afcb7a2ccmr17036608ejc.480.1663201973936; 
 Wed, 14 Sep 2022 17:32:53 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a056402039600b00450d23d40besm10663787edv.82.2022.09.14.17.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:32:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 4/8] drm/fsl-dcu: plane: use drm managed
 resources
Date: Thu, 15 Sep 2022 02:32:27 +0200
Message-Id: <20220915003231.363447-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915003231.363447-1-dakr@redhat.com>
References: <20220915003231.363447-1-dakr@redhat.com>
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c  |  4 ++--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 25 ++++++++-------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index 0b70624260fc..1dad90f701c8 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -176,8 +176,8 @@ int fsl_dcu_drm_crtc_create(struct fsl_dcu_drm_device *fsl_dev)
 	fsl_dcu_drm_init_planes(drm);
 
 	primary = fsl_dcu_drm_primary_create_plane(drm);
-	if (!primary)
-		return -ENOMEM;
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
 
 	ret = drmm_crtc_init_with_planes(drm, crtc, primary, NULL,
 					 &fsl_dcu_drm_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 91865956da02..23ff285da477 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -174,7 +174,6 @@ static const struct drm_plane_helper_funcs fsl_dcu_drm_plane_helper_funcs = {
 static const struct drm_plane_funcs fsl_dcu_drm_plane_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
-	.destroy = drm_plane_helper_destroy,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.reset = drm_atomic_helper_plane_reset,
 	.update_plane = drm_atomic_helper_update_plane,
@@ -206,24 +205,18 @@ void fsl_dcu_drm_init_planes(struct drm_device *dev)
 struct drm_plane *fsl_dcu_drm_primary_create_plane(struct drm_device *dev)
 {
 	struct drm_plane *primary;
-	int ret;
-
-	primary = kzalloc(sizeof(*primary), GFP_KERNEL);
-	if (!primary) {
-		DRM_DEBUG_KMS("Failed to allocate primary plane\n");
-		return NULL;
-	}
 
 	/* possible_crtc's will be filled in later by crtc_init */
-	ret = drm_universal_plane_init(dev, primary, 0,
-				       &fsl_dcu_drm_plane_funcs,
-				       fsl_dcu_drm_plane_formats,
-				       ARRAY_SIZE(fsl_dcu_drm_plane_formats),
-				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret) {
-		kfree(primary);
-		primary = NULL;
+	primary = drmm_universal_plane_alloc(dev, struct drm_plane, dev, 0,
+					     &fsl_dcu_drm_plane_funcs,
+					     fsl_dcu_drm_plane_formats,
+					     ARRAY_SIZE(fsl_dcu_drm_plane_formats),
+					     NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary)) {
+		DRM_DEBUG_KMS("Failed to create primary plane\n");
+		return primary;
 	}
+
 	drm_plane_helper_add(primary, &fsl_dcu_drm_plane_helper_funcs);
 
 	return primary;
-- 
2.37.3

