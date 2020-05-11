Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497EC1CD9FD
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 14:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26F26E457;
	Mon, 11 May 2020 12:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF5D6E44F;
 Mon, 11 May 2020 12:34:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k12so17829141wmj.3;
 Mon, 11 May 2020 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LphsfCyPVu0MdCoxqVpG2uL08ny9bL/Y03NLWFhWvZs=;
 b=qQo2Yatr3jxyW/g0s9keYj+PhhXC0B9KF4LJ89ArBByxokBTSa0IihAC+aG27CuSdg
 zkz5CrQSomoHgEK1EfY3ozAxZSZ5G0eRo8Fx/OFIe7xl8GthIehqAfdoWwDbkwXgFGer
 zCz+nFMPJGgon6nK76RCaPsUvcyMq7gkJXJO2ySFCm164zgQDVGd8BtDm9Q056wuDSJD
 S7h8+avRUNhV+znVX8CPZSNrykxp/mnukr049Q4oSK++ZOTm3sWyh+0aeQ1DT2l4gll8
 7suGptMRIamcclnvbrf9ZixvBo1H0cM4PYkl24c94oM+1RFrIzXIAU5C7k/dDhj+TBS4
 P+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=LphsfCyPVu0MdCoxqVpG2uL08ny9bL/Y03NLWFhWvZs=;
 b=grufMOwoqVsxxQRhfJMggjMRl4YknUKBAzdrfsRkPgpWugpbTKJY0quKN5GpRUrzzM
 Mk+8KUwKvgZT1XVMqK6wK32n2oILiKYp2ugu8AIwXCftSOMMydwG7atPY6/XnsqUljIb
 /0tG0pOlohutOVtZXUNgC3iN+I5byR7VnaDwN5IGhQUXqyTVtIRvMpYveNXbkZsSl0xW
 0yclQLQItTctkRlJimVv3Ye0VfRaOhSamev0hZJUgvtdD+LIz/LRb8QINajk0ZBRyO4+
 8CMzAYH5gf+k0Ne7X9PaFsuE6PfJmz3odihJDIml715hUVPEcStDxANQFLjH46K6GaBX
 XgGA==
X-Gm-Message-State: AGi0Puab89vA5l0XybjBK8IZK5Ify0IXZAkNGfkqbElYB7PQFSKhgaAe
 E8VuYcUyQ1rDubyYkiW2uFLgEx5P
X-Google-Smtp-Source: APiQypKuCxKY8UrY9CQKkbYuRyuWrKZ7mdLwAFb7kE+gpM3vywtFlOoQn76/cdEYCEqmJfCslO+vLw==
X-Received: by 2002:a1c:6344:: with SMTP id x65mr14659905wmb.51.1589200456660; 
 Mon, 11 May 2020 05:34:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l19sm27136187wmj.14.2020.05.11.05.34.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 05:34:16 -0700 (PDT)
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
 <20200511111931.GD206103@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1a58a623-b54d-1c90-0228-2f3d4da2dbbe@gmail.com>
Date: Mon, 11 May 2020 14:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200511111931.GD206103@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.20 um 13:19 schrieb Daniel Vetter:
> On Mon, May 11, 2020 at 11:54:33AM +0200, Daniel Vetter wrote:
>> On Sat, May 09, 2020 at 02:51:44PM -0400, Andrey Grodzovsky wrote:
>>> This RFC is a more of a proof of concept then a fully working solution as there are a few unresolved issues we are hopping to get advise on from people on the mailing list.
>>> Until now extracting a card either by physical extraction (e.g. eGPU with thunderbold connection or by emulation through syfs -> /sys/bus/pci/devices/device_id/remove)
>>> would cause random crashes in user apps. The random crashes in apps were mostly due to the app having mapped a device backed BO into it's adress space was still
>>> trying to access the BO while the backing device was gone.
>>> To answer this first problem Christian suggested to fix the handling of mapped memory in the clients when the device goes away by forcibly unmap all buffers
>>> the user processes has by clearing their respective VMAs mapping the device BOs. Then when the VMAs try to fill in the page tables again we check in the fault handler
>>> if the device is removed and if so, return an error. This will generate a SIGBUS to the application which can then cleanly terminate.
>>> This indeed was done but this in turn created a problem of kernel OOPs were the OOPSes were due to the fact that while the app was terminating because of the SIGBUS
>>> it would trigger use after free in the driver by calling to accesses device structures that were already released from the pci remove sequence.
>>> This we handled by introducing a 'flush' seqence during device removal were we wait for drm file reference to drop to 0 meaning all user clients directly using this device terminated.
>>> With this I was able to cleanly emulate device unplug with X and glxgears running and later emulate device plug back and restart of X and glxgears.
>>>
>>> But this use case is only partial and as I see it all the use cases are as follwing and the questions it raises.
>>>
>>> 1) Application accesses a BO by opening drm file
>>> 	1.1) BO is mapped into applications address space (BO is CPU visible) - this one we have a solution for by invaldating BO's CPU mapping casuing SIGBUS
>>> 	     and termination and waiting for drm file refcound to drop to 0 before releasing the device
>>> 	1.2) BO is not mapped into applcation address space (BO is CPU invisible) - no solution yet because how we force the application to terminate in this case ?
>>>
>>> 2) Application accesses a BO by importing a DMA-BUF
>>> 	2.1)  BO is mapped into applications address space (BO is CPU visible) - solution is same as 1.1 but instead of waiting for drm file release we wait for the
>>> 	      imported dma-buf's file release
>>> 	2.2)  BO is not mapped into applcation address space (BO is CPU invisible) - our solution is to invalidate GPUVM page tables and destroy backing storage for
>>>                all exported BOs which will in turn casue VM faults in the importing device and then when the importing driver will try to re-attach the imported BO to
>>> 	      update mappings we return -ENODEV in the import hook which hopeffuly will cause the user app to terminate.
>>>
>>> 3) Applcation opens a drm file or imports a dma-bud and holds a reference but never access any BO or does access but never more after device was unplug - how would we
>>>     force this applcation to termiante before proceeding with device removal code ? Otherwise the wait in pci remove just hangs for ever.
>>>
>>> The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully tested and I am still testing the others but I will be happy for any advise on all the
>>> described use cases and maybe some alternative and better (more generic) approach to this like maybe obtaining PIDs of relevant processes through some revere
>>> mapping from device file and exported dma-buf files and send them SIGKILL - would this make more sense or any other method ?
>>>
>>> Patches 1-3 address 1.1
>>> Patch 4 addresses 2.1
>>> Pathces 5-6 address 2.2
>>>
>>> Reference: https://gitlab.freedesktop.org/drm/amd/-/issues/1081
>> So we've been working on this problem for a few years already (but it's
>> still not solved), I think you could have saved yourselfs some typing.
>>
>> Bunch of things:
>> - we can't wait for userspace in the hotunplug handlers, that might never
>>    happen. The correct way is to untangle the lifetime of your hw driver
>>    for a specific struct pci_device from the drm_device lifetime.
>>    Infrastructure is all there now, see drm_dev_get/put, drm_dev_unplug and
>>    drm_dev_enter/exit. A bunch of usb/spi drivers use this 100% correctly
>>    now, so there's examples. Plus kerneldoc explains stuff.

That's exactly what we tried first and I expected that this is a 
necessity. Ok so back to the drawing board for this.

>>
>> - for a big driver like amdgpu doing this split up is going to be
>>    horrendously complex. I know, we've done it for i915, at least
>>    partially. I strongly recommend that you're using devm_ for managing hw
>>    related resources (iomap, irq, ...) as much as possible.
>>
>>    For drm_device resources (mostly structures and everything related to
>>    that) we've just merged the drmm_ managed resources framework. There's
>>    some more work to be done there for various kms objects, but you can at
>>    least somewhat avoid tedious handrolling for everything internal
>>    already.
>>
>>    Don't ever use devm_kzalloc and friends, I've looked at hundreds of uses
>>    of this in drm, they're all wrong.
>>
>> - dma-buf is hilarious (and atm unfixed), dma-fence is even worse. In
>>    theory they're already refcounted and all and so should work, in
>>    practice I think we need to refcount the underlying drm_device with
>>    drm_dev_get/put to avoid the worst fall-out.
> oh I forgot one, since it's new since the last time we've seriously
> discussed this: p2p dma-buf
>
> But that /should/ be handleable with the move_notify callback. Assuming we
> don't have any bugs anywhere, and the importer can indeed get rid of all
> its mapping, always.

Yeah, already noted that as well in the internal discussion.

>
> But for completeness probably need this one, just to keep it noted.
> -Daniel
>
>> - One unfortunate thing with drm_dev_unplug is that the driver core is
>>    very opinionated and doesn't tell you whether it's a hotunplug or a
>>    driver unload. In the former case trying to shut down hw just wastes
>>    time (and might hit driver bugs), in the latter case driver engineers
>>    very much expect everything to be shut down.
>>
>>    Right now you can only have one or the other, so this needs a module
>>    option hack or similar (default to the correct hotunplug behaviour for
>>    users).
>>
>> - SIGBUS is better than crashing the kernel, but it's not even close for
>>    users. They still lose everything because everything crashes because in
>>    my experience, in practice, no one ever handles errors. There's a few
>>    more things on top:
>>
>>    - sighandlers are global, which means only the app can use it. You can't
>>      use it in e.g. mesa. They're also not composable, so if you have on
>>      sighandler for gpu1 and a 2nd one for gpu2 (could be different vendor)
>>      it's all sadness. Hence "usersapce will handle SIGBUS" wont work.
>>
>>    - worse, neither vk nor gl (to my knowledge) have a concept of events
>>      for when the gpu died. The only stuff you have is things like
>>      arb_robustness which says a) everything continues as if nothing
>>      happened b) there's a function where you can ask whether your gl
>>      context and all the textures/buffers are toast.
>>
>>      I think that's about the only hotunplug application model we can
>>      realistically expect applications to support. That means _all_ errors
>>      need to be silently eaten by either mesa or the kernel. On i915 the
>>      model (also for terminally wedged gpu hangs) is that all ioctl keep
>>      working, mmaps keep working, and execbuf gives you an -EIO (which mesa
>>      eats silently iirc for arb_robustness).
>>
>>    Conclusion is that SIGBUS is imo a no-go, and the only option we have is
>>    that a) mmaps fully keep working, doable for shmem or b) we put some
>>    fake memory in there (for vram or whatever), maybe even only a single
>>    page for all fake memory.

Ok, good to know.

So to summarize no application termination, but instead redirect all 
memory access to a dummy page.

 From the IOCTLs we return -ENODEV instead of -EIO. Is that a problem?

Thanks for the comments,
Christian.

>>
>> - you probably want arb_robustness and similar stuff in userspace as a
>>    first step.
>>
>> tldr;
>> - refcounting, not waiting for userspace
>> - nothing can fail because userspace wont handle it
>>
>> That's at least my take on this mess, and what we've been pushing for over
>> the past few years. For kms-only drm_driver we should have achieved that
>> by now (plus/minus maybe some issues for dma-buf/fences, but kms-only
>> dma-buf/fences are simple enough that maybe we don't go boom yet).
>>
>> For big gpus with rendering I think best next step would be to type up a
>> reasonable Gran Plan (into Documentation/gpu/todo.rst) with all the issues
>> and likely solutions. And then bikeshed that, since the above is just my
>> take on all this.
>>
>> Cheers, Daniel
>>
>>> Andrey Grodzovsky (6):
>>>    drm/ttm: Add unampping of the entire device address space
>>>    drm/amdgpu: Force unmap all user VMAs on device removal.
>>>    drm/amdgpu: Wait for all user clients
>>>    drm/amdgpu: Wait for all clients importing out dma-bufs.
>>>    drm/ttm: Add destroy flag in TTM BO eviction interface
>>>    drm/amdgpu: Use TTM MMs destroy interface
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 +++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 ++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 ++++++++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 +++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>>>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
>>>   drivers/gpu/drm/qxl/qxl_object.c            |  4 +-
>>>   drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
>>>   drivers/gpu/drm/ttm/ttm_bo.c                | 63 +++++++++++++++++++++--------
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 +--
>>>   include/drm/ttm/ttm_bo_api.h                |  2 +-
>>>   include/drm/ttm/ttm_bo_driver.h             |  2 +
>>>   16 files changed, 139 insertions(+), 34 deletions(-)
>>>
>>> -- 
>>> 2.7.4
>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
