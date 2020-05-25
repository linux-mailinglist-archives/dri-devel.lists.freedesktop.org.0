Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776141E114E
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985D789FBC;
	Mon, 25 May 2020 15:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCD689FBC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 15:09:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q11so5216444wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RDQcxsHbiaLd6R1ibp6Vsvcd0s+xx8gnh90heZpwAf8=;
 b=EV9CPgXnY+uGHT8Y4BJPXKsr2iVPeVTI4sSbv1M3pxY4q848kQWqtOtE06kZfY3b5d
 xu9mXV+HtguALkRNurQuoo5TomnGzHwTri6cWmhypJDb8T3Hp1Q4yqFhAHDKJirTTy+7
 dBXVrPpV8jIG+Xzvh7FSY3ZWMVWBv4wZVubv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RDQcxsHbiaLd6R1ibp6Vsvcd0s+xx8gnh90heZpwAf8=;
 b=eCNALtgrnl2/9hl14aH0+1IcuYtx7nVd79BIYaInGG0PpFQbYPkNG61OiWa4C30ggt
 uDdA+7Ar6FKh568o0+19e+L4hxiA9udPY9aNEeFFpEMc9bOcIiXyDKpyuyqXhTzInGcE
 Vkp9UApV3Z+ly2N2JTMTaRi+TIewA/2p8/QBigKBuH+C2bkomAsNwFTq3G2j1hW8+1n/
 c5m0seMYUsSdJszvFfIW5cGldMFN7Wa5V3ELK1Op1AmRVaBAT31FCaY+zgp2YDDqzMQB
 Vxw7Up8h4FioVFrvmDacKDUwO6pZiAL+nOgrzRxKdI7fod99GrMgQElgTq8a8NTty9/0
 +Osw==
X-Gm-Message-State: AOAM530HYjBxFaZNv+bNa9y3TXpXyv70AIrNaIGBoe7Cxuk5elHcQAar
 f6jrIya32A5iIwYitma6tBAXjw==
X-Google-Smtp-Source: ABdhPJwwfDvqAgyVzps+o/GeTC+QusAMzKUNSLb5bnNGxQM7Sq+py0NrUgop+AaPQ+TQaXR2BVl1ow==
X-Received: by 2002:adf:e64b:: with SMTP id b11mr14844201wrn.402.1590419397725; 
 Mon, 25 May 2020 08:09:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v24sm19266155wmh.45.2020.05.25.08.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 08:09:56 -0700 (PDT)
Date: Mon, 25 May 2020 17:09:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200525150955.GI206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
 <20200520141908.314607bc@eldfell.localdomain>
 <20200520124617.GX206103@phenom.ffwll.local>
 <382ab1ab-a89c-e384-3200-0cb3257c25bb@amd.com>
 <20200525142804.GD206103@phenom.ffwll.local>
 <20200525175519.0289a728@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525175519.0289a728@eldfell.localdomain>
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 05:55:19PM +0300, Pekka Paalanen wrote:
> On Mon, 25 May 2020 16:28:04 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> =

> > On Wed, May 20, 2020 at 10:50:41AM -0400, Andrey Grodzovsky wrote:
> > > =

> > > On 5/20/20 8:46 AM, Daniel Vetter wrote:  =

> > > > On Wed, May 20, 2020 at 02:19:08PM +0300, Pekka Paalanen wrote:  =

> > > > > On Tue, 19 May 2020 10:37:12 -0400
> > > > > Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
> > > > >   =

> > > > > > Thanks for the summary, does put things in order and makes it e=
asier to
> > > > > > comprehend all the TODOs, some questions bellow
> > > > > > =

> > > > > > On 5/19/20 6:06 AM, Pekka Paalanen wrote:  =

> > > > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > =

> > > > > > > Set up the expectations on how hot-unplugging a DRM device sh=
ould look like to
> > > > > > > userspace.
> > > > > > > =

> > > > > > > Written by Daniel Vetter's request and largely based on his c=
omments in IRC and
> > > > > > > from https://nam11.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F26548=
4.html&amp;data=3D02%7C01%7CAndrey.Grodzovsky%40amd.com%7Ca4da241ff1e54610d=
95508d7fcbbcc11%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63725575582820=
9496&amp;sdata=3DYDFoP2g3z3IiB77sRvAmPB%2Fix%2FV0Mh78YcCSAAlhXdg%3D&amp;res=
erved=3D0 .
> > > > > > > =

> > > > > > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > > > > Cc: Sean Paul <sean@poorly.run>
> > > > > > > =

> > > > > > > ---
> > > > > > > =

> > > > > > > Disclaimer: I am a userspace developer writing for other user=
space developers.
> > > > > > > I took some liberties in defining what should happen without =
knowing what is
> > > > > > > actually possible or what existing drivers already implement.
> > > > > > > ---
> > > > > > >    Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++=
++++++++++++
> > > > > > >    1 file changed, 75 insertions(+)
> > > > > > > =

> > > > > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/g=
pu/drm-uapi.rst
> > > > > > > index 56fec6ed1ad8..80db4abd2cbd 100644
> > > > > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > > > > @@ -1,3 +1,5 @@
> > > > > > > +.. Copyright 2020 DisplayLink (UK) Ltd.
> > > > > > > +
> > > > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >    Userland interfaces
> > > > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > @@ -162,6 +164,79 @@ other hand, a driver requires shared sta=
te between clients which is
> > > > > > >    visible to user-space and accessible beyond open-file boun=
daries, they
> > > > > > >    cannot support render nodes.
> > > > > > > +Device Hot-Unplug
> > > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > +
> > > > > > > +.. note::
> > > > > > > +   The following is the plan. Implementation is not there yet
> > > > > > > +   (2020 May 13).
> > > > > > > +
> > > > > > > +Graphics devices (display and/or render) may be connected vi=
a USB (e.g.
> > > > > > > +display adapters or docking stations) or Thunderbolt (e.g. e=
GPU). An end
> > > > > > > +user is able to hot-unplug this kind of devices while they a=
re being
> > > > > > > +used, and expects that the very least the machine does not c=
rash. Any
> > > > > > > +damage from hot-unplugging a DRM device needs to be limited =
as much as
> > > > > > > +possible and userspace must be given the chance to handle it=
 if it wants
> > > > > > > +to. Ideally, unplugging a DRM device still lets a desktop to=
 continue
> > > > > > > +running, but that is going to need explicit support througho=
ut the whole
> > > > > > > +graphics stack: from kernel and userspace drivers, through d=
isplay
> > > > > > > +servers, via window system protocols, and in applications an=
d libraries.
> > > > > > > +
> > > > > > > +Other scenarios that should lead to the same are: unrecovera=
ble GPU
> > > > > > > +crash, PCI device disappearing off the bus, or forced unbind=
 of a driver
> > > > > > > +from the physical device.
> > > > > > > +
> > > > > > > +In other words, from userspace perspective everything needs =
to keep on
> > > > > > > +working more or less, until userspace stops using the disapp=
eared DRM
> > > > > > > +device and closes it completely. Userspace will learn of the=
 device
> > > > > > > +disappearance from the device removed uevent or in some case=
s specific
> > > > > > > +ioctls returning EIO.
> > > > > > > +
> > > > > > > +This goal raises at least the following requirements for the=
 kernel and
> > > > > > > +drivers:
> > > > > > > +
> > > > > > > +- The kernel must not hang, crash or oops, no matter what us=
erspace was
> > > > > > > +  in the middle of doing when the device disappeared.
> > > > > > > +
> > > > > > > +- All GPU jobs that can no longer run must have their fences
> > > > > > > +  force-signalled to avoid inflicting hangs to userspace.
> > > > > > > +
> > > > > > > +- KMS connectors must change their status to disconnected.
> > > > > > > +
> > > > > > > +- Legacy modesets and pageflips fake success.
> > > > > > > +
> > > > > > > +- Atomic commits, both real and TEST_ONLY, fake success.  =

> > > > > > =

> > > > > > Why wouldn't we return -EIO for the atommic commit IOTCL/legasy=
 pflip
> > > > > > and modeset ioctls here same way as you suggested returning -EI=
O for
> > > > > > render ioctl ?  =

> > > > > Hi,
> > > > > =

> > > > > that is more of a question for Daniel Vetter than me. I believe h=
e is
> > > > > worried that userspace will get the error handling horribly wrong
> > > > > anyway, because it needs to be handled in every single display se=
rver
> > > > > project. Render ioctl errors OTOH need to be handled only in the
> > > > > corresponding Mesa or other userspace driver, and for render ther=
e are
> > > > > API (OpenGL/EGL, Vulkan) specs that say how it must be handled to=
 fill
> > > > > the API contract. Because of the API contract, those are more lik=
ely to
> > > > > have reasonable error handling in place already.  =

> > > > Yup pretty much. Atm compositors expect an -EINVAL (especially for
> > > > TEST_ONLY), some cope with the semi-spurious -EBUSY we still throw =
around,
> > > > but I expect most will just die if the get an -ENOMEM or -EIO or re=
ally
> > > > anything.
> > > > =

> > > > I think one area where we've historically thrown some spurious erro=
rs is
> > > > also vblank ioctls, since they don't take full locks and sometimes =
the
> > > > kernel needs to sneak in a modeset for some reason (gpu recovery, d=
p link
> > > > recovery, ...).
> > > > =

> > > > Either way I don't think there's anything the compositor can do tha=
n just
> > > > ignore the error and carry on.  =

> > > =

> > > =

> > > So currently drm_ioctl will just check for drm_dev_is_unplugged and r=
eturn
> > > -ENODEV at the very beginning of the function (https://elixir.bootlin=
.com/linux/latest/source/drivers/gpu/drm/drm_ioctl.c#L825)
> > > meaning that currently we blanket failure any IOCTL in case the devic=
e is
> > > unplagued (ignoring the race condition if the device unplugged after =
the
> > > check). So do we want to remove this check and put it only for render=
 ioctls
> > > (which are those ? e.g. for amdgpu there is=A0 AMDGPU_CS ioctl) but n=
ot for
> > > mode setting/dma_buf_import/dma_buf_export ioctls ? What about other =
types
> > > of ioctls which are non of the listed above ?  =

> > =

> > Hm right, and this goes back all the way to first usb udl support:
> > =

> > commit 2c07a21d6fb0be47fda696a618b726ea258ed1dd
> > Author: Dave Airlie <airlied@redhat.com>
> > Date:   Mon Feb 20 14:18:07 2012 +0000
> > =

> >     drm: add core support for unplugging a device (v2)
> > =

> > So I guess we need to change the uapi docs to explain that. Not sure
> > everyone can cope, but I guess they better do. Since the use-case back
> > then was just udl, so simple legacy kms only, the damage was probably
> > rather limited. I'm not sure we can get away with that now, where kms c=
ode
> > has spread to funny places likey vulkan winsys code.
> > =

> > Or maybe we want a file priv flag you can set along the lines of "give =
me
> > less shitty hotunplug semantics for ioctls". Or maybe we can just change
> > the semantics, not crashing&burning shouldn't cause a regression :-)
> > =

> > For everything else (mmap, dma-buf fd, sync_file fd, syncobj fd) I think
> > the discussion is still more or less accurate.
> > =

> > Pekka, any thoughts?
> =

> Hi,
> =

> is ENODEV unique to this particular failure?

Not really sure, we'd need to audit all of drm ...

> Returning errors instead of faking success was my first idea, but you
> already convinced me that faking is at least as good if not better. :-)
> =

> So as long as the error code returned is unique to hot-unplug or other
> "oops, the device is gone" conditions, I think I'm fine. Weston does
> not handle ENODEV any way, it never did, and it certainly cannot be
> called a kernel regression.
> =

> As a Weston developer, I don't mind adding checks for ENODEV. But if I
> don't have to, even better. Weston is going to need more code to handle
> DRM device unplug in any case.
> =

> Sorry, no preference from me. ;-)
> =

> I do agree that replacing ENODEV with fake success is hard to imagine
> regressing anything. It's something you can do in the kernel at any
> time easily, but going from fake success to error is going to be
> painful. Maybe don't change things until there is a good reason to?
> =

> We need a kernel that doesn't crash before we can properly test what
> would be best for userspace, fake or error.

One upshot of faking stuff and only bailing in low-level hw code is that
it makes validating the races when you hotunplug easier - if we remove the
early bail-out check even an ioctl later on will look like it raced with
the hotunplug path in the kernel. So better assurance that things won't
blow up badly.

Otoh the early bail out in the top-level ioctl code increases the odds
that you'll survive even on a driver that's totally buggy.

So yeah I guess maybe we should just document that currently you get an
-ENODEV and maybe have the option mentioned that we might change this
going forward. See also

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#recommended-ioctl-re=
turn-values

I think that needs an update, at least clarify that "not present" includes
"no longer present".
-Daniel

> =

> =

> Thanks,
> pq
> =

> =

> > -Daniel
> > =

> > > =

> > > Andrey
> > > =

> > >   =

> > > >   =

> > > > > I first thought it would be obvious for at least atomic commits t=
o fail
> > > > > appropriately, but then thinking again, it will only introduce new
> > > > > failures that are currently very hard to test for (VKMS to the re=
scue),
> > > > > and userspace would need to have code to correctly bail out for E=
IO
> > > > > rather than attempt fallbacks. The uevent telling the device is g=
one is
> > > > > going to come anyway. In between the device disappearance and uev=
ent
> > > > > handling, it doesn't matter much what happens: the device is abru=
ptly
> > > > > gone and the user will see a glitch anyway - he knows, he just ya=
nked
> > > > > out the cable.
> > > > > =

> > > > > To me this decision is just to make life in userspace easier by n=
ot
> > > > > introducing a whole new type of error. However, if the kernel did
> > > > > return EIO instead, it would be impossible for me to see that as a
> > > > > kernel regression because the old behaviour was probably explosio=
ns
> > > > > everywhere anyway.
> > > > > =

> > > > > I heard that UDL and maybe some other drivers in the kernel alrea=
dy
> > > > > handle hot-unplug somehow. Maybe those are what would regress if =
the
> > > > > kernel returned EIO?  =

> > > > I think most of the not-explodey drivers currently just (mostly?) i=
t all
> > > > hw errors. You kinda have to if you actually want to deal with hotu=
nplug,
> > > > stuff can disappear for any moment without warning anyway. Starting=
 to
> > > > just skip everything is the simplest approach, plus in large parts =
of the
> > > > modeset helpers we don't even return values - kernel drivers suck a=
s much
> > > > at handling the unexpected errors as userspace :-)
> > > > -Daniel
> > > >   =

> > > > >   =

> > > > > > > +
> > > > > > > +- Pending non-blocking KMS operations deliver the DRM events=
 userspace
> > > > > > > +  is expecting.
> > > > > > > +
> > > > > > > +- If underlying memory disappears, the mmaps are replaced wi=
th harmless
> > > > > > > +  zero pages where access does not raise SIGBUS. Reads retur=
n zeros,
> > > > > > > +  writes are ignored.
> > > > > > > +
> > > > > > > +- dmabuf which point to memory that has disappeared are rewr=
itten to
> > > > > > > +  point to harmless zero pages, similar to mmaps. Imports st=
ill succeed
> > > > > > > +  both ways: an existing device importing a dmabuf pointing =
to
> > > > > > > +  disappeared memory, and a disappeared device importing any=
 dmabuf.  =

> > > > > > =

> > > > > > Same as above, I would expect drmPrimeHandleToFD and drmPrimeFD=
ToHandle
> > > > > > to return -EIO in case device is detached  =

> > > > > I imagined a use case behind this: a Wayland compositor attemptin=
g to
> > > > > import a client's dmabuf. The GPU the client was using is
> > > > > hot-unplugged, meaning the dmabufs lose their storage. It is up t=
o the
> > > > > client to handle its rendering GPU disappearance on its own, but =
also
> > > > > the compositor should not disconnect it because the GPU disappear=
ed.
> > > > > It's not the client's fault the GPU disappeared.
> > > > > =

> > > > > In Wayland, failure to use a wl_buffer is considered a protocol e=
rror,
> > > > > and protocol errors are always fatal: the client is disconnected.=
 The
> > > > > rationale is that the compositor must always be able to present t=
he
> > > > > client buffer somehow. If the compositor cannot, then the client =
did
> > > > > not obey the protocol.
> > > > > =

> > > > > The fallback presentation path in a compositor is usually importi=
ng the
> > > > > dmabuf to EGL, to be sampled from OpenGL. Normally the protocol
> > > > > guarantees that this works, so any failure to do so is a protocol
> > > > > violation. But if the GPU used by the client suddenly disappears =
and
> > > > > the imports start to fail, that is interpreted as a protocol viol=
ation
> > > > > unless the compositor can see why the import failed. Since the im=
port
> > > > > is done via EGL, getting the right error code plumbed through from
> > > > > libdrm functions to the EGL caller would be a hassle. I don't see=
 any
> > > > > error code in EGL_EXT_image_dma_buf_import reserved for "the dmab=
uf
> > > > > storage was hot-unplugged", and I doubt there is anything exclusi=
vely
> > > > > for only that in the EGL base spec either.
> > > > > =

> > > > > The cost of lying that the import worked is that the compositor w=
ill
> > > > > paint black or transparent where the window was supposed to be. I=
t's a
> > > > > graphical glitch that is contrary to the Wayland design principle=
s, but
> > > > > in this case a glitch is unavoidable: even if the compositor knew=
 this
> > > > > buffer is now bad, what would it paint instead? It has nothing el=
se to
> > > > > paint from. I'm assuming the compositor is using a different GPU =
than
> > > > > what disappeared.
> > > > > =

> > > > > Ideally, the client will eventually react to losing the GPU and e=
ither
> > > > > crash, quit, or switch its rendering to something that works which
> > > > > simply gives the compositor a new, working buffer without losing =
any
> > > > > window state in the process. If we risk the compositor disconnect=
ing
> > > > > the client, then the client might not recover even if it wanted t=
o.
> > > > >   =

> > > > > > > +
> > > > > > > +- Render ioctls return EIO which is then handled in userspac=
e drivers,
> > > > > > > +  e.g. Mesa, to have the device disappearance handled in the=
 way
> > > > > > > +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> > > > > > > +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)  =

> > > > > > =

> > > > > > As far as I understood from our discussion we would reject any =
IOCTL
> > > > > > aimed at a device which is gone and not only render ioctls.  =

> > > > > Daniel?
> > > > > =

> > > > > =

> > > > > Thanks,
> > > > > pq
> > > > >   =

> > > > > > Andrey
> > > > > > =

> > > > > >   =

> > > > > > > +
> > > > > > > +Raising SIGBUS is not an option, because userspace cannot re=
alistically
> > > > > > > +handle it.  Signal handlers are global, which makes them ext=
remely
> > > > > > > +difficult to use correctly from libraries like Mesa produces=
. Signal
> > > > > > > +handlers are not composable, you can't have different handle=
rs for GPU1
> > > > > > > +and GPU2 from different vendors, and a third handler for mma=
pped regular
> > > > > > > +files.  Threads cause additional pain with signal handling a=
s well.
> > > > > > > +
> > > > > > > +Only after userspace has closed all relevant DRM device and =
dmabuf file
> > > > > > > +descriptors and removed all mmaps, the DRM driver can tear d=
own its
> > > > > > > +instance for the device that no longer exists. If the same p=
hysical
> > > > > > > +device somehow comes back in the mean time, it shall be a ne=
w DRM
> > > > > > > +device.
> > > > > > > +
> > > > > > >    .. _drm_driver_ioctl:
> > > > > > >    IOCTL Support on Device Nodes  =

> > > > =

> > > >   =

> > =

> =




-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
