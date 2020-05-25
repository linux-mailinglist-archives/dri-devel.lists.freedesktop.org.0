Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C761E1138
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1835888861;
	Mon, 25 May 2020 15:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABBE88861
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 15:02:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id o14so21132584ljp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=I9M5QFQ/gf7eGGNWGUZvEDzvHCbUgDgt6V2KllOXXKw=;
 b=VCis8jS6vJOy8zkXc5IcnnlBJZWpueZAKLUVAeIIm8WXwO5N2LLBX/VYgo+CAgXP5T
 crfOlXQOcMaYCIDtXeesEVLYmR45v57C4oMGe5UimdmSIUbo+6/pqxJ8o4n+Pw+3DCvL
 xip+cGzwYOQXUVBoThlUrATTTqzItyuhPnDekhkd1mPaTZ4l/+yzBK0BSZ4gK+obxQXs
 ov8QspbCApP5geUF6QAzBaJtv+K17iTw2Ktw8qNKgmNrBjOxR/U3BUYckxVy6yBD83rJ
 qrM6KoM2aFskkZDSFGpo81ckKue6M3WS8FFsWU+ILPT6bKo/DY9ELq9cDUYL2SkbSVXz
 4qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=I9M5QFQ/gf7eGGNWGUZvEDzvHCbUgDgt6V2KllOXXKw=;
 b=iBj6bXTQPKqO4PRKgiGNmVHPvWykXap8pJhk1Jf0PdVKRnx95b9N3Sp+c2RwZk4hBy
 1BgafQ6zhUvIQTK7L1flgSbzYURdbJXMWlvwO8qlT3AJEsRKA8MoYnNqoqnAeM6++5H8
 nhcJtrqNv0IVNn7FH9MxShsM5WJAUAe7AzKp+wRc5G/QaIHkpinXMLHtGyFdNc8qZUWk
 2D0BthD16QqkP14AKmuSaQjVxZrpAss9+KEoJ3nN+CFudniINIB7WUy7dZ+tOs4TjatA
 vLq3Ug2SfXEVyD7Rr1SwptXD72gB3bD8gn4IQjomVwtiIroDM8bPOZmAwOMpoqpAOQuI
 +pxw==
X-Gm-Message-State: AOAM533+DHbz0BUbemEeN5nkVY/WvXe9VqhsDRrnJXXqg3zgJ8q0jPxY
 lz6ycCJVEkE2XyjnKn0q+Iw=
X-Google-Smtp-Source: ABdhPJwS4EdZFED8NUxqY7nCiXijKUUfzc3wKfZcaX6KYPWCPQ7cTGXuDugbFB7RMcRUOerNYKxWvw==
X-Received: by 2002:a2e:8186:: with SMTP id e6mr14913273ljg.252.1590418951798; 
 Mon, 25 May 2020 08:02:31 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v22sm3815147ljv.80.2020.05.25.08.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 08:02:31 -0700 (PDT)
Date: Mon, 25 May 2020 18:02:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: device hot-unplug for userspace
Message-ID: <20200525180226.7ca79105@eldfell.localdomain>
In-Reply-To: <20200525143017.GF206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200525124614.16339-1-ppaalanen@gmail.com>
 <d2acce4d-8e5f-a335-24e6-e454a7fc2436@amd.com>
 <20200525143017.GF206103@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============1846210073=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1846210073==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/g.3Qn+n5VScJQ3yt=J3kqIe"; protocol="application/pgp-signature"

--Sig_/g.3Qn+n5VScJQ3yt=J3kqIe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 25 May 2020 16:30:17 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 25, 2020 at 09:51:30AM -0400, Andrey Grodzovsky wrote:
> > On 5/25/20 8:46 AM, Pekka Paalanen wrote:
> >  =20
> > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > >=20
> > > Set up the expectations on how hot-unplugging a DRM device should loo=
k like to
> > > userspace.
> > >=20
> > > Written by Daniel Vetter's request and largely based on his comments =
in IRC and
> > > from https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&a=
mp;data=3D02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d80=
0a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178891269&amp=
;sdata=3DtbOTr7TfESohEgWspomM1sbMq4U4n7bOvdS6JlYifmM%3D&amp;reserved=3D0 .
> > >=20
> > > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: Simon Ser <contact@emersion.fr>
> > >=20
> > > ---
> > >=20
> > > v2:
> > > - mmap reads/writes undefined (danvet)
> > > - make render ioctl behaviour driver-specific (danvet)
> > > - restructure the mmap paragraphs (danvet)
> > > - chardev minor notes (Simon)
> > > - open behaviour (danvet)
> > > - DRM leasing behaviour (danvet)
> > > - added links
> > >=20
> > > Disclaimer: I am a userspace developer writing for other userspace de=
velopers.
> > > I took some liberties in defining what should happen without knowing =
what is
> > > actually possible or what existing drivers already implement.
> > > ---
> > >   Documentation/gpu/drm-uapi.rst | 102 ++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 102 insertions(+)
> > >=20
> > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-u=
api.rst
> > > index 56fec6ed1ad8..520b8e640ad1 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -1,3 +1,5 @@
> > > +.. Copyright 2020 DisplayLink (UK) Ltd.
> > > +
> > >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >   Userland interfaces
> > >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > @@ -162,6 +164,106 @@ other hand, a driver requires shared state betw=
een clients which is
> > >   visible to user-space and accessible beyond open-file boundaries, t=
hey
> > >   cannot support render nodes.
> > > +Device Hot-Unplug
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +.. note::
> > > +   The following is the plan. Implementation is not there yet
> > > +   (2020 May).
> > > +
> > > +Graphics devices (display and/or render) may be connected via USB (e=
.g.
> > > +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An=
 end
> > > +user is able to hot-unplug this kind of devices while they are being
> > > +used, and expects that the very least the machine does not crash. Any
> > > +damage from hot-unplugging a DRM device needs to be limited as much =
as
> > > +possible and userspace must be given the chance to handle it if it w=
ants
> > > +to. Ideally, unplugging a DRM device still lets a desktop to continue
> > > +running, but that is going to need explicit support throughout the w=
hole
> > > +graphics stack: from kernel and userspace drivers, through display
> > > +servers, via window system protocols, and in applications and librar=
ies. =20
> >=20
> > So to support all the requirements in this document only kernel changes
> > should be enough and no changes are required from user mode part of the
> > stack ?
> >  =20
> > > +
> > > +Other scenarios that should lead to the same are: unrecoverable GPU
> > > +crash, PCI device disappearing off the bus, or forced unbind of a dr=
iver
> > > +from the physical device.
> > > +
> > > +In other words, from userspace perspective everything needs to keep =
on
> > > +working more or less, until userspace stops using the disappeared DRM
> > > +device and closes it completely. Userspace will learn of the device
> > > +disappearance from the device removed uevent =20
> >=20
> >=20
> > Is this uevent already implemented ? Can you point me to the code ?
> >=20
> >  =20
> > > or in some cases
> > > +driver-specific ioctls returning EIO.
> > > +
> > > +Only after userspace has closed all relevant DRM device and dmabuf f=
ile
> > > +descriptors and removed all mmaps, the DRM driver can tear down its
> > > +instance for the device that no longer exists. If the same physical
> > > +device somehow comes back in the mean time, it shall be a new DRM
> > > +device.
> > > +
> > > +Similar to PIDs, chardev minor numbers are not recycled immediately.=
 A
> > > +new DRM device always picks the next free minor number compared to t=
he
> > > +previous one allocated, and wraps around when minor numbers are
> > > +exhausted.
> > > +
> > > +Requirements for UAPI
> > > +---------------------
> > > +
> > > +The goal raises at least the following requirements for the kernel a=
nd
> > > +drivers:
> > > +
> > > +- The kernel must not hang, crash or oops, no matter what userspace =
was
> > > +  in the middle of doing when the device disappeared.
> > > +
> > > +- All GPU jobs that can no longer run must have their fences
> > > +  force-signalled to avoid inflicting hangs to userspace.
> > > +
> > > +- KMS connectors must change their status to disconnected.
> > > +
> > > +- Legacy modesets and pageflips fake success.
> > > +
> > > +- Atomic commits, both real and TEST_ONLY, fake success.
> > > +
> > > +- Pending non-blocking KMS operations deliver the DRM events userspa=
ce
> > > +  is expecting. =20
> >=20
> >=20
> > The 4 points above refer to mode setting/display attached card and are
> > irrelevant for secondary GPU (e.g. DRI-PRIME scenario) or no display sy=
stem
> > in general. Maybe we can somehow highlight this in the document and I o=
n the
> > implementing side can then decide as a first step to concentrate on
> > implementing the non display case as a first step or the only step. In
> > general and correct me if I am wrong, render only GPUs (or compute only=
) are
> > the majority of cases where you would want to be able to detach/attach =
GPU
> > on the fly (e.g attach stronger secondary graphic card to a laptop to g=
et
> > high performance in a game or add/remove a GPU to/from a compute cluste=
r) =20
>=20
> Yeah maybe splitting this up into kms section, and rendering/cross driver
> section (the dma-buf/fence stuff is relevant for both display and
> rendering) would make some sense.

Is that really something that needs spelling out?

Hmm. I guess the unwritten assumption on every "fake success" is the
condition that it would have succeeded if the device was not unplugged.

Is the problem here that one might read this as needing to fake success
for things that could never have worked at all? Like KMS on render-only
device.

The dmabuf items below have the wording.

I think splitting stuff into KMS stuff, render stuff, KMS-and-render
stuff, cross-device stuff, and mmaps gets a bit far. Or do you expect a
lot more text in here? Maybe expanding each bullet point to a paragraph?


Thanks,
pq


> -Daniel
>=20
> >=20
> > Andrey
> >=20
> >  =20
> > > +
> > > +- dmabuf which point to memory that has disappeared will continue to
> > > +  be successfully imported if it would have succeeded before the
> > > +  disappearance.
> > > +
> > > +- Attempting to import a dmabuf to a disappeared device will succeed=
 if
> > > +  it would have succeeded without the disappearance.
> > > +
> > > +- Some userspace APIs already define what should happen when the dev=
ice
> > > +  disappears (OpenGL, GL ES: `GL_KHR_robustness`_; `Vulkan`_:
> > > +  VK_ERROR_DEVICE_LOST; etc.). DRM drivers are free to implement this
> > > +  behaviour the way they see best, e.g. returning failures in
> > > +  driver-specific ioctls and handling those in userspace drivers, or
> > > +  rely on uevents, and so on.
> > > +
> > > +- open() on a device node whose underlying device has disappeared wi=
ll
> > > +  fail.
> > > +
> > > +- Attempting to create a DRM lease on a disappeared DRM device will
> > > +  fail. Existing DRM leases remain.
> > > +
> > > +.. _GL_KHR_robustness: https://nam11.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fwww.khronos.org%2Fregistry%2FOpenGL%2Fextensions%2FK=
HR%2FKHR_robustness.txt&amp;data=3D02%7C01%7Candrey.grodzovsky%40amd.com%7C=
c9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0=
%7C637260076178891269&amp;sdata=3Dm%2FneRusoe6qGVU8Edk%2FncaD7eSJZXtPnA1IqL=
r7k%2Bos%3D&amp;reserved=3D0
> > > +.. _Vulkan: https://nam11.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fwww.khronos.org%2Fvulkan%2F&amp;data=3D02%7C01%7Candrey.grodzov=
sky%40amd.com%7Cc9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637260076178901265&amp;sdata=3DWsfLduUBzRKlybOJb5PQViBWY=
u5DgleEeycmf76l3UU%3D&amp;reserved=3D0
> > > +
> > > +Requirements for memory maps
> > > +----------------------------
> > > +
> > > +Memory maps have further requirements. If the underlying memory
> > > +disappears, the mmap is modified such that reads and writes will sti=
ll
> > > +complete successfully but the result is undefined. This applies to b=
oth
> > > +userspace mmap()'d memory and memory pointed to by dmabuf which migh=
t be
> > > +mapped to other devices.
> > > +
> > > +Raising SIGBUS is not an option, because userspace cannot realistica=
lly
> > > +handle it.  Signal handlers are global, which makes them extremely
> > > +difficult to use correctly from libraries like those that Mesa produ=
ces.
> > > +Signal handlers are not composable, you can't have different handlers
> > > +for GPU1 and GPU2 from different vendors, and a third handler for
> > > +mmapped regular files.  Threads cause additional pain with signal
> > > +handling as well.
> > > +
> > >   .. _drm_driver_ioctl:
> > >   IOCTL Support on Device Nodes =20
>=20


--Sig_/g.3Qn+n5VScJQ3yt=J3kqIe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7L3gIACgkQI1/ltBGq
qqeFgA/+NWuMED+RRJj53YJq22r5cj+QLkeSz2HerkC/LLv0T3i/AsBv3f0QrKFE
Gdzeh6E81h6qPtBDPCuPHQmI7OC5nJFReIn06ZtcyHEmV0nLxr7tL1gJHTk5l5bM
6UbFGPjeGJi4X+4v8gm8oW90wGXEu/Pz+vZigyVzgbMELI87uL++QGsmjoSq0Vc4
I4PXL4Te1Sc0ZU5u/qXAxME1wnxDu5vFvOJ5roUYon9OXv6zk6ftMZGrBYl3Qnj2
hb8LK5JI+UCpbzafcXwq0DXvq8In9C/SbOUVS4LZvJ5YTHsJTp6lWXZMx7didTxp
DBSaUaWn22XXR8uuOS3iEROs7f1F0cuyFpbqx2ZYlkjKSH7EkXDhu1xbKdyxii7Y
TJ5/NaqtQ++H/pcNt2LSaQ4jaU6NtDLmMEWHqEdVY+RjYHDY51sZTJXITN3Ranvb
H59KT6i94bOnoZUoPsVs3GJk740/VN63fmjhq/YeoAjWqM02wjMUmyxMDvIlfWRx
L6QiMxT6XZ2pm87C5hqXkfjFN79jIu2XI+OzAYb6MPik4pPJXfF55w2hdFyVkCwX
CKerJV98OhIgSWXtKIwtltiGnmxHeJ2wIStl0JsppQLLJKEtFUqHn5WNSMOy996b
p+2tf2E+FbP3n7JHbyxHb1Sc5ALRkx3no+T/LRrLceG7R/EXwG4=
=oAN4
-----END PGP SIGNATURE-----

--Sig_/g.3Qn+n5VScJQ3yt=J3kqIe--

--===============1846210073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1846210073==--
