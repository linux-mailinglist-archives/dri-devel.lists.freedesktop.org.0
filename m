Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985D995783
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 21:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DFB10E240;
	Tue,  8 Oct 2024 19:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k0MLtWsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ACA10E240;
 Tue,  8 Oct 2024 19:16:36 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71dfc1124cdso105046b3a.1; 
 Tue, 08 Oct 2024 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728414996; x=1729019796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7qu86Ysicdsx9sM/yuAIgyD1+rSLH54SdSYbKdh/+U=;
 b=k0MLtWsKmyZDeWPLhuRgxd9aFshcQexZFKdePQ9NTQV27XLSveMzO+77kCO9KoY1f/
 hBXMQPSiBJv1BsWXBKQx3KLHndWJQ/MMLN2MdUtmR+Q79Sm4EkiipDFD31609tljVcD6
 Pzc+FGIPOQahz0IY3U5yxXvkn9o7Hd5tM84JaLYU+puivhp0i9jEAofA37/yd3Zq061O
 l2sLz7HHdKuPjE5ISDAiq8Cby5egrbXE5OX2a+igalPeIkb2i3MkPPUzp6j/gbkYMqqO
 DVqXWSGjlb9RjU02v1qf6HMResaEPwJgvOPvdltprls607VY9veSDw6YaYrd9ECV7xdu
 gDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728414996; x=1729019796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z7qu86Ysicdsx9sM/yuAIgyD1+rSLH54SdSYbKdh/+U=;
 b=K/fysrh0pIPWyLFnC7Zbqxg/waz756RnbPU6O6nGilFgU62KlXbgD+Zlh+bq01zM2b
 wdnh5WlM+pO5OUvrrwxFi56YCif3GeZiKoKl473xUKUZDgjj2SXB6/8Ql1oTBcWEBfHD
 p5+mtjZ2RmwM8s0faTErfooUqOAUEoxmKdpMo0iQfUuCVm4+TjHxR9i0iK3TzpMS3mnc
 ZYFc24Vk0CheMLhd6Up5tEid7225P+M9Us5XNPnbyypcWeD9CYTisvkT4dIRNIDtjyn0
 Og0gJ+DhECGwaP114MMMvEplRljcXazAzBISa1j9WjM8NEQDz3kCqUZv8xqYEwtLECBr
 jV1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJBN+HyA4sGkAXh3rUt/n7qlQq2aD/R34VSm45IeNPrHp53Dy1lKiCMdHvdxk8dwEx8xYdNjmOQQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ22lOhVcnu6Ba6PbuEPac60mOcjBXrlR9QauVTMtsf/f6KT3o
 0wTfLAZXec+iAUTF9ddlOF/qdVqfCROxkArGZS3lF8pLxYnusAae
X-Google-Smtp-Source: AGHT+IG11rsBrtdL3pEggLyoVCWr0nW6/pa+HBU7JaoO06ddPz9+dy2vVAYCq5o1iTlk25NJF+qmtw==
X-Received: by 2002:a05:6a00:c94:b0:71d:fbc9:e5b2 with SMTP id
 d2e1a72fcca58-71e1d6d2014mr169431b3a.14.1728414995947; 
 Tue, 08 Oct 2024 12:16:35 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:c7a7:6c1f:8104:8963])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71dfea52097sm4650939b3a.103.2024.10.08.12.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 12:16:35 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com, Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: [PATCH-next v3] drm/amdgpu: Cleanup shift coding style
Date: Wed,  9 Oct 2024 00:46:23 +0530
Message-Id: <20241008191623.8171-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improves the coding style by updating bit-shift
operations in the amdgpu_jpeg.c driver file.
It ensures consistency and avoids potential issues
by explicitly using 1U and 1ULL for unsigned
and unsigned long long shifts in all relevant instances.


Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
v1->v2: address review comments
https://lore.kernel.org/lkml/CAJ7bepJrm9tJJMSZXz0B_94y8817X4oFpwnrTmUHeagOFgVL7g@mail.gmail.com/
v2->v3: update changelog and add additional 1U cleanups
https://lore.kernel.org/lkml/CADnq5_OgZvTgUDvDqDikoUh28jTRm2mOAVV6zAEtWE9RHTFkyA@mail.gmail.com/

 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 95e2796919fc..995bc28b4fe6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -47,7 +47,7 @@ int amdgpu_jpeg_sw_init(struct amdgpu_device *adev)
 		adev->jpeg.indirect_sram = true;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; i++) {
-		if (adev->jpeg.harvest_config & (1 << i))
+		if (adev->jpeg.harvest_config & (1U << i))
 			continue;
 
 		if (adev->jpeg.indirect_sram) {
@@ -73,7 +73,7 @@ int amdgpu_jpeg_sw_fini(struct amdgpu_device *adev)
 	int i, j;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
+		if (adev->jpeg.harvest_config & (1U << i))
 			continue;
 
 		amdgpu_bo_free_kernel(
@@ -110,7 +110,7 @@ static void amdgpu_jpeg_idle_work_handler(struct work_struct *work)
 	unsigned int i, j;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
+		if (adev->jpeg.harvest_config & (1U << i))
 			continue;
 
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j)
@@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
+	mask = (1ULL << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
@@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			ring = &adev->jpeg.inst[i].ring_dec[j];
 			if (ring->sched.ready)
-				mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
+				mask |= 1ULL << ((i * adev->jpeg.num_jpeg_rings) + j);
 		}
 	}
 	*val = mask;
-- 
2.34.1

