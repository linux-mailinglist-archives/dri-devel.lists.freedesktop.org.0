Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C83AC6562
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B723A10E5B2;
	Wed, 28 May 2025 09:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Q0L42pDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EBC10E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:13:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so33783545e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423604; x=1749028404; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rUNx2qLvPxlyA1uIjktFx0p0uHzbMXbhqe0Zofo8lM=;
 b=Q0L42pDcTVVaUNHX8VWbLxUsiiJrFBckd6OvBP2T0G+HUb6icaOba7YhpyRsrrT7kR
 JeDF48FpH45QYjUUNvGdo6XHbaERqXkhBtyrvthnoDLbman1oe5YFMGqNNkttPtjjBLi
 Ad6z/nKAOU3C6LAFC4U45vSV6/rYbAtk7OhK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423604; x=1749028404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rUNx2qLvPxlyA1uIjktFx0p0uHzbMXbhqe0Zofo8lM=;
 b=nkvJ4VB4LJ0aOAz2beO1i54qfeKG6Wo2t6LMDCZXFj1kuTeImOZswqXLIYB+YfjxJs
 lJFSdY+otb9RVH2PPDUBwoCuMkiJjmM236Fea1izxp4ztmdAvfbn49ZpbHDcEqInG15V
 bWgcRe84G4HT40fB7lFtiAUbBhQmMHy/kSexN+PoFTTC9vSbHZJynmjYD2ekyqOkEKO+
 C56xuTxEvex5z42EPWTSkwrzVfhFPvp5EBLO7wP7fZovdvkk1R5PRq8SAlUUqWkn5UZi
 b4JULxtyx5450gFNF3UotVO7Us8dW1EIsFqWRmELQWYNgy/7mWB/KZ+vaIt/Gf+/eYXb
 1SRg==
X-Gm-Message-State: AOJu0Yyx5dLhVQax5jzAZNcgNFvaAseacGYXx/4kyI9a6M8G91qbDEJ2
 9bNRToQZOsn9OnqMTZxqlXp7tEC/Ry8wO73dhHpo8puhTGnRy6EU3EHLbFVz1PzDcH+uRic1cQP
 cAN1t
X-Gm-Gg: ASbGncvVDMnhbkAak85vqqW9x7TdzrpnR+OFNqs0InLN69Aq5WKqYox1aXHiOI+1AhI
 6uVwmkf/6v3Us5SyJjCAgRrgVQ3NJDnK33+upVTdeww7rEoP8j5ZllRgUbGritRySQR/oBa+Gzl
 BTeSw4KICKnq5fUu8Z91GejaeoRQKgY1Zt4Cum3uXWB4uHmkrqJEU0zSfashvSUOXrWEBshfglp
 JfHzTNFkEwFrmIcI6UhyDEfRExApY21Xjt8lJoECoQTVx8B567T5P9LRW7AEADrND2iWqj2osu/
 je1Cj2QmfxloXhPpD3TgdhLrnSlBwgB7NU58KtmLZmGD//ncOv3N43NP2WZfVmo=
X-Google-Smtp-Source: AGHT+IFZkApOHN9sH0BUqdg15pZy112PVQjbkz64sKp26gJaeulIgTUAHu2/9z9Dg6eHy8aNy2Dh3A==
X-Received: by 2002:a05:600c:6214:b0:43c:e467:d6ce with SMTP id
 5b1f17b1804b1-44cc05358b3mr154675735e9.4.1748423604488; 
 Wed, 28 May 2025 02:13:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:24 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 5/8] drm/amd/kfd: Add comment about possible
 drm_gem_handle_create() race
Date: Wed, 28 May 2025 11:13:03 +0200
Message-ID: <20250528091307.1894940-6-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
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

I've long ago stopped trying to fully understand all the locking in
amdkfd, so maybe this is safe for a contrived reason. It's definitely
not how this should be done. Considers this more a request for a
proper patch.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 260165bbe373..aa51930a012b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1774,6 +1774,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
 	if (ret)
 		goto err_gem_handle_create;
+	/* FIXME: Thou shall completely initialize the bo before calling
+	 * drm_gem_handle_create. Or explain why this is safe. */
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo->tbo.sg = sg;
-- 
2.49.0

