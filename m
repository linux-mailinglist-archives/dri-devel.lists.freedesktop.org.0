Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445A6002B5
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 20:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615B110E659;
	Sun, 16 Oct 2022 18:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79FB10E659;
 Sun, 16 Oct 2022 18:09:52 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j7so15171887wrr.3;
 Sun, 16 Oct 2022 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EI+p8PoHxDYC4LpvdrLHwtfP0NQYizXCNc6bGLJV3BM=;
 b=NnVxmZIwq0HoVdrIgrUbyS3p5zXE9BJbo8ZujVGSl8FDW8639FUEKRhADnwIlkJwUX
 Oc3+DKXK/svsnSR6l7GdTr7r7EwS6XvYmWNsLVwOCCOr+gx8PZhjjVY0cB5M0fDaOghA
 EI+nVpYZnvjctxeG7SNe3OJAL/JZ6fhHx3Y765y3s1qKGB9ccx2uCNS3Gn+wLkUhIkeS
 LigflbUgzTi3TwuMG7iMxTWODP0Fv8rZThmFyq3/kuY5LV1b6zo7yXUwvlaJp7oYt7ar
 X21qEp4n8U2s1t7lkTYLeRRQnklGmm58Lq2/S4tyA710drxhV/SwGb8h9/pqGf6E7q73
 Dm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EI+p8PoHxDYC4LpvdrLHwtfP0NQYizXCNc6bGLJV3BM=;
 b=6tyeg7Ac3cfrRbRuHmjbG2rJtMM0RWxp2iTlpcxa2+nDMzVBPZI0XhVj9qMrAQOpBn
 hf/UK9pE6fYxRP85wV2UUAlEKuv+ZPCrB9shbD1NyaneU/rHxsnwwD2ZCvTfire1n8vj
 Q71pmzrIolRmMQ02z5S3SfioS2bS8c1KufvvJ3gTJJwAeG05N85YnTKbk6JU58xZnPUO
 qKiyAZrN/1fZTCiw8hKAVGtY6+bA0As1eNZdhg9tW98wdfQ19fkPpXTKwbVPGBAweZuL
 TBER7bHFVx5uKBGVCzAGNTbH1DUInS3qN3WTBaK4ZuTe40TVarb2fcGh682LmxM4NiK3
 RzQw==
X-Gm-Message-State: ACrzQf2v3Sl2vd/cexaA5k4ShQbdQnumueVDTm3b1j2KAKA9Gx3owKmc
 TRtW2qC3cGa7OSj5MmeSvPc=
X-Google-Smtp-Source: AMsMyM4TFFYwfNI0jMueu6o2fvMAP77lkBkuySciaa99usWeed6HF2eiiDFXIWDZcKzwv6BDLn54xw==
X-Received: by 2002:a05:6000:178c:b0:231:ce45:7e00 with SMTP id
 e12-20020a056000178c00b00231ce457e00mr4224821wrg.598.1665943790733; 
 Sun, 16 Oct 2022 11:09:50 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-250-231-122.retail.telecomitalia.it. [95.250.231.122])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003c6f8d30e40sm156225wmn.31.2022.10.16.11.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 11:09:50 -0700 (PDT)
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
Subject: [RESEND PATCH 2/3] drm/i915/gt: Replace kmap() with kmap_local_page()
Date: Sun, 16 Oct 2022 20:09:37 +0200
Message-Id: <20221016180938.17403-3-fmdefrancesco@gmail.com>
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

Since its use in i915/gt is safe everywhere, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in i915/gt. Instead of
open-coding local mappings + memcpy() + local unmappings, use
the memcpy_{from,to}_page() helpers where these are better suited.

Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c |  4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c        | 11 ++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 6ebda3d65086..21d8ce40b897 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -747,7 +747,7 @@ static void swizzle_page(struct page *page)
 	char *vaddr;
 	int i;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	for (i = 0; i < PAGE_SIZE; i += 128) {
 		memcpy(temp, &vaddr[i], 64);
@@ -755,7 +755,7 @@ static void swizzle_page(struct page *page)
 		memcpy(&vaddr[i + 64], temp, 64);
 	}
 
-	kunmap(page);
+	kunmap_local(vaddr);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 402f085f3a02..48edbb8a33e5 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -98,22 +98,19 @@ static int __shmem_rw(struct file *file, loff_t off,
 		unsigned int this =
 			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
 		struct page *page;
-		void *vaddr;
 
 		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
 						   GFP_KERNEL);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		vaddr = kmap(page);
 		if (write) {
-			memcpy(vaddr + offset_in_page(off), ptr, this);
+			memcpy_to_page(page, offset_in_page(off), ptr, this);
 			set_page_dirty(page);
 		} else {
-			memcpy(ptr, vaddr + offset_in_page(off), this);
+			memcpy_from_page(ptr, page, offset_in_page(off), this);
 		}
 		mark_page_accessed(page);
-		kunmap(page);
 		put_page(page);
 
 		len -= this;
@@ -140,11 +137,11 @@ int shmem_read_to_iosys_map(struct file *file, loff_t off,
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		vaddr = kmap(page);
+		vaddr = kmap_local_page(page);
 		iosys_map_memcpy_to(map, map_off, vaddr + offset_in_page(off),
 				    this);
 		mark_page_accessed(page);
-		kunmap(page);
+		kunmap_local(vaddr);
 		put_page(page);
 
 		len -= this;
-- 
2.37.1

