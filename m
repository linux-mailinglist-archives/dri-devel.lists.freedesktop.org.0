Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9CA957BC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 08:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3339F6E5EE;
	Tue, 20 Aug 2019 06:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C706E5EE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 06:58:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190820065833euoutp010698ca1b5d00ae9a2caea87c846d2c80~8j0j4Vj8P2068520685euoutp01j
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 06:58:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190820065833euoutp010698ca1b5d00ae9a2caea87c846d2c80~8j0j4Vj8P2068520685euoutp01j
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190820065833eucas1p268427d144d90addd086e872bbe0740a5~8j0jOLzgw0762607626eucas1p2y;
 Tue, 20 Aug 2019 06:58:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 67.2C.04309.81A9B5D5; Tue, 20
 Aug 2019 07:58:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190820065832eucas1p182359d7501af8c027e7f3a4f4ad4d5e3~8j0iNHqQ20421404214eucas1p1k;
 Tue, 20 Aug 2019 06:58:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190820065831eusmtrp258419469145b10c72617610c2a1c8028~8j0h_WYIU2634226342eusmtrp2P;
 Tue, 20 Aug 2019 06:58:31 +0000 (GMT)
X-AuditID: cbfec7f4-f2e849c0000010d5-04-5d5b9a18fbb5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6A.50.04166.71A9B5D5; Tue, 20
 Aug 2019 07:58:31 +0100 (BST)
Received: from AMDC3964.digital.local (unknown [106.120.61.39]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190820065831eusmtip21cbba66598b372f76360956751545c1f~8j0hukCgd0181801818eusmtip2T;
 Tue, 20 Aug 2019 06:58:31 +0000 (GMT)
Date: Tue, 20 Aug 2019 08:58:30 +0200
From: Szymon Andrzejuk <s.andrzejuk@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vgem: Added page prefaulting
Message-ID: <20190820065830.GA11255@AMDC3964.digital.local>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42LZduzneV2JWdGxBpNaDSyufH3PZtE4r4/Z
 Yv+lp+wOzB73u48zefRtWcUYwBTFZZOSmpNZllqkb5fAldG5ZglzwSfbikm3D7I2MHYYdjFy
 ckgImEg8fPaRpYuRi0NIYAWjxOIJt5khnC+MEv+Wf2OCcD4zSpx78oIFpmXq7u+sEInljBLb
 TzYywrUcWPyIvYuRg4NFQFXibnckSAObgIHEtZnvGUFsEQFlib8TV4HZzAJ6Eo+75jOD2MIC
 hhJTu86wgti8AtYST7ashLIFJU7OfAK2WBSo98C242AXSQhcZpN4frSLGeIiF4nTpyAaJASE
 JV4d38IOYctI/N85H6qhm1FiytvTjBDOFEaJmY0rGUEulQBaN3uRB8RFGRLzLrezQ4QdJT5P
 i4Ew+SRuvBWEqOCTmLRtOjNEmFeio00IYpOqxKfGu9DwkZY4cfwYI4TtIXHq9Xk2EFtIIFai
 a+8H9gmM8rOQfDYLyV4IW0diwe5PbLOANjADjVr+jwPC1JRYv0t/ASPrKkbx1NLi3PTUYqO8
 1HK94sTc4tK8dL3k/NxNjMDkcfrf8S87GHf9STrEKMDBqMTD6zEtKlaINbGsuDL3EKMEB7OS
 CG/FHKAQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJJanZqakFqUUwWSYOTqkGRs+Y
 v49zbSRcJmyNf2ZzTLrdcOuEikU3T6nM2Fhz4e0aZ0Whs82SbGe23/3i0GzOfEXRbqtCwI2M
 85k5gWX6KtvlXpYpSS57uCHnPOshftVySzNjf9uPZg2G63Nvsyt0XeTUuWK10tFZZGcL8/Pv
 8y8oZxmL7TSpzy3iKOT4o7vnUl3IJMnvSizFGYmGWsxFxYkABj8PIBoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsVy+t/xe7ris6JjDZ5NNLe48vU9m0XjvD5m
 i/2XnrI7MHvc7z7O5NG3ZRVjAFOUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXsaeni/MBZusK+ZfPcrSwPhQr4uRk0NCwERi6u7vrF2MXBxCAksZ
 JdrWTGSESEhLPJ54iRnCFpb4c62LDaLoE6PEs//97F2MHBwsAqoSd7sjQWrYBAwkrs18D9Yr
 IqAs8XfiKjCbWUBP4nHXfLA5wgKGElO7zrCC2LwC1hJPtqyEsgUlTs58wgJRryVx499LJpDx
 zEA3LP/HARIWBRp5YNtxpgmM/LOQdMxC0jELoWMBI/MqRpHU0uLc9NxiQ73ixNzi0rx0veT8
 3E2MwFDeduzn5h2MlzYGH2IU4GBU4uH1mBYVK8SaWFZcmXuIUYKDWUmEt2IOUIg3JbGyKrUo
 P76oNCe1+BCjKdDHE5mlRJPzgXGWVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUg
 tQimj4mDU6qBsXblDtnQhWLJ3O5rQs9MPrfj+lrvjW2njOrrditd2PvmeryC0+lyk18pXre+
 TpwXvctYW3PTnX0LeH8Xv37gddPifI5iksnU7tgNc9pObV3/06BCNvMTQ0GORHvohB+r9lgu
 6J4myHVY6E7Rlaf9q4rPyCmyvrGQ5zLknDTdRjvKX/5WeUXBfiWW4oxEQy3mouJEAJMkrb17
 AgAA
X-CMS-MailID: 20190820065832eucas1p182359d7501af8c027e7f3a4f4ad4d5e3
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----epdElFSNUHk9jJ9N-IxsLBkaC9REP072rmGM_xwUbQ0uycex=_7e6ea_"
X-RootMTR: 20190820065832eucas1p182359d7501af8c027e7f3a4f4ad4d5e3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190820065832eucas1p182359d7501af8c027e7f3a4f4ad4d5e3
References: <CGME20190820065832eucas1p182359d7501af8c027e7f3a4f4ad4d5e3@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566284314;
 bh=+B6f+nKNo0SBPrhKbyGoNstdSj0o8qYZwPAjKipk1m0=;
 h=Date:From:To:Cc:Subject:References:From;
 b=WoLWspDTZN3nbfwnkhTYG5ruZ+7lPcPvm4Gfq/MMn0CCVD1w4AQo6fC49/LfMSC0l
 /ZXYrAfDR77ep3L4p2h1BKhEdUXywtGW3Dn528HQ3oRrB/Ril8vXVnz9x2uu1Ke4WV
 Je7hfHVh9MYt4w4U8iq2YJao39JpSzGnruuW1V4o=
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
Cc: p.rak@samsung.com, s.andrzejuk@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------epdElFSNUHk9jJ9N-IxsLBkaC9REP072rmGM_xwUbQ0uycex=_7e6ea_
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

Signed-off-by: Szymon Andrzejuk <s.andrzejuk@samsung.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 177 ++++++++++++++++++++++++++------
 1 file changed, 143 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 11a8f99ba18c..739ba841e89c 100644
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
@@ -61,6 +75,72 @@ static void vgem_gem_free_object(struct drm_gem_object *obj)
 	kfree(vgem_obj);
 }
 
+static int __vgem_alloc_page(struct page *page, struct vm_area_struct *vma,
+							 unsigned long vaddr, int page_num)
+{
+	unsigned long pfn;
+	int insert_ret;
+
+	pfn = page_to_pfn(page);
+	insert_ret = vmf_insert_mixed(vma, vaddr, __pfn_to_pfn_t(pfn, PFN_DEV));
+
+	if (insert_ret & VM_FAULT_ERROR)
+		return VM_FAULT_ERROR;
+
+	return 0;
+}
+
+static int __vgem_read_mapping_page(struct drm_vgem_gem_object *obj,
+									int page_num, struct page **page)
+{
+	int ret;
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
+static int __vgem_prepare_single_page(struct drm_vgem_gem_object *obj,
+									  struct vm_area_struct *vma,
+									  int page_num, unsigned long vaddr)
+{
+	int ret;
+
+	ret = __vgem_read_mapping_page(obj, page_num, &obj->pages[page_num]);
+	if (ret)
+		return ret;
+
+	ret = __vgem_alloc_page(obj->pages[page_num], vma, vaddr, page_num);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -70,6 +150,8 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
 	vm_fault_t ret = VM_FAULT_SIGBUS;
 	loff_t num_pages;
 	pgoff_t page_offset;
+	int page_num, page_prep_ret;
+	const int PREFAULT_PAGES = 8;
 	page_offset = (vaddr - vma->vm_start) >> PAGE_SHIFT;
 
 	num_pages = DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
@@ -77,41 +159,60 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
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
+			struct page *next, *prev;
+
+			next = obj->pages[page_offset + 1];
+			prev = obj->pages[page_offset - 1];
+			if (!((uintptr_t)next ^ (uintptr_t)prev))
+				random = true;
+			else if (!prev)
+				forward = false;
+		} else {
+			forward = (page_offset == 0);
 		}
 
+		if (!random) {
+			for (page_num = page_offset;
+				forward ? page_num < page_offset + PREFAULT_PAGES && page_num < num_pages :
+				page_offset - page_num < PREFAULT_PAGES && page_num >= 0;
+				forward ? page_num++ : page_num--) {
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
+				vaddr = vaddr + (forward ? 1 : -1) * PAGE_SIZE;
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
 
@@ -182,7 +283,7 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
 					      unsigned long size)
 {
 	struct drm_vgem_gem_object *obj;
-	int ret;
+	int ret, num_pages;
 
 	obj = __vgem_gem_create(dev, size);
 	if (IS_ERR(obj))
@@ -193,6 +294,13 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
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
 
@@ -262,7 +370,8 @@ static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
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


------epdElFSNUHk9jJ9N-IxsLBkaC9REP072rmGM_xwUbQ0uycex=_7e6ea_
Content-Type: text/plain; charset="utf-8"


------epdElFSNUHk9jJ9N-IxsLBkaC9REP072rmGM_xwUbQ0uycex=_7e6ea_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

------epdElFSNUHk9jJ9N-IxsLBkaC9REP072rmGM_xwUbQ0uycex=_7e6ea_--
