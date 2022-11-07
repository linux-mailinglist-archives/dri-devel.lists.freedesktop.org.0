Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD8962032D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987B510E61C;
	Mon,  7 Nov 2022 23:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC0210E5E9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:02:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g7so18827793lfv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AmluNRdwGvgd4YoWhYSoMPCkZtHJPs/rh5Fx+5v/Mao=;
 b=uZAhCeG8auvdD0+w0IudpX10s7gRlXQItDL1u84bkH6Y8T0/9dRjg3VOBs26a/o3TS
 n4MErlTterkLCtPJma7BKjezhfOAgoxpKFtGMqbUoMzIUuqaEwdlKz5ytdSxymme2b/E
 l4SK4ezlgbH0rAONenjKa6QVSjr8zwZWhnRsEk2npLPJs+HdTK5kKDfmq5xgdX3uzjKg
 bWuE/ToiQsyv02qKjMImPRPdhltofZ8sRx73Wt2WnHPE08ho9R/+98o43Rbb0PeEg40u
 BCAflv1no2On7k3rlJNIOlKLRMGe8pCXjHRQB9gbSLo9YfIMWdEesSQZSIguljTiFdKS
 etlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmluNRdwGvgd4YoWhYSoMPCkZtHJPs/rh5Fx+5v/Mao=;
 b=k4NstjaQwe//wTDwqgf847gYLKl+EsAMrE4qzUldUk0aQOQJX2W5f8au+DTso5qpw1
 Zs9icSLm6w8UHTMaTvya8c+Nh0noHs5DpiLt7vg1le6tU2g3m5WkO6gcmVL3ktLO3OqH
 rMX6VAL7N4VDR/8T3QXClYR28adJ/nYmWOVR7zB/iaZD7ffxrhi89WUDTQwov8OJMqZ4
 SZErej2XbRXasf7XX+BKFV/+CFHjhJMv3YVIk2SE21lw/78O6ELunm6j9GjemstFaac8
 BCYDqn7yNH3mZXF/61pAxe4zwM2AHcV6WPZRODVnaEX4svluwa75kclfTD+bpa8KJg0D
 plDg==
X-Gm-Message-State: ACrzQf2fmlfzqPihh9i9UkTSVwR0kSVe0R3JnMRxtHOmm1jVz5UWOm8g
 9jNeDvukxmaHIvCrgmzC3+6vjQ==
X-Google-Smtp-Source: AMsMyM5UwEHPKOw39miqFZblKIM67i6gTzJn6YmyC/bODDhToG94Jz+sASwLql4t+Gtco/gtcFVvaA==
X-Received: by 2002:ac2:4827:0:b0:4af:d7cd:5d59 with SMTP id
 7-20020ac24827000000b004afd7cd5d59mr19795536lft.321.1667862174259; 
 Mon, 07 Nov 2022 15:02:54 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a199144000000b0049f53d53235sm1468389lfj.50.2022.11.07.15.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:02:53 -0800 (PST)
Message-ID: <46fb5758-bdd9-8b08-7d8a-d35a459b1cb0@linaro.org>
Date: Tue, 8 Nov 2022 02:02:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/5] drm/msm/dsi: add support for DSI-PHY on SM8350 and
 SM8450
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
 <20220922113016.355188-2-dmitry.baryshkov@linaro.org>
 <5b7492e2-e635-d3ea-6085-dacbc91db9cb@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5b7492e2-e635-d3ea-6085-dacbc91db9cb@quicinc.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/11/2022 07:27, Abhinav Kumar wrote:
> 
> 
> On 9/22/2022 4:30 AM, Dmitry Baryshkov wrote:
>> SM8350 and SM8450 use 5nm DSI PHYs, which share register definitions
>> with 7nm DSI PHYs. Rather than duplicating the driver, handle 5nm
>> variants inside the common 5+7nm driver.
> 
> I do realize that there is common code across PHYs but i am concerned 
> about this type of unification of phy drivers.

This more or less follows downstream, which has unifier v4.0 driver.

> If we have features which are PHY sequence dependent such as ULPS, this 
> will just complicate things for us.

During development we initially tried to create a separate 5nm driver. 
However this resulted in huuuge code duplication. This would be prone to 
significant amount of errors if we change one of the drivers at some 
point and not another one.

> Also some PHY registers might get added some might get removed across 
> chipsets as this is the most frequently changed component.

Yes, I completely agree here. However beforehand we have successfully 
managed to have per-generation drivers, handling minor differences with 
quirks.

> 
> Even in this patch, I see this added to dsi_7nm_phy_disable()
> 
>  > +    /* Turn off REFGEN Vote */
>  > +        dsi_phy_write(base + 
> REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
>  > +        wmb();
>  > +        /* Delay to ensure HW removes vote before PHY shut down */
>  > +        udelay(2);
>  > +
> 
> What would be the impact of writing this for the existing 7nm PHY?

Let's probably guard this with the v4.3 check.

> 
> I am having some access issues to check the software interface so wanted 
> to check.

I don't remember having any issues on RB5, but I did not run any special 
checks.

> 
>>
>> Co-developed-by: Robert Foss <robert.foss@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/Kconfig               |   6 +-
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |   4 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   2 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 132 ++++++++++++++++++++--
>>   4 files changed, 131 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index 4e0cbd682725..e6c5dfbad009 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -140,12 +140,12 @@ config DRM_MSM_DSI_10NM_PHY
>>         Choose this option if DSI PHY on SDM845 is used on the platform.
>>   config DRM_MSM_DSI_7NM_PHY
>> -    bool "Enable DSI 7nm PHY driver in MSM DRM"
>> +    bool "Enable DSI 7nm/5nm PHY driver in MSM DRM"
>>       depends on DRM_MSM_DSI
>>       default y
>>       help
>> -      Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
>> -      the platform.
>> +      Choose this option if DSI PHY on 
>> SM8150/SM8250/SM8350/SM8450/SC7280
>> +      is used on the platform.
>>   config DRM_MSM_HDMI
>>       bool "Enable HDMI support in MSM DRM driver"
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c 
>> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> index 7fc0975cb869..97cf6b8b34cc 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> @@ -567,6 +567,10 @@ static const struct of_device_id 
>> dsi_phy_dt_match[] = {
>>         .data = &dsi_phy_7nm_8150_cfgs },
>>       { .compatible = "qcom,sc7280-dsi-phy-7nm",
>>         .data = &dsi_phy_7nm_7280_cfgs },
>> +    { .compatible = "qcom,dsi-phy-5nm-8350",
>> +      .data = &dsi_phy_5nm_8350_cfgs },
>> +    { .compatible = "qcom,dsi-phy-5nm-8450",
>> +      .data = &dsi_phy_5nm_8450_cfgs },
>>   #endif
>>       {}
>>   };
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h 
>> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> index 60a99c6525b2..654cbfa14d6e 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> @@ -56,6 +56,8 @@ extern const struct msm_dsi_phy_cfg 
>> dsi_phy_10nm_8998_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>>   struct msm_dsi_dphy_timing {
>>       u32 clk_zero;
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c 
>> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 9e7fa7d88ead..1696ff150b9e 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -39,8 +39,14 @@
>>   #define VCO_REF_CLK_RATE        19200000
>>   #define FRAC_BITS 18
>> +/* Hardware is pre V4.1 */
>> +#define DSI_PHY_7NM_QUIRK_PRE_V4_1    BIT(0)
>>   /* Hardware is V4.1 */
>> -#define DSI_PHY_7NM_QUIRK_V4_1        BIT(0)
>> +#define DSI_PHY_7NM_QUIRK_V4_1        BIT(1)
>> +/* Hardware is V4.2 */
>> +#define DSI_PHY_7NM_QUIRK_V4_2        BIT(2)
>> +/* Hardware is V4.3 */
>> +#define DSI_PHY_7NM_QUIRK_V4_3        BIT(3)
>>   struct dsi_pll_config {
>>       bool enable_ssc;
>> @@ -116,7 +122,7 @@ static void dsi_pll_calc_dec_frac(struct 
>> dsi_pll_7nm *pll, struct dsi_pll_config
>>       dec_multiple = div_u64(pll_freq * multiplier, divider);
>>       dec = div_u64_rem(dec_multiple, multiplier, &frac);
>> -    if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
>> +    if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
>>           config->pll_clock_inverters = 0x28;
>>       else if (pll_freq <= 1000000000ULL)
>>           config->pll_clock_inverters = 0xa0;
>> @@ -197,16 +203,25 @@ static void dsi_pll_config_hzindep_reg(struct 
>> dsi_pll_7nm *pll)
>>       void __iomem *base = pll->phy->pll_base;
>>       u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
>> -    if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>> +    if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>>           if (pll->vco_current_rate >= 3100000000ULL)
>>               analog_controls_five_1 = 0x03;
>> +    if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>>           if (pll->vco_current_rate < 1520000000ULL)
>>               vco_config_1 = 0x08;
>>           else if (pll->vco_current_rate < 2990000000ULL)
>>               vco_config_1 = 0x01;
>>       }
>> +    if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) ||
>> +        (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3)) {
>> +        if (pll->vco_current_rate < 1520000000ULL)
>> +            vco_config_1 = 0x08;
>> +        else if (pll->vco_current_rate >= 2990000000ULL)
>> +            vco_config_1 = 0x01;
>> +    }
>> +
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
>>                 analog_controls_five_1);
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, 
>> vco_config_1);
>> @@ -231,9 +246,9 @@ static void dsi_pll_config_hzindep_reg(struct 
>> dsi_pll_7nm *pll)
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
>>       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
>> -          pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
>> +          !(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 
>> 0x3f : 0x22);
>> -    if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>> +    if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
>>           dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>>           if (pll->slave)
>>               dsi_phy_write(pll->slave->phy->pll_base + 
>> REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>> @@ -788,7 +803,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct 
>> msm_dsi_phy *phy)
>>       const u8 *tx_dctrl = tx_dctrl_0;
>>       void __iomem *lane_base = phy->lane_base;
>> -    if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
>> +    if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>>           tx_dctrl = tx_dctrl_1;
>>       /* Strength ctrl settings */
>> @@ -844,6 +859,12 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
>> *phy,
>>       if (dsi_phy_hw_v4_0_is_pll_on(phy))
>>           pr_warn("PLL turned on before configuring PHY\n");
>> +    /* Request for REFGEN READY */
>> +    if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
>> +        dsi_phy_write(phy->base + 
>> REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
>> +        udelay(500);
>> +    }
>> +
>>       /* wait for REFGEN READY */
>>       ret = readl_poll_timeout_atomic(base + 
>> REG_DSI_7nm_PHY_CMN_PHY_STATUS,
>>                       status, (status & BIT(0)),
>> @@ -858,23 +879,53 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
>> *phy,
>>       /* Alter PHY configurations if data rate less than 1.5GHZ*/
>>       less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>> -    if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>> -        vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>> +    if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
>> +        if (phy->cphy_mode) {
>> +            vreg_ctrl_0 = 0x51;
>> +            glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
>> +            glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
>> +            glbl_str_swi_cal_sel_ctrl = 0x00;
>> +            glbl_hstx_str_ctrl_0 = 0x00;
>> +        } else {
>> +            vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>> +            glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
>> +            glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
>> +            glbl_str_swi_cal_sel_ctrl = 0x00;
>> +            glbl_hstx_str_ctrl_0 = 0x88;
>> +        }
>> +    } else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) {
>> +        if (phy->cphy_mode) {
>> +            vreg_ctrl_0 = 0x51;
>> +            glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
>> +            glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
>> +            glbl_str_swi_cal_sel_ctrl = 0x00;
>> +            glbl_hstx_str_ctrl_0 = 0x00;
>> +        } else {
>> +            vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>> +            glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x00;
>> +            glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
>> +            glbl_str_swi_cal_sel_ctrl = 0x00;
>> +            glbl_hstx_str_ctrl_0 = 0x88;
>> +        }
>> +    } else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>>           if (phy->cphy_mode) {
>> +            vreg_ctrl_0 = 0x51;
>>               glbl_rescode_top_ctrl = 0x00;
>>               glbl_rescode_bot_ctrl = 0x3c;
>>           } else {
>> +            vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>>               glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
>>               glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
>>           }
>>           glbl_str_swi_cal_sel_ctrl = 0x00;
>>           glbl_hstx_str_ctrl_0 = 0x88;
>>       } else {
>> -        vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>>           if (phy->cphy_mode) {
>> +            vreg_ctrl_0 = 0x51;
>>               glbl_str_swi_cal_sel_ctrl = 0x03;
>>               glbl_hstx_str_ctrl_0 = 0x66;
>>           } else {
>> +            vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>>               glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 
>> 0x00;
>>               glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
>>           }
>> @@ -883,7 +934,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
>> *phy,
>>       }
>>       if (phy->cphy_mode) {
>> -        vreg_ctrl_0 = 0x51;
>>           vreg_ctrl_1 = 0x55;
>>           glbl_pemph_ctrl_0 = 0x11;
>>           lane_ctrl0 = 0x17;

So far this is the largest chunk to handle the difference between 
platforms. And I think it was a mess even before we tried adding the 
4.2/4.3 versions.

>> @@ -1017,6 +1067,13 @@ static void dsi_7nm_phy_disable(struct 
>> msm_dsi_phy *phy)
>>           pr_warn("Turning OFF PHY while PLL is on\n");
>>       dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
>> +
>> +    /* Turn off REFGEN Vote */
>> +        dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 
>> 0x0);
>> +        wmb();
>> +        /* Delay to ensure HW removes vote before PHY shut down */
>> +        udelay(2);
>> +
>>       data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>       /* disable all lanes */
>> @@ -1079,6 +1136,7 @@ const struct msm_dsi_phy_cfg 
>> dsi_phy_7nm_8150_cfgs = {
>>       .max_pll_rate = 3500000000UL,
>>       .io_start = { 0xae94400, 0xae96400 },
>>       .num_dsi_phy = 2,
>> +    .quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
>>   };
>>   const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
>> @@ -1102,3 +1160,57 @@ const struct msm_dsi_phy_cfg 
>> dsi_phy_7nm_7280_cfgs = {
>>       .num_dsi_phy = 1,
>>       .quirks = DSI_PHY_7NM_QUIRK_V4_1,
>>   };
>> +
>> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs = {
>> +    .has_phy_lane = true,
>> +    .reg_cfg = {
>> +        .num = 1,
>> +        .regs = {
>> +            {"vdds", 37550, 0},
>> +        },
>> +    },
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
>> +    .io_start = { 0xae94400, 0xae96400 },
>> +    .num_dsi_phy = 2,
>> +    .quirks = DSI_PHY_7NM_QUIRK_V4_2,
>> +};
>> +
>> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
>> +    .has_phy_lane = true,
>> +    .reg_cfg = {
>> +        .num = 1,
>> +        .regs = {
>> +            {"vdds", 97800, 0},
>> +        },
>> +    },
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
>> +    .io_start = { 0xae94400, 0xae96400 },
>> +    .num_dsi_phy = 2,
>> +    .quirks = DSI_PHY_7NM_QUIRK_V4_3,
>> +};

-- 
With best wishes
Dmitry

