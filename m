Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C5F338F89
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACCC6EBD0;
	Fri, 12 Mar 2021 14:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9885C6E10C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:12:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o26so3889782wmc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=FS8E3QfSbLNuEUx0oGFG0GGmNvYIycOcmcrDH3zq20s=;
 b=EpXn29ELHwyLOmSmA0dpAkvkzt6uQd+2W1sVUIUHPfGbws8JaoUARChu8bwZ+ySzEi
 nCr0fmdzZQeLZKtpf+sy93qveuEeBtDIH1nlt0EaWvvaxRUMiX+UBQeY9QSHzzh7fC1w
 qkTT5+yV7aj5TuQgL7jb9WbbOMqqtVTntSsrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=FS8E3QfSbLNuEUx0oGFG0GGmNvYIycOcmcrDH3zq20s=;
 b=ExCsJaeJeFEdelPnS21Vfvv6uYbfU03r+G3ZGT0bfOeEPgTC2COqWFj6sFOuLLQvRj
 AOvOSskpxH9yqZOovC5/zmWYanO7GAsrijjHeQrbgZEULsGikghOcyhDtYSe9fEddU4h
 BP7r+9WWLVAGMeftAr/DcUQ9LJAoy/NlDyIyZQtr7R0OOaC8XnD8kuFMSmpio4Hw1Ofe
 crYS8oGMzufo6FVQsRqqKObLbTNeVNESA2ouy09BuW9v7APvRjE8AsWeNt11bGYeADlm
 fO5eLtDaEohQ8a8McRQcLh0cHtB8t3DH/gLWFCnH7mXILxhrz29C+whg8ctfGffZsI7z
 TAhw==
X-Gm-Message-State: AOAM530J4XeonXgSWtpKSUwWNYhQNO8VgAjh+feoTWzDEdxRbe8NIQmv
 83pE7RpI8k13xgAR6h1WWFbzMzJ5dEI2djFx
X-Google-Smtp-Source: ABdhPJx9JKGvYeYalS8uchoaPC4Epklh6gjPywXF2S3wgfsIQjVglkf/531Kk5D6ZMHgJxr/FEKZgg==
X-Received: by 2002:a1c:1bc7:: with SMTP id
 b190mr13478032wmb.115.1615558350171; 
 Fri, 12 Mar 2021 06:12:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k4sm10360878wrd.9.2021.03.12.06.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:12:29 -0800 (PST)
Date: Fri, 12 Mar 2021 15:12:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2] fb_defio: Remove custom address_space_operations
Message-ID: <YEt2y4QqnanHHviZ@phenom.ffwll.local>
Mail-Followup-To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ian Campbell <ijc@hellion.org.uk>,
 linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>,
 Christoph Hellwig <hch@lst.de>
References: <20210310185530.1053320-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310185530.1053320-1-willy@infradead.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, linux-mm@kvack.org,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 William Kucharski <william.kucharski@oracle.com>,
 Ian Campbell <ijc@hellion.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 06:55:30PM +0000, Matthew Wilcox (Oracle) wrote:
> There's no need to give the page an address_space.  Leaving the
> page->mapping as NULL will cause the VM to handle set_page_dirty()
> the same way that it's handled now, and that was the only reason to
> set the address_space in the first place.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>

Thanks for your patch, merged to drm-misc-next for 5.13.

While I have an expert here, does this mean that for a VM_PFNMAP we could
pull of the same trick without any struct page backing, assuming we pulle
the per-page dirty state into some tracking of our own?

I'm asking since for DRM drivers we currently have a fairly awkward
situation with a bounce buffer in system memory going on that we copy out
of, because we can't directly use the gpu buffers. If we can track
directly in the gpu buffers, maybe even as some kind of overlay over the
vma, we could avoid that copy.

Otoh no one cares about fbcon performance, so *shrug*.

Cheers, Daniel

> ---
> v2: Delete local variable definitions
>  drivers/video/fbdev/core/fb_defio.c | 35 -----------------------------
>  drivers/video/fbdev/core/fbmem.c    |  4 ----
>  include/linux/fb.h                  |  3 ---
>  3 files changed, 42 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index a591d291b231..b292887a2481 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -52,13 +52,6 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>  		return VM_FAULT_SIGBUS;
>  
>  	get_page(page);
> -
> -	if (vmf->vma->vm_file)
> -		page->mapping = vmf->vma->vm_file->f_mapping;
> -	else
> -		printk(KERN_ERR "no mapping available\n");
> -
> -	BUG_ON(!page->mapping);
>  	page->index = vmf->pgoff;
>  
>  	vmf->page = page;
> @@ -151,17 +144,6 @@ static const struct vm_operations_struct fb_deferred_io_vm_ops = {
>  	.page_mkwrite	= fb_deferred_io_mkwrite,
>  };
>  
> -static int fb_deferred_io_set_page_dirty(struct page *page)
> -{
> -	if (!PageDirty(page))
> -		SetPageDirty(page);
> -	return 0;
> -}
> -
> -static const struct address_space_operations fb_deferred_io_aops = {
> -	.set_page_dirty = fb_deferred_io_set_page_dirty,
> -};
> -
>  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  {
>  	vma->vm_ops = &fb_deferred_io_vm_ops;
> @@ -212,29 +194,12 @@ void fb_deferred_io_init(struct fb_info *info)
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_init);
>  
> -void fb_deferred_io_open(struct fb_info *info,
> -			 struct inode *inode,
> -			 struct file *file)
> -{
> -	file->f_mapping->a_ops = &fb_deferred_io_aops;
> -}
> -EXPORT_SYMBOL_GPL(fb_deferred_io_open);
> -
>  void fb_deferred_io_cleanup(struct fb_info *info)
>  {
>  	struct fb_deferred_io *fbdefio = info->fbdefio;
> -	struct page *page;
> -	int i;
>  
>  	BUG_ON(!fbdefio);
>  	cancel_delayed_work_sync(&info->deferred_work);
> -
> -	/* clear out the mapping that we setup */
> -	for (i = 0 ; i < info->fix.smem_len; i += PAGE_SIZE) {
> -		page = fb_deferred_io_page(info, i);
> -		page->mapping = NULL;
> -	}
> -
>  	mutex_destroy(&fbdefio->lock);
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 06f5805de2de..372b52a2befa 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1415,10 +1415,6 @@ __releases(&info->lock)
>  		if (res)
>  			module_put(info->fbops->owner);
>  	}
> -#ifdef CONFIG_FB_DEFERRED_IO
> -	if (info->fbdefio)
> -		fb_deferred_io_open(info, inode, file);
> -#endif
>  out:
>  	unlock_fb_info(info);
>  	if (res)
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index ecfbcc0553a5..a8dccd23c249 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -659,9 +659,6 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
>  /* drivers/video/fb_defio.c */
>  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
>  extern void fb_deferred_io_init(struct fb_info *info);
> -extern void fb_deferred_io_open(struct fb_info *info,
> -				struct inode *inode,
> -				struct file *file);
>  extern void fb_deferred_io_cleanup(struct fb_info *info);
>  extern int fb_deferred_io_fsync(struct file *file, loff_t start,
>  				loff_t end, int datasync);
> -- 
> 2.30.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
