Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDBB736403
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB1D10E140;
	Tue, 20 Jun 2023 07:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3154510E200;
 Mon, 19 Jun 2023 12:47:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE94A60C0B;
 Mon, 19 Jun 2023 12:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DDAC433C9;
 Mon, 19 Jun 2023 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687178832;
 bh=rI2qBzaySDQoztQVEtC0jPQYOvjCNIGASQLpRBOidns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjRtXfzTIfP/c1V6U9JoWkW9tpZ5eAmny6FuTERYFpc6vOEveAIl7yasCe1y3PqL9
 Lek3Tqd9AcJumhMqJrtqjJv5XnbUgJSjP8kK1z8GQXCvCHqhMEXtNKno66Gx1oDshd
 dEAeuOp4/NGVTKvyWevsdsvskFEkQ5fTeeDLuCud4CTD6gqC56NIHrFFNZ0LQFHLEB
 WCSS5BXWIInlsiiYSFmciovkA0nBkgLj1CinpHhaRSCf4UWeOg9VpMIF0p8rpoQSOX
 Yd1JOofohjTbqCPza5voDuZUMvsWy2nuNJy1IM1P+gsupasZOTMyAw4nK/ZphrIzQs
 mzgL44qnTSc4g==
Date: Mon, 19 Jun 2023 14:47:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fgljrj3vvodehqwh"
Content-Disposition: inline
In-Reply-To: <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
X-Mailman-Approved-At: Tue, 20 Jun 2023 07:08:55 +0000
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
 Miaoqian Lin <linmq006@gmail.com>, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>,
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
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


--fgljrj3vvodehqwh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 12:53:42PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Jun 19, 2023 at 11:45:37AM +0200, Maxime Ripard wrote:
> > On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello Maxime,
> > >=20
> > > On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > > > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6nig wro=
te:
> > > > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > > > > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > > Together with the patches that were applied later the topmost=
 commit
> > > > > > > from this series is c2807ecb5290 ("drm/omap: Convert to platf=
orm remove
> > > > > > > callback returning void"). This commit was part for the follo=
wing next
> > > > > > > tags:
> > > > > > >
> > > > > > >         $ git tag -l --contains c2807ecb5290
> > > > > > >         next-20230609
> > > > > > >         next-20230613
> > > > > > >         next-20230614
> > > > > > >         next-20230615
> > > > > > >
> > > > > > > However in next-20230616 they are missing. In next-20230616
> > > > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a3=
5088660.
> > > > > > > Compared to c2807ecb5290 this adds 1149 patches but drops 37 =
(that are
> > > > > > > also not included with a different commit id). The 37 patches=
 dropped
> > > > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
> > > > > > >
> > > > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384=
aa9dc..c2807ecb5290
> > > > > > >              1  Christophe JAILLET
> > > > > > >              2  Jessica Zhang
> > > > > > >              5  Karol Wachowski
> > > > > > >              1  Laura Nao
> > > > > > >             27  Uwe Kleine-K=C3=B6nig
> > > > > > >              1  Wang Jianzheng
> > > > > > >
> > > > > > >
> > > > > > > I guess this was done by mistake because nobody told me about=
 dropping
> > > > > > > my/these patches? Can c2807ecb5290 please be merged into drm-=
misc-next
> > > > > > > again?
> > > > > >=20
> > > > > > Actually, it was probably a mistake that these patches got merg=
ed to
> > > > > > linuxnext during the 4 days that you noticed. However, your pat=
ches
> > > > > > aren't dropped and are still present in drm-misc-next.
> > > > > >=20
> > > > > > drm-misc has a bit of a unique model and it's documented fairly=
 well here:
> > > > > >=20
> > > > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > > > >=20
> > > > > Is there a flaw then in this unique model (or its implementation)=
 when
> > > > > drm-misc/for-linux-next moves in a non-fast-forward manner? This =
isn't
> > > > > expected, is it?
> > > >=20
> > > > There's no expectation afaik. Any tree merged in linux-next can be
> > > > rebased, drop a patch, amend one, etc. without any concern.
> > >=20
> > > I agree that there are no rules broken for a tree that is included in
> > > next and a maintainer is free to rewrite their tree independant of the
> > > tree being included in next.
> > >=20
> > > Still I think that shouldn't be used as an excuse.
> >=20
> > As an excuse for what?
>=20
> Just because the rules for trees in next allow the merged branch to be
> rewritten, shouldn't be used to justify rewriting the branch.
>=20
> IMHO you still should ensure that only commits make it into any next
> snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
> intend to be included in X-rc1.

That's never been a next rule either. Rust support has been in next for
almost a year without being sent as a PR for example.

> > > For me, if a maintainer puts some patch into next that's a statement
> > > saying (approximately) "I think this patch is fine and I intend to
> > > send it to Linus during the next merge window.".
> >=20
> > I mean, that's what we're saying and doing?
>=20
> No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (as it
> was part of next-20230609). A few days later however the patches were
> dropped.
>
> The two options that would have made the experience smoother for me are:
>=20
>  a) keep c2807ecb5290 in next and send it for v6.5-rc1; or

That's not an option. You were simply too late for v6.5-rc1, unless you
expect us to get rid of timezones and work on week-ends. But surely you
don't.

>  b) keep c2807ecb5290 in a branch that doesn't result it entering next
>     before v6.5-rc1.

All the drm-misc committers use dim. If that's a concern for you, feel
free to send a patch addressing this to dim.

> > > So my expectation is that if a patch is dropped again from next, there
> > > was a problem and it would be fair if the maintainer tells the
> > > author/submitter about this problem and that the patch was dropped.
> >=20
> > But it wasn't dropped,
>=20
> From my POV it was dropped from next as it was part of next between
> next-20230609 and next-20230615 but not any more since next-20230616.
> You talk about (not) being dropped from some branch in drm-misc, that's
> irrelevant for the thing I'm complaining about.

You were never told that they were merged in linux-next, but in
drm-misc-next. If they did, it's mostly an unfortunate artifact.

We have a documentation that explains the process and how drm-misc-next
works. If that's still confusing somehow, feel free to amend it to make
it clearer.

> > it's still very much to be sent to Linus during the next merge window.
>=20
> "next merge window" as in the one leading to 6.5-rc1? Either we mean
> different things when we say "next merge window", or there is a
> misunderstanding I don't see yet.

Linus doesn't want to receive in a PR patches that haven't been in
linux-next for at least two weeks. In most cases that's rc6, which means
that by the time we send our last PR before rc6, the
next-merge-window-while-still-meeting-Linus-requirements is 6.6.

The rule applies to all trees, and it's why the soc tree also requires
its submaintainers to submit their PR before -rc6.

So yeah, sorry if it was confusing. At the end of the day, it's a
compromise, and I can't find a better one for everyone involved
(maintainers, contributors and committers alike) off the top of my head.

Maxime

--fgljrj3vvodehqwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJBOTAAKCRDj7w1vZxhR
xeTEAQCpLmqv1Dwbs2ElNaYjkq7eYv8ZmjQZI2EkKa7Y6iqjiQEAmMlDhbSYnEDf
GqqVM7lIxJvB+ccrJg0xlmcdM6iAVgk=
=Wq0v
-----END PGP SIGNATURE-----

--fgljrj3vvodehqwh--
