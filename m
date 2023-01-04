Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C791865D06B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08910E572;
	Wed,  4 Jan 2023 10:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE56710E570
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 10:11:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso26064819wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0BNoXArY/AY4PpUnaT3gdVp6ltucDl3LAFo/Uk8PAEA=;
 b=lUwIW4CIoN8VJUauS/2RvINkKVsoHlWI7eX4I2GNVOL0QqqxTHQ5MjB0eR+jV/eFCh
 IpFOHbMzVRLMNO9TCVdqx2SMk0NKDfaVdm7W2FDc2aO8znQrUIA7bLIQav2FX+jA6HZj
 M8Qac1t1l7E8jVXKRyUon4whSHi6DPxb9STi05EzE5K/LV4lyO1XcYnAUIW1xmjhTAaN
 ozt76VWDWrXLElxl69lVGMUyZVhFNIBBQkKlOlCjxbZ06Ce0TMGFoeBLX+fPkiw8HcWT
 e93Hs0D+otgsVf+W2fZIfyvuH5jQnjary4JGieXEI6XFShlg++xuqUgGM1m17vPQx1E4
 dGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BNoXArY/AY4PpUnaT3gdVp6ltucDl3LAFo/Uk8PAEA=;
 b=EwzTflS/7v6TiilMjUR3UNV8KXtKIxe3T9REQGjs6MSQw5kz+7z+n7iABYCsccgCrn
 DGeDK3G+itVi/GeQgpC1lixMI37JSIKZps/FTzZBpnxx64p5Od/kFRqpCIU+sxqIVMhU
 2vdIxiQajj8mQDGKA7imsJGHaEsPNQOWpXR+D5d39rL84mexkDkdagJgSiNxZFVI025l
 +i0+6T4FH2Chq84V8ajWkQhS1ko6icSC2mWMyBC1BW134QoXjWmxVaDRbJw12OoMcnjX
 s5enmnWUfe6lXCL5UibEI99FVJLlDyoQiPZxUnoBtX0kcX15iFvkmmVRbkLf5Wq1G6dA
 plZw==
X-Gm-Message-State: AFqh2kqfgrttpFuJW/dYo4Lzyfv85S5pU8jbFCYWAfWFe3a2+DvD+4i0
 ETB4TOaZYH9tmqpx4qEl+43fgA==
X-Google-Smtp-Source: AMrXdXtTgKIPW0gxINQqaWfuM9fGpKMbjyAcMbB2ri2OLKXVNTzjpykp6V9zUYGAJo9E/Z0NrwgFqQ==
X-Received: by 2002:a05:600c:4f48:b0:3c6:f7ff:6f87 with SMTP id
 m8-20020a05600c4f4800b003c6f7ff6f87mr33848134wmq.11.1672827112337; 
 Wed, 04 Jan 2023 02:11:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:102f:89e:4a9f:68c?
 ([2a01:e0a:982:cbb0:102f:89e:4a9f:68c])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003d1f2c3e571sm55300352wmq.33.2023.01.04.02.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 02:11:51 -0800 (PST)
Message-ID: <0e28b301-6980-968c-552d-db16fade6df9@linaro.org>
Date: Wed, 4 Jan 2023 11:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/msm/dsi: add support for DSI-PHY on SM8550
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-5-9ccd7e652fcd@linaro.org>
 <aa6724af-99bc-de1d-4c03-82609b59174c@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <aa6724af-99bc-de1d-4c03-82609b59174c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 10:53, Dmitry Baryshkov wrote:
> On 04/01/2023 11:08, Neil Armstrong wrote:
>> SM8550 use a 4nm DSI PHYs, which share register definitions
>> with 7nm DSI PHYs. Rather than duplicating the driver, handle
>> 4nm variant inside the common 5+7nm driver.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/Kconfig               |   4 +-
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |   2 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   1 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 102 ++++++++++++++++++++++++------
>>   4 files changed, 89 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index e7b100d97f88..949b18a29a55 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -140,11 +140,11 @@ config DRM_MSM_DSI_10NM_PHY
>>         Choose this option if DSI PHY on SDM845 is used on the platform.
>>   config DRM_MSM_DSI_7NM_PHY
>> -    bool "Enable DSI 7nm/5nm PHY driver in MSM DRM"
>> +    bool "Enable DSI 7nm/5nm/4nm PHY driver in MSM DRM"
>>       depends on DRM_MSM_DSI
>>       default y
>>       help
>> -      Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SC7280
>> +      Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SM8550/SC7280
>>         is used on the platform.
>>   config DRM_MSM_HDMI
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> index 0c956fdab23e..54e03cc9fbe7 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> @@ -573,6 +573,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>>         .data = &dsi_phy_5nm_8350_cfgs },
>>       { .compatible = "qcom,dsi-phy-5nm-8450",
>>         .data = &dsi_phy_5nm_8450_cfgs },
>> +    { .compatible = "qcom,dsi-phy-4nm-8550",
>> +      .data = &dsi_phy_4nm_8550_cfgs },
>>   #endif
>>       {}
>>   };
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> index f7a907ed2b4b..58f9e09f5224 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>> +extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>>   struct msm_dsi_dphy_timing {
>>       u32 clk_zero;
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 7b2c16b3a36c..11629c431c30 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -47,6 +47,8 @@
>>   #define DSI_PHY_7NM_QUIRK_V4_2        BIT(2)
>>   /* Hardware is V4.3 */
>>   #define DSI_PHY_7NM_QUIRK_V4_3        BIT(3)
>> +/* Hardware is V5.2 */
>> +#define DSI_PHY_7NM_QUIRK_V5_2        BIT(4)
>>   struct dsi_pll_config {
>>       bool enable_ssc;
>> @@ -124,14 +126,25 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
>>       if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
>>           config->pll_clock_inverters = 0x28;
>> -    else if (pll_freq <= 1000000000ULL)
>> -        config->pll_clock_inverters = 0xa0;
>> -    else if (pll_freq <= 2500000000ULL)
>> -        config->pll_clock_inverters = 0x20;
>> -    else if (pll_freq <= 3020000000ULL)
>> -        config->pll_clock_inverters = 0x00;
>> -    else
>> -        config->pll_clock_inverters = 0x40;
>> +    else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>> +        if (pll_freq <= 1300000000ULL)
>> +            config->pll_clock_inverters = 0xa0;
>> +        else if (pll_freq <= 2500000000ULL)
>> +            config->pll_clock_inverters = 0x20;
>> +        else if (pll_freq <= 4000000000ULL)
>> +            config->pll_clock_inverters = 0x00;
>> +        else
>> +            config->pll_clock_inverters = 0x40;
>> +    } else {
>> +        if (pll_freq <= 1000000000ULL)
>> +            config->pll_clock_inverters = 0xa0;
>> +        else if (pll_freq <= 2500000000ULL)
>> +            config->pll_clock_inverters = 0x20;
>> +        else if (pll_freq <= 3020000000ULL)
>> +            config->pll_clock_inverters = 0x00;
>> +        else
>> +            config->pll_clock_inverters = 0x40;
>> +    }
>>       config->decimal_div_start = dec;
>>       config->frac_div_start = frac;
>> @@ -222,6 +235,13 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>>               vco_config_1 = 0x01;
>>       }
>> +    if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>> +        if (pll->vco_current_rate < 1557000000ULL)
>> +            vco_config_1 = 0x08;
>> +        else
>> +            vco_config_1 = 0x01;
>> +    }
>> +
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
>>                 analog_controls_five_1);
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
>> @@ -860,7 +880,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>           pr_warn("PLL turned on before configuring PHY\n");
>>       /* Request for REFGEN READY */
>> -    if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
>> +    if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
>> +        (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>>           dsi_phy_write(phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
>>           udelay(500);
>>       }
>> @@ -881,20 +902,38 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>       glbl_str_swi_cal_sel_ctrl = 0x00;
>>       if (phy->cphy_mode) {
>> -        vreg_ctrl_0 = 0x51;
>> -        vreg_ctrl_1 = 0x55;
>> +        if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>> +            vreg_ctrl_0 = 0x45;
>> +            vreg_ctrl_1 = 0x45;
>> +        } else {
>> +            vreg_ctrl_0 = 0x51;
>> +            vreg_ctrl_1 = 0x55;
>> +        }
> 
> Please move these quirk-specific values down, to the rest of if (QUIRK_5_2) statement.

Ok

> 
>>           glbl_hstx_str_ctrl_0 = 0x00;
>>           glbl_pemph_ctrl_0 = 0x11;
>>           lane_ctrl0 = 0x17;
>>       } else {
>> -        vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>> -        vreg_ctrl_1 = 0x5c;
>> +        if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>> +            vreg_ctrl_0 = 0x44;
>> +            vreg_ctrl_1 = 0x19;
>> +        } else {
>> +            vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>> +            vreg_ctrl_1 = 0x5c;
>> +        }
>>           glbl_hstx_str_ctrl_0 = 0x88;
>>           glbl_pemph_ctrl_0 = 0x00;
>>           lane_ctrl0 = 0x1f;
>>       }
>> -    if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
>> +    if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>> +        if (phy->cphy_mode) {
>> +            glbl_rescode_top_ctrl = 0x00;
>> +            glbl_rescode_bot_ctrl = 0x00;
>> +        } else {
>> +            glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x03;
>> +            glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3c;
>> +        }
>> +    } else if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3)) {
>>           if (phy->cphy_mode) {
>>               glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
>>               glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
>> @@ -943,9 +982,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0x00);
>>       /* program CMN_CTRL_4 for minor_ver 2 chipsets*/
>> -    data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0);
>> -    data = data & (0xf0);
>> -    if (data == 0x20)
>> +    if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
>> +        (dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
>>           dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_4, 0x04);
> 
> Ugh. I should change this statement to use quirks too.

Sorrt I don't see what you mean, should I change the original REVISION_ID0 to a proper quirk ?

> 
>>       /* Configure PHY lane swap (TODO: we need to calculate this) */
>> @@ -1058,7 +1096,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>>       dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
>>       /* Turn off REFGEN Vote */
>> -    if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
>> +    if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
>> +        (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>>           dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
>>           wmb();
>>           /* Delay to ensure HW removes vote before PHY shut down */
>> @@ -1092,6 +1131,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
>>       { .supply = "vdds", .init_load_uA = 97800 },
>>   };
>> +static const struct regulator_bulk_data dsi_phy_7nm_98400uA_regulators[] = {
>> +    { .supply = "vdds", .init_load_uA = 98400 },
>> +};
>> +
>>   const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>>       .has_phy_lane = true,
>>       .regulator_data = dsi_phy_7nm_36mA_regulators,
>> @@ -1201,3 +1244,26 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
>>       .num_dsi_phy = 2,
>>       .quirks = DSI_PHY_7NM_QUIRK_V4_3,
>>   };
>> +
>> +const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>> +    .has_phy_lane = true,
>> +    .regulator_data = dsi_phy_7nm_98400uA_regulators,
>> +    .num_regulators = ARRAY_SIZE(dsi_phy_7nm_98400uA_regulators),
>> +    .ops = {
>> +        .enable = dsi_7nm_phy_enable,
>> +        .disable = dsi_7nm_phy_disable,
>> +        .pll_init = dsi_pll_7nm_init,
>> +        .save_pll_state = dsi_7nm_pll_save_state,
>> +        .restore_pll_state = dsi_7nm_pll_restore_state,
>> +        .set_continuous_clock = dsi_7nm_set_continuous_clock,
>> +    },
>> +    .min_pll_rate = 600000000UL,
>> +#ifdef CONFIG_64BIT
>> +    .max_pll_rate = 5000000000UL,
>> +#else
>> +    .max_pll_rate = ULONG_MAX,
>> +#endif
>> +    .io_start = { 0xae95000, 0xae97000 },
>> +    .num_dsi_phy = 2,
>> +    .quirks = DSI_PHY_7NM_QUIRK_V5_2,
>> +};
>>
> 

Thanks,
Neil
