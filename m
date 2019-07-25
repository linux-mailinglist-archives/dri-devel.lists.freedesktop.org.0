Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05276279
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E376ECF9;
	Fri, 26 Jul 2019 09:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225166E695
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:04:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 1E38128AC0F
Date: Thu, 25 Jul 2019 06:04:37 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/7] drm/panfrost: Add heap and no execute buffer
 allocation
Message-ID: <20190725130437.GB3321@kevin>
References: <20190725011003.30837-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190725011003.30837-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============1413651313=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1413651313==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This series is:

Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Wed, Jul 24, 2019 at 07:09:56PM -0600, Rob Herring wrote:
> This series adds new BO allocation flags PANFROST_BO_HEAP and
> PANFROST_BO_NOEXEC. The heap allocations are paged in on GPU page faults.
>=20
> This is based on drm-misc-next. A branch is here[1].
>=20
> Rob
>=20
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git panfrost=
/heap-noexec
>=20
> Rob Herring (7):
>   drm/gem: Allow sparsely populated page arrays in drm_gem_put_pages
>   drm/shmem: Put pages independent of a SG table being set
>   drm/panfrost: Restructure the GEM object creation
>   drm/panfrost: Split panfrost_mmu_map SG list mapping to its own
>     function
>   drm/panfrost: Add a no execute flag for BO allocations
>   drm/panfrost: Add support for GPU heap allocations
>   drm/panfrost: Bump driver version to 1.1
>=20
>  drivers/gpu/drm/drm_gem.c               |   3 +
>  drivers/gpu/drm/drm_gem_shmem_helper.c  |   4 +-
>  drivers/gpu/drm/panfrost/TODO           |   2 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  61 ++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c |  93 ++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  16 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 189 ++++++++++++++++++++----
>  include/uapi/drm/panfrost_drm.h         |   3 +
>  8 files changed, 307 insertions(+), 64 deletions(-)
>=20
> --
> 2.20.1

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl05qOUACgkQ/v5QWgr1
WA0wXw/+I4tXH5NlOKSwl3bLA1o5hWlJeOGdz/HZVVH/OSOycBLCJf9uCYffKL62
tSFv7qijhOiGJssgK6s6ZX4O1jtHwFQ0twXIZ7Ea2W68ybHjr84/0F1Z8xWzv37Q
JzBoYZW2+gjcpwp5iuY97XUElbDIDfOF+lmpoQ7LIjOhMVA+B5ZQoYEXSQ1FxZsw
Ew15iJNQp5ttjtKPJ5s/m+CZJxCMoYUziJrSKoA6x2dDGcXcKbw46kKHYKefhmvZ
2hstPgpNG6fZQYJC/MMfIC+AnC7Kbq2dkbI++EHuB/2PLh9wHFrEfrZqhrXAZ9s/
ufAFAD/foq21e/ngyyFdfE/QBNtYQ0qU9gwECkDQJ/Ud/aDL88x8ClXwXfaSnvkJ
WEO/17CcC9/nJf1FQP3/qZdytSWuZk1vHL1yvADmsIcemgAmgm7o05UsWjP0S2ou
BpNg1vT87UZs1wf9fMT58OiXSWdENu3ovRmENlc4940/dUaCYgyesjfjJxzjghA6
aMHozfZs2yknFCQoZoYVUKQGOXsOl3IlBB+BlcElgpyr6iyT3Eo7C4Uenn14KZcf
ovv7i6uGGSo+yvL5cVGcaNaOLa3qpmjOmlAgwsRcs6u4PwKvsSPvFAzLruuYpVsr
kJzwGi49OAHq5CTpHow20Z1Hrpiw68F4HLZwA7iEPKkt6mD1Fx4=
=EO31
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--

--===============1413651313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1413651313==--
