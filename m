Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792441F2B0C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 02:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7616E9D2;
	Tue,  9 Jun 2020 00:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B6C6E9D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 00:16:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591661777; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PvWYrDCuHj4FNQpaX2EaPOjvDJ9j1UuFf3vzoFveb9Q=;
 b=AHExtO2KpTgdOnUOhHyHUkoCpqfuVINqWlg8U0dBztReiGRyYS324wCRQhPURLNHucbLogCE
 QTYSKgl7SFFtMzPlDXm6ciILN0ck/9itwB+ACvFoZQGUrV2oqo2JFHMMMUkslcrdzlArs0fh
 oc/z4FolyoWI7k+J4t7ek9nOzag=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5eded4c7badb0d4bcf8bdd8c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 00:16:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2FCD8C433AF; Tue,  9 Jun 2020 00:16:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 75919C4339C;
 Tue,  9 Jun 2020 00:16:04 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 08 Jun 2020 17:16:04 -0700
From: tanmay@codeaurora.org
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [Freedreno] [DPU PATCH v5 4/5] drm/msm/dp: add support for DP PLL
 driver
In-Reply-To: <158768799258.135303.4148133179625718198@swboyd.mtv.corp.google.com>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
 <1585701031-28871-5-git-send-email-tanmay@codeaurora.org>
 <158768799258.135303.4148133179625718198@swboyd.mtv.corp.google.com>
Message-ID: <55d0c7a95777a988eee64a5b7778c025@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org,
 Freedreno <freedreno-bounces@lists.freedesktop.org>, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 hoegsberg@google.com, aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-23 17:26, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-03-31 17:30:30)
>> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
> b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>> new file mode 100644
>> index 0000000..aa845d0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>> @@ -0,0 +1,401 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2016-2020, The Linux Foundation. All rights 
>> reserved.
>> + */
>> +
>> +/*
>> + * Display Port PLL driver block diagram for branch clocks
>> + *
>> + *              +------------------------------+
>> + *              |         DP_VCO_CLK           |
>> + *              |                              |
>> + *              |    +-------------------+     |
>> + *              |    |   (DP PLL/VCO)    |     |
>> + *              |    +---------+---------+     |
>> + *              |              v               |
>> + *              |   +----------+-----------+   |
>> + *              |   | hsclk_divsel_clk_src |   |
>> + *              |   +----------+-----------+   |
>> + *              +------------------------------+
>> + *                              |
>> + *          +---------<---------v------------>----------+
>> + *          |                                           |
>> + * +--------v---------+                                 |
>> + * |    dp_phy_pll    |                                 |
>> + * |     link_clk     |                                 |
>> + * +--------+---------+                                 |
>> + *          |                                           |
>> + *          |                                           |
>> + *          v                                           v
>> + * Input to DISPCC block                                |
>> + * for link clk, crypto clk                             |
>> + * and interface clock                                  |
>> + *                                                      |
>> + *                                                      |
>> + *      +--------<------------+-----------------+---<---+
>> + *      |                     |                 |
>> + * +----v---------+  +--------v-----+  +--------v------+
>> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
>> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
>> + * |              |  |              |  |               |
>> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
>> + * +-------+------+  +-----+--------+  +--------+------+
>> + *         |                 |                  |
>> + *         v---->----------v-------------<------v
>> + *                         |
>> + *              +----------+---------+
>> + *              |   dp_phy_pll_vco   |
>> + *              |       div_clk      |
>> + *              +---------+----------+
>> + *                        |
>> + *                        v
>> + *              Input to DISPCC block
>> + *              for DP pixel clock
> 
> I suspect this shouldn't be a complicated clk provider at all. Take a
> look at commit 42d068472ddf ("phy: Add DisplayPort configuration
> options") for how the phy should manage the link rate, etc. If the
> dispcc pixel clock needs to know what rate is coming in, then a single
> clk_hw can be implemented here that tells the consumer (i.e. dispcc) 
> the
> rate that it will see at the output of this node. Otherwise, modeling
> the clk tree inside this PLL block like this is super overly 
> complicated
> and wasteful. Don't do it.
> 
This will be taken care at later point of time. For now we have removed
PLL bindings and made PLL as module of DP driver.

>> + *
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "dp_pll_10nm.h"
>> +
>> +#define NUM_PROVIDED_CLKS              2
>> +
>> +#define DP_LINK_CLK_SRC                        0
>> +#define DP_PIXEL_CLK_SRC               1
>> +
> [...]
>> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
> b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
>> new file mode 100644
>> index 0000000..fff2e8d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
>> @@ -0,0 +1,524 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2016-2020, The Linux Foundation. All rights 
>> reserved.
>> + */
>> +
>> +#define pr_fmt(fmt)    "%s: " fmt, __func__
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/kernel.h>
>> +
>> +#include "dp_hpd.h"
>> +#include "dp_pll.h"
>> +#include "dp_pll_10nm.h"
>> +
> [...]
>> +
>> +static int dp_config_vco_rate_10nm(struct msm_dp_pll *pll,
>> +               unsigned long rate)
>> +{
>> +       u32 res = 0;
>> +       struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
>> +
>> +       res = dp_vco_pll_init_db_10nm(pll, rate);
>> +       if (res) {
>> +               DRM_ERROR("VCO Init DB failed\n");
>> +               return res;
>> +       }
>> +
>> +       if (dp_res->lane_cnt != 4) {
>> +               if (dp_res->orientation == ORIENTATION_CC2)
>> +                       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL,
> 0x6d);
>> +               else
>> +                       PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL,
> 0x75);
>> +       } else {
>> +               PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x7d);
>> +       }
> 
> For example, this part here can be done through the phy configuration
> ops. A lane count check in the set rate clk op is quite odd!
> 
Same here.
>> +
>> +long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
>> +                       unsigned long *parent_rate)
>> +{
>> +       unsigned long rrate = rate;
>> +       struct msm_dp_pll *pll = to_msm_dp_pll(hw);
>> +
>> +       if (rate <= pll->min_rate)
>> +               rrate = pll->min_rate;
>> +       else if (rate <= DP_VCO_HSCLK_RATE_2700MHZDIV1000)
>> +               rrate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
>> +       else if (rate <= DP_VCO_HSCLK_RATE_5400MHZDIV1000)
>> +               rrate = DP_VCO_HSCLK_RATE_5400MHZDIV1000;
>> +       else
>> +               rrate = pll->max_rate;
> 
> This is basically link rate setting through the clk framework. Calling
> clk_set_rate() on the pixel clk is complicated and opaque. I'd expect 
> to
> see the DP controller driver set the link rate on the phy with
> phy_configure(), and then that can change the rate that is seen
> downstream at the pixel clk. Does the pixel clk need to do anything 
> with
> the rate? Probably not? I suspect it can just enable the pixel clk when
> it needs to and disable it when it doesn't need it.
> 
Same here.
>> +
>> +       DRM_DEBUG_DP("%s: rrate=%ld\n", __func__, rrate);
>> +
>> +       *parent_rate = rrate;
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
