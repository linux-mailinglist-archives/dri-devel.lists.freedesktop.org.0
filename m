Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B568A4DC09
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CD310E594;
	Tue,  4 Mar 2025 11:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eoCUDu2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120A110E594
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6CEA9A44F15;
 Tue,  4 Mar 2025 11:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79110C4CEE5;
 Tue,  4 Mar 2025 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086695;
 bh=B2t+xxZjuCNwy1M5NBnsOVW4uUHehz4b8OJZ5lVSSTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eoCUDu2BNTKud+5wciKp+4VyvbTwHV9N8ZyeNOlb2LgMPlEz6J7OYkkAF8/oBRm6G
 NyzAjndCMetgypz4a4cSa3MCPbTIPOri28HkmmyrsshzVTOvvXzg8xHlgXKKa+WvrE
 ZJ5Vyg+fewHenZa2tGOQqpIu2ic3mZiqRq9E5RS8gDbjzAS3nQ06I7kYw55En3ClW5
 RSxmSPQaWiO1B5WIK6M1f0MdNUZ/9Ek7pirvohbzxtJrT2QaO1rIkRWmHlP3D1xMlP
 +M9FI2lI7moh2b12DPzRLPhpq7aiwrgfQpQd2JWH0RwHrAhD0qat1CgNAY7ddIXPPg
 9GQrlNZj8MnnA==
Date: Tue, 4 Mar 2025 12:11:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
Message-ID: <20250304-warping-flying-bumblebee-db6c80@houat>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250227120004.77814e09@bootlin.com>
 <20250303-urban-trout-of-vastness-f8d0e7@houat>
 <20250303143404.623a3178@bootlin.com>
 <20250303-idealistic-camouflaged-mandrill-4fb5f8@houat>
 <20250303175011.3f79a8c0@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qtiotlkwwox7wqzm"
Content-Disposition: inline
In-Reply-To: <20250303175011.3f79a8c0@bootlin.com>
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


--qtiotlkwwox7wqzm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
MIME-Version: 1.0

On Mon, Mar 03, 2025 at 05:50:11PM +0100, Herve Codina wrote:
> On Mon, 3 Mar 2025 16:00:33 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Mon, Mar 03, 2025 at 02:34:04PM +0100, Herve Codina wrote:
> > > Hi Maxime,
> > >=20
> > > On Mon, 3 Mar 2025 14:11:05 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > On Thu, Feb 27, 2025 at 12:00:04PM +0100, Herve Codina wrote: =20
> > > > > Hi Maxime,
> > > > >=20
> > > > > On Tue, 25 Feb 2025 17:43:48 +0100
> > > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > >    =20
> > > > > > Hi,
> > > > > >=20
> > > > > > Here's a series of changes after to the KMS helpers and bridge =
API
> > > > > > following a bunch of reviews I did.
> > > > > >=20
> > > > > > It's mostly centered across providing an easier time to deal wi=
th bridge
> > > > > > states, and a somewhat consistent with the other entities API.
> > > > > >=20
> > > > > > It's build tested only, with arm64 allmodconfig.
> > > > > >=20
> > > > > > Maxime
> > > > > >=20
> > > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > ---   =20
> > > > >=20
> > > > > I Tried to test this series on my system but I've got a compilati=
on issue.
> > > > >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> > > > >      depmod: ERROR: Found 2 modules in dependency cycles!
> > > > >=20
> > > > > CONFIG_DRM=3Dm in my configuration.   =20
> > > >=20
> > > > Could you share your configuration? it doesn't happen with allmodco=
nfig.
> > > >  =20
> > >=20
> > > Here is a defconfig that leads to the issue on my side: =20
> >=20
> > I still can't reproduce it, sorry. Is this based on linux-next /
> > drm-misc-next, or a private branch?
> >=20
> > Maxime
>=20
> Got it with this git history (based on 72d0af4accd9 available in
> drm-misc-next):
>=20
> f86431f9d3fc (HEAD -> test_maxime_series_drm_next_clean_v4) drm/bridge: t=
i-sn65dsi86: Use bridge_state crtc pointer
> 27b49a4a713f drm/bridge: tc358768: Convert to atomic helpers
> f3f203c823e3 drm/bridge: tc358768: Stop disabling when failing to enable
> 89f4b115b1ca drm/bridge: tc358775: Switch to atomic commit
> 142be5c7910a drm/bridge: cdns-csi: Switch to atomic helpers
> e6db675d871a drm/bridge: Introduce drm_bridge_is_atomic() helper
> 1745511b7394 drm/bridge: ti-sn65dsi83: Switch to drm_bridge_reset_crtc
> e44654d4c9bd drm/tests: bridge: Provide tests for drm_bridge_reset_crtc
> 671a94f57f99 drm/bridge: Add helper to reset bridge pipeline
> bcf02dc7fb61 drm/tests: Create tests for drm_atomic
> f7b479b6f283 drm/atomic: Introduce helper to lookup connector by encoder
> 56d9fa19b833 drm/tests: Add kunit tests for bridges
> 9c86d5205422 drm/bridge: Provide a helper to retrieve current bridge state
> 3e0010915240 drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
> 72d0af4accd9 (upstream_drm/for-linux-next, upstream_drm/drm-misc-next) dr=
m/msm/dp: Add support for LTTPR handling
> 6dcc3c5121b7 drm/i915/dp: Use the generic helper to control LTTPR transpa=
rent mode
> 226a0baf9098 drm/nouveau/dp: Use the generic helper to control LTTPR tran=
sparent mode
> ...

Yeah, I found it. It doesn't happen during compilation but during
modules_install. It's fixed now, thanks!

Maxime

--qtiotlkwwox7wqzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8bf4wAKCRAnX84Zoj2+
dqtjAX0b+5DA1W7wglK1ljdeHAnBtWSJORkxaT5j7vMy2Y9fwH9sPSPRu9LJK3UG
qYewERkBf1ysNhlaBYBZDzKqFZFEQaMcdxi0qr8xxrH+Z8n5xuYO4sSO/jagk5m+
IupeNokL+g==
=LzJ1
-----END PGP SIGNATURE-----

--qtiotlkwwox7wqzm--
