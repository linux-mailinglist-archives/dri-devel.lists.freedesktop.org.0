Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096568AD9A
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 01:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E6F10E0F3;
	Sun,  5 Feb 2023 00:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5D510E0E0
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 00:29:43 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 23so3508175ybf.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Feb 2023 16:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yVHnYv29dfcBRVFAFJees+Jdm8LiBpOoVX3MFjJlmg8=;
 b=DI4iYOEdJG7bha5df75g3z6fesOAX/kdCqYhzvgFzdJlHpjdjH/OfQ/1ekzr+9oTRe
 2mTBfJaat9ZXAE5A7qKaoMQUy9tdMUSVCysUd5LvXta1DR1rQg1DQaGUbR5B2pjZc15M
 SEkR1xA/s6Uc4u/m6klFwbKoNSyaTsn0CEDAsb2xBTPCaDSG/c4tfHAmv6fWEPy+ixxK
 db2DJRYc+3HG005UZceJNEuPtaeaKUm7awwxwnld0wbGFUAAopJKxOZhQ1FhJd1IlP62
 mTYN/i1Q3FGVlQ/icMXEZSv8eUxrPwDuaY9jxoOz5uoKQigXiq0GXFNRk8S/65fzx/lC
 9MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVHnYv29dfcBRVFAFJees+Jdm8LiBpOoVX3MFjJlmg8=;
 b=EdHzkD2gQL7R4njQ5zRgqwTG8DU0Ze0a1/cyQEt5zIA+RL6YfH5wbSZ8/4j6NXm5RS
 skBBgER4VGqxtMQ+HtGUynKOaxj9iS4JGo8UXokOsoAyAnDW17usMizJ/zK9Ya1If0ly
 L3JDTFb5FiOTKPA5RpevyAxkguzWtEX/ATFEGPmcTQvPZjXLkUeCyUNKxA3naUKxnwT/
 0WkvW4qLo00+WCVlws1d9NqRYpqA9B6sSDd3mhV7ND0Z5IyVtNiowNnIappjTK+FzeUm
 fbvfomereagzdlucbcea/R3FXbcz+0GM+vIMbqdxrbCZ18aUKWmoMDvstsgterlx4Of7
 owEA==
X-Gm-Message-State: AO0yUKU8GtSMGoTjwKnai1HLVROMaah+E02bnIVUBTiagoORK4dQdTwH
 waIc0Vqm3XPFnWK0YkCO9vEYYbfmNYuM4r5ngiGjmA==
X-Google-Smtp-Source: AK7set+3W8QVBw7KriByRFm2NwhnPmnZ/moq6pXn3EnPPu/3DmMO/cKXpVCFH8avGn52hbLJR6QqPDcyHNF3IiZGpIg=
X-Received: by 2002:a05:6902:392:b0:885:47a5:7b7 with SMTP id
 f18-20020a056902039200b0088547a507b7mr198549ybs.153.1675556979916; Sat, 04
 Feb 2023 16:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
 <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
 <ddb0de30-9e29-f6f0-028c-48530bee4a6b@quicinc.com>
 <42e6237d-9fae-0679-1354-7df74594a9db@linaro.org>
 <d89a1735-4351-a9b5-c6e3-d0d05af9d283@quicinc.com>
 <6d171f4b-9a49-ea90-8cf3-518bea0964b3@linaro.org>
 <edc1aab6-b38f-c0ec-9339-01117d037ebf@quicinc.com>
 <5d482d65-858f-7c6c-1f93-dabc6e2f4be9@linaro.org>
 <616460ed-2385-cefb-5bb5-491fa42f1e54@quicinc.com>
In-Reply-To: <616460ed-2385-cefb-5bb5-491fa42f1e54@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 5 Feb 2023 02:29:27 +0200
Message-ID: <CAA8EJpqEq4Wirj0SmxcJYbiw0taUmbLpC8RYFCzkBfsPxc-aZA@mail.gmail.com>
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 5 Feb 2023 at 01:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/4/2023 1:08 PM, Dmitry Baryshkov wrote:
> > On 04/02/2023 20:35, Abhinav Kumar wrote:
> >>
> >>
> >> On 2/4/2023 2:43 AM, Dmitry Baryshkov wrote:
> >>> On 04/02/2023 07:10, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 2/3/2023 8:10 PM, Dmitry Baryshkov wrote:
> >>>>> On 04/02/2023 04:43, Abhinav Kumar wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2/3/2023 6:29 PM, Dmitry Baryshkov wrote:
> >>>>>>> On 04/02/2023 01:35, Abhinav Kumar wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> >>>>>>>>> Downstream driver uses dpu->caps->smart_dma_rev to update
> >>>>>>>>> sspp->cap->features with the bit corresponding to the supported
> >>>>>>>>> SmartDMA
> >>>>>>>>> version. Upstream driver does not do this, resulting in SSPP
> >>>>>>>>> subdriver
> >>>>>>>>> not enbaling setup_multirect callback. Add corresponding
> >>>>>>>>> SmartDMA SSPP
> >>>>>>>>> feature bits to dpu hw catalog.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> While reviewing this patch, I had a first hand experience of how
> >>>>>>>> we are reusing SSPP bitmasks for so many chipsets but I think
> >>>>>>>> overall you got them right here :)
> >>>>>>>>
> >>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>>>> ---
> >>>>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
> >>>>>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>> index cf053e8f081e..fc818b0273e7 100644
> >>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>>>>> @@ -21,13 +21,16 @@
> >>>>>>>>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
> >>>>>>>>>   #define VIG_SDM845_MASK \
> >>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
> >>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3))
> >>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
> >>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3) |\
> >>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
> >>>>>>>>>   #define VIG_SC7180_MASK \
> >>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
> >>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4))
> >>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
> >>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4) |\
> >>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
> >>>>>>>>>   #define VIG_SM8250_MASK \
> >>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
> >>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
> >>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
> >>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
> >>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
> >>>>>>>>>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
> >>>>>>>>> @@ -42,6 +45,7 @@
> >>>>>>>>>   #define DMA_SDM845_MASK \
> >>>>>>>>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |
> >>>>>>>>> BIT(DPU_SSPP_QOS_8LVL) |\
> >>>>>>>>>       BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> >>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
> >>>>>>>>>       BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
> >>>>>>>>>   #define DMA_CURSOR_SDM845_MASK \
> >>>>>>>>
> >>>>>>>> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other
> >>>>>>>> chipsets like 8250, 8450, 8550.
> >>>>>>>>
> >>>>>>>> At the moment, for visual validation of this series, I only have
> >>>>>>>> sc7180/sc7280. We are leaving the rest for CI.
> >>>>>>>>
> >>>>>>>> Was that an intentional approach?
> >>>>>>>>
> >>>>>>>> If so, we will need tested-by tags from folks having
> >>>>>>>> 8350/8450/8550/sc8280x,qcm2290?
> >>>>>>>>
> >>>>>>>> I am only owning the visual validation on sc7280 atm.
> >>>>>>>
> >>>>>>> I'm not quite sure what is your intent here. Are there any SoCs
> >>>>>>> after 845 that do not have SmartDMA 2.5? Or do you propose to
> >>>>>>> enable SmartDMA only for the chipsets that we can visually test?
> >>>>>>> That sounds strange.
> >>>>>>>
> >>>>>>
> >>>>>> Yes I was thinking to enable smartDMA at the moment on chipsets
> >>>>>> which we can validate visually that display comes up. But I am not
> >>>>>> sure if thats entirely practical.
> >>>>>>
> >>>>>> But the intent was I just want to make sure basic display does
> >>>>>> come up with smartDMA enabled if we are enabling it for all chipsets.
> >>>>>
> >>>>> I don't think it is practical or logical. We don't require
> >>>>> validating other changes on all possible chipsets, so what is so
> >>>>> different with this one?
> >>>>>
> >>>>
> >>>> Thats because with smartDMA if the programming of stages goes wrong
> >>>> we could potentially just see a blank screen. Its not about other
> >>>> changes, this change in particular controls enabling a feature.
> >>>>
> >>>> But thats just my thought. I am not going to request to ensure this
> >>>> or block this for this.
> >>>>
> >>>> You can still have my
> >>>>
> >>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>
> >>>> But think of the validations that have to be done before we merge it.
> >>>
> >>> The usual way: verify as much as feasible and let anybody else
> >>> complain during the development cycle.
> >>>
> >>
> >> Well, our perspective is to enable the feature on devices on which you
> >> are able to test and not enable then wait for others to complain.
> >
> > This would not be really practical. There are plenty of people who can
> > test things on obscure platforms, but unfortunately far less amount of
> > people who tightly follow the development and can track which new
> > feature applies to a particular platform. I hope to be able to fix that
> > slightly with the hw catalog rework. However enabling features on other
> > platforms definitely requires more knowledge than simply testing the
> > kernel.
> >
> >>
> >> I did not say test all devices. My point was to enable smartDMA on
> >> devices which we are able to test.
> >>
> >> There are other examples of this, like inline rotation, writeback etc.
> >> which are at the moment enabled only on devices which QC or others
> >> have tested on.
> >
> > But at the time it was added, inline rotation 2.0 could only be
> > supported on sc7280. Probably we should expand it not to sc8280xp and
> > sm8[345]50.
> >
> > For WB I don't remember which platforms were supported at the moment it
> > was added. But it's also worth expanding support to new platforms.
> >
> > And, as we speak about testing, is there an easy way to setup the plane
> > with UBWC format modifier? Also, did the WB support patches land into
> > libdrm?
> >
>
> I will check the compositor code and update you on the UWBC format
> modifier as I am not too familiar with it.

Ideally it would be nice to support ubwc planes in some simple tool,
e.g. modetest.

>
> libdrm always supported virtual encoder
> https://github.com/grate-driver/libdrm/blob/master/include/drm/drm_mode.h#L352
>
> What other support patches are needed? Right now we only use IGT to
> validate writeback.

I remember there was a patchset to make modeset to support using
writeback. What was its fate?

>
> >> So when i said my suggestion was not practical, yes because if you
> >> want to go ahead with this change in the current form, you would have
> >> to validate all the chipsets as you are enabling smartDMA on all of them.
> >>
> >> If you enable smartDMA only on the chipsets you OR others can validate
> >> and give Tested-by for like I was planning to do for sc7280, then I am
> >> not sure why it doesnt sound logical.
> >>
> >> But like I said, thats my perspective. I will let you decide as you
> >> would know how confident you are with this getting enabled for all
> >> chipsets upstream.
> >
> > I'd say, that once tested on some of the platforms and granted that even
> > smalled (qcm2290, sm6115) platforms support smartdma, it will be safe to
> > enable smart DMA globablly for every SoC >= sdm845. If I remember
> > correctly, msm8998 (and sdm660/630) support smartdma/rect only on DMA
> > planes. Is it correct?
> >
> >
> Yes thats right msm8998 supports smartdma only on DMA sspps.

Good

-- 
With best wishes
Dmitry
