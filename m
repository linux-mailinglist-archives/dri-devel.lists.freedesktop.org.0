Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCDCA3D470
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409BE10E068;
	Thu, 20 Feb 2025 09:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sRxrbO/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 447 seconds by postgrey-1.36 at gabe;
 Thu, 20 Feb 2025 09:19:32 UTC
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D0910E068
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:19:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D12D661314;
 Thu, 20 Feb 2025 09:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCCFC4CED1;
 Thu, 20 Feb 2025 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740042724;
 bh=A3SDf2fynHoAQU2pLneF7+2O7A42EN25IHRWN76gv3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRxrbO/yU1blb438TmWhKaRp1IYoyRPQ2ufyeK3PbmBEZG9o7j8NeNuYubhuBQHVR
 Gkd99dwVbV0Hh46/9zLBDfCJN12UJ2wiP9boodXNWAsflQpDrZJQhTDTYE7vBp81Zo
 Unm8ywXVULgp83Re1xSiFPV6qOX16vUSwlsRX8+BVOuO6XXz1JyQ+3P0Cn/0uLTvyo
 Rtfgont79qG74IqhnWzolZ81+za3Bt6mB8gcoRBzyayZz9VcUcKKqt6FPX3x/AHpAK
 BeKIQCwYrD/khMKSkB2Q114/slCPt2Q62+AQS6XXJZwmW8KXzaJP+PANHfoU+noN2/
 xCmX7+nnPdQQw==
Date: Thu, 20 Feb 2025 10:12:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: oushixiong1025@163.com
Cc: Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/arm/komeda: Add a condition check before removing
 sysfs attribute
Message-ID: <20250220-tiny-pragmatic-pug-5addfc@houat>
References: <20250220085358.232883-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nea7bbphka3uzfl4"
Content-Disposition: inline
In-Reply-To: <20250220085358.232883-1-oushixiong1025@163.com>
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


--nea7bbphka3uzfl4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/arm/komeda: Add a condition check before removing
 sysfs attribute
MIME-Version: 1.0

On Thu, Feb 20, 2025 at 04:53:58PM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> [WHY] If the call to sysfs_create_group() fails, there is
>       no need to call function sysfs_remove_group().
>=20
> [HOW] Add a condition check before removing sysfs attribute.
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

What are you trying to fix exactly? AFAIK, there's no code path that
calls komeda_dev_destroy() after komeda_dev_create() has failed.

Maxime

--nea7bbphka3uzfl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7bx3AAKCRAnX84Zoj2+
dpsVAX4n5ug+XXtkZ7/jJB6mvF79+3TNFV6iuKF8Q5Lwgo/medK445plllzmD/yx
zYttIVQBf3AtOn1ulefI/KDN0pfKXstNdRGFhg282mmQd24ZOcB9CetWOy1HO4RI
7ta9fQR11w==
=tf2W
-----END PGP SIGNATURE-----

--nea7bbphka3uzfl4--
