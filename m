Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EC977019
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 20:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B6E10EC04;
	Thu, 12 Sep 2024 18:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cl+JHoUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0089A10EC04
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 18:08:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8152C5C5B78;
 Thu, 12 Sep 2024 18:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F99C4CEC3;
 Thu, 12 Sep 2024 18:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726164492;
 bh=pHVKUgc037QIkkMyjr0klM/vGrCs08KRmgG5kkq2IOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cl+JHoUwBpwclc34hmilJ/q47jZx/83/7BecIXcqQ3i15eaMvyUyvDkyVtBH+ljVU
 Y/LW00U/BVdjCbRovmFC8jfzPl4q9HAY810zAT6QHoSIAoyvTk4pFWpmh0z/UgG1JK
 ao3oKXxWsX09TLncKVI9LNfi5i8zS9c/cEWMwt+wNEd3RRggwgSwrJUTGu5Z/dBj+9
 OSMz4SXe7Tr23uIjUpzTMaDFzTlXwUTAsUshPNVLrLQTmNdxf5gol1iBLPhlAcCVSP
 R17Rnhgn/dqXTW4AM99THV2x7s7ASK5nTwX31PfGQNAY2iztkH1k+DySqKQcXYPaAX
 w2+/LLy82OclQ==
Date: Thu, 12 Sep 2024 20:08:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: ahalaney@redhat.com, airlied@gmail.com, cai.huoqing@linux.dev, 
 caihuoqing@baidu.com, colin.i.king@gmail.com, dakr@redhat.com, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 geert+renesas@glider.be, 
 grandmaster@al2klimov.de, j-choudhary@ti.com, javierm@redhat.com,
 jyri.sarha@iki.fi, 
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, 
 nm@ti.com, praneeth@ti.com, r-ravikumar@ti.com, robh@kernel.org, 
 sam@ravnborg.org, simona.vetter@ffwll.ch, tomi.valkeinen@ideasonboard.com, 
 tzimmermann@suse.de, u.kleine-koenig@pengutronix.de, vigneshr@ti.com, 
 ville.syrjala@linux.intel.com, wangxiaojun11@huawei.com, yuanjilin@cdjrlc.com, 
 yuehaibing@huawei.com
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
Message-ID: <20240912-unyielding-mottled-bumblebee-6bb69f@houat>
References: <20240912171142.3241719-1-devarsht@ti.com>
 <993bbe0a1b503505dd2e9b33b94e2b83@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7xixjsp4uufbegwa"
Content-Disposition: inline
In-Reply-To: <993bbe0a1b503505dd2e9b33b94e2b83@kernel.org>
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


--7xixjsp4uufbegwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 06:04:11PM GMT, Maxime Ripard wrote:
> On Thu, 12 Sep 2024 22:41:42 +0530, Devarsh Thakkar wrote:
> > Modify license to include dual licensing as GPL-2.0-only OR MIT license=
 for
> > tidss display driver. This allows other operating system ecosystems suc=
h as
> > Zephyr and also the commercial firmwares to refer and derive code from =
this
> > display driver in a more permissive manner.
> >=20
> >=20
> > [ ... ]
>=20
> Acked-by: Maxime Ripard <mripard@kernel.org>

Also, we need the ack of all contributors to that driver, so my ack
isn't enough to merge that patch.

Maxime

--7xixjsp4uufbegwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuMuAgAKCRAnX84Zoj2+
dv6eAYCi4jOdtVoIy60SAAMJCLFrI4wf7YQQruU/aVFo0Pb9/tge5AFz3X5pYtjc
Rf7vB2YBgOnnpVUNtwn8u0Jvfq0gpOx4oc+XmD1jRbINJ2ZTY7fRtiv0TLKB1DBI
IzF2KlDEWA==
=8muI
-----END PGP SIGNATURE-----

--7xixjsp4uufbegwa--
