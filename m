Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570BB543F2C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 00:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0549112E06;
	Wed,  8 Jun 2022 22:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9AA112E06
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 22:30:47 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id fu17so97790qtb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/NGZa6hS3QU47AvbSLK2GIuv57CIGfWo682J5ZRFd+M=;
 b=XJMeMhyzCMUm2owaMJ1iE92NLxC5exYof72g2v0sE+ZhYrpK7zgAz+BHp6EGTg/cQt
 1Lrj55QT/60zOGXDq/tfODnJM4EEPq/GuRTF2dlXbPmhq3UuoWotqY5HknEMc732sJac
 u1BLKhnTV9Q+4lSj7H9v0K5Rl+H9rtY13LsFv/UtcQX3PfC1nZOZb+ZmIf6MoxJrWVlL
 sn+K2WonojYz9lo+n7aDnLdl2l/xE2ut69JjqbvI9eo9fnqR2AtzUwanm29JunK19dOK
 4K5GnvvJDloWUOEifLWpkI995vH6XJwUm2VfMxl58cdH5VoePU23jYfmUxs8/On6x9Zf
 TMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NGZa6hS3QU47AvbSLK2GIuv57CIGfWo682J5ZRFd+M=;
 b=o1RNEZPFBW35XvkcW49HdeEnCFLrY6ynIWi4S0tO84+rn+F7xK8xXgPzVBGmA5pEso
 aiPYrHEvXjfTZ2ZmiiwJ9po37qpA59T2un8Ux6qP/ozT9+ryda2cVQyULiw+cD3+lVTG
 QGoA28zh9pXoPoQ8PXJXvzYwruSCW6mWreBGQOaMxFm8kWLhXixRvfPjrw5gKbPguIC+
 aNfl6EhdxfazSCWx8smHAbleQP8lVfLmyd/XgV6Kulvkv1oPxzLvu9TwOy+zhW0tj491
 SmuTR5Cq3GCJSz1Oxdfub+lK5Hg8OGqnLPdjZGJbCLrRkyRI++157CCrs+x+twPRYw0z
 TO7A==
X-Gm-Message-State: AOAM530eSIaN3Gdw8jyH/7iuP3nvqK/qgzj1S7xjp1rpVti84aJaQAVD
 xoGUPWabpMwp7/wuM56y7asVppEGxWEa2JdYrOKl4w==
X-Google-Smtp-Source: ABdhPJzjB7X8h/8IOETHWb1n0jnV1+PHsvNYrRXqTH2Ft/wqAi4yNwbmecuXHfPUIScml8Xs0woLI0fu3SoSOKqgxiI=
X-Received: by 2002:a05:622a:13c7:b0:305:abf:dd29 with SMTP id
 p7-20020a05622a13c700b003050abfdd29mr1539289qtk.629.1654727446356; Wed, 08
 Jun 2022 15:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
 <d7084452-ea90-3a8b-d39a-b09d9f45f839@quicinc.com>
 <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
 <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com>
 <CAA8EJppfWfP-bZLOYF8QBe6kW6gBBw5eXpzzDA6GFo8U7g=jRQ@mail.gmail.com>
 <963f5ef5-4b1d-6b0d-5b6d-0d6136e9e8d3@quicinc.com>
 <CAA8EJppCiN65NV7w9TyR=P+XzGPVxZJoAZoX5+XjxKwXsL_FQg@mail.gmail.com>
 <e56780cb-44c1-b26b-90b8-ceb40b8f218b@quicinc.com>
In-Reply-To: <e56780cb-44c1-b26b-90b8-ceb40b8f218b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 Jun 2022 01:30:35 +0300
Message-ID: <CAA8EJprCHW61_0zd+GqOZgpx1C-CDv6iuJZU60cc-1M2YZZhpw@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Jun 2022 at 22:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/2/2022 1:13 PM, Dmitry Baryshkov wrote:
> > On Thu, 2 Jun 2022 at 21:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/1/2022 1:04 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 1 Jun 2022 at 20:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 6/1/2022 2:46 AM, Dmitry Baryshkov wrote:
> >>>>> On Wed, 1 Jun 2022 at 01:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>>> On 5/31/2022 5:18 AM, Dmitry Baryshkov wrote:
> >>>>>>> Replace magic register writes in msm_mdss_enable() with version that
> >>>>>>> contains less magic and more variable names that can be traced back to
> >>>>>>> the dpu_hw_catalog or the downstream dtsi files.
> >>>>>>>
> >>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
> >>>>>>>      1 file changed, 71 insertions(+), 8 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> >>>>>>> index 0454a571adf7..2a48263cd1b5 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >>>>>>> @@ -21,6 +21,7 @@
> >>>>>>>      #define HW_REV                              0x0
> >>>>>>>      #define HW_INTR_STATUS                      0x0010
> >>>>>>>
> >>>>>>> +#define UBWC_DEC_HW_VERSION          0x58
> >>>>>>>      #define UBWC_STATIC                 0x144
> >>>>>>>      #define UBWC_CTRL_2                 0x150
> >>>>>>>      #define UBWC_PREDICTION_MODE                0x154
> >>>>>>> @@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >>>>>>>          return 0;
> >>>>>>>      }
> >>>>>>>
> >>>>>>> +#define UBWC_1_0 0x10000000
> >>>>>>> +#define UBWC_2_0 0x20000000
> >>>>>>> +#define UBWC_3_0 0x30000000
> >>>>>>> +#define UBWC_4_0 0x40000000
> >>>>>>> +
> >>>>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
> >>>>>>> +                                    u32 ubwc_static)
> >>>>>>> +{
> >>>>>>> +     writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
> >>>>>>> +                                    unsigned int ubwc_version,
> >>>>>>> +                                    u32 ubwc_swizzle,
> >>>>>>> +                                    u32 highest_bank_bit,
> >>>>>>> +                                    u32 macrotile_mode)
> >>>>>>> +{
> >>>>>>> +     u32 value = (ubwc_swizzle & 0x1) |
> >>>>>>> +                 (highest_bank_bit & 0x3) << 4 |
> >>>>>>> +                 (macrotile_mode & 0x1) << 12;
> >>>>>>> +
> >>>>>>> +     if (ubwc_version == UBWC_3_0)
> >>>>>>> +             value |= BIT(10);
> >>>>>>> +
> >>>>>>> +     if (ubwc_version == UBWC_1_0)
> >>>>>>> +             value |= BIT(8);
> >>>>>>> +
> >>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
> >>>>>>> +                                    unsigned int ubwc_version,
> >>>>>>> +                                    u32 ubwc_swizzle,
> >>>>>>> +                                    u32 ubwc_static,
> >>>>>>> +                                    u32 highest_bank_bit,
> >>>>>>> +                                    u32 macrotile_mode)
> >>>>>>> +{
> >>>>>>> +     u32 value = (ubwc_swizzle & 0x7) |
> >>>>>>> +                 (ubwc_static & 0x1) << 3 |
> >>>>>>> +                 (highest_bank_bit & 0x7) << 4 |
> >>>>>>> +                 (macrotile_mode & 0x1) << 12;
> >>>>>>> +
> >>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>>>> +
> >>>>>>> +     if (ubwc_version == UBWC_3_0) {
> >>>>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
> >>>>>>> +             writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
> >>>>>>> +     } else {
> >>>>>>> +             writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
> >>>>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
> >>>>>>> +     }
> >>>>>>> +}
> >>>>>>> +
> >>>>>>
> >>>>>> Is it possible to unify the above functions by having the internal
> >>>>>> ubwc_version checks?
> >>>>>
> >>>>> Note, it's not the ubwc_version, it is the ubwc_dec_hw_version. And
> >>>>> also different functions take different sets of arguments.
> >>>>>
> >>>>>> It seems like msm_mdss_setup_ubwc_dec_xxx can keep growing.
> >>>>>>
> >>>>>> I have not looked into each bit programming but from the top level so
> >>>>>> feel free to correct if wrong but it seems both do write UBWC_STATIC
> >>>>>> (different values based on different UBWC versions) and write some extra
> >>>>>> registers based on version
> >>>>>
> >>>>> This is what both the current code and the downstream do. See
> >>>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/zeus-s-oss/techpack/display-drivers/msm/sde/sde_hw_top.c#L312
> >>>>>
> >>>>
> >>>> Thanks for pointing to the downstream method for this,
> >>>>
> >>>> This is exactly what i was also suggesting to do when I mentioned
> >>>> unifying the above functions.
> >>>>
> >>>> So instead of having a separate function for each version why not handle
> >>>> all the versions in the same function like what the link you have shown
> >>>> does.
> >>>
> >>> I wouldn't like that. The downstream uses hw_catalog to pass all
> >>> possible parameters. We do not, so we'd have a whole set of artificial
> >>> values.
> >>>
> >>
> >> Now that you brought that up, why cannot even upstream dpu start using
> >> catalog for ubwc settings?
> >
> > Because msm_mdss lives out of disp/dpu1. And using the disp/dpu1 for
> > it would be an inversion of dependencies.
> > I like the fact that msm_mdss is independent of mdp/dpu drivers and I
> > do not want to add such dependency.
> >
>
> Ok, so I think this function itself is placed incorrectly. It should not
> be in msm_mdss.c and should in the DPU folder.
>
> This check tells me that this will not be executed for mdp5 devices.
>
>     /*
>       * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
>       * mdp5 hardware. Skip reading it for now.
>       */
>      if (msm_mdss->is_mdp5)
>          return 0;

This condition should be changed to check for the MDP_CLK being
available in the clocks array rather than checking for is_mdp5. I'd
like to phase is_mdp5 away at some point.

> In that case, what prevents us from moving this to dpu and start using
> catalog for this?

Because there is nothing tying mdss and dpu drivers. For example, is
the msm8998 (3.0.0) the DPU or MDP5 device? MSM8996?
Neither struct msm_mdss nor the MDSS device itself are accessible
through the msm_drv (or dpu_kms).
I think trying to invent such a link would make the code worse.

> >> /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
> >>    * @id:                index identifying this block
> >>    * @base:              register base offset to mdss
> >>    * @features           bit mask identifying sub-blocks/features
> >>    * @highest_bank_bit:  UBWC parameter
> >>    * @ubwc_static:       ubwc static configuration
> >>    * @ubwc_swizzle:      ubwc default swizzle setting
> >>    * @clk_ctrls          clock control register definition
> >>    */
> >> struct dpu_mdp_cfg {
> >>       DPU_HW_BLK_INFO;
> >>       u32 highest_bank_bit;
> >>       u32 ubwc_swizzle;
> >>       struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
> >> };
> >>
> >> We already do seem to have a couple of parameters. have to add the others.
> >>
> >> That way the number of functions wont keep growing.


-- 
With best wishes
Dmitry
