Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB652C64E
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 00:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EBC113F6E;
	Wed, 18 May 2022 22:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5004D113F71
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 22:32:39 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id p3so3025167qvi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q4ZykJLS2PHvtKcHOB6T4RNNj1KqRzGThJTU8frssAg=;
 b=y1xoNtqUkZZAr/rx0wToIyFvFumWFv4hC/2Toris70/ANsYesC6y5Un53kA4rjuISh
 uPCNj9R+mjtkGESDd5osMtnSbDFs/Ji9ktcH+Py+8Mat7HhLymtR8+DFRRBdQR1Exe8Z
 9JIgo395RqD/sTZ6npkHLtRKYLGstXvLpRr/YfY9dP3XYff/vDqjppopc5KNDpU7ybwB
 BxZ7R/elaHFqk3ZCun2cg6p+dOb64JH7F4zlQeG925hruDKeZ70nbCsMGxPMZMxI+iyn
 3H/6yFhfPhaKG3M1HXVxDAkMbBfVkWCwvvHJN9tQBKlVl8adUE8Ag0JqUPlCNDtsGSBq
 3hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q4ZykJLS2PHvtKcHOB6T4RNNj1KqRzGThJTU8frssAg=;
 b=dks/m006yqYORPVXDNPW3B3lknBEJTKnziiRKa525L8LAGcWbOeN4VFZoAGS2LMR7a
 qOh6Z9aTE5iPhiRDnNZ+/qAJk6eI7JZBDwlul8tQj0CGUy6GKnr4WuxtSd2m00SkVFuf
 TqSdJ9xpVl3qc8ma2icXD/gwPn55TIV3dlW6FIAt0+1b1BLprqHTeWQ8i4ZURXvlakAw
 +TfkDP+ZWPHkh/9K9GrifJhUQa0u9Gc1ElspfTURHvqdTwiLhF0qkLKSoTJ+LjcotvF5
 gkMnU6fFzG5XyxQkQG5oHwugRoDZwD0xQp8/ibKKVMRgERSsjXh+8S7S1OVFi2chuT90
 mVsw==
X-Gm-Message-State: AOAM531HYDUdEYhOkg59xzd/Pnha6a5ryTatvD9u2Fdz1b5guRwYZsjS
 mWBUX67t53Ca9XDdFKQnyHXU43HSzlWg4sd7EYPl2w==
X-Google-Smtp-Source: ABdhPJx1L9bXYzm3gf4KAjO6FwK/XzF+nPQZRGAYiWD7kLLPsTwrs+dtkkv0ie3lfq/pVh+bG8MF726tSsT1JUFLVYM=
X-Received: by 2002:a0c:ac02:0:b0:45a:91a4:c11b with SMTP id
 l2-20020a0cac02000000b0045a91a4c11bmr1681179qvb.119.1652913158352; Wed, 18
 May 2022 15:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <1652909790-16245-1-git-send-email-quic_khsieh@quicinc.com>
 <1652909790-16245-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652909790-16245-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 May 2022 01:32:27 +0300
Message-ID: <CAA8EJprLY1M2hxEzkQPv7mwcfZ54kOXEkkBK8LiRvZYTSPR8kA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] phy/qualcomm: add regulator_set_load to edp phy
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 19 May 2022 at 00:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..fbe0be0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,14 +87,20 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int num_consumers = ARRAY_SIZE(edp->supplies);

No need to. ARRAY_SIZE is compile-time calculated.

> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       for (i = num_consumers - 1; i >= 0; --i)
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);

Please. Change this to the ascending order or provide a good
description why it's done the other way. Your pointer to
regulator_bulk_enable() is not valid, as it processes arrays in the
ascending order.

> +
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>         if (ret)
>                 return ret;
>
> @@ -635,6 +641,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>
>         edp->supplies[0].supply = "vdda-phy";
>         edp->supplies[1].supply = "vdda-pll";
> +       edp->enable_load[0] = 21800;    /* load for 1.2 V vdda-phy supply */
> +       edp->enable_load[1] = 36000;    /* load for 1.2 V vdda-pll supply */

Isn't vdda-pll 0.9V? On sm8250 I see VDD_A_USB0_SS_DP_1P2 and
VDD_A_USB0_SS_DP_CORE (which is 0.9V).

>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
>                 return ret;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
