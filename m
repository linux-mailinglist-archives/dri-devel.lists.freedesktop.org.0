Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAC39F3C4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 12:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91066E0FD;
	Tue,  8 Jun 2021 10:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0256E0F2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 10:40:12 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m21so15599165lfg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TuxUFNvY12nA0vyfQjP+u5zqzxQ4HiQ+pn+ifar54cI=;
 b=K1L5M82Zap+SlyGv09r/pBEjtwameHGyBzMKiREZPQ7ZlkyrJbBG0dm1EEjvQ4nYhf
 5CuHiuLy8QSHBkwPvm8Y+Ds3iSBh0TadRQi+S+U+NImNS/p/06S/5Sjmcjc0/WJv459Y
 zgpDfJVB20Bq86IZUmYBTwJbElMnRYTTh1VYbe9nkBpPgA9OX51a9pmiTlFh1Cmo89T9
 jBFMKmLrlYZcT2E/UKCvImsztydIQANg6XVwjSLHR5mQvWeoYtAxMy6F4Tg4roVaMLK2
 nh/Gf0hyZAuWNWfJnBEVSIyYIJ5KHbOML1vDKR2fZl8kGi3B+Cpel6S7vDI3deyXE3z2
 vGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TuxUFNvY12nA0vyfQjP+u5zqzxQ4HiQ+pn+ifar54cI=;
 b=uaoWDk8B+Q4aDmQCnaytXhrroXC1wpjcvLn6TLuPJY4+R99jdyUEPytlJK95wnWCm7
 jsXYEZiTsV6B7OSz6aE/bWeObwBgducEKosh6jlV2F7eE8M+vPw2El/zpwv0poBkve16
 8IVtFGyyps32c5zHQPJUN90Oa9qi27gnjrHoFuoGeWYnIx6Zl+re+2OhJTXmP7BUPDYs
 AKgCssYVcCOdW8DeiSZwviRX4RJtwwD4W3ybnkGeW67YbhO028W9Y/jfLzcyTBRw0Nvj
 cuAy69+n8/xM+0Syl25MUKzDmvH8U+oiQtPfCUzPaNUPi3NS0MfVMEGZixIYgqyvKJCZ
 2xLw==
X-Gm-Message-State: AOAM5308R6ceKvdtpH3YA0GmzfAF+KDZwWVCycjvKdbMNKm9JD8MqLio
 OI/nW7LAhJQJGvSjRwZN9qyLGA==
X-Google-Smtp-Source: ABdhPJzDRMlwP7MHO/KFDS8gxs36vkHRrZ0VKu75Qcdc/hBQslD2yavj5P9SRgizjIVd1b0vd0gjlQ==
X-Received: by 2002:a19:e05d:: with SMTP id g29mr14506757lfj.524.1623148811086; 
 Tue, 08 Jun 2021 03:40:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n10sm1858511lfl.104.2021.06.08.03.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 03:40:10 -0700 (PDT)
Subject: Re: [PATCH v3] drm/msm/dsi: add continuous clock support for 7nm PHY
To: abhinavk@codeaurora.org
References: <20210607230021.2193253-1-dmitry.baryshkov@linaro.org>
 <41cdc58d1d1189dbf2ea9e46aefc840e@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <37bced08-d616-7d0c-8c41-81cc1dd45489@linaro.org>
Date: Tue, 8 Jun 2021 13:40:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <41cdc58d1d1189dbf2ea9e46aefc840e@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2021 04:28, abhinavk@codeaurora.org wrote:
> On 2021-06-07 16:00, Dmitry Baryshkov wrote:
>> Unlike previous generations, 7nm PHYs are required to collaborate with
>> the host for conitnuos clock mode. Add changes neccessary to enable
> "the host for continuous clock mode"

Thanks!

>> continuous clock mode in the 7nm DSI PHYs.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Changes since v2:
>>  - Really drop msm_dsi_phy_needs_hs_phy_sel()
>>
>> Changes since v1:
>>  - Remove the need for a separate msm_dsi_phy_needs_hs_phy_sel() call
>>  - Fix setting continuous clock for a dual DSI case.
> Maybe I am missing something but I cannot find this part of the change.
> What has been fixed for dual DSI?

I have been passing wrong phy for the slave in dual DSI case.

>>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi.h             |  3 ++-
>>  drivers/gpu/drm/msm/dsi/dsi.xml.h         |  1 +
>>  drivers/gpu/drm/msm/dsi/dsi_host.c        | 12 ++++++++----
>>  drivers/gpu/drm/msm/dsi/dsi_manager.c     |  4 ++--
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  9 +++++++++
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 17 +++++++++++++++++
>>  7 files changed, 40 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.h
>> index 7abfeab08165..5be458c701d2 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -108,7 +108,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host *host);
>>  int msm_dsi_host_disable(struct mipi_dsi_host *host);
>>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>>              struct msm_dsi_phy_shared_timings *phy_shared_timings,
>> -            bool is_dual_dsi);
>> +            bool is_dual_dsi, struct msm_dsi_phy *phy);
>>  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>                    const struct drm_display_mode *mode);
>> @@ -173,6 +173,7 @@ int msm_dsi_phy_get_clk_provider(struct 
>> msm_dsi_phy *phy,
>>      struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
>> +bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
>> enable);
>>
>>  #endif /* __DSI_CONNECTOR_H__ */
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> index 50eb4d1b8fdd..9762af6035e9 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> @@ -510,6 +510,7 @@ static inline uint32_t
>> DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
>>  #define DSI_LANE_STATUS_DLN0_DIRECTION                0x00010000
>>
>>  #define REG_DSI_LANE_CTRL                    0x000000a8
>> +#define DSI_LANE_CTRL_HS_REQ_SEL_PHY                0x01000000
>>  #define DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST            0x10000000
>>
>>  #define REG_DSI_LANE_SWAP_CTRL                    0x000000ac
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 41e1d0f7ab6e..50be935edcad 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -835,7 +835,7 @@ static inline enum dsi_cmd_dst_format 
>> dsi_get_cmd_fmt(
>>  }
>>
>>  static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>> -            struct msm_dsi_phy_shared_timings *phy_shared_timings)
>> +            struct msm_dsi_phy_shared_timings *phy_shared_timings, 
>> struct
>> msm_dsi_phy *phy)
>>  {
>>      u32 flags = msm_host->mode_flags;
>>      enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
>> @@ -930,6 +930,10 @@ static void dsi_ctrl_config(struct msm_dsi_host
>> *msm_host, bool enable,
>>
>>      if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
>>          lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
>> +
>> +        if (msm_dsi_phy_set_continuous_clock(phy, enable))
>> +            lane_ctrl |= DSI_LANE_CTRL_HS_REQ_SEL_PHY;
>> +
> Not sure how I missed this in the prev patch but for enabling continuous 
> clock mode for new PHY, you need to clear bit 24
> and not set it. If you set it, it goes back to legacy mode ( older 
> method of continuous clock mode )

Oops. I've most probably missed the inversion in the downstream code at 
some point. I'll send v4 later.

>>          dsi_write(msm_host, REG_DSI_LANE_CTRL,
>>              lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
>>      }
>> @@ -2360,7 +2364,7 @@ static void msm_dsi_sfpb_config(struct
>> msm_dsi_host *msm_host, bool enable)
>>
>>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>>              struct msm_dsi_phy_shared_timings *phy_shared_timings,
>> -            bool is_dual_dsi)
>> +            bool is_dual_dsi, struct msm_dsi_phy *phy)
>>  {
>>      struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>      const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>> @@ -2400,7 +2404,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host 
>> *host,
>>
>>      dsi_timing_setup(msm_host, is_dual_dsi);
>>      dsi_sw_reset(msm_host);
>> -    dsi_ctrl_config(msm_host, true, phy_shared_timings);
>> +    dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
>>
>>      if (msm_host->disp_en_gpio)
>>          gpiod_set_value(msm_host->disp_en_gpio, 1);
>> @@ -2431,7 +2435,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host 
>> *host)
>>          goto unlock_ret;
>>      }
>>
>> -    dsi_ctrl_config(msm_host, false, NULL);
>> +    dsi_ctrl_config(msm_host, false, NULL, NULL);
>>
>>      if (msm_host->disp_en_gpio)
>>          gpiod_set_value(msm_host->disp_en_gpio, 0);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> index e138a0c16085..cc18ea2b244c 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> @@ -382,7 +382,7 @@ static void dsi_mgr_bridge_pre_enable(struct
>> drm_bridge *bridge)
>>      if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
>>          return;
>>
>> -    ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], 
>> is_dual_dsi);
>> +    ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
>> is_dual_dsi, msm_dsi->phy);
>>      if (ret) {
>>          pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
>>          goto host_on_fail;
>> @@ -390,7 +390,7 @@ static void dsi_mgr_bridge_pre_enable(struct
>> drm_bridge *bridge)
>>
>>      if (is_dual_dsi && msm_dsi1) {
>>          ret = msm_dsi_host_power_on(msm_dsi1->host,
>> -                &phy_shared_timings[DSI_1], is_dual_dsi);
>> +                &phy_shared_timings[DSI_1], is_dual_dsi, msm_dsi1->phy);
>>          if (ret) {
>>              pr_err("%s: power on host1 failed, %d\n",
>>                              __func__, ret);
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> index ccbd19f7d9cf..1b11c0337a59 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> @@ -851,6 +851,15 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy 
>> *phy,
>>          phy->usecase = uc;
>>  }
>>
>> +/* Returns true if we have to enable DSI_LANE_CTRL.HS_REQ_SEL_PHY */
>> +bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
>> enable)
>> +{
>> +    if (!phy || !phy->cfg->ops.set_continuous_clock)
>> +        return false;
>> +
>> +    return phy->cfg->ops.set_continuous_clock(phy, enable);
>> +}
>> +
>>  int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>>      struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
>>  {
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> index 94a77ac364d3..08e516d0dac4 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> @@ -24,6 +24,7 @@ struct msm_dsi_phy_ops {
>>      void (*disable)(struct msm_dsi_phy *phy);
>>      void (*save_pll_state)(struct msm_dsi_phy *phy);
>>      int (*restore_pll_state)(struct msm_dsi_phy *phy);
>> +    bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
>>  };
>>
>>  struct msm_dsi_phy_cfg {
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index e76ce40a12ab..310b15653fa3 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -930,6 +930,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
>> *phy,
>>      return 0;
>>  }
>>
>> +static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, 
>> bool enable)
>> +{
>> +    void __iomem *base = phy->base;
>> +    u32 data;
>> +
>> +    data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
>> +    if (enable)
>> +        data |= BIT(5) | BIT(6);
>> +    else
>> +        data &= ~(BIT(5) | BIT(6));
>> +    dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1, data);
>> +
>> +    return enable;
>> +}
>> +
>>  static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>>  {
>>      void __iomem *base = phy->base;
>> @@ -970,6 +985,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>>          .pll_init = dsi_pll_7nm_init,
>>          .save_pll_state = dsi_7nm_pll_save_state,
>>          .restore_pll_state = dsi_7nm_pll_restore_state,
>> +        .set_continuous_clock = dsi_7nm_set_continuous_clock,
>>      },
>>      .min_pll_rate = 600000000UL,
>>      .max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
>> ULONG_MAX,
>> @@ -992,6 +1008,7 @@ const struct msm_dsi_phy_cfg 
>> dsi_phy_7nm_8150_cfgs = {
>>          .pll_init = dsi_pll_7nm_init,
>>          .save_pll_state = dsi_7nm_pll_save_state,
>>          .restore_pll_state = dsi_7nm_pll_restore_state,
>> +        .set_continuous_clock = dsi_7nm_set_continuous_clock,
>>      },
>>      .min_pll_rate = 1000000000UL,
>>      .max_pll_rate = 3500000000UL,


-- 
With best wishes
Dmitry
