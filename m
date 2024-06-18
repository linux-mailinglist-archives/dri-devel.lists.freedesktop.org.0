Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8960890D563
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFFF10E6B7;
	Tue, 18 Jun 2024 14:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NfnNCPUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFF810E6B7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:36:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2991FCE1A44;
 Tue, 18 Jun 2024 14:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3C4C3277B;
 Tue, 18 Jun 2024 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718721402;
 bh=TemdYJYTYnKGcbzKQlINdrNuRC9BBhSSn/lMK6ZyzEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NfnNCPUO/eeZdPUIalzDchxV8DRA6ydEqKO074R+lnNCPeJIhpHIwcA797TXYZ4ZC
 B6c+XIK3iIUZ4p3kOOQxzLuScni0Tl1zBBazbZKH4vOueuBq8QFJGmjvPToNz2BoUH
 l5JJrllzudxTU94YDop8oBLiRAaYeofPJ46k9yzNNrcyveCnLp9DRTFCE3l3JUFw0e
 t8vSFHmxAW+BD8ZfhOG/7XOXMZ/602l+FJzdzQw6BrwDqm+gkQMZcCqKdMx2fGCDYT
 8H1XIed7OAKJVVn0lppr/uiAAQ571PTQcbxS5OnZ4SON3omrbIdIw6G98XbKcgx++k
 9ABkE4KrBW7OA==
Date: Tue, 18 Jun 2024 16:36:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/4] Basic support for TI TDP158
Message-ID: <20240618-impetuous-passionate-jaguarundi-d7bcc1@houat>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <fac01fa5-f257-488a-854e-716bd2634d85@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="auo766chcwhbxk2f"
Content-Disposition: inline
In-Reply-To: <fac01fa5-f257-488a-854e-716bd2634d85@freebox.fr>
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


--auo766chcwhbxk2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 03:07:16PM GMT, Marc Gonzalez wrote:
> On 17/06/2024 18:02, Marc Gonzalez wrote:
>=20
> > Marc Gonzalez (4):
> >       dt-bindings: display: simple-bridge: add ti,tdp158
> >       drm: bridge: simple-bridge: use dev pointer in probe
> >       drm: bridge: simple-bridge: use only devm* in probe
> >       drm: bridge: simple-bridge: add tdp158 support
> >=20
> >  .../bindings/display/bridge/simple-bridge.yaml     |  4 +
> >  drivers/gpu/drm/bridge/simple-bridge.c             | 85 ++++++++++++++=
+++-----
> >  2 files changed, 71 insertions(+), 18 deletions(-)
>=20
> Series has been NACKed.

That's a gross misrepresentation. It wasn't NAK'd, changes were requested.

Maxime

--auo766chcwhbxk2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnGbdgAKCRDj7w1vZxhR
xW3tAQC0G2P2v2IA4YXDoDQcvzowCTVlw9WiKP8yb/JmhiiSFwEAnwSATQToNNCP
OXgrBEFxwljYuZjXStcJ7XjZDG4OqwI=
=evAI
-----END PGP SIGNATURE-----

--auo766chcwhbxk2f--
