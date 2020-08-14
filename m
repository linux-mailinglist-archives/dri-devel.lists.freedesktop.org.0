Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482524501D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 01:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3356E2A5;
	Fri, 14 Aug 2020 23:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412306E2A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 23:22:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597447369; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cqB2KYoA6yVaX4oJso9WfBF09SwAmfmeiF0tTyQrqMw=;
 b=nw5NSWY1S5qqLmqbkVfCeuWoJwgVOMmRzDBtgCUvOGYj2hg9j3nmb58/woSAqnuSsMmH/HyR
 OS5VOWQkTktfhTj6JJ49EuLowHUelcWQDsF4o05dFtuTFs4mR12J10WHjI3x+Vlrjwn3M6l2
 z1cs7bG+HcqddLRyVeZvCvFijMQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f371cbd4c787f237b9f30bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 23:22:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 968E0C433CA; Fri, 14 Aug 2020 23:22:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 64FAEC433C9;
 Fri, 14 Aug 2020 23:22:35 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 14 Aug 2020 16:22:35 -0700
From: Tanmay Shah <tanmay@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v10 3/5] drm/msm/dp: add support for DP PLL driver
In-Reply-To: <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
Message-ID: <f6b330778c07abd3003da9acab4d3398@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-14 10:05, Dmitry Baryshkov wrote:
> On 12/08/2020 07:42, Tanmay Shah wrote:
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>> 
>> Add the needed DP PLL specific files to support
>> display port interface on msm targets.
> 
> [skipped]
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h 
>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> new file mode 100644
>> index 000000000000..475ba6ed59ab
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> @@ -0,0 +1,98 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2016-2020, The Linux Foundation. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef __DP_PLL_10NM_H
>> +#define __DP_PLL_10NM_H
>> +
>> +#include "dp_pll.h"
>> +#include "dp_reg.h"
>> +
>> +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>> +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>> +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>> +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>> +
>> +#define NUM_DP_CLOCKS_MAX            6
>> +
>> +#define DP_PHY_PLL_POLL_SLEEP_US        500
>> +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>> +
>> +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>> +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>> +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>> +
>> +struct dp_pll_vco_clk {
>> +    struct clk_hw hw;
>> +    unsigned long    rate;        /* current vco rate */
>> +    u64        min_rate;    /* min vco rate */
>> +    u64        max_rate;    /* max vco rate */
>> +    void        *priv;
>> +};
>> +
>> +struct dp_pll_db {
> 
> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
> example, will use slightly different structure.
> 

Sure, it sounds good. I will give it try. Thanks!

>> +    struct msm_dp_pll *base;
>> +
>> +    int id;
>> +    struct platform_device *pdev;
>> +
>> +    /* private clocks: */
>> +    bool fixed_factor_clk[NUM_DP_CLOCKS_MAX];
>> +    struct clk_hw *hws[NUM_DP_CLOCKS_MAX];
> 
> Then these two fields can use exact number of clocks rather than
> NUM_DP_CLOCKS_MAX.
> 

I didn't get this. I think NUM_DP_CLOCKS_MAX is doing same?

>> +    u32 num_hws;
>> +
>> +    /* lane and orientation settings */
>> +    u8 lane_cnt;
>> +    u8 orientation;
>> +
>> +    /* COM PHY settings */
>> +    u32 hsclk_sel;
>> +    u32 dec_start_mode0;
>> +    u32 div_frac_start1_mode0;
>> +    u32 div_frac_start2_mode0;
>> +    u32 div_frac_start3_mode0;
>> +    u32 integloop_gain0_mode0;
>> +    u32 integloop_gain1_mode0;
>> +    u32 vco_tune_map;
>> +    u32 lock_cmp1_mode0;
>> +    u32 lock_cmp2_mode0;
>> +    u32 lock_cmp3_mode0;
>> +    u32 lock_cmp_en;
>> +
>> +    /* PHY vco divider */
>> +    u32 phy_vco_div;
>> +    /*
>> +     * Certain pll's needs to update the same vco rate after resume 
>> in
>> +     * suspend/resume scenario. Cached the vco rate for such plls.
>> +     */
>> +    unsigned long    vco_cached_rate;
>> +    u32        cached_cfg0;
>> +    u32        cached_cfg1;
>> +    u32        cached_outdiv;
>> +
>> +    uint32_t index;
>> +};
>> +
>> +static inline struct dp_pll_vco_clk *to_dp_vco_hw(struct clk_hw *hw)
>> +{
>> +    return container_of(hw, struct dp_pll_vco_clk, hw);
>> +}
>> +
>> +#define to_msm_dp_pll(vco) ((struct msm_dp_pll *)vco->priv)
>> +
>> +#define to_dp_pll_db(x)    ((struct dp_pll_db *)x->priv)
>> +
>> +int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
>> +                unsigned long parent_rate);
>> +unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
>> +                unsigned long parent_rate);
>> +long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
>> +                unsigned long *parent_rate);
>> +int dp_vco_prepare_10nm(struct clk_hw *hw);
>> +void dp_vco_unprepare_10nm(struct clk_hw *hw);
>> +
>> +int msm_dp_pll_10nm_init(struct msm_dp_pll *dp_pll, int id);
>> +void msm_dp_pll_10nm_deinit(struct msm_dp_pll *dp_pll);
> 
> These functions don't seem to be used outside of dp_pll_10nm. What
> about making them static?

I can't declare static to "init" and "deinit" as they are exported to 
dp_pll.c.
Rest of them I can move to dp_pll_10nm and then define static.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
