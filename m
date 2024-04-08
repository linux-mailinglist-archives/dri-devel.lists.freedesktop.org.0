Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EB89CA92
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888111128EE;
	Mon,  8 Apr 2024 17:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c5y1re3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133451128F4;
 Mon,  8 Apr 2024 17:16:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-345522f7c32so580661f8f.0; 
 Mon, 08 Apr 2024 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712596569; x=1713201369; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Z/MHDC/Igjk4t4nZzuD7aGsRzLn8MSL7qY/uwxsEKAQ=;
 b=c5y1re3UB2/cx8Yo9o9bvzMRKBm0/RM4L4zcM8JkR55L1coIzwJtGSGhNPfUd9ZeMD
 Ufe4c4HmTlCRxkNQQTBetssqtiDYc0mljsOSCThiSJerwOUBFKAhkWCg7zdlq+7TIty+
 +9OIHBwSKwIsbJQOZ3w8E7ROYZlRixWTL6E7dlkB8zqB6SFA2KSEVQTGWb33tUPO2v9I
 p4tDkmpVLdS2b1WGMrJYrPQ/UoSzyDd9s6qlXDN6N5Q/ZzvQP3xR1MdXnREcfrquOUN3
 a3U0x4DqcgJYatLESRmhscHaYwsSkiP8xZo65nKuJ+ZlfHiOhqjlXi4WfzXjzeRJbTuy
 9c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712596569; x=1713201369;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z/MHDC/Igjk4t4nZzuD7aGsRzLn8MSL7qY/uwxsEKAQ=;
 b=l2XAKX1VLrM6UY88HipeUmMyWJEpWPUjB4SQQAf4jM/E4AQdVnWVCmU6VEMdH/GwAb
 T7B9qrR7rRYOnfKiAnZa4tA3KxhQAdXgVieDQT6LjiIQmrT3qJc9YW3O4+nKT0Cx5/ik
 fCnxB+UGlG6wnjc/zcektSKjYp3xA5lvRWDgumLNNknE0dIZDc8M2tIreuJR3SEGHaP/
 rKFUD3Cmrga942f3xTAz0nDrZXyL0UFTrFNr8PcNc6LpqI4kqbFMm9rQ28xe9capIaEl
 DT5NtCn3+vHnh7r8naMmYE8wxhmisWIaYfOZDsIJJ8ucaziwuPIARiyBARAVelg7wDvq
 rX8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr6D+lFYVc1DztL8QMUFcpaNEMFO5KgXtO+BzXJ5f31uWAH1nj0kj0UGERUVx9BmJqBkMNZaWHnDxQervGr007Yahx0XbkJs+gaLm0WCrqx8ycOuHkXIW8ypwyQJnbtuQLF1W+zto7hS8qS08X8Q==
X-Gm-Message-State: AOJu0YzgSLBzTq5ZBd4gk20ksXI81ZNzepKB8znpHdw9Iyj18OJmUHF4
 bDNn9Lktu/MZNzup2kNlAQrYycENCd8N8Wa4LR6vhIp6txYYvoFN2iF3c+1YbYbrhi+Otr/e/RA
 RHIS7nPqSybuvjrj+1jBTOxrjp4A=
X-Google-Smtp-Source: AGHT+IHEKZWh5orZ4XPPFfsWqaRfB/CBsxW2Nv4wV+6virLOPv0C2g5dW/Tx1fVt3NVryKgyJV1uQMwwyeCfjtnsS9A=
X-Received: by 2002:adf:cf0f:0:b0:343:7fa6:4393 with SMTP id
 o15-20020adfcf0f000000b003437fa64393mr6935742wrj.38.1712596568173; Mon, 08
 Apr 2024 10:16:08 -0700 (PDT)
MIME-Version: 1.0
From: broler Liew <brolerliew@gmail.com>
Date: Tue, 9 Apr 2024 01:15:57 +0800
Message-ID: <CAODyvywHfmeFJP_obZB=dWcaibH_1RRGX=+CSVwcdfjSLMbJ4A@mail.gmail.com>
Subject: [PATCH] drm/amdgpu: remove "num_pages" local variable in
 amdgpu_gtt_mgr_new
To: alexander.deucher@amd.com
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luben Tuikov <luben.tuikov@amd.com>, 
 brolerliew <brolerliew@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

amdgpu_gtt_mgr_new and ttm_range_man_alloc share similar logic, but
"num_pages" in amdgpu_gtt_mgr_new is defined as local variable which
is calculate directly in ttm_range_man_alloc.

Signed-off-by: brolerliew <brolerliew@gmail.com>
---
drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 3 +--
1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..0c56e4057d85 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct
ttm_resource_manager *man,
                             struct ttm_resource **res)
{
       struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-       uint32_t num_pages = PFN_UP(tbo->base.size);
       struct ttm_range_mgr_node *node;
       int r;

@@ -134,7 +133,7 @@ static int amdgpu_gtt_mgr_new(struct
ttm_resource_manager *man,
       if (place->lpfn) {
               spin_lock(&mgr->lock);
               r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
-                                               num_pages, tbo->page_alignment,
+
PFN_UP(node->base.size), tbo->page_alignment,
                                               0, place->fpfn, place->lpfn,
                                               DRM_MM_INSERT_BEST);
               spin_unlock(&mgr->lock);
--
2.40.1
