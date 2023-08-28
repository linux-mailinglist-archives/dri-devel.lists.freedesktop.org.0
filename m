Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A978A6E9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 09:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E6C10E223;
	Mon, 28 Aug 2023 07:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC69510E223
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 07:58:23 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id
 98e67ed59e1d1-26ef24b8e5aso1853168a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20221208.gappssmtp.com; s=20221208; t=1693209503; x=1693814303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k/QhZG6ZDZ8kFya2emkAkHMTf8vyMHNtbVCiU5m1tXU=;
 b=VRbPxyeENdl3s1Qey3hv6yOlZ+4CfxWyDhTKUoUUymqkuI5AP/WJxQYPM820UoSUL9
 mASd9g8eED4jR5/UGsvPMM8Iq0mGYCyDj5+27xZ2APl3EDzsyBUjjIr1Z5cP1yPafCnH
 VEIaYfvDmVMLmwGul5InZHe434etHpqOAgOIso2MFC422b6qVaJ5khu2gCC9fIEx5mEX
 wrEZLQ0TsTAayd1qneRDw5nHqqlg8MzfhWBEmclhJRhkwfdvTRAULmC3atVB1e9ankYI
 HlCP7jetH6AKg+/M+j0qDyDD3cYZ6RXcqRjk2PEt4HzN6R1d2iGYXpPtQVxoLdsblBE3
 MzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693209503; x=1693814303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k/QhZG6ZDZ8kFya2emkAkHMTf8vyMHNtbVCiU5m1tXU=;
 b=ONcU+Ok/8J3MV3RwUo2tQvMEwa13MYSGKGGsdggSocHbQALopZllA8x6BHgORFWPk+
 pt7HM8Bu5NcYUyMSnkx11TKNYKRuGzUV9Ifsex/DKAte1to9ItM6Sp7tlcFLiF5TfLBS
 lLEYbLbuhEu7lgj8pyAecf6zXwQUCTeSFQNFqGkHPG1UhcuHOiPLIOYF+hi1esIYeLnd
 Gz+lys4HjA5BPjF4TBQyXD+PiSvJ0rG2mHb0DA/uRt7S0H9T2zEEGQti8Kdp3YE9cVHo
 DzDGhp9YBzA9kiMe+yko41NBZ5S3Johbl6tN81lRNlp3tpmr5UMwapx1JfNfzV7UCT8m
 wwmQ==
X-Gm-Message-State: AOJu0YxjVlRg/aNa4Zlb2ontqVJJJwiVYFrTYXJTym1pVIYHbbDDZ532
 UBgeK7WH2duQUI0q9donlPK7Vynq5TIpXloWjNmU59jJ4gfkWZ4a
X-Google-Smtp-Source: AGHT+IFajBr6AnYgt/7FmhK0WkzPHs+3hSx8KYTxkpY+YHQONQ8b8t1fBHX+N/4s0hTxlKIr6q/SNQ==
X-Received: by 2002:a17:90a:df07:b0:268:ac3:b1f6 with SMTP id
 gp7-20020a17090adf0700b002680ac3b1f6mr21616297pjb.24.1693209503018; 
 Mon, 28 Aug 2023 00:58:23 -0700 (PDT)
Received: from nixos.tailf4e9e.ts.net ([8.210.91.195])
 by smtp.googlemail.com with ESMTPSA id
 ds1-20020a17090b08c100b00262e485156esm8269343pjb.57.2023.08.28.00.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 00:58:22 -0700 (PDT)
From: Xueshi Hu <xueshi.hu@smartx.com>
To: hch@infradead.org, dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, jayalk@intworks.biz, daniel@ffwll.ch, deller@gmx.de,
 bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.com,
 tytso@mit.edu, adilger.kernel@dilger.ca, miklos@szeredi.hu,
 mike.kravetz@oracle.com, muchun.song@linux.dev, djwong@kernel.org,
 willy@infradead.org, akpm@linux-foundation.org, hughd@google.com
Subject: [PATCH v2] fs: clean up usage of noop_dirty_folio
Date: Mon, 28 Aug 2023 15:54:49 +0800
Message-Id: <20230828075449.262510-1-xueshi.hu@smartx.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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
Cc: nvdimm@lists.linux.dev, linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xueshi Hu <xueshi.hu@smartx.com>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In folio_mark_dirty(), it can automatically fallback to
noop_dirty_folio() if a_ops->dirty_folio is not registered.

As anon_aops, dev_dax_aops and fb_deferred_io_aops becames empty, remove
them too.

Signed-off-by: Xueshi Hu <xueshi.hu@smartx.com>
---
Changes in v2:
- make noop_dirty_folio() inline as suggested by Matthew
- v1: https://lore.kernel.org/linux-mm/ZOxAfrz9etoVUfLQ@infradead.org/T/#m073d45909b1df03ff09f382557dc4e84d0607c49

 drivers/dax/device.c                |  5 -----
 drivers/video/fbdev/core/fb_defio.c |  5 -----
 fs/aio.c                            |  1 -
 fs/ext2/inode.c                     |  1 -
 fs/ext4/inode.c                     |  1 -
 fs/fuse/dax.c                       |  1 -
 fs/hugetlbfs/inode.c                |  1 -
 fs/libfs.c                          |  5 -----
 fs/xfs/xfs_aops.c                   |  1 -
 include/linux/pagemap.h             |  1 -
 mm/page-writeback.c                 | 18 +++++-------------
 mm/secretmem.c                      |  1 -
 mm/shmem.c                          |  1 -
 mm/swap_state.c                     |  1 -
 14 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 30665a3ff6ea..018aa9f88ec7 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -345,10 +345,6 @@ static unsigned long dax_get_unmapped_area(struct file *filp,
 	return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
 }
 
-static const struct address_space_operations dev_dax_aops = {
-	.dirty_folio	= noop_dirty_folio,
-};
-
 static int dax_open(struct inode *inode, struct file *filp)
 {
 	struct dax_device *dax_dev = inode_dax(inode);
@@ -358,7 +354,6 @@ static int dax_open(struct inode *inode, struct file *filp)
 	dev_dbg(&dev_dax->dev, "trace\n");
 	inode->i_mapping = __dax_inode->i_mapping;
 	inode->i_mapping->host = __dax_inode;
-	inode->i_mapping->a_ops = &dev_dax_aops;
 	filp->f_mapping = inode->i_mapping;
 	filp->f_wb_err = filemap_sample_wb_err(filp->f_mapping);
 	filp->f_sb_err = file_sample_sb_err(filp);
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 274f5d0fa247..08be3592281f 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -221,10 +221,6 @@ static const struct vm_operations_struct fb_deferred_io_vm_ops = {
 	.page_mkwrite	= fb_deferred_io_mkwrite,
 };
 
-static const struct address_space_operations fb_deferred_io_aops = {
-	.dirty_folio	= noop_dirty_folio,
-};
-
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	vma->vm_ops = &fb_deferred_io_vm_ops;
@@ -307,7 +303,6 @@ void fb_deferred_io_open(struct fb_info *info,
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
-	file->f_mapping->a_ops = &fb_deferred_io_aops;
 	fbdefio->open_count++;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_open);
diff --git a/fs/aio.c b/fs/aio.c
index 77e33619de40..4cf386f9cb1c 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -484,7 +484,6 @@ static int aio_migrate_folio(struct address_space *mapping, struct folio *dst,
 #endif
 
 static const struct address_space_operations aio_ctx_aops = {
-	.dirty_folio	= noop_dirty_folio,
 	.migrate_folio	= aio_migrate_folio,
 };
 
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 75983215c7a1..ce191bdf1c78 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -971,7 +971,6 @@ const struct address_space_operations ext2_aops = {
 static const struct address_space_operations ext2_dax_aops = {
 	.writepages		= ext2_dax_writepages,
 	.direct_IO		= noop_direct_IO,
-	.dirty_folio		= noop_dirty_folio,
 };
 
 /*
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 43775a6ca505..67c1710c01b0 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3561,7 +3561,6 @@ static const struct address_space_operations ext4_da_aops = {
 static const struct address_space_operations ext4_dax_aops = {
 	.writepages		= ext4_dax_writepages,
 	.direct_IO		= noop_direct_IO,
-	.dirty_folio		= noop_dirty_folio,
 	.bmap			= ext4_bmap,
 	.swap_activate		= ext4_iomap_swap_activate,
 };
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 8e74f278a3f6..50ca767cbd5e 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -1326,7 +1326,6 @@ bool fuse_dax_inode_alloc(struct super_block *sb, struct fuse_inode *fi)
 static const struct address_space_operations fuse_dax_file_aops  = {
 	.writepages	= fuse_dax_writepages,
 	.direct_IO	= noop_direct_IO,
-	.dirty_folio	= noop_dirty_folio,
 };
 
 static bool fuse_should_enable_dax(struct inode *inode, unsigned int flags)
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7b17ccfa039d..5404286f0c13 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -1266,7 +1266,6 @@ static void hugetlbfs_destroy_inode(struct inode *inode)
 static const struct address_space_operations hugetlbfs_aops = {
 	.write_begin	= hugetlbfs_write_begin,
 	.write_end	= hugetlbfs_write_end,
-	.dirty_folio	= noop_dirty_folio,
 	.migrate_folio  = hugetlbfs_migrate_folio,
 	.error_remove_page	= hugetlbfs_error_remove_page,
 };
diff --git a/fs/libfs.c b/fs/libfs.c
index 5b851315eeed..982f220a9ee3 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -627,7 +627,6 @@ const struct address_space_operations ram_aops = {
 	.read_folio	= simple_read_folio,
 	.write_begin	= simple_write_begin,
 	.write_end	= simple_write_end,
-	.dirty_folio	= noop_dirty_folio,
 };
 EXPORT_SYMBOL(ram_aops);
 
@@ -1231,16 +1230,12 @@ EXPORT_SYMBOL(kfree_link);
 
 struct inode *alloc_anon_inode(struct super_block *s)
 {
-	static const struct address_space_operations anon_aops = {
-		.dirty_folio	= noop_dirty_folio,
-	};
 	struct inode *inode = new_inode_pseudo(s);
 
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
 	inode->i_ino = get_next_ino();
-	inode->i_mapping->a_ops = &anon_aops;
 
 	/*
 	 * Mark the inode dirty from the very beginning,
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 451942fb38ec..300acea9ee63 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -590,6 +590,5 @@ const struct address_space_operations xfs_address_space_operations = {
 
 const struct address_space_operations xfs_dax_aops = {
 	.writepages		= xfs_dax_writepages,
-	.dirty_folio		= noop_dirty_folio,
 	.swap_activate		= xfs_iomap_swapfile_activate,
 };
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 716953ee1ebd..9de3be51dee2 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1074,7 +1074,6 @@ bool folio_clear_dirty_for_io(struct folio *folio);
 bool clear_page_dirty_for_io(struct page *page);
 void folio_invalidate(struct folio *folio, size_t offset, size_t length);
 int __set_page_dirty_nobuffers(struct page *page);
-bool noop_dirty_folio(struct address_space *mapping, struct folio *folio);
 
 #ifdef CONFIG_MIGRATION
 int filemap_migrate_folio(struct address_space *mapping, struct folio *dst,
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index d3f42009bb70..d2d739109bfe 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2585,17 +2585,6 @@ int do_writepages(struct address_space *mapping, struct writeback_control *wbc)
 	return ret;
 }
 
-/*
- * For address_spaces which do not use buffers nor write back.
- */
-bool noop_dirty_folio(struct address_space *mapping, struct folio *folio)
-{
-	if (!folio_test_dirty(folio))
-		return !folio_test_set_dirty(folio);
-	return false;
-}
-EXPORT_SYMBOL(noop_dirty_folio);
-
 /*
  * Helper function for set_page_dirty family.
  *
@@ -2799,10 +2788,13 @@ bool folio_mark_dirty(struct folio *folio)
 		 */
 		if (folio_test_reclaim(folio))
 			folio_clear_reclaim(folio);
-		return mapping->a_ops->dirty_folio(mapping, folio);
+		if (mapping->a_ops->dirty_folio)
+			return mapping->a_ops->dirty_folio(mapping, folio);
 	}
 
-	return noop_dirty_folio(mapping, folio);
+	if (!folio_test_dirty(folio))
+		return !folio_test_set_dirty(folio);
+	return false;
 }
 EXPORT_SYMBOL(folio_mark_dirty);
 
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 86442a15d12f..3fe1c35f9c8d 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -157,7 +157,6 @@ static void secretmem_free_folio(struct folio *folio)
 }
 
 const struct address_space_operations secretmem_aops = {
-	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
 	.migrate_folio	= secretmem_migrate_folio,
 };
diff --git a/mm/shmem.c b/mm/shmem.c
index d963c747dabc..9bdef68a088a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4090,7 +4090,6 @@ static int shmem_error_remove_page(struct address_space *mapping,
 
 const struct address_space_operations shmem_aops = {
 	.writepage	= shmem_writepage,
-	.dirty_folio	= noop_dirty_folio,
 #ifdef CONFIG_TMPFS
 	.write_begin	= shmem_write_begin,
 	.write_end	= shmem_write_end,
diff --git a/mm/swap_state.c b/mm/swap_state.c
index f8ea7015bad4..3666439487db 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -30,7 +30,6 @@
  */
 static const struct address_space_operations swap_aops = {
 	.writepage	= swap_writepage,
-	.dirty_folio	= noop_dirty_folio,
 #ifdef CONFIG_MIGRATION
 	.migrate_folio	= migrate_folio,
 #endif
-- 
2.40.1

