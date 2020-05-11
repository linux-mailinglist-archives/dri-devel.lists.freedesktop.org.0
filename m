Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1D1CD9D2
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 14:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAE86E450;
	Mon, 11 May 2020 12:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9416E44F;
 Mon, 11 May 2020 12:29:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w7so10716748wre.13;
 Mon, 11 May 2020 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dbYXMCHJKzEsuE3GuPJNMzMjLWyFFyFfqLTdtgLKNdE=;
 b=lF9RMwe/+4OTcyXMdmBT4pfOmL8R0M2Ry0dm8v2HeuHFyCBu3579/WyngyzJNg/9au
 1XQcFSkHa/3w5oCvS+ASzskaLaEnf7DvXjMS6DFfgZEyy0FsKiXhAICagW/9nefB18rm
 J2eZyIUIcdUDiYToBXPLSgTqClGj9ZO2eAAnUZZMWDBWBTZ3cjjXkKtrvLlNERZM1bV8
 1Tt2WW2v6Sa3m0hAp2+VJekJ+m1/89B68zwKnwCyZypxSPiqDLk+RbVanWy5Qxl463T6
 toW6R0SnnCjDLIo98wUqLFfcScS9rNIvp+jwGsv/ClSt9lrLGWiD/ACes42rL0kD042i
 p3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=dbYXMCHJKzEsuE3GuPJNMzMjLWyFFyFfqLTdtgLKNdE=;
 b=gxMlVH45HXdIz2BSJsEDdTPufTTVaz+HtHkYcffk86Kac+AX1a5osZKmji6G8cxFfl
 v0XNuRtVOxBbDM8g1FD8O/ZFuCA6FUWMF+rWOUDzBbgcvzK5+4o7uZfefKgct7QOj2gN
 2tzwBmQRyfg5VgldGF2EvdEF+HY5jGyAU3gQDBa1rFY52NRqrezk5bZU3pCF9Q0Neqof
 idUmSAOnSYLDLoqNtvZn7a8nX0BMQ/BLY9OxU39EKFMXUgcbi0EsZI2I9+RP/ivC1Qm5
 0AJlwFGIaYWOj2U9wIt6is2gynGTozkgxSiwleTEqkkht0Yi3Qq13PWgUJL8NyVp9lQz
 6sPg==
X-Gm-Message-State: AGi0PuZzneOWA/4bq7h/N2KSRh7TrdwwA+o7wkx48G7uCAy5alh0h8b6
 QATkh4zvShdfojis6w6d1dQ=
X-Google-Smtp-Source: APiQypITK8J8CJ/MmvPh0hT9U5rTt+VXFLdnO3PxXJcgQWwh42N+DnICCy0TcQv4W4zeiROZ5tY+ew==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr20118211wrt.103.1589200180658; 
 Mon, 11 May 2020 05:29:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 18sm14027870wmj.19.2020.05.11.05.29.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 05:29:39 -0700 (PDT)
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511122600.0adb4494@eldfell.localdomain>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <649674e1-df76-8f93-c52d-e6b52d9a3273@gmail.com>
Date: Mon, 11 May 2020 14:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200511122600.0adb4494@eldfell.localdomain>
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

Am 11.05.20 um 11:26 schrieb Pekka Paalanen:
> On Sat, 9 May 2020 14:51:44 -0400
> Andrey Grodzovsky <andrey.grodzovsky@amd.com> wrote:
>
>> This RFC is a more of a proof of concept then a fully working
>> solution as there are a few unresolved issues we are hopping to get
>> advise on from people on the mailing list. Until now extracting a
>> card either by physical extraction (e.g. eGPU with thunderbold
>> connection or by emulation through syfs
>> -> /sys/bus/pci/devices/device_id/remove) would cause random crashes
>> in user apps. The random crashes in apps were mostly due to the app
>> having mapped a device backed BO into it's adress space was still
>> trying to access the BO while the backing device was gone. To answer
>> this first problem Christian suggested to fix the handling of mapped
>> memory in the clients when the device goes away by forcibly unmap all
>> buffers the user processes has by clearing their respective VMAs
>> mapping the device BOs. Then when the VMAs try to fill in the page
>> tables again we check in the fault handler if the device is removed
>> and if so, return an error. This will generate a SIGBUS to the
>> application which can then cleanly terminate. This indeed was done
>> but this in turn created a problem of kernel OOPs were the OOPSes
>> were due to the fact that while the app was terminating because of
>> the SIGBUS it would trigger use after free in the driver by calling
>> to accesses device structures that were already released from the pci
>> remove sequence. This we handled by introducing a 'flush' seqence
>> during device removal were we wait for drm file reference to drop to
>> 0 meaning all user clients directly using this device terminated.
>> With this I was able to cleanly emulate device unplug with X and
>> glxgears running and later emulate device plug back and restart of X
>> and glxgears.
>>
>> But this use case is only partial and as I see it all the use cases
>> are as follwing and the questions it raises.
>>
>> 1) Application accesses a BO by opening drm file
>> 	1.1) BO is mapped into applications address space (BO is CPU visible) - this one we have a solution for by invaldating BO's CPU mapping casuing SIGBUS
>> 	     and termination and waiting for drm file refcound to drop to 0 before releasing the device
>> 	1.2) BO is not mapped into applcation address space (BO is CPU invisible) - no solution yet because how we force the application to terminate in this case ?
>>
>> 2) Application accesses a BO by importing a DMA-BUF
>> 	2.1)  BO is mapped into applications address space (BO is CPU visible) - solution is same as 1.1 but instead of waiting for drm file release we wait for the
>> 	      imported dma-buf's file release
>> 	2.2)  BO is not mapped into applcation address space (BO is CPU invisible) - our solution is to invalidate GPUVM page tables and destroy backing storage for
>>                all exported BOs which will in turn casue VM faults in the importing device and then when the importing driver will try to re-attach the imported BO to
>> 	      update mappings we return -ENODEV in the import hook which hopeffuly will cause the user app to terminate.
>>
>> 3) Applcation opens a drm file or imports a dma-bud and holds a reference but never access any BO or does access but never more after device was unplug - how would we
>>     force this applcation to termiante before proceeding with device removal code ? Otherwise the wait in pci remove just hangs for ever.
>>
>> The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully tested and I am still testing the others but I will be happy for any advise on all the
>> described use cases and maybe some alternative and better (more generic) approach to this like maybe obtaining PIDs of relevant processes through some revere
>> mapping from device file and exported dma-buf files and send them SIGKILL - would this make more sense or any other method ?
>>
>> Patches 1-3 address 1.1
>> Patch 4 addresses 2.1
>> Pathces 5-6 address 2.2
>>
>> Reference: https://gitlab.freedesktop.org/drm/amd/-/issues/1081
> Hi,
>
> how did you come up with the goal "make applications terminate"? Is
> that your end goal, or is it just step 1 of many on the road of
> supporting device hot-unplug?
>
> Why do you want to terminate also applications that don't "need" to
> terminate? Why hunt them down? I'm referring to your points 1.2, 2.2
> and 3.

Yeah, that is a known limitation. For now the whole idea is to terminate 
the programs using the device as soon as possible.

>  From an end user perspective, I believe making applications terminate
> is not helpful at all. Your display server still disappears, which
> means all your apps are forced to quit, and you lose your desktop. I do
> understand that a graceful termination is better than a hard lockup,
> but not much.

This is not for a desktop use case at all.

Regards,
Christian.

>
> When I've talked about DRM device hot-unplug with Daniel Vetter, our
> shared opinion seems to be that the unplug should not outright kill any
> programs that are prepared to handle errors, that is, functions or
> ioctls that return a success code can return an error, and then it is
> up for the application to decide how to handle that. The end goal must
> not be to terminate all applications that had something to do with the
> device. At the very least the display server must survive.
>
> The rough idea on how that should work is that DRM ioctls start
> returning errors and all mmaps are replaced with something harmless
> that does not cause a SIGBUS. Userspace can handle the errors if it
> wants to, and display servers will react to the device removed uevent
> if not earlier.
>
> Why deliberately avoid raising SIGBUS? Because it is such a huge pain
> to handle due to the archaic design of how signals are delivered. Most
> of existing userspace is also not prepared to handle SIGBUS anywhere.
>
> The problem of handling SIGBUS at all is that a process can only have a
> single signal handler per signal, but the process may comprise of
> multiple components that cannot cooperate on signal catching: Mesa GPU
> drivers, GUI toolkits, and the application itself may all do some
> things that would require handling SIGBUS if removing a DRM device
> raised it. For Mesa to cooperate with SIGBUS handling with the other
> components in the process, we'd need some whole new APIs, an EGL
> extension and maybe Vulkan extension too. The process may also have
> threads, which are really painful with signals. What if you need to
> handle the SIGBUS differently in different threads?
>
> Hence, mmaps should be replaced with something harmless, maybe
> something that reads back all zeros and ignores writes. The application
> will learn later that the DRM device is gone. Sending it a SIGBUS on
> the spot when it accesses an mmap does not help: the memory is gone
> already - if you didn't have a backup of the contents, you're not going
> to make one now.
>
> My point here is, are you designing things to specifically only
> terminate processes, or will you leave room in the design to improve the
> implementation towards a proper handling of DRM device hot-unplug?
>
>
> Thanks,
> pq
>
>
>> Andrey Grodzovsky (6):
>>    drm/ttm: Add unampping of the entire device address space
>>    drm/amdgpu: Force unmap all user VMAs on device removal.
>>    drm/amdgpu: Wait for all user clients
>>    drm/amdgpu: Wait for all clients importing out dma-bufs.
>>    drm/ttm: Add destroy flag in TTM BO eviction interface
>>    drm/amdgpu: Use TTM MMs destroy interface
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 +++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 ++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 ++++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 +++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
>>   drivers/gpu/drm/qxl/qxl_object.c            |  4 +-
>>   drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
>>   drivers/gpu/drm/ttm/ttm_bo.c                | 63 +++++++++++++++++++++--------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 +--
>>   include/drm/ttm/ttm_bo_api.h                |  2 +-
>>   include/drm/ttm/ttm_bo_driver.h             |  2 +
>>   16 files changed, 139 insertions(+), 34 deletions(-)
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
