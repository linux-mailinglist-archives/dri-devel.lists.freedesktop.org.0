Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B827A9287CE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF610EAF6;
	Fri,  5 Jul 2024 11:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ecVUe7Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E64D10EAF0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:22:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3DAC62BCD;
 Fri,  5 Jul 2024 11:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E889C116B1;
 Fri,  5 Jul 2024 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720178572;
 bh=siK+WsCjThxX6kLGlGGiBzMWmzhtoeOhi7+J8wO+rGs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ecVUe7Yp7UtIWz9GdybcEDTuWIsa4Bw+a7zTS8hbXtc9l2dMNp9R6ESAd2wpEjPwH
 MwsJbzR/poncv+Rr3YR2xwfGelntFRn8ElxQvERL9EUZYtbmdlrtg276Edc5P0L2h2
 w0KEKdBkMu0V4uXqF21CCvOFou+YHXFYXkN0+rDlj5sVrfZhtgN/1NCYweIvqW8jUX
 ecIJsDdSl4aa6o1XujTyCR7xI/0y3aPlqcD0bm2cvupGXys9fu46JbS07XKcgfgyOq
 /1QOweWTo2tW8S8ztMiGiYM5u9yrndMNMGfpqVN32tkiRCXGMhRId9TASaSHeJZwR6
 w+8q3P+BK6VVw==
Date: Fri, 5 Jul 2024 13:22:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: drm/sti: mark it as Odd Fixes
Message-ID: <20240705-hysterical-beluga-of-courtesy-38b2e2@houat>
References: <20240705100356.16760-1-krzysztof.kozlowski@linaro.org>
 <ZofW1v4uEFo9GscF@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k64hyfzn7hehngnk"
Content-Disposition: inline
In-Reply-To: <ZofW1v4uEFo9GscF@phenom.ffwll.local>
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


--k64hyfzn7hehngnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 01:19:50PM GMT, Daniel Vetter wrote:
> On Fri, Jul 05, 2024 at 12:03:56PM +0200, Krzysztof Kozlowski wrote:
> > Patches to STI DRM are not being picked up, so even though there is
> > maintainer activity, it seems that these drivers are not being actively
> > looked at.  Reflect this in maintainer status.
>=20
> Note that since the driver is in drm-misc, other committers can also pick
> up patches and push them. Both Neil and Dimtry have commit rights and
> should be able to pick up your patches for you, if they get stuck.

I've applied the patches.

I don't think we should merge this one though, a one-off mishap can happen.

Maxime

--k64hyfzn7hehngnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZofXiQAKCRDj7w1vZxhR
xQLuAP9k3VJ0gKKhQnYshAlYjTRPapTxwDF9YfxKdGayE/K/lAEAi3f7LPtKIV2c
rLdP+w56xj5Bet58rY0MQVcl1rO9/Ao=
=3+4M
-----END PGP SIGNATURE-----

--k64hyfzn7hehngnk--
