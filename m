Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3D860D42
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 09:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5BA10E0A2;
	Fri, 23 Feb 2024 08:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="h24xdgKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EC010E0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tK8dMtUSV+xfiDmw2jq3CWSxeB42OeYdW0uhF9bK3AQ=; b=h24xdgKaYdi9UXoWLNmbLOvqys
 Y4ZztgSxTupzrY+MLinrGLEUjmTgzhFdBWKN9J1YOx8do871TXRIDIuKzCdkC0M2THIhcXgpWeQ9b
 KZRL/FaZtsBeirHFcOrqkMzBcrtfIsPRwKGBgK3paVyOBgTL89dC2AJEUTAJ7gbaGC82fgDaLWIAX
 Aewzo3VyExRRBjkkOFXV77IbsMXWqAgY9jfKOXo+WUqsb9uu97LkMUO15KAO0aEWvbjxz0vLCCESV
 wZdIAw7WXktYs078FA0WFha5QSSWULReLvBwbJPPj1kBMIYZdSgCFogI4Hr2hZQzm4ExgjwqzttWB
 ql/tpoiA==;
Received: from [194.136.85.206] (port=37594 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rdRJG-0000YG-2S;
 Fri, 23 Feb 2024 10:53:36 +0200
Date: Fri, 23 Feb 2024 10:53:28 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>, Miguel
 Ojeda <miguel.ojeda.sandonis@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <20240223105328.38d3f8da@eldfell>
In-Reply-To: <ZdeGiMf2npmzJidU@duo.ucw.cz>
References: <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz> <20240222110457.71618f27@eldfell>
 <ZdeGiMf2npmzJidU@duo.ucw.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DzMEp3+KIkIk+zunFji/4aX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/DzMEp3+KIkIk+zunFji/4aX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Feb 2024 18:38:16 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
>=20
> > > > so after more feedback from the OpenRGB maintainers I came up with =
an even
> > > > more generic proposal:
> > > > https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_17530=
72869   =20
> > >  =20
> > > > >evaluate-set-command ioctl taking:
> > > > >{
> > > > >=C2=A0=C2=A0=C2=A0 enum command=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* one of supported_commands */
> > > > >=C2=A0=C2=A0=C2=A0 union data
> > > > >=C2=A0=C2=A0=C2=A0 {
> > > > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char raw[3072],
> > > > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {
> > > > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <input st=
ruct for command 0>
> > > > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },   =20
> > >=20
> > > Yeah, so ... this is not a interface. This is a backdoor to pass
> > > arbitrary data. That's not going to fly.
> > >=20
> > > For keyboards, we don't need complete new interface; we reasonable
> > > extensions over existing display APIs -- keyboards are clearly 2D. =20
> >=20
> > I suppose they could be seen as *a* display, but if you are referring
> > to DRM KMS UAPI, then no, I don't see that fitting at all: =20
>=20
> So -- we already have very similar displays in
> drivers/auxdisplay. drivers/auxdisplay/cfag12864b.c is 128x64 display,
> 1-bit display for example.

Auxdisplay are not exposed as DRM KMS device, or are they?
I don't see cfag12864b.c using any DRM calls.

DRM drivers are under drivers/gpu/drm.

I know nothing about auxdisplay. If it's fbdev UAPI, then I don't know -
people have been trying to kill it for years, and basing anything on it
seems like a dead idea. Or maybe it's ok for extremely small displays
where there is no display controller to speak of, and definitely no use
ever for dmabuf? Where CPU banging bits of raw pixels is enough, and no
desktop would ever want to touch them.

But I'm not talking about fbdev either, I'm talking about DRM KMS.

>=20
> > - the "pixel grid" is not orthogonal, it's not a rectangle, and it
> >   might not be a grid at all =20
>=20
> It is quite close to orthogonal. I'd suggest simply pretending it is
> orthogonal grid with some pixels missing :-). We already have
> cellphone displays with rounded corners and holes in them, so I
> suspect handling of missing pixels will be neccessary anyway.

Yes, but I do not agree on the similarity at all, nor that it would be
"close to orthogonal" by simply looking at my keyboard. Hans de Goede
iterated on this much better than I.

> > - Timings and video modes? DRM KMS has always been somewhat awkward for
> >   display devices that do not have an inherent scanout cycle and timings
> >   totally depend on the amount of pixels updated at a time
> >   (FB_DAMAGE_CLIPS), e.g. USB displays (not USB-C DP alt mode).
> >   They do work, but they are very different from the usual hardware
> >   involved with KMS, require special consideration in userspace, and
> >   they still are actual displays while what we're talking about here
> >   are not. =20
>=20
> As you say, there are other displays with similar problems.

That's no justification to add even more problems.

> > - KMS has no concept of programmed autonomous animations, and likely
> >   never will. They are not useful with actual displays. =20
>=20
> Yep. We need some kind of extension here, and this is likely be quite
> vendor-specific, as animations will differ between vendors. I guess
> "please play pattern xyzzy with parametrs 3 and 5" might be enough for th=
is.

Right. I very much believe that is not going to fly in DRM KMS.

> > - Userspace will try to light up KMS outputs automatically and extend
> >   the traditional desktop there. This was already a problem for
> >   head-mounted displays (HMD) where it made no sense. That was worked
> >   around with an in-kernel list of HMDs and some KMS property
> >   quirking. =20
>=20
> This will need fixing for cfag12864b.c, no? Perhaps userspace should
> simply ignore anything smaller than 240x160 or something...

Yes, a size limit would make sense in desktop usage.

> > Modern KMS UAPI very much aims to be a generic UAPI that abstracts
> > display devices. It already breaks down a little for things like USB
> > displays and virtual machines (e.g. qemu, vmware, especially with
> > remote viewers), which I find unfortunate. With HMDs the genericity
> > breaks down in other ways, but I'd claim HMDs are a better fit still
> > than full-featured VM virtual displays (cursor plane hijacking). With
> > non-displays like keyboards the genericity would be completely lost, as
> > they won't work at all the same way as displays. You cannot even show
> > proper images there, only coarse light patterns *IF* you actually know
> > the pixel layout. But the pixel layout is(?) hardware-specific which is
> > the opposite of generic.
> >=20
> > While you could dress keyboard lights etc. up with DRM KMS UAPI, the
> > userspace would have to be written from scratch for them, and you
> > somehow need to make existing KMS userspace to never touch those
> > devices. What's the point of using DRM KMS UAPI in the first place,
> > then? =20
>=20
> Well, at least we have good UAPI to work with.

..Where the great majority of that UAPI is ill-fitting for the device,
and requires userspace to use existing UAPI in completely new ways. KMS
UAPI is also very complex to use, because the devices it is meant for
are complex, timing sensitive, and capable of image processing.

> Other options were 100
> files in /sys/class/leds, pretending it is a linear array of leds,
> just passing raw data around, and pretending it is grid of RGB888
> data.
>=20
> Anyway, there are devices such as these: (8x8 LED display).
>=20
> https://www.laskakit.cz/8x8-led-matice-s-max7219-3mm-cervena/
>=20
> We should think about what interface we want for these, and then I
> believe we should make RGB keyboards use something similar.

Unfortunately I cannot say anything about any other UAPI options. I know
nothing of any of them. My comments come from being a Weston developer,
a Wayland compositor for both desktop'ish and embedded use cases that
uses DRM KMS.


Thanks,
pq

--Sig_/DzMEp3+KIkIk+zunFji/4aX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXYXQgACgkQI1/ltBGq
qqdl/xAAiIqNg5p95f0g15c7WzwQLTRjzU4mu8uPP4zW0eRAczrXnN2LG3dwxZqh
Nljt27AVoA8wX9lDCDkkzKLAvx2QgJzPWOw2jTt3S6ymMq6wcHXSjV9PBkK68Oto
dutvVfC7zwbPZoEMektE1GezwzTRZEUsMgN62bcC7D+OBTyzBj1b/r40ZW/TSjS1
ccl6AOpVgqcz/OnR3f9qXoMJXNvLn3KuqMXwLqyhygsYQivTyXVgajzhHePLtmeW
EHHBIzY+JuFugmdamCd5rUoT/q4S3tQPQJNsrneSs2Lwv+d9q8lsQ7ehDx9HtYll
wcQtLZZznSzCfIXlZNwhjufFp+Dj8BoWRY4J7ABNpe6gT+eQbnR51Z/Aosq3IE+0
6ukLsOoBFzUF+w6rvfaspXdwMxwavhMp7qCuDA3TlXK1kIqFVOSDAjLmSrU0gY+u
s1vtlcnxGhcbWbsIp+oE5mlXtbynNTEKenyXsKp3En0QTN4FWF+ko02sJJLSi+rz
heOd6K9/ZmU3OcqM2pmaHE+MYWnSFafAsGHO4MmuzMsFo6IAlreP3RMEFnSME0wH
ORvlnABzf/0RbdKLWV9kGMvF5fKx+4fPC97EuqmlCTuocLjlpiRAtDKnuO8jNbfc
5vcPYfU8Gs6fY0MhrdGDMn86ZFcjOJpfzMuAT4BZp1iSnkNgFJ0=
=Wa9G
-----END PGP SIGNATURE-----

--Sig_/DzMEp3+KIkIk+zunFji/4aX--
