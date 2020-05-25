Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06141E110D
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22AE89F82;
	Mon, 25 May 2020 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B4989F82
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:55:25 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z206so7011575lfc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=HLMmcjDB25ezDUI+CbZfisQu0Cbezmt88OGXemM3I8s=;
 b=qZwpfSiEX4QwGGYDGVoogDGHpcQxm7FEquEnSa/pNMyP9SlR6qt+oPSCI5LyqeCIza
 SBCgAbANCv/5lCqbZ82mQfF9RRHpABjan+CJvcPOhlEnt0nEi2oCE+AJMNmCvLtYfDKZ
 RxSl9Mqn3X/QETKPOi0MOhIxIC873yd5UyR/RV4gz6fa202bCvQVPPokGsWkyVwyeHZ0
 cIm5QkPw4KaoId4W5AZj6opM/8pRVkgfrEbD7tvV/E7xp6LEpZjcMwyWUTr4yIyrCCaP
 tuVWnKZPCX/6gJiyGMftYBMoAw6c6n0y8LI3DKJIIv19z6KlScFiWZThdr03376GUcbn
 rblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HLMmcjDB25ezDUI+CbZfisQu0Cbezmt88OGXemM3I8s=;
 b=E8XdYp7jjEzkXyYwAXSnZx0pMhHSkQjrlOEwlHp/apAHAAs8D4Eac09KtTLTmVLvQP
 lN1s/WLGFarlOnYN2Rlh+PAyIOg3Opig+7tw4rYbqgWCJqA15lK9egg6vujDbty8R8ZK
 wDIj6P/RLNxBV67YN+Wmiyyu6i655WpAOLkDTyVu55eeWToeb6UFV56FPwiXBfwXERaN
 F9AI9ebJYJiKXqkVA/6ChsKe1eUKe4BCS/X71K8bWwABS7tBszHFG2cAzz55md47Riti
 K2ZZabSR/QAUCtD5zsy8gJfQKgGy3ZpS8aG4TjB0TOwDyGCj2IrNF2922a4xsvS/MK5v
 ajtg==
X-Gm-Message-State: AOAM530y4jKvhcOxHWKJNOKcBexe9kB32rMB8hqwvZIOC7n5svvZoP9K
 811SiT1lXAkNutVLExARkek=
X-Google-Smtp-Source: ABdhPJzkFyxPs1vVG34TON+6c9JP1G+zJ8J0f07nQ41ZyJse317CbAhsrrBgxKwoivnIuCwUCdq/kA==
X-Received: by 2002:a19:987:: with SMTP id 129mr14672203lfj.8.1590418523582;
 Mon, 25 May 2020 07:55:23 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h26sm5315757lja.0.2020.05.25.07.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:55:23 -0700 (PDT)
Date: Mon, 25 May 2020 17:55:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200525175519.0289a728@eldfell.localdomain>
In-Reply-To: <20200525142804.GD206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
 <20200520141908.314607bc@eldfell.localdomain>
 <20200520124617.GX206103@phenom.ffwll.local>
 <382ab1ab-a89c-e384-3200-0cb3257c25bb@amd.com>
 <20200525142804.GD206103@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0418958313=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0418958313==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9b.7TALwzu214SAjzDzgTXR"; protocol="application/pgp-signature"

--Sig_/9b.7TALwzu214SAjzDzgTXR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 25 May 2020 16:28:04 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, May 20, 2020 at 10:50:41AM -0400, Andrey Grodzovsky wrote:
> >=20
> > On 5/20/20 8:46 AM, Daniel Vetter wrote: =20
> > > On Wed, May 20, 2020 at 02:19:08PM +0300, Pekka Paalanen wrote: =20
> > > > On Tue, 19 May 2020 10:37:12 -0400
> > > > Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
> > > >  =20
> > > > > Thanks for the summary, does put things in order and makes it eas=
ier to
> > > > > comprehend all the TODOs, some questions bellow
> > > > >=20
> > > > > On 5/19/20 6:06 AM, Pekka Paalanen wrote: =20
> > > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > >=20
> > > > > > Set up the expectations on how hot-unplugging a DRM device shou=
ld look like to
> > > > > > userspace.
> > > > > >=20
> > > > > > Written by Daniel Vetter's request and largely based on his com=
ments in IRC and
> > > > > > from https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.=
html&amp;data=3D02%7C01%7CAndrey.Grodzovsky%40amd.com%7Ca4da241ff1e54610d95=
508d7fcbbcc11%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6372557558282094=
96&amp;sdata=3DYDFoP2g3z3IiB77sRvAmPB%2Fix%2FV0Mh78YcCSAAlhXdg%3D&amp;reser=
ved=3D0 .
> > > > > >=20
> > > > > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > > > Cc: Sean Paul <sean@poorly.run>
> > > > > >=20
> > > > > > ---
> > > > > >=20
> > > > > > Disclaimer: I am a userspace developer writing for other usersp=
ace developers.
> > > > > > I took some liberties in defining what should happen without kn=
owing what is
> > > > > > actually possible or what existing drivers already implement.
> > > > > > ---
> > > > > >    Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++=
++++++++++
> > > > > >    1 file changed, 75 insertions(+)
> > > > > >=20
> > > > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu=
/drm-uapi.rst
> > > > > > index 56fec6ed1ad8..80db4abd2cbd 100644
> > > > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > > > @@ -1,3 +1,5 @@
> > > > > > +.. Copyright 2020 DisplayLink (UK) Ltd.
> > > > > > +
> > > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > >    Userland interfaces
> > > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > @@ -162,6 +164,79 @@ other hand, a driver requires shared state=
 between clients which is
> > > > > >    visible to user-space and accessible beyond open-file bounda=
ries, they
> > > > > >    cannot support render nodes.
> > > > > > +Device Hot-Unplug
> > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > +
> > > > > > +.. note::
> > > > > > +   The following is the plan. Implementation is not there yet
> > > > > > +   (2020 May 13).
> > > > > > +
> > > > > > +Graphics devices (display and/or render) may be connected via =
USB (e.g.
> > > > > > +display adapters or docking stations) or Thunderbolt (e.g. eGP=
U). An end
> > > > > > +user is able to hot-unplug this kind of devices while they are=
 being
> > > > > > +used, and expects that the very least the machine does not cra=
sh. Any
> > > > > > +damage from hot-unplugging a DRM device needs to be limited as=
 much as
> > > > > > +possible and userspace must be given the chance to handle it i=
f it wants
> > > > > > +to. Ideally, unplugging a DRM device still lets a desktop to c=
ontinue
> > > > > > +running, but that is going to need explicit support throughout=
 the whole
> > > > > > +graphics stack: from kernel and userspace drivers, through dis=
play
> > > > > > +servers, via window system protocols, and in applications and =
libraries.
> > > > > > +
> > > > > > +Other scenarios that should lead to the same are: unrecoverabl=
e GPU
> > > > > > +crash, PCI device disappearing off the bus, or forced unbind o=
f a driver
> > > > > > +from the physical device.
> > > > > > +
> > > > > > +In other words, from userspace perspective everything needs to=
 keep on
> > > > > > +working more or less, until userspace stops using the disappea=
red DRM
> > > > > > +device and closes it completely. Userspace will learn of the d=
evice
> > > > > > +disappearance from the device removed uevent or in some cases =
specific
> > > > > > +ioctls returning EIO.
> > > > > > +
> > > > > > +This goal raises at least the following requirements for the k=
ernel and
> > > > > > +drivers:
> > > > > > +
> > > > > > +- The kernel must not hang, crash or oops, no matter what user=
space was
> > > > > > +  in the middle of doing when the device disappeared.
> > > > > > +
> > > > > > +- All GPU jobs that can no longer run must have their fences
> > > > > > +  force-signalled to avoid inflicting hangs to userspace.
> > > > > > +
> > > > > > +- KMS connectors must change their status to disconnected.
> > > > > > +
> > > > > > +- Legacy modesets and pageflips fake success.
> > > > > > +
> > > > > > +- Atomic commits, both real and TEST_ONLY, fake success. =20
> > > > >=20
> > > > > Why wouldn't we return -EIO for the atommic commit IOTCL/legasy p=
flip
> > > > > and modeset ioctls here same way as you suggested returning -EIO =
for
> > > > > render ioctl ? =20
> > > > Hi,
> > > >=20
> > > > that is more of a question for Daniel Vetter than me. I believe he =
is
> > > > worried that userspace will get the error handling horribly wrong
> > > > anyway, because it needs to be handled in every single display serv=
er
> > > > project. Render ioctl errors OTOH need to be handled only in the
> > > > corresponding Mesa or other userspace driver, and for render there =
are
> > > > API (OpenGL/EGL, Vulkan) specs that say how it must be handled to f=
ill
> > > > the API contract. Because of the API contract, those are more likel=
y to
> > > > have reasonable error handling in place already. =20
> > > Yup pretty much. Atm compositors expect an -EINVAL (especially for
> > > TEST_ONLY), some cope with the semi-spurious -EBUSY we still throw ar=
ound,
> > > but I expect most will just die if the get an -ENOMEM or -EIO or real=
ly
> > > anything.
> > >=20
> > > I think one area where we've historically thrown some spurious errors=
 is
> > > also vblank ioctls, since they don't take full locks and sometimes the
> > > kernel needs to sneak in a modeset for some reason (gpu recovery, dp =
link
> > > recovery, ...).
> > >=20
> > > Either way I don't think there's anything the compositor can do than =
just
> > > ignore the error and carry on. =20
> >=20
> >=20
> > So currently drm_ioctl will just check for drm_dev_is_unplugged and ret=
urn
> > -ENODEV at the very beginning of the function (https://elixir.bootlin.c=
om/linux/latest/source/drivers/gpu/drm/drm_ioctl.c#L825)
> > meaning that currently we blanket failure any IOCTL in case the device =
is
> > unplagued (ignoring the race condition if the device unplugged after the
> > check). So do we want to remove this check and put it only for render i=
octls
> > (which are those ? e.g. for amdgpu there is=C2=A0 AMDGPU_CS ioctl) but =
not for
> > mode setting/dma_buf_import/dma_buf_export ioctls ? What about other ty=
pes
> > of ioctls which are non of the listed above ? =20
>=20
> Hm right, and this goes back all the way to first usb udl support:
>=20
> commit 2c07a21d6fb0be47fda696a618b726ea258ed1dd
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Mon Feb 20 14:18:07 2012 +0000
>=20
>     drm: add core support for unplugging a device (v2)
>=20
> So I guess we need to change the uapi docs to explain that. Not sure
> everyone can cope, but I guess they better do. Since the use-case back
> then was just udl, so simple legacy kms only, the damage was probably
> rather limited. I'm not sure we can get away with that now, where kms code
> has spread to funny places likey vulkan winsys code.
>=20
> Or maybe we want a file priv flag you can set along the lines of "give me
> less shitty hotunplug semantics for ioctls". Or maybe we can just change
> the semantics, not crashing&burning shouldn't cause a regression :-)
>=20
> For everything else (mmap, dma-buf fd, sync_file fd, syncobj fd) I think
> the discussion is still more or less accurate.
>=20
> Pekka, any thoughts?

Hi,

is ENODEV unique to this particular failure?

Returning errors instead of faking success was my first idea, but you
already convinced me that faking is at least as good if not better. :-)

So as long as the error code returned is unique to hot-unplug or other
"oops, the device is gone" conditions, I think I'm fine. Weston does
not handle ENODEV any way, it never did, and it certainly cannot be
called a kernel regression.

As a Weston developer, I don't mind adding checks for ENODEV. But if I
don't have to, even better. Weston is going to need more code to handle
DRM device unplug in any case.

Sorry, no preference from me. ;-)

I do agree that replacing ENODEV with fake success is hard to imagine
regressing anything. It's something you can do in the kernel at any
time easily, but going from fake success to error is going to be
painful. Maybe don't change things until there is a good reason to?

We need a kernel that doesn't crash before we can properly test what
would be best for userspace, fake or error.


Thanks,
pq


> -Daniel
>=20
> >=20
> > Andrey
> >=20
> >  =20
> > >  =20
> > > > I first thought it would be obvious for at least atomic commits to =
fail
> > > > appropriately, but then thinking again, it will only introduce new
> > > > failures that are currently very hard to test for (VKMS to the resc=
ue),
> > > > and userspace would need to have code to correctly bail out for EIO
> > > > rather than attempt fallbacks. The uevent telling the device is gon=
e is
> > > > going to come anyway. In between the device disappearance and uevent
> > > > handling, it doesn't matter much what happens: the device is abrupt=
ly
> > > > gone and the user will see a glitch anyway - he knows, he just yank=
ed
> > > > out the cable.
> > > >=20
> > > > To me this decision is just to make life in userspace easier by not
> > > > introducing a whole new type of error. However, if the kernel did
> > > > return EIO instead, it would be impossible for me to see that as a
> > > > kernel regression because the old behaviour was probably explosions
> > > > everywhere anyway.
> > > >=20
> > > > I heard that UDL and maybe some other drivers in the kernel already
> > > > handle hot-unplug somehow. Maybe those are what would regress if the
> > > > kernel returned EIO? =20
> > > I think most of the not-explodey drivers currently just (mostly?) it =
all
> > > hw errors. You kinda have to if you actually want to deal with hotunp=
lug,
> > > stuff can disappear for any moment without warning anyway. Starting to
> > > just skip everything is the simplest approach, plus in large parts of=
 the
> > > modeset helpers we don't even return values - kernel drivers suck as =
much
> > > at handling the unexpected errors as userspace :-)
> > > -Daniel
> > >  =20
> > > >  =20
> > > > > > +
> > > > > > +- Pending non-blocking KMS operations deliver the DRM events u=
serspace
> > > > > > +  is expecting.
> > > > > > +
> > > > > > +- If underlying memory disappears, the mmaps are replaced with=
 harmless
> > > > > > +  zero pages where access does not raise SIGBUS. Reads return =
zeros,
> > > > > > +  writes are ignored.
> > > > > > +
> > > > > > +- dmabuf which point to memory that has disappeared are rewrit=
ten to
> > > > > > +  point to harmless zero pages, similar to mmaps. Imports stil=
l succeed
> > > > > > +  both ways: an existing device importing a dmabuf pointing to
> > > > > > +  disappeared memory, and a disappeared device importing any d=
mabuf. =20
> > > > >=20
> > > > > Same as above, I would expect drmPrimeHandleToFD and drmPrimeFDTo=
Handle
> > > > > to return -EIO in case device is detached =20
> > > > I imagined a use case behind this: a Wayland compositor attempting =
to
> > > > import a client's dmabuf. The GPU the client was using is
> > > > hot-unplugged, meaning the dmabufs lose their storage. It is up to =
the
> > > > client to handle its rendering GPU disappearance on its own, but al=
so
> > > > the compositor should not disconnect it because the GPU disappeared.
> > > > It's not the client's fault the GPU disappeared.
> > > >=20
> > > > In Wayland, failure to use a wl_buffer is considered a protocol err=
or,
> > > > and protocol errors are always fatal: the client is disconnected. T=
he
> > > > rationale is that the compositor must always be able to present the
> > > > client buffer somehow. If the compositor cannot, then the client did
> > > > not obey the protocol.
> > > >=20
> > > > The fallback presentation path in a compositor is usually importing=
 the
> > > > dmabuf to EGL, to be sampled from OpenGL. Normally the protocol
> > > > guarantees that this works, so any failure to do so is a protocol
> > > > violation. But if the GPU used by the client suddenly disappears and
> > > > the imports start to fail, that is interpreted as a protocol violat=
ion
> > > > unless the compositor can see why the import failed. Since the impo=
rt
> > > > is done via EGL, getting the right error code plumbed through from
> > > > libdrm functions to the EGL caller would be a hassle. I don't see a=
ny
> > > > error code in EGL_EXT_image_dma_buf_import reserved for "the dmabuf
> > > > storage was hot-unplugged", and I doubt there is anything exclusive=
ly
> > > > for only that in the EGL base spec either.
> > > >=20
> > > > The cost of lying that the import worked is that the compositor will
> > > > paint black or transparent where the window was supposed to be. It'=
s a
> > > > graphical glitch that is contrary to the Wayland design principles,=
 but
> > > > in this case a glitch is unavoidable: even if the compositor knew t=
his
> > > > buffer is now bad, what would it paint instead? It has nothing else=
 to
> > > > paint from. I'm assuming the compositor is using a different GPU th=
an
> > > > what disappeared.
> > > >=20
> > > > Ideally, the client will eventually react to losing the GPU and eit=
her
> > > > crash, quit, or switch its rendering to something that works which
> > > > simply gives the compositor a new, working buffer without losing any
> > > > window state in the process. If we risk the compositor disconnecting
> > > > the client, then the client might not recover even if it wanted to.
> > > >  =20
> > > > > > +
> > > > > > +- Render ioctls return EIO which is then handled in userspace =
drivers,
> > > > > > +  e.g. Mesa, to have the device disappearance handled in the w=
ay
> > > > > > +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> > > > > > +  Vulkan: VK_ERROR_DEVICE_LOST; etc.) =20
> > > > >=20
> > > > > As far as I understood from our discussion we would reject any IO=
CTL
> > > > > aimed at a device which is gone and not only render ioctls. =20
> > > > Daniel?
> > > >=20
> > > >=20
> > > > Thanks,
> > > > pq
> > > >  =20
> > > > > Andrey
> > > > >=20
> > > > >  =20
> > > > > > +
> > > > > > +Raising SIGBUS is not an option, because userspace cannot real=
istically
> > > > > > +handle it.  Signal handlers are global, which makes them extre=
mely
> > > > > > +difficult to use correctly from libraries like Mesa produces. =
Signal
> > > > > > +handlers are not composable, you can't have different handlers=
 for GPU1
> > > > > > +and GPU2 from different vendors, and a third handler for mmapp=
ed regular
> > > > > > +files.  Threads cause additional pain with signal handling as =
well.
> > > > > > +
> > > > > > +Only after userspace has closed all relevant DRM device and dm=
abuf file
> > > > > > +descriptors and removed all mmaps, the DRM driver can tear dow=
n its
> > > > > > +instance for the device that no longer exists. If the same phy=
sical
> > > > > > +device somehow comes back in the mean time, it shall be a new =
DRM
> > > > > > +device.
> > > > > > +
> > > > > >    .. _drm_driver_ioctl:
> > > > > >    IOCTL Support on Device Nodes =20
> > >=20
> > >  =20
>=20


--Sig_/9b.7TALwzu214SAjzDzgTXR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7L3FcACgkQI1/ltBGq
qqdWEw//TjxcnggpasiUSfT4ZXzmurEUOuXXdlKqrwZVriznsQTIXUlegqp87Tzz
ZgDY53UfEEEuDWbDuVSsy4PZUELJAWVPdJk/tA+EunmXoB4AKWRXBTV+F/ToEhG/
74qxW84Ze75eY4xGZOk3Sa0spHclIF1c4C6x41TV/Swb6pc952Dskh1S2YBAo1RN
ty2s6N+DMnJwtNv9tk5auCuAlwb6f00rCV6krCz3Ea/0MEKBBaKJv+fOwoJC5THb
vFJ7WGjr0VuZq2+W5K+PnXf9n/m23AXdET2a5R0KdvjCo5TBY2ahW2AZq/paMzyq
Yn+Se9hQZnIxG3LDoF7SKCt3PpOeaCjz2pZ7gsKE4WQGGEju6BInMJkO66hsu0B8
i75ghZTO2VV8PtqMjuUIE1teVCpbU7DTj/eOTGlu9MJimv6mLKvIQ935m8FVFZDU
HQB4lFfORQS7mlqmM3aRBfaHzWQgg2c2ohzcWvrWLitGQ3kqulJqZRwBL3tK0BmW
WH22grbaHESyEJ7dDQdtjZCO5SkiizKEarFKBZXL5RyMmoW0M2IwnqoCvy8kIsk4
7CBGTzswrqDDEe9a99aVmiayTDMrLlm167gL2aDwevmSF8P9WzkzdL30HoEfnVxO
L1bxu2wF3IEquIJk1FfC1DBXrU9T8UPFNty28vt7ZF98LLQoTuA=
=8MmB
-----END PGP SIGNATURE-----

--Sig_/9b.7TALwzu214SAjzDzgTXR--

--===============0418958313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0418958313==--
