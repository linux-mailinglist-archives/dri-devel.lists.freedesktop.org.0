Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FA736406
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AA910E269;
	Tue, 20 Jun 2023 07:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C224310E20E;
 Mon, 19 Jun 2023 14:20:31 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5701810884aso32154217b3.0; 
 Mon, 19 Jun 2023 07:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687184430; x=1689776430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jFntx4YXgadpDVJ2Ga1nOHhwiQ9Nxhf2XabKx8SJuMo=;
 b=FEJSoiff/xS0T8ii2usxcwKFTsmvtkLawnqFzgnvnY7XJKBJhJze0G3pRIjcgqMqB7
 mzLM4NLNyCsiUz6+tsHTaVZByUftfVUfZ2F5nuRmPyNSleaO60dZ1wzqIy8K0tjhImP8
 IDz7LceN6YpXGGz0DDLTq6dlpXMg7OUgUrAvxzZerjEvr1rmXTWtugfSDmdTcqor/1IM
 IJsrQIvyUbYmh1Z2mOXH3rUgifgVW7COMaxhZEhEXLwiDCMg/VFJ0hjRMrVKYI/MH8Xm
 CHDiXpYFnuGRy+4ezXpphoB8k4i4tnd20h4NOvVDfGK8QQYJuEL3cwmR/97ASdfQTDNM
 mu9w==
X-Gm-Message-State: AC+VfDzSqfVNLjo0MrmwclIROW9oLMa+eQ4C5L9+EuoznrRW3LqLAkUg
 aagEEypNiyMoLorQQsXbFm+n3zZnEHMUj2id
X-Google-Smtp-Source: ACHHUZ4dMdey6WWzfsO//hceq8DUnEz1FRBhSjYqoEhnX2GpflqSYSr+yFI4pBZkmtKa6JXkySiSBA==
X-Received: by 2002:a0d:d7c5:0:b0:56c:f372:292 with SMTP id
 z188-20020a0dd7c5000000b0056cf3720292mr992265ywd.20.1687184429911; 
 Mon, 19 Jun 2023 07:20:29 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 a81-20020a0dd854000000b005463e45458bsm1722093ywe.123.2023.06.19.07.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 07:20:28 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-be49e41a3d6so2445617276.1; 
 Mon, 19 Jun 2023 07:20:27 -0700 (PDT)
X-Received: by 2002:a5b:88e:0:b0:ba8:33d9:b583 with SMTP id
 e14-20020a5b088e000000b00ba833d9b583mr987140ybq.13.1687184427316; Mon, 19 Jun
 2023 07:20:27 -0700 (PDT)
MIME-Version: 1.0
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
 <vegkiv4puxederjvonyyqsg4j5swpi2h7ttg7ng6gq2tibk4gy@afa5vexshp7q>
In-Reply-To: <vegkiv4puxederjvonyyqsg4j5swpi2h7ttg7ng6gq2tibk4gy@afa5vexshp7q>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2023 16:20:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXf5Pao+Fjf42iRV_iMFEcb+F=s09NG+mudB-L5wWF_OA@mail.gmail.com>
Message-ID: <CAMuHMdXf5Pao+Fjf42iRV_iMFEcb+F=s09NG+mudB-L5wWF_OA@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 Miaoqian Lin <linmq006@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Alain Volmat <alain.volmat@foss.st.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
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

Hi Maxime,

On Mon, Jun 19, 2023 at 4:02=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Jun 19, 2023 at 03:25:28PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jun 19, 2023 at 2:51=E2=80=AFPM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Mon, Jun 19, 2023 at 12:53:42PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > On Mon, Jun 19, 2023 at 11:45:37AM +0200, Maxime Ripard wrote:
> > > > > On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-K=C3=B6nig w=
rote:
> > > > > > On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > > > > > > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6n=
ig wrote:
> > > > > > > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wro=
te:
> > > > > > > > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=
=B6nig
> > > > > > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > > > > > Together with the patches that were applied later the t=
opmost commit
> > > > > > > > > > from this series is c2807ecb5290 ("drm/omap: Convert to=
 platform remove
> > > > > > > > > > callback returning void"). This commit was part for the=
 following next
> > > > > > > > > > tags:
> > > > > > > > > >
> > > > > > > > > >         $ git tag -l --contains c2807ecb5290
> > > > > > > > > >         next-20230609
> > > > > > > > > >         next-20230613
> > > > > > > > > >         next-20230614
> > > > > > > > > >         next-20230615
> > > > > > > > > >
> > > > > > > > > > However in next-20230616 they are missing. In next-2023=
0616
> > > > > > > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b9863928=
6700a35088660.
> > > > > > > > > > Compared to c2807ecb5290 this adds 1149 patches but dro=
ps 37 (that are
> > > > > > > > > > also not included with a different commit id). The 37 p=
atches dropped
> > > > > > > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5=
290:
> > > > > > > > > >
> > > > > > > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048f=
cb4384aa9dc..c2807ecb5290
> > > > > > > > > >              1  Christophe JAILLET
> > > > > > > > > >              2  Jessica Zhang
> > > > > > > > > >              5  Karol Wachowski
> > > > > > > > > >              1  Laura Nao
> > > > > > > > > >             27  Uwe Kleine-K=C3=B6nig
> > > > > > > > > >              1  Wang Jianzheng
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I guess this was done by mistake because nobody told me=
 about dropping
> > > > > > > > > > my/these patches? Can c2807ecb5290 please be merged int=
o drm-misc-next
> > > > > > > > > > again?
> > > > > > > > >
> > > > > > > > > Actually, it was probably a mistake that these patches go=
t merged to
> > > > > > > > > linuxnext during the 4 days that you noticed. However, yo=
ur patches
> > > > > > > > > aren't dropped and are still present in drm-misc-next.
> > > > > > > > >
> > > > > > > > > drm-misc has a bit of a unique model and it's documented =
fairly well here:
> > > > > > > > >
> > > > > > > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-mi=
sc.html
> > > > > > > >
> > > > > > > > Is there a flaw then in this unique model (or its implement=
ation) when
> > > > > > > > drm-misc/for-linux-next moves in a non-fast-forward manner?=
 This isn't
> > > > > > > > expected, is it?
> > > > > > >
> > > > > > > There's no expectation afaik. Any tree merged in linux-next c=
an be
> > > > > > > rebased, drop a patch, amend one, etc. without any concern.
> > > > > >
> > > > > > I agree that there are no rules broken for a tree that is inclu=
ded in
> > > > > > next and a maintainer is free to rewrite their tree independant=
 of the
> > > > > > tree being included in next.
> > > > > >
> > > > > > Still I think that shouldn't be used as an excuse.
> > > > >
> > > > > As an excuse for what?
> > > >
> > > > Just because the rules for trees in next allow the merged branch to=
 be
> > > > rewritten, shouldn't be used to justify rewriting the branch.
> > > >
> > > > IMHO you still should ensure that only commits make it into any nex=
t
> > > > snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
> > > > intend to be included in X-rc1.
> > >
> > > That's never been a next rule either. Rust support has been in next f=
or
> > > almost a year without being sent as a PR for example.
> >
> > https://elixir.bootlin.com/linux/latest/source/Documentation/process/2.=
Process.rst#L297
> >
> >    "The linux-next tree is, by design, a snapshot of what the mainline
> >     is expected to look like after the next merge window closes."
> >
> > The general rule for linux-next is that its contents are intended to en=
d
> > up in the next kernel release, and that it should not contain commits
> > that are intended for the next-next release, cfr. what Stephen sends
> > out to new trees:
> >
> >    "You will need to ensure that the patches/commits in your tree/serie=
s have
> >     been:
> >             [...]
> >          * destined for the current or next Linux merge window."
> >
> > and what he requests regularly in his announces, e.g.:
> >
> >    "Please do not add any v6.4 related commits to your linux-next inclu=
ded
> >     branches until after v6.3-rc1 has been released."
>
> Which is why those patches aren't in next anymore.

So why were they in linux-next before?
Was this a genuine mistake (things happen), or is there process
or tooling to improve?

> > AFAIU, the exception to the rule is new, self-contained, and sometimes
> > controversial development, which may have to cook for a few more cycles=
,
> > if it ends up in a PR at all.
> >
> > > > > > For me, if a maintainer puts some patch into next that's a stat=
ement
> > > > > > saying (approximately) "I think this patch is fine and I intend=
 to
> > > > > > send it to Linus during the next merge window.".
> > > > >
> > > > > I mean, that's what we're saying and doing?
> > > >
> > > > No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (=
as it
> > > > was part of next-20230609). A few days later however the patches we=
re
> > > > dropped.
> > > >
> > > > The two options that would have made the experience smoother for me=
 are:
> > > >
> > > >  a) keep c2807ecb5290 in next and send it for v6.5-rc1; or
> > >
> > > That's not an option. You were simply too late for v6.5-rc1, unless y=
ou
> > > expect us to get rid of timezones and work on week-ends. But surely y=
ou
> > > don't.
> >
> > I don't think anyone expects you to do that...
> >
> > > >  b) keep c2807ecb5290 in a branch that doesn't result it entering n=
ext
> > > >     before v6.5-rc1.
> > >
> > > All the drm-misc committers use dim. If that's a concern for you, fee=
l
> > > free to send a patch addressing this to dim.
> >
> > So you say this is an issue with the tooling? ;-)
> > If the tooling breaks the rules, perhaps the tooling should be fixed?
>
> We've been using dim for more than 5 years. It doesn't seem to work too b=
ad?

I don't know anything about dim, so I cannot commit on that.

> And it does feel like the goalposts are moving there: the discussion
> started by "you shouldn't rebase a tree" and is now at "patches should
> never be in a next branch if they can't reach the next merge window,
> even though it's not apparent yet"

There is no such anti-rebasing rule for linux-next.
Some branches and some subsystems do have a non-rebasing rule,
but that's not applicable here, AFAIU.

Besides, won't you have to rebase the remaining commits from
drm-misc-next on top of v6.5-rc1 anyway later?

> But yeah, I now that complaining about how much drm-misc sucks is fun
> and all, but it's still not clear to me what a potential solution to
> this would be?

I'm so glad I'm not the one making personal attacks on drm-misc ;-)

> Knowing that we can't rebase or close drm-misc-next, and that it should
> be automated in dim somehow, what would that fix be?

Again, I don't know what dim does.
But I think the solution involves not merging anything in drm-next
if there is reason to believe it won't make the next merge window
(in this case: when it is applied to drm-misc-next after the cut-off point)=
.

Personally, I use foo-for-vX.Y branches.  Despite some of my
foo-for-v6.6 branches already having new commits, I just hold off
merging any of them in a for-next branch until after v6.5-rc1.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
