Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB728637E4C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 18:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C4110E0C1;
	Thu, 24 Nov 2022 17:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA5F10E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 17:24:57 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v8so3369390edi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=as9Sa6/qVI3+/y7NJpGwdIv8QM7aizQ3unCaNrYybz0=;
 b=Z2bCLn/3YqlCo/Fh42QN+QMEP3ZImS8JqZp/LLNRbmmFFGcyAJFHBvt1YpZ8XKeY4e
 ZcSTiHrQ7GAKMAqz9SmI8zWNB2JaZNRl3IivFR0sKIDKEBrVUYbLHB0Whe44xlDktIYm
 ikKjGw8e2vi8WJy/p/QYSucDrK1jgdOj5WbQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=as9Sa6/qVI3+/y7NJpGwdIv8QM7aizQ3unCaNrYybz0=;
 b=nW9ATIoFcpAO2s3cq04Hvs7pc4xa5AS8rCk5rAyQYtM1raEkqNqYxY5TlPQn1dZFsg
 vnixFhkMFw9zc0j4CoFmYUNAki1X74Q9iuBLFp4JGqKNsfh5Un4lr9iRGYWHdeRR5qZT
 Pt0m2jES+5pW/Cvg0mSQWNafl6J+ZGZyB9YxGPIIkQTK3r+H5KQox9l+KyMILuzbdvrT
 N0ck49q6qlhViUJji6rOkIsDPqug1N3RbXYmAZl1lOTjy4LnVLedyVZrOxYs0cjDX0pW
 r9HFAJwmTK8V138U9pXWkyTSq9jjmJvpUn8pRNpOqMfcTm6uFnf/Cje2guEmQoZvTnrl
 7LtQ==
X-Gm-Message-State: ANoB5plGY0rYvqJUDubymXe0FCAbv7qz8yMvNaGbX9zKNzAmB9uUG3vE
 5fkIBAVjJRvW80g3Luh1mpDJbw==
X-Google-Smtp-Source: AA0mqf7sVs2dFhWjgJ6bRO16FON1t5KF7A+ZP3tb/HtqZeCJBbxz3kgISRUTU6thq90hAJIr/BHi+w==
X-Received: by 2002:a50:fd0d:0:b0:469:c73c:e29a with SMTP id
 i13-20020a50fd0d000000b00469c73ce29amr16296541eds.423.1669310695466; 
 Thu, 24 Nov 2022 09:24:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b7-20020a17090630c700b0077a11b79b9bsm625966ejb.133.2022.11.24.09.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 09:24:54 -0800 (PST)
Date: Thu, 24 Nov 2022 18:24:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/dma-helpers: Don't change vma flags
Message-ID: <Y3+o5GCM+9GeKx64@phenom.ffwll.local>
References: <20221123172802.1049424-1-daniel.vetter@ffwll.ch>
 <49605c31-be89-d0f9-b4e1-577aaaaf259a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49605c31-be89-d0f9-b4e1-577aaaaf259a@arm.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 11:11:21AM +0000, Robin Murphy wrote:
> On 2022-11-23 17:28, Daniel Vetter wrote:
> > This code was added in b65e64f7ccd4 ("drm/cma: Use
> > dma_mmap_writecombine() to mmap buffer"), but does not explain why
> > it's needed.
> > 
> > It should be entirely unnecessary, because remap_pfn_range(), which is
> > what the various dma_mmap functiosn are built on top of, does already
> > unconditionally adjust the vma flags:
> 
> Not all dma_mmap_*() implementations use remap_pfn_range() though. For
> instance on ARM where one set of DMA ops uses vm_map_pages(), but AFAICS not
> all the relevant drivers would set VM_MIXEDMAP to prevent reaching the
> BUG_ON(vma->vm_flags & VM_PFNMAP) in there.

Uh a dma_mmap which does not use VM_PFNMAP has pretty good chances of
being busted, since that allows get_user_pages on these memory
allocations. And I'm really not sure that's a bright idea ...

Can you please point me at these dma-ops so that I can try and understand
what they're trying to do?
-Daniel

> 
> Robin.
> 
> > https://elixir.bootlin.com/linux/v6.1-rc6/source/mm/memory.c#L2518
> > 
> > More importantly, it does uncondtionally set VM_PFNMAP, so clearing
> > that does not make much sense.
> > 
> > Patch motived by discussions around enforcing VM_PFNMAP semantics for
> > all dma-buf users, where Thomas asked why dma helpers will work with
> > that dma_buf_mmap() contract.
> > 
> > References: https://lore.kernel.org/dri-devel/5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de/
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >   drivers/gpu/drm/drm_gem_dma_helper.c | 7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> > index 1e658c448366..637a5cc62457 100644
> > --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> > @@ -525,13 +525,10 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
> >   	int ret;
> >   	/*
> > -	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
> > -	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
> > -	 * the whole buffer.
> > +	 * Set the vm_pgoff (used as a fake buffer offset by DRM) to 0 as we
> > +	 * want to map the whole buffer.
> >   	 */
> >   	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
> > -	vma->vm_flags &= ~VM_PFNMAP;
> > -	vma->vm_flags |= VM_DONTEXPAND;
> >   	if (dma_obj->map_noncoherent) {
> >   		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
