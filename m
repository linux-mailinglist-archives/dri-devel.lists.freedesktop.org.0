Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C40A9F2DD8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC5610E184;
	Mon, 16 Dec 2024 10:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="TSWMVG+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 25003 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2024 10:09:38 UTC
Received: from mail-m121150.qiye.163.com (mail-m121150.qiye.163.com
 [115.236.121.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B1D10E184
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:09:38 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 5dd3578b;
 Mon, 16 Dec 2024 18:09:34 +0800 (GMT+08:00)
Message-ID: <60c85962-f0fc-41c4-a1ec-30d5ddf3196b@rock-chips.com>
Date: Mon, 16 Dec 2024 18:09:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/rockchip: analogix_dp: Add support for RK3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-4-damon.ding@rock-chips.com>
 <gwogudb5vae7wu452zwuqmdlyaibenoso4f5pjmu3uttckhy2w@shndol4mz5n4>
 <4395748.ejJDZkT8p0@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4395748.ejJDZkT8p0@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhkaGVZCHR5PHUhLTR8eQ01WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cef1d14703a3kunm5dd3578b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCo6HAw*PDIOHBkXGRkTIhAj
 K0xPFDFVSlVKTEhPSE9ITExNT0hOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNT0hONwY+
DKIM-Signature: a=rsa-sha256;
 b=TSWMVG+1KPPhUTsuJupB7ml17VcXCXi6hgYoh5crM4IAcKQeA1/3NZtn/okOlIiwa8QH8/zU9to0GLPNjTyJxTvg8/+aS2Xf8j9tfjBGv6W8vYT+tBkYBStFIEf2XB6/gp136FOmD5fRXrVauPO+sFN2HszZXFtr5IRf4+nX/Jc=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=35aPFMhQL5nn16dGdQB1pIXzHWsIDzaPqfniZ4tuIOc=;
 h=date:mime-version:subject:message-id:from;
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

Hi,

On 2024/12/16 17:11, Heiko Stübner wrote:
> Am Montag, 16. Dezember 2024, 09:57:41 CET schrieb Dmitry Baryshkov:
>> On Mon, Dec 16, 2024 at 11:12:17AM +0800, Damon Ding wrote:
>>> RK3588 integrates the analogix eDP 1.3 TX controller IP and the HDMI/eDP
>>> TX Combo PHY based on a Samsung IP block, and there are also two
>>> independent eDP display interface on RK3588 Soc.
>>>
>>> Add just the basic support for now, i.e. RGB output up to 4K@60Hz, without
>>> the tests of audio, PSR and other eDP 1.3 specific features.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> - Add support for the other eDP output edp1
>>> ---
>>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 82 ++++++++++++++++---
>>>   include/drm/bridge/analogix_dp.h              |  3 +-
>>>   2 files changed, 74 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> index 871606a31ef1..4c9a55776ada 100644
>>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> @@ -51,10 +51,12 @@ struct rockchip_grf_reg_field {
>>>   /**
>>>    * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
>>>    * @lcdc_sel: grf register field of lcdc_sel
>>> + * @edp_mode: grf register field of edp_mode
>>>    * @chip_type: specific chip type
>>>    */
>>>   struct rockchip_dp_chip_data {
>>>   	const struct rockchip_grf_reg_field lcdc_sel;
>>> +	const struct rockchip_grf_reg_field edp_mode;
>>>   	u32	chip_type;
>>>   };
>>>   
>>> @@ -134,12 +136,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>>>   		return ret;
>>>   	}
>>>   
>>> +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
>>> +	if (ret != 0)
>>> +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
>>
>> Is it to be called for non-eDP hosts too? Or for older hosts?
> 
> The implementation of rockchip_grf_field_write (in patch1) seems to
> take care of checking if that field actually exists and doing nothing if
> not.
> 
> I think eDP/DP is more a naming thing, the Analogix controller is called
> an eDP controller in all documentation things.
> 
> Even back on rk3288, the Analogix-DP, still is called an eDP controller in
> documentation, with the only difference being that it does not contain
> another additional "dedicated" DP controller
> 
>>> @@ -396,6 +425,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>>   	const struct rockchip_dp_chip_data *dp_data;
>>>   	struct drm_panel *panel = NULL;
>>>   	struct rockchip_dp_device *dp;
>>> +	int id, i;
>>>   	int ret;
>>>   
>>>   	dp_data = of_device_get_match_data(dev);
>>> @@ -410,9 +440,22 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>>   	if (!dp)
>>>   		return -ENOMEM;
>>>   
>>> +	id = of_alias_get_id(dev->of_node, "edp");
>>> +	if (id < 0)
>>> +		id = 0;
>>
>> Alias is not documented.
> 
> additionally, aliases should never be used to determine actual device
> functionionality - e.g. the hw-device-number
> 
>> Please check how other platforms handle device -> ID conversion and
>> consider following it (yes, the best option currently known is to
>> hardcode bus addresses into the driver data).
> 
> see for example the dw-dsi + dw-dsi2 for existing implementations.
> 

Indeed, I will fix it in the next version.

> 
> 
>>> +	i = 0;
>>> +	while (is_rockchip(dp_data[i].chip_type))
>>> +		i++;
>>> +
>>> +	if (id >= i) {
>>> +		DRM_DEV_ERROR(dev, "invalid edp id: %d\n", id);
>>> +		return -ENODEV;
>>> +	}
>>
>> Is it applicable to non-eDP case?
> 
> same as above, it's always called eDP in all pieces of documentation,
> (Compliant with DP 1.2 and eDP 1.3)
> 
> Heiko
> 
>>> +
>>>   	dp->dev = dev;
>>>   	dp->adp = ERR_PTR(-ENODEV);
>>> -	dp->data = dp_data;
>>> +	dp->data = &dp_data[id];
>>>   	dp->plat_data.panel = panel;
>>>   	dp->plat_data.dev_type = dp->data->chip_type;
>>>   	dp->plat_data.power_on = rockchip_dp_poweron;
>>> @@ -464,19 +507,38 @@ static int rockchip_dp_resume(struct device *dev)
>>>   static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
>>>   		rockchip_dp_resume, NULL);
>>>   
>>> -static const struct rockchip_dp_chip_data rk3399_edp = {
>>> -	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
>>> -	.chip_type = RK3399_EDP,
>>> +static const struct rockchip_dp_chip_data rk3399_edp[] = {
>>> +	{
>>> +		.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
>>> +		.chip_type = RK3399_EDP,
>>> +	},
>>> +	{ /* sentinel */ }
>>> +};
>>> +
>>> +static const struct rockchip_dp_chip_data rk3288_dp[] = {
>>> +	{
>>> +		.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
>>> +		.chip_type = RK3288_DP,
>>> +	},
>>> +	{ /* sentinel */ }
>>>   };
>>>   
>>> -static const struct rockchip_dp_chip_data rk3288_dp = {
>>> -	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
>>> -	.chip_type = RK3288_DP,
>>> +static const struct rockchip_dp_chip_data rk3588_edp[] = {
>>> +	{
>>> +		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
>>> +		.chip_type = RK3588_EDP,
>>> +	},
>>> +	{
>>> +		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
>>> +		.chip_type = RK3588_EDP,
>>> +	},
>>> +	{ /* sentinel */ }
>>>   };
>>>   
>>>   static const struct of_device_id rockchip_dp_dt_ids[] = {
>>>   	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
>>>   	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
>>> +	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
>>>   	{}
>>>   };
>>>   MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>>> index 6002c5666031..54086cb2d97d 100644
>>> --- a/include/drm/bridge/analogix_dp.h
>>> +++ b/include/drm/bridge/analogix_dp.h
>>> @@ -15,11 +15,12 @@ enum analogix_dp_devtype {
>>>   	EXYNOS_DP,
>>>   	RK3288_DP,
>>>   	RK3399_EDP,
>>> +	RK3588_EDP,
>>>   };
>>>   
>>>   static inline bool is_rockchip(enum analogix_dp_devtype type)
>>>   {
>>> -	return type == RK3288_DP || type == RK3399_EDP;
>>> +	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
>>>   }
>>>   
>>>   struct analogix_dp_plat_data {
>>
>>
> 
> 
> 
> 
> 
> 

Best regards,
Damon
