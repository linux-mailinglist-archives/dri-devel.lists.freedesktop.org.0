Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D523152C100
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 19:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDA6113E59;
	Wed, 18 May 2022 17:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CF8113E43;
 Wed, 18 May 2022 17:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652895378; x=1684431378;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4lEZS7ZjpuLroh1r56uWxsc7hOKN9/qPtTtqeb2mxMw=;
 b=fmFWM+dGSnvvCjlbBGIBQRKlj4+r3KzEC61PnYQu2w44RGMsYdbG0RGi
 hBHruHIRBezXd1WuNo/lI+sZMuKWbk1aDikAw8OqzhjTj1kv49EPLkLR2
 QccoMBzjcS2XjCS4vaNUGklFm5C/ZOIpXCt9MAR5oJBYFEUMk+oMZVDam c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 May 2022 10:36:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 10:36:16 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 18 May 2022 10:36:16 -0700
Received: from [10.110.42.114] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 18 May
 2022 10:36:15 -0700
Message-ID: <c5decaeb-2e88-ef23-ce6c-50d3d853766b@quicinc.com>
Date: Wed, 18 May 2022 10:36:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/2] phy/qcom: add regulator_set_load to edp/dp phy
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
 <1652892186-22346-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpr9znfxLK+kDstMFFk3V8goyaceGXi4sDc9ghz4eryXMg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpr9znfxLK+kDstMFFk3V8goyaceGXi4sDc9ghz4eryXMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/2022 10:12 AM, Dmitry Baryshkov wrote:
> On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> This patch add regulator_set_load() to both eDP and DP phy driver
>> to have totally control regulators.
>>
>> Changes in v2:
>> -- no regulator_set_laod() before disable regulator
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++----
>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 13 +++++++++++++
> Split into -edp and -qmp part.
>
>>   2 files changed, 34 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index cacd32f..9b55095 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -87,17 +87,24 @@ struct qcom_edp {
>>
>>          struct clk_bulk_data clks[2];
>>          struct regulator_bulk_data supplies[2];
>> +       int enable_load[2];
>> +       int disable_load[2];
> As noticed in the review of the previous patch, disable_load is unnecessary.
>
>>   };
>>
>>   static int qcom_edp_phy_init(struct phy *phy)
>>   {
>>          struct qcom_edp *edp = phy_get_drvdata(phy);
>>          int ret;
>> +       int num_consumers = ARRAY_SIZE(edp->supplies);
>> +       int i;
>>
>> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>>          if (ret)
>>                  return ret;
>>
>> +       for (i = num_consumers - 1; i >= 0; --i)
>> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
>> +
>>          ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
>>          if (ret)
>>                  goto out_disable_supplies;
>> @@ -425,9 +432,15 @@ static int qcom_edp_phy_power_off(struct phy *phy)
>>   static int qcom_edp_phy_exit(struct phy *phy)
>>   {
>>          struct qcom_edp *edp = phy_get_drvdata(phy);
>> +       int num_consumers = ARRAY_SIZE(edp->supplies);
>> +       int i;
>>
>>          clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
>> -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
>> +
>> +       for (i = num_consumers - 1; i >= 0; --i)
>> +               regulator_set_load(edp->supplies[i].consumer, edp->disable_load[i]);
>> +
>> +       regulator_bulk_disable(num_consumers, edp->supplies);
>>
>>          return 0;
>>   }
>> @@ -633,8 +646,12 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>>          if (ret)
>>                  return ret;
>>
>> -       edp->supplies[0].supply = "vdda-phy";
>> -       edp->supplies[1].supply = "vdda-pll";
>> +       edp->supplies[0].supply = "vdda-1p2";
>> +       edp->supplies[1].supply = "vdda-0p9";
> NAK, You can not randomly change supply names.

if you do no change here, then we have to change dtsi.

They are not match.



>
>> +       edp->enable_load[0] = 21800;    /* 1.2 V */
>> +       edp->enable_load[1] = 36000;    /* 1.2 V */
>> +       edp->disable_load[0] = 4;       /* 0.9 V */
>> +       edp->disable_load[1] = 4;       /* 10.9V */
> Again, 10.9V here. Kuogee. Have you read the review points?
I have read it. but forget to make  change at edp file.
>
>>          ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>>          if (ret)
>>                  return ret;
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index b144ae1..0a4c8a8 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -3130,6 +3130,7 @@ struct qmp_phy_cfg {
>>          int num_resets;
>>          /* regulators to be requested */
>>          const char * const *vreg_list;
>> +       const unsigned int *vreg_enable_load;
>>          int num_vregs;
>>
>>          /* array of registers with different offsets */
>> @@ -3346,6 +3347,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>          "vdda-phy", "vdda-pll",
>>   };
>>
>> +static const unsigned int qmp_phy_vreg_enable_load[] = {
>> +       21800, 36000
>> +};
>> +
>>   static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>>          .type                   = PHY_TYPE_USB3,
>>          .nlanes                 = 1,
>> @@ -4072,6 +4077,7 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
>>          .reset_list             = msm8996_usb3phy_reset_l,
>>          .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>>          .vreg_list              = qmp_phy_vreg_l,
>> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
>>          .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>>          .regs                   = qmp_v4_usb3phy_regs_layout,
>>
>> @@ -4139,6 +4145,7 @@ static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
>>          .reset_list             = msm8996_usb3phy_reset_l,
>>          .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>>          .vreg_list              = qmp_phy_vreg_l,
>> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
>>          .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>>          .regs                   = qmp_v4_usb3phy_regs_layout,
>>
>> @@ -5008,6 +5015,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>>                  return 0;
>>          }
>>
>> +       if (cfg->vreg_enable_load) {
>> +               for (i = cfg->num_vregs - 1; i >= 0; --i)
> What's the point of iterating the list backwards?

do no  know,

I just follow the order from regulator_bulk_enable()

>
>> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_enable_load[i]);
>> +       }
>> +
>>          /* turn on regulator supplies */
>>          ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>          if (ret) {
>> @@ -5116,6 +5128,7 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
>>
>>          clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
>>
>> +       /* no minimum load set required before disable regulator */
> No otneed for the comment.
>
>>          regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>
>>          mutex_unlock(&qmp->phy_mutex);
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>
