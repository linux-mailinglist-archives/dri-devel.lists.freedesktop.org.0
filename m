Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FAB59151F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 19:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913D9378F;
	Fri, 12 Aug 2022 17:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76F292D9E;
 Fri, 12 Aug 2022 17:58:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z17so1963380wrq.4;
 Fri, 12 Aug 2022 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=w8rPxxUwax5JSBYc+MunKfzJoBwcTejD8FTqXrjwB9Q=;
 b=ZwbNXCMdTWEOw1KTNDeKg360UJPG1HCsisp9+uIXW+AigUK7JmFTPhWn7FWmgINCpT
 rY7PLkCGfIgguc5MJ32GWWbMwoRGbrciy52PmMX1/5lfI+D30PYnOCwwVfBKBtPaUO/j
 jYYLJn+GgsmN4Sun3E86Ttf/CyJOHKdJX0obiuUQjFrYu9dJaoyFzwwcqIuPBGKsMxPe
 M72hExseMtt+PHjI93iQSBcrxtHFZL/mjeY81Pz5VAWFt9PzKIBklpHqsfs4HOpWlXKp
 1568kstFdwaTNQgqRboZuJDIWBp5MvvF5h0Q7MacN0YSXLEmyowtVOQpKpMF/mqMtWQ3
 dQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=w8rPxxUwax5JSBYc+MunKfzJoBwcTejD8FTqXrjwB9Q=;
 b=i1nV8roZHTm2Vb4QZSHrX4NLoF+q36nPriXEf0YEUgYzPl5o3LsZXVqyrlMwojGcnp
 t/gCZeXf9YrJFUwcj4xv92xkbCFnR00KGa0LoOjVvsOkSfojqwvGJuPpJta73MjRoxt1
 QcLBS7DuFjUwuFW4ck/adj/HUb506Rka32fqQdco3bZUODnAZQ32SAgKjxrtcpy9J8VZ
 pX70hG/DdvT/9iF/K25nwB0iJPjNDjQTjWUWOh6N/WCgUYiOaFvsGRFceqUXCmDfByLE
 sExJgMx+tCU5GYWS6auGWvPRuv7eT3qAdnoia+NgD9GM7dCDpqUQjdqcPm6Bw7eF+WT9
 ANnQ==
X-Gm-Message-State: ACgBeo2n9JSpeitAogPdNqNKCCSxur1h7K3fQpt0hMYB1P34ttP9zPp0
 Eajeu+mZ3porTW+hFphftyk=
X-Google-Smtp-Source: AA6agR5BpjeASKsLrsRErii9wRhEEOlS5DHluRVxLpyj5mSQJt2UYcFvMbrTkLZMSIXhaY7aQVzWcA==
X-Received: by 2002:a5d:5848:0:b0:222:c8cd:288 with SMTP id
 i8-20020a5d5848000000b00222c8cd0288mr2788260wrf.34.1660327081009; 
 Fri, 12 Aug 2022 10:58:01 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-53-105-123.retail.telecomitalia.it. [79.53.105.123])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b002206236ab3dsm129831wrr.3.2022.08.12.10.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 10:57:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Zack Rusin <zackr@vmware.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/amd/amdgpu: Replace kmap() with kmap_local_page()
Date: Fri, 12 Aug 2022 19:57:53 +0200
Message-Id: <20220812175753.22926-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Ira Weiny <ira.weiny@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmap() is being deprecated in favor of kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead as
mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when the
kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
the tasks can be preempted and, when they are scheduled to run again, the
kernel virtual addresses are restored and are still valid.

Since its use in amdgpu/amdgpu_ttm.c is safe, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in amdgpu/amdgpu_ttm.c.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3b4c19412625..c11657b5915f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2301,9 +2301,9 @@ static ssize_t amdgpu_iomem_read(struct file *f, char __user *buf,
 		if (p->mapping != adev->mman.bdev.dev_mapping)
 			return -EPERM;
 
-		ptr = kmap(p);
+		ptr = kmap_local_page(p);
 		r = copy_to_user(buf, ptr + off, bytes);
-		kunmap(p);
+		kunmap_local(ptr);
 		if (r)
 			return -EFAULT;
 
@@ -2352,9 +2352,9 @@ static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
 		if (p->mapping != adev->mman.bdev.dev_mapping)
 			return -EPERM;
 
-		ptr = kmap(p);
+		ptr = kmap_local_page(p);
 		r = copy_from_user(ptr + off, buf, bytes);
-		kunmap(p);
+		kunmap_local(ptr);
 		if (r)
 			return -EFAULT;
 
-- 
2.37.1

