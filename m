Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286F7EAD0C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 10:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A34910E1EA;
	Tue, 14 Nov 2023 09:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2E610E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 09:31:23 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A170A1C0050; Tue, 14 Nov 2023 10:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1699954281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CODz8NstgmK92moXl+UOkCNSWzwauPKSWbUcbQNR6vc=;
 b=czasQl0YeQ5W+RSIiEMH8+ShxacJhxOxWAjh6P/5BRH6rK2eZU4z3Ko9aLSDCMlQIreHfL
 vhBaiZANOPqhbezEb/rKXFn4lTxMZo7Gd4RtCKj+eLOgIV5tBuwy+sFascrkKUf66y4ZDz
 fTZmcHV5xjCnffI/qz1h7FpaVYj1074=
Date: Tue, 14 Nov 2023 10:31:21 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.6 09/11] drm/amd: Fix UBSAN
 array-index-out-of-bounds for Powerplay headers
Message-ID: <ZVM+af4bbB/Hx5Pd@duo.ucw.cz>
References: <20231112132736.175494-1-sashal@kernel.org>
 <20231112132736.175494-9-sashal@kernel.org>
 <CADnq5_OyK=rDH38Q8Kiyq9BhWuihgd8wX7XKAffxwkO4w+ksog@mail.gmail.com>
 <ZVEewK-GAnRsrPA3@sashalap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="paJBZC1F9+gCvnp8"
Content-Disposition: inline
In-Reply-To: <ZVEewK-GAnRsrPA3@sashalap>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--paJBZC1F9+gCvnp8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > From: Alex Deucher <alexander.deucher@amd.com>
> > >=20
> > > [ Upstream commit 49afe91370b86566857a3c2c39612cf098110885 ]
> > >=20
> > > For pptable structs that use flexible array sizes, use flexible array=
s.
> > >=20
> > > Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039926
> > > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> > > Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> >=20
> > I don't think any of these UBSAN flexible array changes are stable mate=
rial.
>=20
> I'll drop it, but in general we've been taking kasan/ubsan/kcsan/...
> annotation fixes since it enables (easier) testing on the LTS trees, and
> for example finding issues specific to those LTS trees.

I believe they should not be in stable, either.

In any case, Documentation/process/stable-kernel-rules.rst should be
updated, because it contradicts current practice.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--paJBZC1F9+gCvnp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZVM+aQAKCRAw5/Bqldv6
8mtwAKCOdMnLlfmoCA/L8EwU7sO7zQZxOACfbkjh4IwjOXNImQ69u5j7dz7e4Bs=
=B0dk
-----END PGP SIGNATURE-----

--paJBZC1F9+gCvnp8--
