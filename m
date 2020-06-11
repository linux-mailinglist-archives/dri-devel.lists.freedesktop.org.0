Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75E1F6ECA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 22:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE20F6E941;
	Thu, 11 Jun 2020 20:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8D76E941
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 20:31:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591907508; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rke+d+jqQqt8R2SC4s4gukAnx06SpqFJSfHIGWriPjA=;
 b=hvzIQxJY8qIePp+N/fGU9rasd3LQsY1p2NaN7sxRpK4vbvUAG/tiUsh3fqASAO3x9PUKB0kp
 NtS5ohLjNdWjx0fNKuGC/zjSnF1v+70XZKDI1ntgTkckR0GOGjBB95KhjeZtNb2GhyGvqMHf
 NFd2Q2G95hk68i3fmLxE5ei5HS0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ee294a46f2ee827da0501fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 20:31:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 916D0C43387; Thu, 11 Jun 2020 20:31:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DB5F9C433C8;
 Thu, 11 Jun 2020 20:31:30 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 13:31:30 -0700
From: tanmay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 4/5] drm/msm/dp: add support for DP PLL driver
In-Reply-To: <f7a7e8332491a3943106affbd435a1cf@codeaurora.org>
References: <20200609034623.10844-1-tanmay@codeaurora.org>
 <159175481823.242598.9387748150892951863@swboyd.mtv.corp.google.com>
 <f7a7e8332491a3943106affbd435a1cf@codeaurora.org>
Message-ID: <95406b922b3aee8a70e4ca8997710622@codeaurora.org>
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
Cc: sam@ravnborg.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, abhinavk@codeaurora.org,
 Vara Reddy <varar@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, chandanu@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Thanks for reviews.
Please ignore previous response to this patch. Here, I have re-organized 
it.

Thanks,

On 2020-06-11 13:07, tanmay@codeaurora.org wrote:
> On 2020-06-09 19:06, Stephen Boyd wrote:
>> Quoting Tanmay Shah (2020-06-08 20:46:23)
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> index d02f4eb..2b982f0 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> @@ -5,6 +5,7 @@
>>> 
>>>  #define pr_fmt(fmt)    "[drm-dp] %s: " fmt, __func__
>>> 
>>> +#include <linux/rational.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/iopoll.h>
>>>  #include <drm/drm_dp_helper.h>
>>> @@ -134,59 +135,61 @@ static inline void dp_write_ahb(struct 
>>> dp_catalog_private *catalog,
>>>         writel(data, catalog->io->dp_controller.base + offset);
>>>  }
>>> 
>>> -static inline u32 dp_read_cc(struct dp_catalog_private *catalog, u32 
>>> offset)
>>> -{
>>> -       return readl_relaxed(catalog->io->dp_cc_io.base + offset);
>>> -}
>>> -
>> 
>> Why was this added in the first place? Remove it from the place it 
>> came
>> in please.
>> 
> Sure. I will remove it as part of DP base driver patch.
>>>  static inline void dp_write_phy(struct dp_catalog_private *catalog,
>>>                                u32 offset, u32 data)
>>>  {
>>> +       offset += DP_PHY_REG_OFFSET;
>>>         /*
>>>          * To make sure phy reg writes happens before any other 
>>> operation,
>> [...]
>>> @@ -568,17 +574,37 @@ void dp_catalog_ctrl_config_msa(struct 
>>> dp_catalog *dp_catalog,
>>>                                         bool fixed_nvid)
>>>  {
>>>         u32 pixel_m, pixel_n;
>>> -       u32 mvid, nvid;
>>> +       u32 mvid, nvid, div, pixel_div = 0, dispcc_input_rate;
>>>         u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>>>         u32 const link_rate_hbr2 = 540000;
>>>         u32 const link_rate_hbr3 = 810000;
>>> +       unsigned long den, num;
>>> 
>>>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>>>                                 struct dp_catalog_private, 
>>> dp_catalog);
>>> 
>>> -       pixel_m = dp_read_cc(catalog, MMSS_DP_PIXEL_M);
>>> -       pixel_n = dp_read_cc(catalog, MMSS_DP_PIXEL_N);
>>> -       DRM_DEBUG_DP("pixel_m=0x%x, pixel_n=0x%x\n", pixel_m, 
>>> pixel_n);
>>> +       div = dp_read_phy(catalog, REG_DP_PHY_VCO_DIV);
>> 
>> Why do we need to read the phy? The pixel_div seems to match what the
>> clk driver is doing so presumably we can make this follow the link 
>> rate
>> being used vs. having to read the phy.
>> 
> 
> As mentioned in above diagram, there is an additional divider in the
> PLL after the VCO (vco_divided_clk_src).
> The input rate to the dispcc branch is (vco_rate * 10)/ 
> vco_dividied_clk_src.
> In order to know the MNDs at the dispcc, we need to know the input 
> rate.
> This register read is to figure out which divider value is currently
> being set in the PLL.
> This input rate is not the same as the link rate. When we move the
> PHY/PLL to a separate driver,
> we would have take care of finding a different way to get this input 
> rate.
>>> +       div &= 0x03;
>>> +
>>> +       if (div == 0)
>>> +               pixel_div = 6;
>>> +       else if (div == 1)
>>> +               pixel_div = 2;
>>> +       else if (div == 2)
>>> +               pixel_div = 4;
>>> +       else
>>> +               DRM_ERROR("Invalid pixel mux divider\n");
>>> +
>>> +       dispcc_input_rate = (rate * 10) / pixel_div;
>>> +
>>> +       rational_best_approximation(dispcc_input_rate, 
>>> stream_rate_khz,
>>> +                       (unsigned long)(1 << 16) - 1,
>>> +                       (unsigned long)(1 << 16) - 1, &den, &num);
>>> +
>>> +       den = ~(den - num);
>>> +       den = den & 0xFFFF;
>>> +       pixel_m = num;
>>> +       pixel_n = den;
>>> 
>>>         mvid = (pixel_m & 0xFFFF) * 5;
>>>         nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_pll_10nm.c 
>>> b/drivers/gpu/drm/msm/dp/dp_pll_10nm.c
>>> new file mode 100644
>>> index 0000000..998d659
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/dp/dp_pll_10nm.c
>>> @@ -0,0 +1,903 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2016-2020, The Linux Foundation. All rights 
>>> reserved.
>>> + */
>>> +
>>> +/*
>>> + * Display Port PLL driver block diagram for branch clocks
>>> + *
>>> + *              +------------------------------+
>>> + *              |         DP_VCO_CLK           |
>>> + *              |                              |
>>> + *              |    +-------------------+     |
>>> + *              |    |   (DP PLL/VCO)    |     |
>>> + *              |    +---------+---------+     |
>>> + *              |              v               |
>>> + *              |   +----------+-----------+   |
>>> + *              |   | hsclk_divsel_clk_src |   |
>>> + *              |   +----------+-----------+   |
>>> + *              +------------------------------+
>>> + *                              |
>>> + *          +---------<---------v------------>----------+
>>> + *          |                                           |
>>> + * +--------v---------+                                 |
>>> + * |    dp_phy_pll    |                                 |
>>> + * |     link_clk     |                                 |
>>> + * +--------+---------+                                 |
>>> + *          |                                           |
>>> + *          |                                           |
>>> + *          v                                           v
>>> + * Input to DISPCC block                                |
>>> + * for link clk, crypto clk                             |
>>> + * and interface clock                                  |
>>> + *                                                      |
>>> + *                                                      |
>>> + *      +--------<------------+-----------------+---<---+
>>> + *      |                     |                 |
>>> + * +----v---------+  +--------v-----+  +--------v------+
>>> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
>>> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
>>> + * |              |  |              |  |               |
>>> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
>>> + * +-------+------+  +-----+--------+  +--------+------+
>>> + *         |                 |                  |
>>> + *         v---->----------v-------------<------v
>>> + *                         |
>>> + *              +----------+---------+
>>> + *              |   dp_phy_pll_vco   |
>>> + *              |       div_clk      |
>>> + *              +---------+----------+
>>> + *                        |
>>> + *                        v
>>> + *              Input to DISPCC block
>>> + *              for DP pixel clock
>>> + *
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/err.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/iopoll.h>
>> 
>> Should be a clk-provider.h include here given that this is providing
>> clks.
>> 
> Yes. currently it is included in dp_parser.h but I will include here as 
> well.
>>> +
>>> +#include "dp_hpd.h"
>>> +#include "dp_pll.h"
>>> +#include "dp_pll_private.h"
>>> +
>>> +#define NUM_PROVIDED_CLKS              2
>>> +
>>> +#define DP_LINK_CLK_SRC                        0
>>> +#define DP_PIXEL_CLK_SRC               1
>>> +
>>> +static struct dp_pll_db *dp_pdb;
>>> +
>>> +static const struct clk_ops dp_10nm_vco_clk_ops = {
>>> +       .recalc_rate = dp_vco_recalc_rate_10nm,
>>> +       .set_rate = dp_vco_set_rate_10nm,
>>> +       .round_rate = dp_vco_round_rate_10nm,
>>> +       .prepare = dp_vco_prepare_10nm,
>>> +       .unprepare = dp_vco_unprepare_10nm,
>>> +};
>>> +
>>> +struct dp_pll_10nm_pclksel {
>>> +       struct clk_hw hw;
>>> +
>>> +       /* divider params */
>>> +       u8 shift;
>>> +       u8 width;
>>> +       u8 flags; /* same flags as used by clk_divider struct */
>>> +
>>> +       struct dp_pll_db *pll;
>>> +};
>>> +
>>> +#define to_pll_10nm_pclksel(_hw) \
>>> +       container_of(_hw, struct dp_pll_10nm_pclksel, hw)
>>> +
>>> +static const struct clk_parent_data disp_cc_parent_data_0[] = {
>>> +       { .fw_name = "bi_tcxo" },
>>> +       { .fw_name = "dp_phy_pll_link_clk", .name = 
>>> "dp_phy_pll_link_clk" },
>>> +       { .fw_name = "dp_phy_pll_vco_div_clk",
>>> +                               .name = "dp_phy_pll_vco_div_clk"},
>>> +       { .fw_name = "core_bi_pll_test_se", .name = 
>>> "core_bi_pll_test_se" },
>>> +};
>>> +
>>> +static struct dp_pll_vco_clk dp_vco_clk = {
>>> +       .min_rate = DP_VCO_HSCLK_RATE_1620MHZDIV1000,
>>> +       .max_rate = DP_VCO_HSCLK_RATE_8100MHZDIV1000,
>>> +};
>>> +
>>> +static int dp_pll_mux_set_parent_10nm(struct clk_hw *hw, u8 val)
>>> +{
>>> +       struct dp_pll_10nm_pclksel *pclksel = 
>>> to_pll_10nm_pclksel(hw);
>>> +       struct dp_pll_db *dp_res = pclksel->pll;
>>> +       struct dp_io_pll *pll_io = &dp_res->base->pll_io;
>>> +       u32 auxclk_div;
>>> +
>>> +       auxclk_div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
>>> +       auxclk_div &= ~0x03;
>>> +
>>> +       if (val == 0)
>>> +               auxclk_div |= 1;
>>> +       else if (val == 1)
>>> +               auxclk_div |= 2;
>>> +       else if (val == 2)
>>> +               auxclk_div |= 0;
>>> +
>>> +       PLL_REG_W(pll_io->phy_base,
>>> +                       REG_DP_PHY_VCO_DIV, auxclk_div);
>>> +       DRM_DEBUG_DP("%s: mux=%d auxclk_div=%x\n", __func__, val, 
>>> auxclk_div);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static u8 dp_pll_mux_get_parent_10nm(struct clk_hw *hw)
>>> +{
>>> +       u32 auxclk_div = 0;
>>> +       struct dp_pll_10nm_pclksel *pclksel = 
>>> to_pll_10nm_pclksel(hw);
>>> +       struct dp_pll_db *dp_res = pclksel->pll;
>>> +       struct dp_io_pll *pll_io = &dp_res->base->pll_io;
>>> +       u8 val = 0;
>>> +
>>> +       auxclk_div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
>>> +       auxclk_div &= 0x03;
>>> +
>>> +       if (auxclk_div == 1) /* Default divider */
>>> +               val = 0;
>>> +       else if (auxclk_div == 2)
>>> +               val = 1;
>>> +       else if (auxclk_div == 0)
>>> +               val = 2;
>>> +
>>> +       DRM_DEBUG_DP("%s: auxclk_div=%d, val=%d\n", __func__, 
>>> auxclk_div, val);
>>> +
>>> +       return val;
>>> +}
>>> +
>>> +static int dp_pll_clk_mux_determine_rate(struct clk_hw *hw,
>>> +                                    struct clk_rate_request *req)
>>> +{
>>> +       unsigned long rate = 0;
>>> +       int ret = 0;
>>> +
>>> +       rate = clk_get_rate(hw->clk);
>>> +
>>> +       if (rate <= 0) {
>>> +               DRM_ERROR("Rate is not set properly\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       req->rate = rate;
>>> +
>>> +       DRM_DEBUG_DP("%s: rate=%ld\n", __func__, req->rate);
>>> +       /* Set the new parent of mux if there is a new valid parent 
>>> */
>>> +       if (hw->clk && req->best_parent_hw->clk) {
>>> +               ret = clk_set_parent(hw->clk, 
>>> req->best_parent_hw->clk);
>> 
>> Why do we need to call clk consumer APIs from the clk provider ops? 
>> This
>> is pretty confusing what's going on here.
>> 
> Sure. Use of clk_set_parent is redundant here and I will remove it.
>>> +               if (ret) {
>>> +                       DRM_ERROR("%s: clk_set_parent failed: 
>>> ret=%d\n",
>>> +                                       __func__, ret);
>>> +                       return ret;
>>> +               }
>>> +       }
>>> +       return 0;
>>> +}
>>> +
>>> +static unsigned long dp_pll_mux_recalc_rate(struct clk_hw *hw,
>>> +                                       unsigned long parent_rate)
>>> +{
>>> +       struct clk_hw *div_clk_hw = NULL, *vco_clk_hw = NULL;
>>> +       struct dp_pll_vco_clk *vco;
>>> +
>>> +       div_clk_hw = clk_hw_get_parent(hw);
>>> +       if (!div_clk_hw)
>>> +               return 0;
>>> +
>>> +       vco_clk_hw = clk_hw_get_parent(div_clk_hw);
>>> +       if (!vco_clk_hw)
>>> +               return 0;
>>> +
>>> +       vco = to_dp_vco_hw(vco_clk_hw);
>>> +       if (!vco)
>>> +               return 0;
>>> +
>>> +       if (vco->rate == DP_VCO_HSCLK_RATE_8100MHZDIV1000)
>>> +               return (vco->rate / 6);
>>> +       else if (vco->rate == DP_VCO_HSCLK_RATE_5400MHZDIV1000)
>>> +               return (vco->rate / 4);
>>> +       else
>>> +               return (vco->rate / 2);
>>> +}
>>> +
>>> +static int dp_pll_10nm_get_provider(struct msm_dp_pll *pll,
>>> +                                    struct clk **link_clk_provider,
>>> +                                    struct clk **pixel_clk_provider)
>>> +{
>>> +       struct clk_hw_onecell_data *hw_data = pll->hw_data;
>>> +
>>> +       if (link_clk_provider)
>>> +               *link_clk_provider = 
>>> hw_data->hws[DP_LINK_CLK_SRC]->clk;
>>> +       if (pixel_clk_provider)
>>> +               *pixel_clk_provider = 
>>> hw_data->hws[DP_PIXEL_CLK_SRC]->clk;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct clk_ops dp_10nm_pclksel_clk_ops = {
>>> +       .get_parent = dp_pll_mux_get_parent_10nm,
>>> +       .set_parent = dp_pll_mux_set_parent_10nm,
>>> +       .recalc_rate = dp_pll_mux_recalc_rate,
>>> +       .determine_rate = dp_pll_clk_mux_determine_rate,
>>> +};
>>> +
>>> +static struct clk_hw *dp_pll_10nm_pixel_clk_sel(struct dp_pll_db 
>>> *pll_10nm)
>>> +{
>>> +       struct device *dev = &pll_10nm->pdev->dev;
>>> +       struct dp_pll_10nm_pclksel *pll_pclksel;
>>> +       struct clk_init_data pclksel_init = {
>>> +               .parent_data = disp_cc_parent_data_0,
>>> +               .num_parents = 3,
>>> +               .name = "dp_phy_pll_vco_div_clk",
>> 
>> So the dp_phy_pll_vco_div_clk has a potential parent that is
>> dp_phy_pll_vco_div_clk. Huh?
>> 
> Thats right. I will remove dp_phy_pll_vco_div_clk from parent list
> disp_cc_parent_data_0.
> 
>>> +               .ops = &dp_10nm_pclksel_clk_ops,
>>> +       };
>>> +       int ret;
>>> +
>>> +       pll_pclksel = devm_kzalloc(dev, sizeof(*pll_pclksel), 
>>> GFP_KERNEL);
>>> +       if (!pll_pclksel)
>>> +               return ERR_PTR(-ENOMEM);
>>> +
>>> +       pll_pclksel->pll = pll_10nm;
>>> +       pll_pclksel->shift = 0;
>>> +       pll_pclksel->width = 4;
>>> +       pll_pclksel->flags = CLK_DIVIDER_ONE_BASED;
>> 
>> Is this flag used?
>> 
> No it is redundant. I will remove.
>>> +       pll_pclksel->hw.init = &pclksel_init;
>>> +
>>> +       ret = clk_hw_register(dev, &pll_pclksel->hw);
>>> +       if (ret)
>>> +               return ERR_PTR(ret);
>>> +
>>> +       return &pll_pclksel->hw;
>>> +}
>>> +
>>> +static int dp_pll_10nm_register(struct dp_pll_db *pll_10nm)
>>> +{
>>> +       struct clk_hw_onecell_data *hw_data;
>>> +       int ret;
>>> +       struct clk_hw *hw;
>>> +
>>> +       struct msm_dp_pll *pll = pll_10nm->base;
>>> +       struct device *dev = &pll_10nm->pdev->dev;
>>> +       struct clk_hw **hws = pll_10nm->hws;
>>> +       int num = 0;
>>> +       struct clk_init_data vco_init = {
>>> +               .parent_data = &(const struct clk_parent_data){
>>> +                               .fw_name = "bi_tcxo",
>>> +               },
>>> +               .num_parents = 1,
>>> +               .name = "dp_vco_clk",
>>> +               .ops = &dp_10nm_vco_clk_ops,
>>> +       };
>> 
>> I thought the plan was to not have a vco clk? Just expose the two clks
>> for the link and the vco divider. Furthermore, drop the divider
>> "parents" and implement a single clk that programs the right divider
>> value for the various link rates chosen.
>> 
This will be taken care at later point of time.

>>> +
>>> +       DRM_DEBUG_DP("DP->id = %d", pll_10nm->id);
>>> +
>>> +       hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
>>> +                              NUM_PROVIDED_CLKS * sizeof(struct 
>>> clk_hw *),
>>> +                              GFP_KERNEL);
>>> +       if (!hw_data)
>>> +               return -ENOMEM;
>>> +
>>> +       dp_vco_clk.hw.init = &vco_init;
>>> +       ret = clk_hw_register(dev, &dp_vco_clk.hw);
>>> +       if (ret)
>>> +               return ret;
>>> +       hws[num++] = &dp_vco_clk.hw;
>>> +
>>> +       hw = clk_hw_register_fixed_factor(dev, "dp_phy_pll_link_clk",
>>> +                               "dp_vco_clk", CLK_SET_RATE_PARENT, 1, 
>>> 10);
>>> +
>>> +       if (IS_ERR(hw))
>>> +               return PTR_ERR(hw);
>>> +       hws[num++] = hw;
>>> +       hw_data->hws[DP_LINK_CLK_SRC] = hw;
>>> +
>>> +       hw = clk_hw_register_fixed_factor(dev, 
>>> "dp_vco_divsel_two_clk_src",
>>> +                                       "dp_vco_clk",  0, 1, 2);
>>> +       if (IS_ERR(hw))
>>> +               return PTR_ERR(hw);
>>> +       hws[num++] = hw;
>>> +
>>> +       hw = clk_hw_register_fixed_factor(dev, 
>>> "dp_vco_divsel_four_clk_src",
>>> +                                        "dp_vco_clk", 0, 1, 4);
>>> +       if (IS_ERR(hw))
>>> +               return PTR_ERR(hw);
>>> +       hws[num++] = hw;
>>> +
>>> +       hw = clk_hw_register_fixed_factor(dev, 
>>> "dp_vco_divsel_six_clk_src",
>>> +                                        "dp_vco_clk", 0, 1, 6);
>>> +       if (IS_ERR(hw))
>>> +               return PTR_ERR(hw);
>>> +       hws[num++] = hw;
>>> +
>>> +       hw = dp_pll_10nm_pixel_clk_sel(pll_10nm);
>>> +       if (IS_ERR(hw))
>>> +               return PTR_ERR(hw);
>>> +
>>> +       hws[num++] = hw;
>>> +       hw_data->hws[DP_PIXEL_CLK_SRC] = hw;
>>> +
>>> +       pll_10nm->num_hws = num;
>>> +
>>> +       hw_data->num = NUM_PROVIDED_CLKS;
>>> +       pll->hw_data = hw_data;
>>> +
>>> +       ret = of_clk_add_hw_provider(dev->of_node, 
>>> of_clk_hw_onecell_get,
>>> +                                    pll->hw_data);
>>> +       if (ret) {
>>> +               DRM_DEV_ERROR(dev, "failed to register clk provider: 
>>> %d\n",
>>> +                               ret);
>>> +               return ret;
>>> +       }
>>> +
>>> +       return ret;
>>> +}
>>> +
>>> +int msm_dp_pll_10nm_init(struct msm_dp_pll *pll, int id)
>>> +{
>>> +       struct dp_pll_db *dp_10nm_pll;
>>> +       struct platform_device *pdev = pll->pdev;
>>> +       int ret;
>>> +
>>> +       dp_10nm_pll = devm_kzalloc(&pdev->dev,
>>> +                                       sizeof(*dp_10nm_pll), 
>>> GFP_KERNEL);
>>> +       if (!dp_10nm_pll)
>>> +               return -ENOMEM;
>>> +
>>> +       DRM_DEBUG_DP("DP PLL%d", id);
>>> +
>>> +       dp_10nm_pll->base = pll;
>>> +       dp_10nm_pll->pdev = pll->pdev;
>>> +       dp_10nm_pll->id = id;
>>> +       dp_pdb = dp_10nm_pll;
>>> +       pll->priv = (void *)dp_10nm_pll;
>>> +       dp_vco_clk.priv = pll;
>>> +
>>> +       ret = of_property_read_u32(pdev->dev.of_node, "cell-index",
>>> +                               &dp_10nm_pll->index);
>>> +       if (ret) {
>>> +               DRM_ERROR("Unable to get the cell-index ret=%d\n", 
>>> ret);
>>> +               dp_10nm_pll->index = 0;
>>> +       }
>> 
>> Is the cell-index used for anything?
>> 
> No it is redundant and will be removed in next patch.
>>> +
>>> +       ret = dp_pll_10nm_register(dp_10nm_pll);
>>> +       if (ret) {
>>> +               DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: 
>>> %d\n", ret);
>>> +               return ret;
>>> +       }
>>> +
>>> +       pll->get_provider = dp_pll_10nm_get_provider;
>>> +
>>> +       return ret;
>>> +}
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
