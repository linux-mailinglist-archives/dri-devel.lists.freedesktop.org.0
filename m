Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A28B13614
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 10:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F195410E496;
	Mon, 28 Jul 2025 08:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E9QZpS4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97EB10E496
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:10:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 76BFDA54A08;
 Mon, 28 Jul 2025 08:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B7FC4CEE7;
 Mon, 28 Jul 2025 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753690241;
 bh=J2e+GLmMnOhCVKeoQ/p5+Rn7SWm0zUljYsTljYx8HDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E9QZpS4iCDTg0P+RhQHM0ShEggR/T915d8YaAoGajPdrg5aHnm8DLFeDnYuFITZGH
 i2IWyH+NIGviDfj175OAg+v6RSuAo9wEmvFxuOhcSb1gqUFg2C1gFvlgjfzYADeSdg
 Oqhcn4tpNZeHphi5FDApufj2WEXcekUkVGktfuk7XDXFI3CbB/0gZ7UZ3sWzZTN5vK
 qoLEZhKwieNicqBVeY/HGwVc33ITwYNIxBbmPKkJdZibDvnazytVMNWkQeT4J/w3BS
 WMz0WO9vQpvHHe/BhXV1I6xu4P5+mAdxoW1cP+hcfhagZXgmdydy0uiLtfMcg9LE/Y
 Q0o+3/wU+IvYw==
Date: Mon, 28 Jul 2025 10:10:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samsung-dsim: move drm_bridge_add() call to probe
Message-ID: <20250728-diligent-brainy-hyena-109dde@houat>
References: <20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hhxl6bbucpmtrmqw"
Content-Disposition: inline
In-Reply-To: <20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com>
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


--hhxl6bbucpmtrmqw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] samsung-dsim: move drm_bridge_add() call to probe
MIME-Version: 1.0

Hi,

On Fri, Jul 25, 2025 at 05:28:03PM +0200, Luca Ceresoli wrote:
> This bridge driver calls drm_bridge_add() in the DSI host .attach callback
> instead of in the probe function. This looks strange, even though
> apparently not a problem for currently supported use cases.
>=20
> However it is a problem for supporting hotplug of DRM bridges, which is in
> the works [0][1][2]. The problematic case is when this DSI host is always
> present while its DSI device is hot-pluggable. In such case with the
> current code the DRM card will not be populated until after the DSI device
> attaches to the host, and which could happen a very long time after
> booting, or even not happen at all.
>=20
> Supporting hotplug in the latest public draft is based on an ugly
> workaround in the hotplug-bridge driver code. This is visible in the
> hotplug_bridge_dsi_attach implementation and documentation in [3] (but
> keeping in mind that workaround is complicated as it is also circumventing
> another problem: updating the DSI host format when the DSI device gets
> connected).
>=20
> As a preliminary step to supporting hotplug in a proper way, and also make
> this driver cleaner, move drm_bridge_add() at probe time, so that the
> bridge is available during boot.
>=20
> However simply moving drm_bridge_add() prevents populating the whole card
> when the hot-pluggable addon is not present at boot, for another
> reason. The reason is:
>=20
>  * now the encoder driver finds this bridge instead of getting
>    -EPROBE_DEFER as before
>  * but it cannot attach it because the bridge attach function in turn tri=
es
>    to attach to the following bridge, which has not yet been hot-plugged
>=20
> This needs to be fixed in the bridge attach function by simply returning
> -EPROBE_DEFER ifs the following bridge (i.e. the DSI device) is not yet
> present.
>=20
> [0] https://lpc.events/event/18/contributions/1750/
> [1] https://lore.kernel.org/lkml/20240924174254.711c7138@booty/
> [2] https://lore.kernel.org/lkml/20250723-drm-bridge-alloc-getput-for_eac=
h_bridge-v1-0-be8f4ae006e9@bootlin.com/
> [3] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-4-bc4dfee=
61be6@bootlin.com/
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

There's many things lacking from that commit log to evaluate whether
it's a good solution or not:

- What is the typical sequence of probe / attach on your board?

- Why moving the call to drm_bridge_attach helps?

- What is the next bridge in your case? Did you try with a device
  controlled through DCS, or with a bridge connected through I2C/SPI
  that would typically have a lifetime disconnected from the DSI host.

- If you think it's a pattern that is generic enough, we must document
  it. If you don't, we must find something else.

- Why returning EPROBE_DEFER from the attach callback helps? Also, this
  is an undocumented behaviour, so if it does, we must document that
  it's acceptable.

Without that, unfortunately, we can't really review that patch.

Maxime

--hhxl6bbucpmtrmqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIcweQAKCRAnX84Zoj2+
diFrAX0dOWwVJpvrdGrihZ9k9sjqDwnxQlT9ParohkOH/+omSlX7TeDpDUnCGIXJ
98XetfABf1lgG99jkFFG2UoKMqzFM3Any2hggvq6YPevVkdf8kvI/N2GVns0Hs/7
Tj81Ojl/YA==
=gmx9
-----END PGP SIGNATURE-----

--hhxl6bbucpmtrmqw--
