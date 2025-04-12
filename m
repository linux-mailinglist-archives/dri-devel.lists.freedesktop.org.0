Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD8A86DD2
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 16:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC9210E1B0;
	Sat, 12 Apr 2025 14:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aojnun1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04210E29D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 14:39:37 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so1520779f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744468776; x=1745073576; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nm2H6iLUjvnbWXFUPqhKNdAW5lLeAEyGiUbQz3duIYw=;
 b=aojnun1LH6pxhQHeApgWfMfYkTyDzzs5enuEom35MbN7TFOPwSf47NGxPVTwhVyqwq
 LhLdpl5tnzXPdaxcYQ43qHs+ICigiNfeYuPQmr/w41FabJ5AvrOPNHJB2Axup/NXyWVS
 s7XAq9uqxFRXyaE7QNHtKSywoIca6dp+nSs76v3h1x8qLD+nR+RXLaHZI6T+6gEn2TkB
 tJ09ldlp2qwAyWzHMheOwXvGfG8nYstjZS8wvn1rZmuzUPQvRvnPpbZwmT4qx/k4sh+2
 rcfMaeeJvclEn/CBvP/ScWQP30pINpA/0uRViyOnE0jYWHJp6tlagK5s7CYep2SLKneU
 5P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744468776; x=1745073576;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nm2H6iLUjvnbWXFUPqhKNdAW5lLeAEyGiUbQz3duIYw=;
 b=g+PTqz/h/dGntxFPUdX+x9HuPq7/jU8zxS3MqileyPydvYtdvJ2l8uuy2r35KMDmmb
 uf5prZD+1dG8V/T9cuyphJ/RkVymeXuVlBYTnlLgm2sPMPovcoJKIV7pYI/DmXwciUD1
 xBaMWGRZzePD3C2XaHVDnaFybHjMfvgwyF9WXDX2V2xbPZL17IBSYfQt/BJkL65b+l8w
 1J5MsVXiblxNqq0Tn29rxo/oWmD9TfRENPQPt8NDTbu7ttB0eTPcYYhxCkLeRXgwIGay
 0S3L6NWHWI86QjrLSXrlorRbsQqivIkAVGmWEwnBvbzojtfhM3WIfnF2IA61ucnU/9Tc
 oQ6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+NmpBtfqcuWKz0Wan+s6wfAUN0DbD6ZQPWU7kUdLujTaFIgGbtmQ9N/rnv1inuc2mTBIkU2sKUyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyVlL8Hr4Tu7TNvToweU3C+H100GHuNte0LZuLcW9I1meCU+N6
 JGywpiGC/HkEeXrwwJv/COTjmayqZ30FO/uYr+fIBDiPRKN3biL2zWoV1xY8q6o=
X-Gm-Gg: ASbGncvBhItwyxiAAz5QqedTODUeDES/7KMhsWOETst7Sy0rccPUfxkgvFPUNRuh/yV
 gRUjQ/NGyGV3P5AIjOaLM3nqjBqawbGwFU1uAzZ1vzKb16b7mFDI0VX47rsvF/PeMJ1//0cCzDY
 WJay3ZIQfQ8nmlpEqKcb3F75oKUqHDK5+lAGTB8cEm+JCyWpyzVYMU8RDN+GTP28sgGeoLq3A9z
 oz9r7zTe3Rg32RfOGI59P0+fIscSVcRBwA9sawRGVo8hmOG//GB0I8okLZXZj5O4oZlHUKY4JV6
 zF/+xidW6mqH89ND6bdu7UaIMvTnP1kX3Ynlu14rhoEJ8A==
X-Google-Smtp-Source: AGHT+IFPnZPQh+rWoYat/40mbIFtQogM3jyiLm0FL3fS2Hmqy/RSAmRPjVkSRty4HpjLKUq4NyrWdQ==
X-Received: by 2002:a5d:6d88:0:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-39eaaecab8bmr4810516f8f.49.1744468776133; 
 Sat, 12 Apr 2025 07:39:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f235a5b08sm120684135e9.33.2025.04.12.07.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 07:39:35 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:39:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <d4583e103f65e850f886babcf1b290b0855ba04c.1744468610.git.dan.carpenter@linaro.org>
References: <cover.1744468610.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744468610.git.dan.carpenter@linaro.org>
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

The goto frees "fence_drv" so this is a double free bug.  There is no
need to call amdgpu_seq64_free(adev, fence_drv->va) since the seq64
allocation failed so change the goto to goto free_fence_drv.  Also
propagate the error code from amdgpu_seq64_alloc() instead of hard coding
it to -ENOMEM.

Fixes: e7cf21fbb277 ("drm/amdgpu: Few optimization and fixes for userq fence driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: No change.

 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index a4953d668972..b012fece91e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -84,11 +84,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	/* Acquire seq64 memory */
 	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
 			       &fence_drv->cpu_addr);
-	if (r) {
-		kfree(fence_drv);
-		r = -ENOMEM;
-		goto free_seq64;
-	}
+	if (r)
+		goto free_fence_drv;
 
 	memset(fence_drv->cpu_addr, 0, sizeof(u64));
 
-- 
2.47.2

