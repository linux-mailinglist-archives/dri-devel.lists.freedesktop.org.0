Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58C57FB40D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919810E451;
	Tue, 28 Nov 2023 08:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6759110E451
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:27:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1E2B5CE13DF;
 Tue, 28 Nov 2023 08:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC896C433C7;
 Tue, 28 Nov 2023 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701160049;
 bh=uQ3KGgri/WYWVbrEAQm38hwlCqTDIPMI+X5ac3vAg2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHPeB6WvJk4rFoJtaiXWZy0E1E82fAdYa06PAy+qjPPQdiMJFiyf4q2T92B78LRPy
 2VGkRGMYTd7zyw83bQMiIQZf0oW5YK7jagPVaw3x7X2coCN5camFErCuSTYyvJCrTh
 3NdrxYnk7leN9aurmMrQGwHxK7WwNrvZEEaBNdd9IV/LWspc+4Dsz09ewfGeHaB5yd
 wvKOYHvlRq3QHzoYzuRxBlK2DnW0N9nx6KfRvHjPp/xlSDrKVORALeobCW9WpnH1bP
 cAa1UBe9njdj8MIK62zZeqeAERC8YOX62v2a3inU+mEgewH7Elk6KceQXBzHkOQl/3
 V/caxGuNxKrLg==
Date: Tue, 28 Nov 2023 09:27:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] drm/mxsfb: Switch to drmm_mode_config_init
Message-ID: <viqwqsyiymnlx6rbt6grpzeac5sdac3wn54xt32p42y3vigopw@gte4gbsiwjt6>
References: <20231127212612.77667-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6yacmp5ytjhaxznl"
Content-Disposition: inline
In-Reply-To: <20231127212612.77667-1-marex@denx.de>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6yacmp5ytjhaxznl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 27, 2023 at 10:25:38PM +0100, Marek Vasut wrote:
> Switch from deprecated unmanaged drm_mode_config_init() to
> managed drmm_mode_config_init(). No functional change.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org

This is only somewhat related to that patch, but mksfb_drm_private is
allocated with devm and holds the planes, crtcs and encoders. This is
unsafe, leads to UAF, and should be converted to a drmm allocation too
(in another patch of course)

Maxime

--6yacmp5ytjhaxznl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWWkbgAKCRDj7w1vZxhR
xQMwAP0ZYatfWV61hwLJfJPOFl9BozJ8Zh8OJvQI7/lspF5yzQEAr14Jpmy7fGsZ
GBuEScISSWLQXuw0Q4mNVQ4ZDDbalgI=
=LasW
-----END PGP SIGNATURE-----

--6yacmp5ytjhaxznl--
