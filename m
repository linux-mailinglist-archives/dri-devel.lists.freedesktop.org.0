Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3263298C72E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 23:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA1B10E089;
	Tue,  1 Oct 2024 21:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="miQqc6uF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937D110E089
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 21:03:33 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 530131C00B7; Tue,  1 Oct 2024 23:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1727816612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZMJQ7Xdd/Czu1VGn1Tsno8aYplKs4QKTEfkVhGledB0=;
 b=miQqc6uFrbM49d5QxOIBu7eWTCvjXBRP5z40sKIJdMetB8K1bNq2wbhP48Y5Wo+O6rafkL
 m9OopvDTWSRqRUsKvdxhRPai0SkHGkDczjxd3QSmd+DD1fcUZG+tM6E2fHmRzJG46ukIYh
 /1N1tr69UEhTyENhmA1Qy1Cg6fYFAYE=
Date: Tue, 1 Oct 2024 23:03:31 +0200
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
Message-ID: <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
References: <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="i2yKCeYKo7PAl3qJ"
Content-Disposition: inline
In-Reply-To: <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
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


--i2yKCeYKo7PAl3qJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> all of the requirements here:
> - need to be dynamic
> - still unsure of the userspace implementation, meaning that userspace
>   might do something wrong, which might require kernel changes
> - possibility to extend later the kernel API
> - lots of fun :)

Please don't do this.

We have real drivers for framebuffers. We don't make them emulate
USB-display devices.

Yes, this is a small display, and somewhat unusual with weird pixel
positions, but it is common enough that we should have real driver for
that, with real API.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--i2yKCeYKo7PAl3qJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZvxjowAKCRAw5/Bqldv6
8h00AKCYdnZ7Jiu+V5omssu0osT4YWICWgCdGkyowiNz5O6AcmXFnusH8PKcqVY=
=8+yZ
-----END PGP SIGNATURE-----

--i2yKCeYKo7PAl3qJ--
