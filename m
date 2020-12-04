Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3892CF33C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 18:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048526E1A8;
	Fri,  4 Dec 2020 17:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D8B6E1A8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 17:41:38 +0000 (UTC)
Date: Fri, 4 Dec 2020 17:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607103698;
 bh=WGPvh/m1la/6pEZ0tQ/GOgG68+E+LycRUiq+bD3Iwkk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/TkCIMmBnQxPWxPF2qMZYVzCmn31CDUYt6k0CzRPEhcaQop/372ntwpVszp4hjIE
 vIVuuPebp/OC1i7cGxGjhjvFCBH+ZOpJXrqSfBUsLkg92qAaqtHe1oRjW2/LiLKRoP
 uV66KhSBbnh6OLWt+7k76XvCzSFsllU2Y5flxry9vND+O+lxolnf60O50XwwBPh+yq
 SoPzZkAnY4VxswfQ2GzN2EHfELa7v8aeYr2tU6kH0grOPrleQ/frQmRoOuiQC9upQJ
 YrsyZgnwacEkiNSykQCi1T9S/rE+RUrXs3/y3O5y2YsUSe/DVXEgxaJHuUZ1ya5ze9
 iTXQfDZc1wffA==
From: Mark Brown <broonie@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
Message-ID: <20201204174135.GC4558@sirena.org.uk>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201204024226.1222-2-thunder.leizhen@huawei.com>
X-Cookie: Not a flying toy.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk <linux-clk@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============1932697849=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1932697849==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
> All warnings are related only to "wrong indentation", except one:
> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
> [error] missing document start "---" (document-start)

It would make life easier (and be more normal practice) to split this up
by driver/subsystem and send a bunch of separate patches to the relevant
maintainers, this makes it much easier to review and handle things.

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/KdM4ACgkQJNaLcl1U
h9BGjQf/UZkJEtI4D/7Y6K4QlL3HTskWfvSDmZF26Ea+sD/TdJ91T1YJulT15TOK
sKNLzMI5ERHHR+su1GGx0czMqpipoPYLvlULn6wLpL6fMbOx94cA+dc8Akr/JcjX
EfMthdqAlA+5P1Lz5FivyeWRk/B2YgNQ4+Pa9bbLW4iZogcNL2jZmN55GvBHYlSa
oyLVbN2YlJwy/t9b+c8mvlCGa5NyPDe5JmpplcFkCbn5DVZ9aFTHrGaQ0Ml1rv5W
DyyLnw1kpVUck0Phs49+unaEOb88Mh7FY4Jtsqz6SuqZDkHYZuWCwod5VHJG7q53
cpaFjB5+6e3/mAA/aRnxyzuOxLmoMA==
=82J7
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--

--===============1932697849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1932697849==--
