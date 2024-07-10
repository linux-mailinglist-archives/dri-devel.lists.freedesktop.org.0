Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F00A92CB83
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 09:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A4310E077;
	Wed, 10 Jul 2024 07:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UMbZNrIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070E810E077
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 07:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CA7560659;
 Wed, 10 Jul 2024 07:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71010C32781;
 Wed, 10 Jul 2024 07:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720594840;
 bh=x8GBngejj0m77ddusgbzZvxU8YJqB49Y9l+UOIB4xmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UMbZNrInU+R3SFzHh1k6lwaOD7cMdHRtOLtPAfepFHCUCGV3m2QhuaxfZmACJ95Pu
 7EMjTYfHHKPtlm8Rm8+BbFK2VNR6rzK62fBB/qCq0KC2q4ZEgUqYAqnJCcjKgkD6zi
 W3AFN5eqkm+yZVVWcLuYiDTL4k2okPpT0a7dO0D55hfhWJ/9D4YD1LIA/wnHPaS7XM
 Pa/VLN1d37xlf53TITz02NTWdTf3qagr0Ng+6kCaHquQEtkgFQJslS7XJb807IqIMa
 2PTOdrxyjUKvjz5/OdOk3hTWn/p6IZl8BDyDD98WhrcPo4cdf2+aYCorC2TGcoqriV
 y4Bm3wZMTjiEQ==
Date: Wed, 10 Jul 2024 09:00:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
 hjc@rock-chips.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/rockchip: rk3066_hdmi: change to bridge driver mode
Message-ID: <20240710-daft-brave-woodlouse-eb76b7@houat>
References: <08fc2878-722e-4884-94f3-19ec4717cccd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="55im7zqn4h44tcza"
Content-Disposition: inline
In-Reply-To: <08fc2878-722e-4884-94f3-19ec4717cccd@gmail.com>
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


--55im7zqn4h44tcza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 09, 2024 at 08:01:26PM GMT, Johan Jonker wrote:
> Change rk3066_hdmi.c to bridge driver mode.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Generally speaking, I think you should use the new HDMI bridge
infrastructure that recently landed in drm-misc-next.

Maxime

--55im7zqn4h44tcza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZo4xkAAKCRAnX84Zoj2+
dryRAX9YiJOsTbpyWzR2aqSOG506OuP0LZ1kg1b+brmWtuQR3QWgW3B3LGcd5c0Q
IzhZ+zEBfjJE9PFtVPe+zJqbdBk4Td9pLMrSbYo1e0i+pLwapXFH+E4Mo3k5i9M8
ZiupE7/QtA==
=elhX
-----END PGP SIGNATURE-----

--55im7zqn4h44tcza--
