Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4153BF6E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545D610E83B;
	Thu,  2 Jun 2022 20:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28E210F511
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:13:38 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id ea7so4276766qvb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p83Y3y+tvsDyWEgZasq7nG4b9PU/QPx+kqT2lwYJ1e8=;
 b=iSYWGJGHUBdEa5QCXIeK5xyTCQH+48CQWo72pAMJthSMSZJEBHVix6wVzjf/Rvo235
 NXAmyXNhW02KvW6kW89lUOU0Ll6PeYElyPKGJ4YJAAprbqoWEkCtcAdolP8DAXh/gkFo
 0SQY+waNUYI7oOsKIbg3464q5UhRYqX1ER2MYp+jhQofHPM+iXQo5A0xu9cxFaZufWTt
 XUOYqC6WNsayw2RSwlVc1IY4uhEtZ9aSOSMyCb+NeIXVU7wkp1YDmpQA82YVaWjJ5+vS
 Uhwj9xyReLsca2Pl2lKisGQhagotAeQ87XNEPEJbm+HJw3pfUWR07HuP4O8AiKEGpfad
 +8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p83Y3y+tvsDyWEgZasq7nG4b9PU/QPx+kqT2lwYJ1e8=;
 b=K40ohUvrdsC/rcvoD5gojjtlqmxf9Sn+8Z0MiGsK5zmzDpwLbWaJkn7Fg+kCsk/Yj1
 EACnF3v64ciaJDl8g9dDxH/xpvNag7wUe7cNKn3YTm0na/RhKl/KTCkYg87ZknTPuB2z
 XXDl2E+oKrO/jDprhXXorQdgp+Lo4ELN/bOpbVOYjSnnZJPfuq4qmudRRtQcD4nX4JsH
 sviUEug3xqVPidAuzsXHb7oWswSQNdm+B5osQdwCLp0JZQbpYzutT9truwMrjqvDp9CH
 QxeDrEvOV8hKkfp7aoUpsuxLM45N4vPiPmBISkcfWucpTCHjTLY0tNKmKhAfGLT7Qiji
 A3mA==
X-Gm-Message-State: AOAM531/iA/qSPtJ+jNEgxy3F5gLZdLGdfP1e3PR+AksrjBION86/4t6
 dyWzm6M0x8EffNrSX24EhGUgrcw8fnCQuOB+LBKWAg==
X-Google-Smtp-Source: ABdhPJwfBX6o6J1edsdk/zUbS0B4K84TeWsW4HXJs9NBH71FqMBbwWXjNQPxr4U5VcvzdKKv0ROVn7D/kZra9jSv80k=
X-Received: by 2002:a05:6214:20ef:b0:462:5fb6:40ed with SMTP id
 15-20020a05621420ef00b004625fb640edmr4711849qvk.73.1654200817813; Thu, 02 Jun
 2022 13:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
 <d7084452-ea90-3a8b-d39a-b09d9f45f839@quicinc.com>
 <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
 <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com>
 <CAA8EJppfWfP-bZLOYF8QBe6kW6gBBw5eXpzzDA6GFo8U7g=jRQ@mail.gmail.com>
 <963f5ef5-4b1d-6b0d-5b6d-0d6136e9e8d3@quicinc.com>
In-Reply-To: <963f5ef5-4b1d-6b0d-5b6d-0d6136e9e8d3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Jun 2022 23:13:26 +0300
Message-ID: <CAA8EJppCiN65NV7w9TyR=P+XzGPVxZJoAZoX5+XjxKwXsL_FQg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: less magic numbers in msm_mdss_enable
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jun 2022 at 21:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/1/2022 1:04 PM, Dmitry Baryshkov wrote:
> > On Wed, 1 Jun 2022 at 20:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/1/2022 2:46 AM, Dmitry Baryshkov wrote:
> >>> On Wed, 1 Jun 2022 at 01:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>> On 5/31/2022 5:18 AM, Dmitry Baryshkov wrote:
> >>>>> Replace magic register writes in msm_mdss_enable() with version that
> >>>>> contains less magic and more variable names that can be traced back to
> >>>>> the dpu_hw_catalog or the downstream dtsi files.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
> >>>>>     1 file changed, 71 insertions(+), 8 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> >>>>> index 0454a571adf7..2a48263cd1b5 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >>>>> @@ -21,6 +21,7 @@
> >>>>>     #define HW_REV                              0x0
> >>>>>     #define HW_INTR_STATUS                      0x0010
> >>>>>
> >>>>> +#define UBWC_DEC_HW_VERSION          0x58
> >>>>>     #define UBWC_STATIC                 0x144
> >>>>>     #define UBWC_CTRL_2                 0x150
> >>>>>     #define UBWC_PREDICTION_MODE                0x154
> >>>>> @@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >>>>>         return 0;
> >>>>>     }
> >>>>>
> >>>>> +#define UBWC_1_0 0x10000000
> >>>>> +#define UBWC_2_0 0x20000000
> >>>>> +#define UBWC_3_0 0x30000000
> >>>>> +#define UBWC_4_0 0x40000000
> >>>>> +
> >>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
> >>>>> +                                    u32 ubwc_static)
> >>>>> +{
> >>>>> +     writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
> >>>>> +}
> >>>>> +
> >>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
> >>>>> +                                    unsigned int ubwc_version,
> >>>>> +                                    u32 ubwc_swizzle,
> >>>>> +                                    u32 highest_bank_bit,
> >>>>> +                                    u32 macrotile_mode)
> >>>>> +{
> >>>>> +     u32 value = (ubwc_swizzle & 0x1) |
> >>>>> +                 (highest_bank_bit & 0x3) << 4 |
> >>>>> +                 (macrotile_mode & 0x1) << 12;
> >>>>> +
> >>>>> +     if (ubwc_version == UBWC_3_0)
> >>>>> +             value |= BIT(10);
> >>>>> +
> >>>>> +     if (ubwc_version == UBWC_1_0)
> >>>>> +             value |= BIT(8);
> >>>>> +
> >>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>> +}
> >>>>> +
> >>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
> >>>>> +                                    unsigned int ubwc_version,
> >>>>> +                                    u32 ubwc_swizzle,
> >>>>> +                                    u32 ubwc_static,
> >>>>> +                                    u32 highest_bank_bit,
> >>>>> +                                    u32 macrotile_mode)
> >>>>> +{
> >>>>> +     u32 value = (ubwc_swizzle & 0x7) |
> >>>>> +                 (ubwc_static & 0x1) << 3 |
> >>>>> +                 (highest_bank_bit & 0x7) << 4 |
> >>>>> +                 (macrotile_mode & 0x1) << 12;
> >>>>> +
> >>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>> +
> >>>>> +     if (ubwc_version == UBWC_3_0) {
> >>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
> >>>>> +             writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
> >>>>> +     } else {
> >>>>> +             writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
> >>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
> >>>>> +     }
> >>>>> +}
> >>>>> +
> >>>>
> >>>> Is it possible to unify the above functions by having the internal
> >>>> ubwc_version checks?
> >>>
> >>> Note, it's not the ubwc_version, it is the ubwc_dec_hw_version. And
> >>> also different functions take different sets of arguments.
> >>>
> >>>> It seems like msm_mdss_setup_ubwc_dec_xxx can keep growing.
> >>>>
> >>>> I have not looked into each bit programming but from the top level so
> >>>> feel free to correct if wrong but it seems both do write UBWC_STATIC
> >>>> (different values based on different UBWC versions) and write some extra
> >>>> registers based on version
> >>>
> >>> This is what both the current code and the downstream do. See
> >>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/zeus-s-oss/techpack/display-drivers/msm/sde/sde_hw_top.c#L312
> >>>
> >>
> >> Thanks for pointing to the downstream method for this,
> >>
> >> This is exactly what i was also suggesting to do when I mentioned
> >> unifying the above functions.
> >>
> >> So instead of having a separate function for each version why not handle
> >> all the versions in the same function like what the link you have shown
> >> does.
> >
> > I wouldn't like that. The downstream uses hw_catalog to pass all
> > possible parameters. We do not, so we'd have a whole set of artificial
> > values.
> >
>
> Now that you brought that up, why cannot even upstream dpu start using
> catalog for ubwc settings?

Because msm_mdss lives out of disp/dpu1. And using the disp/dpu1 for
it would be an inversion of dependencies.
I like the fact that msm_mdss is independent of mdp/dpu drivers and I
do not want to add such dependency.

>
> /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
>   * @id:                index identifying this block
>   * @base:              register base offset to mdss
>   * @features           bit mask identifying sub-blocks/features
>   * @highest_bank_bit:  UBWC parameter
>   * @ubwc_static:       ubwc static configuration
>   * @ubwc_swizzle:      ubwc default swizzle setting
>   * @clk_ctrls          clock control register definition
>   */
> struct dpu_mdp_cfg {
>      DPU_HW_BLK_INFO;
>      u32 highest_bank_bit;
>      u32 ubwc_swizzle;
>      struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
> };
>
> We already do seem to have a couple of parameters. have to add the others.
>
> That way the number of functions wont keep growing.
>
> >>
> >>>>
> >>>>>     static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >>>>>     {
> >>>>>         int ret;
> >>>>> +     u32 hw_rev;
> >>>>>
> >>>>>         ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
> >>>>>         if (ret) {
> >>>>> @@ -149,26 +204,34 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >>>>>         if (msm_mdss->is_mdp5)
> >>>>>                 return 0;
> >>>>>
> >>>>> +     hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
> >>>>> +     dev_info(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
> >>>>> +     dev_info(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
> >>>>> +             readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
> >>>>
> >>>> we are already printing the HW version here
> >>>>
> >>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c#L1096
> >>>>
> >>>> Do you want to remove that print then? May be. Let me take a look.
> >>>
> >>> [skipped]
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
