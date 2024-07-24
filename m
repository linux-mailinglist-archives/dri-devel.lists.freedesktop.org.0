Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B1293B48F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 18:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBC010E746;
	Wed, 24 Jul 2024 16:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sdmPEOdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EED10E746
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 16:09:58 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-260f057aa9bso3743883fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721837397; x=1722442197; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2jZhMoing7DWC/lOhFYXVidQ2q+B0OoDl/QuVCkLmg=;
 b=sdmPEOdAvUBAo7TIEP0KG0tCcp4xHcEuVG1sP6rS7RcLxmUrkDz2UciJ4ReWUKx4jb
 N5l8O2EZSH/slaexHU1niV2xjDoqi0dUZ+nSPpEBwLl5TaKLVXf0hKxxMM/U3BE4jKos
 O58MpLtrCUQTXElr+Qj8S6WJ2Z1D4bFPPLglnqH/+N4A4JM3ds9MKmgwse+G7AYMlAXE
 2ySQTa41ygIBpit+1TSNDmSewYTu9Q89eJDfKUTpDIv5w5WgqwNIPbmnwUBpkew7OX9c
 M1mAvywFfmbeHE3Th84mquZEAwcxHdeoSw1US6bKq115t5MyLNvX+41Ukwn7EBZQ6ZPf
 cMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721837397; x=1722442197;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2jZhMoing7DWC/lOhFYXVidQ2q+B0OoDl/QuVCkLmg=;
 b=Gaw7dfnQ7gxORFiRhchsQPHPC3bv4iSFWBJ/GUF1R/r06AzZA/nqg7mQ8giYOSI+2Z
 O+6LpAq1hbacf35euH/PWYl2feWk3qvxyshuukFUD/Y09ybfcZw0Z9EaFw7icZhrh9Zn
 gK3vf2EgE7fzuqs5L0CuJWL2B9PFVDhchK0rSLS4t5K0NtDAFxpVFJN4TJGAQoIHPsOm
 M+mUytdhrrxNcMbpR779/xvKt6G8MpeKISOjoriIzQDF3CEcZnSNpy+FeVt5E/4MYEJL
 CWAZBIQrukUZNJ9wkKfi21KGpsOgL0FtFQxaoSnhm0k87qOS+jmJxKdOPhDYrB2fgxoj
 0yMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBlOamBEA2utfI2YQ7tBzyxqszOdCaczFcaIJPHbjmRPeY2dM0xIph+754jHeTFFaW5N/+FbiIpxLcMnjoi6d6U3hGTn2QaYm05Vw+8dL9
X-Gm-Message-State: AOJu0YyvnQAbiVir8pZtYdKOPTnzF0MftpPtZGEh/tupGW6QpejquJnA
 g2exTBUqWkTa5zmTSFLzCWxhHDn20dCTacQZRq7QK3HiZMxPjX5Yac5tvnlEnLqnAk11vaIf9nt
 P5q0=
X-Google-Smtp-Source: AGHT+IHCvg+D37qFDPSAV2DjfuTODsZ2i9ctUl1JsN9tBVVXcEXaPTGM2Fzh7+EL/qLQElF4DzvcQw==
X-Received: by 2002:a05:6870:c190:b0:260:fdda:5068 with SMTP id
 586e51a60fabf-2648ca35f3emr2882513fac.4.1721837397103; 
 Wed, 24 Jul 2024 09:09:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:23ae:46cb:84b6:1002])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3db0331a01bsm637378b6e.55.2024.07.24.09.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 09:09:56 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:09:54 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/client: Fix error code in drm_client_buffer_vmap_local()
Message-ID: <89d13df3-747c-4c5d-b122-d081aef5110a@stanley.mountain>
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

This function accidentally returns zero/success on the failure path.
It leads to locking issues and an uninitialized *map_copy in the
caller.

Fixes: b4b0193e83cb ("drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 2803ac111bbd..bfedcbf516db 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -355,7 +355,7 @@ int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 
 err_drm_gem_vmap_unlocked:
 	drm_gem_unlock(gem);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap_local);
 
-- 
2.43.0

