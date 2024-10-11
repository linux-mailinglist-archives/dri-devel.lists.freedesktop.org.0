Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5060799A771
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 17:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A198C10E0F9;
	Fri, 11 Oct 2024 15:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="BkKdV6cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8050A10EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 15:23:30 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id EDC561C0087; Fri, 11 Oct 2024 17:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1728660207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x+uzJgAZKr0aQskZeYDshW8VRu9nH9afBqYYtu8uge4=;
 b=BkKdV6cvGSL2VVmCHgZHtvvMduAME43++YaCcGI1vW5aZhaCeH6rvzvpMZqanlABN0qGdI
 TO5Eg6T+zPnoGSqe/eJ8Bi7AJD0AEsSm35xVOJKXHZPIxCKrIwOo9+ay2dty13XTksXixY
 NdtBHZ5k9mYh3L9toHtex9VzwQHBipo=
Date: Fri, 11 Oct 2024 17:23:27 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <ZwlC750GojkprUKg@duo.ucw.cz>
References: <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
 <rdo2yyy5dxsxrfm7bweuuvsqjzjelyevo5xvufixuiyrdlf7pc@mprc7pzbpnla>
 <Zv0YI3qIEg88Dx4c@duo.ucw.cz>
 <hdahq2vfi3bnvaqswwdtave2kc2qm3ngvcwn6cgfiirfjfbqnz@zk77mbs3yktp>
 <Zv54/T+6znqZB3X9@duo.ucw.cz>
 <ysidntvhwmqwe5o6rpshtoam674lwnkook747ni5dbf4z5sf3a@vdf44xu2ydjz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2TcMguCtEoo8TZyh"
Content-Disposition: inline
In-Reply-To: <ysidntvhwmqwe5o6rpshtoam674lwnkook747ni5dbf4z5sf3a@vdf44xu2ydjz>
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


--2TcMguCtEoo8TZyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > There is a slight difference between mouse support and LEDs on your
> > > keyboard. The former is actually required to bring up the machine and=
 to
> > > use it, the latter is nice to have.
> >=20
> > But that's not the difference that matters. Linux is not microkernel,
> > and is trying to provide hardware abstractions. (Except for printers,
> > I guess that's because printers are often network devices).
> >=20
> > Besides, mouse was not required to bring up a machine "back then".
> >=20
> > Besides,
> >=20
> > 1) using those keyboards in dark room without backlight is hard,
> > because their labels are translucent and not having enough contrast.
> >=20
> > 2) rainbow effects make people ill.
>=20
> And I agree with you here. And that's also why I agree with Werner's
> plan: have a minimum support in kernel for that with the already
> supported LED class, which is supported by UPower and others, and let
> the ones who want the fancy effects be in charge of their mess.

But the patch being proposed does not match the this description,
right?

And for hardware I seen, "minimum driver" you describe would be
already 90% of the full driver. (We can just use fbdev interface...)

Anyway, lets do it. I have rgb keyboard, you have few, and we have
Tuxedocomputers with machines where driver can't live in userspace.
If you have working driver, lets see it. I have posted my copy, but I
hae problem where keyboard functionality stops working when its
loaded. Can you help?

Then we can see how much of the driver is required for basic
functionality. I suspect it will be fairly easy to turn it into "full"
driver at that point.

> > Note how we have drivers for audio, LEDs, cameras, dunno, iio sensors,
> > none of that is required to bring system up.
> >=20
> > We need driver for the WMI stuff in kernel. And that point it should
> > be pretty clear proper driver/subsystem should be done.
>=20
> Yes, and again, I never said we need to provide WMI to userspace.

Good.

> What I want is:
> - provide a minimum support on Linux using already existing APIs (LED
>   class)
> - allow crazy people to do their thing if they want to have a rainbow
>   initiated by every key press
> - ensure the minimum support of the LED class is not messed up when
>   people start using the HID LampArray API.
>=20
> HID LampArray is a ratified standard by a few hardware makers already[0]
> (Acer, Asus, HP, Logitech, Razer, SteelSeries and Twinkly apparently).

I have yet to see HID LampArray device.

Best regards,
									Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--2TcMguCtEoo8TZyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZwlC7wAKCRAw5/Bqldv6
8qY2AKC+nAvGhkJI328sv8/1wPlLQa94/ACfdypXrZPZo6fWin1NoeaTgtYi2cc=
=98+x
-----END PGP SIGNATURE-----

--2TcMguCtEoo8TZyh--
