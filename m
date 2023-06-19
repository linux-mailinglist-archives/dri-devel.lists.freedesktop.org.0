Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197FE736407
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9BC10E26A;
	Tue, 20 Jun 2023 07:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848E810E205;
 Mon, 19 Jun 2023 14:02:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DDC960C74;
 Mon, 19 Jun 2023 14:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02FBC433C8;
 Mon, 19 Jun 2023 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687183366;
 bh=aoZIdKtakof1RrLG1uHfgHvEnjV5bAZA/iEPAGIdL1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jV95SsXCscon9mjIrA85S4h2EdhGBkgNuFn8VZOUrDV+lIkF0pUNayXcf0CKyi8A6
 N48rXJ2wuubn0Bti2ZkKUiijVrVqJoWAxGylrGc2P/8z2dpERee9fF4Un0UHHbArW4
 auoHmiA8vzTlS8TEVa4jO3sKRu3sb8gHf+zbcrBovj5dR8bhFUe8fIUCFrs8zNtGMM
 a8tAV38SZ7gAwjXhA1JwM4LL2kusu0pUESpxODTU+LmevESt4iijRlQuZNuPIRrx6/
 xEJ/A1HJ21okj5noJ5wg00TGmdIesmam9MZrNHImWINT+iaS1huZnX+m6jmzDi4WVy
 eOUJrD/hLSISQ==
Date: Mon, 19 Jun 2023 16:02:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <vegkiv4puxederjvonyyqsg4j5swpi2h7ttg7ng6gq2tibk4gy@afa5vexshp7q>
References: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
 <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
 <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g5vgywptxejmww6t"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
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
 Miaoqian Lin <linmq006@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
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


--g5vgywptxejmww6t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 03:25:28PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> CC sfr
>=20
> On Mon, Jun 19, 2023 at 2:51=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Jun 19, 2023 at 12:53:42PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Mon, Jun 19, 2023 at 11:45:37AM +0200, Maxime Ripard wrote:
> > > > On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-K=C3=B6nig wro=
te:
> > > > > On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > > > > > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6nig=
 wrote:
> > > > > > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > > > > > > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6n=
ig
> > > > > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > > > > Together with the patches that were applied later the top=
most commit
> > > > > > > > > from this series is c2807ecb5290 ("drm/omap: Convert to p=
latform remove
> > > > > > > > > callback returning void"). This commit was part for the f=
ollowing next
> > > > > > > > > tags:
> > > > > > > > >
> > > > > > > > >         $ git tag -l --contains c2807ecb5290
> > > > > > > > >         next-20230609
> > > > > > > > >         next-20230613
> > > > > > > > >         next-20230614
> > > > > > > > >         next-20230615
> > > > > > > > >
> > > > > > > > > However in next-20230616 they are missing. In next-202306=
16
> > > > > > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b986392867=
00a35088660.
> > > > > > > > > Compared to c2807ecb5290 this adds 1149 patches but drops=
 37 (that are
> > > > > > > > > also not included with a different commit id). The 37 pat=
ches dropped
> > > > > > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb529=
0:
> > > > > > > > >
> > > > > > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb=
4384aa9dc..c2807ecb5290
> > > > > > > > >              1  Christophe JAILLET
> > > > > > > > >              2  Jessica Zhang
> > > > > > > > >              5  Karol Wachowski
> > > > > > > > >              1  Laura Nao
> > > > > > > > >             27  Uwe Kleine-K=C3=B6nig
> > > > > > > > >              1  Wang Jianzheng
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > I guess this was done by mistake because nobody told me a=
bout dropping
> > > > > > > > > my/these patches? Can c2807ecb5290 please be merged into =
drm-misc-next
> > > > > > > > > again?
> > > > > > > >
> > > > > > > > Actually, it was probably a mistake that these patches got =
merged to
> > > > > > > > linuxnext during the 4 days that you noticed. However, your=
 patches
> > > > > > > > aren't dropped and are still present in drm-misc-next.
> > > > > > > >
> > > > > > > > drm-misc has a bit of a unique model and it's documented fa=
irly well here:
> > > > > > > >
> > > > > > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc=
=2Ehtml
> > > > > > >
> > > > > > > Is there a flaw then in this unique model (or its implementat=
ion) when
> > > > > > > drm-misc/for-linux-next moves in a non-fast-forward manner? T=
his isn't
> > > > > > > expected, is it?
> > > > > >
> > > > > > There's no expectation afaik. Any tree merged in linux-next can=
 be
> > > > > > rebased, drop a patch, amend one, etc. without any concern.
> > > > >
> > > > > I agree that there are no rules broken for a tree that is include=
d in
> > > > > next and a maintainer is free to rewrite their tree independant o=
f the
> > > > > tree being included in next.
> > > > >
> > > > > Still I think that shouldn't be used as an excuse.
> > > >
> > > > As an excuse for what?
> > >
> > > Just because the rules for trees in next allow the merged branch to be
> > > rewritten, shouldn't be used to justify rewriting the branch.
> > >
> > > IMHO you still should ensure that only commits make it into any next
> > > snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
> > > intend to be included in X-rc1.
> >
> > That's never been a next rule either. Rust support has been in next for
> > almost a year without being sent as a PR for example.
>=20
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/2.Pr=
ocess.rst#L297
>=20
>    "The linux-next tree is, by design, a snapshot of what the mainline
>     is expected to look like after the next merge window closes."
>=20
> The general rule for linux-next is that its contents are intended to end
> up in the next kernel release, and that it should not contain commits
> that are intended for the next-next release, cfr. what Stephen sends
> out to new trees:
>=20
>    "You will need to ensure that the patches/commits in your tree/series =
have
>     been:
>             [...]
>          * destined for the current or next Linux merge window."
>=20
> and what he requests regularly in his announces, e.g.:
>=20
>    "Please do not add any v6.4 related commits to your linux-next included
>     branches until after v6.3-rc1 has been released."

Which is why those patches aren't in next anymore.

> AFAIU, the exception to the rule is new, self-contained, and sometimes
> controversial development, which may have to cook for a few more cycles,
> if it ends up in a PR at all.
>=20
> > > > > For me, if a maintainer puts some patch into next that's a statem=
ent
> > > > > saying (approximately) "I think this patch is fine and I intend to
> > > > > send it to Linus during the next merge window.".
> > > >
> > > > I mean, that's what we're saying and doing?
> > >
> > > No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (as=
 it
> > > was part of next-20230609). A few days later however the patches were
> > > dropped.
> > >
> > > The two options that would have made the experience smoother for me a=
re:
> > >
> > >  a) keep c2807ecb5290 in next and send it for v6.5-rc1; or
> >
> > That's not an option. You were simply too late for v6.5-rc1, unless you
> > expect us to get rid of timezones and work on week-ends. But surely you
> > don't.
>=20
> I don't think anyone expects you to do that...
>=20
> > >  b) keep c2807ecb5290 in a branch that doesn't result it entering next
> > >     before v6.5-rc1.
> >
> > All the drm-misc committers use dim. If that's a concern for you, feel
> > free to send a patch addressing this to dim.
>=20
> So you say this is an issue with the tooling? ;-)
> If the tooling breaks the rules, perhaps the tooling should be fixed?

We've been using dim for more than 5 years. It doesn't seem to work too bad?

And it does feel like the goalposts are moving there: the discussion
started by "you shouldn't rebase a tree" and is now at "patches should
never be in a next branch if they can't reach the next merge window,
even though it's not apparent yet"

But yeah, I now that complaining about how much drm-misc sucks is fun
and all, but it's still not clear to me what a potential solution to
this would be?

Knowing that we can't rebase or close drm-misc-next, and that it should
be automated in dim somehow, what would that fix be?

> > So yeah, sorry if it was confusing. At the end of the day, it's a
> > compromise, and I can't find a better one for everyone involved
> > (maintainers, contributors and committers alike) off the top of my head.
>=20
> As I understand, the main issue Uwe is objecting to, is that his
> patches ended up in linux-next first, only to be dropped again from
> linux-next later, and that there was no communication about the
> latter.
>=20
> If you're not constantly working on a subsystem, it can be very hard
> to keep track of the status of your own drive-by patches. When patches
> get applied, appear in linux-next, and disappear from linux-next again
> later, it's worse...

Sure, I've worked with enough of these series to understand how it can
be annoying.

Maxime

--g5vgywptxejmww6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJBgAwAKCRDj7w1vZxhR
xbHrAQC2tbpr59FvWgo5UdT6HVaFbQ1eIt6cd77EE73rYdv7cQD7B85ixe8k46Oo
fLEiK8/0rTPKuTVzkjY164VJRmNDYQ0=
=LBiM
-----END PGP SIGNATURE-----

--g5vgywptxejmww6t--
