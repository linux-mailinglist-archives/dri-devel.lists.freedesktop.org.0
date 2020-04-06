Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28D19FFE2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 23:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0D86E0E8;
	Mon,  6 Apr 2020 21:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBBB6E0E8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 21:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 2194A44330;
 Mon,  6 Apr 2020 23:04:48 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=DA9SonA7; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3PWkYw5PBWtE; Mon,  6 Apr 2020 23:04:47 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D45BB4432C;
 Mon,  6 Apr 2020 23:04:40 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C75D7360153;
 Mon,  6 Apr 2020 23:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586207080; bh=TpPLdQ9Xg4zg7yV7oqskrJHnh3QSBtbAFduG4J4rY2E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DA9SonA7mU0e7m2Mh1VCU7TjJzadAUBAbdizDTQ03zAX9xHtzLm+sUQNrzo4pbh/D
 hXXDR7/Auj4cuQsJ+NxrGJlDs6PbqdWfB0SrgPoyiDGOxD54N+lqOn0Yh35r8adjZY
 P9SDgxCoR578vPEyVAx9W22Sr2JG4aL2kivyX50k=
Subject: Re: Bad rss-counter state from drm/ttm, drm/vmwgfx: Support huge TTM
 pagefaults
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1586138158.v5u7myprlp.none.ref@localhost>
 <1586138158.v5u7myprlp.none@localhost>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <0b12b28c-5f42-b56b-ea79-6e3d1052b332@shipmail.org>
Date: Mon, 6 Apr 2020 23:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1586138158.v5u7myprlp.none@localhost>
Content-Type: multipart/mixed; boundary="------------F0ED14F7B8417927F8CA67C2"
Content-Language: en-US
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------F0ED14F7B8417927F8CA67C2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/6/20 9:51 PM, Alex Xu (Hello71) wrote:
> Using 314b658 with amdgpu, starting sway and firefox causes "BUG: Bad
> rss-counter state" and "BUG: non-zero pgtables_bytes on freeing mm" to
> start filling dmesg, and then closing programs causes more BUGs and
> hangs, and then everything grinds to a halt (can't start more programs,
> can't even reboot through systemd).
>
> Using master and reverting that branch up to that point fixes the
> problem.
>
> I'm using a Ryzen 1600 and AMD Radeon RX 480 on an ASRock B450 Pro4
> board with IOMMU enabled.

If you could try the attached patch, that'd be great!

Thanks,

Thomas



--------------F0ED14F7B8417927F8CA67C2
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-ttm-Temporarily-disable-the-huge_fault-callback.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-drm-ttm-Temporarily-disable-the-huge_fault-callback.pat";
 filename*1="ch"

From b630b9b4dcc1d01514d97a84cbb7f0cb85333154 Mon Sep 17 00:00:00 2001
From: "Thomas Hellstrom (VMware)" <thomas_os@shipmail.org>
Date: Mon, 6 Apr 2020 22:55:13 +0200
Subject: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback

Signed-off-by: Thomas Hellstrom (VMware) <thomas_os@shipmail.org>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 63 ---------------------------------
 1 file changed, 63 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 6ee3b96f0d13..0ad30b112982 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -442,66 +442,6 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault);
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-/**
- * ttm_pgprot_is_wrprotecting - Is a page protection value write-protecting?
- * @prot: The page protection value
- *
- * Return: true if @prot is write-protecting. false otherwise.
- */
-static bool ttm_pgprot_is_wrprotecting(pgprot_t prot)
-{
-	/*
-	 * This is meant to say "pgprot_wrprotect(prot) == prot" in a generic
-	 * way. Unfortunately there is no generic pgprot_wrprotect.
-	 */
-	return pte_val(pte_wrprotect(__pte(pgprot_val(prot)))) ==
-		pgprot_val(prot);
-}
-
-static vm_fault_t ttm_bo_vm_huge_fault(struct vm_fault *vmf,
-				       enum page_entry_size pe_size)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	pgprot_t prot;
-	struct ttm_buffer_object *bo = vma->vm_private_data;
-	vm_fault_t ret;
-	pgoff_t fault_page_size = 0;
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-
-	switch (pe_size) {
-	case PE_SIZE_PMD:
-		fault_page_size = HPAGE_PMD_SIZE >> PAGE_SHIFT;
-		break;
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-	case PE_SIZE_PUD:
-		fault_page_size = HPAGE_PUD_SIZE >> PAGE_SHIFT;
-		break;
-#endif
-	default:
-		WARN_ON_ONCE(1);
-		return VM_FAULT_FALLBACK;
-	}
-
-	/* Fallback on write dirty-tracking or COW */
-	if (write && ttm_pgprot_is_wrprotecting(vma->vm_page_prot))
-		return VM_FAULT_FALLBACK;
-
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
-
-	prot = vm_get_page_prot(vma->vm_flags);
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
-
-	dma_resv_unlock(bo->base.resv);
-
-	return ret;
-}
-#endif
-
 void ttm_bo_vm_open(struct vm_area_struct *vma)
 {
 	struct ttm_buffer_object *bo = vma->vm_private_data;
@@ -604,9 +544,6 @@ static const struct vm_operations_struct ttm_bo_vm_ops = {
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
 	.access = ttm_bo_vm_access,
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	.huge_fault = ttm_bo_vm_huge_fault,
-#endif
 };
 
 static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_bo_device *bdev,
-- 
2.21.1


--------------F0ED14F7B8417927F8CA67C2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------F0ED14F7B8417927F8CA67C2--
