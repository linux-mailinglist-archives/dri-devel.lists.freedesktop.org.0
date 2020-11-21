Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDAB2BC03F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 16:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9F46E9C3;
	Sat, 21 Nov 2020 15:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D3E89C52
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 14:54:44 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id ec16so6232934qvb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rotW7tt4m5jTt2NSPYd12LYOUVPQuE9OKHf8G7kqiZw=;
 b=A28kXqD14Gz6l1jwtw6TdX3Q6L06mzBAA4VOxdyHmpzEzqm3LV9ZyWkchMHjHZ4pJS
 U3g9XWrEVI4yBYhyX9So24km2qlwMoBgod6t7/QppG9nCogKEW93S8AhMaKFiZu0NUI1
 PkP2RaT8f1fT4nphnyeL17LYvSR6TT+sJHfmfW4s/w58I3HI6Jy9fgA36ambX9bRgsZ6
 o/+86WFDNZZupNmHNnLM+xO9DHhyEsSEAGdCIcn0kM2JGTEg440Xie9q/vB+91UhBdRD
 WGiY+BXep9Z61ppu1kPDganKC1QH4LZ+5/+/walt8nPUgg76cJOTFCWUs8j2eLIp7LEO
 3I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rotW7tt4m5jTt2NSPYd12LYOUVPQuE9OKHf8G7kqiZw=;
 b=tYDjzOSKPl5FoOrMoqoYdz+hYyQObzJC2iMyaKFrK+jGu9ps/+42Zlk+yDTWG5BGBU
 wM3e+833a9xILDomRncjJ3vfP3BfdY/GyGhE3s8Vg/Ge0xLowwu/127/1qDGjqbvcd6L
 /6BflYUhVBdeT9BnA4fOixxiFDrypCX/jmFk5PeHijGhFiH7C0+v4EEYPTat+CNOQQ1p
 HahJTtJPJt7Snd2dc5mmbVJZdozndDZYIda2Ex1Yuy6Oj/Va2Mp/NGETjXxdaNQb56GO
 H5FRxeEn3yal7UbL9Z51l7Vku7fEqPPujqwcCvmukGSjJOOTGdFW1+oc8d5rIWc/ttx8
 0o+Q==
X-Gm-Message-State: AOAM532yZ5M7dxSccbMzBBTmuaZG5AXSBRQfuaX9jsoR1xl76RA8fRbf
 iM+M7eYg/3HCy4Py6p2iThE=
X-Google-Smtp-Source: ABdhPJyaROsfol3G15/G2X0fakOYPjz+m40sZbrxS1WjiIAqgV9KM1mdHzo9zyDNeQvgK40N3T9sJQ==
X-Received: by 2002:a0c:9e20:: with SMTP id p32mr21272640qve.44.1605970483006; 
 Sat, 21 Nov 2020 06:54:43 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id r190sm3937548qkf.101.2020.11.21.06.54.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Nov 2020 06:54:42 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 499B827C0054;
 Sat, 21 Nov 2020 09:54:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 21 Nov 2020 09:54:40 -0500
X-ME-Sender: <xms:Lyq5X0BeJMpVMNv0jTlactffGziLvzaXSwTkH0aRsaGVxs8JEwL_5A>
 <xme:Lyq5X2i9H2lW7IV3Zyf4kC6sTB2B93dSS2sn3I1PX06jKK5DPKTWdc03TGBJLqU2j
 CPFPNrNKpQsA1USuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegvddgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepveeijedthfeijeefudehhedvveegudegteehgffgtddvuedtveegtedvvdef
 gedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudeijedrvddvtddrvd
 druddvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtd
 eigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehf
 ihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:Lyq5X3lt7wnTRedTToBykKwW_AefAv5rVipG3-Pal9AonHu8LcZ_aQ>
 <xmx:Lyq5X6y-u3Vp4WQZPs-zATNhQd7a8oWqDdnEfNgYO5xTTeKQsTU-Mw>
 <xmx:Lyq5X5R7Evk7glgMX306Z6fnxkqI5u4O-u7-y3CzOLC2F-JTTtoCmA>
 <xmx:MCq5X-IaH3LW1UbpObJkdG6JjgGNltPaGn1YdDXJRWF7s-3Pitcj2q23ELg>
Received: from localhost (unknown [167.220.2.126])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F512328005A;
 Sat, 21 Nov 2020 09:54:39 -0500 (EST)
Date: Sat, 21 Nov 2020 22:54:11 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH] video: hyperv_fb: Directly use the MMIO VRAM
Message-ID: <20201121145411.GG3025@boqun-archlinux>
References: <20201121014547.54890-1-decui@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201121014547.54890-1-decui@microsoft.com>
X-Mailman-Approved-At: Sat, 21 Nov 2020 15:30:28 +0000
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, b.zolnierkie@samsung.com,
 haiyangz@microsoft.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, weh@microsoft.com, kys@microsoft.com,
 mikelley@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dexuan,

On Fri, Nov 20, 2020 at 05:45:47PM -0800, Dexuan Cui wrote:
> Late in 2019, 2 commits (see the 2 Fixes tags) were introduced to
> mitigate the slow framebuffer issue. Now that we have fixed the
> slowness issue by correctly mapping the MMIO VRAM (see
> commit 5f1251a48c17 ("video: hyperv_fb: Fix the cache type when mapping
> the VRAM")), we can remove most of the code introduced by the 2 commits,
> i.e. we no longer need to allocate physical memory and use it to back up
> the VRAM in Generation-1 VM, and we also no longer need to allocate
> physical memory to back up the framebuffer in a Generation-2 VM and copy
> the framebuffer to the real VRAM.
> 
> synthvid_deferred_io() is kept, because it's still desirable to send the
> SYNTHVID_DIRT message only for the exact dirty rectangle, and only when
> needed.
> 
> Fixes: d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
> Fixes: 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")
> Cc: Wei Hu <weh@microsoft.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Dexuan Cui <decui@microsoft.com>

After I applied this patch and patch ("video: hyperv_fb: Fix the cache
type when mapping the VRAM") on my development branch (with Michael's
patchset for ARM64 core support on Hyper-V), and everything worked fine.
So feel free to add:

Tested-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Bqoun

> ---
> 
> This patch changes drivers/video/fbdev/Kconfig, but I hope this can
> still go through the Hyper-V tree
> https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/log/?h=hyperv-next
> because it's unlikely to cause any build issue to other fbdev drivers
> (that line was introduced by 3a6fb6c4255c only for hyperv_fb.c)
> 
> Note: this patch is based on the Hyper-V tree's hyperv-fixes branch, but
> it should also apply cleanly to the branch hyperv-next if the commit
> 5f1251a48c17 is applied first.  This patch is for v5.11 rather than
> v5.10.
> 
>  drivers/video/fbdev/Kconfig     |   1 -
>  drivers/video/fbdev/hyperv_fb.c | 170 ++------------------------------
>  2 files changed, 9 insertions(+), 162 deletions(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 402e85450bb5..05b37fb3c6d6 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2205,7 +2205,6 @@ config FB_HYPERV
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
>  	select FB_DEFERRED_IO
> -	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
>  	help
>  	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
>  
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 58c74d2356ba..8131f4e66f98 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -31,16 +31,6 @@
>   * "set-vmvideo" command. For example
>   *     set-vmvideo -vmname name -horizontalresolution:1920 \
>   * -verticalresolution:1200 -resolutiontype single
> - *
> - * Gen 1 VMs also support direct using VM's physical memory for framebuffer.
> - * It could improve the efficiency and performance for framebuffer and VM.
> - * This requires to allocate contiguous physical memory from Linux kernel's
> - * CMA memory allocator. To enable this, supply a kernel parameter to give
> - * enough memory space to CMA allocator for framebuffer. For example:
> - *    cma=130m
> - * This gives 130MB memory to CMA allocator that can be allocated to
> - * framebuffer. For reference, 8K resolution (7680x4320) takes about
> - * 127MB memory.
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -267,16 +257,8 @@ struct hvfb_par {
>  	/* If true, the VSC notifies the VSP on every framebuffer change */
>  	bool synchronous_fb;
>  
> -	/* If true, need to copy from deferred IO mem to framebuffer mem */
> -	bool need_docopy;
> -
>  	struct notifier_block hvfb_panic_nb;
>  
> -	/* Memory for deferred IO and frame buffer itself */
> -	unsigned char *dio_vp;
> -	unsigned char *mmio_vp;
> -	phys_addr_t mmio_pp;
> -
>  	/* Dirty rectangle, protected by delayed_refresh_lock */
>  	int x1, y1, x2, y2;
>  	bool delayed_refresh;
> @@ -405,21 +387,6 @@ synthvid_update(struct fb_info *info, int x1, int y1, int x2, int y2)
>  	return 0;
>  }
>  
> -static void hvfb_docopy(struct hvfb_par *par,
> -			unsigned long offset,
> -			unsigned long size)
> -{
> -	if (!par || !par->mmio_vp || !par->dio_vp || !par->fb_ready ||
> -	    size == 0 || offset >= dio_fb_size)
> -		return;
> -
> -	if (offset + size > dio_fb_size)
> -		size = dio_fb_size - offset;
> -
> -	memcpy(par->mmio_vp + offset, par->dio_vp + offset, size);
> -}
> -
> -/* Deferred IO callback */
>  static void synthvid_deferred_io(struct fb_info *p,
>  				 struct list_head *pagelist)
>  {
> @@ -444,10 +411,6 @@ static void synthvid_deferred_io(struct fb_info *p,
>  		y2 = end / p->fix.line_length;
>  		miny = min_t(int, miny, y1);
>  		maxy = max_t(int, maxy, y2);
> -
> -		/* Copy from dio space to mmio address */
> -		if (par->fb_ready && par->need_docopy)
> -			hvfb_docopy(par, start, PAGE_SIZE);
>  	}
>  
>  	if (par->fb_ready && par->update)
> @@ -704,7 +667,7 @@ static int synthvid_send_config(struct hv_device *hdev)
>  	msg->vid_hdr.type = SYNTHVID_VRAM_LOCATION;
>  	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
>  		sizeof(struct synthvid_vram_location);
> -	msg->vram.user_ctx = msg->vram.vram_gpa = par->mmio_pp;
> +	msg->vram.user_ctx = msg->vram.vram_gpa = info->fix.smem_start;
>  	msg->vram.is_vram_gpa_specified = 1;
>  	synthvid_send(hdev, msg);
>  
> @@ -714,7 +677,7 @@ static int synthvid_send_config(struct hv_device *hdev)
>  		ret = -ETIMEDOUT;
>  		goto out;
>  	}
> -	if (msg->vram_ack.user_ctx != par->mmio_pp) {
> +	if (msg->vram_ack.user_ctx != info->fix.smem_start) {
>  		pr_err("Unable to set VRAM location\n");
>  		ret = -ENODEV;
>  		goto out;
> @@ -740,7 +703,6 @@ static void hvfb_update_work(struct work_struct *w)
>  	struct fb_info *info = par->info;
>  	unsigned long flags;
>  	int x1, x2, y1, y2;
> -	int j;
>  
>  	spin_lock_irqsave(&par->delayed_refresh_lock, flags);
>  	/* Reset the request flag */
> @@ -762,14 +724,6 @@ static void hvfb_update_work(struct work_struct *w)
>  	    y1 > info->var.yres || y2 > info->var.yres || x2 <= x1)
>  		return;
>  
> -	/* Copy the dirty rectangle to frame buffer memory */
> -	if (par->need_docopy)
> -		for (j = y1; j < y2; j++)
> -			hvfb_docopy(par,
> -				    j * info->fix.line_length +
> -				    (x1 * screen_depth / 8),
> -				    (x2 - x1) * screen_depth / 8);
> -
>  	/* Refresh */
>  	if (par->fb_ready && par->update)
>  		synthvid_update(info, x1, y1, x2, y2);
> @@ -813,8 +767,6 @@ static int hvfb_on_panic(struct notifier_block *nb,
>  	par = container_of(nb, struct hvfb_par, hvfb_panic_nb);
>  	par->synchronous_fb = true;
>  	info = par->info;
> -	if (par->need_docopy)
> -		hvfb_docopy(par, 0, dio_fb_size);
>  	synthvid_update(info, 0, 0, INT_MAX, INT_MAX);
>  
>  	return NOTIFY_DONE;
> @@ -953,62 +905,6 @@ static void hvfb_get_option(struct fb_info *info)
>  	return;
>  }
>  
> -/*
> - * Allocate enough contiguous physical memory.
> - * Return physical address if succeeded or -1 if failed.
> - */
> -static phys_addr_t hvfb_get_phymem(struct hv_device *hdev,
> -				   unsigned int request_size)
> -{
> -	struct page *page = NULL;
> -	dma_addr_t dma_handle;
> -	void *vmem;
> -	phys_addr_t paddr = 0;
> -	unsigned int order = get_order(request_size);
> -
> -	if (request_size == 0)
> -		return -1;
> -
> -	if (order < MAX_ORDER) {
> -		/* Call alloc_pages if the size is less than 2^MAX_ORDER */
> -		page = alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
> -		if (!page)
> -			return -1;
> -
> -		paddr = (page_to_pfn(page) << PAGE_SHIFT);
> -	} else {
> -		/* Allocate from CMA */
> -		hdev->device.coherent_dma_mask = DMA_BIT_MASK(64);
> -
> -		vmem = dma_alloc_coherent(&hdev->device,
> -					  round_up(request_size, PAGE_SIZE),
> -					  &dma_handle,
> -					  GFP_KERNEL | __GFP_NOWARN);
> -
> -		if (!vmem)
> -			return -1;
> -
> -		paddr = virt_to_phys(vmem);
> -	}
> -
> -	return paddr;
> -}
> -
> -/* Release contiguous physical memory */
> -static void hvfb_release_phymem(struct hv_device *hdev,
> -				phys_addr_t paddr, unsigned int size)
> -{
> -	unsigned int order = get_order(size);
> -
> -	if (order < MAX_ORDER)
> -		__free_pages(pfn_to_page(paddr >> PAGE_SHIFT), order);
> -	else
> -		dma_free_coherent(&hdev->device,
> -				  round_up(size, PAGE_SIZE),
> -				  phys_to_virt(paddr),
> -				  paddr);
> -}
> -
>  
>  /* Get framebuffer memory from Hyper-V video pci space */
>  static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
> @@ -1018,7 +914,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  	void __iomem *fb_virt;
>  	int gen2vm = efi_enabled(EFI_BOOT);
>  	resource_size_t pot_start, pot_end;
> -	phys_addr_t paddr;
>  	int ret;
>  
>  	info->apertures = alloc_apertures(1);
> @@ -1036,38 +931,12 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  
>  		info->apertures->ranges[0].base = pci_resource_start(pdev, 0);
>  		info->apertures->ranges[0].size = pci_resource_len(pdev, 0);
> -
> -		/*
> -		 * For Gen 1 VM, we can directly use the contiguous memory
> -		 * from VM. If we succeed, deferred IO happens directly
> -		 * on this allocated framebuffer memory, avoiding extra
> -		 * memory copy.
> -		 */
> -		paddr = hvfb_get_phymem(hdev, screen_fb_size);
> -		if (paddr != (phys_addr_t) -1) {
> -			par->mmio_pp = paddr;
> -			par->mmio_vp = par->dio_vp = __va(paddr);
> -
> -			info->fix.smem_start = paddr;
> -			info->fix.smem_len = screen_fb_size;
> -			info->screen_base = par->mmio_vp;
> -			info->screen_size = screen_fb_size;
> -
> -			par->need_docopy = false;
> -			goto getmem_done;
> -		}
> -		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
>  	} else {
>  		info->apertures->ranges[0].base = screen_info.lfb_base;
>  		info->apertures->ranges[0].size = screen_info.lfb_size;
>  	}
>  
> -	/*
> -	 * Cannot use the contiguous physical memory.
> -	 * Allocate mmio space for framebuffer.
> -	 */
> -	dio_fb_size =
> -		screen_width * screen_height * screen_depth / 8;
> +	dio_fb_size = screen_width * screen_height * screen_depth / 8;
>  
>  	if (gen2vm) {
>  		pot_start = 0;
> @@ -1101,22 +970,11 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  	if (!fb_virt)
>  		goto err2;
>  
> -	/* Allocate memory for deferred IO */
> -	par->dio_vp = vzalloc(round_up(dio_fb_size, PAGE_SIZE));
> -	if (par->dio_vp == NULL)
> -		goto err3;
> -
> -	/* Physical address of FB device */
> -	par->mmio_pp = par->mem->start;
> -	/* Virtual address of FB device */
> -	par->mmio_vp = (unsigned char *) fb_virt;
> -
>  	info->fix.smem_start = par->mem->start;
>  	info->fix.smem_len = dio_fb_size;
> -	info->screen_base = par->dio_vp;
> +	info->screen_base = fb_virt;
>  	info->screen_size = dio_fb_size;
>  
> -getmem_done:
>  	remove_conflicting_framebuffers(info->apertures,
>  					KBUILD_MODNAME, false);
>  	if (!gen2vm)
> @@ -1125,8 +983,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  
>  	return 0;
>  
> -err3:
> -	iounmap(fb_virt);
>  err2:
>  	vmbus_free_mmio(par->mem->start, screen_fb_size);
>  	par->mem = NULL;
> @@ -1139,19 +995,12 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  }
>  
>  /* Release the framebuffer */
> -static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
> +static void hvfb_putmem(struct fb_info *info)
>  {
>  	struct hvfb_par *par = info->par;
>  
> -	if (par->need_docopy) {
> -		vfree(par->dio_vp);
> -		iounmap(info->screen_base);
> -		vmbus_free_mmio(par->mem->start, screen_fb_size);
> -	} else {
> -		hvfb_release_phymem(hdev, info->fix.smem_start,
> -				    screen_fb_size);
> -	}
> -
> +	iounmap(info->screen_base);
> +	vmbus_free_mmio(par->mem->start, screen_fb_size);
>  	par->mem = NULL;
>  }
>  
> @@ -1170,7 +1019,6 @@ static int hvfb_probe(struct hv_device *hdev,
>  	par = info->par;
>  	par->info = info;
>  	par->fb_ready = false;
> -	par->need_docopy = true;
>  	init_completion(&par->wait);
>  	INIT_DELAYED_WORK(&par->dwork, hvfb_update_work);
>  
> @@ -1256,7 +1104,7 @@ static int hvfb_probe(struct hv_device *hdev,
>  
>  error:
>  	fb_deferred_io_cleanup(info);
> -	hvfb_putmem(hdev, info);
> +	hvfb_putmem(info);
>  error2:
>  	vmbus_close(hdev->channel);
>  error1:
> @@ -1286,7 +1134,7 @@ static int hvfb_remove(struct hv_device *hdev)
>  	vmbus_close(hdev->channel);
>  	hv_set_drvdata(hdev, NULL);
>  
> -	hvfb_putmem(hdev, info);
> +	hvfb_putmem(info);
>  	framebuffer_release(info);
>  
>  	return 0;
> -- 
> 2.19.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
