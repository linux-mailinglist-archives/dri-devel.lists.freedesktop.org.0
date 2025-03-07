Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4ABA563D5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C39C10EB23;
	Fri,  7 Mar 2025 09:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PCT4iGnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506FC10EB23
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:31:05 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-391211ea598so1064818f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741339864; x=1741944664; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UuKtV48t1X7LVR4XRl12tQehYIh96gIBPvAMlUyvJ9c=;
 b=PCT4iGnzRkYzKJhLcE8QsjLP46Cb7HtFQuNKTvLrq01zJ+syYuO68Rl58yDPWvCisK
 Tsi5FRuCAw5tap4wVFOgLvo+H2EFAF+9Z+3iJTw/rgXHZ+8tzNHwPKABeBqPl1wPNQ4z
 JrCJi/4dbeaHZVOhnBwSqt5LjcRVNtWwgU6DhfeDBFhpm7z37Rkyh2IQRltkwolA0VOO
 SBdztmrLLIUVTOLfccj/8pX6UU0v4m6ZFKpSPzJA0299ukL5Ji2qAlM7ygXzv7oQlCze
 NX2ydNuzozszZTLHnEiYTRNd9zzWT3ojm9WM0k45Cl9/7mAsF+PsJjjaCAHiHNeGtxZs
 XNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339864; x=1741944664;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UuKtV48t1X7LVR4XRl12tQehYIh96gIBPvAMlUyvJ9c=;
 b=ZnSGaPqFPFWdmvwr9wTx1gGgVyPO+svthIeftEUG81jBHinvmjB9F89Rw0AnLCNXyR
 N5XRzfv+y5+e7oVWTPFUXhFN5PNgYMveg+gUv5HaLr9Ktp4LVKjdMpFEGixVc/hdtkUi
 RdD9GC2awKa3U0xxRAhpfPoZ44elNq3z7fN2fgNi+Hg9Mk+JY/ZwmsSsOfb7ZoPkmXHC
 SeZO8iXLB7zJGKdogLuL9RlIP2Jo7TFe9oVlmVxL5REDDcamE8w/mNAl/Nf4jcMLcNp6
 mOK86FNwVsGGrRhMyaQnyedFI8OUSqoGMGlT1GB93fWewUDG43IPFGJXW5pAOInn5cZ7
 nfpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvv0rnomSmJ8XqFr+4Z47g0Ok5ow1uCpBEuJNOQv2dVRWrX6De5Jd4I6kArcF6+qgGuE68E4mdqpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw87fEenAPpj2CiTF0YJVcW7D2Z/T18AYPYJF01o/JrmCsSrdDy
 ub23clisVrcF/R7K5PGjfrZblSXzXYcUJfQP72SytiXJliHH18n5vEeEixoFxCE=
X-Gm-Gg: ASbGncuyyxHX5RISEeeJ/dBIMYH440/mmRdMD7t+nsmCuOBoDGh3pg2tJQvXaACqIuC
 nNPfPqPNce3xYniRcTMfs3UWrXpjsIy7PaGFIblfzwOpJdxqtZge0Kh7je5niIC+h2jy5Segq3a
 ufNIgEFPYFtezC3KNCGkdwO9kAZGOATvOIjIsP0gfTyauJJxGAn/qsvTgkFZ28bc9FqgErnK0Yu
 3XA5pVW+8XhPOh/+WhRda1YhSyy/zjkIRyf0020p+SBXeGU9ToNw/IgeChIXbcUsc10VI19EIR+
 uu0BV5czzgqwnYvqOSM2L9jnwyVw1bb4yGHpX6H0SJ3vbP1PWg==
X-Google-Smtp-Source: AGHT+IHGgil9XvvJ/78/5L3MyKGSYheLPT+najegLrndXP1vKPLf/Ab1cHu+/RbdCgsBcMvfznnH8w==
X-Received: by 2002:a05:6000:402b:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-39132db746amr1441891f8f.49.1741339864000; 
 Fri, 07 Mar 2025 01:31:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0e2f39sm4690339f8f.80.2025.03.07.01.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:31:03 -0800 (PST)
Date: Fri, 7 Mar 2025 12:30:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Janne Grunau <j@jannau.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()
Message-ID: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
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

The __drmm_universal_plane_alloc() function doesn't return NULL, it
returns error pointers.  Update the check to match.

Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/adp/adp_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 0a39abdc9238..db36807005a6 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -232,9 +232,9 @@ static struct drm_plane *adp_plane_new(struct adp_drv_private *adp)
 					     ALL_CRTCS, &adp_plane_funcs,
 					     plane_formats, ARRAY_SIZE(plane_formats),
 					     NULL, DRM_PLANE_TYPE_PRIMARY, "plane");
-	if (!plane) {
+	if (IS_ERR(plane)) {
 		drm_err(drm, "failed to allocate plane");
-		return ERR_PTR(-ENOMEM);
+		return plane;
 	}
 
 	drm_plane_helper_add(plane, &adp_plane_helper_funcs);
-- 
2.47.2

