Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CCB590C68
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305FDA9012;
	Fri, 12 Aug 2022 07:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8CB4352;
 Thu, 11 Aug 2022 15:30:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l22so21752788wrz.7;
 Thu, 11 Aug 2022 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=lsxU9RpxEtZA+Mk40O6yVmrf9Fu1AMs9ElIAZHptX+c=;
 b=p8TKVMzq5DwZ3OnqS3RJd818yoMLzy+vFjFcKzlWiosox7p8z1M/5PW/gBrz2e7ZOq
 RcCm2WazhJYvmqLcaMpSIbJowOeXPTikATddJwIFDDcXMr8NuVwx2A/6WmqWRNmnnSPW
 kxyxTRS7cc3d9M84ZexCGh/qOj90dgR3qwfhD8P+cNePNgofGMJMpOeMNCzRj9fwiUjR
 gxwLTFlId5B58kby9P2uQkwS5i9TlF/0qS/Y07//QrDxQYLLlxxo8q2Bi2H14qK4iLZX
 RABxL/E2v0VJN6Xq/qw/FBepYmww8/tuh6n+VQg0D9qaCoReL5dJ8aBFnN8BWFtXqIYK
 4nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=lsxU9RpxEtZA+Mk40O6yVmrf9Fu1AMs9ElIAZHptX+c=;
 b=EI28wRVVT3aI5U0hUVb47qe9yW9db3awYEJBVq4BoiH/4VxWr9cbzQuydbBf5Rucbj
 z9BzlXAp1Oj6uSB0YB5I4SIg+HcgxUZGji0P28idCvII2fA5ElOE8L1tiZiCPPO80+Vp
 MkdLVPA8oyWAmZnbmYktHyWPRMpYIJnU0wVyueNzt16MLwlazW9z8uLR7UGzkiEw5V18
 Xb/yAstoRepj11D4QrBnfGOv2mytaJZgS3XAx5uNHTg2rf9DCGLLJpSEY61zNxXiqaFq
 nOIVUOXeuXHY25k8BoGV3+vs2+efvLMq9AmAWCa/NWL2B4LhmUkjpPBGOMyWpfZ4NSDJ
 9FiA==
X-Gm-Message-State: ACgBeo23S5O3uwX2uk9ToFQ5vmXPqCM1odxUoXSP7+jnGhT6RrxQfxlZ
 VeFEZQI4+vOnsMKZXLNi7+A=
X-Google-Smtp-Source: AA6agR6B9bizQz9J53uYxM4sZolnfx+nbRLl41mveZTi8oUUOyyvs7b1h0H6QspWO+C/SmNj2BgX/A==
X-Received: by 2002:adf:ea0a:0:b0:220:6222:ee48 with SMTP id
 q10-20020adfea0a000000b002206222ee48mr19221413wrm.243.1660231850215; 
 Thu, 11 Aug 2022 08:30:50 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-27-108-198.retail.telecomitalia.it. [79.27.108.198])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b00222ed7ea203sm9805502wrx.100.2022.08.11.08.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:30:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/i915: Replace kmap() with kmap_local_page()
Date: Thu, 11 Aug 2022 17:30:39 +0200
Message-Id: <20220811153041.12795-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811153041.12795-1-fmdefrancesco@gmail.com>
References: <20220811153041.12795-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

