Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB9245D17
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D096F6E4AF;
	Mon, 17 Aug 2020 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CF16EA46
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 17:05:46 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c15so5181254lfi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8+3+utw2qoRZvLkLueDeqTz6MAU6wAFy/JkEJxDI190=;
 b=ZWgJmUCeihHACbWSIyHdS2NjmGo8wzQS/+58lG4r5mWLm1gQC1nYxuKqBjHlBt4RRE
 LlB2pub5ZH77qfJALXBdntKeIM5bZNGksNs0tUjbtOgWMrXftXIyPNho2DFZuIe37v+N
 WdIouqpi54ottOqyWtTG+nEmeuhTcfdLH4ngm9XT9+Ddx0Rb7Mvw1osKqoZxU0xSDLxd
 N20VI1G+tCE04FOKIviXBz/Hd9sfpoP11wGv8qFO1MTVACWSXi3++1UqBonAp/9Q/Wpy
 dR2Bz71icKsujFWb6KuQr26VCZqwvCasATC1iCKC2hrgYejXnjoiq2yMiKkGstTF09/G
 zw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8+3+utw2qoRZvLkLueDeqTz6MAU6wAFy/JkEJxDI190=;
 b=XI8TgeaLFi6oQRDQtfC0G7MbcGDX+5PJ7Ns1AEV6WrsVwNUZFwfe6Wr3+WN1NHDmmc
 osyVLMX7Mf3i+ExOT//F2189BQaPuM4slful8GSoYHHEKX/K3Rgenw/B/U7vXsWXINzW
 EPREZI5NdNKtJngc1FpSmZGhhbK5wGhK3ZOKR7+qXxsbDZlcXmG9IfpqEjQTpiTev64T
 hdRKKp285u33N0RkrA2ACX3EGReWkqNOIIREW91Og+Ix1Jp6MIgRsxdGeDh9K6QJyBNx
 0iD7JnmYab9T0gUmVjFJ1OV9avrVrh3bEEJKmnQFonGOe3nsPdoLDqoJiQeVNG6S5eol
 BHUg==
X-Gm-Message-State: AOAM533soraBIkkBjRyyFGYztmjGK2JvXjLu2zMNEoJojEioEG9aj1jw
 gCZkl6cyF7FLzQW4VMXAIl0uXQ==
X-Google-Smtp-Source: ABdhPJzaklkyPmJ9zd43OPheLnHOE8PZBUWYTxxslFUIk7wE8Tgst5f8HCTE8QoQCCHx2a6NzMJ0AQ==
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr1622219lfq.217.1597424744650; 
 Fri, 14 Aug 2020 10:05:44 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.200])
 by smtp.gmail.com with ESMTPSA id m64sm2056913lfd.0.2020.08.14.10.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:05:43 -0700 (PDT)
Subject: Re: [PATCH v10 3/5] drm/msm/dp: add support for DP PLL driver
To: Tanmay Shah <tanmay@codeaurora.org>, swboyd@chromium.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
Date: Fri, 14 Aug 2020 20:05:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812044223.19279-4-tanmay@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/08/2020 07:42, Tanmay Shah wrote:
 > From: Chandan Uddaraju <chandanu@codeaurora.org>
 >
 > Add the needed DP PLL specific files to support
 > display port interface on msm targets.

[skipped]

 > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h 
b/drivers/gpu/drm/msm/dp/dp_pll_private.h
 > new file mode 100644
 > index 000000000000..475ba6ed59ab
 > --- /dev/null
 > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
 > @@ -0,0 +1,98 @@
 > +/* SPDX-License-Identifier: GPL-2.0-only */
 > +/*
 > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
 > + */
 > +
 > +#ifndef __DP_PLL_10NM_H
 > +#define __DP_PLL_10NM_H
 > +
 > +#include "dp_pll.h"
 > +#include "dp_reg.h"
 > +
 > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
 > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
 > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
 > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
 > +
 > +#define NUM_DP_CLOCKS_MAX            6
 > +
 > +#define DP_PHY_PLL_POLL_SLEEP_US        500
 > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
 > +
 > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
 > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
 > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
 > +
 > +struct dp_pll_vco_clk {
 > +    struct clk_hw hw;
 > +    unsigned long    rate;        /* current vco rate */
 > +    u64        min_rate;    /* min vco rate */
 > +    u64        max_rate;    /* max vco rate */
 > +    void        *priv;
 > +};
 > +
 > +struct dp_pll_db {

This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for 
example, will use slightly different structure.

 > +    struct msm_dp_pll *base;
 > +
 > +    int id;
 > +    struct platform_device *pdev;
 > +
 > +    /* private clocks: */
 > +    bool fixed_factor_clk[NUM_DP_CLOCKS_MAX];
 > +    struct clk_hw *hws[NUM_DP_CLOCKS_MAX];

Then these two fields can use exact number of clocks rather than 
NUM_DP_CLOCKS_MAX.

 > +    u32 num_hws;
 > +
 > +    /* lane and orientation settings */
 > +    u8 lane_cnt;
 > +    u8 orientation;
 > +
 > +    /* COM PHY settings */
 > +    u32 hsclk_sel;
 > +    u32 dec_start_mode0;
 > +    u32 div_frac_start1_mode0;
 > +    u32 div_frac_start2_mode0;
 > +    u32 div_frac_start3_mode0;
 > +    u32 integloop_gain0_mode0;
 > +    u32 integloop_gain1_mode0;
 > +    u32 vco_tune_map;
 > +    u32 lock_cmp1_mode0;
 > +    u32 lock_cmp2_mode0;
 > +    u32 lock_cmp3_mode0;
 > +    u32 lock_cmp_en;
 > +
 > +    /* PHY vco divider */
 > +    u32 phy_vco_div;
 > +    /*
 > +     * Certain pll's needs to update the same vco rate after resume in
 > +     * suspend/resume scenario. Cached the vco rate for such plls.
 > +     */
 > +    unsigned long    vco_cached_rate;
 > +    u32        cached_cfg0;
 > +    u32        cached_cfg1;
 > +    u32        cached_outdiv;
 > +
 > +    uint32_t index;
 > +};
 > +
 > +static inline struct dp_pll_vco_clk *to_dp_vco_hw(struct clk_hw *hw)
 > +{
 > +    return container_of(hw, struct dp_pll_vco_clk, hw);
 > +}
 > +
 > +#define to_msm_dp_pll(vco) ((struct msm_dp_pll *)vco->priv)
 > +
 > +#define to_dp_pll_db(x)    ((struct dp_pll_db *)x->priv)
 > +
 > +int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
 > +                unsigned long parent_rate);
 > +unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
 > +                unsigned long parent_rate);
 > +long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
 > +                unsigned long *parent_rate);
 > +int dp_vco_prepare_10nm(struct clk_hw *hw);
 > +void dp_vco_unprepare_10nm(struct clk_hw *hw);
 > +
 > +int msm_dp_pll_10nm_init(struct msm_dp_pll *dp_pll, int id);
 > +void msm_dp_pll_10nm_deinit(struct msm_dp_pll *dp_pll);

These functions don't seem to be used outside of dp_pll_10nm. What about 
making them static?


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
