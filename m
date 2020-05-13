Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887351D1CFD
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 20:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51DD6EA7F;
	Wed, 13 May 2020 18:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222216EA7C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 18:05:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s8so563015wrt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=aADLkBh/CzeEReshtaRzocX8iG+XjBLtWjpjdKxhCbg=;
 b=MdbweSWfxxChmQv/kzX7RbaNmUKH+fZfS+8D6ab5iGjlGo1FBOVRiw/e0/jd5EBoeZ
 ZLzDSJJe8kz/sxxt2B1NRDY79xAXGi4SG4HXsCaIAepw6g4hE8XhlAyI+3O9jPRoNSQn
 hw/i9vWOeZWFF0bkWMLdIHnIUHvHY9A84s4z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aADLkBh/CzeEReshtaRzocX8iG+XjBLtWjpjdKxhCbg=;
 b=o9AJJy/dc91321EjvGlBAvYi++ma+P7IS5GClIzsEaH2YA6E76VYcG/rMsF+lFX0J8
 Cg8as0u1lwjXiv1v6p4Vop1mOxseiNRHwiN5eOvrMwdDtKBBaH9zOOtG+PSW2YCkmuRF
 5eSZiMgSxMAQsJsefcDk1mUQ8S1HSTSCMRZJbH2pvPp1+wfrM5QhIvhs5UxNo73vv/au
 65jSwGoKQc097WfVizi1Dy12pYpfdysAc1/XlJRUagt6F6XtP9pW2paRo0DW0eyNmh21
 XpVneq6J4KT+8g8/OSVGCvBYoAJSzEWB6uT9HS7+uukDCsVNyuk3ZbgWaIESypwJWvhm
 fyBg==
X-Gm-Message-State: AOAM5332vSdnuCs6GfAb2uXnB4PHb7Ywbok+i4IL1c5tudoygIDyxs4H
 f36lqfTwiMr4UMHt1Oynv3Dv9g==
X-Google-Smtp-Source: ABdhPJzGYAocV7Yvs0tkXwIFkgYju3ean614yqhhXWWH3H1Sjob1LfSQH2EwOHTcBxvjGNbLGjX9qw==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr606115wru.100.1589393138191; 
 Wed, 13 May 2020 11:05:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h1sm37411451wme.42.2020.05.13.11.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 11:05:37 -0700 (PDT)
Date: Wed, 13 May 2020 20:05:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
Message-ID: <20200513180535.GM206103@phenom.ffwll.local>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
 <f90fed31-f7c7-761e-0c0c-3bdf8393ee9d@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f90fed31-f7c7-761e-0c0c-3bdf8393ee9d@amd.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:32:56AM -0400, Andrey Grodzovsky wrote:
> =

> On 5/11/20 5:54 AM, Daniel Vetter wrote:
> > On Sat, May 09, 2020 at 02:51:44PM -0400, Andrey Grodzovsky wrote:
> > > This RFC is a more of a proof of concept then a fully working solutio=
n as there are a few unresolved issues we are hopping to get advise on from=
 people on the mailing list.
> > > Until now extracting a card either by physical extraction (e.g. eGPU =
with thunderbold connection or by emulation through syfs -> /sys/bus/pci/de=
vices/device_id/remove)
> > > would cause random crashes in user apps. The random crashes in apps w=
ere mostly due to the app having mapped a device backed BO into it's adress=
 space was still
> > > trying to access the BO while the backing device was gone.
> > > To answer this first problem Christian suggested to fix the handling =
of mapped memory in the clients when the device goes away by forcibly unmap=
 all buffers
> > > the user processes has by clearing their respective VMAs mapping the =
device BOs. Then when the VMAs try to fill in the page tables again we chec=
k in the fault handler
> > > if the device is removed and if so, return an error. This will genera=
te a SIGBUS to the application which can then cleanly terminate.
> > > This indeed was done but this in turn created a problem of kernel OOP=
s were the OOPSes were due to the fact that while the app was terminating b=
ecause of the SIGBUS
> > > it would trigger use after free in the driver by calling to accesses =
device structures that were already released from the pci remove sequence.
> > > This we handled by introducing a 'flush' seqence during device remova=
l were we wait for drm file reference to drop to 0 meaning all user clients=
 directly using this device terminated.
> > > With this I was able to cleanly emulate device unplug with X and glxg=
ears running and later emulate device plug back and restart of X and glxgea=
rs.
> > > =

> > > But this use case is only partial and as I see it all the use cases a=
re as follwing and the questions it raises.
> > > =

> > > 1) Application accesses a BO by opening drm file
> > > 	1.1) BO is mapped into applications address space (BO is CPU visible=
) - this one we have a solution for by invaldating BO's CPU mapping casuing=
 SIGBUS
> > > 	     and termination and waiting for drm file refcound to drop to 0 =
before releasing the device
> > > 	1.2) BO is not mapped into applcation address space (BO is CPU invis=
ible) - no solution yet because how we force the application to terminate i=
n this case ?
> > > =

> > > 2) Application accesses a BO by importing a DMA-BUF
> > > 	2.1)  BO is mapped into applications address space (BO is CPU visibl=
e) - solution is same as 1.1 but instead of waiting for drm file release we=
 wait for the
> > > 	      imported dma-buf's file release
> > > 	2.2)  BO is not mapped into applcation address space (BO is CPU invi=
sible) - our solution is to invalidate GPUVM page tables and destroy backin=
g storage for
> > >                all exported BOs which will in turn casue VM faults in=
 the importing device and then when the importing driver will try to re-att=
ach the imported BO to
> > > 	      update mappings we return -ENODEV in the import hook which hop=
effuly will cause the user app to terminate.
> > > =

> > > 3) Applcation opens a drm file or imports a dma-bud and holds a refer=
ence but never access any BO or does access but never more after device was=
 unplug - how would we
> > >     force this applcation to termiante before proceeding with device =
removal code ? Otherwise the wait in pci remove just hangs for ever.
> > > =

> > > The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully =
tested and I am still testing the others but I will be happy for any advise=
 on all the
> > > described use cases and maybe some alternative and better (more gener=
ic) approach to this like maybe obtaining PIDs of relevant processes throug=
h some revere
> > > mapping from device file and exported dma-buf files and send them SIG=
KILL - would this make more sense or any other method ?
> > > =

> > > Patches 1-3 address 1.1
> > > Patch 4 addresses 2.1
> > > Pathces 5-6 address 2.2
> > > =

> > > Reference: https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=
=3D02%7C01%7Candrey.grodzovsky%40amd.com%7Cf6eec90e9da144cb772a08d7f5921ec2=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637247880251844517&amp;sdata=
=3DQBGIbm1KLysglvRAvoiek8jBcNLE%2B4J7gVGDAbZD5Jw%3D&amp;reserved=3D0
> > So we've been working on this problem for a few years already (but it's
> > still not solved), I think you could have saved yourselfs some typing.
> > =

> > Bunch of things:
> > - we can't wait for userspace in the hotunplug handlers, that might nev=
er
> >    happen. The correct way is to untangle the lifetime of your hw driver
> >    for a specific struct pci_device from the drm_device lifetime.
> >    Infrastructure is all there now, see drm_dev_get/put, drm_dev_unplug=
 and
> >    drm_dev_enter/exit.
> =

> this
> =

> To be sure I understood you - do you mean that we should disable/shutdown
> any HW related stuff such as interrupts disable, any shutdown related dev=
ice
> registers programming and io regions unmapping during pci remove sequence
> (in our case amdgpu_pci_remove) while keeping all the drm/amdgpu structur=
es
> around in memory until drm_dev_put refocunt drop to 0 and
> &drm_driver.release is called thus avoiding any user after free oopses wh=
en
> last user reference is dropped ?

Yes.

> Is there any point in doing any HW programming to shutdown device if devi=
ce
> is already removed anyway (i assume that if driver hook for pci remove=A0=
 is
> called and it's a physical remove the device is already gone, no ?)

No, all that does is result in bus timeouts, which take forever. Plus
increased chances that the driver gets confused about the values it reads
(for pci all you get is 0xffffffff, no error value, usb is a lot better
here because it's explicit packets and streams where you can get explicit
errors and bail out).

The trouble is that developers still expect you to shut down hw when they
unload the driver for testing, but I think we've discussed a reasonable
solution for that for pci drivers somewhere in this thread.

> What happens if drm_dev_put doesn't drop to 0 before the device is plugged
> back into the system ? In this case i have duplicates of all device
> structures in the system. Do you expect this to be not a problem or if it=
 is
> it's up to me to resolve i guess ?

You get another one. Same way you get duplicates if there's actually 2
devices plugged in, so if your driver supports multiple gpus already you
should be fine.

We should also not hang onto chardev minor numbers, so I think you should
be getting the same minor number again. But not 100% sure, maybe something
we might need to fix ...

> > A bunch of usb/spi drivers use this 100% correctly
> >    now, so there's examples. Plus kerneldoc explains stuff.
> =

> =

> Would you say tiny drm drivers are a good example ?

Yup. But also, they're tiny, so lots more complexity in amdgpu that they
don't even cover. But for the basic flow of using drmm and devm and the
functions I mentioned above, they should be the most bug-free drivers we
have.

> > - for a big driver like amdgpu doing this split up is going to be
> >    horrendously complex. I know, we've done it for i915, at least
> >    partially.
> =

> =

> Can you point me to relevant code/commits for i915 ?

Anything touching the i915 drm_driver.release function. Or any function
called from there.

> > I strongly recommend that you're using devm_ for managing hw
> >    related resources (iomap, irq, ...) as much as possible.
> =

> =

> From what i saw, in DRM devres implementation=A0 amounts to using
> devm_drm_dev_init/devm_drm_dev_init_release - is that what you mean ? If =
so
> i see that devm_drm_dev_init_release just calls drm_dev_put, drm_dev_unpl=
ug
> ends up calling devm_drm_dev_init_release through the devres infrastructu=
re
> - We already call drm_dev_unplug in amdgpu_pci_remove, we also directly c=
all
> drm_dev_put there so i am not clear what's the added value of using devm
> here ?

There's a lot more to devres, but yes that's the drm_device one. For the
full list of what can all be managed with devres see

https://dri.freedesktop.org/docs/drm/driver-api/driver-model/devres.html

There's lots of example usage in drm, especially tiny drivers and anything
that runs on arm. Only caveat is that any usage of devm_kzalloc is buggy
(at least in drm, as far as I've checked them).

> >    For drm_device resources (mostly structures and everything related to
> >    that) we've just merged the drmm_ managed resources framework. There=
's
> >    some more work to be done there for various kms objects, but you can=
 at
> >    least somewhat avoid tedious handrolling for everything internal
> >    already.
> =

> =

> I can't find drmm in the code, can you point me please ?

drm_managed.c, you need latest drm-next I think. Or linux-next. Docs here:

https://dri.freedesktop.org/docs/drm/gpu/drm-internals.html#managed-resourc=
es

> =

> > =

> >    Don't ever use devm_kzalloc and friends, I've looked at hundreds of =
uses
> >    of this in drm, they're all wrong.
> > =

> > - dma-buf is hilarious (and atm unfixed), dma-fence is even worse. In
> >    theory they're already refcounted and all and so should work, in
> >    practice I think we need to refcount the underlying drm_device with
> >    drm_dev_get/put to avoid the worst fall-out.
> > =

> > - One unfortunate thing with drm_dev_unplug is that the driver core is
> >    very opinionated and doesn't tell you whether it's a hotunplug or a
> >    driver unload. In the former case trying to shut down hw just wastes
> >    time (and might hit driver bugs), in the latter case driver engineers
> >    very much expect everything to be shut down.
> > =

> >    Right now you can only have one or the other, so this needs a module
> >    option hack or similar (default to the correct hotunplug behaviour f=
or
> >    users).
> > =

> > - SIGBUS is better than crashing the kernel, but it's not even close for
> >    users. They still lose everything because everything crashes because=
 in
> >    my experience, in practice, no one ever handles errors. There's a few
> >    more things on top:
> > =

> >    - sighandlers are global, which means only the app can use it. You c=
an't
> >      use it in e.g. mesa. They're also not composable, so if you have on
> >      sighandler for gpu1 and a 2nd one for gpu2 (could be different ven=
dor)
> >      it's all sadness. Hence "usersapce will handle SIGBUS" wont work.
> > =

> >    - worse, neither vk nor gl (to my knowledge) have a concept of events
> >      for when the gpu died. The only stuff you have is things like
> >      arb_robustness which says a) everything continues as if nothing
> >      happened b) there's a function where you can ask whether your gl
> >      context and all the textures/buffers are toast.
> > =

> >      I think that's about the only hotunplug application model we can
> >      realistically expect applications to support. That means _all_ err=
ors
> >      need to be silently eaten by either mesa or the kernel. On i915 the
> >      model (also for terminally wedged gpu hangs) is that all ioctl keep
> >      working, mmaps keep working, and execbuf gives you an -EIO (which =
mesa
> >      eats silently iirc for arb_robustness).
> > =

> >    Conclusion is that SIGBUS is imo a no-go, and the only option we hav=
e is
> >    that a) mmaps fully keep working, doable for shmem or b) we put some
> >    fake memory in there (for vram or whatever), maybe even only a single
> >    page for all fake memory.
> > =

> > - you probably want arb_robustness and similar stuff in userspace as a
> >    first step.
> > =

> > tldr;
> > - refcounting, not waiting for userspace
> > - nothing can fail because userspace wont handle it
> =

> =

> For nothing can fail i see in tiny drm driver examples (e.g.
> ili9225_pipe_enable) that for any function which is about to do HW
> programming they check for drm_dev_enter and silently return if device is
> not present - is that what you mean, that I should pepper all of amdgpu c=
ode
> such that any function that ends up doing some HW programming be guarded
> with drm_dev_enter/exit silently returning in case of device is gone ?

Yup.

Note taht e.g. usb because it's a packet/stream bus gives you explicit
errors, so those drivers don't need the drm_dev_enter/exit. But for pci we
need them to make sure we're wasting time when the hw is gone on
everything first timing out.

> Thanks a lot for your detailed response.

np.

Cheers, Daniel

> =

> Andrey
> =

> =

> > =

> > That's at least my take on this mess, and what we've been pushing for o=
ver
> > the past few years. For kms-only drm_driver we should have achieved that
> > by now (plus/minus maybe some issues for dma-buf/fences, but kms-only
> > dma-buf/fences are simple enough that maybe we don't go boom yet).
> > =

> > For big gpus with rendering I think best next step would be to type up a
> > reasonable Gran Plan (into Documentation/gpu/todo.rst) with all the iss=
ues
> > and likely solutions. And then bikeshed that, since the above is just my
> > take on all this.
> > =

> > Cheers, Daniel
> > =

> > > Andrey Grodzovsky (6):
> > >    drm/ttm: Add unampping of the entire device address space
> > >    drm/amdgpu: Force unmap all user VMAs on device removal.
> > >    drm/amdgpu: Wait for all user clients
> > >    drm/amdgpu: Wait for all clients importing out dma-bufs.
> > >    drm/ttm: Add destroy flag in TTM BO eviction interface
> > >    drm/amdgpu: Use TTM MMs destroy interface
> > > =

> > >   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 ++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 +++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 ++++++++++++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 ++++++++--
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 ++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 +++++++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
> > >   drivers/gpu/drm/qxl/qxl_object.c            |  4 +-
> > >   drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
> > >   drivers/gpu/drm/ttm/ttm_bo.c                | 63 ++++++++++++++++++=
+++--------
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 +--
> > >   include/drm/ttm/ttm_bo_api.h                |  2 +-
> > >   include/drm/ttm/ttm_bo_driver.h             |  2 +
> > >   16 files changed, 139 insertions(+), 34 deletions(-)
> > > =

> > > -- =

> > > 2.7.4
> > > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
