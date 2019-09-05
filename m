Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B459AA3BB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 15:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF296E0CD;
	Thu,  5 Sep 2019 13:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B540D6E0CD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 13:03:15 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190905130313euoutp0189143309013c78ab2e9da5cdbcfbb424~BjHhBXRJa0692706927euoutp015
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 13:03:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190905130313euoutp0189143309013c78ab2e9da5cdbcfbb424~BjHhBXRJa0692706927euoutp015
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190905130312eucas1p26f3c77f2706e806823fd46116b515397~BjHgK6Jaz0374903749eucas1p2D;
 Thu,  5 Sep 2019 13:03:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 90.35.04374.097017D5; Thu,  5
 Sep 2019 14:03:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190905130311eucas1p22a1969c5b2d90bc7a8d381b3736cfffe~BjHfbVOiU0374503745eucas1p2B;
 Thu,  5 Sep 2019 13:03:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190905130311eusmtrp2619959b0a1aad92ce7fed81966b2177d~BjHfHPodZ2979329793eusmtrp2J;
 Thu,  5 Sep 2019 13:03:11 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-d3-5d7107904aac
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AC.E4.04117.F87017D5; Thu,  5
 Sep 2019 14:03:11 +0100 (BST)
Received: from AMDC3964.digital.local (unknown [106.120.61.39]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190905130310eusmtip1637151dcc81b63567e8a8a25729c8997~BjHep4k_b2373123731eusmtip1O;
 Thu,  5 Sep 2019 13:03:10 +0000 (GMT)
Date: Thu, 5 Sep 2019 15:03:09 +0200
From: Szymon Andrzejuk <s.andrzejuk@samsung.com>
To: dri-devel@lists.freedesktop.org, a.hajda@samsung.com
Subject: [PATCH v2] drm/vgem: Added page prefaulting
Message-ID: <20190905130309.GA15140@AMDC3964.digital.local>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHfc85OzsuJ8fN8EmDYBZZeK8Ph0pLEjpQH+xLRDFy5vFCOnVT
 y2zkSMOc2rwhm1likaWiZjrLNMTCZeZM7UY08/pBYWimUuKlzaPht9/zPP//c3l5KVzSL/Ck
 4pWpnEqpSJCRIsLU83fATy9MkQc2T7sy3xssAqbA0osx1W0Es24qwpmu5VkB82lxlmSm8mwk
 Mzz0HmO09wtxxtrUj06I2JyhVZKtyBok2BfWR4jtXKoi2JdGq5B92DGNsW1LowL2p86MsYUt
 tSjC+YLoWDSXEJ/OqQJCI0Vx47OLZLLt+LVf2TNkFuoPzkPOFNCHobq0SJiHRJSEfoIgJ/c7
 zgcLCL51ZGF88BvB2PodtGUpmcgm+UINAsvXRuy/5bOhHnOoCHovjM6ZSQeTdCB8Mcza3RTl
 TjOQb4h06HG6DcHHH2MCh0Zq7zr3YYJwsJg+CpZR3Sa7Qa9hcoN30t7QZTJj/BbtQrBWSnkO
 B61lcDMvhRlzi5Dn3bD+8sHGckDrEJTa+hAflCIwaJ9ubAT2aRXVrMOA0/EwptXjvDkMFk3P
 SV7iCt9sbrzEFYpN5TifFkPubQmv3gfzWivBsxe8M/dsPhYLy22VGx0ltBx0rTmEHu0xbrvM
 uG0wz75Q9WqeNNon4PZWNWsUjwegsT2gCglqkQeXpk6M5dSHlNxVf7UiUZ2mjPW/nJTYjOyf
 rG/NvPgCvV6J6kY0hWQuYnohWS4RKNLVGYndCChc5i5ufGZPiaMVGdc5VdIlVVoCp+5GXhQh
 8xBnOo1elNCxilTuCsclc6qtKkY5e2Yhv8L3oQWNLTf/NPiN5Ub8bBoevOEzEjFShkLKA0Sa
 XbcycO/xoOBBY4qhIrO6WB5WhhXG1OVn3733ztmiceo+I42f8takLGhO16Xpzh2JaXnsO5P+
 tnXnfmnADqWtXh/Xi04NnRxYyNSsFK++iYqKVbg0J0yGn9eXyDu9QkZ8zsoIdZwi6CCuUiv+
 AacJg7tgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7r97IWxBvOeiVjcWneO1aL33Ekm
 i0XbWSz+b5vIbHHg13tWiytf37NZPO16y2Zx+dIpJovGeX3MFnc3nGV04PJovfSXzWN2w0UW
 jx13lzB67P22gMVj56y77B6L97xk8tj+7QGrx/3u40wefVtWMQZwRunZFOWXlqQqZOQXl9gq
 RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl3Pn3jrFglW3F6aYL7A2Miw26
 GDk5JARMJCY/bmHrYuTiEBJYyijxrO8tE0RCWuLxxEvMELawxJ9rXWwgtpDAJ0aJbQuLQGwW
 ARWJBx+Og8XZBAwkrs18z9jFyMEhImAh0TMzASTMLLCTUWJNoymILQy068OZxywgNq+AtcS5
 B91QtqDEyZlPWCDqtSRu/HvJBDKGGeiE5f84QMKiAsoSB7YdZ5rAyD8LSccsJB2zEDoWMDKv
 YhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIypbcd+btnB2PUu+BCjAAejEg+vwJeCWCHWxLLi
 ytxDjBIczEoivOs3AoV4UxIrq1KL8uOLSnNSiw8xmgJ9PJFZSjQ5HxjveSXxhqaG5haWhubG
 5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGK8ftd4/wWbTv5btxdtsZE8EikiusSxh
 aUs3f1zVdHzyhZT7s9ayc9czdjHN/fY090zBuklRagmvuG3Z9Cza7py4ckZ7/k3JN9bz7SRO
 OHmF+GjXHvWObT+yNSbkbOklzv4l/bvnnVr37vDXouCiE1aH0ktMZmj/iQg8UjU7xldh24Gc
 x0rZIkosxRmJhlrMRcWJANdshxW/AgAA
X-CMS-MailID: 20190905130311eucas1p22a1969c5b2d90bc7a8d381b3736cfffe
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----Vk40yymdOPf5tY5lSgqcTAWqq.j3lXMfgTgPoE1csihVfod4=_116f2e_"
X-RootMTR: 20190905130311eucas1p22a1969c5b2d90bc7a8d381b3736cfffe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190905130311eucas1p22a1969c5b2d90bc7a8d381b3736cfffe
References: <CGME20190905130311eucas1p22a1969c5b2d90bc7a8d381b3736cfffe@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1567688593;
 bh=D5sOCSzCWywoLeGbjQhx28+mkq4vOHMPq9CZr3Y5/Ig=;
 h=Date:From:To:Cc:Subject:References:From;
 b=Od+brZEJ3Ns6SxAPaGPaPGrBKig5bomI62gu3UlTdAmljIvct2uhhgs5p+F97Qd3x
 MLSUro11Fbe0ItCPTeKUKoxYpcmez/nUDrtzn1M7+4vX5T6Muq4ddy0FemrH5Aki0h
 4uYAHwXK21FnPTgTMyne00RsL0G0sXNftzMy094M=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: p.rak@samsung.com, deepak.sharma@amd.com, airlied@linux.ie,
 andrzejuk.szymon@gmail.com, seanpaul@chromium.org, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------Vk40yymdOPf5tY5lSgqcTAWqq.j3lXMfgTgPoE1csihVfod4=_116f2e_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Page fault handler inside vgem driver now preallocates pages in advance
when fault occurs for the first time. Pages can be allocated in
direction of increasing/decreasing addresses, depending on memory access
profile. In case of random access no preallocation occurs.

Synthetic benchmark showed over 8x bandwidth increase when copying data
from mmapped vgem buffer with memcpy and ~160 times when accessing mapped
buffer sequentially. Compiled with gcc 8.2.0 with -O2 flag.
Unigine Heaven running on custom virgl vtest virtual GPU with vgem buffers
sees ~17% FPS increase.

This performance increase only occurs when accessing vgem buffer mapped
using DRM_IOCTL_MODE_MAP_DUMB ioctl. When accessing buffer imported
from prime fd the vgem page fault handler is not invoked. It's advised
to use vector streaming copy instructions and avoid sequential accesses
in this case. Streaming copy brings the performance to be on par with
similar buffer allocated with memfd_create(2) syscall.

Changes in v2:
  - Refactored some code based on Andrzej Hajda review
  - changed return types of __vgem_alloc_page, __vgem_read_mapping_page 
    and __vgem_prepare_single_page from int to vm_fault_t

Signed-off-by: Szymon Andrzejuk <s.andrzejuk@samsung.com>
---
    
 drivers/gpu/drm/vgem/vgem_drv.c | 178 ++++++++++++++++++++++++++------
 1 file changed, 144 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 11a8f99ba18c..155a7911cfc8 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -34,6 +34,7 @@
 #include <linux/ramfs.h>
 #include <linux/shmem_fs.h>
 #include <linux/dma-buf.h>
+#include <linux/pfn_t.h>
 #include "vgem_drv.h"
 
 #define DRIVER_NAME	"vgem"
@@ -50,8 +51,21 @@ static struct vgem_device {
 static void vgem_gem_free_object(struct drm_gem_object *obj)
 {
 	struct drm_vgem_gem_object *vgem_obj = to_vgem_bo(obj);
+	int i;
+
+	mutex_lock(&vgem_obj->pages_lock);
+	if (vgem_obj->pages) {
+		int num_pages = obj->size >> PAGE_SHIFT;
+
+		for (i = 0; i < num_pages; i++) {
+			if (vgem_obj->pages[i])
+				put_page(vgem_obj->pages[i]);
+		}
+		kvfree(vgem_obj->pages);
+		vgem_obj->pages = NULL;
+	}
+	mutex_unlock(&vgem_obj->pages_lock);
 
-	kvfree(vgem_obj->pages);
 	mutex_destroy(&vgem_obj->pages_lock);
 
 	if (obj->import_attach)
@@ -61,6 +75,68 @@ static void vgem_gem_free_object(struct drm_gem_object *obj)
 	kfree(vgem_obj);
 }
 
+static vm_fault_t __vgem_alloc_page(struct page *page, struct vm_area_struct *vma,
+									unsigned long vaddr)
+{
+	unsigned long pfn;
+	vm_fault_t insert_ret;
+
+	pfn = page_to_pfn(page);
+	insert_ret = vmf_insert_mixed(vma, vaddr, __pfn_to_pfn_t(pfn, PFN_DEV));
+
+	if (insert_ret & VM_FAULT_ERROR)
+		return insert_ret;
+
+	return 0;
+}
+
+static vm_fault_t __vgem_read_mapping_page(struct drm_vgem_gem_object *obj,
+										   int page_num, struct page **page)
+{
+	vm_fault_t ret;
+	struct page *mapped_page;
+
+	mapped_page = shmem_read_mapping_page(file_inode(obj->base.filp)->i_mapping,
+										  page_num);
+	if (IS_ERR(page)) {
+		switch (PTR_ERR(page)) {
+		case -ENOSPC:
+		case -ENOMEM:
+			ret = VM_FAULT_OOM;
+			break;
+		case -EBUSY:
+			ret = VM_FAULT_RETRY;
+			break;
+		case -EFAULT:
+		case -EINVAL:
+			ret = VM_FAULT_SIGBUS;
+			break;
+		default:
+			WARN_ON(PTR_ERR(page));
+			ret = VM_FAULT_SIGBUS;
+			break;
+		}
+
+		return ret;
+	}
+
+	*page = mapped_page;
+	return 0;
+}
+
+static vm_fault_t __vgem_prepare_single_page(struct drm_vgem_gem_object *obj,
+											 struct vm_area_struct *vma,
+											 int page_num, unsigned long vaddr)
+{
+	vm_fault_t ret;
+
+	ret = __vgem_read_mapping_page(obj, page_num, &obj->pages[page_num]);
+	if (ret)
+		return ret;
+
+	return __vgem_alloc_page(obj->pages[page_num], vma, vaddr);
+}
+
 static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -70,6 +146,8 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
 	vm_fault_t ret = VM_FAULT_SIGBUS;
 	loff_t num_pages;
 	pgoff_t page_offset;
+	int page_num, page_prep_ret;
+	const int PREFAULT_PAGES = 8;
 	page_offset = (vaddr - vma->vm_start) >> PAGE_SHIFT;
 
 	num_pages = DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
@@ -77,41 +155,65 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
 	if (page_offset >= num_pages)
 		return VM_FAULT_SIGBUS;
 
+	ret = VM_FAULT_NOPAGE;
+
 	mutex_lock(&obj->pages_lock);
-	if (obj->pages) {
-		get_page(obj->pages[page_offset]);
-		vmf->page = obj->pages[page_offset];
-		ret = 0;
-	}
-	mutex_unlock(&obj->pages_lock);
-	if (ret) {
-		struct page *page;
-
-		page = shmem_read_mapping_page(
-					file_inode(obj->base.filp)->i_mapping,
-					page_offset);
-		if (!IS_ERR(page)) {
-			vmf->page = page;
-			ret = 0;
-		} else switch (PTR_ERR(page)) {
-			case -ENOSPC:
-			case -ENOMEM:
-				ret = VM_FAULT_OOM;
-				break;
-			case -EBUSY:
-				ret = VM_FAULT_RETRY;
-				break;
-			case -EFAULT:
-			case -EINVAL:
-				ret = VM_FAULT_SIGBUS;
-				break;
-			default:
-				WARN_ON(PTR_ERR(page));
-				ret = VM_FAULT_SIGBUS;
-				break;
+
+	if (num_pages > 1) {
+		bool forward = true;
+		bool random = false;
+
+		// Determine prefaulting direction. If adjacent pages are both
+		// allocated/not allocated then we have random access.
+		// Always try to prefault on first and last page.
+		if (page_offset != 0 && page_offset != num_pages - 1) {
+			bool next, prev;
+
+			next = obj->pages[page_offset + 1];
+			prev = obj->pages[page_offset - 1];
+			if (prev == next)
+				random = true;
+			else if (!prev)
+				forward = false;
+		} else {
+			forward = (page_offset == 0);
 		}
 
+		if (!random) {
+			int start_page = page_offset;
+			int end_page;
+			int step = (forward ? 1 : -1);
+			if (forward)
+				end_page = min(page_offset + PREFAULT_PAGES, (unsigned long)num_pages);
+			else
+				end_page = max((int)page_offset - PREFAULT_PAGES, 0);
+
+			for (page_num = start_page; page_num != end_page; page_num += step) {
+				if (!obj->pages[page_num]) {
+					page_prep_ret = __vgem_prepare_single_page(obj, vma, page_num, vaddr);
+					if (page_prep_ret) {
+						ret = page_prep_ret;
+						break;
+					}
+				} else {
+					// random access, exit loop
+					break;
+				}
+
+				vaddr += step * PAGE_SIZE;
+			}
+		} else {
+			page_prep_ret = __vgem_prepare_single_page(obj, vma, page_offset, vaddr);
+			if (page_prep_ret)
+				ret = page_prep_ret;
+		}
+	} else {
+		page_prep_ret = __vgem_prepare_single_page(obj, vma, page_offset, vaddr);
+		if (page_prep_ret)
+			ret = page_prep_ret;
 	}
+
+	mutex_unlock(&obj->pages_lock);
 	return ret;
 }
 
@@ -182,7 +284,7 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
 					      unsigned long size)
 {
 	struct drm_vgem_gem_object *obj;
-	int ret;
+	int ret, num_pages;
 
 	obj = __vgem_gem_create(dev, size);
 	if (IS_ERR(obj))
@@ -193,6 +295,13 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	mutex_lock(&obj->pages_lock);
+
+	num_pages = obj->base.size >> PAGE_SHIFT;
+	obj->pages = kvcalloc(num_pages, sizeof(struct page *), GFP_KERNEL);
+
+	mutex_unlock(&obj->pages_lock);
+
 	return &obj->base;
 }
 
@@ -262,7 +371,8 @@ static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
 	/* Keep the WC mmaping set by drm_gem_mmap() but our pages
 	 * are ordinary and not special.
 	 */
-	vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP | VM_MIXEDMAP;
+
 	return 0;
 }
 
-- 
2.17.1


------Vk40yymdOPf5tY5lSgqcTAWqq.j3lXMfgTgPoE1csihVfod4=_116f2e_
Content-Type: text/plain; charset="utf-8"


------Vk40yymdOPf5tY5lSgqcTAWqq.j3lXMfgTgPoE1csihVfod4=_116f2e_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

------Vk40yymdOPf5tY5lSgqcTAWqq.j3lXMfgTgPoE1csihVfod4=_116f2e_--
