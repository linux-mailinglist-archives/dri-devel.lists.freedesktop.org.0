Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7FE1E10B2
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8FA89F3B;
	Mon, 25 May 2020 14:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F368789F2A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:41:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w15so10594344lfe.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=FhuSluuMiH6iKesG3pY7u1O3TXpHhRcsoYMadv6lw/k=;
 b=ILx2+gehJozbROAnAg/rTDpVfCe361YTZ8hVCaO/l1jZ8vZoLt/7sBVLmKfPTQ4tDY
 Uqxi6nAtg3sIB9K0DrHU4npjG2AZWLP2fz1WZsf6GBSG7qWRf3rYCFs/iuS/9Sq1rLy3
 Szf4IzLz9KaSPsUkVaG+9ZU1suHDYmc9KhpNeKcq7eqlY8OD2/G3aqjg4xXKKD34lhfx
 D9AI2fElNg/MgpAF1fa3vVbp4aOKxrEZy6tgtthJaHTyG7scDzZ1okg2DimyCTbtCU2N
 nq7myhaE0y9c+itoghV/TyLv6Rb5ilCTMeDaut/Cz7w+KAodYrEBP4w0ZPsDO4FgjgMV
 IMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=FhuSluuMiH6iKesG3pY7u1O3TXpHhRcsoYMadv6lw/k=;
 b=TFrU1iHxzmqeM6nnlROtnmsd+y8+Wj1sb0uyF+Q8UsIFjE0pb3qRmc+x7hoVzue5rv
 cUzWFNuoFesp0QPtE0IIghlfWabMjqqGgGdKT31MFSmJLYVjYP3i8v1vnsOdyK/3wA5U
 J3AUDS0udUxK4QQusxWCWIB7i5RJy4d5Gsbv/aXOPtV9LcOXTWr3saqRHHySz2XPqvV1
 mu3ju7i9EIqfnq8feAKy9waYHIGFOPoVUmqo/WbqoTZUCKXi+7dKh+uSZAXwCcvaj4Wj
 JqLVwslQs63yzqgi3wtYbSqcQiFFzdB+4Z8iVt3xK6ifU6SpxBOkUDWcT0kUjZ4ts2j/
 XMwA==
X-Gm-Message-State: AOAM532uuQWE5RihceGRStQOyZ78MEDZxuzuegHmBflh/Xn9TK0nxsF/
 8lADKOeq/xczQhB/naWZYoU=
X-Google-Smtp-Source: ABdhPJxKC6zxHsJ+z4QFull4igMjoQPNQfjqZcbOdvKNi7GqE0K4YWVkmOs9/xcS2bEoL/t/lDQxzA==
X-Received: by 2002:a05:6512:2ed:: with SMTP id
 m13mr14467397lfq.43.1590417684270; 
 Mon, 25 May 2020 07:41:24 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a12sm4660770ljp.60.2020.05.25.07.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:41:23 -0700 (PDT)
Date: Mon, 25 May 2020 17:41:20 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2] drm/doc: device hot-unplug for userspace
Message-ID: <20200525174120.71aec91d@eldfell.localdomain>
In-Reply-To: <d2acce4d-8e5f-a335-24e6-e454a7fc2436@amd.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200525124614.16339-1-ppaalanen@gmail.com>
 <d2acce4d-8e5f-a335-24e6-e454a7fc2436@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0962480008=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0962480008==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fRydcztwinkOgIczG=9E4wm"; protocol="application/pgp-signature"

--Sig_/fRydcztwinkOgIczG=9E4wm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 25 May 2020 09:51:30 -0400
Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:

> On 5/25/20 8:46 AM, Pekka Paalanen wrote:
>=20
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
;data=3D02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d800a=
9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178891269&amp;s=
data=3DtbOTr7TfESohEgWspomM1sbMq4U4n7bOvdS6JlYifmM%3D&amp;reserved=3D0 .
> >
> > Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Simon Ser <contact@emersion.fr>
> >
> > ---
> >
> > v2:
> > - mmap reads/writes undefined (danvet)
> > - make render ioctl behaviour driver-specific (danvet)
> > - restructure the mmap paragraphs (danvet)
> > - chardev minor notes (Simon)
> > - open behaviour (danvet)
> > - DRM leasing behaviour (danvet)
> > - added links
> >
> > Disclaimer: I am a userspace developer writing for other userspace deve=
lopers.
> > I took some liberties in defining what should happen without knowing wh=
at is
> > actually possible or what existing drivers already implement.
> > ---
> >   Documentation/gpu/drm-uapi.rst | 102 +++++++++++++++++++++++++++++++++
> >   1 file changed, 102 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 56fec6ed1ad8..520b8e640ad1 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -1,3 +1,5 @@
> > +.. Copyright 2020 DisplayLink (UK) Ltd.
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   Userland interfaces
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > @@ -162,6 +164,106 @@ other hand, a driver requires shared state betwee=
n clients which is
> >   visible to user-space and accessible beyond open-file boundaries, they
> >   cannot support render nodes.
> >  =20
> > +Device Hot-Unplug
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. note::
> > +   The following is the plan. Implementation is not there yet
> > +   (2020 May).
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
s. =20
>=20
> So to support all the requirements in this document only kernel changes=20
> should be enough and no changes are required from user mode part of the=20
> stack ?

Hi,

my intention is that this document describes what the kernel delivers,
or should deliver, to allow userspace to cope with hot-unplug if
userspace wishes to do so. "Userspace" here includes userspace part of
GPU drivers.

Userspace has a lot to develop to actually recover instead of just sit
in the dark after the device disappears. Handling the uevent for DRM
device removal or errors from GL/Vulkan is just the beginning of it. I
would assume that userspace drivers have things to implement as well,
before GL or Vulkan apps can recover instead of get stuck or crash.

Unplugging "secondary" DRM devices (mostly used for KMS to have more
monitors lit) should be relatively easy to implement in display
servers. Unplugging the GPU that a display server is using for
rendering is going to be really difficult and will need client
(application toolkit) support the very least, and perhaps even new
window system protocol.

I imagine this will be incremental development: first the kernel stops
crashing. Then display servers stop crashing. At some point userspace
GPU drivers stop crashing. Then display servers learn to recover
instead of sit in the dark, but disconnect most of their clients. Then
maybe with the help of window system protocol additions, some major
toolkits learn to not get killed. And so on.

Once all that works, the follow-up step could be some protocol to
switch applications from one GPU to another in flight. That's off-topic
here, but being able to handle GPU unplug is half of the switch.

> > +
> > +Other scenarios that should lead to the same are: unrecoverable GPU
> > +crash, PCI device disappearing off the bus, or forced unbind of a driv=
er
> > +from the physical device.
> > +
> > +In other words, from userspace perspective everything needs to keep on
> > +working more or less, until userspace stops using the disappeared DRM
> > +device and closes it completely. Userspace will learn of the device
> > +disappearance from the device removed uevent =20
>=20
>=20
> Is this uevent already implemented ? Can you point me to the code ?

I can't point to any kernel code, I'm just not familiar with it. But
it's the same uevent all Linux devices emit. You unplug a USB mouse,
this is the event that gets sent.

You can emulate it with 'udevadm trigger -c remove' IIRC, and it is the
"remove" event you can match in udev rules.

KMS hotplug event is also a uevent, but I think it is "change" rather
than "remove". Otherwise the same mechanism. Display servers already
watch for uevents to learn about monitor hotplug, and some watch for
DRM device added events too. But I don't think any really watch for DRM
device removed events, because usually everything explodes first. I
don't know, maybe X.org handles UDL unplugs?

> > or in some cases
> > +driver-specific ioctls returning EIO.
> > +
> > +Only after userspace has closed all relevant DRM device and dmabuf file
> > +descriptors and removed all mmaps, the DRM driver can tear down its
> > +instance for the device that no longer exists. If the same physical
> > +device somehow comes back in the mean time, it shall be a new DRM
> > +device.
> > +
> > +Similar to PIDs, chardev minor numbers are not recycled immediately. A
> > +new DRM device always picks the next free minor number compared to the
> > +previous one allocated, and wraps around when minor numbers are
> > +exhausted.
> > +
> > +Requirements for UAPI
> > +---------------------
> > +
> > +The goal raises at least the following requirements for the kernel and
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
> > +- Atomic commits, both real and TEST_ONLY, fake success.
> > +
> > +- Pending non-blocking KMS operations deliver the DRM events userspace
> > +  is expecting. =20
>=20
>=20
> The 4 points above refer to mode setting/display attached card and are=20
> irrelevant for secondary GPU (e.g. DRI-PRIME scenario) or no display=20
> system in general. Maybe we can somehow highlight this in the document=20
> and I on the implementing side can then decide as a first step to=20
> concentrate on implementing the non display case as a first step or the=20
> only step. In general and correct me if I am wrong, render only GPUs (or=
=20
> compute only) are the majority of cases where you would want to be able=20
> to detach/attach GPU on the fly (e.g attach stronger secondary graphic=20
> card to a laptop to get high performance in a game or add/remove a GPU=20
> to/from a compute cluster)

I do think KMS-only (not rendering) devices are a major use case for
hot-unplug: docks, USB-display-adapters etc. I wrote this patch on
behalf of DisplayLink after all.

Render-only GPUs are another important use case like you describe. And
a dock might perhaps have both: a powerful GPU and a big screen
connected.

Personally, I have no expectations other than a hope that some day at
least the drivers that support hot-unpluggable hardware would implement
all of this. :-)

I would assume it's fine to work piece by piece towards the goal on
your own pace. This patch here is just for setting up the goal without
a deadline. I'm no DRM maintainer or even a DRM developer.


Thanks,
pq

--Sig_/fRydcztwinkOgIczG=9E4wm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7L2RAACgkQI1/ltBGq
qqeYWBAAoEVkNPlbl4ohpejCWXz18lQ0PgrDD5oy8CI8S1rLZV75DJnRrjs/ZZO0
cKMUejv7iSKWoKuMSuYdh0iFgZX9TYTO9qCh3DsKjwjM4YVTPSZr/5EP8RsobTNV
HsOGLU2Pn7h6c3/E+Jgpg6PxnxG0LTGLWPFBVdWrv3Oqyeco90US6Hd94Qf1UjS9
LcrCktcVP/zNj9IZJB2DxlBkybpRpwsYX3ZlyMl4F/4Hp6TJfBi5jBOpgh+Iszj4
BBEhAa+u3Twa2gkRd+BZbcMtwb6u8yll8PmkVhQNbuJyxvLpnr5Vt3fk9U47Slm4
Aha4v8JzhjkJK6A61AZSzD+5EsPYy0MoO/BpnqFeuopmiq/RBTn87ZCBX1ogh6iA
JqXaJXpKKcH/sfRwRr+8MQKPUky9kY1udFYuQ3pNHky7B3l6ZDQu8gY9bJM5y9lk
POhxx1UTKe9tQPP4ONeGcDWPMTwNpOaMh7URKLg0hMKG8Jgf4m2mQAMcIwOSqUbs
B5abhUeFCWKYOzee2YI6kC8UdU7bXjJa8vVjl43Kip+6QuwB/dEVxKw/b4kuaKay
jzuZO9uQvKkVtfk1pHo4KMmRDw//1dQIcUwuFYO2t0V3PozwEP67vWrs/C0C8TgI
eI448/DlF7/ul0IKrfRcSoB9m6kUvg/+ggdGtVacJsKSQqN1kwg=
=1BdH
-----END PGP SIGNATURE-----

--Sig_/fRydcztwinkOgIczG=9E4wm--

--===============0962480008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0962480008==--
