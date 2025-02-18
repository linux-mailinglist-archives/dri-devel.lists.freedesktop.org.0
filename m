Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8137EA3A07D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FAF10E711;
	Tue, 18 Feb 2025 14:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="yCHNif8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B50C10E711
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0vWS+jJLGaUznhkUfulRmF74wnw6+simbpz7/+3zlNU=; b=yCHNif8/OzKbJ8qOOHLZC7ehTA
 zdS8Ay0sBcb8JU2WO/UQqqsK68gdfuNU0GOadhvfFzsvvbJjgwWUmCPjoLBXYXVCfWkAClMQ2hCMv
 PdJk1AYucpPORfkt3caFGB1hO1/Ovl8P1W76OSLXbFRg+M0bSYTBSMcERhZDq2L5JXKU6AM/yoWUU
 uTEM13NnKraf0E1QhGoPLP8LWNWELxhHs2WsPUkU9IuxgXJeHVDfBeueJ58YMIcabdv8YFa0LEgO0
 6BUKBEGgN2ODQLuuVe4eto3M4Ba5Xjz4DZ7My9cqydE6khcMBrsiN1XNbTA8LYu8hQEmet7cmoGAW
 R4NEnpzg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tkOyB-0005uw-A9; Tue, 18 Feb 2025 15:53:07 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Date: Tue, 18 Feb 2025 15:53:06 +0100
Message-ID: <2425191.NG923GbCHz@diego>
In-Reply-To: <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
References: <1919367.CQOukoFCf9@diego>
 <20250218121749.1382322-1-liujianfeng1994@gmail.com>
 <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Dienstag, 18. Februar 2025, 15:13:07 MEZ schrieb Sebastian Reichel:
> Hi,
>=20
> On Tue, Feb 18, 2025 at 08:17:46PM +0800, Jianfeng Liu wrote:
> > On Tue, 18 Feb 2025 11:00:57 +0100, Heiko St=C3=BCbnerwrote:
> > >So I guess step1, check what error is actually returned.
> >=20
> > I have checked that the return value is -517:
> >=20
> > rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy=
1 with -517
> >=20
> > >Step2 check if clk_get_optional need to be adapted or alternatively
> > >catch the error in the vop2 and set the clock to NULL ourself in that =
case.
> >=20
> > I tried the following patch to set the clock to NULL when clk_get_optio=
nal
> > failed with value -517, and hdmi0 is working now. There are also some
> > boards like rock 5 itx which only use hdmi1, I think we should also add
> > this logic to vop2->pll_hdmiphy0.
> >=20
> > @@ -3733,6 +3751,15 @@ static int vop2_bind(struct device *dev, struct =
device *master, void *data)
> >  		return PTR_ERR(vop2->pll_hdmiphy0);
> >  	}
> > =20
> > +	vop2->pll_hdmiphy1 =3D devm_clk_get_optional(vop2->dev, "pll_hdmiphy1=
");
> > +	if (IS_ERR(vop2->pll_hdmiphy1)) {
> > +		drm_err(vop2->drm, "failed to get pll_hdmiphy1 with %d\n", vop2->pll=
_hdmiphy1);
> > +		if (vop2->pll_hdmiphy1 =3D=3D -EPROBE_DEFER)
> > +			vop2->pll_hdmiphy1 =3D NULL;
> > +		else
> > +			return PTR_ERR(vop2->pll_hdmiphy1);
> > +	}
> > +
>=20
> This first of all shows, that we should replace drm_err in this
> place with dev_err_probe(), which hides -EPROBE_DEFER errors by
> default and instead captures the reason for /sys/kernel/debug/devices_def=
erred.
>=20
> Second what you are doing in the above suggestion will break kernel
> configurations where VOP is built-in and the HDMI PHY is build as a
> module.
>=20
> But I also think it would be better to have the clocks defined in the
> SoC level DT. I suppose that means vop2_bind would have to check if
> the HDMI controller <ID> is enabled and only requests pll_hdmiphy<ID>
> based on that. Considering there is the OF graph pointing from VOP
> to the enabled HDMI controllers, it should be able to do that.


I was more thinking about fixing the correct thing, with something like:

=2D---------- 8< ----------
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index cf7720b9172f..50faafbf5dda 100644
=2D-- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5258,6 +5258,10 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *c=
lkspec)
        if (!clkspec)
                return ERR_PTR(-EINVAL);

+       /* Check if node in clkspec is in disabled/fail state */
+       if (!of_device_is_available(clkspec->np))
+               return ERR_PTR(-ENOENT);
+
        mutex_lock(&of_clk_mutex);
        list_for_each_entry(provider, &of_clk_providers, link) {
                if (provider->node =3D=3D clkspec->np) {
=2D---------- 8< ----------

Because right now the clk framework does not handle nodes in
failed/disabled state and would defer indefinitly.



