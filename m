Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7778D4113
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 00:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8193A10F6BB;
	Wed, 29 May 2024 22:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="amwE75pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9938210F007
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 22:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=gqku
 +zLIpBCbEoUm2t9b4G4s51CT4cKXq/2L2o+D2Qg=; b=amwE75pgV5dK+4xFnPqo
 DyDtcsml9QX3OQIqAcBMzxdsM7JT9ENaCeu9m8uDlo/IqI+1/L8UL2GZtO/+wTMa
 1ocT/UUAYAdYP7eu7cHOpMbba8tznOdPTUWXkH3ed+bfSYKpEyTbyYS4zOuazQxQ
 Eh6ZPXh9FSt3dq+L/Ke6awVZt95S9hLnsoqiyLrAujdBeek8gWD6g9Uq6G1NQQO0
 bjyEqY5GdORi2p2OTgUb0kBJwdWjmuGV45y7EFH8sT2uSAfFX9h+hL+B41SutjiN
 0pSWM3LT+tkthnpuUpeYnRbOCDYAm+i1aOyKzPYGqOBqqR4s5QxJgUD5LwpPKXAL
 0Q==
Received: (qmail 701441 invoked from network); 30 May 2024 00:06:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 May 2024 00:06:33 +0200
X-UD-Smtp-Session: l3s3148p1@Ddue9p4Z5olehhYM
Date: Thu, 30 May 2024 00:06:33 +0200
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
Message-ID: <u7nhecqpzwxlwdygbbdza7savhjiy4y4ogvnv63gk6ywfqf4ju@negufshp53rs>
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
 <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
 <CADnq5_M=sd_spEFnboWECMU2t4--y0XF-CcMAL8e_49Zt4dTig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jxe733gkonoiyxnn"
Content-Disposition: inline
In-Reply-To: <CADnq5_M=sd_spEFnboWECMU2t4--y0XF-CcMAL8e_49Zt4dTig@mail.gmail.com>
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


--jxe733gkonoiyxnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > remove I2C_CLASS_SPD without further dependencies? If you prefer to push
> > it through your tree, can you send it to Linus soon?
>=20
> Yes, I'll include the patch in my PR for this week.

Awesome, thank you!


--jxe733gkonoiyxnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZXpukACgkQFA3kzBSg
KbYAdQ//UqdmClsxjsSeZBz7JPdgtAFNhuqS5n2rZWzeQc7KReKCwlK2a4RRAgs/
0LgD55L4tHD1UQABiwDVvU9O9wiT4j2S6f8b+vfHjvXLJBRq7jSymCtyFlD+vZPN
pwS/WKCtp2XO+UDD/uRxihTFgvaImUsap5KAL/yQ7XJOAImhxvcKpEO4SV5HJEA3
vARvBwQp3daxxG3htBfGyb952+sm2qCmYaEGTYX+sdbbqdJ6CCbXvjhYwNOl647e
aJJk7yMvOJ01njJBPSiyUES6nLBdmY0cBrJyyc2osyOzQljTuaYQ+ftO3JDZW7jS
EEbtmi7ZhdueZBcrhCWi6G/IKq03JTH8Ve+xzqGAQ7/KHHROHPeeydr5NKfkfKSh
3bz9cDdVlbwBrzww1KM0hcWgOpJ05uaGt8gmDcb6skJNY4uf5N8yTCnD1TmkZg0E
Z60sm6BIady20o2pVk4NbQ3GDda7w0I6UIsgjZIZuJitq2H7sFbuIySpsz3z9LiY
umSRGL+a6QcqmZ35MRKaMxsye/2Dsi3AyM9kviQnv3s5t9AY3JdX6UONgztXsEW1
h35VOzqXvUhRUjWHSMNojqFDUqZnmg4kQrkP3yldb/oPXPJK+pXoBJzZfxR4+vip
bEa0tp6VWQJvIIMuUTriVHRHoWYKi2p22UHzoBg5sCGI1nZdkJE=
=g8mb
-----END PGP SIGNATURE-----

--jxe733gkonoiyxnn--
