Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D4AFE88D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A3310E7B9;
	Wed,  9 Jul 2025 12:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c3kbgsMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8B10E7B9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:05:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63BD9451CB;
 Wed,  9 Jul 2025 12:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E757FC4CEEF;
 Wed,  9 Jul 2025 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752062754;
 bh=T7qObQuPEJsl5l8Yj/V7hI/MQcgv9lfyzuotfuZmIqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c3kbgsMSSo2DxnNwIF7FseJWV0hgyE5sX6V7e4PcOG+t0Yx/QfczmTKcIlP2RyhF9
 YwUaf+z2P4iJgzrRSNk4l31OY5m9e0B/NLX0kPuEMmDpRO0m2hl8OOLpwnYLijceZR
 GFkUBaC7cmwgbtyAJWWQpk5dntJ1XynZRJ6QxTXqUtjaQuJxHkGF9vvVCVh1Ed6Ruo
 vSzWDj8YLSB0ZF+Lo1Q0pBLSb5wTj4/ggurSN9k2Vw2h3rnyMgyoM7v4si4NUIMgRE
 EjNtgy5LjJhic5ShbqHNAgK4dzWs9dblcPtVO6N9nDKcmYSdKLeUSteSt0/ve/r9w6
 Ghyh4Vm12PLTA==
Date: Wed, 9 Jul 2025 14:05:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm: fix missing conversions of bridge drivers to
 devm_drm_bridge_alloc()
Message-ID: <20250709-rebel-jackdaw-of-promise-8bf5d3@houat>
References: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-0-6285de8c3759@bootlin.com>
 <175205374260.60140.13824257782987722025.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kp4biqemxmreifr2"
Content-Disposition: inline
In-Reply-To: <175205374260.60140.13824257782987722025.b4-ty@bootlin.com>
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


--kp4biqemxmreifr2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] drm: fix missing conversions of bridge drivers to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 11:35:42AM +0200, Luca Ceresoli wrote:
>=20
> On Tue, 08 Jul 2025 17:24:41 +0200, Luca Ceresoli wrote:
> > Most DRM bridge drivers have been converted to devm_drm_bridge_alloc() =
by
> > [0], but a few drivers were missed. One got converted by [1], this seri=
es
> > converts all the (known) remaining ones.
> >=20
> > Thanks Marek for having found and reported them!
> >=20
> > [0] https://lore.kernel.org/all/20250528-drm-bridge-convert-to-alloc-ap=
i-v4-1-f04e698c9a77@bootlin.com/
> > [1] https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@sa=
msung.com/
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/2] drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
>       commit: ac4531424d907f3983e919a7bda2b90ea0cede4f
> [2/2] drm/sti: hda: convert to devm_drm_bridge_alloc() API
>       commit: 602d565d3c10dfb2dfd397f65078cb603a26a513

You sent the patches yesterday, it would have been nice to wait a few
days for the maintainers to answer.

Maxime

--kp4biqemxmreifr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG5bGwAKCRAnX84Zoj2+
dnohAX0YTQyc6crA05DCz21tpQ5/ndHLMsrKUAGyy5Djj6BJTUx/G3fJ2FmK+ujn
Zf08S4sBf13eFT/CFRaPF8quhtUAt7fI/h0Mu5BayMVkR3SDJHUxBZs8G1gxTvPQ
lfoQ+4XkOg==
=vdh/
-----END PGP SIGNATURE-----

--kp4biqemxmreifr2--
