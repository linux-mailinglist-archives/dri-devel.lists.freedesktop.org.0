Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72452C1AA
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 19:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFE5113F13;
	Wed, 18 May 2022 17:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140B9113F2B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 17:53:03 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t25so4936686lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bHXUs1sphneg6gPI/YEdiZAYQkq1Vx1rkOSsPvFYenY=;
 b=VdRh9A8jpOxUA+WIJ23MyvZOTzvS8CKoXMypbsIv9+mnStyDA8gxg9O+sYaaN9eEJh
 e95J3i7uJ0hTlflmQUsxxZBxVty9loaKPXJtmgA/idb//zROXyL4XNYvdm6NpVOyuOnX
 FLl/3kVdjeuip9Yc4gKrVTKMdfm7t2+Ago+j9++8g2c1E6pJTnM0YZnT2ET0M7tV/kIs
 DED2cxnvdLe3iftVkl5JNz6tvmexJbJBJIp+7lqeotAMBBwbAVhtbTkfr4U0IJNxkbCi
 6xUi07uSKaC5CKgQDqrkIgtUqu6pfM6SC8AzGjNe++Av1KH5f8GlrU62GpFiAMupU5iI
 kCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bHXUs1sphneg6gPI/YEdiZAYQkq1Vx1rkOSsPvFYenY=;
 b=hByjL7xFybv/92WLJe81Yd7LIn5QkjOMmwi4RNnUztNajQX7Jpb9yDSYGJUNMI3Y3k
 UmaZHxjSmuYk3O2RLXs50GXwSTtXOeKTQVyPHopVjb1EgXOPSZg3/ez++lDDSm3MmR9k
 pio2/HeFknhTHSm3AzDxOqgK2g2bNFBMC/k9wGn3ORCV/wY6zltBakMkiORckwJk6HXV
 woGdfqeoLme2gCJrFEGA/QzWop7BTx3ZZPIbUebqjNBE+Uat5+t1GhAHjnxNUjPs2v8H
 lkT2QSLPzK/S0aqc+kHIoUZOFnrT3dIOoLtYtUnSyBxfN5ay8Tphj/GUgUr+hr5mG6Ki
 uNxQ==
X-Gm-Message-State: AOAM530xYVIfHhxeuY3iETd7OC3cid3a0QJzm60gWmKIYvcRqNqd8HR1
 vErRKXRfksIq3hMl2YHNJkY30A==
X-Google-Smtp-Source: ABdhPJz6d7WK+2FpbvcVt7IiAihWBw3AcT/h+c/hnH2vcO8gAjUMQ2vwbPQeWXocQIfeG68bq+vUIQ==
X-Received: by 2002:a19:fc1d:0:b0:473:dc7c:d012 with SMTP id
 a29-20020a19fc1d000000b00473dc7cd012mr465840lfi.92.1652896381260; 
 Wed, 18 May 2022 10:53:01 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b0047255d2111esm13791lfr.77.2022.05.18.10.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 10:53:00 -0700 (PDT)
Message-ID: <42b0034f-0be1-2951-d6a6-bf0a51cf0fc2@linaro.org>
Date: Wed, 18 May 2022 20:52:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] phy/qcom: add regulator_set_load to edp/dp phy
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
 <1652892186-22346-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpr9znfxLK+kDstMFFk3V8goyaceGXi4sDc9ghz4eryXMg@mail.gmail.com>
 <c5decaeb-2e88-ef23-ce6c-50d3d853766b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c5decaeb-2e88-ef23-ce6c-50d3d853766b@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/05/2022 20:36, Kuogee Hsieh wrote:
> 
> On 5/18/2022 10:12 AM, Dmitry Baryshkov wrote:
>> On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>> This patch add regulator_set_load() to both eDP and DP phy driver
>>> to have totally control regulators.
>>>
>>> Changes in v2:
>>> -- no regulator_set_laod() before disable regulator
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++----
>>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 13 +++++++++++++
>> Split into -edp and -qmp part.
>>
>>>   2 files changed, 34 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c 
>>> b/drivers/phy/qualcomm/phy-qcom-edp.c
>>> index cacd32f..9b55095 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>>> @@ -87,17 +87,24 @@ struct qcom_edp {
>>>
>>>          struct clk_bulk_data clks[2];
>>>          struct regulator_bulk_data supplies[2];
>>> +       int enable_load[2];
>>> +       int disable_load[2];
>> As noticed in the review of the previous patch, disable_load is 
>> unnecessary.
>>
>>>   };
>>>
>>>   static int qcom_edp_phy_init(struct phy *phy)
>>>   {
>>>          struct qcom_edp *edp = phy_get_drvdata(phy);
>>>          int ret;
>>> +       int num_consumers = ARRAY_SIZE(edp->supplies);
>>> +       int i;
>>>
>>> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), 
>>> edp->supplies);
>>> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>>>          if (ret)
>>>                  return ret;
>>>
>>> +       for (i = num_consumers - 1; i >= 0; --i)
>>> +               regulator_set_load(edp->supplies[i].consumer, 
>>> edp->enable_load[i]);
>>> +
>>>          ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), 
>>> edp->clks);
>>>          if (ret)
>>>                  goto out_disable_supplies;
>>> @@ -425,9 +432,15 @@ static int qcom_edp_phy_power_off(struct phy *phy)
>>>   static int qcom_edp_phy_exit(struct phy *phy)
>>>   {
>>>          struct qcom_edp *edp = phy_get_drvdata(phy);
>>> +       int num_consumers = ARRAY_SIZE(edp->supplies);
>>> +       int i;
>>>
>>>          clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
>>> -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), 
>>> edp->supplies);
>>> +
>>> +       for (i = num_consumers - 1; i >= 0; --i)
>>> +               regulator_set_load(edp->supplies[i].consumer, 
>>> edp->disable_load[i]);
>>> +
>>> +       regulator_bulk_disable(num_consumers, edp->supplies);
>>>
>>>          return 0;
>>>   }
>>> @@ -633,8 +646,12 @@ static int qcom_edp_phy_probe(struct 
>>> platform_device *pdev)
>>>          if (ret)
>>>                  return ret;
>>>
>>> -       edp->supplies[0].supply = "vdda-phy";
>>> -       edp->supplies[1].supply = "vdda-pll";
>>> +       edp->supplies[0].supply = "vdda-1p2";
>>> +       edp->supplies[1].supply = "vdda-0p9";
>> NAK, You can not randomly change supply names.
> 
> if you do no change here, then we have to change dtsi.
> 
> They are not match.

Where is no match? I don't see any in-kernel dtsi using them.


>>> +       edp->enable_load[0] = 21800;    /* 1.2 V */
>>> +       edp->enable_load[1] = 36000;    /* 1.2 V */
>>> +       edp->disable_load[0] = 4;       /* 0.9 V */
>>> +       edp->disable_load[1] = 4;       /* 10.9V */
>> Again, 10.9V here. Kuogee. Have you read the review points?
> I have read it. but forget to make  change at edp file.
>>
>>>          ret = devm_regulator_bulk_get(dev, 
>>> ARRAY_SIZE(edp->supplies), edp->supplies);
>>>          if (ret)
>>>                  return ret;
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
>>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>>> index b144ae1..0a4c8a8 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>>> @@ -3130,6 +3130,7 @@ struct qmp_phy_cfg {
>>>          int num_resets;
>>>          /* regulators to be requested */
>>>          const char * const *vreg_list;
>>> +       const unsigned int *vreg_enable_load;
>>>          int num_vregs;
>>>
>>>          /* array of registers with different offsets */
>>> @@ -3346,6 +3347,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>>          "vdda-phy", "vdda-pll",
>>>   };
>>>
>>> +static const unsigned int qmp_phy_vreg_enable_load[] = {
>>> +       21800, 36000
>>> +};
>>> +
>>>   static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>>>          .type                   = PHY_TYPE_USB3,
>>>          .nlanes                 = 1,
>>> @@ -4072,6 +4077,7 @@ static const struct qmp_phy_cfg 
>>> sm8250_usb3phy_cfg = {
>>>          .reset_list             = msm8996_usb3phy_reset_l,
>>>          .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>>>          .vreg_list              = qmp_phy_vreg_l,
>>> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
>>>          .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>>>          .regs                   = qmp_v4_usb3phy_regs_layout,
>>>
>>> @@ -4139,6 +4145,7 @@ static const struct qmp_phy_cfg 
>>> sm8250_dpphy_cfg = {
>>>          .reset_list             = msm8996_usb3phy_reset_l,
>>>          .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>>>          .vreg_list              = qmp_phy_vreg_l,
>>> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,

So, you apply this change only to the sm8250 (sc7280) config. Are you 
sure that both of them have the same requirement?

Also there are other DP phy instances (sc8180x, sc7180). Do they have to 
be extended too?

>>>          .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>>>          .regs                   = qmp_v4_usb3phy_regs_layout,
>>>
>>> @@ -5008,6 +5015,11 @@ static int qcom_qmp_phy_com_init(struct 
>>> qmp_phy *qphy)
>>>                  return 0;
>>>          }
>>>
>>> +       if (cfg->vreg_enable_load) {
>>> +               for (i = cfg->num_vregs - 1; i >= 0; --i)
>> What's the point of iterating the list backwards?
> 
> do no  know,
> 
> I just follow the order from regulator_bulk_enable()

regulator_bulk_enable() iterates the list in the ascending order.

> 
>>
>>> +                       regulator_set_load(qmp->vregs[i].consumer, 
>>> cfg->vreg_enable_load[i]);
>>> +       }
>>> +
>>>          /* turn on regulator supplies */
>>>          ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>>          if (ret) {
>>> @@ -5116,6 +5128,7 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy 
>>> *qphy)
>>>
>>>          clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
>>>
>>> +       /* no minimum load set required before disable regulator */
>> No otneed for the comment.
>>
>>>          regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>
>>>          mutex_unlock(&qmp->phy_mutex);
>>> -- 
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>> Forum,
>>> a Linux Foundation Collaborative Project
>>>
>>


-- 
With best wishes
Dmitry
