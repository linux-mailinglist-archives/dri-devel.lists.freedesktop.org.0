Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903AC9A9EA2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F4810E632;
	Tue, 22 Oct 2024 09:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="TtdUpEM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958ED10E632
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:37:06 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 911941C006B; Tue, 22 Oct 2024 11:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1729589824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tg2JuoUmlo3RkSh7poLOzAG967fy1v68Nzs5uZWagZs=;
 b=TtdUpEM2NsQQkqyjZ5QPUNMkgEmk47bDRvWXJdC/klJF1FuaWUd1aruzDuGrtUz0qPE28n
 p4dLKJfD+Oa9bQLvi3ltDxy2gF7An3wHt5ycSsxCt/6O9/wy/DJ+sOOM9Q1eu2Ay9RZ/9k
 ul+0rTdi/e8GP06ajOiNdM+q2rH1qRo=
Date: Tue, 22 Oct 2024 11:37:04 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <ZxdyQFMRIRusMD6S@duo.ucw.cz>
References: <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ZADFVpt7/0P2Ieq3"
Content-Disposition: inline
In-Reply-To: <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
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


--ZADFVpt7/0P2Ieq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Personally I really like the idea to just emulate a HID LampArray device
> > for this instead or rolling our own API.  I believe there need to be
> > strong arguments to go with some alternative NIH API and I have not
> > heard such arguments yet.
>=20
> Agreed on everything Hans said.
>=20
> I'll personnaly fight against any new "illumination" API as long as we
> don't have committed users. This is the same policy the DRM folks
> > are

Well, and I'll personally fight against user<->kernel protocol as
crazy as HID LampArray is.

OpenRGB is not suitable hardware driver.
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ZADFVpt7/0P2Ieq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZxdyQAAKCRAw5/Bqldv6
8ts0AJ0bRyaE7ceSMozAGGusBFUkaEmLsgCeMq3NWA3DTE0v0CewLF/DIpXMt3c=
=kdQL
-----END PGP SIGNATURE-----

--ZADFVpt7/0P2Ieq3--
