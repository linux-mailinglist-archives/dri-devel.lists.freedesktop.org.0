Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8657B34643
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 17:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8B310E4EF;
	Mon, 25 Aug 2025 15:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H1wEHQXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF9810E4EF;
 Mon, 25 Aug 2025 15:49:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC1215C1FDF;
 Mon, 25 Aug 2025 15:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A110C4CEED;
 Mon, 25 Aug 2025 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756136968;
 bh=7ht5/b4xlL+4AU08+TVo8TKbqrbGIsxINkBeZCWLwpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H1wEHQXDJnc6u/gz3Ul66uSIGX17+jSQbG2ir6A4AZKd2qCfrUsG+Ff0GlEK6t10x
 NUEy1f4+IBoONb9yVCTcqGtvcDC7Zwtl74W2U6kJgKFgZzk9Z19s16KqaBhCxMnBv+
 24Ido8eE7k7FcVfs4yxfVRurB4KZAL4MUXzgil31lHR276nhqq2lkX/MDNl4ARx6ib
 A2FoU9nGpEd+oZnmzFQtWLGgsdIDElYDx5PCuBD+HPClPrD2dvNhQUOmGKLPUvkgNn
 SqKujDusxX3l4hv81oHp+8PCv9sjbcdP7Z9k0v6VQFivAoN5+2GvceTYPMrdwIb1bx
 eCtbKAVcqMDEQ==
Date: Mon, 25 Aug 2025 17:49:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, 
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch, 
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v8 02/10] drm: Add a vendor-specific recovery method to
 drm device wedged uevent
Message-ID: <20250825-solid-leech-of-beauty-2fccac@houat>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
 <20250814121448.3380784-3-riana.tauro@intel.com>
 <aKICgFd9IfSRGbYq@intel.com>
 <20ee25be-90cf-4a00-8ffa-0b22c7a1b493@intel.com>
 <aKc4eSmYqhSWgwMI@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qbozinvfxuqrwp5k"
Content-Disposition: inline
In-Reply-To: <aKc4eSmYqhSWgwMI@intel.com>
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


--qbozinvfxuqrwp5k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 02/10] drm: Add a vendor-specific recovery method to
 drm device wedged uevent
MIME-Version: 1.0

On Thu, Aug 21, 2025 at 11:17:13AM -0400, Rodrigo Vivi wrote:
> On Thu, Aug 21, 2025 at 08:01:39PM +0530, Riana Tauro wrote:
> > Hi Maxime
> >=20
> > This patch has the changes suggested wrt to documentation in v7. Have a=
dded
> > whatever Rodrigo suggested in the doc. Please let us know if the change=
s are
> > okay and if the patch can be merged.
>=20
> Maxime already told he is okay with the changes:
> https://lore.kernel.org/dri-devel/5hkngbuzoryldvjrtjwalxhosdhtweeinpjpygu=
zltjmee7mpu@vw44iwczytw5/
>=20
> >=20
> > This needs a drm-misc maintainer ack to go ahead.
>=20
> But we still need some formal ack here to move ahead with this patch inde=
ed.

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--qbozinvfxuqrwp5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKyGAQAKCRAnX84Zoj2+
dtQeAYCn/9B6jL94J5B2QBZee63/hADeFnnh73HR3dBtJJCWOEw7zagmcdNrCkpY
KooiEjcBfil1NnHAnpQ7SD/idMcE1WqIV0Y+ed6+9lbBSkqCf1DtLQm81C1GedN6
znnM2jSDHQ==
=+fkd
-----END PGP SIGNATURE-----

--qbozinvfxuqrwp5k--
