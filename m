Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D538D2D94
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 08:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0079510E234;
	Wed, 29 May 2024 06:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E7ftm9ck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCED10E89A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=0v7Y
 Z0DGoTlv5LbwocGv+P6A+uUTCQ30CCVAx/ZCEx8=; b=E7ftm9ck0lSppdUms6M5
 ZAV58PgI8DI6F5hFBa75dSPgM+Er8wmVPvCk8IjxCgpMdFFjFcCSu4vW2JhXI84m
 e0z5IFsv5hwOdWqAmngo4XuISnTxd5NDR4e6RyeQHFXmtFGaFSwPzRfge92DbE55
 z38O7/WCNYjkP2eoeERAiITk3kQTFo+84doVsvqCrLcUFClzd3CyBn1V98ioyVr7
 C7BZUy/0KRkpul92YNWAzgre3n9ZwBy1wCgttMHnlD1eSECZQuCKte47rG8XOjpf
 HQ8pssNEn1VhAPJEultutJsc41Pm73Eh177dK734ibgJFcIHuP0DDdVZaZQKgbcA
 Rw==
Received: (qmail 468843 invoked from network); 29 May 2024 08:47:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 May 2024 08:47:38 +0200
X-UD-Smtp-Session: l3s3148p1@a9xNIJIZzswgAwDPXwS5AFh1mWvQq9Po
Date: Wed, 29 May 2024 08:47:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Evan Quan <evan.quan@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
Message-ID: <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Alex Deucher <alexdeucher@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
 <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cb3f75dzqp4rngsr"
Content-Disposition: inline
In-Reply-To: <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>
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


--cb3f75dzqp4rngsr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, May 09, 2024 at 01:15:32PM -0400, Alex Deucher wrote:
> On Thu, May 9, 2024 at 8:02=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.=
com> wrote:
> >
> > Support for I2C_CLASS_SPD  is currently being removed from the kernel.
> > Only remaining step is to remove the definition of I2C_CLASS_SPD.
> > Setting I2C_CLASS_SPD  in a driver is a no-op meanwhile, so remove it
> > here.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> and applied.

TLDR: can you ack this so I can apply it for -rc2?

Reason: I2C_CLASS_SPD was scheduled to be removed for 5.10. For some
reason, the newly introduced usage of I2C_CLASS_SPD in this driver went
unnoticed in -next. I would really like to remove I2C_CLASS_SPD now
before other users appear in the next cycle. In my experience, it is
possible to send Linus such patches for early rcX. Like it fixes a "bug"
when trying to handle a moving target.

So, would that be possible that I push this upstream so I can ultimately
remove I2C_CLASS_SPD without further dependencies? If you prefer to push
it through your tree, can you send it to Linus soon?

Thanks and happy hacking,

   Wolfram


--cb3f75dzqp4rngsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZWz4YACgkQFA3kzBSg
Kbb4wRAAnmHF2z89VfGtBVsqHxdIowGPdNh2V6Tp6TrJzr7JsVbTdFOESEp9JpKG
+4NBNwp6pq08scDa9LzwvOEKFk9pr/G3CJCZofUpfOI8c2mbnvUD0QIBaOuxb/Dz
P6w38oAO6l3ujJ0nZuFPA272FXaMHoLyAuMfX6J8Oi+KHJwyVsdvCPWABtY/HXbk
k73iOhaWVcmfjGpFXTURuiGuJmiQsAFaze5DzcWDHqrryM8gsR+nwrR/KAjmhnUo
YXmw5wWUIaPZtg8+xChd6Qz5Q35pJdkyL9sTGh7CELxOMQjlUOK1JR9BlZw8QL2d
XFBCiU9ZiuHS7WjJ4fPSeD2EIEWX5YvXlQQBzaxHIj9jpTHjJSJEhbBSvVrw/AMl
q310OPOjlGxy9rnezn7ijCVTjqIsfE5+t7m3XZfqJPj0v3XTLs7AtCq2A6yDoMH/
T/BvvRKK9Bnlfgr+0dwzDy7kMpt8BQl3io+gDRciwz1FaF6Q4ZaJD4Nche15QtY/
z/gaPg8Dz/102E1e+w+wbqyA7dELhOWrjUDM0pe0lhW+YVHWE2+uegGeenjDvdW8
lO7b3xmvoFTAu4W7PXwuDpJU6c6eieI56VscVn/jC6so26/y5y9dzz7zVSK2aITY
xeYPkW8lWgH8DQ5xaMtLt1edhrBRy6oUl0VTednA25bhpRSm92w=
=ydZ4
-----END PGP SIGNATURE-----

--cb3f75dzqp4rngsr--
