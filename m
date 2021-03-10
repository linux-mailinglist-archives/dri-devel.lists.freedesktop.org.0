Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D19333923
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 10:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34B96E1F8;
	Wed, 10 Mar 2021 09:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829FC89C2C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 09:33:38 +0000 (UTC)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@canonical.com>) id 1lJvDk-0007wz-A8
 for dri-devel@lists.freedesktop.org; Wed, 10 Mar 2021 09:33:36 +0000
Received: by mail-ed1-f69.google.com with SMTP id p6so8035599edq.21
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 01:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=14nc1uKuJAdMxMTBUurIvk6P4Z6isZ4a4fpbzrlbyuU=;
 b=XREICSr0eie59AcXLyKf1TfJhmS1ix8UqnCF+TJi8BE9RRiEl6fNlEWd0gBv+NrgsP
 Gv7tv0xRZzEigMMBVBv4TSplo6/CoudKvO+oUrREZtrJlRUVHg9XUTke4O7C0tpJicss
 qOJiOZ0L7xL2CMBYSdi/jXF+bbxAEWVKdCnd5U7d014KcPbsT0KJc8ZUIe8y390EXdvA
 6eBHlc70MY1yjSJtkhx4xQ9Yh5FXYVaFryimVu/JTsJmyu4LBxaqI2Of6rP+B8PK0Xs9
 FLeT77pO0uUelnBBvEXqVuoLHI0Fd5OcobFv+VIYiEZV53YtnemQ33YW/hWNRPxDHhjf
 sf9w==
X-Gm-Message-State: AOAM531PAASAZoA08w97iFBwhyX5UFB9O1n+qmpIOdfqy2myCkydD5oS
 1gGHrgRI97NyTxAylxMA6vxjTMUImgO5y5DWMKJl/BMowz0u8tFJew+CWb2QYfCvrLq6o6T3nWg
 4HiXDa4yfok7i+UrrABsoPbTfZevGhacsmZIi1aHJWQdTDA==
X-Received: by 2002:a17:906:719b:: with SMTP id
 h27mr2638552ejk.123.1615368815902; 
 Wed, 10 Mar 2021 01:33:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynTdTjeNcnsqZTZNxCdGI7XKINcTap+kvD/6GxqZOUzzodVfhD0s8dDnscaaJ7K+0Y8HzQmg==
X-Received: by 2002:a17:906:719b:: with SMTP id
 h27mr2638527ejk.123.1615368815690; 
 Wed, 10 Mar 2021 01:33:35 -0800 (PST)
Received: from gmail.com (ip5f5af0a0.dynamic.kabel-deutschland.de.
 [95.90.240.160])
 by smtp.gmail.com with ESMTPSA id r5sm10355904eds.49.2021.03.10.01.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 01:33:35 -0800 (PST)
Date: Wed, 10 Mar 2021 10:33:33 +0100
From: Christian Brauner <christian.brauner@canonical.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] fs: rename alloc_anon_inode to alloc_anon_inode_sb
Message-ID: <20210310093333.cenapdezfynb4bnu@gmail.com>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-2-hch@lst.de>
X-Mailman-Approved-At: Wed, 10 Mar 2021 09:47:12 +0000
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 04:53:40PM +0100, Christoph Hellwig wrote:
> Rename alloc_inode to free the name for a new variant that does not
> need boilerplate to create a super_block first.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good (with the metioned fix in
https://lore.kernel.org/lkml/20210310083040.GA5217@lst.de)

Reviewed-by: Christian Brauner <christian.brauner@ubuntu.com>

>  arch/powerpc/platforms/pseries/cmm.c | 2 +-
>  drivers/dma-buf/dma-buf.c            | 2 +-
>  drivers/gpu/drm/drm_drv.c            | 2 +-
>  drivers/misc/cxl/api.c               | 2 +-
>  drivers/misc/vmw_balloon.c           | 2 +-
>  drivers/scsi/cxlflash/ocxl_hw.c      | 2 +-
>  drivers/virtio/virtio_balloon.c      | 2 +-
>  fs/aio.c                             | 2 +-
>  fs/anon_inodes.c                     | 4 ++--
>  fs/libfs.c                           | 2 +-
>  include/linux/fs.h                   | 2 +-
>  kernel/resource.c                    | 2 +-
>  mm/z3fold.c                          | 2 +-
>  mm/zsmalloc.c                        | 2 +-
>  14 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 45a3a3022a85c9..6d36b858b14df1 100644
> --- a/arch/powerpc/platforms/pseries/cmm.c
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -580,7 +580,7 @@ static int cmm_balloon_compaction_init(void)
>  		return rc;
>  	}
>  
> -	b_dev_info.inode = alloc_anon_inode(balloon_mnt->mnt_sb);
> +	b_dev_info.inode = alloc_anon_inode_sb(balloon_mnt->mnt_sb);
>  	if (IS_ERR(b_dev_info.inode)) {
>  		rc = PTR_ERR(b_dev_info.inode);
>  		b_dev_info.inode = NULL;
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383eb4..dedcc9483352dc 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -445,7 +445,7 @@ static inline int is_dma_buf_file(struct file *file)
>  static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>  {
>  	struct file *file;
> -	struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
> +	struct inode *inode = alloc_anon_inode_sb(dma_buf_mnt->mnt_sb);
>  
>  	if (IS_ERR(inode))
>  		return ERR_CAST(inode);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 20d22e41d7ce74..87e7214a8e3565 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -519,7 +519,7 @@ static struct inode *drm_fs_inode_new(void)
>  		return ERR_PTR(r);
>  	}
>  
> -	inode = alloc_anon_inode(drm_fs_mnt->mnt_sb);
> +	inode = alloc_anon_inode_sb(drm_fs_mnt->mnt_sb);
>  	if (IS_ERR(inode))
>  		simple_release_fs(&drm_fs_mnt, &drm_fs_cnt);
>  
> diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
> index b493de962153ba..2efbf6c98028ef 100644
> --- a/drivers/misc/cxl/api.c
> +++ b/drivers/misc/cxl/api.c
> @@ -73,7 +73,7 @@ static struct file *cxl_getfile(const char *name,
>  		goto err_module;
>  	}
>  
> -	inode = alloc_anon_inode(cxl_vfs_mount->mnt_sb);
> +	inode = alloc_anon_inode_sb(cxl_vfs_mount->mnt_sb);
>  	if (IS_ERR(inode)) {
>  		file = ERR_CAST(inode);
>  		goto err_fs;
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index b837e7eba5f7dc..5d057a05ddbee8 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -1900,7 +1900,7 @@ static __init int vmballoon_compaction_init(struct vmballoon *b)
>  		return PTR_ERR(vmballoon_mnt);
>  
>  	b->b_dev_info.migratepage = vmballoon_migratepage;
> -	b->b_dev_info.inode = alloc_anon_inode(vmballoon_mnt->mnt_sb);
> +	b->b_dev_info.inode = alloc_anon_inode_sb(vmballoon_mnt->mnt_sb);
>  
>  	if (IS_ERR(b->b_dev_info.inode))
>  		return PTR_ERR(b->b_dev_info.inode);
> diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
> index 244fc27215dc79..40184ed926b557 100644
> --- a/drivers/scsi/cxlflash/ocxl_hw.c
> +++ b/drivers/scsi/cxlflash/ocxl_hw.c
> @@ -88,7 +88,7 @@ static struct file *ocxlflash_getfile(struct device *dev, const char *name,
>  		goto err2;
>  	}
>  
> -	inode = alloc_anon_inode(ocxlflash_vfs_mount->mnt_sb);
> +	inode = alloc_anon_inode_sb(ocxlflash_vfs_mount->mnt_sb);
>  	if (IS_ERR(inode)) {
>  		rc = PTR_ERR(inode);
>  		dev_err(dev, "%s: alloc_anon_inode failed rc=%d\n",
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 8985fc2cea8615..cae76ee5bdd688 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -916,7 +916,7 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  	}
>  
>  	vb->vb_dev_info.migratepage = virtballoon_migratepage;
> -	vb->vb_dev_info.inode = alloc_anon_inode(balloon_mnt->mnt_sb);
> +	vb->vb_dev_info.inode = alloc_anon_inode_sb(balloon_mnt->mnt_sb);
>  	if (IS_ERR(vb->vb_dev_info.inode)) {
>  		err = PTR_ERR(vb->vb_dev_info.inode);
>  		goto out_kern_unmount;
> diff --git a/fs/aio.c b/fs/aio.c
> index 1f32da13d39ee6..d1c2aa7fd6de7c 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -234,7 +234,7 @@ static const struct address_space_operations aio_ctx_aops;
>  static struct file *aio_private_file(struct kioctx *ctx, loff_t nr_pages)
>  {
>  	struct file *file;
> -	struct inode *inode = alloc_anon_inode(aio_mnt->mnt_sb);
> +	struct inode *inode = alloc_anon_inode_sb(aio_mnt->mnt_sb);
>  	if (IS_ERR(inode))
>  		return ERR_CAST(inode);
>  
> diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
> index a280156138ed89..4745fc37014332 100644
> --- a/fs/anon_inodes.c
> +++ b/fs/anon_inodes.c
> @@ -63,7 +63,7 @@ static struct inode *anon_inode_make_secure_inode(
>  	const struct qstr qname = QSTR_INIT(name, strlen(name));
>  	int error;
>  
> -	inode = alloc_anon_inode(anon_inode_mnt->mnt_sb);
> +	inode = alloc_anon_inode_sb(anon_inode_mnt->mnt_sb);
>  	if (IS_ERR(inode))
>  		return inode;
>  	inode->i_flags &= ~S_PRIVATE;
> @@ -231,7 +231,7 @@ static int __init anon_inode_init(void)
>  	if (IS_ERR(anon_inode_mnt))
>  		panic("anon_inode_init() kernel mount failed (%ld)\n", PTR_ERR(anon_inode_mnt));
>  
> -	anon_inode_inode = alloc_anon_inode(anon_inode_mnt->mnt_sb);
> +	anon_inode_inode = alloc_anon_inode_sb(anon_inode_mnt->mnt_sb);
>  	if (IS_ERR(anon_inode_inode))
>  		panic("anon_inode_init() inode allocation failed (%ld)\n", PTR_ERR(anon_inode_inode));
>  
> diff --git a/fs/libfs.c b/fs/libfs.c
> index e2de5401abca5a..600bebc1cd847f 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1216,7 +1216,7 @@ static int anon_set_page_dirty(struct page *page)
>  	return 0;
>  };
>  
> -struct inode *alloc_anon_inode(struct super_block *s)
> +struct inode *alloc_anon_inode_sb(struct super_block *s)
>  {
>  	static const struct address_space_operations anon_aops = {
>  		.set_page_dirty = anon_set_page_dirty,
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index ec8f3ddf4a6aa8..52387368af3c00 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3286,7 +3286,7 @@ extern int simple_write_end(struct file *file, struct address_space *mapping,
>  			loff_t pos, unsigned len, unsigned copied,
>  			struct page *page, void *fsdata);
>  extern int always_delete_dentry(const struct dentry *);
> -extern struct inode *alloc_anon_inode(struct super_block *);
> +extern struct inode *alloc_anon_inode_sb(struct super_block *);
>  extern int simple_nosetlease(struct file *, long, struct file_lock **, void **);
>  extern const struct dentry_operations simple_dentry_operations;
>  
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 627e61b0c12418..0fd091a3f2fc66 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1863,7 +1863,7 @@ static int __init iomem_init_inode(void)
>  		return rc;
>  	}
>  
> -	inode = alloc_anon_inode(iomem_vfs_mount->mnt_sb);
> +	inode = alloc_anon_inode_sb(iomem_vfs_mount->mnt_sb);
>  	if (IS_ERR(inode)) {
>  		rc = PTR_ERR(inode);
>  		pr_err("Cannot allocate inode for iomem: %d\n", rc);
> diff --git a/mm/z3fold.c b/mm/z3fold.c
> index b5dafa7e44e429..e7cd9298b221f5 100644
> --- a/mm/z3fold.c
> +++ b/mm/z3fold.c
> @@ -376,7 +376,7 @@ static void z3fold_unmount(void)
>  static const struct address_space_operations z3fold_aops;
>  static int z3fold_register_migration(struct z3fold_pool *pool)
>  {
> -	pool->inode = alloc_anon_inode(z3fold_mnt->mnt_sb);
> +	pool->inode = alloc_anon_inode_sb(z3fold_mnt->mnt_sb);
>  	if (IS_ERR(pool->inode)) {
>  		pool->inode = NULL;
>  		return 1;
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 30c358b7202510..a6449a2ad861de 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -2086,7 +2086,7 @@ static const struct address_space_operations zsmalloc_aops = {
>  
>  static int zs_register_migration(struct zs_pool *pool)
>  {
> -	pool->inode = alloc_anon_inode(zsmalloc_mnt->mnt_sb);
> +	pool->inode = alloc_anon_inode_sb(zsmalloc_mnt->mnt_sb);
>  	if (IS_ERR(pool->inode)) {
>  		pool->inode = NULL;
>  		return 1;
> -- 
> 2.30.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
