Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B225780E46B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 07:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6122B10E583;
	Tue, 12 Dec 2023 06:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD3610E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 06:49:23 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-db548da6e3bso5378036276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 22:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702363762; x=1702968562; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fUTYh6IhUKHPsx3YbMSFRwAie4oGTzJH1rjTc1+cN6c=;
 b=dWtL0aG/I6RBpy0WJBWYEi2OJHm5bzqNnFeQgbEeKG4xfYhdckE/QHxwOkDoUck6np
 NuSqb67OIedGJoef3IjGXsGZPtgPUDa+oupRW4+Pofp17q8QActcjEZ/hCvy0lqDDngF
 Y3FEVBXBoycyviKM1UiBZnWLHnSOEB3YgkPdI/LBaqGdu83qRjo+l+IkIWGqeDzrQOKA
 hDi3r18npKfBmAWSUID1EtF7UEhDhVfvXwqcKRXUl5XKsF5Dpstl9GJjChlDG0YgAq+L
 AGVmLWGE9aoP2iY/0UVaJH3yv4o+veagt3KyvUsCGMDeN1kvcYJTyUTbf0KRbaXfj+zo
 YwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702363762; x=1702968562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fUTYh6IhUKHPsx3YbMSFRwAie4oGTzJH1rjTc1+cN6c=;
 b=Dl+MGTfAy6dPNQ3ZLZoZJ8UOGTHvW8BPxyq4ioH4hxS3CdU64sGBGNycj+m25eTWYf
 Iv/R92xanNp+pYytpF6iHsCHADAga1biHthPpVzIfoJNqA5i1/lkYBXP24Qwe+BkvOM6
 DP3tERG9rOsYha2zI6Mi5x/IHl153cOkdbQ2ok56HQrluEH+qg1EmQDfXqN0MRmqqlAb
 eEvvar0OjgjuX9XdgZ84UcbWrMHh6lp0QGTcwqGSrEhMwGyPOMRLaX0w+NQ6a8jvy3av
 JJ22PREIOIgJ+0krqwBHMcaVuaz1LNd5nId0g5gSre8gTaF9S/NxTHTW3fAq2Ig3zbPN
 3Hrg==
X-Gm-Message-State: AOJu0YxAzY3Z542uQaR5vAnoEusXWQECLx30YGS+ww9UO0JBWeJo1Cgd
 hRU7tf2In/x0P9OGoIEOCfbZN7/JbuTyFPzijAA34Q==
X-Google-Smtp-Source: AGHT+IHQ4s/MmYszzD0xQl16ID5ScDpJUo1mFXeoFzaxEpe94TMP9qTWyicH1uF2gAOtrCdz9I8RENqq/ZOE0crEIEo=
X-Received: by 2002:a25:2350:0:b0:dbc:b24c:d4d2 with SMTP id
 j77-20020a252350000000b00dbcb24cd4d2mr979482ybj.42.1702363762419; Mon, 11 Dec
 2023 22:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com>
 <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
 <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
 <CAA8EJpqu42b0AP8Ar2LoFcrS51iKTUM1Qr++j7MYjv4WCx=tCg@mail.gmail.com>
 <e9634306-dbc4-fe5d-3227-321a492c73cb@quicinc.com>
 <CAA8EJpq9RPi0q8LBytW=E+H2WWX2T9ShQe6zzzCSCwn1t12FGA@mail.gmail.com>
 <ab69ba1e-3108-c2f0-27be-f1fd5d11bc82@quicinc.com>
In-Reply-To: <ab69ba1e-3108-c2f0-27be-f1fd5d11bc82@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:49:11 +0200
Message-ID: <CAA8EJppN6=_d7FQ-ZkswkgW9ahRrqjC1f7yLPtOid1taq1QtsA@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280
 dpu_hw_catalog
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 23:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2023 1:42 PM, Dmitry Baryshkov wrote:
> > On Mon, 11 Dec 2023 at 23:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/11/2023 1:31 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 11 Dec 2023 at 23:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 12/8/2023 3:19 AM, Dmitry Baryshkov wrote:
> >>>>> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>>>
> >>>>>> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> >>>>>> YUV format output from writeback block.
> >>>>>>
> >>>>>> changes in v2:
> >>>>>>            - remove explicit zero assignment for features
> >>>>>>            - move sc7280_cdm to dpu_hw_catalog from the sc7280
> >>>>>>              catalog file as its definition can be re-used
> >>>>>>
> >>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>> ---
> >>>>>>     .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
> >>>>>>     4 files changed, 29 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>>>> index 209675de6742..19c2b7454796 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>>>> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> >>>>>>            .mdss_ver = &sc7280_mdss_ver,
> >>>>>>            .caps = &sc7280_dpu_caps,
> >>>>>>            .mdp = &sc7280_mdp,
> >>>>>> +       .cdm = &sc7280_cdm,
> >>>>>>            .ctl_count = ARRAY_SIZE(sc7280_ctl),
> >>>>>>            .ctl = sc7280_ctl,
> >>>>>>            .sspp_count = ARRAY_SIZE(sc7280_sspp),
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> index d52aae54bbd5..1be3156cde05 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> >>>>>>            .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
> >>>>>>     };
> >>>>>>
> >>>>>> +/*************************************************************
> >>>>>> + * CDM sub block config
> >>>>>
> >>>>> Nit: it is not a subblock config.
> >>>>>
> >>>>
> >>>> Ack.
> >>>>
> >>>>>> + *************************************************************/
> >>>>>> +static const struct dpu_cdm_cfg sc7280_cdm = {
> >>>>>
> >>>>> I know that I have r-b'ed this patch. But then one thing occurred to
> >>>>> me. If this definition is common to all (or almost all) platforms, can
> >>>>> we just call it dpu_cdm or dpu_common_cdm?
> >>>>>
> >>>>>> +       .name = "cdm_0",
> >>>>>> +       .id = CDM_0,
> >>>>>> +       .len = 0x228,
> >>>>>> +       .base = 0x79200,
> >>>>>> +};
> >>>>
> >>>> hmmm .... almost common but not entirely ... msm8998's CDM has a shorter
> >>>> len of 0x224 :(
> >>>
> >>> Then sdm845_cdm?
> >>>
> >>
> >> That also has a shorter cdm length.
> >
> > Could you please clarify. According to the downstream DT files all CDM
> > blocks up to (but not including) sm8550 had length 0x224. SM8550 and
> > SM8650 got qcom,sde-cdm-size = <0x220>.  But I don't see any registers
> > after 0x204.
> >>
>
> We always list 0x4 more than the last offset.

Yes, so this makes it correct for several latest DT files, which have
qcom,sde-cdm-size = <0x220>.
However all the previous DT files (from msm8998 to sm8450) had
qcom,sde-cdm-size = <0x224>;

>
> In chipsets sdm845 and msm8998, I only see the last offset of CDM as
> 0x220 but in sm8250 and sc7280, the last offset is 0x224. Hence the
> total length is more in sc7280/sm8250 as compared to sdm845/msm8998.
>
> I didnt follow that you do not see any registers after 0x204.
>
> The CDM_MUX is the last offset which has an offset 0x224 from the base
> address. So thats the last offset.

Ack

>
> The newer chipsets have CDM_MUX and the older ones did not. Hence the
> difference in length.
>
> >> BTW, sdm845 is not in this series. It will be part of RFT as we discussed.
> >>
> >>>>
> >>>>>> +
> >>>>>>     /*************************************************************
> >>>>>>      * VBIF sub blocks config
> >>>>>>      *************************************************************/
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>>> index e3c0d007481b..ba82ef4560a6 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>>>> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
> >>>>>>            u32 memtype[MAX_XIN_COUNT];
> >>>>>>     };
> >>>>>>
> >>>>>> +/**
> >>>>>> + * struct dpu_cdm_cfg - information of chroma down blocks
> >>>>>> + * @name               string name for debug purposes
> >>>>>> + * @id                 enum identifying this block
> >>>>>> + * @base               register offset of this block
> >>>>>> + * @features           bit mask identifying sub-blocks/features
> >>>>>> + */
> >>>>>> +struct dpu_cdm_cfg {
> >>>>>> +       DPU_HW_BLK_INFO;
> >>>>>> +};
> >>>>>> +
> >>>>>>     /**
> >>>>>>      * Define CDP use cases
> >>>>>>      * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
> >>>>>> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
> >>>>>>            u32 wb_count;
> >>>>>>            const struct dpu_wb_cfg *wb;
> >>>>>>
> >>>>>> +       const struct dpu_cdm_cfg *cdm;
> >>>>>> +
> >>>>>>            u32 ad_count;
> >>>>>>
> >>>>>>            u32 dspp_count;
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> index a6702b2bfc68..f319c8232ea5 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> @@ -185,6 +185,11 @@ enum dpu_dsc {
> >>>>>>            DSC_MAX
> >>>>>>     };
> >>>>>>
> >>>>>> +enum dpu_cdm {
> >>>>>> +       CDM_0 = 1,
> >>>>>> +       CDM_MAX
> >>>>>> +};
> >>>>>> +
> >>>>>>     enum dpu_pingpong {
> >>>>>>            PINGPONG_NONE,
> >>>>>>            PINGPONG_0,
> >>>>>> --
> >>>>>> 2.40.1
> >>>>>>
> >>>>>
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
