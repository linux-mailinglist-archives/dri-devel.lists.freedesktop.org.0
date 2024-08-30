Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593FF96697C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 21:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E536310EAEB;
	Fri, 30 Aug 2024 19:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mVzMXjnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
 [209.85.210.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF1F10EAEB
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 19:26:40 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-7143d76d29fso2395692b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 12:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725046000; x=1725650800;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FuDRdZr3lnXIzC7C2IwkgUCCNdeMT8LTC1OgvHLHr0o=;
 b=mVzMXjnbskeSMHHaDt9LVBGa4Y8bstrTOv7Jp8DcnBjHqK4Z+rikvaRwH990oY3MtI
 4LzhF5AYGoF4sjcmRHEYMPjB5iFufE7XLJPvbPcXT5JI1PTxhTbfHeRBLX7j59xNExKE
 07E4W/A5NQnfwMH+7Z43j7evfmv3sF5ptxvA3mTmp4pkBnl99hPFffs2t4rt/c5eZc8P
 67f+8bQIsGuipS+4bvEy8q4f0XNTOEWaySWPVd3GslKU1xNS6QkupTU8szf2ZhaAtrRn
 M2k9hi742twn/K8BaDf2EE5JCUKMtN1nOVCPrj7CSAOA7wipVl53svxZwT2A8SVMhgtD
 6/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725046000; x=1725650800;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FuDRdZr3lnXIzC7C2IwkgUCCNdeMT8LTC1OgvHLHr0o=;
 b=BzLHX33SNvRXDk0fw3gKcYm2wLl+sEgfY+SVIbBZFK0tothudvz0YfMvRPTOSNJDQN
 FXSvIK3fqRSKzkz5YY+GEPRpq7il/5wurXbg4/WtsQbL10D9Ka0WnuS/SF56fZSvlaJy
 v7guR7t9ScpRkzS5RFnwxuXe5HM+QN2RTwWcTqntPd/nIx31wjBVwiPAuqp66BEq3aTo
 ibFvesE7AiSWtvZHt7kJvNth4HYvEDsgZY1LFfYzE+Lb4XI1379s4cPV3pmorvr8uxq4
 NzlkorE9m8tcOiwu3nbNsJ0oqQY5rxCA7F35eTeMP+9oqmUHmsZB7AC3An6sFwL4rdek
 d22A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJhwU+99aIqunqqv1x489Qnvsa68ue/vmCytj3wVdCrSIIRfGbVfEnorth4e+0V6cOl555XkjKB04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMG6uUe0/l7TUCb7bnVi4B51STEYIxOOUbva2HvlQr/jEKYpz1
 1jmL4Fmw4Io6WKiMMDORyWZ8w8JyjqQma0SUH20ei0bjI57Lsl90H5hU6wJEjJ/9WCWP4BeAWYf
 7lFySWCifKPOkwA==
X-Google-Smtp-Source: AGHT+IEYDT5yTYPujoEQ0Ej+aCUk5iv9pvxNQHghRZEWhY4u/r1jH/tjVnZ/WpOzBL4HVQ0C2o97rg0PjRinvWA=
X-Received: from tj-virt.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a05:6a00:8585:b0:714:1436:1cef with SMTP
 id d2e1a72fcca58-717307cbc9bmr7143b3a.6.1725045999943; Fri, 30 Aug 2024
 12:26:39 -0700 (PDT)
Date: Fri, 30 Aug 2024 19:26:26 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830192627.2546033-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: heaps: Fix off-by-one in CMA heap fault handler
From: "T.J. Mercier" <tjmercier@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: android-mm@google.com, Xingyu Jin <xingyuj@google.com>,
 stable@vger.kernel.org, 
 John Stultz <john.stultz@linaro.org>, Brian Starkey <brian.starkey@arm.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

Until VM_DONTEXPAND was added in commit 1c1914d6e8c6 ("dma-buf: heaps:
Don't track CMA dma-buf pages under RssFile") it was possible to obtain
a mapping larger than the buffer size via mremap and bypass the overflow
check in dma_buf_mmap_internal. When using such a mapping to attempt to
fault past the end of the buffer, the CMA heap fault handler also checks
the fault offset against the buffer size, but gets the boundary wrong by
1. Fix the boundary check so that we don't read off the end of the pages
array and insert an arbitrary page in the mapping.

Reported-by: Xingyu Jin <xingyuj@google.com>
Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Cc: stable@vger.kernel.org # Applicable >= 5.10. Needs adjustments only for 5.10.
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index c384004b918e..93be88b805fe 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct cma_heap_buffer *buffer = vma->vm_private_data;
 
-	if (vmf->pgoff > buffer->pagecount)
+	if (vmf->pgoff >= buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
 	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
-- 
2.46.0.469.g59c65b2a67-goog

