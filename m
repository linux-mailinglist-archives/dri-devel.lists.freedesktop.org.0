Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF81902041
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDC010E207;
	Mon, 10 Jun 2024 11:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OvzWOaXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227C310E207
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:22:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77F52608C3;
 Mon, 10 Jun 2024 11:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD434C4AF1D;
 Mon, 10 Jun 2024 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718018561;
 bh=EkV8eFeIlMbRYuFLi5bacADDZkcGFLP/Ep/Wj8zW2yA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OvzWOaXuhoEJJ3cuyXabQhTXJTGE73mdTgRnf6/ya0baKS8JHV9er7EVFjZhs9BBA
 0zOkWdVNlStK2qmSVnHwP4oJcARw+KlYjGgE+Yv/uVRbQJ/EoZNzIJtI9qgoCTBX8o
 cyO0kiw6uQJG0mKKPNbEcuv+Z7PyGHdrnVDI3Qk6xrNsRjJ8U56SnCMzAxrFDobO32
 5bwlnHM0qZWRm28kseB6Nw3x91246R+KwGOMYujqPUdhk1fsqeBjDHC8Vh7iShgXFE
 uI+AdXZ7G//AXJYvs5aiDNCFkKwzUch7oj9IG3JQ9buAjKvDGo1lFBgkvOR3arNllm
 xc0DZ3L+IcyBw==
Date: Mon, 10 Jun 2024 13:22:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Smitha T Murthy <smitha.tmurthy@arm.com>, 
 Deepak Pandey <deepak.pandey@arm.com>
Subject: Re: [PATCH] drm/komeda: check for error-valued pointer
Message-ID: <20240610-classy-walrus-of-abundance-e8acff@houat>
References: <20240610102056.40406-1-amjad.ouled-ameur@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v2hia7wsvzddoorn"
Content-Disposition: inline
In-Reply-To: <20240610102056.40406-1-amjad.ouled-ameur@arm.com>
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


--v2hia7wsvzddoorn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 11:20:56AM GMT, Amjad Ouled-Ameur wrote:
> komeda_pipeline_get_state() may return an error-valued pointer, thus
> check the pointer for negative or null value before dereferencing.
>=20
> Signed-off-by: Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>

I've added a Fixes tag and applied to drm-misc-fixes, thanks!
Maxime

--v2hia7wsvzddoorn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmbh/AAKCRDj7w1vZxhR
xahgAQD23Qma6aL0sKtPduWTr7Di9Ar8cyqpLFFSYhO3huhalQEAuesXQa/px8G7
8pThjlEwd6jsLC0kUTk2AnhtJPcQiws=
=c3Zi
-----END PGP SIGNATURE-----

--v2hia7wsvzddoorn--
