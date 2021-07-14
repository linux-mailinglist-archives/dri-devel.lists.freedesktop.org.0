Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9033C7B0D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 03:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043CC6E152;
	Wed, 14 Jul 2021 01:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtphy.263.net (sg-smtp01.263.net [54.255.195.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9866E152
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 01:26:41 +0000 (UTC)
Received: from smtp.263.net (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id F21DA17
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:26:37 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.114])
 by smtp.263.net (Postfix) with ESMTP id 43BFB369
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:26:35 +0800 (CST)
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 6950A1B10;
 Wed, 14 Jul 2021 09:26:31 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.10] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P4316T140318764680960S1626225989068992_; 
 Wed, 14 Jul 2021 09:26:30 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <140d6f33f97e293553170d6170374a1a>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: kernel@collabora.com
X-RCPT-COUNT: 14
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v2 2/2] drm/rockchip: dw_hdmi: add rk3568 support
To: Alex Bee <knaerzche@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, hjc@rock-chips.com,
 heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 algea.cao@rock-chips.com
References: <20210707120323.401785-1-benjamin.gaignard@collabora.com>
 <20210707120323.401785-3-benjamin.gaignard@collabora.com>
 <a8c5a263-26a6-d4bf-47e7-9266ca1ae5a8@gmail.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <ff1c398c-5140-2cf0-a4aa-b9cf7e0a68d3@rock-chips.com>
Date: Wed, 14 Jul 2021 09:26:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a8c5a263-26a6-d4bf-47e7-9266ca1ae5a8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi Alex:

On 7/13/21 7:40 PM, Alex Bee wrote:
> Hi Benjamin,
>
> Am 07.07.21 um 14:03 schrieb Benjamin Gaignard:
>> Add a new dw_hdmi_plat_data struct and new compatible for rk3568.
>> This version of the HDMI hardware block need two clocks to provide
>> phy reference clock: hclk_vio and hclk.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> version 2:
>> - Add the clocks needed for the phy.
>
> If got Alega's comment correct, it wasn't about the hclks.
> It looks like for this variant, there is another reference clock 
> required (for the phy) like vpll is already (looks like downstream 
> uses HPLL ( = "HDMI-PLL" ?) for that - which also has to switch the 
> frequency according the the drm mode rate - the two clocks you added 
> here are get just enabled (and disabled) here.


Yes, it's HPLL, and the frequency of HPLL and drm mode rate(vop dclk) 
should keep 1:1.

>
> Alega, Andy: Is it really required to enable hclk_vio and hclk(_vop) 
> in the hdmi driver? Are they required to be enabled for the other 
> output variants (i.e. mipi, dsi, rgb ....) as well and shouldn't 
> better be enabled in the (not-yet existing) vop2 driver?


hclk_vop should be enabled, other wise you can't access hdmi registers. 
This is only required for HDMI(mipi dis, edp, rgb don't need it)

>
> Overall: I'm not sure of the benefit of adding this hdmi variant for a 
> SoC where the display driver isn't implemented upstream yet. The 
> "VOP2" IP seems widely new and should probably be ported first. (even 
> if the HDMI part seems a low hanging fruit according to the vendor 
> sources)


Yes, VOP2 IP is widely totaly new and complicated, I have a plan to do 
the upstream. But I am in a rush now, so please give me a lite time😁.

>
> Best,
> Alex
>
>>
>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 68 +++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c 
>> b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> index 830bdd5e9b7ce..dc0e255e45745 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> @@ -50,6 +50,10 @@
>>   #define RK3399_GRF_SOC_CON20        0x6250
>>   #define RK3399_HDMI_LCDC_SEL        BIT(6)
>>   +#define RK3568_GRF_VO_CON1        0x0364
>> +#define RK3568_HDMI_SDAIN_MSK        BIT(15)
>> +#define RK3568_HDMI_SCLIN_MSK        BIT(14)
>> +
>>   #define HIWORD_UPDATE(val, mask)    (val | (mask) << 16)
>>     /**
>> @@ -71,6 +75,8 @@ struct rockchip_hdmi {
>>       const struct rockchip_hdmi_chip_data *chip_data;
>>       struct clk *vpll_clk;
>>       struct clk *grf_clk;
>> +    struct clk *hclk_vio;
>> +    struct clk *hclk_vop;
>>       struct dw_hdmi *hdmi;
>>       struct phy *phy;
>>   };
>> @@ -216,6 +222,26 @@ static int rockchip_hdmi_parse_dt(struct 
>> rockchip_hdmi *hdmi)
>>           return PTR_ERR(hdmi->grf_clk);
>>       }
>>   +    hdmi->hclk_vio = devm_clk_get(hdmi->dev, "hclk_vio");
>> +    if (PTR_ERR(hdmi->hclk_vio) == -ENOENT) {
>> +        hdmi->hclk_vio = NULL;
>> +    } else if (PTR_ERR(hdmi->hclk_vio) == -EPROBE_DEFER) {
>> +        return -EPROBE_DEFER;
>> +    } else if (IS_ERR(hdmi->hclk_vio)) {
>> +        dev_err(hdmi->dev, "failed to get hclk_vio clock\n");
>> +        return PTR_ERR(hdmi->hclk_vio);
>> +    }
>> +
>> +    hdmi->hclk_vop = devm_clk_get(hdmi->dev, "hclk");
>> +    if (PTR_ERR(hdmi->hclk_vop) == -ENOENT) {
>> +        hdmi->hclk_vop = NULL;
>> +    } else if (PTR_ERR(hdmi->hclk_vop) == -EPROBE_DEFER) {
>> +        return -EPROBE_DEFER;
>> +    } else if (IS_ERR(hdmi->hclk_vop)) {
>> +        dev_err(hdmi->dev, "failed to get hclk_vop clock\n");
>> +        return PTR_ERR(hdmi->hclk_vop);
>> +    }
>> +
>>       return 0;
>>   }
>>   @@ -467,6 +493,19 @@ static const struct dw_hdmi_plat_data 
>> rk3399_hdmi_drv_data = {
>>       .use_drm_infoframe = true,
>>   };
>>   +static struct rockchip_hdmi_chip_data rk3568_chip_data = {
>> +    .lcdsel_grf_reg = -1,
>> +};
>> +
>> +static const struct dw_hdmi_plat_data rk3568_hdmi_drv_data = {
>> +    .mode_valid = dw_hdmi_rockchip_mode_valid,
>> +    .mpll_cfg   = rockchip_mpll_cfg,
>> +    .cur_ctr    = rockchip_cur_ctr,
>> +    .phy_config = rockchip_phy_config,
>> +    .phy_data = &rk3568_chip_data,
>> +    .use_drm_infoframe = true,
>> +};
>> +
>>   static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
>>       { .compatible = "rockchip,rk3228-dw-hdmi",
>>         .data = &rk3228_hdmi_drv_data
>> @@ -480,6 +519,9 @@ static const struct of_device_id 
>> dw_hdmi_rockchip_dt_ids[] = {
>>       { .compatible = "rockchip,rk3399-dw-hdmi",
>>         .data = &rk3399_hdmi_drv_data
>>       },
>> +    { .compatible = "rockchip,rk3568-dw-hdmi",
>> +      .data = &rk3568_hdmi_drv_data
>> +    },
>>       {},
>>   };
>>   MODULE_DEVICE_TABLE(of, dw_hdmi_rockchip_dt_ids);
>> @@ -536,6 +578,28 @@ static int dw_hdmi_rockchip_bind(struct device 
>> *dev, struct device *master,
>>           return ret;
>>       }
>>   +    ret = clk_prepare_enable(hdmi->hclk_vio);
>> +    if (ret) {
>> +        dev_err(hdmi->dev, "Failed to enable HDMI hclk_vio: %d\n",
>> +            ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = clk_prepare_enable(hdmi->hclk_vop);
>> +    if (ret) {
>> +        dev_err(hdmi->dev, "Failed to enable HDMI hclk_vop: %d\n",
>> +            ret);
>> +        return ret;
>> +    }
>> +
>> +    if (hdmi->chip_data == &rk3568_chip_data) {
>> +        regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
>> +                 HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
>> +                       RK3568_HDMI_SCLIN_MSK,
>> +                       RK3568_HDMI_SDAIN_MSK |
>> +                       RK3568_HDMI_SCLIN_MSK));
>> +    }
>> +
>>       hdmi->phy = devm_phy_optional_get(dev, "hdmi");
>>       if (IS_ERR(hdmi->phy)) {
>>           ret = PTR_ERR(hdmi->phy);
>> @@ -559,6 +623,8 @@ static int dw_hdmi_rockchip_bind(struct device 
>> *dev, struct device *master,
>>           ret = PTR_ERR(hdmi->hdmi);
>>           drm_encoder_cleanup(encoder);
>>           clk_disable_unprepare(hdmi->vpll_clk);
>> +        clk_disable_unprepare(hdmi->hclk_vio);
>> +        clk_disable_unprepare(hdmi->hclk_vop);
>>       }
>>         return ret;
>> @@ -571,6 +637,8 @@ static void dw_hdmi_rockchip_unbind(struct device 
>> *dev, struct device *master,
>>         dw_hdmi_unbind(hdmi->hdmi);
>>       clk_disable_unprepare(hdmi->vpll_clk);
>> +    clk_disable_unprepare(hdmi->hclk_vio);
>> +    clk_disable_unprepare(hdmi->hclk_vop);
>>   }
>>     static const struct component_ops dw_hdmi_rockchip_ops = {
>>
>
>
>
>


