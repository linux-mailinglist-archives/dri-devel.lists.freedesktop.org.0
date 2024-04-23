Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21538ADDF9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 09:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2010FB0F;
	Tue, 23 Apr 2024 07:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D/a/LvcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4904F10FB0F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 07:05:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 30277611FC;
 Tue, 23 Apr 2024 07:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B371C116B1;
 Tue, 23 Apr 2024 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713855924;
 bh=0TA+6MZDw4Xs3mYPC+G0pMD4+SrPvVd21sQ4QX7LtxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/a/LvcEtyOwJOqzVBEsYWiJfM5LZA+l9u0irdxCMgcyOgo+QOaxv3KkUm9xi6qEK
 SdnLtdvjazpHC/dIh8e7EQ7SGU0Ip07UYpaoE6jLwXe7/8S3Kb9NN2DhsZXVMDTlJd
 D8fHZOk0XqTRk/JmoiQeXzSxeVGQwH1r+BacdXgqVsugj4mu3HHNcnxLc76geQLyVu
 Vdl+dwIS9OtxRwR8RSYt1vhlVy4bFAK2+c5GVxDaGxxFTYaqXmdlkLbZPHEAnFnOxK
 /hyyIU6FN4e0+YWXsrIRgogNQQLjLMTQe0KK0ML9+vTQ/nOjIp2mWDpJcYvt8Pfrxp
 WXrwDaJ3fJzGA==
Date: Tue, 23 Apr 2024 09:05:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v3 0/5] drm/v3d: Fix GPU stats inconsistencies and
 race-condition
Message-ID: <20240423-pearl-myna-of-resistance-2c1542@houat>
References: <20240420213632.339941-2-mcanal@igalia.com>
 <37b63903-3b5c-49e4-9732-116e6653a8cf@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="z2mbhia3nxzco2f5"
Content-Disposition: inline
In-Reply-To: <37b63903-3b5c-49e4-9732-116e6653a8cf@igalia.com>
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


--z2mbhia3nxzco2f5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 22, 2024 at 01:08:44PM -0300, Ma=EDra Canal wrote:
> @drm-misc maintainers, is there any chance you could backport commit
> 35f4f8c9fc97 ("drm/v3d: Don't increment `enabled_ns` twice") [1] to drm-
> misc-next?
>=20
> I would like to apply this series to drm-misc-next because it fixes
> another issue with the GPU stats, but this series depends on commit
> 35f4f8c9fc97, as it has plenty of refactors on the GPU stats code.
>=20
> Although I could theoretically apply this series in drm-misc-fixes, I
> don't believe it would be ideal, as discussed in #dri-devel earlier
> today.
>=20
> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/35f4f8c9fc972=
248055096d63b782060e473311b

I just did the backmerge

Maxime

--z2mbhia3nxzco2f5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiddsQAKCRAnX84Zoj2+
dha9AX9FnpFJoloQq8fQDk6K96EvP0Lm+7lr7fWccLtl83u8Aj/TO1SkbbuBdQyF
/G2duEkBfj1ShLPk1kCmcl0L+Mlr4M9Qf3MU1heSoZNM+ENaF/6lfpj0GYiv2SUf
mp4yKjYoVw==
=TU5r
-----END PGP SIGNATURE-----

--z2mbhia3nxzco2f5--
