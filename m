Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6CD3EADEE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 02:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D491F6E4A2;
	Fri, 13 Aug 2021 00:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944C26E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 00:28:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628814525; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Wzc6c47jdJP+SX2jmJlgxTZVRxNp8P8GJXI7b5FXiDQ=;
 b=gw750DG/WXHT0481np+qpsZ2nT9iN3Dd4r/UnVTOq9JjYXOvkDf3mEO6mHVZQaYWAmkwUqhS
 GJb7Lvr+LugQTZIQUGVWPZfDRsrrmpMW4wPmIJzBtdz2rOXawbkYHUGQEb55dSok6M+TSm0k
 tZ+/LEUxeH2A1pqgcSVZ1qcVUBc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6115bcbab14e7e2ecb154275 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Aug 2021 00:28:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 33638C4323A; Fri, 13 Aug 2021 00:28:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: sbillaka)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 144CAC433F1;
 Fri, 13 Aug 2021 00:28:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 13 Aug 2021 05:58:40 +0530
From: sbillaka@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org
Subject: Re: [PATCH v1 1/2] drm/msm/dp: Add support for SC7280 eDP
In-Reply-To: <CAE-0n52=mR0Zt8UZ3vOM-nt0UJszcFhi-eYfzDtD0bt3zhNA_Q@mail.gmail.com>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-2-git-send-email-sbillaka@codeaurora.org>
 <CAE-0n52=mR0Zt8UZ3vOM-nt0UJszcFhi-eYfzDtD0bt3zhNA_Q@mail.gmail.com>
Message-ID: <0b2aa426c8f511a29143f2a1117fe9a2@codeaurora.org>
X-Sender: sbillaka@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-12 06:11, Stephen Boyd wrote:
> Quoting Sankeerth Billakanti (2021-08-11 17:08:01)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index b131fd37..1096c44 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -856,9 +856,9 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>>  };
>> 
>>  static const struct dpu_intf_cfg sc7280_intf[] = {
>> -       INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +       INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>         INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -       INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>> +       INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>  };
>> 
>>  /*************************************************************
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index d2569da..06d5a2d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1244,7 +1244,9 @@ static int dp_ctrl_link_train(struct 
>> dp_ctrl_private *ctrl,
>>                 struct dp_cr_status *cr, int *training_step)
>>  {
>>         int ret = 0;
>> +       u8 *dpcd = ctrl->panel->dpcd;
>>         u8 encoding = DP_SET_ANSI_8B10B;
>> +       u8 ssc = 0, assr = 0;
> 
> Please don't initialize to zero and then overwrite it before using it.
> It hides usage before actual initialization bugs.
> 

Okay. I will change it.

>>         struct dp_link_info link_info = {0};
>> 
>>         dp_ctrl_config_ctrl(ctrl);
>> @@ -1254,9 +1256,21 @@ static int dp_ctrl_link_train(struct 
>> dp_ctrl_private *ctrl,
>>         link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>> 
>>         dp_aux_link_configure(ctrl->aux, &link_info);
>> +
>> +       if (dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5) {
>> +               ssc = DP_SPREAD_AMP_0_5;
>> +               drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 
>> 1);
>> +       }
>> +
>>         drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>>                                 &encoding, 1);
>> 
>> +       if (dpcd[DP_EDP_CONFIGURATION_CAP] & 
>> DP_ALTERNATE_SCRAMBLER_RESET_CAP) {
>> +               assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
>> +               drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
>> +                               &assr, 1);
>> +       }
>> +
>>         ret = dp_ctrl_link_train_1(ctrl, cr, training_step);
>>         if (ret) {
>>                 DRM_ERROR("link training #1 failed. ret=%d\n", ret);
>> @@ -1328,9 +1342,11 @@ static int 
>> dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>>         struct dp_io *dp_io = &ctrl->parser->io;
>>         struct phy *phy = dp_io->phy;
>>         struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
>> +       u8 *dpcd = ctrl->panel->dpcd;
> 
> const?
> 

Okay. I will change to const u8 *dpcd at all the required places.

>> 
>>         opts_dp->lanes = ctrl->link->link_params.num_lanes;
>>         opts_dp->link_rate = ctrl->link->link_params.rate / 100;
>> +       opts_dp->ssc = dpcd[DP_MAX_DOWNSPREAD] & 
>> DP_MAX_DOWNSPREAD_0_5;
>>         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>>                                         ctrl->link->link_params.rate * 
>> 1000);
>> 
>> @@ -1760,6 +1776,9 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>>         ctrl->link->link_params.num_lanes = 
>> ctrl->panel->link_info.num_lanes;
>>         ctrl->dp_ctrl.pixel_rate = 
>> ctrl->panel->dp_mode.drm_mode.clock;
>> 
>> +       if (ctrl->dp_ctrl.pixel_rate == 0)
>> +               return -EINVAL;
>> +
> 
> Why are we enabling the stream with a zero pixel clk?
> 

This was an error condition I encountered while bringing up sc7280. HPD 
processing was delayed and I got a commit with pixel clock = 0. I will 
recheck why this is happening.

>>         DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
>>                 ctrl->link->link_params.rate,
>>                 ctrl->link->link_params.num_lanes, 
>> ctrl->dp_ctrl.pixel_rate);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index ee5bf64..a772290 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -117,8 +117,36 @@ struct dp_display_private {
>>         struct dp_audio *audio;
>>  };
>> 
>> +struct msm_dp_config {
>> +       phys_addr_t io_start[3];
>> +       size_t num_dp;
>> +};
>> +
>> +static const struct msm_dp_config sc7180_dp_cfg = {
>> +       .io_start = { 0x0ae90000 },
>> +       .num_dp = 1,
>> +};
>> +
>> +static const struct msm_dp_config sc8180x_dp_cfg = {
>> +       .io_start = { 0xae90000, 0xae98000, 0 },
>> +       .num_dp = 3,
>> +};
>> +
>> +static const struct msm_dp_config sc8180x_edp_cfg = {
>> +       .io_start = { 0, 0, 0xae9a000 },
>> +       .num_dp = 3,
>> +};
>> +
>> +static const struct msm_dp_config sc7280_edp_cfg = {
>> +       .io_start = { 0xaea0000, 0 },
>> +       .num_dp = 2,
>> +};
> 
> Are all of these supposed to be here?

No. I will remove them. Only sc7280_edp_cfg will be there.

> 
>> +
>>  static const struct of_device_id dp_dt_match[] = {
>> -       {.compatible = "qcom,sc7180-dp"},
>> +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>> +       { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
>> +       { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg 
>> },
>> +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_cfg },
> 
> Please sort alphabetically on compatible string, it helps avoid
> conflicts in the future.

Okay

> 
>>         {}
>>  };
>> 
>> @@ -1408,7 +1436,7 @@ void msm_dp_irq_postinstall(struct msm_dp 
>> *dp_display)
>> 
>>         dp_hpd_event_setup(dp);
>> 
>> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
>>  }
>> 
>>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor 
>> *minor)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c 
>> b/drivers/gpu/drm/msm/dp/dp_parser.c
>> index 0519dd3..c05fc0a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>> @@ -248,6 +248,33 @@ static int dp_parser_clock(struct dp_parser 
>> *parser)
>>         return 0;
>>  }
>> 
>> +static int dp_parser_gpio(struct dp_parser *parser)
>> +{
>> +       struct device *dev = &parser->pdev->dev;
>> +       int ret;
>> +
>> +       parser->panel_bklt_gpio = devm_gpiod_get(dev, "panel-bklt",
>> +                       GPIOD_OUT_HIGH);
>> +       if (IS_ERR(parser->panel_bklt_gpio)) {
>> +               ret = PTR_ERR(parser->panel_bklt_gpio);
>> +               parser->panel_bklt_gpio = NULL;
>> +               DRM_ERROR("%s: cannot get panel-bklt gpio, %d\n", 
>> __func__, ret);
>> +               goto fail;
>> +       }
>> +
>> +       parser->panel_pwm_gpio = devm_gpiod_get(dev, "panel-pwm", 
>> GPIOD_OUT_HIGH);
>> +       if (IS_ERR(parser->panel_pwm_gpio)) {
>> +               ret = PTR_ERR(parser->panel_pwm_gpio);
>> +               parser->panel_pwm_gpio = NULL;
>> +               DRM_ERROR("%s: cannot get panel-pwm gpio, %d\n", 
>> __func__, ret);
>> +               goto fail;
>> +       }
>> +
>> +       DRM_INFO("gpio on");
>> +fail:
>> +       return 0;
>> +}
> 
> Don't we have pwm backlight drivers like
> drivers/video/backlight/pwm_bl.c to support this? This sort of thing
> doesn't belong in the dp driver.

Okay. I will explore it.

> 
>> +
>>  static int dp_parser_parse(struct dp_parser *parser)
>>  {
>>         int rc = 0;
>> @@ -269,6 +296,10 @@ static int dp_parser_parse(struct dp_parser 
>> *parser)
>>         if (rc)
>>                 return rc;
>> 
>> +       rc = dp_parser_gpio(parser);
>> +       if (rc)
>> +               return rc;
>> +
>>         /* Map the corresponding regulator information according to
>>          * version. Currently, since we only have one supported 
>> platform,
>>          * mapping the regulator directly.

Thank you,
Sankeerth
