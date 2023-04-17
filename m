Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38B96E455E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A62F10E3F9;
	Mon, 17 Apr 2023 10:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820FF10E3F9;
 Mon, 17 Apr 2023 10:39:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso827551f8f.3; 
 Mon, 17 Apr 2023 03:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681727942; x=1684319942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkh5X1oOnHmMtPThd/Ogb+Ei0/Iy+LdjudYL5nRHiA8=;
 b=XO/vfE0ttxJFtb+z+zDWyoXcM09x8Zs78N3GfyVo9gwDIuuHa3a1Gya8goc4sNmMJV
 vJR78/+//6TCZvI30CK/mDXRtQDDAPsnAizkwB7SubAmmPETo39N1bcxXg1o3cKdtQmJ
 iCoD6j4lKCLRHYwJI1MFIYJlEvuRAjgVkoOTZ/uX15pf4L+VkS92fyBzWSrLwGYY50At
 OR7OTpSJgtuz6ZDgg4F9K6kpnJv0D1ptjteBC4ZP3XgKXT3gyKF4/aYye3QW/JCfu8DK
 jN3oOf3Qkl4Z3pTExiIhOq34ri6WOzWaj3YJ2LKW9OBRVj7+1BrJHbhm4NXNHFDfBeZ8
 h7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681727942; x=1684319942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkh5X1oOnHmMtPThd/Ogb+Ei0/Iy+LdjudYL5nRHiA8=;
 b=UTzldRWNJPKX1IRSQubx2Td5gEocn6yGLuPiUG1B6yBNRQO7CFwGDc4uZ1mO61lLSb
 KN3E4YMuBQfv/KLwxpYtd1fJzvlWqAhLSMMuGyb1UQ+XevEgCS0knUyYT+hFsZoFP+MN
 elXyxj0gm7sRo2yp0h73nI6/um1iIuXZQYulgYVoAFKwJhVpnsu/zJWhIqNjEDuZ9GNg
 0sDPU5ZoSS9QvOpSkeXYq0DRaTpOAq+n2S+60uEHOe+abiKRhI1Qfk4SUALmV0xnD+Yd
 y3JIZvyqQge6p8yPkXLV3XwUEuCGSGmiBqMp1/tiDhI4bRlDa3yj9pxSXpw0GHl9MB2L
 tSxw==
X-Gm-Message-State: AAQBX9c++PWXppNq5unuRiOQLT0MxdiWuzJyDvPHYKN1FM0Z+8ai8bGs
 RM0ljD5ZLsXWFqGoovHBpR0=
X-Google-Smtp-Source: AKy350ZWcTYKgg1QBjpNgdR9wjl3y2FJYThqP4aJuL8PsgT/C8+4jSADpdmdsMu3nAzGfM6xeTh5vg==
X-Received: by 2002:a5d:6606:0:b0:2f8:dd25:f96e with SMTP id
 n6-20020a5d6606000000b002f8dd25f96emr4345092wru.6.1681727942023; 
 Mon, 17 Apr 2023 03:39:02 -0700 (PDT)
Received: from localhost.localdomain
 (host-87-19-108-254.retail.telecomitalia.it. [87.19.108.254])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a5d470c000000b002c70ce264bfsm10238018wrq.76.2023.04.17.03.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 03:39:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/i915: Replace kmap() with kmap_local_page()
Date: Mon, 17 Apr 2023 12:38:52 +0200
Message-Id: <20230417103854.23333-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417103854.23333-1-fmdefrancesco@gmail.com>
References: <20230417103854.23333-1-fmdefrancesco@gmail.com>
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

kmap() has been deprecated in favor of kmap_local_page().

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

Obviously, thread locality implies that the kernel voirtual addresses
are valid only in the context of the callers. kmap_local_page() use in
i915_gem.c doesn't break the above-mentioned constraint, so it should be
preferred to kmap().

Therefore, replace kmap() with kmap_local_page() in i915_gem.c

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 35950fa91406..c35248555e42 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -212,14 +212,14 @@ shmem_pread(struct page *page, int offset, int len, char __user *user_data,
 	char *vaddr;
 	int ret;

-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);

 	if (needs_clflush)
 		drm_clflush_virt_range(vaddr + offset, len);

 	ret = __copy_to_user(user_data, vaddr + offset, len);

-	kunmap(page);
+	kunmap_local(vaddr);

 	return ret ? -EFAULT : 0;
 }
@@ -643,7 +643,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	char *vaddr;
 	int ret;

-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);

 	if (needs_clflush_before)
 		drm_clflush_virt_range(vaddr + offset, len);
@@ -652,7 +652,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	if (!ret && needs_clflush_after)
 		drm_clflush_virt_range(vaddr + offset, len);

-	kunmap(page);
+	kunmap_local(vaddr);

 	return ret ? -EFAULT : 0;
 }
--
2.40.0

