Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E078090E88F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C85510EC25;
	Wed, 19 Jun 2024 10:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="PgZ2z4/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53C510EC22;
 Wed, 19 Jun 2024 10:44:01 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id E13451C009C; Wed, 19 Jun 2024 12:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1718793838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vo9RiiSSC/ZbBTBqmG8HeRvLXY/RIIoNbA30ISvJUoQ=;
 b=PgZ2z4/6URfgbVQwjQo/bCy4eqsH/PuYqqNqksu3WkoxLbe9FKm+mxAyyuektKRQgzU5IH
 twT4V37ySrBgxua1Xrn6YhX2zCHPLivEFh2DequUF+ABhr24XHJZzh+lpAh7DlhMQCoOrR
 abkcaW2qjg4lQucbCD6qANdupRGZ9F8=
Date: Wed, 19 Jun 2024 12:43:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rafael Wysocki <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Linux 6.10-rc1
Message-ID: <ZnK2bmDFuwX8E5rY@duo.ucw.cz>
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
 <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
 <ZnABbKrIzmmEoFEV@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="piExBvh6QckgN0jN"
Content-Disposition: inline
In-Reply-To: <ZnABbKrIzmmEoFEV@duo.ucw.cz>
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


--piExBvh6QckgN0jN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Let's bring in the actual gpu people.. Dave/Jani/others - does any of
> > > this sound familiar? Pavel says things have gotten much slower in
> > > 6.10: "something was very wrong with the performance, likely to do
> > > with graphics"
> >=20
> > Actually, maybe it's not graphics at all. Rafael just sent me a pull
> > request that fixes a "turbo is disabled at boot, but magically enabled
> > at runtime by firmware" issue.
> >=20
> > The 6.10-rc1 kernel would notice that turbo was disabled, and stopped
> > noticing that it magically got re-enabled.
> >=20
> > Pavel, that was with a very different laptop, but who knows... That
> > would match the "laptop is much slower" thing.
> >=20
> > So current -git might be worth checking.
>=20
> So... I went to (then) current -git and I don't want to replace my
> machine any more. So the problem should not exist in current mainline.
>=20
> (I did not have good objective data, so I'm not 100% sure problem was
> real in the first place. More like 90% sure.)

Ok, so machine is ready to be thrown out of window, again. Trying to
play 29C3 video should not make machine completely unusable ... as in
keyboard looses keystrokes in terminal.

https://media.ccc.de/v/29c3-5333-en-gsm_cell_phone_network_review_h264#t=3D=
340

dmesg is kind-of unhappy:

[130729.891961] usb 2-1.2.3: reset low-speed USB device number 13 using ehc=
i-pci
[130733.311644] usb 2-1.2.3: reset low-speed USB device number 13 using ehc=
i-pci
[130736.534601] i915 0000:00:02.0: [drm] *ERROR* Atomic update failure on p=
ipe A (start=3D617818 end=3D617819) time 159 us, min 1017, max 1023, scanli=
ne start 1012, end 1024
[130738.625131] usb 2-1.2.3: reset low-speed USB device number 13 using ehc=
i-pci
[130745.451785] usb 2-1.2.3: reset low-speed USB device number 13 using ehc=
i-pci
=2E..
[131631.941091] usb 2-1.2.3: reset low-speed USB device number 13 using ehc=
i-pci
[131634.817628] usb 2-1.2.3: reset low-speed USB device number 13 using ehc=
i-pci
[131639.536918] usb 2-1.2.3: reset low-speed USB device number 13 using ehc=
i-pci
[131790.153952] i915 0000:00:02.0: [drm] GPU HANG: ecode 6:1:95ffffbc, in X=
org [3043]
[131790.154245] i915 0000:00:02.0: [drm] GT0: Resetting chip for stopped he=
artbeat on rcs0
[131790.255994] i915 0000:00:02.0: [drm] Xorg[3043] context reset due to GP=
U hang

Wifi is a bit too active, even on fairly idle system:

    430 root     -51   0       0      0      0 S   0.3   0.0   8:48.74 irq/=
17-iwlwifi                                 =20
Ideas welcome, especially some way to see what graphics is doing.

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--piExBvh6QckgN0jN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZnK2bgAKCRAw5/Bqldv6
8vkSAKCYZujnIFEfpnaKXQ736XmOoaRtZACeIxVRbAkJLd/Pnd3AN4nAg9UzEiY=
=Jm95
-----END PGP SIGNATURE-----

--piExBvh6QckgN0jN--
