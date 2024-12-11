Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6B69ED319
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 18:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373910EBBC;
	Wed, 11 Dec 2024 17:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="brDbfpvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D898810EBBC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 17:11:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA5C25C66FE;
 Wed, 11 Dec 2024 17:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDC4C4CEDE;
 Wed, 11 Dec 2024 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733937082;
 bh=ZjqLUTJeWOjXACbZOVh3wgYJhq52PKF8DhiW1ihUFXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=brDbfpvFmbj+5WN7Qa8cCcQ+ir/eS47ia+krt4FqmcYcuG9dKADaBEVXickH+Ex8s
 W3+CgGj+CG3jGHqXfUbqCOZfJDeo109qrxjWITz0If3Ibvn7MuXANi8CcDdVWMKJ0G
 m0186biZQ/7rlQSw797yMw9r4ZrxyiSNMYwGVsLmIOE0SxYyVU2tHRk4A/vPISq7O6
 OX39q//AYj1pV+QEFpui4iq5birpGqQZfV0AuGNvPnCFaquSZ5T1y930olz0Fm7FBj
 VL1dxR75xQ0lkTPsO6AWvZHdWawjbpnOOmP/8VDC7dO4DA2Y/rDrsK1MJvi+beNP28
 rGwA7J1CyPHSQ==
Date: Wed, 11 Dec 2024 18:11:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/bridge: move
 drm_atomic_helper_connector_hdmi_check() to drm_bridge_connector
Message-ID: <cizvtql3vgh2eb66cywietr5dntctp6s7tj7krpchaoucergjl@7sx6mebum2ui>
References: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ypf273q5igxgmj35"
Content-Disposition: inline
In-Reply-To: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
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


--ypf273q5igxgmj35
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] drm/bridge: move
 drm_atomic_helper_connector_hdmi_check() to drm_bridge_connector
MIME-Version: 1.0

On Tue, Dec 10, 2024 at 04:16:46PM +0200, Dmitry Baryshkov wrote:
> Reduce boilerplate code and move calls to
> drm_atomic_helper_connector_hdmi_check() to the drm_bridge_connector.
> Initially the drm_bridge_connector didn't use HDMI state helpers
> directly, so each driver had to call that function on its own. Since the
> commit 9a71cf8b6fa4 ("drm/bridge-connector: reset the HDMI connector
> state") it depends on DRM_DISPLAY_HDMI_STATE_HELPER, allowing us to use
> the helper from the generic code too.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ypf273q5igxgmj35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1nHsAAKCRAnX84Zoj2+
dtCSAXwNO/fyrfSInuatzozSoYsfh/3NePNgNcP1I3uvQr8PTMO3RWV4oLXQCpJC
GnjHiu4BgL36QE4VHYKeZPAFfIZwx0XiK8izZVvIUgMazMO0UMcYb6nqcWsC0Guu
bU3bTJgmEw==
=3AHp
-----END PGP SIGNATURE-----

--ypf273q5igxgmj35--
