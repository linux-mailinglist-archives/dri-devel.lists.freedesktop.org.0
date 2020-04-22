Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6BC1B3836
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059366E9AE;
	Wed, 22 Apr 2020 06:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53C189AEB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 00:21:48 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s63so753361qke.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEPIJxk11M+bwls0ktX3yeu2tCbVhvYKkshsYLxwJ44=;
 b=PJU8eX+3xC4GFafdKdc5DzhySnCpoyt7nJs8v67HgDINaqKjejFlIyZkRz1SMGAhw7
 s7uCk6tfphwUwyiPpH9jqN9ymuNDMYIObXz70LxBi9HaysQdWxohkFGXN0RvWIlTxp/O
 tk8seckt54OXGh2bDVptRn4OT4fWVGdecI9gba+EmxFSinr4oBL1z6hGl1wB3yCT077w
 vbR/HQjg0rmYIXBXC6owWBUrSADfN+E7jMfKwzS6l5twx5JuWUw+KuKPdYjUryqiun37
 eUhKmuvUjIJxADNxWm6SAsdm2PXKSRXA+mhtSiWZ4LdaaJW+8+0i0QIXND3fe1+0a2J9
 rdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEPIJxk11M+bwls0ktX3yeu2tCbVhvYKkshsYLxwJ44=;
 b=E2zYQCeEuFn/5xdKEsLk2F9W7xUWR1thttKzfYgxfSEoy/Z/00Vi0bmZDTL2AbeFcW
 2/XjZlgHI0jEDMEfsX7/IYuRhwXfN+r8V1PK/ulBskTCsz8rJJwHUSIZNPyJdP0e9XTx
 AiyQl1H1SUJSk5hVNf4WHvrblMihsv8uTV9mPO7USnjvdBxXkn+ZOepeLSXd35ox37A6
 k4ZsssDNh3+mLTO7WAjQokHWIQ7NhV1tiuCbkBactUm7Uc7ssxUOPxAc+fYHBa2P/Wdf
 i1Qfm69wwpNg6HsiLqAuqm+Z3MnRrEv8fzi6QNnpohdCj8gCnfshoq6QqabzxHdM2ApI
 Pl5g==
X-Gm-Message-State: AGi0Pub/QFmYgZOcwmWBy+zV1wqdjtYsG6DzkKGmZls7Zjt8tVpHVZ2N
 ut9tQHw8abvnr8Da1Gz/SlfPXg==
X-Google-Smtp-Source: APiQypKNqeVCSfFJPwxNHCrvjHy0VYH6Avw8SVeDX8eOa+urgHv9P1i8eAZ64MakyRhzM6BfopRBjw==
X-Received: by 2002:a37:8781:: with SMTP id
 j123mr24068830qkd.308.1587514908014; 
 Tue, 21 Apr 2020 17:21:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u27sm2859237qtc.73.2020.04.21.17.21.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 17:21:47 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jR398-0000BE-Gp; Tue, 21 Apr 2020 21:21:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org,
	Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH hmm 3/5] drm/amdgpu: remove dead code after hmm_range_fault()
Date: Tue, 21 Apr 2020 21:21:44 -0300
Message-Id: <3-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
In-Reply-To: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
References: 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: amd-gfx@lists.freedesktop.org, John Hubbard <jhubbard@nvidia.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

Since amdgpu does not use the snapshot mode of hmm_range_fault() a
successful return already proves that all entries in the pfns are
HMM_PFN_VALID, there is no need to check the return result of
hmm_device_entry_to_page().

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index efc1329a019127..bff8e64701a547 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -862,17 +862,13 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 		goto out_free_pfns;
 	}
 
-	for (i = 0; i < ttm->num_pages; i++) {
-		/* FIXME: The pages cannot be touched outside the notifier_lock */
+	/*
+	 * Due to default_flags, all pages are HMM_PFN_VALID or
+	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
+	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
+	 */
+	for (i = 0; i < ttm->num_pages; i++)
 		pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
-		if (unlikely(!pages[i])) {
-			pr_err("Page fault failed for pfn[%lu] = 0x%llx\n",
-			       i, range->pfns[i]);
-			r = -ENOMEM;
-
-			goto out_free_pfns;
-		}
-	}
 
 	gtt->range = range;
 	mmput(mm);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
