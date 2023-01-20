Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B445675DAE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAD610E39A;
	Fri, 20 Jan 2023 19:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FACA10E398
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 19:10:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7A66F581F44;
 Fri, 20 Jan 2023 14:10:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 20 Jan 2023 14:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674241816; x=
 1674249016; bh=cNlI+KksvzptdXxI5ZVjZOHaj/EyWoi9wHcmf+pWjtc=; b=a
 WDTKvVN630dAa5rdSPz5O7/evgDoc4cu+i+0fZWz7TqFRvrX0gS1JwcuMapyu5xi
 kqQeVsbyRfkALu5MP2CxOcUeoliT7QCBXG29GaH3ueeNkKXP1GbtP81tkrbLTTNf
 pbIjbDJzsi4R6GEgBqLZUInJrPiach47gvSglUOUQFn+ZaJYlLbcT88Ga2Y4fJWz
 pdtTOb4DuCW/Ww0o5MXncRJ6n+oQY/FpJO6yDzb4Yc2DWJNM0E8Vbm4YYL6pEI24
 XFk+3xTXD7tA9V54wCqzsmCZcAurxfasFDMR02e6ZrcqyFEg6IiO/1CS250lRQBL
 0zFxrbqa/ryssfTFDLbKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674241816; x=
 1674249016; bh=cNlI+KksvzptdXxI5ZVjZOHaj/EyWoi9wHcmf+pWjtc=; b=N
 V06uTaOXRmY5n2IPNNBx60U9Q130vUJaVsiP5H4oXqDOaqh+PCBRVvh+ZsTkjCZq
 oFrcqqBWPxaUTAo9shy35U7wlaxY2VA4LWdUdSA6rvEjvh9pVfshPx3xWjKq3F+K
 fml9Uoa3+RfLwgKkQalgrYr9FYlMNoTmWDEVQeX5lJDYeGmAFuWoV+g5RbfdGi0c
 GklhRqYUU4PY64RELAhvo6AdvvPFNBgluRBQIUV7ABu4y6VauVvyQdHsjzKwTR4R
 vfhlKLSc0WGhVBQY53Ak7luvSOEMO7flWX0Pm7gKvmgsTQBPyrZXWFdI5rSEqip9
 uIPQmLFehli+mLe0pFdMA==
X-ME-Sender: <xms:FufKY8ABQRIDSzLRt-p7OgxUskY00-qAJbNuMfWP8dcifGOnHp5tcQ>
 <xme:FufKY-haNpLIbydb3AxVsGCl7eIK025cO5l207rVpvVGWe5EuV4v-AK95xGVUyNo6
 vAHR6Q1idBtbeSQ9r8>
X-ME-Received: <xmr:FufKY_l8EQyKWeEXJj3O40i2YaW00nNNty7ajD7iac3IbJeNBRGiKgqrZxpVzCpa6V2FWrEbAX3G3W7T_QQWif_uPaIStg0_zCwcMhHkHaPLPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefhuddvjeelhfetteffvdfgueehvdeugefgteehiefhkeetffdttdei
 ffdvtdeuheenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhfrhgvvgguvghskhhtoh
 hprdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:F-fKYyxYKUIYITVPw3V1LYhVrIVzNubtnulWiYH3QWguosfRieCFMQ>
 <xmx:F-fKYxTXpf1s_8mQYea_FW4HC3KogWduPd0FPD3v88gNu342wheBTA>
 <xmx:F-fKY9YnLx7eMp8vzOPnrNwA3lqt4oJZ6pF_UjjrDhkyRZgLUc4W1Q>
 <xmx:GOfKYxjU9VtTvfgoOPyadpihu5ZSv8kcIbHM0qFV_mYTQcNtt43Kzw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jan 2023 14:10:14 -0500 (EST)
Date: Fri, 20 Jan 2023 20:10:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Message-ID: <20230120191011.4ehxgxbpyvliye63@houat>
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
 <CAHCN7xL1qqhFkroBUswpSyTGUFo6B26rmp0zRL2K8ATT4HtUGg@mail.gmail.com>
 <449d03be-226f-9a90-aff3-8afee68c346d@denx.de>
 <4207863.mogB4TqSGs@steina-w>
 <8172fbfd-a1b9-bfca-983d-b97a1f9560da@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8172fbfd-a1b9-bfca-983d-b97a1f9560da@denx.de>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 04:08:47PM +0100, Marek Vasut wrote:
> On 1/3/23 11:59, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Sonntag, 18. Dezember 2022, 23:28:20 CET schrieb Marek Vasut:
> > > On 12/18/22 23:24, Adam Ford wrote:
> > > > On Sat, Dec 17, 2022 at 10:33 PM Marek Vasut <marex@denx.de> wrote:
> > > > > On 12/18/22 05:23, Adam Ford wrote:
> > > > > > On Sat, Dec 17, 2022 at 5:56 PM Marek Vasut <marex@denx.de> wro=
te:
> > > > > > > On 12/16/22 14:25, Alexander Stein wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > [...]
> > > > > > >=20
> > > > > > > > Oh, nice, thanks for the pointer. When setting
> > > > > > > >=20
> > > > > > > > > samsung,burst-clock-frequency =3D <668250000>;
> > > > > > > >=20
> > > > > > > > in imx8mm.dtsi
> > > > > > > > I get a non-flickering display using 4 lanes. Although admi=
ttedly this
> > > > > > > > is just random guessing. I'm not sure which clock exactly h=
as to be
> > > > > > > > in the range CHA_DSI_CLK_RANGE is configured to. With 4 lan=
es
> > > > > > > > SN65DSI84 is configured for>>>>>
> > > > > > > > 205-210 MHz (0x29), while I get these PLL PMS settings on D=
SIM:
> > > > > > > > > samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99=
, s 0)
> > > > > > > > > samsung-dsim 32e10000.dsi: hs_clk =3D 668250000, byte_clk=
 =3D 83531250,
> > > > > > > > > esc_clk
> > > > > > > >=20
> > > > > > > > =3D 16706250
> > > > > > >=20
> > > > > > > If I recall it right, minimum PLL frequency is:
> > > > > > >=20
> > > > > > > fPMS=3D1.2*width*height*bpp*fps=3D1.2*800*480*24*60=3D663.5 M=
Hz
> > > > > > >=20
> > > > > > > the link frequency is then
> > > > > > >=20
> > > > > > > fHS=3DfPMS/lanes/2=3D82.9 MHz (on the DDR clock lane)
> > > > > > >=20
> > > > > > > So DSI83 should be in the range of 80..85 MHz input clock if I
> > > > > > > calculate
> > > > > > > this right. Can you check what is the value of mode->clock, t=
he
> > > > > > > mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes =
in dsi83
> > > > > > > sm65dsi83_get_dsi_range() ?
> > > > > > >=20
> > > > > > > > AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_=
clk just
> > > > > > > > from DT
> > > > > > > > properties, while SN65DSI84 is using display mode and numbe=
r of lanes.
> > > > > > > >=20
> > > > > > > > Is it expected that the DSIM PLL frequencies are set in DT =
for a
> > > > > > > > specific
> > > > > > > > bridge/display setup?
> > > > > > >=20
> > > > > > > No, there should be negotiation between the host and bridge/p=
anel, I
> > > > > > > tried to propose two variants, but they were all rejected.
> > > > > >=20
> > > > > > For one of Jagan's previous revisions, I added some code to let=
 the
> > > > > > PHY auto adjust the frequencies instead of being fixed.  NXP ha=
d this
> > > > > > in their downstream kernel, but with this patch and another, I =
was
> > > > > > able to set a variety of pixel clocks from my HDMI monitor and =
my
> > > > > > DSI83. I haven't had time to re-base my work on Jagan's latest =
work,
> > > > > > but you can link to the patch I did for the older stuff here:
> > > > > >=20
> > > > > > https://github.com/aford173/linux/commit/e845274b0f22ba3b24813f=
fd6bb3cb8
> > > > > > 8ab4b67e4 and
> > > > > > https://github.com/aford173/linux/commit/3f90057eb608f96d106029=
ef6398134
> > > > > > 75241936f
> > > > > >=20
> > > > > > I've been traveling a lot lately, so I haven't had time to eval=
uate
> > > > > > his series, but I hope to get something like those re-based onc=
e the
> > > > > > DSI stuff has been accepted.
> > > > >=20
> > > > > I have these two attempts, both rejected:
> > > > >=20
> > > > > https://patchwork.freedesktop.org/patch/475207/
> > > > > https://patchwork.freedesktop.org/patch/496049/
> > > >=20
> > > > I have some patches re-based to Jagan's latest branch.  It doesn't
> > > > impact any drivers other than the new samsung-dsim driver, and it
> > > > doesn't touch any of the drm helper functions either.  It adjusts hs
> > > > clock based on the connected device.  I am not sure what the impact
> > > > will have on the attached Exynos devices, so I am expecting some
> > > > iterations.  Right now it's working with my DSI83 chip, but I need =
to
> > > > get it working with my adv7535 part as well.  On the older branch, I
> > > > was able to sync the ad7535 with a variety of resolutions using
> > > > different pixel clock rates.
> > > >=20
> > > > Once I get it working again with my adv7535 and cleaned up, I'll
> > > > submit the patches to the drm group, and I'll CC you, Jagan and Mar=
ek
> > > > Szyprowski with a reference to Jagan's series so people wanting to =
try
> > > > it can apply it to his branch.
> > >=20
> > > The negotiation has to happen between the host and the bridge/panel,
> > > otherwise you won't be able to support bridge/panel devices which
> > > require specific clock rate on the DSI. Only the bridge/panel driver
> > > knows about such requirement.
> >=20
> > AFAICS using Adam's patch the dynamic DPHY config is done in atomic_pre=
_enable
> > callback. So at this point the negotiation has to be finished already.
> > Wouldn't it be possible to setup 'dsi->format' within a atomic_check for
> > samsung_dsim? But I don't know how you would get the expected clock fre=
quency
> > from the downward bridge.

I have zero context there, so I'm not sure what proposals have been made
already, but why isn't it possible to do it the other way around and
make the bridge ask the upstream driver if it can provide the clock
frequency the bridge require?

It's pretty much how the common clock framework works too: you set the
rate on the leaf clock, and it propagates upwards in your tree,
adjusting for any constraint we have along the way.

It does need to happen at atomic_check time though, otherwise it would
be terrible for anyone attempting to use that driver.

Maxime
