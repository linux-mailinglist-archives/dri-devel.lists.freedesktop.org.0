Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF776002B3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 20:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6000810E6EE;
	Sun, 16 Oct 2022 18:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5F10E0D0;
 Sun, 16 Oct 2022 18:09:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so10788376wmr.2; 
 Sun, 16 Oct 2022 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sy/r1oKj6pjC6tDTxJAus+AvI8wYjcvPrvVlllaZosE=;
 b=jhVs03HebeLgK4gCknqUY7zv32A2/tNizCdKRVC+Q6gLrPJmkHF6T9sARRl7aB23ra
 O2u9fU1whvzvVevdGJpVJTYAtNQOcDGdC3z5DY/K6CYxWWPXGKscf/pjyAAJkRE7b/vv
 GsTtSKxCBPcDfFc+elHGDSGL9vf/LS+MOqJLie2gptXM9g45FnH2PrErpKYdC5tSasI4
 9QHfevd/9k42Lm8ENnU+sq+wnFs7TlF6Zvp9XjHlRURgVDJDgvGCh9sfStyA/9m8rAI/
 RjO5gmt8MoTRO4c1I5o24kM88Wd8OAyo5WFs8qt4WIVVS4VQyq8Sgn89xzmgJunZgrqd
 sUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sy/r1oKj6pjC6tDTxJAus+AvI8wYjcvPrvVlllaZosE=;
 b=fcTLcU8+pstxgw7GcWxv0wEHhNkcT0BspkTmxG9GN8ViOjxb441aWz8OXvX+YSlUxR
 zt+M9mpLflDT+ncMlmjONqFmXyu9x6I1+rKVNoQ92EJGgDr6wrgtqGdZnEFOcecFdWP1
 fv8xToNYb7y9wrxEETYjjiq1gXtMxvPYHF2YWxslSa/TmIGIEG/GGGCUD5zIFhymt5Bk
 ls7W+vbI3g4lMsoLOj1j6uDEMmFxiebwfu9Z8R5uHIDXZvB+pDmrZWNWZ62WwWPT92Mx
 AMEbzuidhujQkU9jqGmBrjAE4K1+tLUSUCsuZMmi8VFLtZiDJeDLb/B6lYmge6TVLI/f
 s3bw==
X-Gm-Message-State: ACrzQf0Chh5c2afciWMKaFY2nxQeGvgSXBeRNFBh+7T6tP3i25GJWIgd
 sfXSILtgP9IR2srGeRNjLDc=
X-Google-Smtp-Source: AMsMyM429gVcrmq2vVmbF0aisu9csZqLaMboh6B4truVw62DWDKu+Ln262TAG0cL+qGqSPwRs+/Zcg==
X-Received: by 2002:a05:600c:5490:b0:3c6:d8f2:6e1a with SMTP id
 iv16-20020a05600c549000b003c6d8f26e1amr4989604wmb.90.1665943788240; 
 Sun, 16 Oct 2022 11:09:48 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-250-231-122.retail.telecomitalia.it. [95.250.231.122])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003c6f8d30e40sm156225wmn.31.2022.10.16.11.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 11:09:47 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org
Subject: [RESEND PATCH 1/3] drm/i915: Replace kmap() with kmap_local_page()
Date: Sun, 16 Oct 2022 20:09:36 +0200
Message-Id: <20221016180938.17403-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016180938.17403-1-fmdefrancesco@gmail.com>
References: <20221016180938.17403-1-fmdefrancesco@gmail.com>
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
Cc: Ira Weiny <ira.weiny@intel.com>, "Venkataramanan,
 Anirudh" <anirudh.venkataramanan@intel.com>,
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

Since its use in i915_gem.c is safe everywhere, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in i915_gem.c

Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 702e5b89be22..43effce60e1b 100644
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
@@ -634,7 +634,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	char *vaddr;
 	int ret;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	if (needs_clflush_before)
 		drm_clflush_virt_range(vaddr + offset, len);
@@ -643,7 +643,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	if (!ret && needs_clflush_after)
 		drm_clflush_virt_range(vaddr + offset, len);
 
-	kunmap(page);
+	kunmap_local(vaddr);
 
 	return ret ? -EFAULT : 0;
 }
-- 
2.37.1

