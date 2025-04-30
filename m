Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A845AA44A5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5294710E6E0;
	Wed, 30 Apr 2025 08:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WP/7U1gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7617910E6EC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:01:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394a823036so67981305e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746000089; x=1746604889; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XVsI8LQZj8BwCLrRgRJ4kPnlB5Zuoj8Y+TGCFkKkR4M=;
 b=WP/7U1gisQS563aL7Aqc7+tb1DdzSYPbbKHY6bFBak/sVNILS9ECpg2JwHS1fzTuQX
 nZNDstANvymWalIfsHpcINGaprjYd147EQYMSyBKpHN7Zox2iO8Jf+EcE9FFL8ITLtpS
 rBw4SzMmlvCXaixriE3F2Esr5vaq0548kCLLX/bJl+b93O0u5njtw7Wr6yaXNUypla9i
 aU74kuw+7BTXsw3ZXC3frmuFu5qQOnL9zwns0KGGXqmMmmex8+ustJ1wXZDYA016bThH
 N65zke5qwvGWbsPgWA04eMtknN3JXozvLx1msb2nBF5exJ0tZnY+/KihTGolS80T6Eup
 VfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746000089; x=1746604889;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XVsI8LQZj8BwCLrRgRJ4kPnlB5Zuoj8Y+TGCFkKkR4M=;
 b=o/sFsz9LX/Tn3MnrN2EaXOMJpBg5cqNdW88ekJBqwGhS3idle1CrJo+WQQw4OytBYB
 l+ljaQbS3E2OM1Ke4WDQWQlKmSmRDYx5IS28fFWYcCij4q0IsnhOVuzvGJQvwSodtT2n
 vd62COrQJvLm+9Sbo6OKxsWKPC5XoR6j4finHsVQSu84AqK6ZQlkrdxAtHZg22glV5dQ
 hUIoboYpUg9GX4QWahbvvOonAJtIfhbMNifqEIbTsuOhiieKFYTqayOTwdTaLwLmMIFi
 IYB09Q6BmPn1uoYQgloPUspZLuGSkPMnlY/hDhBkFyU0+tH4HwFXCNxUVyYQs1buZZa/
 2MoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGKbosIqnAmcpydSBjwU6421dWi+hhUl8to4HtKpY31dXo2aap7Uec9pekT1QfCWqWeEkzCIB/dtI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBdsB2ssBe734W5AGo43mqgaSwM/RHZOsV/mb39whomtyWOr0L
 BU21RDIfpTUILT7FcWa5pPUeO5gSSfvarkIMoVATMBfmHQHw1McV+AbUdj6UVIw=
X-Gm-Gg: ASbGnct5QJ4IIFr55MZ1/mzHLldSA5EHGfc2on4igXoOh1GKFb64QtQxojT7g0n3wDK
 HVNpiqrfrLGvsObaU4Mred1FO8nEip0M1tSDFRLPA6wonhKOy98ZiIVV1QN1LPch3eu0lXV4yyJ
 penTAwwYqAMX4sBJDy8g/Sw191gk3mcaujYCjkdVYnWfKRt+1otTyOfxbCCbJcUkmt5YNz8Sqtr
 ZhSi7NltvKve7VPr0TL0bl34gwmRUYHZ+lUvxoIU6130PdZUyThhwl9niYj1am8gm7OVPvHo+IE
 8Ue3vFfHoTQLeZ9BZUgWVatdyxowHgcy1N4NMsgGp3cfgA==
X-Google-Smtp-Source: AGHT+IGSWw5YzFLfOEVeGZ2sMxce5ruW0SonDB1/HWE46YfPkACQqdVyQiIV6naiuky8x9154Y7AYg==
X-Received: by 2002:a05:600c:35cc:b0:43c:f470:7605 with SMTP id
 5b1f17b1804b1-441b1f33a80mr15531415e9.12.1746000088903; 
 Wed, 30 Apr 2025 01:01:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2b5951asm15364615e9.0.2025.04.30.01.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 01:01:28 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:01:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu/userq: Call unreserve on error in
 amdgpu_userq_fence_read_wptr()
Message-ID: <aBHY1IPONYHyybrf@stanley.mountain>
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

This error path should call amdgpu_bo_unreserve() before returning.

Fixes: d8675102ba32 ("drm/amdgpu: add vm root BO lock before accessing the vm")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index be068e8e37d1..57169a8224be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -373,6 +373,7 @@ static int amdgpu_userq_fence_read_wptr(struct amdgpu_usermode_queue *queue,
 
 	mapping = amdgpu_vm_bo_lookup_mapping(queue->vm, addr >> PAGE_SHIFT);
 	if (!mapping) {
+		amdgpu_bo_unreserve(queue->vm->root.bo);
 		DRM_ERROR("Failed to lookup amdgpu_bo_va_mapping\n");
 		return -EINVAL;
 	}
-- 
2.47.2

