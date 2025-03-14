Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2908A61DC1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 22:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38D010E052;
	Fri, 14 Mar 2025 21:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="DJi/IKUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 441 seconds by postgrey-1.36 at gabe;
 Fri, 14 Mar 2025 21:14:16 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E81210E052
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 21:14:16 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 24C141C00B2; Fri, 14 Mar 2025 22:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1741986403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=smPhwJATKEjWQ+pl7R6bsg4CgAkcIEX5UUZ9M/FhqZE=;
 b=DJi/IKUSvjJ2MP//YCjTNZjs/ita0pUBnuUuS7aGK4JeC/seuTz+RW7jJro2VKTnBHsvpE
 NMKSF3lW3eK/OR5z8bRq23Zin1mzdpQxO1mcGqi84VEktTeW5b+3zI1ZV8eJ5HdwtHrVy+
 RICi0A+z73e+F+oj/RUvNljmne5pHIQ=
Date: Fri, 14 Mar 2025 22:06:42 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, cs@tuxedo.de,
 platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v5 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Z9SaYi5sKOeKTvRA@duo.ucw.cz>
References: <20250121225510.751444-1-wse@tuxedocomputers.com>
 <aa91e17f-0ea8-4645-a0f9-57c016e36a9e@gmx.de>
 <Z53f7VNIgUWWFn9l@duo.ucw.cz>
 <b69e2766-2238-4913-ae2d-21d8716f2eef@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="75ovjfMpliKM0pqD"
Content-Disposition: inline
In-Reply-To: <b69e2766-2238-4913-ae2d-21d8716f2eef@tuxedocomputers.com>
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


--75ovjfMpliKM0pqD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Comments from previous review were not addressed.
> >=20
> > Most importantly, this is not a way to do kernel interface. We want
> > reasonable interface that can be documented and modified as needed. We
> > want to pass /dev/input to userspace, not raw HID. This is not ok.
>=20
> There are already 2 endless discussions about this:
>=20
> https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedoco=
mputers.com/
>=20
> https://lore.kernel.org/all/73c36418-34d6-46cf-9f10-6ca5e569274f@tuxedoco=
mputers.com/
>=20
> And a shorter one before that:
>=20
> https://lore.kernel.org/all/30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedoco=
mputers.com/
>=20
> The brief:
>=20
> - LampArray is a standard that will hit the Linux world anyway.

Maybe. Still have to see device implementing that. LampArray will
still need /sys/class/leds for compatibility. LampArray still does not
solve effects. More importantly, it is not okay to say "kernel
interface is specified by that crazy document from 3rd party".

> - The alternative proposal via a led matrix does not even really fit
> keyboards, and does not at all fit all other device types.

We are solving keyboards, not the other device types. The other devices
can likely be handled by existing /sys/class/leds interfaces.

> Hans and Benjamin already agree with me that LampArray is the way to go.
>=20
> So after over 2 years can I please have a final decision on how to implem=
ent this?

For final decisions, you'd have to talk to Linus.

(And sorry for the delay, btw).

If you want to move this forward, place a driver in
drivers/leds/keyboard. Implement /sys/class/leds interface, but make
sure interface is clearly separated from the code talking to the
firmware. Then we can review that, perhaps merge, so users will have
something, and decide what interface to use for per-key control.

LampArray is no-go. Other options are open.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--75ovjfMpliKM0pqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ9SaYgAKCRAw5/Bqldv6
8iwJAJ9mnjTAm2a5BD6DI5p8cmuCHFDsmgCfQXGzc5tidZGm75RqL1iGB0UMvPw=
=uU6V
-----END PGP SIGNATURE-----

--75ovjfMpliKM0pqD--
