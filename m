Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B8085FF88
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B510610E9D0;
	Thu, 22 Feb 2024 17:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="kLXdkK8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1E310E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:38:18 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 37AA61C0080; Thu, 22 Feb 2024 18:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1708623497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cxr6GJjOhaFoEBz5sAagQbB41dqp9VPFsBRGUex2Ge8=;
 b=kLXdkK8RS/VsXpCtaJGevFjtXHj4xPsfEND+iP2dQKQRhHmvXjnVOipvkka8dVEATAkRUj
 yhx99MwrgebVfBz1J3xdkaCvKrmmgDAgZiVyJRbcwyZXPWTVemKTovWtlSpWJfVVcToTRz
 xjWeoSGf9Bo0gv5zMgAXZqGjzcreQM0=
Date: Thu, 22 Feb 2024 18:38:16 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <ZdeGiMf2npmzJidU@duo.ucw.cz>
References: <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz> <20240222110457.71618f27@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="eHiECiusCvm6EcTi"
Content-Disposition: inline
In-Reply-To: <20240222110457.71618f27@eldfell>
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


--eHiECiusCvm6EcTi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > so after more feedback from the OpenRGB maintainers I came up with an=
 even
> > > more generic proposal:
> > > https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1753072=
869 =20
> >=20
> > > >evaluate-set-command ioctl taking:
> > > >{
> > > >=A0=A0=A0 enum command=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* one=
 of supported_commands */
> > > >=A0=A0=A0 union data
> > > >=A0=A0=A0 {
> > > >=A0=A0=A0 =A0=A0=A0 char raw[3072],
> > > >=A0=A0=A0 =A0=A0=A0 {
> > > >=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 <input struct for command 0>
> > > >=A0=A0=A0 =A0=A0=A0 }, =20
> >=20
> > Yeah, so ... this is not a interface. This is a backdoor to pass
> > arbitrary data. That's not going to fly.
> >=20
> > For keyboards, we don't need complete new interface; we reasonable
> > extensions over existing display APIs -- keyboards are clearly 2D.
>=20
> I suppose they could be seen as *a* display, but if you are referring
> to DRM KMS UAPI, then no, I don't see that fitting at all:

So -- we already have very similar displays in
drivers/auxdisplay. drivers/auxdisplay/cfag12864b.c is 128x64 display,
1-bit display for example.

> - the "pixel grid" is not orthogonal, it's not a rectangle, and it
>   might not be a grid at all

It is quite close to orthogonal. I'd suggest simply pretending it is
orthogonal grid with some pixels missing :-). We already have
cellphone displays with rounded corners and holes in them, so I
suspect handling of missing pixels will be neccessary anyway.

> - Timings and video modes? DRM KMS has always been somewhat awkward for
>   display devices that do not have an inherent scanout cycle and timings
>   totally depend on the amount of pixels updated at a time
>   (FB_DAMAGE_CLIPS), e.g. USB displays (not USB-C DP alt mode).
>   They do work, but they are very different from the usual hardware
>   involved with KMS, require special consideration in userspace, and
>   they still are actual displays while what we're talking about here
>   are not.

As you say, there are other displays with similar problems.

> - KMS has no concept of programmed autonomous animations, and likely
>   never will. They are not useful with actual displays.

Yep. We need some kind of extension here, and this is likely be quite
vendor-specific, as animations will differ between vendors. I guess
"please play pattern xyzzy with parametrs 3 and 5" might be enough for this.

> - Userspace will try to light up KMS outputs automatically and extend
>   the traditional desktop there. This was already a problem for
>   head-mounted displays (HMD) where it made no sense. That was worked
>   around with an in-kernel list of HMDs and some KMS property
>   quirking.

This will need fixing for cfag12864b.c, no? Perhaps userspace should
simply ignore anything smaller than 240x160 or something...

> Modern KMS UAPI very much aims to be a generic UAPI that abstracts
> display devices. It already breaks down a little for things like USB
> displays and virtual machines (e.g. qemu, vmware, especially with
> remote viewers), which I find unfortunate. With HMDs the genericity
> breaks down in other ways, but I'd claim HMDs are a better fit still
> than full-featured VM virtual displays (cursor plane hijacking). With
> non-displays like keyboards the genericity would be completely lost, as
> they won't work at all the same way as displays. You cannot even show
> proper images there, only coarse light patterns *IF* you actually know
> the pixel layout. But the pixel layout is(?) hardware-specific which is
> the opposite of generic.
>=20
> While you could dress keyboard lights etc. up with DRM KMS UAPI, the
> userspace would have to be written from scratch for them, and you
> somehow need to make existing KMS userspace to never touch those
> devices. What's the point of using DRM KMS UAPI in the first place,
> then?

Well, at least we have good UAPI to work with. Other options were 100
files in /sys/class/leds, pretending it is a linear array of leds,
just passing raw data around, and pretending it is grid of RGB888
data.

Anyway, there are devices such as these: (8x8 LED display).

https://www.laskakit.cz/8x8-led-matice-s-max7219-3mm-cervena/

We should think about what interface we want for these, and then I
believe we should make RGB keyboards use something similar.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--eHiECiusCvm6EcTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZdeGiAAKCRAw5/Bqldv6
8vu+AKCMmNbj0QTQPgn6C+lJcqoWg1JfPQCfYj+NkTuf5W57SoPzN7P2Xxr2q5Q=
=TCxg
-----END PGP SIGNATURE-----

--eHiECiusCvm6EcTi--
