Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4470B7F9E66
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B34F10E234;
	Mon, 27 Nov 2023 11:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF9510E234
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:19:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7ZeO-0000ed-Kg; Mon, 27 Nov 2023 12:19:40 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1r7ZeL-00BvgR-89; Mon, 27 Nov 2023 12:19:37 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7ZeL-00459o-52; Mon, 27 Nov 2023 12:19:37 +0100
Date: Mon, 27 Nov 2023 12:19:37 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 10/12] drm/rockchip: vop2: Add support for rk3588
Message-ID: <20231127111937.GW3359458@pengutronix.de>
References: <20231122125316.3454268-1-andyshrk@163.com>
 <20231122125544.3454918-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122125544.3454918-1-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Looks good overall, two small things inside.

On Wed, Nov 22, 2023 at 08:55:44PM +0800, Andy Yan wrote:
>  
> +#define vop2_output_if_is_hdmi(x)	(x == ROCKCHIP_VOP2_EP_HDMI0 || x == ROCKCHIP_VOP2_EP_HDMI1)
> +#define vop2_output_if_is_dp(x)		(x == ROCKCHIP_VOP2_EP_DP0 || x == ROCKCHIP_VOP2_EP_DP1)
> +#define vop2_output_if_is_edp(x)	(x == ROCKCHIP_VOP2_EP_EDP0 || x == ROCKCHIP_VOP2_EP_EDP1)
> +#define vop2_output_if_is_mipi(x)	(x == ROCKCHIP_VOP2_EP_MIPI0 || x == ROCKCHIP_VOP2_EP_MIPI1)
> +#define vop2_output_if_is_lvds(x)	(x == ROCKCHIP_VOP2_EP_LVDS0 || x == ROCKCHIP_VOP2_EP_LVDS1)
> +#define vop2_output_if_is_dpi(x)	(x == ROCKCHIP_VOP2_EP_RGB0)

Not that it matters in practice here, but you should add braces around
the x argument in the macros usage, i.e. ((x) == ROCKCHIP_VOP2_EP_RGB0)

> +static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
> +{
> +	struct vop2 *vop2 = vp->vop2;
> +	int dclk_core_div, dclk_out_div, if_pixclk_div, if_dclk_div;
> +	unsigned long clock;
> +	u32 die, dip, div, vp_clk_div, val;
> +
> +	clock = rk3588_calc_cru_cfg(vp, id, &dclk_core_div, &dclk_out_div,
> +				    &if_pixclk_div, &if_dclk_div);
> +	if (!clock)
> +		return 0;
> +
> +	vp_clk_div = FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_CORE_DIV, dclk_core_div);
> +	vp_clk_div |= FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_OUT_DIV, dclk_out_div);
> +
> +	die = vop2_readl(vop2, RK3568_DSP_IF_EN);
> +	dip = vop2_readl(vop2, RK3568_DSP_IF_POL);
> +	div = vop2_readl(vop2, RK3568_DSP_IF_CTRL);
> +
> +	switch (id) {
> +	case ROCKCHIP_VOP2_EP_HDMI0:
> +		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);

you should clear the bits of a mask before setting them again. The same
goes for several other bits modified in this switch/case.

> +		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
> +		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX;
> +		die |= RK3588_SYS_DSP_INFACE_EN_HDMI0 |
> +			    FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX, vp->id);
> +		val = rk3588_get_hdmi_pol(polflags);
> +		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 1, 1));
> +		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0, HIWORD_UPDATE(val, 6, 5));
> +		break;

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
