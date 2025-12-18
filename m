Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1225CCBD72
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 13:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDA410E0C0;
	Thu, 18 Dec 2025 12:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p7EbKW1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B86810E0C0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:50:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 62A2160123;
 Thu, 18 Dec 2025 12:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F473C116B1;
 Thu, 18 Dec 2025 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766062240;
 bh=Zhj03AbbOmOd3fZIlx006hZCyE5QvjNNAfFodJdpKhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7EbKW1dGx7j7mWKhfmU60knOCzLOmUcabi+gxUzgLC+uEdwqWurPXJPZXuCCV0H/
 H1slZ7+kvqFN8U0pnmWGBSaYi+x98e2WXTpJyqtIZuAc0Jq7UuuqPe8ogVNHIw+pr1
 HfBwaGZD7uKTxNZKzXg/WAEN4h7f7okJ04vzQOLkAYaqjYQSOBkXi05ICZxcVd03vC
 1NvhPTx6ft+8u/CYHxULLLWN9rNRm35YX+4KoPQlc3lzh21qEdCACl7S7KMGkA4/pU
 EpEajcg2EuRSI3G2gFgRBhe3V4N0TGTcI8BrOn8DjU/ltSjj6888eDfGrpquQbkopI
 W2k/RZ/dZUn+Q==
Date: Thu, 18 Dec 2025 13:50:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jonathan Corbet <corbet@lwn.net>, 
 Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Phong LE <ple@baylibre.com>,
 Robert Foss <rfoss@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Message-ID: <20251218-shiny-rugged-bug-d1d3e8@houat>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
 <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
 <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vszq3vrbwpm6jkyb"
Content-Disposition: inline
In-Reply-To: <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
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


--vszq3vrbwpm6jkyb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
MIME-Version: 1.0

Hi,

On Wed, Dec 17, 2025 at 03:31:01PM +0100, Luca Ceresoli wrote:
> On Wed Dec 17, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> > On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
> >> of_drm_find_bridge() does not increment the refcount for the returned
> >> bridge, but that is required now. However converting it and all its us=
ers
> >> is not realistically doable at once given the large amount of (direct =
and
> >> indirect) callers and the complexity of some.
> >>
> >>
> >> [ ... ]
> >
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thank you for the prompt review!
>=20
> All patches are reviewed now except patch 18 which has no reply. I'm just
> pointing out in case it's something you missed.

Yes, I couldn't really understand the implications of that one, so I'll
leave the review to the maintainers.

Maxime

--vszq3vrbwpm6jkyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUP4nAAKCRAnX84Zoj2+
dkREAYDMzyGsQO2Sx3OBs9bux6ITkH/bFGwHZ4tpRgWit4a1jMHeNuozqpDBMT8K
WmLrt7EBgJR1HTyQ6KH6xqqoS2wwREqGdMPi/YcBXvOdlzPZCFsQrfYdAFhAw8ky
AW0aV5QIbg==
=GFoU
-----END PGP SIGNATURE-----

--vszq3vrbwpm6jkyb--
