Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B871E60CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902F56E1F7;
	Thu, 28 May 2020 12:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64F6E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:28:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e4so10656788ljn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=BNRDPGW7chSXX7qmpW2THVpzPoENAtOqOAw+aIQtBQU=;
 b=KzeykDSGByxnWrmKyoMlb9GcVI/BTq7qTqIZbU9E0UGJCOkPMqL4bq8ojyV3PDj+k/
 MNBnS6P6pxzjIG258o2sBQQ9OfazB6F7F267TtkOahWNsW3WIISs8hjivd462xMm4ki7
 l6NZk1Av1l3wDrumxz/Lz1ALwFBEIYxqP0ecazcH2NypKMwiv+Guf4Xe18J6XwxkBOnE
 IHp7sOrRfMZbesoePJ7Lu09fdUBfW2gItwJRJabcJ0ypBdaUZGawzGn7JMcFTMInmoi3
 y6rqppETX6sDSzmm3zOXl/LSKhUGMc4UPq375bK6ClPCx8QUjoKOQuJnP5IpUjoKAFY3
 j71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=BNRDPGW7chSXX7qmpW2THVpzPoENAtOqOAw+aIQtBQU=;
 b=GLA3z0/FB2QrD7vczyF/jYYke72xR9KeZ5BegsD6IpRtxym1+igoomA0BxP9CY5l4X
 U0u0F2Ko7x2E+EVCybaNlnNivrd9GFJJuYowgA19KPX98y9s5hCU+7hclll1Y5mHJpZq
 RVrUAEUSQvkpbro4DSx7AJV8g5ij4FiBymTxM9j/bjGQxpiBn3DzBye6+LsMADhwoBP0
 GExJ4m13ud6Sny7XAz3CEDLfEZp4395WnXXuzTnn+C3IWb+t7ML2FERi2puefLnW1ctj
 T7Bh4PiPaqYfgrnvTU2cvR6HIb7t0a7qwe/2lE1CUVbZBAmKjMda+qxmJMh4av5DlWKx
 PlMQ==
X-Gm-Message-State: AOAM533D53DIXRf0rRhMYdk8uSf97Q/qUpX+HUGOUv5LBhLByu+psu0/
 dbsX9TMaETUKUjc+ZWe4MZU=
X-Google-Smtp-Source: ABdhPJxXpsCwbPO0wWpgt0cydfGARE3JrRPPWnRltqlWHOYosvdJZjaL86Ol+ynuCR9XLDoYoqbtqw==
X-Received: by 2002:a2e:9a0a:: with SMTP id o10mr1390260lji.359.1590668882314; 
 Thu, 28 May 2020 05:28:02 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y199sm1606727lff.6.2020.05.28.05.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:28:01 -0700 (PDT)
Date: Thu, 28 May 2020 15:27:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200528151402.17aaeb9d@eldfell.localdomain>
In-Reply-To: <20200525150955.GI206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
 <20200520141908.314607bc@eldfell.localdomain>
 <20200520124617.GX206103@phenom.ffwll.local>
 <382ab1ab-a89c-e384-3200-0cb3257c25bb@amd.com>
 <20200525142804.GD206103@phenom.ffwll.local>
 <20200525175519.0289a728@eldfell.localdomain>
 <20200525150955.GI206103@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============1663152541=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1663152541==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jf3_UfxUaI9cRm7yH3FZqUS"; protocol="application/pgp-signature"

--Sig_/jf3_UfxUaI9cRm7yH3FZqUS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 25 May 2020 17:09:55 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 25, 2020 at 05:55:19PM +0300, Pekka Paalanen wrote:
> > On Mon, 25 May 2020 16:28:04 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Wed, May 20, 2020 at 10:50:41AM -0400, Andrey Grodzovsky wrote: =20
> > > >=20
> > > > On 5/20/20 8:46 AM, Daniel Vetter wrote:   =20
> > > > > On Wed, May 20, 2020 at 02:19:08PM +0300, Pekka Paalanen wrote:  =
 =20
> > > > > > On Tue, 19 May 2020 10:37:12 -0400
> > > > > > Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
> > > > > >    =20
> > > > > > > Thanks for the summary, does put things in order and makes it=
 easier to
> > > > > > > comprehend all the TODOs, some questions bellow
> > > > > > >=20
> > > > > > > On 5/19/20 6:06 AM, Pekka Paalanen wrote:   =20
> > > > > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > >=20
> > > > > > > > Set up the expectations on how hot-unplugging a DRM device =
should look like to
> > > > > > > > userspace.

...

> > > > So currently drm_ioctl will just check for drm_dev_is_unplugged and=
 return
> > > > -ENODEV at the very beginning of the function (https://elixir.bootl=
in.com/linux/latest/source/drivers/gpu/drm/drm_ioctl.c#L825)
> > > > meaning that currently we blanket failure any IOCTL in case the dev=
ice is
> > > > unplagued (ignoring the race condition if the device unplugged afte=
r the
> > > > check). So do we want to remove this check and put it only for rend=
er ioctls
> > > > (which are those ? e.g. for amdgpu there is=C2=A0 AMDGPU_CS ioctl) =
but not for
> > > > mode setting/dma_buf_import/dma_buf_export ioctls ? What about othe=
r types
> > > > of ioctls which are non of the listed above ?   =20
> > >=20
> > > Hm right, and this goes back all the way to first usb udl support:
> > >=20
> > > commit 2c07a21d6fb0be47fda696a618b726ea258ed1dd
> > > Author: Dave Airlie <airlied@redhat.com>
> > > Date:   Mon Feb 20 14:18:07 2012 +0000
> > >=20
> > >     drm: add core support for unplugging a device (v2)
> > >=20
> > > So I guess we need to change the uapi docs to explain that. Not sure
> > > everyone can cope, but I guess they better do. Since the use-case back
> > > then was just udl, so simple legacy kms only, the damage was probably
> > > rather limited. I'm not sure we can get away with that now, where kms=
 code
> > > has spread to funny places likey vulkan winsys code.
> > >=20
> > > Or maybe we want a file priv flag you can set along the lines of "giv=
e me
> > > less shitty hotunplug semantics for ioctls". Or maybe we can just cha=
nge
> > > the semantics, not crashing&burning shouldn't cause a regression :-)
> > >=20
> > > For everything else (mmap, dma-buf fd, sync_file fd, syncobj fd) I th=
ink
> > > the discussion is still more or less accurate.
> > >=20
> > > Pekka, any thoughts? =20
> >=20
> > Hi,
> >=20
> > is ENODEV unique to this particular failure? =20
>=20
> Not really sure, we'd need to audit all of drm ...

$ git ngrep ENODEV -- drivers/gpu/drm | wc -l
762

Yeah, grep is not enough.

> > Returning errors instead of faking success was my first idea, but you
> > already convinced me that faking is at least as good if not better. :-)
> >=20
> > So as long as the error code returned is unique to hot-unplug or other
> > "oops, the device is gone" conditions, I think I'm fine. Weston does
> > not handle ENODEV any way, it never did, and it certainly cannot be
> > called a kernel regression.
> >=20
> > As a Weston developer, I don't mind adding checks for ENODEV. But if I
> > don't have to, even better. Weston is going to need more code to handle
> > DRM device unplug in any case.
> >=20
> > Sorry, no preference from me. ;-)
> >=20
> > I do agree that replacing ENODEV with fake success is hard to imagine
> > regressing anything. It's something you can do in the kernel at any
> > time easily, but going from fake success to error is going to be
> > painful. Maybe don't change things until there is a good reason to?
> >=20
> > We need a kernel that doesn't crash before we can properly test what
> > would be best for userspace, fake or error. =20
>=20
> One upshot of faking stuff and only bailing in low-level hw code is that
> it makes validating the races when you hotunplug easier - if we remove the
> early bail-out check even an ioctl later on will look like it raced with
> the hotunplug path in the kernel. So better assurance that things won't
> blow up badly.
>=20
> Otoh the early bail out in the top-level ioctl code increases the odds
> that you'll survive even on a driver that's totally buggy.
>=20
> So yeah I guess maybe we should just document that currently you get an
> -ENODEV and maybe have the option mentioned that we might change this
> going forward. See also
>=20
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#recommended-ioctl-=
return-values
>=20
> I think that needs an update, at least clarify that "not present" includes
> "no longer present".

So if dmabuf import related ioctl returns ENODEV, it means a Wayland
compositor should not punish the client for giving a bad buffer.

If a compositor uses EGL to import a dmabuf, then the EGL
implementation will be calling dmabuf import related ioctls, does it
not? But I'm fairly sure that EGL has no way to signal this particular
condition to the caller uniquely. That means that either a compositor
accepts buffers it never should have, or that it punishes clients for
the DRM device disappearing.

See the below quote for a reminder:

> > > > > > > > +- dmabuf which point to memory that has disappeared are re=
written to
> > > > > > > > +  point to harmless zero pages, similar to mmaps. Imports =
still succeed
> > > > > > > > +  both ways: an existing device importing a dmabuf pointin=
g to
> > > > > > > > +  disappeared memory, and a disappeared device importing a=
ny dmabuf.   =20
> > > > > > >=20
> > > > > > > Same as above, I would expect drmPrimeHandleToFD and drmPrime=
FDToHandle
> > > > > > > to return -EIO in case device is detached   =20
> > > > > > I imagined a use case behind this: a Wayland compositor attempt=
ing to
> > > > > > import a client's dmabuf. The GPU the client was using is
> > > > > > hot-unplugged, meaning the dmabufs lose their storage. It is up=
 to the
> > > > > > client to handle its rendering GPU disappearance on its own, bu=
t also
> > > > > > the compositor should not disconnect it because the GPU disappe=
ared.
> > > > > > It's not the client's fault the GPU disappeared.
> > > > > >=20
> > > > > > In Wayland, failure to use a wl_buffer is considered a protocol=
 error,
> > > > > > and protocol errors are always fatal: the client is disconnecte=
d. The
> > > > > > rationale is that the compositor must always be able to present=
 the
> > > > > > client buffer somehow. If the compositor cannot, then the clien=
t did
> > > > > > not obey the protocol.
> > > > > >=20
> > > > > > The fallback presentation path in a compositor is usually impor=
ting the
> > > > > > dmabuf to EGL, to be sampled from OpenGL. Normally the protocol
> > > > > > guarantees that this works, so any failure to do so is a protoc=
ol
> > > > > > violation. But if the GPU used by the client suddenly disappear=
s and
> > > > > > the imports start to fail, that is interpreted as a protocol vi=
olation
> > > > > > unless the compositor can see why the import failed. Since the =
import
> > > > > > is done via EGL, getting the right error code plumbed through f=
rom
> > > > > > libdrm functions to the EGL caller would be a hassle. I don't s=
ee any
> > > > > > error code in EGL_EXT_image_dma_buf_import reserved for "the dm=
abuf
> > > > > > storage was hot-unplugged", and I doubt there is anything exclu=
sively
> > > > > > for only that in the EGL base spec either.
> > > > > >=20
> > > > > > The cost of lying that the import worked is that the compositor=
 will
> > > > > > paint black or transparent where the window was supposed to be.=
 It's a
> > > > > > graphical glitch that is contrary to the Wayland design princip=
les, but
> > > > > > in this case a glitch is unavoidable: even if the compositor kn=
ew this
> > > > > > buffer is now bad, what would it paint instead? It has nothing =
else to
> > > > > > paint from. I'm assuming the compositor is using a different GP=
U than
> > > > > > what disappeared.
> > > > > >=20
> > > > > > Ideally, the client will eventually react to losing the GPU and=
 either
> > > > > > crash, quit, or switch its rendering to something that works wh=
ich
> > > > > > simply gives the compositor a new, working buffer without losin=
g any
> > > > > > window state in the process. If we risk the compositor disconne=
cting
> > > > > > the client, then the client might not recover even if it wanted=
 to.

This goes for both ways: importing a good dmabuf to a bad device, and a
bad dmabuf to a good device. In neither case there should be a risk of
erroneously disconnecting the Wayland client.

Hmm. Maybe Wayland compositors should ignore all EGL import failures
that happen after the wl_buffer has been created (which implies that
the dmabuf has been validated to work initially). When import fails at
a later time, the compositor should just paint some error pattern
instead of the window. That would let the kernel keep on returning
errors.

Yeah, ok. I'll keep the ENODEV there in my next version. Let's see how
that looks then.


Thanks,
pq

--Sig_/jf3_UfxUaI9cRm7yH3FZqUS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7Prk4ACgkQI1/ltBGq
qqfsIw//TZdn/ztJyXctBuXNdU4wTc6BWxR/+R9PdAEW0qEYw7IlIyjshSyIk6ls
v/RttcrdK6FWbl6nUOKTyqm1hTiZoS8c6h8DsCTtzir1nyYpYVSQjCV21/HKajNY
pIKI8h/TajqPgv/v+8CI3TEPLy0qJ6VLnvuNHKlO5q3iFtYGhVN1yAU3asgFdV8e
6FL8cGVv1A7tihhOWV8/cSEqoRgOXY6hUlLdekx1eJhe1QHhazDnJkFCX6oD9mwl
xBlaTMBvP8JwCxYOp+DWNN6zSxVpVs2fvehenis8fouJK9y5YW2AlWiTT8RaR96d
YaO7w6IbMsiDINjuPl7siUJHr1Q23EvjTki1HRRizxCFUwwCuU8N5nXCqrkU9o/V
+fP1X00417wgRW4j6QWRMLTO1221c9gnMZ9q+7rhyM/lgi7wHh7aZIUjiUQOlfcU
vIkspHvW9aEjZRl9vUrObARzTessDLT0cHxPp1bCTAWgauqd0a0TAN0yr+867AfN
B/HtHKDgxRAZ+0XQG11hgVxbTuHIhdPXO43EM9RH2H8ZG4vHwkzdcs1ddCsHhHDG
Zibcb69+0lo6uGMihv24uuu1mw1B9U0bJzogmMEjyC/DJ8x9qmnY8HSToH28vCcD
DphTdDJj0otofXMGXJ+4n9FH8q5BPbZuvF2GNSycUrUj9WbY3WA=
=vdP/
-----END PGP SIGNATURE-----

--Sig_/jf3_UfxUaI9cRm7yH3FZqUS--

--===============1663152541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1663152541==--
