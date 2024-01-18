Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC0831EA7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 18:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DCB10E8AA;
	Thu, 18 Jan 2024 17:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEFB10E8AA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 17:45:44 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 1B4181C007B; Thu, 18 Jan 2024 18:45:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1705599937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s2decVdRnW3kcXYTXMhZ+4hppOm4DXM8+5MfDGDRqr0=;
 b=D8YVA5WuCkS7PJEvNxOIdAa/kR3li8rbSqVyqKK2zs7wjQsV8Yp/VEOyRtTkA+EN1vHW65
 h42g8hGwRL52WcKdxl9uzxBYVMIIne5rcj6FGkBAXn91gTkWsj8rKMcLuTsIZ4ltqcn+WL
 bQ/UOAGQXnRNJ7mcre5KkuxaHXR1Cv4=
Date: Thu, 18 Jan 2024 18:45:36 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZaljwLe7P+dXHEHb@duo.ucw.cz>
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="9D/I+LN93effYwNd"
Content-Disposition: inline
In-Reply-To: <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
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
Cc: jikos@kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9D/I+LN93effYwNd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We have an upcoming device that has a per-key keyboard backlight, but does
> the control completely via a wmi/acpi interface. So no usable hidraw here
> for a potential userspace driver implementation ...
>=20
> So a quick summary for the ideas floating in this thread so far:
>=20
> 1. Expand leds interface allowing arbitrary modes with semi arbitrary
> optional attributes:

> =A0=A0=A0 - Con:
>=20
> =A0=A0=A0 =A0=A0=A0 - Violates the simplicity paradigm of the leds interf=
ace (e.g. with
> this one leds entry controls possible multiple leds)

Let's not do this.

> 2. Implement per-key keyboards as auxdisplay
>=20
> =A0=A0=A0 - Pro:
>=20
> =A0=A0=A0 =A0=A0=A0 - Already has a concept for led positions
>=20
> =A0=A0=A0 =A0=A0=A0 - Is conceptually closer to "multiple leds forming a =
singular entity"
>=20
> =A0=A0=A0 - Con:
>=20
> =A0=A0=A0 =A0=A0=A0 - No preexisting UPower support
>=20
> =A0=A0=A0 =A0=A0=A0 - No concept for special hardware lightning modes
>=20
> =A0=A0=A0 =A0=A0=A0 - No support for arbitrary led outlines yet (e.g. ISO=
 style enter-key)

Please do this one.

> 3. Implement in input subsystem
>=20
> =A0=A0=A0 - Pro:
>=20
> =A0=A0=A0 =A0=A0=A0 - Preexisting concept for keys and key purpose
>=20
> =A0=A0=A0 - Con:
>=20
> =A0=A0=A0 =A0=A0=A0 - Not in scope for subsystem
>=20
> =A0=A0=A0 =A0=A0=A0 - No other preexisting light infrastructure

Or negotiate with input people to do this.

> 4. Implement a simple leds driver only supporting a small subset of the
> capabilities and make it disable-able for a userspace driver to take over

No. Kernel should abstract this away.

Best regards,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--9D/I+LN93effYwNd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZaljwAAKCRAw5/Bqldv6
8t2rAJ0bXGLlIcltuLM/IFy7NcEBaumlcwCcCEGqrSVmOZCnA82+Y9Rt7Thq3Bw=
=6pEX
-----END PGP SIGNATURE-----

--9D/I+LN93effYwNd--
