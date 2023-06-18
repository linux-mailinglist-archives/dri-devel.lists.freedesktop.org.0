Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41BD734C9E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8CF10E0F8;
	Mon, 19 Jun 2023 07:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D029810E06A;
 Sun, 18 Jun 2023 14:33:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAB3960B02;
 Sun, 18 Jun 2023 14:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148B5C433C8;
 Sun, 18 Jun 2023 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687098779;
 bh=fXNMZYwOgDMQ5hRReTsVYyQKGsNkl7Yf2bR0W8HTGVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dIlREaVnNgjxhr7AJ74D1X+frQH5Cms+R1UYwffgh7TsWHm+t9Htp2MVINJY2HMmt
 INYSi5wW0uhl54fvsFgtNbKIVUalF6sOwl4/Y+AeTCCxTTUPXPNTSxC+E80JDzChqc
 hqKWrzhqkqpg4SvzPjjq94FHCS3cCeZaPtrlS2s9b/HbsTiFI6ideDwvBP5NipiiZk
 VhkA3DeVhebdrL5Bj6gls+lqhbhx3sVfdMH0oN0YDdUWYKEcWgm6E6spPpirv2ObZx
 p+JHQx58yqu5oj3eBVy7BOvDWGjTqRA0YXl06nm4tmC/NcvPqaeyYxuMoZ7If34+c7
 2frJPttzlbfWw==
Date: Sun, 18 Jun 2023 16:32:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ie4bujxpferi4jwc"
Content-Disposition: inline
In-Reply-To: <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
X-Mailman-Approved-At: Mon, 19 Jun 2023 07:45:35 +0000
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
Cc: Raymond Tan <raymond.tan@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Alain Volmat <alain.volmat@foss.st.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-mips@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 Wang Jianzheng <wangjianzheng@vivo.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yuan Can <yuancan@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Doug Anderson <dianders@chromium.org>, Paul Cercueil <paul@crapouillou.net>,
 Laura Nao <laura.nao@collabora.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
 Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ie4bujxpferi4jwc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Doug,
>=20
> On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > [expanding recipents by the other affected persons]
> > >
> > > On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> > > > On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig w=
rote:
> > > > > > this patch series adapts the platform drivers below drivers/gpu=
/drm
> > > > > > to use the .remove_new() callback. Compared to the traditional =
=2Eremove()
> > > > > > callback .remove_new() returns no value. This is a good thing b=
ecause
> > > > > > the driver core doesn't (and cannot) cope for errors during rem=
ove. The
> > > > > > only effect of a non-zero return value in .remove() is that the=
 driver
> > > > > > core emits a warning. The device is removed anyhow and an early=
 return
> > > > > > from .remove() usually yields a resource leak.
> > > > > >
> > > > > > By changing the remove callback to return void driver authors c=
annot
> > > > > > reasonably (but wrongly) assume any more that there happens som=
e kind of
> > > > > > cleanup later.
> > > > >
> > > > > I wonder if someone would volunteer to add the whole series to
> > > > > drm-misc-next?!
> > > >
> > > > It looks as if Neil applied quite a few of them already, so I looked
> > > > at what was left...
> > > >
> > > > I'm a little hesitant to just apply the whole kit-and-caboodle to
> > > > drm-misc-next since there are specific DRM trees for a bunch of them
> > > > and it would be better if they landed there. ...so I went through a=
ll
> > > > the patches that still applied to drm-misc-next, then used
> > > > 'scripts/get_maintainer.pl --scm' to check if they were maintained
> > > > through drm-misc. That still left quite a few patches. I've applied
> > > > those ones and pushed to drm-misc-next:
> > > >
> > > > 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> > > > callback returning void
> > > > 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning=
 void
> > > > b957812839f8 drm/v3d: Convert to platform remove callback returning=
 void
> > > > e2fd3192e267 drm/tve200: Convert to platform remove callback return=
ing void
> > > > 84e6da7ad553 drm/tiny: Convert to platform remove callback returnin=
g void
> > > > 34cdd1f691ad drm/tidss: Convert to platform remove callback returni=
ng void
> > > > d665e3c9d37a drm/sun4i: Convert to platform remove callback returni=
ng void
> > > > 0c259ab19146 drm/stm: Convert to platform remove callback returning=
 void
> > > > 9a865e45884a drm/sti: Convert to platform remove callback returning=
 void
> > > > 3c855610840e drm/rockchip: Convert to platform remove callback retu=
rning void
> > > > e41977a83b71 drm/panfrost: Convert to platform remove callback retu=
rning void
> > > > cef3776d0b5a drm/panel: Convert to platform remove callback returni=
ng void
> > > > bd296a594e87 drm/mxsfb: Convert to platform remove callback returni=
ng void
> > > > 38ca2d93d323 drm/meson: Convert to platform remove callback returni=
ng void
> > > > fd1457d84bae drm/mcde: Convert to platform remove callback returnin=
g void
> > > > 41a56a18615c drm/logicvc: Convert to platform remove callback retur=
ning void
> > > > 980ec6444372 drm/lima: Convert to platform remove callback returnin=
g void
> > > > 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback ret=
urning void
> > > > c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback retur=
ning void
> > > > a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback r=
eturning void
> > > > 9a32dd324c46 drm/aspeed: Convert to platform remove callback return=
ing void
> > > > 2c7d291c498c drm/arm/malidp: Convert to platform remove callback re=
turning void
> > > > a920028df679 drm/arm/hdlcd: Convert to platform remove callback ret=
urning void
> > > > 1bf3d76a7d15 drm/komeda: Convert to platform remove callback return=
ing void
> > >
> > > Together with the patches that were applied later the topmost commit
> > > from this series is c2807ecb5290 ("drm/omap: Convert to platform remo=
ve
> > > callback returning void"). This commit was part for the following next
> > > tags:
> > >
> > >         $ git tag -l --contains c2807ecb5290
> > >         next-20230609
> > >         next-20230613
> > >         next-20230614
> > >         next-20230615
> > >
> > > However in next-20230616 they are missing. In next-20230616
> > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088660.
> > > Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that are
> > > also not included with a different commit id). The 37 patches dropped
> > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
> > >
> > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c=
2807ecb5290
> > >              1  Christophe JAILLET
> > >              2  Jessica Zhang
> > >              5  Karol Wachowski
> > >              1  Laura Nao
> > >             27  Uwe Kleine-K=C3=B6nig
> > >              1  Wang Jianzheng
> > >
> > >
> > > I guess this was done by mistake because nobody told me about dropping
> > > my/these patches? Can c2807ecb5290 please be merged into drm-misc-next
> > > again?
> >=20
> > Actually, it was probably a mistake that these patches got merged to
> > linuxnext during the 4 days that you noticed. However, your patches
> > aren't dropped and are still present in drm-misc-next.
> >=20
> > drm-misc has a bit of a unique model and it's documented fairly well he=
re:
> >=20
> > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
>=20
> Is there a flaw then in this unique model (or its implementation) when
> drm-misc/for-linux-next moves in a non-fast-forward manner? This isn't
> expected, is it?

There's no expectation afaik. Any tree merged in linux-next can be
rebased, drop a patch, amend one, etc. without any concern.

It's also why linux-next is rebuilt entirely every day.

> > The key is that committers can commit to drm-misc-next _at any time_
> > regardless of the merge window. The drm-misc merge strategy makes this
> > OK. Specifically, when it's late in the linux cycle then drm-misc-next
> > is supposed to stop merging to linuxnext. Then, shortly after the
> > merge window closes, patches will start flowing again.
> >=20
> > So basically your patches are landed and should even keep the same git
> > hashes when they eventually make it to Linux. They just won't land for
> > another release cycle of Linux.
>=20
> OK, c2807ecb5290 is still included in drm-misc-next. So while I don't
> understand the whole model, the patches at least seem to be scheduled to
> go in during the next merge window.

It's not that complicated.

drm-misc-next is always open, and we start targeting release X + 2 when
X-rc6 is released.

This is due to Linus wanting all the commits sent as part of the PR in
linux-next for two weeks.

In order to converge towards (X + 1)-rc1 in linux-next, as soon as X-rc6
is released, we remove drm-misc-next from the linux-next branch. All the
patches in drm-misc-next that were targetting X + 1 are in drm/next by
then, so it's not a concern.

Maxime

--ie4bujxpferi4jwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZI8VkwAKCRDj7w1vZxhR
xVuuAP90GlI+Og5OFiXQ6q39Zs0S/YZFuc+hLdFGKTqzvfClawD/ZjfVwKXeCrot
dleCUqKj6TPV61aZtzbp7w8zmBfh2wI=
=PKk5
-----END PGP SIGNATURE-----

--ie4bujxpferi4jwc--
