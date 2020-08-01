Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19223516E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 11:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07AC6EB6B;
	Sat,  1 Aug 2020 09:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471226EB6B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 09:28:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k20so11213988wmi.5
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 02:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=B1mN8564CaEdT6pvNLdTQVULf9KDq5pz1XDgMNRT910=;
 b=FQWoRHd0BcdiPCnL0D1+eDAcsOwi/+aB/kW6re4TQ9GEE/gFZM5ydnGpwRDSrDlrAA
 vE0Wb+vjJ9Qa6Tjt6BO4Zc05tLLyCzxh84eji37m0Taf1AdZ3BO14tjJY2ee7RsDgFDs
 GJekNUCfYRMTgVsh3myjZM5euGCL5c+nSJHuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=B1mN8564CaEdT6pvNLdTQVULf9KDq5pz1XDgMNRT910=;
 b=szf30cO127nbpNGstK51zExSaUMSRoM8KrZb7KcBELZvVdDK0NFhtTtq3aYO9WZlod
 WtUYyf7+vgflbgwLcl+c3K/WGORD0ZXvYP0zcBC0KyRU+QjgpZ32VMz0xG+vMdlQYvNE
 7qevNA4sG2v6qJNO183bWuSE4Un5xV+TQAP6mPCyunL0d8yobfeTDBAPqLD2r5oZo4Op
 NvZyop9fZ7ZepCxBRrqTDz5dCMKCr8YoQV5yT9RDKHVjvtILRJUJk/B/RxoMuHVaijBZ
 r/Lx93zhsVq/wNOrGUAWZPQT7E+34rzJ7Teolh+zHW02YQKkQntuMuHeH+vlmVAGZKUl
 o22g==
X-Gm-Message-State: AOAM531joh9rzNrDyXaqZYspUV2ti2FZcOC7FHuBBZSmfBcYgiGqyq6o
 oERsb0lw91ZDZhHjcApN9KAZ0Q==
X-Google-Smtp-Source: ABdhPJzqoZg7QECsMjE4NgtabggJaa5B2EruQyl1cEAXPJlRrt1l/dIdNlAH17f9MEC0un6QR2wXyw==
X-Received: by 2002:a1c:81c7:: with SMTP id c190mr7918789wmd.129.1596274082956; 
 Sat, 01 Aug 2020 02:28:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a10sm15857494wrx.15.2020.08.01.02.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 02:28:02 -0700 (PDT)
Date: Sat, 1 Aug 2020 11:28:00 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] vgaarb: mark vga_tryget static
Message-ID: <20200801092800.GE6419@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200801061713.307434-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801061713.307434-1-hch@lst.de>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 01, 2020 at 08:17:13AM +0200, Christoph Hellwig wrote:
> This symbols isn't used anywhere outside of vgaarb.c.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice catch, patch queued up for 5.9.

Thanks, Daniel

> ---
>  drivers/gpu/vga/vgaarb.c | 3 +--
>  include/linux/vgaarb.h   | 6 ------
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> index f2f3ef8af2710f..5180c5687ee530 100644
> --- a/drivers/gpu/vga/vgaarb.c
> +++ b/drivers/gpu/vga/vgaarb.c
> @@ -529,7 +529,7 @@ EXPORT_SYMBOL(vga_get);
>   *
>   * 0 on success, negative error code on failure.
>   */
> -int vga_tryget(struct pci_dev *pdev, unsigned int rsrc)
> +static int vga_tryget(struct pci_dev *pdev, unsigned int rsrc)
>  {
>  	struct vga_device *vgadev;
>  	unsigned long flags;
> @@ -554,7 +554,6 @@ int vga_tryget(struct pci_dev *pdev, unsigned int rsrc)
>  	spin_unlock_irqrestore(&vga_lock, flags);
>  	return rc;
>  }
> -EXPORT_SYMBOL(vga_tryget);
>  
>  /**
>   * vga_put - release lock on legacy VGA resources
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index 553b34c8b5f700..977caf96c8d2a3 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -109,12 +109,6 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
>         return vga_get(pdev, rsrc, 0);
>  }
>  
> -#if defined(CONFIG_VGA_ARB)
> -extern int vga_tryget(struct pci_dev *pdev, unsigned int rsrc);
> -#else
> -static inline int vga_tryget(struct pci_dev *pdev, unsigned int rsrc) { return 0; }
> -#endif
> -
>  #if defined(CONFIG_VGA_ARB)
>  extern void vga_put(struct pci_dev *pdev, unsigned int rsrc);
>  #else
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
