Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A96B07910
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FDE10E74A;
	Wed, 16 Jul 2025 15:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UEEaNQ2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5D410E754
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C899614A8;
 Wed, 16 Jul 2025 15:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EBDC4CEF0;
 Wed, 16 Jul 2025 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752678378;
 bh=WKuwpKVt9zZ8ckB0vN8JO0JzK0NC6moeuIOO+N1EA6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UEEaNQ2Lnv9psWcfzpuCU4ZdFuvDDrKfSznX2c4YLP88gmiefl3G5DvqYG7qoTO/g
 mZS8dcFpeJxjDmeuDQqkksGWYYsYLN567tGiz8D/dGAI2k6+aLu6Y+lkJYe+qaeWsF
 nANZthvWtUtzw0iAdXgu1PXjxxiPiB/NuszRRJG5R15qfYQQ1HEAKiT2r3RpbPO9SC
 CILntfpJ7sk/ALCXo9KFr8GciZczhJcszPtrtXS9gsiuj5QYphvjDSHJoJWB54275d
 226RG26RjP2snleAB/gMqd39MSXeIJ7upvyVVKsdl2blDUa/QDj9q8O9yOto5da0+z
 N4T5nN7ro/fuA==
Date: Wed, 16 Jul 2025 17:06:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/tests: edid: Update CTA-861 HDMI Vendor Specific
 Data Block
Message-ID: <20250716-realistic-cream-ammonite-304cca@houat>
References: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
 <20250625-drm-update-edid-v1-2-2d963743ab9e@kernel.org>
 <046193df-bb11-4d84-98a4-c6d46d359316@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="alj2dibegux2zdfp"
Content-Disposition: inline
In-Reply-To: <046193df-bb11-4d84-98a4-c6d46d359316@suse.de>
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


--alj2dibegux2zdfp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] drm/tests: edid: Update CTA-861 HDMI Vendor Specific
 Data Block
MIME-Version: 1.0

Hi Thomas,

On Mon, Jul 14, 2025 at 01:02:33PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 25.06.25 um 17:14 schrieb Maxime Ripard:
> > For some reason, the HDMI VSDBs in our kunit EDIDs had a length longer
> > than expected.
> >=20
> > While this was harmless, we should get rid of it to make it somewhat
> > predictable.
>=20
> Dump question: should these errors be kept in another test specifically f=
or
> detecting this problem?

I'm not entirely sure what you mean here, sorry. Did you mean that we
should get some tests to prevent that kind of EDIDs from being accepted
by the kernel?

If so, I guess it would mean getting a test suite for the EDID parser
itself, which is definitely something that should happen at some point
but seems a little out of scope to me.

Maxime

--alj2dibegux2zdfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaHe/5gAKCRAnX84Zoj2+
dsewAYD1axpR1DkXlPCwINCEdtcqV1K1gc0Ck3unBBJukPewwJ3aJFdIse3nSCGc
N0S9ApgBgN1b6+5aCRPHfzDWSkeB2bDfR6afkUsugIHUpFNGeh5BKu96GBJ/E+vh
ezDP9N6nig==
=+J+F
-----END PGP SIGNATURE-----

--alj2dibegux2zdfp--
