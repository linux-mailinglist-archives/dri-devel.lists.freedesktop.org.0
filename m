Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD4490403
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9C110E361;
	Mon, 17 Jan 2022 08:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FE110E3DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:38:37 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id t18so20494870plg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3dMb3L6alEHiAdLanjhoWI6FKkNSSFPHoeSh767vk0=;
 b=lVmAx9LIJmnrwluVwigCccYGNdJ3TijZkDjlw/Q2z3yxktk3EFUQ+7TjP9eL/X1q4p
 thm8OwOcBOiLNi4Wa+fzi3vPk6xUT0hI+uxjRRyisbi8SPOi1y/O+zXB25xPoDFNRDFI
 Ig3EeRAsck/F6GwjrZkSV0GJq3FN9dvJ57fMbLVU857fl8pNyGNezQjVZAMDsuYFImg0
 y7eGDcQc8atsOp+DylHX5YJJjksxqCOMe+ZbBy4IIUM6NnPGyhHPBmm/XBOFry5RmL/J
 6o/OeD1dM0+uXfOmCJKSRZzjF4vcWI6LJ6T/4djB4tr60/PHw13EPiyRHSCMAs+w6ofT
 +bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3dMb3L6alEHiAdLanjhoWI6FKkNSSFPHoeSh767vk0=;
 b=JrEqALzCEM0bzGAeE5nBuWoefLAHHTLipxx8hmv4c/KLJcG/LGBiF/VMyh9mWQcG8c
 pTyu4bX9sSeSYoDacAAz0w2lbBkSHqAD6DMc+YmdainqGPmuf3ovNVVnq7jTwdGwC1m2
 SQWofjJZy9ew+DLkxcAJbpRa0zQN9XEmEOcg3WrzZwcYb7YzEpAHnxpgH9i2xb4RK51z
 BGxQwDMo/bc9dpQ92DpHgDrCQWUIQpU/u42cYsRhpgGcnkmx/8nT6AEwBO95mBsNSmUO
 GKdByXhMWLYhIjiIQcrk/Xs1v1W4/1s0r2ODoA1tMsJ73fgx4Ep0WhTl8HfZydBkDvHF
 DDXQ==
X-Gm-Message-State: AOAM5319SbumLvxDylb8jDK/hm5NBg4bLKSSuLsq3VdTeih8oXgDINNK
 k5SRq0EanoWP3ojwM4CAmIw=
X-Google-Smtp-Source: ABdhPJwqtjOW+jcPjrQBChZw59j+MKfYUcjzeqZtqLvQ0rh9JvbLq/1phu/gffQa8KpYOdtz5L+EPw==
X-Received: by 2002:a17:90b:38c1:: with SMTP id
 nn1mr9329697pjb.224.1642408717272; 
 Mon, 17 Jan 2022 00:38:37 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([103.6.5.6])
 by smtp.gmail.com with ESMTPSA id pg9sm7260181pjb.44.2022.01.17.00.38.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:38:36 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, mark.rutland@arm.com, javierm@redhat.com,
 tzimmermann@suse.de, lukas.bulwahn@gmail.com
Subject: [PATCH v2 1/3] drm/sprd: remove the selected DRM_KMS_CMA_HELPER in
 kconfig
Date: Mon, 17 Jan 2022 16:38:18 +0800
Message-Id: <20220117083820.6893-2-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220117083820.6893-1-kevin3.tang@gmail.com>
References: <20220117083820.6893-1-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, kevin3.tang@gmail.com, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, zou_wei@huawei.com, pony1.wu@gmail.com,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On commit 43531edd53f0 ("drm/sprd: add Unisoc's drm kms master"),
adds the config DRM_SPRD, which selects DRM_KMS_CMA_HELPER.

However, commit 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER
option") just removed the DRM_KMS_CMA_HELPER.
So the select DRM_KMS_CMA_HELPER refers to a non-existing kconfig symbol.

Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

v1 -> v2:
- fix commit comments long lines issue and drop "On linux-next" comments
---
 drivers/gpu/drm/sprd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
index 3edeaeca0..9a9c7ebfc 100644
--- a/drivers/gpu/drm/sprd/Kconfig
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -3,7 +3,6 @@ config DRM_SPRD
 	depends on ARCH_SPRD || COMPILE_TEST
 	depends on DRM && OF
 	select DRM_GEM_CMA_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
-- 
2.29.0

