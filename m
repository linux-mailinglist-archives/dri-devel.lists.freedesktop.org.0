Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C878A2AA4C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B528110E842;
	Thu,  6 Feb 2025 13:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ftSzLe0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49E710E842;
 Thu,  6 Feb 2025 13:47:14 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21634338cfdso21295005ad.2; 
 Thu, 06 Feb 2025 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738849634; x=1739454434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k+sjsR0TGjlYkPY95WD+GDrP0sLrBBkK9ZreKrBKyuM=;
 b=ftSzLe0mKkByMxh6tjAItU8zu0plfhy6KdO3geX3oNTaRSsDU3v0YD8a2pM+4YFzws
 Ri0SDxl5Mo5382hmpzIqTEzsLBLbsVJYtLp8uSSYysogCHVwgIsiht/PvFGoKGleDma6
 gQ5on0jlNgauJPvRWlrokMI5mnlO3EEp+fYi5Igx8RhydhcV7MrRVVJGuBK/3VNsXC8w
 YOcmTD5w9iIAigsPm91lVSuP4SobSU/Nr0dT6cyVqhB3djyVVhlciTvesJddUHR84Gck
 O8hNoD/Oq2O7PwwYV4GWPQ5xfTfGXCj4pzwsypo3/hs5Ooaqflrv24HPk46RO4DDgqym
 RpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738849634; x=1739454434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k+sjsR0TGjlYkPY95WD+GDrP0sLrBBkK9ZreKrBKyuM=;
 b=WMfSOM6sAKqwnsy8c+FpPYZYAzzZtGiLVXGXOSQ8oG1pLfweohUC++iyho5dhaMXcV
 ap9gJ4Y9Fh6GqMe74mz5j2LqXoD0ULixhtIP4tlqKT/nxbhZfcPdTFDbU4piVO25kN1r
 7wzxgNE1fbdJOAQuxYpocPa2gv5A9lHWDqmldHPgmNrwHCvpKQGqArxHWzvgglFIUKJO
 H94SRlJun4kirVGi3xjvMZKkCEaHeClSfGbEmt03Z/72DxIH1W9LZpdsEkJ1yAgsHsSg
 YGxUV4Np/WeucqbdO3hXz/Z/TMh14Bbmt9Fzs2N+f1n6VXKcV2wxauUfTucb8ZAH4tm4
 1oaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU90WiLqj5mEhn3exWwjRNkmp1nwvdj080jeKPRk+E2FwYzwuTg2AsjXdtZfXJ9AStj9iJHwZTWqow=@lists.freedesktop.org,
 AJvYcCVRS+q736hZhvhF7XaCzIVESA9fdZlkvP8Hi7WLGBB++AxjEQ2BcNU1aM6sd0oiP5BXiKhV3szeVg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3mt2TojtxBgZmryXG7dQgimMA+0CYOvKDmpUAxjdj+QOg2Jat
 5mer3sT3R/WX6czbCKHzZqSGyn8BrJsA+c/XwR2mzuoyfHI+VePTt3agqA==
X-Gm-Gg: ASbGnctAfyzhlCeYoZMTsEsTilSjsKpyLlHZrUFb4+l9NzD8ICTNfR7R+aYSahHSgqc
 a6HISK4XgazFwi1dCJMxypDvZmkjQK+ckezp3SYxAQj8YW31QvW6cVuj2Lw17VFjD1V+WdCLqq5
 6wiPhYGp9gAAp6AqkkpZT1FxC8mE+ZjJr3qEqkcH2zlX/JXrqnsJHUpaBw0NIVmKNl9fOLAeNhe
 KAqC9C5ocVFzuJxaBACKBanN6b7Z3sPnxQp20hOfnbGeT5uBUq3Yrq7SGQzgGs0tAtvJ3livP70
 cQQUmvHn4w36SozkWgI=
X-Google-Smtp-Source: AGHT+IHIWj5TBEZvrKQkfJtcsPBegkXHSYFiyuIxgjCbRiWoQPQaoe5UdHXHXpr3HmYIuRs7vMhqvA==
X-Received: by 2002:a05:6a21:99a9:b0:1dc:2a02:913b with SMTP id
 adf61e73a8af0-1ede883b817mr12845474637.15.1738849634084; 
 Thu, 06 Feb 2025 05:47:14 -0800 (PST)
Received: from HOME-PC ([223.185.135.17]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ad51af77c63sm1144158a12.65.2025.02.06.05.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 05:47:13 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH] drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo
Date: Thu,  6 Feb 2025 19:17:06 +0530
Message-Id: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
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

xe_vm_bind_kernel_bo() declares the variable fence without initializing
it. If an error occurs before fence is assigned a valid value, the
function may return an uninitialized pointer.

Specifically, this can happen if:

- vm_bind_ioctl_ops_create() fails, leading to release_vm_lock error
  path

Initialize fence to NULL at declaration.

Fixes: dcdd6b84d9ac ("drm/xe/pxp: Allocate PXP execution resources")
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d664f2e418b2..b6ca53ede904 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3184,7 +3184,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 {
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
-	struct dma_fence *fence;
+	struct dma_fence *fence = NULL;
 	int err;
 
 	xe_bo_get(bo);
-- 
2.34.1

