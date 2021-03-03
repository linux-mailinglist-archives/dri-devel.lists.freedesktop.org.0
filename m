Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B215B32B7E5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 13:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F3E6E3EE;
	Wed,  3 Mar 2021 12:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEA36E3DF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 12:53:01 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id e9so4093808pjs.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 04:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SMLSZ661wk6fExMDN3tlUU4qJDW65aXvHGdCmbhry1s=;
 b=sb6qfWE7bnQxJYfJwUAwmAE/yKjmR2V9HcX9K8p3IdKwq8Lbq+I0gJBEe8AD2wQgOY
 8nVs5qtdlp6uH2V9nONgA39AjTMHrT/rRgpgGeR/LMaalld3WsflFlu2Jh/Zc34hdMEF
 Ihs01lN8wpDxETtXo07wVMjYjXDsWs464OO+a0yhVPtuRIa18/wrT+irfq6aorGPewxy
 YH0J8WTxhDNKFqquTR+CeKglcURz0YSzT8qae7NEGCSEkY8NtuVjSY8EedMkeDIlP9Bv
 QE3gODoPe9cLtocEcH146wRRomV++usn6/fyBq70vLPaYcc5EWSzjdXo+ykcd7M8WqLe
 Srhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SMLSZ661wk6fExMDN3tlUU4qJDW65aXvHGdCmbhry1s=;
 b=IqmobgZ0ZvyO5C+BMWll2JLLjP00mPZktht2SnMb0d6MVXuYUrrutWgP+Z+Y0x52i1
 GQ8SpNfnQSQpGmGB+qEco6WyVKMmTrff235n255HlJwdCOKV9MJZqmanb8UQt5ZB7hlp
 +OyPXWy3leeGV6UDgff95tycdLSN2eCHOLSnsixftS3fezuh7A9dJ9/qmEObXHxHbpEw
 7kvn/mv/T4qNvWgvRVd5pfVnirePrbTvuz6HU/V9NkMyCk2qlV5dStStSGCPBQeOsMI+
 QLlmQSXbHmkJ9Smb7WxK8+LKS5YW/3DtbH6tKDXKqBhNOGuLOObuuqbpisFnz1E7bF8C
 xlwg==
X-Gm-Message-State: AOAM532UjpGfDVE6n4Fp+sO/XQ1KFf27TYTrOplItpcci5w9SD9egTaS
 z/dEkBCRkkLqtT1w0+Zpn+I=
X-Google-Smtp-Source: ABdhPJyK7vG/RD8twY1z7+hWj6aJGl/4qTtMX195lU58sTqgj5FlqrtTKwkto2LmPR9Bjtm26kGqzw==
X-Received: by 2002:a17:902:b7cb:b029:e4:55cd:ddf0 with SMTP id
 v11-20020a170902b7cbb02900e455cdddf0mr2659381plz.45.1614775981254; 
 Wed, 03 Mar 2021 04:53:01 -0800 (PST)
Received: from adolin ([49.207.223.176])
 by smtp.gmail.com with ESMTPSA id s10sm24418750pgl.90.2021.03.03.04.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:53:00 -0800 (PST)
Date: Wed, 3 Mar 2021 18:22:56 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V2 2/2] drm/vkms: Add crtc atomic helper functions for
 virtual mode
Message-ID: <b6daa0dd91269fa6a3463c132057d553eb9207c1.1614775351.git.sylphrenadin@gmail.com>
References: <cover.1614775351.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1614775351.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new drm_crtc_helper_funcs struct,
vkms_virtual_crtc_helper_funcs() which holds the atomic helpers
for virtual hardware mode. Change the existing
vkms_crtc_helper_funcs struct to vkms_vblank_crtc_helper_funcs
which holds atomic helpers for the vblank mode.

This patch makes the code flow clearer and easier to test
virtual hardware mode.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---

Changes in V2:
- Add atomic helper functions in a separate struct for virtual hardware
mode (Daniel)
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 69 ++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 6cc8dc23bd5d..7d5562ab5ce6 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -221,48 +221,35 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
-				    struct drm_atomic_state *state)
+static void vkms_vblank_crtc_atomic_enable(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state)
 {
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
-
-	if (!vkmsdev->config->virtual_hw)
-		drm_crtc_vblank_on(crtc);
+	drm_crtc_vblank_on(crtc);
 }
 
-static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
+static void vkms_vblank_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
-
-	if (!vkmsdev->config->virtual_hw)
-		drm_crtc_vblank_off(crtc);
+	drm_crtc_vblank_off(crtc);
 }
 
-static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
+static void vkms_vblank_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
 
 	/* This lock is held across the atomic commit to block vblank timer
 	 * from scheduling vkms_composer_worker until the composer is updated
 	 */
-	if (!vkmsdev->config->virtual_hw)
-		spin_lock_irq(&vkms_output->lock);
+	spin_lock_irq(&vkms_output->lock);
 }
 
-static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
+static void vkms_vblank_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
-	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc->state);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
-
-	if (vkmsdev->config->virtual_hw)
-		vkms_crtc_composer(vkms_state);
 
-	if (crtc->state->event && !vkmsdev->config->virtual_hw) {
+	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
@@ -277,22 +264,41 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
 
-	if (!vkmsdev->config->virtual_hw)
-		spin_unlock_irq(&vkms_output->lock);
+	spin_unlock_irq(&vkms_output->lock);
 }
 
-static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
+/*
+ * Crtc functions for virtual hardware/vblankless mode
+ */
+static void vkms_virtual_crtc_atomic_flush(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc->state);
+
+	vkms_crtc_composer(vkms_state);
+
+	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+}
+
+static const struct drm_crtc_helper_funcs vkms_vblank_crtc_helper_funcs = {
 	.atomic_check	= vkms_crtc_atomic_check,
-	.atomic_begin	= vkms_crtc_atomic_begin,
-	.atomic_flush	= vkms_crtc_atomic_flush,
-	.atomic_enable	= vkms_crtc_atomic_enable,
-	.atomic_disable	= vkms_crtc_atomic_disable,
+	.atomic_begin	= vkms_vblank_crtc_atomic_begin,
+	.atomic_flush	= vkms_vblank_crtc_atomic_flush,
+	.atomic_enable	= vkms_vblank_crtc_atomic_enable,
+	.atomic_disable	= vkms_vblank_crtc_atomic_disable,
+};
+
+static const struct drm_crtc_helper_funcs vkms_virtual_crtc_helper_funcs = {
+	.atomic_check	= vkms_crtc_atomic_check,
+	.atomic_flush	= vkms_virtual_crtc_atomic_flush,
 };
 
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor)
 {
 	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	int ret;
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
@@ -302,7 +308,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		return ret;
 	}
 
-	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
+	if (vkmsdev->config->virtual_hw)
+		drm_crtc_helper_add(crtc, &vkms_virtual_crtc_helper_funcs);
+	else
+		drm_crtc_helper_add(crtc, &vkms_vblank_crtc_helper_funcs);
 
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
