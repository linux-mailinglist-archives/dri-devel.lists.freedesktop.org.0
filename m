Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414B31E397F
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 08:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97DB6E046;
	Wed, 27 May 2020 06:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E3C6E046
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 06:44:39 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u16so12045351lfl.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=DJCBFGGTeeH5SUAQWfqZWuHc0br6OxdVHuhdiaaHYQU=;
 b=J7VXNiv/O3a0g1xnS721pTarT1n3Y0QjCfqxUgqSYvfwypubMZW/pd+JP9vEPkbBRX
 lK3jiiWrVq7ESyMw3WwJ1ktEeJv+BWHoBimWDC2N8F9ucmRK9EyAD3jUhCwui68hox2r
 b335dDDgUR8J4S7P1jlFSXxQGb2TC38dGhaBvDDXr4SCP/gK/KOx45p0RmPbJ4GeC08b
 VJl26W5psxtFM/TAoeYq+nvUkM6QZRWh8jwADHZBRCsGJnAaUTH+2rn8hzpPRsNb7sn6
 F8AzE0XAFe6lx437yb2hk5E8X4nGTA/2RaweTHYOIVre8fETZ+OdYwn32lGtSGx4rYl3
 D2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=DJCBFGGTeeH5SUAQWfqZWuHc0br6OxdVHuhdiaaHYQU=;
 b=IFWL96VTJjhGGOI+fZSW4Rbiq8ZtdQIL8qjDTjKQnSTNu+CIY7vR6sc1C0f27ui/Bc
 aTEv/3Jw3P9vue8ZUlLtlEvvtMgzTf/L5ABA/f3UZrJNYqoOp+3A1QHgN1jOEQDmw45l
 DVblYAIYA3LOlf/d3iBloNWa2a6PWHBL01++IjABD+WFLeU7jBjsL6aPfmaSTqplHfac
 04PPMHhWzFVW24IM9N77b0dlXyM6aWhxzNp2xUpPwpxM/LFYjs0eOM8uS0wb68BKnF/w
 5MEzqShA/bnMwHkLxVdM7mvPvzDtnDSR7IAjLkoU2NFd7qKjdB53drX2qaFK3xW5mZZX
 22Cw==
X-Gm-Message-State: AOAM530sbw2OuxSAzN4av9Pla5W6L/FI/Wu45H0oug1BGClsydm4CTm9
 b4H/Pr8S6c0LDAcQAm0kK1c=
X-Google-Smtp-Source: ABdhPJxmZrDaOaaM2A0WorHiZEUbFajABHYCQOalgLaf4iWrUm+mf/yW+mzaQHcqYkqW1vDGzxC6Mg==
X-Received: by 2002:a05:6512:682:: with SMTP id
 t2mr2362306lfe.101.1590561877501; 
 Tue, 26 May 2020 23:44:37 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v2sm481706ljj.96.2020.05.26.23.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 23:44:37 -0700 (PDT)
Date: Wed, 27 May 2020 09:44:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200527094428.4b4a7ca6@eldfell.localdomain>
In-Reply-To: <db6e57bd-a5c0-f156-93ca-80828d98064e@amd.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <db6e57bd-a5c0-f156-93ca-80828d98064e@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0094648704=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0094648704==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FbhYWG=I7K+GS1ksdNz6u79"; protocol="application/pgp-signature"

--Sig_/FbhYWG=I7K+GS1ksdNz6u79
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2020 10:30:20 -0400
Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:

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
> > +- Atomic commits, both real and TEST_ONLY, fake success.
> > +
> > +- Pending non-blocking KMS operations deliver the DRM events userspace
> > +  is expecting.
> > +
> > +- If underlying memory disappears, the mmaps are replaced with harmless
> > +  zero pages where access does not raise SIGBUS. Reads return zeros,
> > +  writes are ignored. =20
>=20
>=20
> Regarding this paragraph - what about exiting mappings ? In the first=20
> patchset we would actively invalidate all the existing CPU mappings to=20
> device memory and i think we still should do it otherwise we will see=20
> random crashes in applications as was before. I guess it's because TLBs=20
> and page tables are not updated to reflect the fact the device is gone.

Hi,

I was talking about existing mappings. What I forgot to specify is how
new mmap() calls after the device disappearance should work (the end
result should be the same still, not failure).

I'll clarify this in the next revision.


Thanks,
pq


> > +
> > +- dmabuf which point to memory that has disappeared are rewritten to
> > +  point to harmless zero pages, similar to mmaps. Imports still succeed
> > +  both ways: an existing device importing a dmabuf pointing to
> > +  disappeared memory, and a disappeared device importing any dmabuf.
> > +
> > +- Render ioctls return EIO which is then handled in userspace drivers,
> > +  e.g. Mesa, to have the device disappearance handled in the way
> > +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> > +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)
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


--Sig_/FbhYWG=I7K+GS1ksdNz6u79
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7ODEwACgkQI1/ltBGq
qqedJw//fIEReLIvqdoP0FHrVD3mkChFEOOQoeMaxkkHzVWC7OEj/xGxYH+YeCnm
wkE5moJLUziSTnQgm6Gxi4K22LPN4RHTunNLA4Qi9p1iyjySwAuuYfUosM3CKkq+
5Ql0QTVHXHaYR2dAo2TN8Wwn3ccUHBN7UHdmaveOHI7F42C/eBTzAsj/VmYCa/mg
WIN4rHQnAa0aCIcuw3Qg/JZRazg9jO/MWESoy1uqK64VKyxKExlKpM+m/7YsNbX2
J1hvv3jd00PEzqJQhmeat/k0sh3FqL2ERSjGzEwbxEef9aRR917ZKhgdT3IINNCH
Q565H4AVAzGBR+/APsDPhlcJCKxFRkbrKDd5436I2YNUN+QiklRf7mdgEAr4Lq5y
jQhXKxNEfiEYMJsc3R074sz9VioATPbqQOaqMPc45HTxLwEJZmN3a1p23t+4HdHF
vEj+CJWEWm2kBIuOusskRjRJFeDbG26/CWxr6TTzZJyGAhjC6/l2aFcFoosfmkfJ
flTcBHHQRfAw5K3lx1KnA19t9pTF7l3i3oJe0QsgF+jUcWbY7N2+FdI05kZlbcag
wzmWAXNS+wJ9TiyTun6DATn8Z9+QE8JcrPg4Fj+yK93959mHSnHxGQrwcrztIdtJ
lWqh2zUALRHSNBz3pYTAi+55p0jGcIoopN05g9VS4zGUNoKUgxg=
=xTQU
-----END PGP SIGNATURE-----

--Sig_/FbhYWG=I7K+GS1ksdNz6u79--

--===============0094648704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0094648704==--
