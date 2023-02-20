Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FA569C865
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 11:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67DA10E1BB;
	Mon, 20 Feb 2023 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1488210E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676888206; x=1708424206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2F6wQMWsfMZl9xIjqvGFKN23H5UpqXNa5nAwW2/Rdc0=;
 b=KZ9y4igNKQxvO5EGwLc9TBCkpUrRQrlG1hDAxnYYUd/H+V4r63LVdDvP
 OvbUhhHvAuN7jeg8iLlPevNCrdFVR2ibZPokNpoqvM7RcnQ9ADtXDrFwq
 lwfxaldRUwEnNNZziMWLpF6yN48REkGHFQRDgwH2imxSveMSEF/kK3jJt
 8dz4qeIJu31jRSq5HnRZwFvGf7RDFR1KxQAEihwQetelAWtBZOJYTPqFF
 UfzPEHEKz3v9vHS62QSOYEBddqoVMslkPaJgOoa8Ba1/H+lq8yIE4OhvN
 vVk8ODs5+POzy9ZaPMAmQn/QMSlCXu2/09JUZ24f5nDQMluh7iO5dYa2/ w==;
X-IronPort-AV: E=Sophos;i="5.97,312,1669071600"; d="scan'208";a="29185203"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 20 Feb 2023 11:16:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 20 Feb 2023 11:16:44 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 20 Feb 2023 11:16:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676888204; x=1708424204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2F6wQMWsfMZl9xIjqvGFKN23H5UpqXNa5nAwW2/Rdc0=;
 b=hQX2B1BC4M5+8xuLPP1XvPAEpGcCMxy6sbsuJkW7RMkwNLBFqVqxPdMB
 InQVwdCba3lYOuzoEkmbjE0abajWqPLHZuy7egr7gVU4xhRHle5Yq2NYp
 60dycR/H3SoA6umQT0QdR6zDtaRASeBknal4t2byDs4VyxvuHPpgDqkQr
 9mSvc13GrmEwN0CHFBZgzkAedq83Yz1EYirCrhvwPgXubrUN58u661RYA
 +CrSQWmhI9C0IRh0uoJaXjAILf3qbo9aGBDXccdGNc/ygwW3mCKcUGL+5
 wIriCCN50TG/ut+7uvhYGEkqcbOdS0DPukOlNdWtz+FQ7Pcv5f896SvU2 w==;
X-IronPort-AV: E=Sophos;i="5.97,312,1669071600"; d="scan'208";a="29185202"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 20 Feb 2023 11:16:44 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AD3D9280056;
 Mon, 20 Feb 2023 11:16:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v4 0/6] drm: lcdif: Add i.MX93 LCDIF support
Date: Mon, 20 Feb 2023 11:16:41 +0100
Message-ID: <2871322.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2135575.irdbgypaU6@steina-w>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
 <52b8025ee9b71dfb147127bd1cb2c532d222df3c.camel@nxp.com>
 <2135575.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org, LW@karo-electronics.de,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Am Montag, 20. Februar 2023, 09:55:19 CET schrieb Alexander Stein:
> Hi Liu,
>=20
> Am Freitag, 17. Februar 2023, 09:59:14 CET schrieb Liu Ying:
> > On Fri, 2023-02-17 at 09:18 +0100, Alexander Stein wrote:
> > > Hi Liu,
> >=20
> > Hi Alexander,
> >=20
> > > Am Freitag, 17. Februar 2023, 07:54:01 CET schrieb Liu Ying:
> > > > Hi,
> > > >=20
> > > > This patch set aims to add i.MX93 LCDIF display controller support
> > > > in the existing LCDIF DRM driver.  The LCDIF embedded in i.MX93 SoC
> > > > is essentially the same to those embedded in i.MX8mp SoC.  Through
> > > > internal bridges, i.MX93 LCDIF may drive a MIPI DSI display or a LV=
DS
> > > > display or a parallel display.
> > > >=20
> > > > Patch 1/6 adds device tree binding support for i.MX93 LCDIF in the
> > > > existing fsl,lcdif.yaml.
> > > >=20
> > > > Patch 2/6 drops lcdif->bridge NULL pointer check as a cleanup patch.
> > > >=20
> > > > Patch 3/6~5/6 prepare for adding i.MX93 LCDIF support step by step.
> > > >=20
> > > > Patch 6/6 adds i.MX93 LCDIF compatible string as the last step of
> > > > adding i.MX93 LCDIF support.
> > >=20
> > > Thanks for the series. I could test this on my TQMa93xxLA/MBa93xxCA w=
ith
> > > a
> > > single LVDS display attached, so no DSI or parallel display. Hence I
> > > could
> > > not test the bus format and flags checks, but they look okay.
> > > So you can add
> > > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > to the whole series as well.
> >=20
> > Thanks for your test.
> >=20
> > > One thing I noticed is that, sometimes it seems that before probing
> > > lcdif
> > > my system completely freezes. Adding some debug output it seems that's
> > > during powering up the IMX93_MEDIABLK_PD_LCDIF power domain there is
> > > some
> > > race condition. But adding more more detailed output made the problem=
 go
> > > away. Did you notice something similar? It might be a red hering thou=
gh.
> >=20
> > I don't see system freezing with my i.MX93 11x11 EVK when probing
> > lcdif. I did try to boot the system several times. All look ok. This is
> > a snippet of dmesg when lcdif probes:
> >=20
> > --------------------------8<------------------------------------------
> > [    0.753083] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> > [    0.761669] SuperH (H)SCI(F) driver initialized
> > [    0.766523] msm_serial: driver initialized
> > [    0.780523] printk: console [ttyLP0] enabled0x44380010 (irq =3D 16,
> > base_baud =3D 1500000) is a FSL_LPUART
> > [    0.780523] printk: console [ttyLP0] enabled
> > [    0.788928] printk: bootconsole [lpuart32] disabled
> > [    0.788928] printk: bootconsole [lpuart32] disabled
> > [    0.804632] panel-simple lvds_panel: supply power not found, using
> > dummy regulator
> > [    0.814741] [drm] Initialized imx-lcdif 1.0.0 20220417 for
> > 4ae30000.lcd-controller on minor 0
> > [    1.195930] Console: switching to colour frame buffer device 160x50
> > [    1.218385] imx-lcdif 4ae30000.lcd-controller: [drm] fb0: imx-
> > lcdifdrmfb frame buffer device
> > [    1.227099] cacheinfo: Unable to detect cache hierarchy for CPU 0
> > [    1.236725] loop: module loaded
> > --------------------------8<------------------------------------------
> >=20
> > ~300 milliseconds are consumed by the enablement delay required by the
> > "boe,ev121wxm-n10-1850" LVDS panel I use.
>=20
> It seems you have the drivers compiled in. I use modules in my case and
> simple-panel as well. But this is unrelated, because lcdif_probe() is yet=
 to
> be called. Using the debug diff from below I get the following output:
>=20
> [   16.111197] imx93-blk-ctrl 4ac10000.system-controller:
> imx93_blk_ctrl_power_on: 1
> [   16.122491] imx93-blk-ctrl 4ac10000.system-controller:
> imx93_blk_ctrl_power_on: 2
> [   16.137766] imx93-blk-ctrl 4ac10000.system-controller:
> imx93_blk_ctrl_power_on: 3
> [   16.154905] imx93-blk-ctrl 4ac10000.system-controller:
> imx93_blk_ctrl_power_on: 4
>=20
> It seems setting BLK_CLK_EN blocks the whole system, even reading is not
> possible. I don't have any details on the hardware, but it seems that eit=
her
> some clock or power domain is not enabled. This can also happen if I'm
> loading the lcdif module manually after boot. But I can't detect any
> differences in / sys/kernel/debug/clk/clk_summary.

I think I found the cause. It's the maximum clock frequency for media_axi a=
nd=20
media_apb. These clocks were not explicitly configured, most probably=20
exceeding the maximum frequency allowed.

Best regards,
Alexander

> ---8<---
> diff --git a/drivers/soc/imx/imx93-blk-ctrl.c b/drivers/soc/imx/imx93-blk-
> ctrl.c
> index 2c600329436cf..50aeb20ce90dc 100644
> --- a/drivers/soc/imx/imx93-blk-ctrl.c
> +++ b/drivers/soc/imx/imx93-blk-ctrl.c
> @@ -129,12 +129,14 @@ static int imx93_blk_ctrl_power_on(struct
> generic_pm_domain *genpd)
>  	struct imx93_blk_ctrl *bc =3D domain->bc;
>  	int ret;
>=20
> +	dev_info(bc->dev, "%s: 1\n", __func__);
>  	ret =3D clk_bulk_prepare_enable(bc->num_clks, bc->clks);
>  	if (ret) {
>  		dev_err(bc->dev, "failed to enable bus clocks\n");
>  		return ret;
>  	}
>=20
> +	dev_info(bc->dev, "%s: 2\n", __func__);
>  	ret =3D clk_bulk_prepare_enable(data->num_clks, domain->clks);
>  	if (ret) {
>  		clk_bulk_disable_unprepare(bc->num_clks, bc->clks);
> @@ -142,6 +144,7 @@ static int imx93_blk_ctrl_power_on(struct
> generic_pm_domain *genpd)
>  		return ret;
>  	}
>=20
> +	dev_info(bc->dev, "%s: 3\n", __func__);
>  	ret =3D pm_runtime_get_sync(bc->dev);
>  	if (ret < 0) {
>  		pm_runtime_put_noidle(bc->dev);
> @@ -149,11 +152,15 @@ static int imx93_blk_ctrl_power_on(struct
> generic_pm_domain *genpd)
>  		goto disable_clk;
>  	}
>=20
> +	dev_info(bc->dev, "%s: 4\n", __func__);
> +
>  	/* ungate clk */
>  	regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +	dev_info(bc->dev, "%s: 5\n", __func__);
>=20
>  	/* release reset */
>  	regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> +	dev_info(bc->dev, "%s: 6\n", __func__);
>=20
>  	dev_dbg(bc->dev, "pd_on: name: %s\n", genpd->name);
>=20
>=20
> ---8<---
>=20
> Best regards,
> Alexander
>=20
> > Regards,
> > Liu Ying
> >=20
> > > Best regards,
> > > Alexander
> > >=20
> > > > v3->v4:
> > > > * Improve warning message when ignoring invalid LCDIF OF endpoint i=
ds
> > > > in
> > > >=20
> > > >   patch 5/6. (Alexander)
> > > >=20
> > > > * Use 'new_{c,p}state' instead of 'new_{crtc,plane}_state' in patch
> > > > 3/6.
> > > >=20
> > > >   (Alexander)
> > > >=20
> > > > * Simplify lcdif_crtc_reset() by calling
> > > > lcdif_crtc_atomic_destroy_state()
> > > >=20
> > > >   in patch 3/6. (Alexander)
> > > >=20
> > > > * Add '!crtc->state' check in lcdif_crtc_atomic_duplicate_state() in
> > > > patch
> > > > 3/6. (Alexander)
> > > > * Collect Alexander's R-b tags on patch 1/6, 2/6 and 6/6.
> > > >=20
> > > > v2->v3:
> > > > * Fix a trivial typo in patch 6/6's commit message.
> > > >=20
> > > > v1->v2:
> > > > * Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
> > > > * Split patch 2/2 in v1 into patch 2/6~6/6 in v2. (Marek, Alexander)
> > > > * Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
> > > > * Add comment on the 'base' member of lcdif_crtc_state structure to
> > > >=20
> > > >   note it should always be the first member. (Lothar)
> > > >=20
> > > > * Drop unneeded 'bridges' member from lcdif_drm_private structure.
> > > > * Drop a comment about bridge input bus format from
> > > > lcdif_crtc_atomic_check().
> > > >=20
> > > > Liu Ying (6):
> > > >   dt-bindings: lcdif: Add i.MX93 LCDIF support
> > > >   drm: lcdif: Drop unnecessary NULL pointer check on lcdif->bridge
> > > >   drm: lcdif: Determine bus format and flags in ->atomic_check()
> > > >   drm: lcdif: Check consistent bus format and flags across first
> > > >   bridges
> > > >   drm: lcdif: Add multiple encoders and first bridges support
> > > >   drm: lcdif: Add i.MX93 LCDIF compatible string
> > > > =20
> > > >  .../bindings/display/fsl,lcdif.yaml           |   7 +-
> > > >  drivers/gpu/drm/mxsfb/lcdif_drv.c             |  71 ++++++-
> > > >  drivers/gpu/drm/mxsfb/lcdif_drv.h             |   5 +-
> > > >  drivers/gpu/drm/mxsfb/lcdif_kms.c             | 198
> > > >  ++++++++++++------
> > > >  4 files changed, 206 insertions(+), 75 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


