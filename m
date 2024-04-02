Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C0894F54
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 11:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B1C10F810;
	Tue,  2 Apr 2024 09:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bJOBGw7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E6510F810
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 09:58:15 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so6286616a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 02:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712051893; x=1712656693; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ld5/UZMRVCPDO/dKTQcgFxFhH+C0bdjqoU583UYXs7Q=;
 b=bJOBGw7MJvzEbzReP6axR1lJ/6tFGxJxJaWRB/S41t5MaQ2kHR4NdmyG6c2gla+FXm
 RAuUtT97z6HinntfYmI+rN9+8iKftADJpu6ds7Rm1OEzTIZNJLwjdmQp5McxXNyf72zV
 KBKpkj3/Psxi6HWD2Rz+mFFWEW1/VRRwR//BzMdd1tt0zPh/j2MFKISdspVoqMtbZXo8
 tRtvx1FfMXkGQvaQNRurN1uC8qZgJgSdZ3rm//uv1Hy9oJjPnfmVML/XgqBf7499rGUf
 AHitkxc0+nhMvJ5PlH2Tf/WGE6ONobv3Kw99LpKhle+LKDvXzEFQeQR4S8f839i32Kbu
 MjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712051893; x=1712656693;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ld5/UZMRVCPDO/dKTQcgFxFhH+C0bdjqoU583UYXs7Q=;
 b=TeaERYGoLZQagi7m90RbuyV585c/1F6bFoaOmnUyMOzML/V9d17YWWtYhZKWzxJeVO
 3FQmbZPvY/0gKsqy4Y1mRlM7PiOnfgINt6+VtikjvSbQGaUSKnPmeCnh88HMqSdvaGPf
 6tBW5vAGp46JZ++9akjhigDuCx8mB6/S+APTB3xgXDppaeA5p82A5CRjdF2gY2miwpsu
 8eikk5qKe4iO+EL97lxqbq6YV8Rtajd7cONDifpANJOBQbmV1YTBIPB4gBBmdZBwVhN5
 cWiL/FSS/tDOCir2aAy66Ljrg4T0hAYimXvadmKQ9+Jie7k3SfNHqBqBt5VkSC6uhgA7
 19FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVThrgjoUxQLwgp8yvlumodUVL9EWnyTWOHPqz9SxeqnjLNpmYghRZLlAb0Ti8RULeVHcKN1ns+Yy6+Qy1+Y6tlPKXFg7AAmZWduXsuR/hM
X-Gm-Message-State: AOJu0YzKptY7LJTelcoV0Dgw8rbycw51QZdRMwsYKUdtjZ/cXk7i65sX
 ndU0+2nItTnMFtoHvc6Ou3eWFfSuBDgbymAcABoDRHV0ZEg/ShdYxXu5VBhRXGk=
X-Google-Smtp-Source: AGHT+IFgDns4XbXtOdDo3mYfgf9w3lFqwUVjIK8JRoHpGzz1mCaGhgoZUM8ANRaz4ThKySFmuVQUqQ==
X-Received: by 2002:a50:d4cc:0:b0:56b:9925:38a with SMTP id
 e12-20020a50d4cc000000b0056b9925038amr7967208edj.38.1712051893318; 
 Tue, 02 Apr 2024 02:58:13 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 u22-20020aa7d556000000b0056c63ba1387sm5295464edr.86.2024.04.02.02.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 02:58:13 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:58:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix a couple -ENOMEM error codes
Message-ID: <cf5bbba5-427e-4940-b91e-925f9fa71f8d@moroto.mountain>
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

These error paths forgot to set the error code to -ENOMEM.

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fdd35249169f..a26b40aab261 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1264,8 +1264,10 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
 						 sizeof(*op_ctx->rsvd_page_tables.pages),
 						 GFP_KERNEL);
-	if (!op_ctx->rsvd_page_tables.pages)
+	if (!op_ctx->rsvd_page_tables.pages) {
+		ret = -ENOMEM;
 		goto err_cleanup;
+	}
 
 	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
 				    op_ctx->rsvd_page_tables.pages);
@@ -1318,8 +1320,10 @@ static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
 							 sizeof(*op_ctx->rsvd_page_tables.pages),
 							 GFP_KERNEL);
-		if (!op_ctx->rsvd_page_tables.pages)
+		if (!op_ctx->rsvd_page_tables.pages) {
+			ret = -ENOMEM;
 			goto err_cleanup;
+		}
 
 		ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
 					    op_ctx->rsvd_page_tables.pages);
-- 
2.43.0

