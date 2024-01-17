Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF4830750
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 14:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2577F10E67A;
	Wed, 17 Jan 2024 13:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378A410E67A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 13:48:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 674DBCE1C22;
 Wed, 17 Jan 2024 13:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BCEC433F1;
 Wed, 17 Jan 2024 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705499270;
 bh=I7vQBID3G5sv3NpLhtsULacwm+dYjsLRrcvjaJpRfbA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dkrqV21JZeN9qgXIJR2G+aY6Y+oJbhnCx6Nvx0jJ5s2JjH/twuRJEtgzJ/9E6g6L8
 1EGg4xYEjyzgsew4qYqCC0y4R6EKZxVl5qTrS6SotGPC/BkItJIq9ZivWUnKZBA0He
 M46edCDaA6pRAy6nslj8LI5aQnKb8iKnQiof6ofRPxgbn4MWPySB6LKAyX3AhzSI0g
 ZHuc2SLLXObnB9IwL1AulZj1RL74JxsiNqUscCNbW7D1zXnHXb54kcx0eyVrLdPU/Q
 cPyPSj1TSSAEllG2btUS9gR96knU92X1ZcDnUeynm+0cS4ACIyIgQKZanR0PkUUyLH
 UyK6cmnA/Hnfg==
Date: Wed, 17 Jan 2024 14:47:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: Re: (subset) [PATCH] drm/rockchip: inno_hdmi: Explicitly include
 drm_atomic.h
Message-ID: <iuorynvlxp6m6u5hz3yi5d2ibfd3w6pdsm5ajlztjcsjuaczzl@f7jl7vyux2cl>
References: <20240115092434.41695-2-knaerzche@gmail.com>
 <170548481754.96553.11502916321137598260.b4-ty@kernel.org>
 <3186012.MsWZr2WtbB@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u5lstoeossw6qgsw"
Content-Disposition: inline
In-Reply-To: <3186012.MsWZr2WtbB@diego>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Alex Bee <knaerzche@gmail.com>, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u5lstoeossw6qgsw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 10:52:04AM +0100, Heiko St=FCbner wrote:
> Hi Maxime,
>=20
> Am Mittwoch, 17. Januar 2024, 10:46:57 CET schrieb Maxime Ripard:
> > On Mon, 15 Jan 2024 10:24:35 +0100, Alex Bee wrote:
> > > Commit d3e040f450ec ("drm/rockchip: inno_hdmi: Get rid of mode_set")
> > > started using drm_atomic_get_new_connector_state and
> > > drm_atomic_get_new_crtc_state which are defined in drm_atomic.h
> > > Building does currently only work if CONFIG_OF and CONFIG_DRM_PANEL_B=
RIDGE
> > > are enabled since this will include drm_atomic.h via drm_bridge.h (see
> > > drm_of.h).
> > >=20
> > > [...]
> >=20
> > Applied to drm/drm-misc (drm-misc-next).
>=20
> wouldn't have drm-misc-next-fixes been more appropriate?
> Because I _think_ the change causing the issue made it in during the
> current merge-window?

AFAIK, the offending commit is in drm-misc-next only

Maxime

--u5lstoeossw6qgsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZafagwAKCRDj7w1vZxhR
xXhkAP9qKbp1PhY5sD3ZM1K8WsnxJlJs426f+1UdakIgqEihoQEAj9KiTUxV80b6
7rivJZ/b4AaKhqJN40Qlbi3MigyBHAg=
=6ZF3
-----END PGP SIGNATURE-----

--u5lstoeossw6qgsw--
