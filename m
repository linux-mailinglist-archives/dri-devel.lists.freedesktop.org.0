Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D406ABEA6D8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB7710EA44;
	Fri, 17 Oct 2025 16:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uXVGXAIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00E010EA44
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:03:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-471075c0a18so21838605e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760717018; x=1761321818; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ppRljhpZ7sAECJRgv3z2Edioee6aFFS5l0XZiKbfH4=;
 b=uXVGXAICQEJs1Wx/a/uwznazzwDNZsTcLE6T05hHLGWMuT/KdxEgd5N+rBzd3PVS3+
 LxIEyNUvjDZn/7fduFXlTCeJ7DtMCn9T4VdwT9CSahj9BIG1FyiiOlAWdIcoxmvrY389
 ZX/AQgo5CIKXI/Z+I6GJkQfrK3e8CeKiMppTqSbKov5HgiTF1wyjiv/k9ieZAeUwjfRi
 Ti4DQJ4LhDu/nDHcF3CvU/6QUTV3aI2VhJPcq+9dvEdZommLgxpKblAkrD7i4OzCuSAw
 ykJRuswABjDkrb9+yIo/p0OUJe3BZAFEwiw5LHrEiLVx8vf75UprMUDoVIJGpzEA0MFH
 TK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760717018; x=1761321818;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ppRljhpZ7sAECJRgv3z2Edioee6aFFS5l0XZiKbfH4=;
 b=PBxQKb4RdtCzU4wkECRLPoIxAyDHkLoD+f9zhqovMBcC0LZySqZpHllLCAGQgp1daU
 KLcmzm5kFS4KHQ7QQkP3VKoberv4ekSVeqiIinv1ixDUxXzTxYey/Hm9b4uF51OR7ADB
 a2dIYej+7WG9+Uk+lH1rAGmfZ/Vo7dxQL9O1qGnv86Sptt5eku18G066GuqttO65viha
 9RJRLOUbg123EuEVe0ErhERVNG2saOqatQzPn1xxP4cWToqUYKqLU+2M4paADCgKYB7V
 muDvjErncazECwCMw3F0UQSNHcUtbXRkwkTYrDs3OFOvnkkC/CPrXa8yLSMZOG6FfZJh
 iirg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvzrAAZwws9akJJq4nn09Hh/cigGOS2cJ7p9o6NZkWLS5B7ukeJr3Q8+VZORn5hZjLAH2A5yOYeJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2xmpEb6e8PWqIpL88vk+hOE6k8eccvh4/eT77QBz3c2RDyzGH
 lAfSBofwKf6b/CcDZzHlWkMJ/B6Gz6JdQXGS6x2zv7/Xps0AC4M1E5vibsa1a7ov4N0=
X-Gm-Gg: ASbGncvSm6chAI1EYwAgmbt9Fg4PW7BvxTvlj1EfGFDeEiKdnHSdw9GEDOIaJGUKeXB
 JHU8rbQZ0oGiFHjPZ2PcrrEqoCVNVye28GhEdiuSGXhvnPsyLJIMTxiiwwIRovG3kz27YX/7Rpq
 cFOPr6Le5vIZqtympB9JmD+LTFcNaiSHBKCepAYVV3ZRnA8W9uugHVUpBVg5zf2EoPuDiYAPuyi
 pXd8eOiZ8jUH95FIxM5M7u8kUacR5QbQOCqiAHvjHPLD6lZjoiwu2jS8r3qjTMcnF3A8g9cLv7Z
 O2FSNvJFTn9RCRN5B2ciClNb4dnSDdinzKvxeInlEFWzTJS7HijAbxs1iRD/kaqgvJcYnf+oEr7
 a7jHwewApDBwaJ9SF28j8FOE3cjXNPTISlyzlXQuY3eqX7EFvRxaM9Sd2hmLt3Q1lVK2LH3+Yhh
 rZkMK6pfYDwhkJS/9utYOLAp5R9gI=
X-Google-Smtp-Source: AGHT+IEvEE+Kq6kgGCQVfufhYDGLF1UwGNj+vy55Ir4PUIuACrWwdwcv4BS7vhmELR8Tp9IGWl6shQ==
X-Received: by 2002:a05:600c:5296:b0:46e:1b89:77f1 with SMTP id
 5b1f17b1804b1-47117879898mr31462585e9.9.1760717017876; 
 Fri, 17 Oct 2025 09:03:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4270665efdcsm5017211f8f.29.2025.10.17.09.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 09:03:37 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:03:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/sysfb: Fix a NULL vs IS_ERR() bug
Message-ID: <aPJo1W5Dl4rmGX_P@stanley.mountain>
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

The drm_atomic_get_crtc_state() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic check")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 8517c490e815..d2c4d8f3d4d0 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -259,7 +259,7 @@ int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
 	ret = -EINVAL;
 
 	crtc_state = drm_atomic_get_crtc_state(plane_state->state, plane_state->crtc);
-	if (drm_WARN_ON_ONCE(dev, !crtc_state))
+	if (drm_WARN_ON_ONCE(dev, IS_ERR(crtc_state)))
 		goto err_drm_gem_end_shadow_fb_access;
 	sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
 
-- 
2.51.0

