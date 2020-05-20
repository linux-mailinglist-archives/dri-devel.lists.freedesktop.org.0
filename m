Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD4E1DB15B
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 13:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929866E14A;
	Wed, 20 May 2020 11:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0AD6E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 11:19:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so3206062ljd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=yDpr7QrZOGfn64pXy4jQq9WPVyAIlc4OeElPH6PjCe4=;
 b=pFqB+x0ctqXfqPiImtGNKcP5yS/5z7G72WwIUkff98Vam0YL1ZXcpimc5r+PdIWvii
 yIG598ugmR/nd7nS/A//eIqaxSgTA+SVMZxRokVOdKS957B+x8unxnhhIDU8k+TuvC1M
 wRn33H/l2WQG0MbaCRCfwmV8iTN3Y6fYtAmVbS2jKLR+5NbGXgb3AR+OqKotm4TqH2dx
 g95Xv+Y1IW41BBxldawapg9gAJxACSP+K8Hbll0wMbLcSFjtxwVN30dM4dszISjO74eN
 FGmyi7eiTbvMPcf98TjNfKdAdMOUUlIjPfIm0XCnfP/YQmFLvWOBD9u8PbWas4HX9xBY
 P+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=yDpr7QrZOGfn64pXy4jQq9WPVyAIlc4OeElPH6PjCe4=;
 b=mBKaJqV/CTD1L8Jfy1nFywEouU34/f/+xOVT7FA0nZP2HtKpTRiY5W/v9bDK/HmV8i
 RXxLYdOnpQFO7Y/BpxF0spHTUfhwGUvCze7IvD7Z4EArDfSLmN2uPEMvSJbqdu636Y3T
 rxVriy2YzU/Gh7BTc/8YdW5dQSvYx5UX6IgR7YGs+3hWkRIApeq5LnuujFc8XPMSiv/r
 g0ybv1oIW7LAUgdQZ3mhXvPW+QLZ/Q70w+AraIvPAq7VRQJMzrEigRqxLff8Ho3p8yU5
 7+l8xGbqda+102E4QndGTuPVdIO5KoTt8PRhC2byeBIC8L0DSWBrbpdANiLM0oaMyuuL
 +R/A==
X-Gm-Message-State: AOAM531f9H9Jd5+ZEYE8sYR2glH/JuEW/Gb6Z/7C/eKvi2ajT6/fsFBg
 1hjWLnKsZyDzgKkD6VTJh9Y=
X-Google-Smtp-Source: ABdhPJxQN+ww4yEFFfdk+N8dl5TiLjW8yp4ilwFfKQXHOyGFecuWvnlR9i78Tgc0tqCISaYr/wD0fw==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr354271lji.315.1589973557937; 
 Wed, 20 May 2020 04:19:17 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t18sm101957ljk.134.2020.05.20.04.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:19:17 -0700 (PDT)
Date: Wed, 20 May 2020 14:19:08 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200520141908.314607bc@eldfell.localdomain>
In-Reply-To: <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0491775497=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0491775497==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/w2ksgGo8i/1e2Ieup9u+VX3"; protocol="application/pgp-signature"

--Sig_/w2ksgGo8i/1e2Ieup9u+VX3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 19 May 2020 10:37:12 -0400
Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:

> Thanks for the summary, does put things in order and makes it easier to=20
> comprehend all the TODOs, some questions bellow
>=20
> On 5/19/20 6:06 AM, Pekka Paalanen wrote:
> > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> >
> > Set up the expectations on how hot-unplugging a DRM device should look =
like to
> > userspace.
> >
> > Written by Daniel Vetter's request and largely based on his comments in=
 IRC and
> > from https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&amp=
;data=3D02%7C01%7Candrey.grodzovsky%40amd.com%7Ce8e13dc4c85648e5fcd408d7fbd=
c5f2b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637254796242596783&amp;s=
data=3DbA%2FAy3VGvzNqmV1kGigNROSZQEws2E98JibDxvEICNs%3D&amp;reserved=3D0 .
> >
> > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Sean Paul <sean@poorly.run>
> >
> > ---
> >
> > Disclaimer: I am a userspace developer writing for other userspace deve=
lopers.
> > I took some liberties in defining what should happen without knowing wh=
at is
> > actually possible or what existing drivers already implement.
> > ---
> >   Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 75 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 56fec6ed1ad8..80db4abd2cbd 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -1,3 +1,5 @@
> > +.. Copyright 2020 DisplayLink (UK) Ltd.
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   Userland interfaces
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > @@ -162,6 +164,79 @@ other hand, a driver requires shared state between=
 clients which is
> >   visible to user-space and accessible beyond open-file boundaries, they
> >   cannot support render nodes.
> >  =20
> > +Device Hot-Unplug
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. note::
> > +   The following is the plan. Implementation is not there yet
> > +   (2020 May 13).
> > +
> > +Graphics devices (display and/or render) may be connected via USB (e.g.
> > +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An e=
nd
> > +user is able to hot-unplug this kind of devices while they are being
> > +used, and expects that the very least the machine does not crash. Any
> > +damage from hot-unplugging a DRM device needs to be limited as much as
> > +possible and userspace must be given the chance to handle it if it wan=
ts
> > +to. Ideally, unplugging a DRM device still lets a desktop to continue
> > +running, but that is going to need explicit support throughout the who=
le
> > +graphics stack: from kernel and userspace drivers, through display
> > +servers, via window system protocols, and in applications and librarie=
s.
> > +
> > +Other scenarios that should lead to the same are: unrecoverable GPU
> > +crash, PCI device disappearing off the bus, or forced unbind of a driv=
er
> > +from the physical device.
> > +
> > +In other words, from userspace perspective everything needs to keep on
> > +working more or less, until userspace stops using the disappeared DRM
> > +device and closes it completely. Userspace will learn of the device
> > +disappearance from the device removed uevent or in some cases specific
> > +ioctls returning EIO.
> > +
> > +This goal raises at least the following requirements for the kernel and
> > +drivers:
> > +
> > +- The kernel must not hang, crash or oops, no matter what userspace was
> > +  in the middle of doing when the device disappeared.
> > +
> > +- All GPU jobs that can no longer run must have their fences
> > +  force-signalled to avoid inflicting hangs to userspace.
> > +
> > +- KMS connectors must change their status to disconnected.
> > +
> > +- Legacy modesets and pageflips fake success.
> > +
> > +- Atomic commits, both real and TEST_ONLY, fake success. =20
>=20
>=20
> Why wouldn't we return -EIO for the atommic commit IOTCL/legasy pflip=20
> and modeset ioctls here same way as you suggested returning -EIO for=20
> render ioctl ?

Hi,

that is more of a question for Daniel Vetter than me. I believe he is
worried that userspace will get the error handling horribly wrong
anyway, because it needs to be handled in every single display server
project. Render ioctl errors OTOH need to be handled only in the
corresponding Mesa or other userspace driver, and for render there are
API (OpenGL/EGL, Vulkan) specs that say how it must be handled to fill
the API contract. Because of the API contract, those are more likely to
have reasonable error handling in place already.

I first thought it would be obvious for at least atomic commits to fail
appropriately, but then thinking again, it will only introduce new
failures that are currently very hard to test for (VKMS to the rescue),
and userspace would need to have code to correctly bail out for EIO
rather than attempt fallbacks. The uevent telling the device is gone is
going to come anyway. In between the device disappearance and uevent
handling, it doesn't matter much what happens: the device is abruptly
gone and the user will see a glitch anyway - he knows, he just yanked
out the cable.

To me this decision is just to make life in userspace easier by not
introducing a whole new type of error. However, if the kernel did
return EIO instead, it would be impossible for me to see that as a
kernel regression because the old behaviour was probably explosions
everywhere anyway.

I heard that UDL and maybe some other drivers in the kernel already
handle hot-unplug somehow. Maybe those are what would regress if the
kernel returned EIO?


> > +
> > +- Pending non-blocking KMS operations deliver the DRM events userspace
> > +  is expecting.
> > +
> > +- If underlying memory disappears, the mmaps are replaced with harmless
> > +  zero pages where access does not raise SIGBUS. Reads return zeros,
> > +  writes are ignored.
> > +
> > +- dmabuf which point to memory that has disappeared are rewritten to
> > +  point to harmless zero pages, similar to mmaps. Imports still succeed
> > +  both ways: an existing device importing a dmabuf pointing to
> > +  disappeared memory, and a disappeared device importing any dmabuf. =
=20
>=20
>=20
> Same as above, I would expect drmPrimeHandleToFD and drmPrimeFDToHandle=20
> to return -EIO in case device is detached

I imagined a use case behind this: a Wayland compositor attempting to
import a client's dmabuf. The GPU the client was using is
hot-unplugged, meaning the dmabufs lose their storage. It is up to the
client to handle its rendering GPU disappearance on its own, but also
the compositor should not disconnect it because the GPU disappeared.
It's not the client's fault the GPU disappeared.

In Wayland, failure to use a wl_buffer is considered a protocol error,
and protocol errors are always fatal: the client is disconnected. The
rationale is that the compositor must always be able to present the
client buffer somehow. If the compositor cannot, then the client did
not obey the protocol.

The fallback presentation path in a compositor is usually importing the
dmabuf to EGL, to be sampled from OpenGL. Normally the protocol
guarantees that this works, so any failure to do so is a protocol
violation. But if the GPU used by the client suddenly disappears and
the imports start to fail, that is interpreted as a protocol violation
unless the compositor can see why the import failed. Since the import
is done via EGL, getting the right error code plumbed through from
libdrm functions to the EGL caller would be a hassle. I don't see any
error code in EGL_EXT_image_dma_buf_import reserved for "the dmabuf
storage was hot-unplugged", and I doubt there is anything exclusively
for only that in the EGL base spec either.

The cost of lying that the import worked is that the compositor will
paint black or transparent where the window was supposed to be. It's a
graphical glitch that is contrary to the Wayland design principles, but
in this case a glitch is unavoidable: even if the compositor knew this
buffer is now bad, what would it paint instead? It has nothing else to
paint from. I'm assuming the compositor is using a different GPU than
what disappeared.

Ideally, the client will eventually react to losing the GPU and either
crash, quit, or switch its rendering to something that works which
simply gives the compositor a new, working buffer without losing any
window state in the process. If we risk the compositor disconnecting
the client, then the client might not recover even if it wanted to.

> > +
> > +- Render ioctls return EIO which is then handled in userspace drivers,
> > +  e.g. Mesa, to have the device disappearance handled in the way
> > +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> > +  Vulkan: VK_ERROR_DEVICE_LOST; etc.) =20
>=20
>=20
> As far as I understood from our discussion we would reject any IOCTL=20
> aimed at a device which is gone and not only render ioctls.

Daniel?


Thanks,
pq

>=20
> Andrey
>=20
>=20
> > +
> > +Raising SIGBUS is not an option, because userspace cannot realistically
> > +handle it.  Signal handlers are global, which makes them extremely
> > +difficult to use correctly from libraries like Mesa produces. Signal
> > +handlers are not composable, you can't have different handlers for GPU1
> > +and GPU2 from different vendors, and a third handler for mmapped regul=
ar
> > +files.  Threads cause additional pain with signal handling as well.
> > +
> > +Only after userspace has closed all relevant DRM device and dmabuf file
> > +descriptors and removed all mmaps, the DRM driver can tear down its
> > +instance for the device that no longer exists. If the same physical
> > +device somehow comes back in the mean time, it shall be a new DRM
> > +device.
> > +
> >   .. _drm_driver_ioctl:
> >  =20
> >   IOCTL Support on Device Nodes =20


--Sig_/w2ksgGo8i/1e2Ieup9u+VX3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7FEiwACgkQI1/ltBGq
qqdKxA//YkoI/pOoQfz5ybdhlv5CknciFZc/nRHZP0ypNora3lQakX7mqj/xIif5
Ap9qKBu5KhaIQcP7fLH4dvhL4YU4a5aTkXfyj+YEQZ4E6N9qh5/xyZOk03Pb5bv9
DzSGE/jg1Zd/TDEJxT7NtUerjwLJVi6sTBBOJhzgS83sWnY3ZZt8EMYTmD0y9XuC
Wj6ffyboXW95kBbXgfdG91pa3YIb4coQPleiZR8rwhgXZJxPnTXO5i2mVDeEO+Lp
FKGluDX3136lvu8UCNR/jP0pYTylJdoNHrFYa+IgN7TZ5lhqaTvve5hDrnVYUrWl
FWY/YaiOeiglb913OY/e2V8TJqbb/B+o4FtL6QEEXSQEzUM78o/Pe80uIgE6Pvgp
y7Qk9M7M5TSouPEM1bHqjuXSt0tTXhto77ZgyNxZxKLFSL/aegYINNSVchMWDy6l
FABL6Lve3rKjsO92rqDSSCvtt+RlV7//Z7eUHLIklwlrSv3QDzjscFcrNAEsGVBx
8bIIJuaDAejWl59U4R549QN76rtrghOVDoHeDMY5rP6lVYgI4Sxwixhgx21Eq/HL
/0BdlzGEjrZ6y9KB20/pIkRBYcDSiQzw8An3DctCtHWBhFRRc7Ey/hlyFjJ/dEFn
H4W8mk/bl6jCZYvQWsbUYUOTU+9lmHGp0dgQrZfjEyev9bGo3iA=
=51mW
-----END PGP SIGNATURE-----

--Sig_/w2ksgGo8i/1e2Ieup9u+VX3--

--===============0491775497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0491775497==--
