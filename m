Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28B3C5E19
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673E689BF6;
	Mon, 12 Jul 2021 14:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F8389BF6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:14:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g12so3691355wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=X9ksLjijj4PvC3tEBTsoOM0OG8Dvo4X/GyskK/FnWa8=;
 b=F3Z+DPrDdGzSV9c+RuBJG0iKfgSZgS74IwBCTJwCDRmH2o1KPhPERQXC+LeioLgajl
 5l1zMgsRM2ZiWIIW5Y3qulDNAm5qvTbBkeylbcQFR9IOnwC2d8tC5Mdy5+tn5r+Mk0C4
 6JHMXTGy+oV9f4FjpqHpn4Ba67S+m1c1D58rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X9ksLjijj4PvC3tEBTsoOM0OG8Dvo4X/GyskK/FnWa8=;
 b=UWEZ0N1TqlgGoteVksdyxD8QjIyIcUqMf3Nrzp67impKuO6QN/tU6A2N2yddOZJAn5
 qXwbl9P918EdbCRAVG7JL5g4B28w36blj0nXjMrGjCTBxX2LNmb/ephAUdS4al8uu/sp
 6753dY8SHq6JHK74p+DykUEVVmQSaSi/XIFkhgF3M1qpS3ASB0T+qdFSZyIvDZ55m/Jz
 kpuYZ6KJ4uDM+ldFuC3sMuPhkfmGUnJzHwB24ZcDKq5+Kt6dp33gM3lavMnmnEGzY7Ew
 W5asyLoFbSyW3w6PXNI/+XG4z/IJWWLU3HGb1ynp49vd4SeYVw2/eoBfmtCkxLraGevo
 LXWA==
X-Gm-Message-State: AOAM5337y+arQt1CajkTdq9TGvRARrBd7dJS/zLK0RxwRMrZ4Tk36ZbJ
 RKsE5ITS3BUIHoV70tvGcN7dag==
X-Google-Smtp-Source: ABdhPJxttXD1E9ocC0OyqBntoze/XFUY5AeeinLq8rphWJ0cZ2gGWdBn6X8vQzVi7WO+Fz4kEPizGQ==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr54126395wmh.183.1626099272079; 
 Mon, 12 Jul 2021 07:14:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm19876926wmq.48.2021.07.12.07.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:14:30 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:14:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vgem: Restore mmap functionality
Message-ID: <YOxORPbvfM9JmroY@phenom.ffwll.local>
References: <20210709114731.31467-1-tzimmermann@suse.de>
 <CAKMK7uGyQ5Z+o4LB8KvRgACvKDDL5Ymo3Wp6TRJ9+3kEnCi2RQ@mail.gmail.com>
 <39d3ed07-3868-3d21-9ecb-78a1e226668d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39d3ed07-3868-3d21-9ecb-78a1e226668d@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Dave Airlie <airlied@linux.ie>, Qinglang Miao <miaoqinglang@huawei.com>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lee Jones <lee.jones@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 09:09:24AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.07.21 um 16:43 schrieb Daniel Vetter:
> > On Fri, Jul 9, 2021 at 1:47 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > 
> > > Commit 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
> > > accidentally removed the actual mmap functionality from vgem. Restore
> > > the original implementation and VMA flags.
> > 
> > Ah yes that explains things.
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Apparently, this fix fails a number of other tests. [1] Can we revert the
> original patch for now? I'd like to have time to investigate.

Uh yes something funny is going on here. I've also beent trying to debug
my conversion of vgem to shmem helpers, and been hitting lots of strange
bugs (but the ones I debugged thus far were all real issues, and resulted
in shmem helper fixes).

So yeah, on the revert:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Please include discussions and links to your patch here and CI results in
the commit message, so that we have a better starting point for the next
attempt.
-Daniel

> 
> Best regards
> Thomas
> 
> 
> [1] https://lore.kernel.org/intel-gfx/20210709154256.12005-1-tzimmermann@suse.de/T/#maa12be2a6d4b6a4ed8cb05e98f00b8955638c518
> 
> > > 
> > > Fixes access to unmapped memory:
> > > 
> > > [  106.591744] BUG: KASAN: vmalloc-out-of-bounds in do_fault+0x38/0x480
> > > [  106.598154] Read of size 8 at addr ffffffffc10c44a8 by task vgem_basic/1514
> > > [  106.605173]
> > > [  106.606678] CPU: 1 PID: 1514 Comm: vgem_basic Tainted: G            E     5.13.0-1-default+ #990
> > > [  106.615535] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24 10/24/2018
> > > [  106.622818] Call Trace:
> > > [  106.625289]  dump_stack+0xa5/0xdc
> > > [  106.628642]  print_address_description.constprop.0+0x18/0x100
> > > [  106.634439]  ? do_fault+0x38/0x480
> > > [  106.637872]  kasan_report.cold+0x7c/0xd8
> > > [  106.641834]  ? do_fault+0x38/0x480
> > > [  106.645274]  do_fault+0x38/0x480
> > > [  106.648535]  __handle_mm_fault+0x935/0xb00
> > > [  106.652676]  ? vm_iomap_memory+0xe0/0xe0
> > > [  106.656634]  ? __lock_release+0x12f/0x4e0
> > > [  106.660696]  ? count_memcg_event_mm.part.0+0xb9/0x190
> > > [  106.665799]  handle_mm_fault+0xd0/0x370
> > > [  106.669675]  do_user_addr_fault+0x2a0/0x8c0
> > > [  106.673908]  exc_page_fault+0x64/0xf0
> > > [  106.677604]  ? asm_exc_page_fault+0x8/0x30
> > > [  106.681739]  asm_exc_page_fault+0x1e/0x30
> > > [  106.685782] RIP: 0033:0x402e12
> > > ...
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Fixes: 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >   drivers/gpu/drm/vgem/vgem_drv.c | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> > > index df634aa52638..f50fd10c4fad 100644
> > > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > > @@ -364,8 +364,17 @@ static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *ma
> > > 
> > >   static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> > >   {
> > > +       int ret;
> > > +
> > > +       if (!obj->filp)
> > > +               return -ENODEV;
> > > +
> > > +       ret = call_mmap(obj->filp, vma);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > >          vma_set_file(vma, obj->filp);
> > > -       vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
> > > +       vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
> > >          vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> > >          vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> > > 
> > > --
> > > 2.32.0
> > > 
> > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
