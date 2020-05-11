Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0D1CD781
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F0F6E438;
	Mon, 11 May 2020 11:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A26E439
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:19:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v12so10408445wrp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5BxJAM3m0NqPF1VK2+PWokzhUb1mzLpTTCKkR+44LiQ=;
 b=RAxA0wvM8QoDHGML1mbUMPKndYci1raxxYtTn7O+Zrq8YhgXDK7m+Y15YQHsAn8cZb
 kOEmNTbUxEeJqD2r4NDDOgGQ/iESR6rTF0Ni0UDRntRqlYGjILusESzGHf3+G/cqhUSm
 ZE1YffqlVLtxTzGjBjQGG0n9ynJq41QdzPAp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5BxJAM3m0NqPF1VK2+PWokzhUb1mzLpTTCKkR+44LiQ=;
 b=RftvutmnDf2zMTRu8t5sG3Kx2pABaFUgnCM8R/wuJUe8mhf8MbM5b9YBSEmc5F/wLj
 pZZ0RtYN1cyC/RaTMmHGIe3A68Gmfo41D2KFeV0OdvRCbNWS3BtA9pv1d1T9YEj5jBbO
 DI3YMRKRSbf4/a7P70XdjjywD2h24I+QQL/mnbrcPy5gRxxpzbSbT5cl15jvoVas+QEu
 xhMXj9yz7pnUKQaZcfG5UJDHp64E2P/0gVLx0WJpY+EoTb6fDkzxyE4RlgkO8+doQZdW
 GiZhMdiZKG053fAKF0yOE1xuTosbqh4t9gNAQifgOahHXn8RjnDXkQcVGpa+PKF8WkZv
 RTUw==
X-Gm-Message-State: AGi0PuZg4ydqW3KxftC0OnLPZVDnNULDnbB1B+lWqHjvG20Ti0vN5Wb6
 JWg4hrcEwF3h9QM5tgbMq9dBMQ==
X-Google-Smtp-Source: APiQypL8dcJdHuzz097XXtlby4WBcbxfOf+Yjq6IhA1aEeMCGm89alo27v2/I1zSWY50fjVAvc0J4A==
X-Received: by 2002:adf:d0c5:: with SMTP id z5mr19611873wrh.410.1589195973642; 
 Mon, 11 May 2020 04:19:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z10sm7682261wmi.2.2020.05.11.04.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 04:19:32 -0700 (PDT)
Date: Mon, 11 May 2020 13:19:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
Message-ID: <20200511111931.GD206103@phenom.ffwll.local>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511095433.GA206103@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 11:54:33AM +0200, Daniel Vetter wrote:
> On Sat, May 09, 2020 at 02:51:44PM -0400, Andrey Grodzovsky wrote:
> > This RFC is a more of a proof of concept then a fully working solution as there are a few unresolved issues we are hopping to get advise on from people on the mailing list.
> > Until now extracting a card either by physical extraction (e.g. eGPU with thunderbold connection or by emulation through syfs -> /sys/bus/pci/devices/device_id/remove) 
> > would cause random crashes in user apps. The random crashes in apps were mostly due to the app having mapped a device backed BO into it's adress space was still 
> > trying to access the BO while the backing device was gone. 
> > To answer this first problem Christian suggested to fix the handling of mapped memory in the clients when the device goes away by forcibly unmap all buffers 
> > the user processes has by clearing their respective VMAs mapping the device BOs. Then when the VMAs try to fill in the page tables again we check in the fault handler 
> > if the device is removed and if so, return an error. This will generate a SIGBUS to the application which can then cleanly terminate. 
> > This indeed was done but this in turn created a problem of kernel OOPs were the OOPSes were due to the fact that while the app was terminating because of the SIGBUS 
> > it would trigger use after free in the driver by calling to accesses device structures that were already released from the pci remove sequence. 
> > This we handled by introducing a 'flush' seqence during device removal were we wait for drm file reference to drop to 0 meaning all user clients directly using this device terminated. 
> > With this I was able to cleanly emulate device unplug with X and glxgears running and later emulate device plug back and restart of X and glxgears.
> > 
> > But this use case is only partial and as I see it all the use cases are as follwing and the questions it raises.
> > 
> > 1) Application accesses a BO by opening drm file
> > 	1.1) BO is mapped into applications address space (BO is CPU visible) - this one we have a solution for by invaldating BO's CPU mapping casuing SIGBUS 
> > 	     and termination and waiting for drm file refcound to drop to 0 before releasing the device
> > 	1.2) BO is not mapped into applcation address space (BO is CPU invisible) - no solution yet because how we force the application to terminate in this case ?
> > 
> > 2) Application accesses a BO by importing a DMA-BUF
> > 	2.1)  BO is mapped into applications address space (BO is CPU visible) - solution is same as 1.1 but instead of waiting for drm file release we wait for the 
> > 	      imported dma-buf's file release
> > 	2.2)  BO is not mapped into applcation address space (BO is CPU invisible) - our solution is to invalidate GPUVM page tables and destroy backing storage for 
> >               all exported BOs which will in turn casue VM faults in the importing device and then when the importing driver will try to re-attach the imported BO to 
> > 	      update mappings we return -ENODEV in the import hook which hopeffuly will cause the user app to terminate.
> > 
> > 3) Applcation opens a drm file or imports a dma-bud and holds a reference but never access any BO or does access but never more after device was unplug - how would we 
> >    force this applcation to termiante before proceeding with device removal code ? Otherwise the wait in pci remove just hangs for ever.
> > 
> > The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully tested and I am still testing the others but I will be happy for any advise on all the 
> > described use cases and maybe some alternative and better (more generic) approach to this like maybe obtaining PIDs of relevant processes through some revere 
> > mapping from device file and exported dma-buf files and send them SIGKILL - would this make more sense or any other method ? 
> > 
> > Patches 1-3 address 1.1
> > Patch 4 addresses 2.1
> > Pathces 5-6 address 2.2
> > 
> > Reference: https://gitlab.freedesktop.org/drm/amd/-/issues/1081
> 
> So we've been working on this problem for a few years already (but it's
> still not solved), I think you could have saved yourselfs some typing.
> 
> Bunch of things:
> - we can't wait for userspace in the hotunplug handlers, that might never
>   happen. The correct way is to untangle the lifetime of your hw driver
>   for a specific struct pci_device from the drm_device lifetime.
>   Infrastructure is all there now, see drm_dev_get/put, drm_dev_unplug and
>   drm_dev_enter/exit. A bunch of usb/spi drivers use this 100% correctly
>   now, so there's examples. Plus kerneldoc explains stuff.
> 
> - for a big driver like amdgpu doing this split up is going to be
>   horrendously complex. I know, we've done it for i915, at least
>   partially. I strongly recommend that you're using devm_ for managing hw
>   related resources (iomap, irq, ...) as much as possible.
> 
>   For drm_device resources (mostly structures and everything related to
>   that) we've just merged the drmm_ managed resources framework. There's
>   some more work to be done there for various kms objects, but you can at
>   least somewhat avoid tedious handrolling for everything internal
>   already.
> 
>   Don't ever use devm_kzalloc and friends, I've looked at hundreds of uses
>   of this in drm, they're all wrong.
> 
> - dma-buf is hilarious (and atm unfixed), dma-fence is even worse. In
>   theory they're already refcounted and all and so should work, in
>   practice I think we need to refcount the underlying drm_device with
>   drm_dev_get/put to avoid the worst fall-out.

oh I forgot one, since it's new since the last time we've seriously
discussed this: p2p dma-buf

But that /should/ be handleable with the move_notify callback. Assuming we
don't have any bugs anywhere, and the importer can indeed get rid of all
its mapping, always.

But for completeness probably need this one, just to keep it noted.
-Daniel

> 
> - One unfortunate thing with drm_dev_unplug is that the driver core is
>   very opinionated and doesn't tell you whether it's a hotunplug or a
>   driver unload. In the former case trying to shut down hw just wastes
>   time (and might hit driver bugs), in the latter case driver engineers
>   very much expect everything to be shut down.
> 
>   Right now you can only have one or the other, so this needs a module
>   option hack or similar (default to the correct hotunplug behaviour for
>   users).
> 
> - SIGBUS is better than crashing the kernel, but it's not even close for
>   users. They still lose everything because everything crashes because in
>   my experience, in practice, no one ever handles errors. There's a few
>   more things on top:
> 
>   - sighandlers are global, which means only the app can use it. You can't
>     use it in e.g. mesa. They're also not composable, so if you have on
>     sighandler for gpu1 and a 2nd one for gpu2 (could be different vendor)
>     it's all sadness. Hence "usersapce will handle SIGBUS" wont work.
> 
>   - worse, neither vk nor gl (to my knowledge) have a concept of events
>     for when the gpu died. The only stuff you have is things like
>     arb_robustness which says a) everything continues as if nothing
>     happened b) there's a function where you can ask whether your gl
>     context and all the textures/buffers are toast.
> 
>     I think that's about the only hotunplug application model we can
>     realistically expect applications to support. That means _all_ errors
>     need to be silently eaten by either mesa or the kernel. On i915 the
>     model (also for terminally wedged gpu hangs) is that all ioctl keep
>     working, mmaps keep working, and execbuf gives you an -EIO (which mesa
>     eats silently iirc for arb_robustness).
> 
>   Conclusion is that SIGBUS is imo a no-go, and the only option we have is
>   that a) mmaps fully keep working, doable for shmem or b) we put some
>   fake memory in there (for vram or whatever), maybe even only a single
>   page for all fake memory.
> 
> - you probably want arb_robustness and similar stuff in userspace as a
>   first step.
> 
> tldr;
> - refcounting, not waiting for userspace
> - nothing can fail because userspace wont handle it
> 
> That's at least my take on this mess, and what we've been pushing for over
> the past few years. For kms-only drm_driver we should have achieved that
> by now (plus/minus maybe some issues for dma-buf/fences, but kms-only
> dma-buf/fences are simple enough that maybe we don't go boom yet).
> 
> For big gpus with rendering I think best next step would be to type up a
> reasonable Gran Plan (into Documentation/gpu/todo.rst) with all the issues
> and likely solutions. And then bikeshed that, since the above is just my
> take on all this.
> 
> Cheers, Daniel
> 
> > 
> > Andrey Grodzovsky (6):
> >   drm/ttm: Add unampping of the entire device address space
> >   drm/amdgpu: Force unmap all user VMAs on device removal.
> >   drm/amdgpu: Wait for all user clients
> >   drm/amdgpu: Wait for all clients importing out dma-bufs.
> >   drm/ttm: Add destroy flag in TTM BO eviction interface
> >   drm/amdgpu: Use TTM MMs destroy interface
> > 
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 +++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 ++++++++++++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 ++++++++--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 +++++++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
> >  drivers/gpu/drm/qxl/qxl_object.c            |  4 +-
> >  drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
> >  drivers/gpu/drm/ttm/ttm_bo.c                | 63 +++++++++++++++++++++--------
> >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 +--
> >  include/drm/ttm/ttm_bo_api.h                |  2 +-
> >  include/drm/ttm/ttm_bo_driver.h             |  2 +
> >  16 files changed, 139 insertions(+), 34 deletions(-)
> > 
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
