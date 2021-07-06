Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D158E3BC484
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 03:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ED7896F7;
	Tue,  6 Jul 2021 01:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 446 seconds by postgrey-1.36 at gabe;
 Tue, 06 Jul 2021 01:12:01 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7A4896F7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 01:12:01 +0000 (UTC)
Received: from smtp.263.net (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id E33181200E3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:04:32 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.234])
 by smtp.263.net (Postfix) with ESMTP id 0FA7A1AA1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:04:28 +0800 (CST)
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id 9A18F128E;
 Tue,  6 Jul 2021 09:04:25 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P12345T139823465625344S1625533463012840_; 
 Tue, 06 Jul 2021 09:04:24 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7837a5db55880232f5007aae733043e7>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-RCPT-COUNT: 14
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH 2/2] drm/rockchip: dw_hdmi: add rk3568 support
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, heiko@sntech.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 =?UTF-8?B?5pON55Ge5p2w?= <algea.cao@rock-chips.com>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>
References: <20210705140304.652929-1-benjamin.gaignard@collabora.com>
 <20210705140304.652929-3-benjamin.gaignard@collabora.com>
From: Huang Jiachai <hjc@rock-chips.com>
Message-ID: <2658816b-e6c1-06f7-03c2-3ec76fa49217@rock-chips.com>
Date: Tue, 6 Jul 2021 09:04:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705140304.652929-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add algea.cao and andy.yan

在 2021/7/5 22:03, Benjamin Gaignard 写道:
> Add a new dw_hdmi_plat_data struct and new compatible for rk3568.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 28 +++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index 830bdd5e9b7ce..5817c3a9fe64b 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -50,6 +50,10 @@
>   #define RK3399_GRF_SOC_CON20		0x6250
>   #define RK3399_HDMI_LCDC_SEL		BIT(6)
>   
> +#define RK3568_GRF_VO_CON1		0x0364
> +#define RK3568_HDMI_SDAIN_MSK		BIT(15)
> +#define RK3568_HDMI_SCLIN_MSK		BIT(14)
> +
>   #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
>   
>   /**
> @@ -467,6 +471,19 @@ static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
>   	.use_drm_infoframe = true,
>   };
>   
> +static struct rockchip_hdmi_chip_data rk3568_chip_data = {
> +	.lcdsel_grf_reg = -1,
> +};
> +
> +static const struct dw_hdmi_plat_data rk3568_hdmi_drv_data = {
> +	.mode_valid = dw_hdmi_rockchip_mode_valid,
> +	.mpll_cfg   = rockchip_mpll_cfg,
> +	.cur_ctr    = rockchip_cur_ctr,
> +	.phy_config = rockchip_phy_config,
> +	.phy_data = &rk3568_chip_data,
> +	.use_drm_infoframe = true,
> +};
> +
>   static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
>   	{ .compatible = "rockchip,rk3228-dw-hdmi",
>   	  .data = &rk3228_hdmi_drv_data
> @@ -480,6 +497,9 @@ static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
>   	{ .compatible = "rockchip,rk3399-dw-hdmi",
>   	  .data = &rk3399_hdmi_drv_data
>   	},
> +	{ .compatible = "rockchip,rk3568-dw-hdmi",
> +	  .data = &rk3568_hdmi_drv_data
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, dw_hdmi_rockchip_dt_ids);
> @@ -536,6 +556,14 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>   		return ret;
>   	}
>   
> +	if (hdmi->chip_data == &rk3568_chip_data) {
> +		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
> +			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
> +					   RK3568_HDMI_SCLIN_MSK,
> +					   RK3568_HDMI_SDAIN_MSK |
> +					   RK3568_HDMI_SCLIN_MSK));
> +	}
> +
>   	hdmi->phy = devm_phy_optional_get(dev, "hdmi");
>   	if (IS_ERR(hdmi->phy)) {
>   		ret = PTR_ERR(hdmi->phy);

-- 
Best Regard

黄家钗
Sandy Huang
Addr: 福州市鼓楼区铜盘路软件大道89号福州软件园A区21号楼(350003)
       No. 21 Building, A District, No.89,software Boulevard Fuzhou,Fujian,PRC
Tel：+86 0591-87884919  8690
E-mail：hjc@rock-chips.com



