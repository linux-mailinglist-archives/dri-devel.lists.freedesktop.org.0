Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28972B171FF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730C210E478;
	Thu, 31 Jul 2025 13:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p5NuxDTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE2110E478
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:26:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F3FB45C8D;
 Thu, 31 Jul 2025 13:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B9DC4CEEF;
 Thu, 31 Jul 2025 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753968405;
 bh=lCLyuq53vp4e9L0JS6snSzvaxB/qbfCtw9F8FZNhjCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5NuxDTcXtwhVbrPCDjI9v84xzkZE1D4MgiqhNUUPu/gRixKgIWZ8nST23lDwSq8o
 NJfzQkkpEdU3WbxcjV8YHQhWXMM9deH23bMcomOQ2H1/DmZBurj+h1cU6NHA4WOPNp
 hJObCrnm3foM2HWZTF6WRJAdowTq2g4N+R8d6fVcpDjbdB5CL4a3d53MfQJDVrgOTt
 6pHWiOkUyuKbd/MgNwm86u2zNUwKrnXpulzKa4grmf3LPESruiJ0s99GOkKBhOp5no
 +4xkPmIPkkkOqjsg8ujFPrteCybIDGn4c3WB+3cKfpFYeqhDkxjGcWrITdG6RZnbPm
 /UrMSq8zPJr2Q==
Date: Thu, 31 Jul 2025 15:26:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] drm/tidss: dispc: Convert to FIELD_* API
Message-ID: <20250731-powerful-termite-of-inspiration-13f36d@houat>
References: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
 <15f0b568-3d59-4f0c-b390-4e3d3623136a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="livjto5renz64lpa"
Content-Disposition: inline
In-Reply-To: <15f0b568-3d59-4f0c-b390-4e3d3623136a@bootlin.com>
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


--livjto5renz64lpa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/14] drm/tidss: dispc: Convert to FIELD_* API
MIME-Version: 1.0

Hi Louis,

On Thu, Jul 31, 2025 at 03:04:49PM +0200, Louis Chauvet wrote:
> Le 30/07/2025 =E0 10:57, Maxime Ripard a =E9crit=A0:
> > Hi,
> >=20
> > The tidss driver rolls its own API equivalent to the FIELD_* API already
> > provided the kernel.
> >=20
> > Since it's an ad-hoc implementation, it also is less convenient and
> > doesn't provide some useful features like being able to share the field
> > definitions that will come handy in the future.
> >=20
> > Thus, this series converts the driver to that API and drops its own
> > version.
>
> I just saw your series after sending mine [2]. I checked, there is only o=
ne
> minor conflict that can be easly fixed.
>=20
> But when applied on drm-misc/drm-misc-next, your series raises:
>=20
> In file included from <command-line>:
> drivers/gpu/drm/tidss/tidss_dispc.c: In function 'FLD_MOD':
> ././include/linux/compiler_types.h:568:45: error: call to
> '__compiletime_assert_589' declared with attribute error: FIELD_PREP: mask
> is not constant
>   568 |         _compiletime_assert(condition, msg, __compiletime_assert_,
> __COUNTER__)
>       |                                             ^
> ././include/linux/compiler_types.h:549:25: note: in definition of macro
> '__compiletime_assert'
>   549 |                         prefix ## suffix();         \
>       |                         ^~~~~~
> ././include/linux/compiler_types.h:568:9: note: in expansion of macro
> '_compiletime_assert'
>   568 |         _compiletime_assert(condition, msg, __compiletime_assert_,
> __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro
> 'compiletime_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), m=
sg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/bitfield.h:65:17: note: in expansion of macro
> 'BUILD_BUG_ON_MSG'
>    65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),
> \
>       |                 ^~~~~~~~~~~~~~~~
> ./include/linux/bitfield.h:115:17: note: in expansion of macro
> '__BF_FIELD_CHECK'
>   115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: =
");
> \
>       |                 ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/tidss/tidss_dispc.c:599:33: note: in expansion of macro
> 'FIELD_PREP'
>   599 |         return (orig & ~mask) | FIELD_PREP(mask, val);
>       |                                 ^~~~~~~~~~
>=20
>=20
> This seems to be a limitation of FIELD_PREP [1].
> I think the only way to avoid this issue is to use macros and not functio=
ns.
>=20
> [1]:https://elixir.bootlin.com/linux/v6.16/source/include/linux/bitfield.=
h#L65-L66
> [2]:https://lore.kernel.org/all/20250730-fix-edge-handling-v1-0-1bdfb3fe7=
922@bootlin.com/

Weird, it compiles without warning for me here. Which compiler do you use?

Thanks!
Maxime

--livjto5renz64lpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaItvEgAKCRAnX84Zoj2+
doX8AYCMBVPvxu8o9TOyCn7lBbNCgS3knFU+dNmItt8BbDwrf771Slu0wBc/AS26
rS5kbMgBgLJs0oaq3MszcBvisk3p+uCLxfQLOTUpTXrXdigK3eR7LEZz6ewrk7Gn
ZafbXk/c4g==
=Oj/Q
-----END PGP SIGNATURE-----

--livjto5renz64lpa--
