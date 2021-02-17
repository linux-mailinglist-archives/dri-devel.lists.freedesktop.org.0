Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A293131D327
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 01:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100516E99E;
	Wed, 17 Feb 2021 00:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6946E4AD;
 Wed, 17 Feb 2021 00:06:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o15so337657wmq.5;
 Tue, 16 Feb 2021 16:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQqpqg6jSzHG83op6n6dlIe74aKdQKtD9br7jGebjUw=;
 b=UNKYNkYO0LfnOS/TsdDDmSB9Njy/d4xhqsOEFDi91kfNRXvsy9i6E8+4Xs92EgAxrN
 A1mTLusx49wda93oKOT4RMx3bTUrvcfaxgEIVSl4XHMpTCil4glWs2iSvfVr6iyHKXLY
 Cs3dzbnSF0QEr0+Yfb3rpnUKydrhYi0froutx0YA6PhN7nufa3O/d8GEkwyJi14OZyoY
 LPqCtTMhSX0iuggc8z3bs+/YFWNh0wleqLw4d/WPK9zt3+dzWJ/ZK15W/jP72Vlc58zy
 flMdpeoSr2Yy4bBq1kNlxT1f0Tp+kyHAq0D70zPfgamSvqXRq7+hwONx4HJFfZQJ/5tq
 jrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQqpqg6jSzHG83op6n6dlIe74aKdQKtD9br7jGebjUw=;
 b=pI9kEYLdBIr6Yaq4qGrULiNKmTLTvnoRzox0G7B+g6PnT1lvv7LIWhrg9I1iXRUTAS
 VBLODA3CRMwNgwR7RBT/FVu0exxIL4ViSU0zIieh1lFFykIUoFh7gXhoLvf2ji1O2cJA
 64bFmnXaPZSFe5wc9O8HXDadYkJoDac+XK0Zfa3XIt8JvYH2rr4wEGN/hc8rxyVA9Jc1
 fTg9lvsuF85jgtLrqNPbrj6p9kWWQE4gvH4ADF0alxFGETk0BxHsvEXU+rmAFK08E1zA
 ea4bpXbWKI4AWl50r2GjAc1d7tyaLZ6u7QtREAEtbw2r1C3J3x0gaJ42SG/PhFFOBkqV
 41JA==
X-Gm-Message-State: AOAM533/TXxJe+7zgtcKYqjba6i9i7U8GfEeMUTT1ZFydkF/pe9DSrYQ
 KJvT/Mm54eKO9teVaGPB3xnqZK38xRU/HNchFWk=
X-Google-Smtp-Source: ABdhPJx/2suxGtJCRIigMjkQD6gjPWjzXEgtH7zFIY7Pf5+83ly/26LyReNhpwl+41tqGRJB5Zunt+GbkMx4vOPFL70=
X-Received: by 2002:a7b:c149:: with SMTP id z9mr4975291wmi.164.1613520364006; 
 Tue, 16 Feb 2021 16:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20210215161537.14696-1-jonathan@marek.ca>
 <20210215161537.14696-2-jonathan@marek.ca>
 <CAA8EJpo_Fs8Wj6zjH6BQqm=mG=qcGt3_JMj4nK-vsKCzr8tn1g@mail.gmail.com>
 <29231c68-0cc4-9d8a-8cb1-791511780bcd@marek.ca>
In-Reply-To: <29231c68-0cc4-9d8a-8cb1-791511780bcd@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Feb 2021 16:08:56 -0800
Message-ID: <CAF6AEGtyiD6vtYrgkB4X+B00=ew09_7bZA3ketZsZ2+M7aFR+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: add compatibles for sm8150/sm8250 display
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 10:06 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 2/16/21 11:54 AM, Dmitry Baryshkov wrote:
> > On Mon, 15 Feb 2021 at 19:25, Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> The driver already has support for sm8150/sm8250, but the compatibles were
> >> never added.
> >>
> >> Also inverse the non-mdp4 condition in add_display_components() to avoid
> >> having to check every new compatible in the condition.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
> >>   drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
> >>   3 files changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> index 551ae26f60da..5763f43200a0 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
> >>
> >>   MDSS:
> >>   Required properties:
> >> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> >> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
> >>   - reg: physical base address and length of contoller's registers.
> >>   - reg-names: register region names. The following region is required:
> >>     * "mdss"
> >> @@ -41,7 +41,7 @@ Optional properties:
> >>
> >>   MDP:
> >>   Required properties:
> >> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> >> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
> >>   - reg: physical base address and length of controller's registers.
> >>   - reg-names : register region names. The following region is required:
> >>     * "mdp"
> >
> > These two chunks should probably go to the separate patch 'dt-bindings:...'.
> >
>
> In this case I think its better to have this change in the same patch,
> but maybe one of the Robs will disagree.

I *think* typically the reason to split dt bindings into their own
patch is that devicetree@ list isn't interested in reviewing driver
changes, just binding changes..

In this case since it is just adding a compatible I think it is ok..
(or at least ok by me, but maybe other-Rob disagrees ;-))

> > Also, could you please pinpoint the reason for adding more
> > compatibility strings, while they map to the same internal data?
> > I think we might want instead to use some generic name for the dpu
> > block, like "qcom,dpu" or "qcom,mdp-dpu" instead of specifying the
> > platform name.
> >
>
> sdm845 and sc7180 aren't using generic compatibles, this is just being
> consistent with that.

It is good to have a device specific compatible up front, even if we
fallback to the more generic one for matching.. just in case we find a
reason for needing it later

BR,
-R

> >
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> index 5a8e3e1fc48c..fff12a4c8bfc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
> >>   static const struct of_device_id dpu_dt_match[] = {
> >>          { .compatible = "qcom,sdm845-dpu", },
> >>          { .compatible = "qcom,sc7180-dpu", },
> >> +       { .compatible = "qcom,sm8150-dpu", },
> >> +       { .compatible = "qcom,sm8250-dpu", },
> >>          {}
> >>   };
> >>   MODULE_DEVICE_TABLE(of, dpu_dt_match);
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> >> index 94525ac76d4e..928f13d4bfbc 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.c
> >> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
> >>           * Populate the children devices, find the MDP5/DPU node, and then add
> >>           * the interfaces to our components list.
> >>           */
> >> -       if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> >> -           of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> >> -           of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> >> +       if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
> >>                  ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> >>                  if (ret) {
> >>                          DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> >> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
> >>          { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> >>          { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> >>          { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> >> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> >> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> >>          {}
> >>   };
> >>   MODULE_DEVICE_TABLE(of, dt_match);
> >> --
> >> 2.26.1
> >>
> >
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
