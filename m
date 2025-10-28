Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFDFC157CF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7444A10E5EE;
	Tue, 28 Oct 2025 15:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JGxEJAQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D2D10E5EE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:35:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61D3A40669;
 Tue, 28 Oct 2025 15:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF3FC4CEE7;
 Tue, 28 Oct 2025 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761665720;
 bh=idLuRWoO+38vK6VRnFxiDUoDHFUs+D0A09Hb5MHGJrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JGxEJAQMRAoubDH7yBud7nIGS2ACn25Z+fPf0wgYi87/LQq+3Mft4971TG3JdvGJZ
 S02RRI+YPvB0Y978BvnLdGQ/h8yqR6Ss3Qee6PjNLc9vuiKZ5e5vaP34ouiEpIayua
 BZwZ91iaLAZVj1u4xWnKFEFFiKarFCIbdweVC/DQ6AdApS2sg9vsXO+POiPfaCss0g
 GOwKF7vKNKpu6spb36aJ0TJQRDlsAQgelhAEL34MeC0z4bAnV8XdjG2W3qpy33D917
 seipQ2KgA8N1N+XV9/MitQ2UPPsRx/SNhwIdz8aY5in3awlN2+2K225/MT8Gn/8o64
 mryuNFfc5QVQw==
Date: Tue, 28 Oct 2025 15:35:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Message-ID: <21eb9cb1-18b2-4cad-9422-c8e995183d53@sirena.org.uk>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
 <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
 <63003a7e-8d3d-433a-8a44-54fe8740bc3a@collabora.com>
 <5678895e-2647-42db-b3f0-86a21b9bc225@sirena.org.uk>
 <13c3810b-8197-4a42-9089-d20a78b8126f@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Lf6kj6LVwO02h80q"
Content-Disposition: inline
In-Reply-To: <13c3810b-8197-4a42-9089-d20a78b8126f@collabora.com>
X-Cookie: Your canceled check is your receipt.
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


--Lf6kj6LVwO02h80q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 28, 2025 at 05:24:42PM +0200, Cristian Ciocaltea wrote:
> On 10/28/25 5:08 PM, Mark Brown wrote:
> > On Tue, Oct 28, 2025 at 04:57:03PM +0200, Cristian Ciocaltea wrote:

> >> This seems to have been already addressed:

> >> https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/

> > Ah, good.  Hopefully that lands soon, do you have any idea what's
> > holding it up?

> I guess it's just the complexity, since that is part of a larger work concerning DRM bridges:

> https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/

Oh dear, I'll perhaps follow up there - sometimes this breaks boot
entirely depending on which way we hit the issue so at least getting the
revert in would be good.

--Lf6kj6LVwO02h80q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkA4q4ACgkQJNaLcl1U
h9Cw9Qf/biFN62QMrYgXYDbDsegoqDqqsXcMbeehM/Q3ysme4lJKK5trLO/dF7Tx
AQavE6VnzV0RUdLDEI58E+gA4bQGo+Ox5jnuocJ6P9xN9Bkb1lalO2qQ4WFNWAom
Tn7WNQxynhmHv55tadxwM7oz/24FsvaI5u5y9CY4TlI7KSPhlps7npoBBusvGZkW
RHf2O6oHFI9ARVozT57pYoSmiaaa/F7Kf6JBO9okHu6fouEEWBRDnaaXkDt+ooSF
g7/E8yU8MyapkQCuWdOTsV8DXr0qucasdaAfODubHxv3Y9nRjYt0tL0pyvXKUvCc
irvr/g+8r0jxqUIgrCg2LbfnyEWDWg==
=4VOq
-----END PGP SIGNATURE-----

--Lf6kj6LVwO02h80q--
