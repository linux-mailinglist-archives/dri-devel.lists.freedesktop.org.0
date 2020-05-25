Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501E1E107D
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE4389838;
	Mon, 25 May 2020 14:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05FC89842
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:28:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f5so191887wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zSRqfI+3UVHFyw6xWn8/XRDFDrPvBgGXt/yvfmRt9vk=;
 b=cC9QwtOdRwGpqIfkP0SbCIeRcqpLOzW6SXw/xDGTfagjIqfgOVUDiDkWDVhXSw0v0W
 qc+gjElawJHUVvJLmrTkyzWp1ajwEpHDRDakgB8JrGz79PfDsVXnM70Sy0NczpGw0t27
 G7NcT9Fz6t/BqjjiYfwlHv45E9awa0IKf1K2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zSRqfI+3UVHFyw6xWn8/XRDFDrPvBgGXt/yvfmRt9vk=;
 b=WNMXbPDVMBNQoKLKe/UuutBu6NAIwMQQjNuO59mxfzFMNtG1b4mz1cD4h665DdibBt
 pKdfMBqN+kJgRRzXj+rcw0NStyLYmALsYM3MwEyzDBITZdOHdTD06Iy1cJm5F4YBiA4i
 Fui2JqjwxpdU8vnPNSWkAwcYnxbRohFz/BNkorJB7YFUlliMEvnXnstXx/Q6f7K5x0Ur
 ADGK5n/9mHbE9umKMkB4eisrMIMtrjTyR+qgvxRx4wbEhor4qT4NxR6JCBpu5ZY0Aldo
 oEHVOpAkfHc8VUWEM7Q0aEKntWGWJ87pYJxADHrjJl9mfsbhoiybzuGt0WyVzLPP9wyT
 jxkg==
X-Gm-Message-State: AOAM532VZ/Okf3ulU4daiKMrcO7COgDJC3ndM2nJyScm0biR3P0T7l3o
 YwEHKua/zs0y4tVcxy8vUOpjrg==
X-Google-Smtp-Source: ABdhPJzexAYEDi6h75mnHqMMFQbDyXb7qgnHOBCzXtWQDV89e+aQpAlLcEVv773pBYsuP3o0DRTJLQ==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr7573421wmj.153.1590416887148; 
 Mon, 25 May 2020 07:28:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u130sm5261434wmg.32.2020.05.25.07.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:28:06 -0700 (PDT)
Date: Mon, 25 May 2020 16:28:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200525142804.GD206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
 <20200520141908.314607bc@eldfell.localdomain>
 <20200520124617.GX206103@phenom.ffwll.local>
 <382ab1ab-a89c-e384-3200-0cb3257c25bb@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <382ab1ab-a89c-e384-3200-0cb3257c25bb@amd.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 10:50:41AM -0400, Andrey Grodzovsky wrote:
> =

> On 5/20/20 8:46 AM, Daniel Vetter wrote:
> > On Wed, May 20, 2020 at 02:19:08PM +0300, Pekka Paalanen wrote:
> > > On Tue, 19 May 2020 10:37:12 -0400
> > > Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
> > > =

> > > > Thanks for the summary, does put things in order and makes it easie=
r to
> > > > comprehend all the TODOs, some questions bellow
> > > > =

> > > > On 5/19/20 6:06 AM, Pekka Paalanen wrote:
> > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > =

> > > > > Set up the expectations on how hot-unplugging a DRM device should=
 look like to
> > > > > userspace.
> > > > > =

> > > > > Written by Daniel Vetter's request and largely based on his comme=
nts in IRC and
> > > > > from https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.ht=
ml&amp;data=3D02%7C01%7CAndrey.Grodzovsky%40amd.com%7Ca4da241ff1e54610d9550=
8d7fcbbcc11%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637255755828209496=
&amp;sdata=3DYDFoP2g3z3IiB77sRvAmPB%2Fix%2FV0Mh78YcCSAAlhXdg%3D&amp;reserve=
d=3D0 .
> > > > > =

> > > > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > > Cc: Sean Paul <sean@poorly.run>
> > > > > =

> > > > > ---
> > > > > =

> > > > > Disclaimer: I am a userspace developer writing for other userspac=
e developers.
> > > > > I took some liberties in defining what should happen without know=
ing what is
> > > > > actually possible or what existing drivers already implement.
> > > > > ---
> > > > >    Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++=
++++++++
> > > > >    1 file changed, 75 insertions(+)
> > > > > =

> > > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/d=
rm-uapi.rst
> > > > > index 56fec6ed1ad8..80db4abd2cbd 100644
> > > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > > @@ -1,3 +1,5 @@
> > > > > +.. Copyright 2020 DisplayLink (UK) Ltd.
> > > > > +
> > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >    Userland interfaces
> > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > @@ -162,6 +164,79 @@ other hand, a driver requires shared state b=
etween clients which is
> > > > >    visible to user-space and accessible beyond open-file boundari=
es, they
> > > > >    cannot support render nodes.
> > > > > +Device Hot-Unplug
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +.. note::
> > > > > +   The following is the plan. Implementation is not there yet
> > > > > +   (2020 May 13).
> > > > > +
> > > > > +Graphics devices (display and/or render) may be connected via US=
B (e.g.
> > > > > +display adapters or docking stations) or Thunderbolt (e.g. eGPU)=
. An end
> > > > > +user is able to hot-unplug this kind of devices while they are b=
eing
> > > > > +used, and expects that the very least the machine does not crash=
. Any
> > > > > +damage from hot-unplugging a DRM device needs to be limited as m=
uch as
> > > > > +possible and userspace must be given the chance to handle it if =
it wants
> > > > > +to. Ideally, unplugging a DRM device still lets a desktop to con=
tinue
> > > > > +running, but that is going to need explicit support throughout t=
he whole
> > > > > +graphics stack: from kernel and userspace drivers, through displ=
ay
> > > > > +servers, via window system protocols, and in applications and li=
braries.
> > > > > +
> > > > > +Other scenarios that should lead to the same are: unrecoverable =
GPU
> > > > > +crash, PCI device disappearing off the bus, or forced unbind of =
a driver
> > > > > +from the physical device.
> > > > > +
> > > > > +In other words, from userspace perspective everything needs to k=
eep on
> > > > > +working more or less, until userspace stops using the disappeare=
d DRM
> > > > > +device and closes it completely. Userspace will learn of the dev=
ice
> > > > > +disappearance from the device removed uevent or in some cases sp=
ecific
> > > > > +ioctls returning EIO.
> > > > > +
> > > > > +This goal raises at least the following requirements for the ker=
nel and
> > > > > +drivers:
> > > > > +
> > > > > +- The kernel must not hang, crash or oops, no matter what usersp=
ace was
> > > > > +  in the middle of doing when the device disappeared.
> > > > > +
> > > > > +- All GPU jobs that can no longer run must have their fences
> > > > > +  force-signalled to avoid inflicting hangs to userspace.
> > > > > +
> > > > > +- KMS connectors must change their status to disconnected.
> > > > > +
> > > > > +- Legacy modesets and pageflips fake success.
> > > > > +
> > > > > +- Atomic commits, both real and TEST_ONLY, fake success.
> > > > =

> > > > Why wouldn't we return -EIO for the atommic commit IOTCL/legasy pfl=
ip
> > > > and modeset ioctls here same way as you suggested returning -EIO for
> > > > render ioctl ?
> > > Hi,
> > > =

> > > that is more of a question for Daniel Vetter than me. I believe he is
> > > worried that userspace will get the error handling horribly wrong
> > > anyway, because it needs to be handled in every single display server
> > > project. Render ioctl errors OTOH need to be handled only in the
> > > corresponding Mesa or other userspace driver, and for render there are
> > > API (OpenGL/EGL, Vulkan) specs that say how it must be handled to fill
> > > the API contract. Because of the API contract, those are more likely =
to
> > > have reasonable error handling in place already.
> > Yup pretty much. Atm compositors expect an -EINVAL (especially for
> > TEST_ONLY), some cope with the semi-spurious -EBUSY we still throw arou=
nd,
> > but I expect most will just die if the get an -ENOMEM or -EIO or really
> > anything.
> > =

> > I think one area where we've historically thrown some spurious errors is
> > also vblank ioctls, since they don't take full locks and sometimes the
> > kernel needs to sneak in a modeset for some reason (gpu recovery, dp li=
nk
> > recovery, ...).
> > =

> > Either way I don't think there's anything the compositor can do than ju=
st
> > ignore the error and carry on.
> =

> =

> So currently drm_ioctl will just check for drm_dev_is_unplugged and return
> -ENODEV at the very beginning of the function (https://elixir.bootlin.com=
/linux/latest/source/drivers/gpu/drm/drm_ioctl.c#L825)
> meaning that currently we blanket failure any IOCTL in case the device is
> unplagued (ignoring the race condition if the device unplugged after the
> check). So do we want to remove this check and put it only for render ioc=
tls
> (which are those ? e.g. for amdgpu there is=A0 AMDGPU_CS ioctl) but not f=
or
> mode setting/dma_buf_import/dma_buf_export ioctls ? What about other types
> of ioctls which are non of the listed above ?

Hm right, and this goes back all the way to first usb udl support:

commit 2c07a21d6fb0be47fda696a618b726ea258ed1dd
Author: Dave Airlie <airlied@redhat.com>
Date:   Mon Feb 20 14:18:07 2012 +0000

    drm: add core support for unplugging a device (v2)

So I guess we need to change the uapi docs to explain that. Not sure
everyone can cope, but I guess they better do. Since the use-case back
then was just udl, so simple legacy kms only, the damage was probably
rather limited. I'm not sure we can get away with that now, where kms code
has spread to funny places likey vulkan winsys code.

Or maybe we want a file priv flag you can set along the lines of "give me
less shitty hotunplug semantics for ioctls". Or maybe we can just change
the semantics, not crashing&burning shouldn't cause a regression :-)

For everything else (mmap, dma-buf fd, sync_file fd, syncobj fd) I think
the discussion is still more or less accurate.

Pekka, any thoughts?
-Daniel

> =

> Andrey
> =

> =

> > =

> > > I first thought it would be obvious for at least atomic commits to fa=
il
> > > appropriately, but then thinking again, it will only introduce new
> > > failures that are currently very hard to test for (VKMS to the rescue=
),
> > > and userspace would need to have code to correctly bail out for EIO
> > > rather than attempt fallbacks. The uevent telling the device is gone =
is
> > > going to come anyway. In between the device disappearance and uevent
> > > handling, it doesn't matter much what happens: the device is abruptly
> > > gone and the user will see a glitch anyway - he knows, he just yanked
> > > out the cable.
> > > =

> > > To me this decision is just to make life in userspace easier by not
> > > introducing a whole new type of error. However, if the kernel did
> > > return EIO instead, it would be impossible for me to see that as a
> > > kernel regression because the old behaviour was probably explosions
> > > everywhere anyway.
> > > =

> > > I heard that UDL and maybe some other drivers in the kernel already
> > > handle hot-unplug somehow. Maybe those are what would regress if the
> > > kernel returned EIO?
> > I think most of the not-explodey drivers currently just (mostly?) it all
> > hw errors. You kinda have to if you actually want to deal with hotunplu=
g,
> > stuff can disappear for any moment without warning anyway. Starting to
> > just skip everything is the simplest approach, plus in large parts of t=
he
> > modeset helpers we don't even return values - kernel drivers suck as mu=
ch
> > at handling the unexpected errors as userspace :-)
> > -Daniel
> > =

> > > =

> > > > > +
> > > > > +- Pending non-blocking KMS operations deliver the DRM events use=
rspace
> > > > > +  is expecting.
> > > > > +
> > > > > +- If underlying memory disappears, the mmaps are replaced with h=
armless
> > > > > +  zero pages where access does not raise SIGBUS. Reads return ze=
ros,
> > > > > +  writes are ignored.
> > > > > +
> > > > > +- dmabuf which point to memory that has disappeared are rewritte=
n to
> > > > > +  point to harmless zero pages, similar to mmaps. Imports still =
succeed
> > > > > +  both ways: an existing device importing a dmabuf pointing to
> > > > > +  disappeared memory, and a disappeared device importing any dma=
buf.
> > > > =

> > > > Same as above, I would expect drmPrimeHandleToFD and drmPrimeFDToHa=
ndle
> > > > to return -EIO in case device is detached
> > > I imagined a use case behind this: a Wayland compositor attempting to
> > > import a client's dmabuf. The GPU the client was using is
> > > hot-unplugged, meaning the dmabufs lose their storage. It is up to the
> > > client to handle its rendering GPU disappearance on its own, but also
> > > the compositor should not disconnect it because the GPU disappeared.
> > > It's not the client's fault the GPU disappeared.
> > > =

> > > In Wayland, failure to use a wl_buffer is considered a protocol error,
> > > and protocol errors are always fatal: the client is disconnected. The
> > > rationale is that the compositor must always be able to present the
> > > client buffer somehow. If the compositor cannot, then the client did
> > > not obey the protocol.
> > > =

> > > The fallback presentation path in a compositor is usually importing t=
he
> > > dmabuf to EGL, to be sampled from OpenGL. Normally the protocol
> > > guarantees that this works, so any failure to do so is a protocol
> > > violation. But if the GPU used by the client suddenly disappears and
> > > the imports start to fail, that is interpreted as a protocol violation
> > > unless the compositor can see why the import failed. Since the import
> > > is done via EGL, getting the right error code plumbed through from
> > > libdrm functions to the EGL caller would be a hassle. I don't see any
> > > error code in EGL_EXT_image_dma_buf_import reserved for "the dmabuf
> > > storage was hot-unplugged", and I doubt there is anything exclusively
> > > for only that in the EGL base spec either.
> > > =

> > > The cost of lying that the import worked is that the compositor will
> > > paint black or transparent where the window was supposed to be. It's a
> > > graphical glitch that is contrary to the Wayland design principles, b=
ut
> > > in this case a glitch is unavoidable: even if the compositor knew this
> > > buffer is now bad, what would it paint instead? It has nothing else to
> > > paint from. I'm assuming the compositor is using a different GPU than
> > > what disappeared.
> > > =

> > > Ideally, the client will eventually react to losing the GPU and either
> > > crash, quit, or switch its rendering to something that works which
> > > simply gives the compositor a new, working buffer without losing any
> > > window state in the process. If we risk the compositor disconnecting
> > > the client, then the client might not recover even if it wanted to.
> > > =

> > > > > +
> > > > > +- Render ioctls return EIO which is then handled in userspace dr=
ivers,
> > > > > +  e.g. Mesa, to have the device disappearance handled in the way
> > > > > +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> > > > > +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)
> > > > =

> > > > As far as I understood from our discussion we would reject any IOCTL
> > > > aimed at a device which is gone and not only render ioctls.
> > > Daniel?
> > > =

> > > =

> > > Thanks,
> > > pq
> > > =

> > > > Andrey
> > > > =

> > > > =

> > > > > +
> > > > > +Raising SIGBUS is not an option, because userspace cannot realis=
tically
> > > > > +handle it.  Signal handlers are global, which makes them extreme=
ly
> > > > > +difficult to use correctly from libraries like Mesa produces. Si=
gnal
> > > > > +handlers are not composable, you can't have different handlers f=
or GPU1
> > > > > +and GPU2 from different vendors, and a third handler for mmapped=
 regular
> > > > > +files.  Threads cause additional pain with signal handling as we=
ll.
> > > > > +
> > > > > +Only after userspace has closed all relevant DRM device and dmab=
uf file
> > > > > +descriptors and removed all mmaps, the DRM driver can tear down =
its
> > > > > +instance for the device that no longer exists. If the same physi=
cal
> > > > > +device somehow comes back in the mean time, it shall be a new DRM
> > > > > +device.
> > > > > +
> > > > >    .. _drm_driver_ioctl:
> > > > >    IOCTL Support on Device Nodes
> > =

> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
