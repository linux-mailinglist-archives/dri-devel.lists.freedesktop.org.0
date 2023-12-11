Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9880DD67
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 22:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B88910E500;
	Mon, 11 Dec 2023 21:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820F10E142
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 21:42:53 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5d34f8f211fso48888537b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 13:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702330972; x=1702935772; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DLp53bQ81f9gTNP0ce9syP67cX2Q/gFvgHzh0s16PlE=;
 b=xyNMU8fqL6UQbJFGEwudyL4OvW98rAoIQ4TXRYY2DualFnj+Y8a/Hq03lrZATI0E/5
 TyukDT/rp2ymLoTtSvca5RscZVsPX/lDGBNn0wtzcD2aQ7e/hZQ3PAsUvU9DKtGdCoIV
 JzrKH4MbhXrRekaTfGrj1BwzvMqQeWG6Ox1JNGbcsPNyjZpUOxZ3WwAfVxBXzx0Rl99/
 6qzQgDCEQMTmy/vJiGO6yTOEubQmtqF/bhYXyfwJQw5hPxbnEz5c6uNM2tLY6rvVFAw4
 R3rljAVsazGYHeUxVrrNprT7XO71r7YsBCtFFvvcXvF3e1LltNdeCX0YjyOTr3MkPopd
 z5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702330972; x=1702935772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DLp53bQ81f9gTNP0ce9syP67cX2Q/gFvgHzh0s16PlE=;
 b=V0WgKtLtiz2/JvERXFaHeIaitJ6+XxQtFuTVg9IB7iSeRCjd2NykTsxr1LiLKLqwsb
 BRbdHUm84sPvl2Rh9KI0APFMwTUhx946HiGNecTFkC3tHMrH8eQUEU5bnD1PhQPYOE7Z
 1BpMi8QkZANjaPdU7NV2B2BD3ah8ZUbcox+87wa6THX7o8NgOS01+ClMGSCANxE7bHUH
 UgM3pqQ3cfia2MhcWJIqqQHMl1AIn+QsW2xF5wwbFYLsSKZa+0iPiirv8fUfMKa2H8Tg
 gMek2NaTPznlCU7kRCOPBqIw8M6TrWme6f6kvVP9Q6GkWPOA1RG/8bOBbyxkIUnDDMMF
 EiyQ==
X-Gm-Message-State: AOJu0YxT3kjkUklEzL075UsGzjIJaj3Y1KRt1rB1GOx9pV9dhB2LxPVs
 KWHK2O1CIwSZwDwkZG6ij/crO5lJOIhfW8lwcmhYSA==
X-Google-Smtp-Source: AGHT+IHHQ40+f6LzN6SmeJ75xENMSk7aPxDwwYgY2NFMeU22ys073FfQT4ocApqCXGb2i7ujsukxT5ICJRsRiSBRfhA=
X-Received: by 2002:a81:7b05:0:b0:5d7:1940:53cd with SMTP id
 w5-20020a817b05000000b005d7194053cdmr4072587ywc.69.1702330972489; Mon, 11 Dec
 2023 13:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com>
 <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
 <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
 <CAA8EJpqu42b0AP8Ar2LoFcrS51iKTUM1Qr++j7MYjv4WCx=tCg@mail.gmail.com>
 <e9634306-dbc4-fe5d-3227-321a492c73cb@quicinc.com>
In-Reply-To: <e9634306-dbc4-fe5d-3227-321a492c73cb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 23:42:41 +0200
Message-ID: <CAA8EJpq9RPi0q8LBytW=E+H2WWX2T9ShQe6zzzCSCwn1t12FGA@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 23:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2023 1:31 PM, Dmitry Baryshkov wrote:
> > On Mon, 11 Dec 2023 at 23:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/8/2023 3:19 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> >>>> YUV format output from writeback block.
> >>>>
> >>>> changes in v2:
> >>>>           - remove explicit zero assignment for features
> >>>>           - move sc7280_cdm to dpu_hw_catalog from the sc7280
> >>>>             catalog file as its definition can be re-used
> >>>>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
> >>>>    4 files changed, 29 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>> index 209675de6742..19c2b7454796 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> >>>>           .mdss_ver = &sc7280_mdss_ver,
> >>>>           .caps = &sc7280_dpu_caps,
> >>>>           .mdp = &sc7280_mdp,
> >>>> +       .cdm = &sc7280_cdm,
> >>>>           .ctl_count = ARRAY_SIZE(sc7280_ctl),
> >>>>           .ctl = sc7280_ctl,
> >>>>           .sspp_count = ARRAY_SIZE(sc7280_sspp),
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> index d52aae54bbd5..1be3156cde05 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> >>>>           .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
> >>>>    };
> >>>>
> >>>> +/*************************************************************
> >>>> + * CDM sub block config
> >>>
> >>> Nit: it is not a subblock config.
> >>>
> >>
> >> Ack.
> >>
> >>>> + *************************************************************/
> >>>> +static const struct dpu_cdm_cfg sc7280_cdm = {
> >>>
> >>> I know that I have r-b'ed this patch. But then one thing occurred to
> >>> me. If this definition is common to all (or almost all) platforms, can
> >>> we just call it dpu_cdm or dpu_common_cdm?
> >>>
> >>>> +       .name = "cdm_0",
> >>>> +       .id = CDM_0,
> >>>> +       .len = 0x228,
> >>>> +       .base = 0x79200,
> >>>> +};
> >>
> >> hmmm .... almost common but not entirely ... msm8998's CDM has a shorter
> >> len of 0x224 :(
> >
> > Then sdm845_cdm?
> >
>
> That also has a shorter cdm length.

Could you please clarify. According to the downstream DT files all CDM
blocks up to (but not including) sm8550 had length 0x224. SM8550 and
SM8650 got qcom,sde-cdm-size = <0x220>.  But I don't see any registers
after 0x204.
>
> BTW, sdm845 is not in this series. It will be part of RFT as we discussed.
>
> >>
> >>>> +
> >>>>    /*************************************************************
> >>>>     * VBIF sub blocks config
> >>>>     *************************************************************/
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> index e3c0d007481b..ba82ef4560a6 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
> >>>>           u32 memtype[MAX_XIN_COUNT];
> >>>>    };
> >>>>
> >>>> +/**
> >>>> + * struct dpu_cdm_cfg - information of chroma down blocks
> >>>> + * @name               string name for debug purposes
> >>>> + * @id                 enum identifying this block
> >>>> + * @base               register offset of this block
> >>>> + * @features           bit mask identifying sub-blocks/features
> >>>> + */
> >>>> +struct dpu_cdm_cfg {
> >>>> +       DPU_HW_BLK_INFO;
> >>>> +};
> >>>> +
> >>>>    /**
> >>>>     * Define CDP use cases
> >>>>     * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
> >>>> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
> >>>>           u32 wb_count;
> >>>>           const struct dpu_wb_cfg *wb;
> >>>>
> >>>> +       const struct dpu_cdm_cfg *cdm;
> >>>> +
> >>>>           u32 ad_count;
> >>>>
> >>>>           u32 dspp_count;
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>> index a6702b2bfc68..f319c8232ea5 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>> @@ -185,6 +185,11 @@ enum dpu_dsc {
> >>>>           DSC_MAX
> >>>>    };
> >>>>
> >>>> +enum dpu_cdm {
> >>>> +       CDM_0 = 1,
> >>>> +       CDM_MAX
> >>>> +};
> >>>> +
> >>>>    enum dpu_pingpong {
> >>>>           PINGPONG_NONE,
> >>>>           PINGPONG_0,
> >>>> --
> >>>> 2.40.1
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
