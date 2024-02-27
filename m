Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A1868A4B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 08:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3843C10E4B8;
	Tue, 27 Feb 2024 07:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PmKDYgjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308C210E881
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:59:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C0F461486;
 Tue, 27 Feb 2024 07:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A20C433F1;
 Tue, 27 Feb 2024 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709020743;
 bh=hxtVu7bh6F8vSWjKNn6IUO2flu5H83X9n4DFxtlUXlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmKDYgjHZiDJa33NGWefMrqtAgjWZn/rX1hYhgh2sYqhYHV731x+r/kfRyV5vwDLv
 ghR8asYokOmIgW0U8gP0x4pAyp9xb/6M3On3gUyIXOCgilcRmnH9k2UTm8Yr7OczlR
 qdmANFNo2XaV9B8BZ/svHhRJLTXKGYsdy8Kj6IN9gTDzqTLMTiQ3fyul2yjBOvR/x2
 u0oi25zGmrfhxvRUd00OtZZUOFoSmba3XO6CQ/M2YCS3ZsAB2YOlTA55dR9CCM8i7L
 z4EnaCqKfDZwpgq1uDsQ565dEWm5MMay6LOydUFxKH9/ITNQV+kxSUbMCXKAN2LCyO
 YSzXdKNdSGBFg==
Date: Tue, 27 Feb 2024 08:59:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Subject: Re: [rerere PATCH] nightly.conf: Switch drm.git to gitlab
Message-ID: <lpcbwyi25mou5wi5asq2n6o6ooug3fdzu7xdmav6cps73umtuk@22cj75rjnlid>
References: <20240226151631.130754-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kn2pinxl4fnsf23b"
Content-Disposition: inline
In-Reply-To: <20240226151631.130754-1-mripard@kernel.org>
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


--kn2pinxl4fnsf23b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:16:31PM +0100, Maxime Ripard wrote:
> Start the big migration with drm.git.
>=20
> Existing remotes need to be adjusted with
>=20
> git remote set-url drm ssh://git@gitlab.freedesktop.org:drm/kernel.git
>=20
> or
>=20
> git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Applied

Maxime

--kn2pinxl4fnsf23b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd2WRAAKCRDj7w1vZxhR
xbsRAQCgs67cslkWEd085wnZsFEMftWbr7gO/Ud91BzxktcB/gD8CazqNkGITZuv
/IYuaVLxbiq1W9bkECDWkSmh03uxqwA=
=KGu0
-----END PGP SIGNATURE-----

--kn2pinxl4fnsf23b--
