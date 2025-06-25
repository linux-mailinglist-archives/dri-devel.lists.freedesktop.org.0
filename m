Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A778AE87D8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3DB10E764;
	Wed, 25 Jun 2025 15:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="znZC0noK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C8D10E764
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:22:30 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-408d14c7ebeso20508b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750864949; x=1751469749; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7AotgDT5LaYynHW/ZEfD1/SGeGKITLpNV/LQfaww2/4=;
 b=znZC0noKsS1okXYz50HRzZuLVnZNz7IStJP7OzNAP13A5eTC7eCFZJYX0tvFKC0qHa
 mfmYDcGeOCq/JE/xdELDLOCreKuHCoSurFrDVQWxyA1ekCJYdgROJeQRTlxN/R8eQD0i
 KuulBIh7xm/1G3HOkJOcTlemskA4x7uY/xkr0rbHvf3pvpoU5FmBW1K0+s5gakP1rNGa
 DOYrjlVP+npJbVqb2O1XEntde4dhGv2TyEuOnpIUzBAK5rJlhfQ2VhW5tSYThSmYJkl7
 4KVQvNnDva3hCFIFhVHF4dI9xyJrwrXk3UfOmnf717r2o4WS3pzMj3wh1x2pwMBsB5u3
 Ztlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750864949; x=1751469749;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AotgDT5LaYynHW/ZEfD1/SGeGKITLpNV/LQfaww2/4=;
 b=ed80R1F1wIV5PfetkTi7c9aPOUq8BVY6uM4Ure/cN/eqAffnBLbHvsrATVzNDQEeuX
 /exnFosLNqC7n0QbKeBhrkHtnsErv480J824//BgmNuxY8mKdb74yJltWjflGNqTsFYo
 iO7e3LStXrFQEpSuC7TbaUZ+kDIBRww12enze+JeCqGpc2CgIKRCQZD7sEWbYWHqBJii
 tPVY9aflF82beqOcl4VgcMM48OPeaVfDsFV9HhMz4ffaksKXQ9cXXhYjs928gvp96Lcj
 Acj+zTzPi7ol8hOE5B+aVk4atDZDgg8ojTYFhxjc0I0i69H++VOsN4GA5eAVRWAbrZFs
 iNtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXHJEjc4pe+VN5pTRm1JlJ+lDJ5MCztbD4g8Sesh+YLuzFeNGSq/jmPH6YZ9FWdzN6zUIc+uER5fI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtrQsHiaF10Z6oWfOz/WVA53u8cQZEL9tFOi5yLUpusnKZpy41
 32E73iyMoqmCimsKB1t/kUD+cWUP4SwUX+HkVy6+exeRURcxpjYUKjKFAvCEJLRrhG4=
X-Gm-Gg: ASbGnctWxbXrHhwXm3KmnOSXqh72wdsW31NnBlMSyT0NQu+YSN4Sg44LJs5Jd1UssUl
 GMWYTwqsbjKziWp/6ERVqmjPS8KnWx2FDZ1F8IPoAky5G+E7hoj1TSvqG+kXuQKge0dy8WYvQGX
 4ajBJVtpuhS9op5aqLyUNBrS2lUvOeJklJrvL158Tr1GiI+vYX2pl0WJNforMorQ6oOcx/pzEh0
 yqgOSyApEdKmb++VFym/k860ue4TgkJE/96JZMaRx8gvWXpd+h+L10eOtJ7HQFBdGrzcWBGZDXu
 tRNrSXvlrRZokXLUEfc4itMc/izo+Xn0r46F/ObLCXC/ZkxpZpXGDDXWQjUKXYx+1HC81g==
X-Google-Smtp-Source: AGHT+IGsr3ucc8CyFqc6Gm9yOw1rdKd2Ohl95Xek/6xI6751ZImxrSCLvS3rUdnLDFx5jkH5lTS+2Q==
X-Received: by 2002:a05:6808:1817:b0:406:1e0c:3196 with SMTP id
 5614622812f47-40b057f075amr3033719b6e.28.1750864949418; 
 Wed, 25 Jun 2025 08:22:29 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
 by smtp.gmail.com with UTF8SMTPSA id
 5614622812f47-40ac6d3f540sm2202840b6e.50.2025.06.25.08.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:22:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:27 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Min <Frank.Min@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>,
 Asad Kamal <asad.kamal@amd.com>, Ying Li <yingli12@amd.com>,
 Prike Liang <Prike.Liang@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: indent an if statement
Message-ID: <5827884c-f269-4e38-8202-2a3fce280ae3@sabinyo.mountain>
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

The "return true;" line wasn't indented.  Also checkpatch likes when
we align the && conditions.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index d777c049747e..a0b50a8ac9c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1400,8 +1400,8 @@ bool amdgpu_is_kicker_fw(struct amdgpu_device *adev)
 
 	for (i = 0; i < ARRAY_SIZE(kicker_device_list); i++) {
 		if (adev->pdev->device == kicker_device_list[i].device &&
-			adev->pdev->revision == kicker_device_list[i].revision)
-		return true;
+		    adev->pdev->revision == kicker_device_list[i].revision)
+			return true;
 	}
 
 	return false;
-- 
2.47.2

