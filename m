Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB119F2CA0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CA510E549;
	Mon, 16 Dec 2024 09:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="HZq04+ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14CD10E549
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bUiHe4Qn1i6vcEIv1EhyIUEpJIZINJxDWotkRPJwW4A=; b=HZq04+ev4NMsn0ngmTDuAcTY2i
 P+3kLn4K3obHdW4QelHxx5kkNXgaHUveDJ8HQuzIyYrmz0kzsKngknfX8sG5jgOuG6V4bE30xhrnB
 kX7XshIWUBSObLsiYxyOezA0YIOwYzaSfBOzIEjV9eWicwlUNbboKGAZZ/ZK2O8n8/P3+WXi/fE9c
 tiaM6Ctwk0SMStcfMaUL1KRkpvqLtvroX7ILA+5encAR45NEZySnCPq+Qd6AYJJIYwhTx7+VYoXJB
 OflPvto6piPMC+OokZKDnHNL6M+41MqI4/o1FB1xFVD5FlE2y10+jQKQYGkfUZpzL04HJwIvmgvGh
 XKpk3t6Q==;
Received: from i5e86190a.versanet.de ([94.134.25.10] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tN78t-0003mo-Uy; Mon, 16 Dec 2024 10:11:55 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 03/11] drm/rockchip: analogix_dp: Add support for RK3588
Date: Mon, 16 Dec 2024 10:11:54 +0100
Message-ID: <4395748.ejJDZkT8p0@diego>
In-Reply-To: <gwogudb5vae7wu452zwuqmdlyaibenoso4f5pjmu3uttckhy2w@shndol4mz5n4>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-4-damon.ding@rock-chips.com>
 <gwogudb5vae7wu452zwuqmdlyaibenoso4f5pjmu3uttckhy2w@shndol4mz5n4>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Montag, 16. Dezember 2024, 09:57:41 CET schrieb Dmitry Baryshkov:
> On Mon, Dec 16, 2024 at 11:12:17AM +0800, Damon Ding wrote:
> > RK3588 integrates the analogix eDP 1.3 TX controller IP and the HDMI/eDP
> > TX Combo PHY based on a Samsung IP block, and there are also two
> > independent eDP display interface on RK3588 Soc.
> > 
> > Add just the basic support for now, i.e. RGB output up to 4K@60Hz, without
> > the tests of audio, PSR and other eDP 1.3 specific features.
> > 
> > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > 
> > ---
> > 
> > Changes in v2:
> > - Add support for the other eDP output edp1
> > ---
> >  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 82 ++++++++++++++++---
> >  include/drm/bridge/analogix_dp.h              |  3 +-
> >  2 files changed, 74 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > index 871606a31ef1..4c9a55776ada 100644
> > --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > @@ -51,10 +51,12 @@ struct rockchip_grf_reg_field {
> >  /**
> >   * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
> >   * @lcdc_sel: grf register field of lcdc_sel
> > + * @edp_mode: grf register field of edp_mode
> >   * @chip_type: specific chip type
> >   */
> >  struct rockchip_dp_chip_data {
> >  	const struct rockchip_grf_reg_field lcdc_sel;
> > +	const struct rockchip_grf_reg_field edp_mode;
> >  	u32	chip_type;
> >  };
> >  
> > @@ -134,12 +136,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
> >  		return ret;
> >  	}
> >  
> > +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
> > +	if (ret != 0)
> > +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
> 
> Is it to be called for non-eDP hosts too? Or for older hosts?

The implementation of rockchip_grf_field_write (in patch1) seems to
take care of checking if that field actually exists and doing nothing if
not.

I think eDP/DP is more a naming thing, the Analogix controller is called
an eDP controller in all documentation things.

Even back on rk3288, the Analogix-DP, still is called an eDP controller in
documentation, with the only difference being that it does not contain
another additional "dedicated" DP controller

> > @@ -396,6 +425,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
> >  	const struct rockchip_dp_chip_data *dp_data;
> >  	struct drm_panel *panel = NULL;
> >  	struct rockchip_dp_device *dp;
> > +	int id, i;
> >  	int ret;
> >  
> >  	dp_data = of_device_get_match_data(dev);
> > @@ -410,9 +440,22 @@ static int rockchip_dp_probe(struct platform_device *pdev)
> >  	if (!dp)
> >  		return -ENOMEM;
> >  
> > +	id = of_alias_get_id(dev->of_node, "edp");
> > +	if (id < 0)
> > +		id = 0;
> 
> Alias is not documented.

additionally, aliases should never be used to determine actual device
functionionality - e.g. the hw-device-number

> Please check how other platforms handle device -> ID conversion and
> consider following it (yes, the best option currently known is to
> hardcode bus addresses into the driver data).

see for example the dw-dsi + dw-dsi2 for existing implementations.



> > +	i = 0;
> > +	while (is_rockchip(dp_data[i].chip_type))
> > +		i++;
> > +
> > +	if (id >= i) {
> > +		DRM_DEV_ERROR(dev, "invalid edp id: %d\n", id);
> > +		return -ENODEV;
> > +	}
> 
> Is it applicable to non-eDP case?

same as above, it's always called eDP in all pieces of documentation,
(Compliant with DP 1.2 and eDP 1.3)

Heiko

> > +
> >  	dp->dev = dev;
> >  	dp->adp = ERR_PTR(-ENODEV);
> > -	dp->data = dp_data;
> > +	dp->data = &dp_data[id];
> >  	dp->plat_data.panel = panel;
> >  	dp->plat_data.dev_type = dp->data->chip_type;
> >  	dp->plat_data.power_on = rockchip_dp_poweron;
> > @@ -464,19 +507,38 @@ static int rockchip_dp_resume(struct device *dev)
> >  static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
> >  		rockchip_dp_resume, NULL);
> >  
> > -static const struct rockchip_dp_chip_data rk3399_edp = {
> > -	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> > -	.chip_type = RK3399_EDP,
> > +static const struct rockchip_dp_chip_data rk3399_edp[] = {
> > +	{
> > +		.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> > +		.chip_type = RK3399_EDP,
> > +	},
> > +	{ /* sentinel */ }
> > +};
> > +
> > +static const struct rockchip_dp_chip_data rk3288_dp[] = {
> > +	{
> > +		.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> > +		.chip_type = RK3288_DP,
> > +	},
> > +	{ /* sentinel */ }
> >  };
> >  
> > -static const struct rockchip_dp_chip_data rk3288_dp = {
> > -	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> > -	.chip_type = RK3288_DP,
> > +static const struct rockchip_dp_chip_data rk3588_edp[] = {
> > +	{
> > +		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
> > +		.chip_type = RK3588_EDP,
> > +	},
> > +	{
> > +		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
> > +		.chip_type = RK3588_EDP,
> > +	},
> > +	{ /* sentinel */ }
> >  };
> >  
> >  static const struct of_device_id rockchip_dp_dt_ids[] = {
> >  	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
> >  	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
> > +	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> > diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> > index 6002c5666031..54086cb2d97d 100644
> > --- a/include/drm/bridge/analogix_dp.h
> > +++ b/include/drm/bridge/analogix_dp.h
> > @@ -15,11 +15,12 @@ enum analogix_dp_devtype {
> >  	EXYNOS_DP,
> >  	RK3288_DP,
> >  	RK3399_EDP,
> > +	RK3588_EDP,
> >  };
> >  
> >  static inline bool is_rockchip(enum analogix_dp_devtype type)
> >  {
> > -	return type == RK3288_DP || type == RK3399_EDP;
> > +	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
> >  }
> >  
> >  struct analogix_dp_plat_data {
> 
> 




