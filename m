Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD695DD94
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 06:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AE86E09A;
	Wed,  3 Jul 2019 04:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3C46E09A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 04:54:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45dpgS56gpz9s00;
 Wed,  3 Jul 2019 14:54:44 +1000 (AEST)
Date: Wed, 3 Jul 2019 14:54:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190703145443.2ea425c8@canb.auug.org.au>
In-Reply-To: <20190703015442.11974-1-Felix.Kuehling@amd.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562129686;
 bh=Os6ca0ppiue1tcJbzi1HamLBeaX/2jBV/TB62bRk6U4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aRxq9Doh85BZvVKPihqH3aBGTVX7KGlQRi8G4uNmaeMld3O0agP4jgFXphQxOMcTR
 6KaMO5fHrqtHdgJRoha7Uk5u1eq4cOYKaxF0Ue4k5qXMEADMeBof0Fw9VlQADjciAB
 ZG5zNl3+nVSx8/HQV8KhIHi2IgUNLmkc+3G2JA4J0/+XkE7UMOQHR+lSUUkL8WlccD
 Ng7TVkmOn6VoBmmPVdKpA3+dHFYa184VTaCLx3ULJ+NbwGbRSQQeREx7etHrVJZaR+
 HXXAgjhK+hAQ0zV16k4i2vdwhN06ydk6H13JMo0JVb6pic8IzcZV8xkoGktIr/Gqmj
 KdxDV1upSOOHw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Jason Gunthorpe <jgg@mellanox.com>
Content-Type: multipart/mixed; boundary="===============1946813774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1946813774==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1ISLS9cnW4KdQ3cHKyFA5Eq"; protocol="application/pgp-signature"

--Sig_/1ISLS9cnW4KdQ3cHKyFA5Eq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Jul 2019 01:55:08 +0000 "Kuehling, Felix" <Felix.Kuehling@amd.com=
> wrote:
>
> From: Philip Yang <Philip.Yang@amd.com>
>=20
> In order to pass mirror instead of mm to hmm_range_register, we need
> pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages because mirror
> is part of amdgpu_mn structure, which is accessible from bo.
>=20
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> CC: Stephen Rothwell <sfr@canb.auug.org.au>
> CC: Jason Gunthorpe <jgg@mellanox.com>
> CC: Dave Airlie <airlied@linux.ie>
> CC: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/Kconfig                          |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  5 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  3 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  8 ++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h           |  5 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 12 ++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h          |  5 +++--
>  8 files changed, 30 insertions(+), 11 deletions(-)

I will apply this to the hmm tree merge today to see how it goes.

--=20
Cheers,
Stephen Rothwell

--Sig_/1ISLS9cnW4KdQ3cHKyFA5Eq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0cNRMACgkQAVBC80lX
0GxR+wf/XafVose6tyhCcoiEqvhT+ysgJzCZmqFzBVqIISTf31GzmmteRaShVfAv
qAQZpczlWvcJ8HWZIlJrNYQXlSgrP7s1Mu57oPZjUHoYwWGLKegjhVkUv8MJxm70
uD8kYtHsy7k9oK5aC+dVhcXgcVxIjFootGahidgHw0JLGTD9LrVKs5giMo/hHpRU
/VvFzLeCHKbY3VqEi4/brg6vMkx5M1gHf5oWz/S8i4XxNhKHd7X/5TGSk/IqEM3n
yG9QcUb/XHadm0DAcIYokCKQArVoB0uTo8FI23rufoP5v4imBIQVtXequtMKwA6w
2xXj+tSEXp9Ha/hkOJwI96/D/6BNHw==
=TZJq
-----END PGP SIGNATURE-----

--Sig_/1ISLS9cnW4KdQ3cHKyFA5Eq--

--===============1946813774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1946813774==--
