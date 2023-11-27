Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E677FA24D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0D610E2BA;
	Mon, 27 Nov 2023 14:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB63C10E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 14:17:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cQd-0008RP-9s; Mon, 27 Nov 2023 15:17:39 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cQc-00Bxr0-12; Mon, 27 Nov 2023 15:17:38 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cQb-00471t-UZ; Mon, 27 Nov 2023 15:17:37 +0100
Date: Mon, 27 Nov 2023 15:17:37 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 06/12] drm/rockchip: vop2: rename grf to sys_grf
Message-ID: <20231127141737.GG977968@pengutronix.de>
References: <20231122125316.3454268-1-andyshrk@163.com>
 <20231122125454.3454671-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122125454.3454671-1-andyshrk@163.com>
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

On Wed, Nov 22, 2023 at 08:54:54PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The vop2 need to reference more grf(system grf, vop grf, vo0/1 grf,etc)
> in the upcoming rk3588.
> 
> So we rename the current system grf to sys_grf.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index b32a291c5caa..4bcc405bcf11 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -190,7 +190,7 @@ struct vop2 {
>  	void __iomem *regs;
>  	struct regmap *map;
>  
> -	struct regmap *grf;
> +	struct regmap *sys_grf;
>  
>  	/* physical map length of vop2 register */
>  	u32 len;
> @@ -1503,9 +1503,9 @@ static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
>  		dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
>  		dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
>  		if (polflags & POLFLAG_DCLK_INV)
> -			regmap_write(vop2->grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
> +			regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
>  		else
> -			regmap_write(vop2->grf, RK3568_GRF_VO_CON1, BIT(3 + 16));
> +			regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16));
>  		break;
>  	case ROCKCHIP_VOP2_EP_HDMI0:
>  		die &= ~RK3568_SYS_DSP_INFACE_EN_HDMI_MUX;
> @@ -2764,7 +2764,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  			return PTR_ERR(vop2->lut_regs);
>  	}
>  
> -	vop2->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
> +	vop2->sys_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
>  
>  	vop2->hclk = devm_clk_get(vop2->dev, "hclk");
>  	if (IS_ERR(vop2->hclk)) {
> -- 
> 2.34.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
