Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB66AEB2C6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308CF10E990;
	Fri, 27 Jun 2025 09:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P1WuRnH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E1010E990
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:24:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE53FA52ADF;
 Fri, 27 Jun 2025 09:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380F9C4CEE3;
 Fri, 27 Jun 2025 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751016277;
 bh=RTKwzPM6lesauXZU7R3+oVNk0/n5J2iK/snjSi0tsQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P1WuRnH+XcNAo7Ngg2G+U/r9+Cr8AWK9aF2jmYf9wV9rhTMmiTTH3ybWnE5j8tVUf
 jcqk1Ikm03ED65y4kgWu3FN4M1KEC9+BiC9J1BYUzFYcnmd0S6TD9dYOMZmxjmZe4o
 MPzqpWjO2K/NQf4s64CtQxrGusKEpTthUwdYtpYEpB3TgBCf/DbgWZfwTuMp/YDMAT
 ZbDWzolNyaNEqa8DGZoBUF8MQ/QcQOx1yxzHef1FcEpiyRitsnAKzqsvdV1NHKbyXB
 IJV4KoobJJB59+fj+4rggyoxJWDdu7RgjxDbYk4UOqLwB2DKtsrkpsrneEh1uycetS
 pjXwDaaM8prvA==
Date: Fri, 27 Jun 2025 11:24:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <20250627-crafty-taupe-hoatzin-ffd456@houat>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <aF0fKHQywtoG63wT@gaggiata.pivistrello.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bf3dbobd655mefge"
Content-Disposition: inline
In-Reply-To: <aF0fKHQywtoG63wT@gaggiata.pivistrello.it>
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


--bf3dbobd655mefge
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
MIME-Version: 1.0

Hi,

On Thu, Jun 26, 2025 at 12:21:28PM +0200, Francesco Dolcini wrote:
> Hello Maxime,
> it works for me, thanks!
>=20
> On Thu, Jun 26, 2025 at 12:04:58PM +0200, Maxime Ripard wrote:
> > Here's a series fixing (hopefully) the panel-simple regression for
> > panels with a panel-dpi compatible.
> >=20
> > It's only build tested, so if you could give that series a try
> > Francesco, I'd really appreciate it.
> >=20
> > Thanks!
> > Maxime=20
> >=20
> > Link: https://lore.kernel.org/dri-devel/20250612081834.GA248237@frances=
co-nb/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> For the whole series,
>=20
> Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com> # Toradex Co=
libri iMX6

Thanks again for testing, and sorry for the regression

Maxime

--bf3dbobd655mefge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaF5jUgAKCRAnX84Zoj2+
dj4cAXkBZ9mAxRPFYp48ud3HArgZVTHAid8L6IlGVu3HKUVTCEh1Sf9luhFwO77g
LEXZZ/sBgLlEmCDyeSROl49mzc+CL1c1KA8sDj5ARnnDWdq2RCiBioTCT8xRDjEN
pTYgmSW9HQ==
=FKFr
-----END PGP SIGNATURE-----

--bf3dbobd655mefge--
