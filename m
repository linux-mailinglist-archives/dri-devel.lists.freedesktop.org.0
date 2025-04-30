Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCFAAA56A9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 23:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833E110E057;
	Wed, 30 Apr 2025 21:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B029089B57;
 Wed, 30 Apr 2025 08:08:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D82F543930;
 Wed, 30 Apr 2025 08:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C6EC4CEE9;
 Wed, 30 Apr 2025 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746000498;
 bh=pCUgXguQq1vRA4bGkjweAQOtL40q6Ryp+ab88vmfA3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEhvhvQHG4rVvDgSY5YEAlvFdlFIjPoEwklqHK2oVDFFscI9oOnH22AFxtXXETEug
 iHnVYvMe+t+mjmLvvnbJk0leb+R0US2frAqv3Vo0Rnx1IyUcFzc8Xz+JP/Vc4AgrWv
 c48oqzjYkbO2MbC5RCNzUEKgl16x3n093ezpE/HgkfVb2/a5ZQ/gaNtVmMRl6YrsgT
 Ek//OIPQJU/El1by4jlyMox7RQIViSupPPfGsNTCUePuh0N0KYiCkq3fsOplC3fn9+
 O9mkEGg517iIKGWX+UDcBJI+SdNy3IDIcjLt6YoA/frBd8zWVSzwqyzDqDrFOqkQvK
 BJdFA6k3dyQZw==
Date: Wed, 30 Apr 2025 10:08:14 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
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
 Liu Ying <victor.liu@nxp.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Vitalii Mordan <mordan@ispras.ru>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Helge Deller <deller@gmx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250430-arrogant-marmoset-of-justice-92ced3@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="o2svn3fbdbsdr4ij"
Content-Disposition: inline
In-Reply-To: <832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com>
X-Mailman-Approved-At: Wed, 30 Apr 2025 21:22:38 +0000
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


--o2svn3fbdbsdr4ij
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Tue, Apr 29, 2025 at 02:41:42PM +0200, Louis Chauvet wrote:
> Le 29/04/2025 =E0 11:27, Louis Chauvet a =E9crit=A0:
> >=20
> > On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize=
 a DRM
> > > bridge, and the only one supported from now on. It is also necessary =
for
> > > implementing reference counting and thus needed to support removal of
> > > bridges from a still existing DRM pipeline without use-after-free.
> > >=20
> > > This series converts all DRM bridges to the new API.
> > >=20
> > > [...]
> >=20
> > Applied, thanks!
> >=20
> > [02/34] platform: arm64: acer-aspire1-ec: convert to devm_drm_bridge_al=
loc() API
> >          commit: 411465d35bc56877c33e2498ac697acfcf484e6b
> > [03/34] drm/bridge: analogix-anx6345: convert to devm_drm_bridge_alloc(=
) API
> >          commit: 53ddeb25159781b029fda404226af600e76f975f
> > [06/34] drm/bridge: display-connector: convert to devm_drm_bridge_alloc=
() API
> >          commit: 4e90a3d96a6185e143041273f9867a1092dd4a71
> > [07/34] drm/bridge: lt9611uxc: convert to devm_drm_bridge_alloc() API
> >          commit: 6287ffd9eff6eea65865e64b9d4c45e115fa5ecf
> > [11/34] drm/bridge: dw-hdmi: convert to devm_drm_bridge_alloc() API
> >          commit: ed6987b674185873ebed7a619a646da6dd1a78fa
> > [12/34] drm/bridge: tda998x: convert to devm_drm_bridge_alloc() API
> >          commit: 7fe58bf1a9a24b533875c262a3222581a3f759e4
> > [13/34] drm/bridge: ti-sn65dsi86: convert to devm_drm_bridge_alloc() API
> >          commit: a4754ae9cfa76fbce79f023c268a5bac56f36321
> > [14/34] drm/exynos: mic: convert to devm_drm_bridge_alloc() API
> >          commit: 91c5c7b5bb2dd09b43b025bce6d790d3c79f4518
>=20
> Hello all,
>=20
> I made a mistake while applying those patches. Instead of taking
> 2-3,11-13,15-18,27,31, I took 2-3,11-18,27,31, which includes the patch 1=
4.
>=20
> This patch is not R-by/A-by/SoB by non-Bootlin people. For me, the patch =
is
> correct, it does not break the build nor generate warnings.
>=20
> What should I do? Is my SoB sufficient, or should I revert the patch and
> wait for R/A-by before taking it again?

It's worse: just like msm, it was never supposed to be applied in
drm-misc, exynos has its own git tree.

Inki, Kyungmin, Seung-Woo, sorry for the mishap. Do you agree with the
following patch, and it going through drm-misc?

https://lore.kernel.org/dri-devel/20250424-drm-bridge-convert-to-alloc-api-=
v2-14-8f91a404d86b@bootlin.com/

If not, we'll revert.

Maxime

--o2svn3fbdbsdr4ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBHaaAAKCRAnX84Zoj2+
dnenAYDBZr6cr88AokBU5IxJIO545Bob3jJW0+AX0AYDOu8icKftnZn/muxH1K/2
mlgois4Bf2nfOosRvUT+FqHEb3CHJCluDubGG9J2EVzCRjRyMKIJ+yKyJ5VGB4cE
N6ZGUBWZvg==
=3YXQ
-----END PGP SIGNATURE-----

--o2svn3fbdbsdr4ij--
