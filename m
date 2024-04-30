Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB88B6E3B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 11:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A6A10E59C;
	Tue, 30 Apr 2024 09:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eeU+hKT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3C810E59C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 09:26:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3071F614B4;
 Tue, 30 Apr 2024 09:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F278C2BBFC;
 Tue, 30 Apr 2024 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714469214;
 bh=osYoF/+QhQnsuHtJ3Q0+vlbJuiLsDYYf88PkHc0kEE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eeU+hKT9wfRkFILUg9Ka2YlnjvNrn33Bx3DOUteKzMgthOmNB+2tQ5TRuskpA83Gd
 j9aM23qQ7PI18H37woi8xiTv5zb+HigYPTD4eV75bUoDG0d5dr4sk35knue850Rr/s
 0iy6ll8EVGYNWfxKko0eNmAyGrnYm8fEK4H086U+RJ+mhL2hOexTKunRcScK3t1x8g
 Gd9lL2oviUkX5bNJ67AYOFNEEDsEXLPBEd1jqdO2qNysMuG6kU+GpXLmQ2MNjPacbc
 ofPFaWVgzQN8T3AfO5CjsJSN5nrTQ57guV98k6zpWEjWZZDoV6mH8LtlNJHQbaY3yj
 cLB0bqEiZjXwA==
Date: Tue, 30 Apr 2024 11:26:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: drm_of.c: Using EXPORT_SYMBOL_GPL instead of
 EXPORT_SYMBOL
Message-ID: <20240430-monumental-amazing-auk-c2c1a5@houat>
References: <20240429173521.709719-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gszoyfbjymvekc4y"
Content-Disposition: inline
In-Reply-To: <20240429173521.709719-1-sui.jingfeng@linux.dev>
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


--gszoyfbjymvekc4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 30, 2024 at 01:35:21AM +0800, Sui Jingfeng wrote:
> Linux kernel puts strict limits on which functions and data structures
> are available to loadable kernel modules; only those that have been
> explicitly exported with EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() are
> accessible. In the case of EXPORT_SYMBOL_GPL(), only modules that declare
> a GPL-compatible license will be able to see the symbol.
>=20
> Since the whole drm_of.c file is declared with GPL-2.0-only license, so
> let us keep functions in that source file consistently.

You're conflating two things: the license of the code itself (GPL2
here), and the license of the users of the symbols exported in that
file (anything).

There's no relationship between the two, and you have to make an
argument for changing the latter other than just because the license is
GPL because, again, those are two different things.

Maxime

--gszoyfbjymvekc4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjC5VwAKCRAnX84Zoj2+
drH4AX0Yc+tNrRH8v7q+wBO04sFF8tuXPLl3OJDc9YVVdQcKopJIVblT5B8B3hFP
ky1qAPABgKRDIFjl26BFax0qC0y7SwngqPB9+6uHiH6rb43lA+uGeU+v7He3mIYq
RtbytXJX+Q==
=Y0D6
-----END PGP SIGNATURE-----

--gszoyfbjymvekc4y--
