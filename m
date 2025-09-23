Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24731B953BB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7542510E5CB;
	Tue, 23 Sep 2025 09:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dxXUer5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0210E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:23:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 303E844284;
 Tue, 23 Sep 2025 09:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CA3C4CEF5;
 Tue, 23 Sep 2025 09:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758619434;
 bh=VJmFWq9phPo+OVJfPMu+zb2qA1SYK8IdgbMyO1gb6b4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxXUer5xnZw8HKJmwrpeDs2Sl2gTiE/JmNHA+w0ihsiGIv5L8mH/Gi+QKmWyNOuHq
 miPL8FfNEbzntfXjgrpJMUSY+SyXbKzL0pivr7FNMKrf9a0AxmVLcFwVjppa6+SpLm
 mbYZrynE3ysh6Vq0kM0D4EPGEbYlnTq4y5USbLbozopBMaS3+TkcdavGU0xs6vNbtp
 I+kTvX0Y94gJKm45RXrfA6sWw/Pjb7BLkBZT73HsyhuIsfzsbtByUS1csubA1gwkz1
 nHs5AsGv0Wd+Zw1LX5a0+IOpdfrb01oRBIoxH6EH7bzO3uzDXq539NQHkaeBWk//Vs
 Y3zlc/uvhH8Tg==
Date: Tue, 23 Sep 2025 11:23:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/29] drm/atomic_helper: Skip over NULL private_obj
 pointers
Message-ID: <20250923-incredible-bouncy-partridge-f4b208@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-4-14ad5315da3f@kernel.org>
 <adba0c39-228b-4311-83d1-09aa71ddb911@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bvuotqy6zbwcwfga"
Content-Disposition: inline
In-Reply-To: <adba0c39-228b-4311-83d1-09aa71ddb911@suse.de>
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


--bvuotqy6zbwcwfga
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/29] drm/atomic_helper: Skip over NULL private_obj
 pointers
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 03:13:30PM +0200, Thomas Zimmermann wrote:
> Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> However, can this happen? Private state objects without state data?

Yeah, sorry, I forgot to add a commit log to that one. I'll add one.

Maxime

--bvuotqy6zbwcwfga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNJnJgAKCRAnX84Zoj2+
dtgAAX48fNhqN35P+Pk+AlwSx/j1bCXSm2lBkpSYbAOjl6vJsFyAk/j40le10cKS
BeBU6wEBgI5sZB9wGXs14MZvMM8RhsWTvOv9cO5ISu8JH57cGQp+kCCiqqy4WxiK
63iSsNszTg==
=mYZ0
-----END PGP SIGNATURE-----

--bvuotqy6zbwcwfga--
