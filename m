Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C7AC0F08
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C13110E9C0;
	Thu, 22 May 2025 14:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s3wma8Dg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B077610E176;
 Thu, 22 May 2025 14:57:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BA2C5C5D5C;
 Thu, 22 May 2025 14:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3816C4CEEA;
 Thu, 22 May 2025 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747925853;
 bh=5G+CU34zmKz9PE5a5J7jN90cu5Gxk5UtkArIIi8NlfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s3wma8DglmgLQ+hMVFjvtfjc4AGN1CkhvK3aJgPdEeop7ZdSKHWrh+jFnDK9fS1Bt
 k4DPjLZirixi4RiNSCPaqTeQgbbYCGh34naxvV1r976lLS74g+aZn2NIJWPxU9Bk2h
 5lhBFpwnMYqpXLlbfQyJNLBIPkBOwrbgXjydFtJry7hB5vIcXzHiBLTIOBsTw60ofP
 Sbe3oHlRv+SrSkLUAyO4OvF2SWUXfIQoAWSdBVx6gLBXEtHN69lIJ+ngwI0pTb/j5i
 982RPFTGUmNJf2N7qI0n6pT07RfEnvluDICTfTYoG8Smrgr1WlqJE6p9LO4kvWBltm
 OmAchw1yswU2w==
Date: Thu, 22 May 2025 16:57:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>,
 Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Vitalii Mordan <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
 Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Ian Ray <ian.ray@gehealthcare.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Helge Deller <deller@gmx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250522-amphibian-shiny-chachalaca-cf05ba@houat>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fe7madz4h5tk5u3n"
Content-Disposition: inline
In-Reply-To: <20250521162216.79dd3290@booty>
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


--fe7madz4h5tk5u3n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Wed, May 21, 2025 at 04:22:16PM +0200, Luca Ceresoli wrote:
> Hello Maxime, Shawn, Liu, all,
>=20
> On Fri, 09 May 2025 15:53:26 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>=20
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a=
 DRM
> > bridge, and the only one supported from now on. It is the first milesto=
ne
> > towards removal of bridges from a still existing DRM pipeline without
> > use-after-free.
>=20
> I applied on drm-misc-next patches 3-17,20-21 as they match all the
> criteria:
>  - At least a Acked-by (or R-by maintainers)
>  - patch is for drm-misc
>=20
> Being my very first commits to drm-misc, I tried to be careful, and
> double checked all the patches with Louis (thanks!).
>=20
> Here are the pending questions and plan for the remaining patches.
>=20
> >       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"
>=20
> This reverts the commit applied my mistake:
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09b4=
3b025bce6d790d3c79f4518
>=20
> Neither the  original patch nor the revert has been reviewed/acked.
>=20
> As the commit was a mistake, I'm applying the revert by the end of this
> week (i.e. on Friday) unless there are better instructions.

Given the lack of answers, and that it looks correct to me, just leave
it there. We can always revert later on if things turned out to be
broken.

> >       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_=
bridge_alloc() API
>=20
> This patch affects multiple drivers. Running get_maintainers.pl
> points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> this looks like due to the 'N:' line in:
>=20
> ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> M:	Shawn Guo <shawnguo@kernel.org>
> M:	Sascha Hauer <s.hauer@pengutronix.de>
> R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> ...
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> N:	imx
> ...
>=20
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L2511-2528)
>=20
> Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> file that is touched by the patch. That regexp appears overly generic to =
me.

I agree, or at least, we shouldn't wait for Shawn or Sasha...

> Shawn, can it be fixed by making it less generic?
>=20
> If not, can we at least add a band-aid 'X:' entry for
> drivers/gpu/drm/bridge/imx?
>=20
> I think the other matching entry is the one to consider:
>=20
> DRM DRIVERS FOR FREESCALE IMX BRIDGE
> M:	Liu Ying <victor.liu@nxp.com>
> L:	dri-devel@lists.freedesktop.org
> S:	Maintained
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-com=
biner.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-lin=
k.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.y=
aml
> F:	drivers/gpu/drm/bridge/imx/
>=20
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L7940-7948)

=2E.. As long as Ying is fine with it, because it does look like they are
the actual maintainer.

> However it does not list any trees. I _guess_ drm-misc applies here as
> a fallback as well as common sense.
>=20
> Liu, should this entry have a 'T:' line for drm/misc?
>=20
> >       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_al=
loc() API
>=20
> Not acked/reviewed, some discussion happened. I am resending it in v4,
> possibly with updates based on the discussion.
>=20
> But it has the same issue discussed above, with get_maintiners.pl
> pointing at Shawn Guo's tree, so in the future I'm assuming this goes
> to drm-misc unless there are news about that.
>=20
> >       drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
>=20
> No feedback, resending in v4.
>=20
> >       drm/todo: add entry to remove devm_drm_put_bridge()
>=20
> This involves documentation maintained on another tree. Where should it
> be applied? There are two matching entries in MAINTAINERS:
>=20
>  * DRM DRIVERS -> the drm tree
>  * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree
>=20
> To me it looks like the second is obviously the closest match as we are
> dealing with DRM bridges, so I'm applying this as well on Friday unless
> there are better instructions.

Yes, they should be applied to drm-misc.

That being said, putting a two days timeout on *any* email is really
over-the-top. I doubt you reply to any of your mail in such a short
timeframe. We have rules for a reason, I'd expect you to follow them, no
matter how frustrating the lack of answers can be.

Maxime

--fe7madz4h5tk5u3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC87WgAKCRAnX84Zoj2+
do0iAYDmirWaXC3jRPAWe+k6egrSRuRKSb9T+TBMm48WnW6SNhJrwyOYhX8DpsOL
IHaDlR4BfiFZ6a345YL/OKfebcrONxA8UY50Y3/kmzH9OdWsvkfvJSWcHiCEeu26
nklxCgQuzA==
=mXOq
-----END PGP SIGNATURE-----

--fe7madz4h5tk5u3n--
