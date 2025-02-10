Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D5A2E5BA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 08:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA93010E083;
	Mon, 10 Feb 2025 07:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RAVlLcbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7343410E083
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:49:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C27005C102E;
 Mon, 10 Feb 2025 07:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DDCC4CED1;
 Mon, 10 Feb 2025 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739173765;
 bh=+fRHPCxgbJXmWUssWl8H9YJ0kdw7ulD5xrBLtSVf9TM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RAVlLcbQNo5gzmy7hN5TnzqDVazLCUOqHQd4xEsEKLflaHdn2jiiP2BDLltgl0/gm
 jaFjcIy2lxgmLNxl3s9tIAySTM+3rxmLtW8Deu0FQoP+K0NXgU9ccQbt401uP5zH68
 qYTCV9Q6vBq6ry4VRV7DyGKaB3ma+w3Eqt589Ogrfwayb4RhAw+0xEGeU84NDEFxZf
 chHjW8r2y7x9Y9/NZIry3e0WqKgi+eL3WN3qRrEk+TnRC037qQVYl/XUJ/ZKADCFv/
 658nWDlBhpVC6DfyuQe2mNtWF0bzr61fCL156xaLZ6Ea/Ad7fdf8zVK2DyEyc1wlvZ
 YMDDyViGVSRrA==
Date: Mon, 10 Feb 2025 08:49:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm: writeback: Fix kernel doc name
Message-ID: <20250210-spicy-unique-dormouse-db0f7d@houat>
References: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="al75hx43utgj2eed"
Content-Disposition: inline
In-Reply-To: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
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


--al75hx43utgj2eed
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: writeback: Fix kernel doc name
MIME-Version: 1.0

On Fri, Feb 07, 2025 at 06:35:22PM +0100, Louis Chauvet wrote:
> During the creation of drmm_ variants for writeback connector, one
> function was renamed, but not the kernel doc.
>=20
> To remove the warning, use the proper name in kernel doc.
>=20
> Fixes: 135d8fc7af44 ("drm: writeback: Create an helper for drm_writeback_=
connector initialization")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250207142201.550ce870@canb.auug.org=
=2Eau/
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Hi,
>=20
> I don't know the process to merge fixes for commits in linux-next. If I
> should apply this patch, where should I it be? drm-misc-next-fixes and
> drm-fixes does not contains the problematic patch.

You need to apply it to drm-misc-next. The branch linux-next uses is a
merge of drm-misc-fixes, drm-misc-next, and drm-misc-next-fixes based on
when we are in the release cycle

Maxime

--al75hx43utgj2eed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6mvggAKCRAnX84Zoj2+
dpoBAYCxtcoWBNhz2j5b+yJgX5/eegRusYBZl1Iy6zCqUnodIoYMJqTNFEzwNGEb
mStTaE0Bfiu8JA8pGDprnIbn+6RmIsUdFINrjKfprMTknK5QfiKlrA+5zISH/bst
ZKh6yXEbPg==
=9O57
-----END PGP SIGNATURE-----

--al75hx43utgj2eed--
