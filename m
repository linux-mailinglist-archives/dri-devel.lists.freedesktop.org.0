Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63436AA48BA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 12:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FA210E725;
	Wed, 30 Apr 2025 10:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ba2+wqLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00D310E0DF;
 Wed, 30 Apr 2025 10:39:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E379168430;
 Wed, 30 Apr 2025 10:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B910BC4CEE9;
 Wed, 30 Apr 2025 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746009560;
 bh=pa/oq7Iq9DFQzLAcYNPUeUzLf26wbsIriyzXBSer2gM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ba2+wqLpY4w4Dwob5uYJx95CKmUelGELftsNTS3eHspzZ58Ikjl7LtL2k/WEVojg3
 6RNboZgAoPsRSceBSrJQ4gI0KI+kLh/x/+zVe369vcEYvsrJcpw+MaLGq1dvO0dhzT
 UXRNIHNfOndCAVL8bp8Vk+mUt5Z7AOA9GNYnov13fOSdNL5ZdZ+HunWP8UpY2BZFVS
 kcUcVI8My66bOlI48dIaW0RnArzM3AEdSf4RJwXFrBtI9GNBMwHbLfcRwpMdomOayN
 rqMkzFB+G2QvvC7JpYRvfRaEQX3MjkSQYncUy0phaJL6pWidajSYs2KXlz01S2iNTQ
 1tZFXEK+iUgRg==
Date: Wed, 30 Apr 2025 12:39:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, 
 Andy Yan <andy.yan@rock-chips.com>, 
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
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
 Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250430-scorpion-of-majestic-argument-7f59b4@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
 <efcf3798-9ac1-42a7-8a12-24d931cbf771@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="n3uft3wwvexxpcog"
Content-Disposition: inline
In-Reply-To: <efcf3798-9ac1-42a7-8a12-24d931cbf771@bootlin.com>
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


--n3uft3wwvexxpcog
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Wed, Apr 30, 2025 at 10:21:48AM +0200, Louis Chauvet wrote:
>=20
>=20
> Le 29/04/2025 =E0 16:42, Dmitry Baryshkov a =E9crit=A0:
> > On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> > >=20
> > > On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > > > devm_drm_bridge_alloc() [0] is the new API to allocate and initiali=
ze a DRM
> > > > bridge, and the only one supported from now on. It is also necessar=
y for
> > > > implementing reference counting and thus needed to support removal =
of
> > > > bridges from a still existing DRM pipeline without use-after-free.
> > > >=20
> > > > This series converts all DRM bridges to the new API.
> > > >=20
> > > > [...]
> > >=20
> > > Applied, thanks!
> > >=20
> >=20
> > [...]
> >=20
> > > [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
> > >          commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> > > [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
> > >          commit: fffc8847743e45604c4478f554d628481b985556
> > > [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
> > >          commit: e11532be87e437648521a8ed5358c56df11933b4
> >=20
> > Why? These drivers are explicitly handled outside of drm-misc. Please be
> > more careful next time.
> >=20
>=20
> Sorry, I was not aware that msm also have his own repository.
>=20
> TBH, I was not aware that other repositories existed for drm (I should ha=
ve
> looked at MAINTAINERS, it is totally my fault). DIM and doc[1] only list
> drm, drm-misc, drm-xe, drm-intel, so I just tough "intel is special", not
> "drm is divided in many repositories".

It's mentioned in the drm-misc section:

https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-misc.ht=
ml

> This repository consists mostly of the core drm code as well as DRM
> drivers that do not have a dedicated repository.

Feel free to send a patch to improve the doc. If you missed it, someone
else will.

Maxime

--n3uft3wwvexxpcog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBH91QAKCRAnX84Zoj2+
dtaAAYD+vw3ijG0Npi7DNS7E4rH/Y/pmL5jn26rshJDKKon86xXDKPf7qxcxUMUk
GcIwPpABfiK4x23dgB5GWaHnby7RQQrps8EcAVNJ5CjGxA14hgs3XZLzSy+6xbQn
WiWn0Tn6mA==
=/a61
-----END PGP SIGNATURE-----

--n3uft3wwvexxpcog--
