Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81046A829AD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D727110E934;
	Wed,  9 Apr 2025 15:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I0ZN+CqM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4791A10E919
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:13:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5C6D5C479A;
 Wed,  9 Apr 2025 15:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22393C4CEE2;
 Wed,  9 Apr 2025 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744211592;
 bh=vURl54tmhm1LG/cXuku2TmO+h+L71jiI2WiTrWJLNME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I0ZN+CqM9B0h0OpCqxBqsm9N7+WFKofnQkX4osxckUY4HC0+I/tWCEAkm/tQZ+QB/
 9nqAqKdkHrWfK24Pv2K824GnQ3fLJcWRZx6CiGDF15AvW+pTyHIyeZI4seT8NKPaNF
 uQ8LwBrOdMHP7xpnirteWzxlxGIZbT55qcklckBy9gXmW1uaVM9VgdguHjXXEjzQkX
 eJjbTGI65xBV0neq4PFLLfgCvBU4OCJJRQHbogiitIVtrFxlARvidS6PWKWH7O9IqQ
 Ph2eTfXgITlFUjFHXxef1dWW4pGN4OAuoih5dbSCfyd4MfIXymQLIxt14REe97p18w
 XPTmq8CDx4A/Q==
Date: Wed, 9 Apr 2025 17:13:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/15] drm/tests: hdmi: Fixup CamelCase warning
Message-ID: <20250409-accomplished-vivacious-ant-3c03c3@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-9-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wk32e2w6gih3rjbo"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-9-294d3ebbb4b2@collabora.com>
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


--wk32e2w6gih3rjbo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/15] drm/tests: hdmi: Fixup CamelCase warning
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:19:58PM +0200, Cristian Ciocaltea wrote:
> Rename the reject_100_MHz_connector_hdmi_funcs variable to make
> checkpatch.pl happy:
>=20
>   CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>
>=20
> While at it, also rename reject_100MHz_connector_tmds_char_rate_valid()
> for consistency.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

In this case, checkpatch is wrong. mhz !=3D MHz.

And since it's not a warning, I'd just ignore it.

Maxime

--wk32e2w6gih3rjbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aOhQAKCRDj7w1vZxhR
xS/oAQDNvPAAWV3pPWhcc0JHu56bTPRmm75apuUGPAuTQd5a9QD/f0WGPgtwqns6
cIibIcrn2Dun+RWTJLUqu2Na0Mjj0Ag=
=6qT/
-----END PGP SIGNATURE-----

--wk32e2w6gih3rjbo--
