Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E25A2206C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 16:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEBB10E826;
	Wed, 29 Jan 2025 15:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eNEyerr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C286710E826
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 15:32:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 06A655C5A46;
 Wed, 29 Jan 2025 15:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BE9C4CED1;
 Wed, 29 Jan 2025 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738164722;
 bh=3eFheDSpWiyXUMIVePzaMmKiY4Irw4pDvAOo/KLDnaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eNEyerr8J8cbrkMBUgupRCxukgjLdit161gsKlHuJxa+5IqchUKpPVtU4BV55gLHH
 arBcFMgvi5A3NFA1OOSoAZUoqHmhTBa8NxmwyXTU767gowKxQF2CYOKypUqndM2Dw4
 gMSGB/Rs7OZtmzE+zSYKGK7fR8O+vuWcQeSoRX0J0b6FiT5uxyH537PUh3ICy3gBE7
 qGorehjzmtey9b4Ie1xvoPiBep7Y95l8e4v8qYDm+4UZz/i0Ss81LEaBI2zJeYXHU1
 pwkIwiqaZHM9XFV7eReEW18xKSuzUrbPdEWsOuwBBrTaa3/7ZMCwQo/ZSyVQmAsg4Z
 xfrQZrqytCJow==
Date: Wed, 29 Jan 2025 16:31:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 02/14] drm/fsl-dcu: move to
 devm_platform_ioremap_resource() usage
Message-ID: <re7tzoh5jc62tne5yjxwedzgwytjiaobe7lmthufl64ianzkwd@5tr3snkco7n5>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-2-0d1609a29587@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4ecgy27a4bl56ypl"
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-2-0d1609a29587@redhat.com>
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


--4ecgy27a4bl56ypl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 02/14] drm/fsl-dcu: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:26PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);
>=20
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Alison Wang <alison.wang@nxp.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--4ecgy27a4bl56ypl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pJ7gAKCRAnX84Zoj2+
dtrgAYCFjfwtMfB3t6F45oNqmLk0ks3YVtwAXdgRfdShn6/wFj/BV7iDvIgrpcCH
qLlOFWEBgMW8WvTRwXwIETDgFjCMTrxFlK4L2dh4+vwJLxCZFKsXy41VgEFoC+Qs
LXrrPbNtgw==
=AGCA
-----END PGP SIGNATURE-----

--4ecgy27a4bl56ypl--
