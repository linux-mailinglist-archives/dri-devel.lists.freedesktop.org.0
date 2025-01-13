Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C078A0B202
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1010E5D4;
	Mon, 13 Jan 2025 09:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MhjTL5TE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D098610E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:00:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7DEA2A40C9F;
 Mon, 13 Jan 2025 08:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DF7C4CED6;
 Mon, 13 Jan 2025 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736758847;
 bh=WGND+Kt2iTU8ZkNU/BNRqLkhos9nsQ7ach+fUhEF3VQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MhjTL5TE6MAtZj0jh74GZ1QOXZtFXygDPL/ssmbURTmo+m1YzqGHDZPKp7m//hwj+
 97MeRJZZJ95JFfKIYywD6M2jujsvewtecuk4cJ4k77gYC9LjDof17sEeG+LAvOPuq3
 cMFCFc8/n2tQdHoO05NramcES15opNZijtuujt1RxuPo/UkXmtpK0k+Sq1/0wfnX7H
 rh8mqPZEM6yJCQYk6bgr1vOVNms74rfMm7VxC+/hlNOZoLHhhXwp3xfiSPkMZyJVzN
 IOdLbcEBqWnwZenTxTlLhaMpPt6LSDkGlGnN/rtb37YQp3l0a34rIswumWaLZzB2bJ
 5xa8UB6JoZNCQ==
Date: Mon, 13 Jan 2025 10:00:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/4] Fix ycbcr_420_allowed inconsistency for HDMI
 bridges
Message-ID: <20250113-greedy-sawfly-of-temperance-1a87c7@houat>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
 <f432ddfb896acf0dc91eb0e7f974a97e@kernel.org>
 <fvwc3jpwizqp5b7nzoiik3dlokyhy6zvhjzwnx4dxe4ock5t3o@pcmfq2tzmyek>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bvglb33dj3pfyf24"
Content-Disposition: inline
In-Reply-To: <fvwc3jpwizqp5b7nzoiik3dlokyhy6zvhjzwnx4dxe4ock5t3o@pcmfq2tzmyek>
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


--bvglb33dj3pfyf24
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/4] Fix ycbcr_420_allowed inconsistency for HDMI
 bridges
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 01:36:59PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 06, 2025 at 02:55:52PM +0000, Maxime Ripard wrote:
> > On Tue, 24 Dec 2024 20:22:40 +0200, Cristian Ciocaltea wrote:
> > > Bridges with DRM_BRIDGE_OP_HDMI set in drm_bridge->ops are expected to
> > > rely on drm_bridge->supported_formats to advertise the supported
> > > colorspaces, including HDMI_COLORSPACE_YUV420.
> > >=20
> > > However, when drm_bridge_connector gets initialised, only
> > >=20
> > > [ ... ]
> >=20
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thanks!
>=20
> I thought about picking up those patches, but then I deciced to ask you
> first. I think first two patches should go to drm-next-fixes? Or just
> drm-fixes? While the last two patches look kike a drm-next material.

Everything can go in drm-misc-fixes imo.

Maxime

--bvglb33dj3pfyf24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4TWNgAKCRAnX84Zoj2+
dlLCAYDkUQ0XOXqK3XBHuPnxuLhZHcIGijkMTwLraAMGGIYvwc7lSgbtET1aiU1E
YFECVbIBgLvchNKieF6oq3Gh8AX8rOd9kbCWl/ztVIPCqXyAMwbzgUF/8bEQNBfT
u6MDxNsx2w==
=dxnB
-----END PGP SIGNATURE-----

--bvglb33dj3pfyf24--
