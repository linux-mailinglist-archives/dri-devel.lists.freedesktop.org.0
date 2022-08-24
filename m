Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C800D5A1193
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 15:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC7710E254;
	Thu, 25 Aug 2022 13:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA68710E25E;
 Thu, 25 Aug 2022 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vTln3+f0zsm1J3YrouOOpeiGLy8ph8ETRCJz2RLKLQk=; b=K0kwrWRI7yyMcbQo6Nl5evjpwk
 sTvDvRdVuSSBJdQLrzMurymkfeud7lBSd5obHmA42qNI1iO1iJhL8yIk1Bfeu+C3GSzBqxPn1Wc52
 ajY/gp5Sj9ioN8l4ZvhLmDYWNRrHoatQ4vbyQUhqKR1sCWi+9vOk/suGRz3P4WHET0ed7WpkBaWnr
 kufvIHJ1/A1/ESR68SCAhXYNCHtk+gvl9bd9SIsnFarNBozrgoi2LPzxP2MaTggMdPLKg9TjLF57F
 /yvqyDwfKKVD6Y+sBB6x55pmppvpPMkZiyf6UzzkpvAjDcQAxv8I4SVGDqcVsPxqmpJlbqmvrX2zZ
 XnxbyI4Q==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oQtSY-00HLOF-Dv; Wed, 24 Aug 2022 18:42:30 +0200
Date: Wed, 24 Aug 2022 15:42:15 -0100
From: Melissa Wen <mwen@igalia.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/4] Add support for atomic async page-flips
Message-ID: <20220824164215.44deiekxo73jilip@mail.igalia.com>
References: <20220824150834.427572-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h74x4uhnziywd7t4"
Content-Disposition: inline
In-Reply-To: <20220824150834.427572-1-contact@emersion.fr>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--h74x4uhnziywd7t4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/24, Simon Ser wrote:
> This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
> commits, aka. "immediate flip" (which might result in tearing).
> The feature was only available via the legacy uAPI, however for
> gaming use-cases it may be desirable to enable it via the atomic
> uAPI too.

Hi Simon,

I'm cc'ing Andr=E9 as he has been actively working on it lately and must
be quite familiar with the async flip machinery.

>=20
> User-space patch:
> https://github.com/Plagman/gamescope/pull/595
>=20
> IGT patch:
> https://patchwork.freedesktop.org/series/107681/

Also, Andr=E9 recently generalized the kms_async_flip to test drivers
other than i915, so I think he can provide some thoughts about the IGT
test too.

Thanks,

Melissa

>=20
> Tested on an AMD Picasso iGPU.
>=20
> Simon Ser (4):
>   drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
>   drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
>   drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
>   amd/display: indicate support for atomic async page-flips on DCN
>=20
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c       |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c       |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c        |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c        |  1 +
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c            | 28 +++++++++++++++++---
>  drivers/gpu/drm/drm_ioctl.c                  |  5 ++++
>  drivers/gpu/drm/i915/display/intel_display.c |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c    |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c      |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c                |  1 +
>  include/drm/drm_mode_config.h                | 11 ++++++++
>  include/uapi/drm/drm.h                       | 10 ++++++-
>  13 files changed, 59 insertions(+), 4 deletions(-)
>=20
> --=20
> 2.37.2
>=20
>=20

--h74x4uhnziywd7t4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMGVOIACgkQwqF3j0dL
ehx3gw/9HVnOE2quhodEvn5mICfqHorQDgbJM9MM2nW+zgJHm3hGU0hEDxJftMt7
jkACaqYsULI0Lu2uHf3AHkGocYDiiUhxB1dc8oBfQtvfyVC2ugsgFQhswvSRe8l/
WZ2PgHK4gwOAqMOqqqGvounHK1f2Yx184h4jl2OMQnVrcO5k6K8rRAa5gum+saPH
a3ktekKczC5hS1KHUVHz0JCqzIT/jYYNoDlUHoLzokU5hrJPn8VGr1kskKa5soay
ZM7S/ADkSZmGweg8zr6QypKFN/ztLeY+eXuBj5IDxLBOvNHrUUjLsEjbNdjUq0dE
ArvqFFsWeCCQq5L/0+e2tpRVhdA4shXpL2YMTR8/6uXv3RH9vtiJIFwh38LzURGj
kR7W/UgdM3jKSSRSUc+feGTkX8/O98hEP87atn8/RyD1EL2nVlOAC0WFEgs3T0vD
xwBBTBnO+hIXEqPsvUI57XMx3tte0zlZYkzDg3fnJbVxFKPlwH4LXQNsGIeQzhGd
dI0REHd6dGZjrLa1m/xhvymDbyhI/o+SimqctocCjVKAgU5qoC4IV1gjsTWiAp2R
uSlo9lvJnKQ3j+eeYOGZq54nYU7ZSbaCHyHgXBr1UL5HZ1DXXyRitnjWEilzI70s
MtoVD3tpF6asfi8gVqXzTrxjxdPS8QAWUHe6oG8119FYNXmd+gw=
=Msmr
-----END PGP SIGNATURE-----

--h74x4uhnziywd7t4--
