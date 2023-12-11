Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA880DD1F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 22:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABD210E0BE;
	Mon, 11 Dec 2023 21:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFA810E042
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 21:31:20 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-db537948ea0so4841525276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702330279; x=1702935079; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YuklrYjWcOTs+XkpZrSUZD3XCm59iUhB/fuyZPiMpJ8=;
 b=OWDW0Qv6LA6FCDEiMRWE7/C7gfzIWyWCOoRo9+C8UPn/911+RXlJ+oQTyfOkuZ4Wmd
 M+Fk+JcDEFz2+9ZrK8YbEedREYwD4Pauc/Ekr+Q48UpyQweqrsbtDDqt+gZg5A2J1K8I
 YJApj1LzhtKAeTDTM4ZoUkPBQcOMLzUZ1omrOeRIv2t8XwxVLYfVsA1idSO03taGLNr8
 SCN94INu08oyALA+vy5XHHQZG5BnHzuxvLwFg4JJa+RhDKy2DhwJObOvS4HDgl40eW0C
 zO5Xb6hVaFof2scmBgoO99GOGYYcGXKYUAN9FG5s5He7LXOKNe1zqlEpWcnz+Cox1zBh
 HpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702330279; x=1702935079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YuklrYjWcOTs+XkpZrSUZD3XCm59iUhB/fuyZPiMpJ8=;
 b=HpgFx/R86Crp0l58COVdhDVAOxUBfyss1kc2DETbpnNeP3/0xKq6Bv4JupRGdI/jyo
 3ZZaluH8uT1Et5NFqqRcj4Sw66XG+Lb5rnPOVk02EP80V+mBUHCU1kdBgrUizm4eAEAF
 2O/kqoDsQCOE9NNbEVKUvx9dNZZzVRGPlSS64x9e6FhRPdlnRjKmG0dO7YhImR1eFm98
 4uTFhvxcK8dlNSjccsIDd/A0kT5AmcaSwZx1RwEHwWZR351P3NAPATuGGVq3wXduwb9G
 REMbUbAnzmCzNw5sBOTpR7yUCi2mTCu/cCUbpUgV3QjW2lH1u6GilyRlWWIHrmIop/L4
 CP4g==
X-Gm-Message-State: AOJu0YzntvpNmbOa/VcdIc0xQhlVZUeNDmuwwmZow0JGpoeyeETYCKlM
 kX0L9EWvcwOMXB+4V9LDNXuVmLjbtFgmbeL6uteh2w==
X-Google-Smtp-Source: AGHT+IGQqhoI+KxGOe25sYIXnHw1HWBewU71k6nhxZZTP0O4IrPw0vYC5vm+Op22lSoK+zDeIAzJkpFzKVZAcsm7KNU=
X-Received: by 2002:a25:5f45:0:b0:dbc:b2e1:43e1 with SMTP id
 h5-20020a255f45000000b00dbcb2e143e1mr670824ybm.91.1702330279400; Mon, 11 Dec
 2023 13:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com>
 <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
 <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
In-Reply-To: <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 23:31:08 +0200
Message-ID: <CAA8EJpqu42b0AP8Ar2LoFcrS51iKTUM1Qr++j7MYjv4WCx=tCg@mail.gmail.com>
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

On Mon, 11 Dec 2023 at 23:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/8/2023 3:19 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> >> YUV format output from writeback block.
> >>
> >> changes in v2:
> >>          - remove explicit zero assignment for features
> >>          - move sc7280_cdm to dpu_hw_catalog from the sc7280
> >>            catalog file as its definition can be re-used
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
> >>   4 files changed, 29 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> index 209675de6742..19c2b7454796 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> >>          .mdss_ver = &sc7280_mdss_ver,
> >>          .caps = &sc7280_dpu_caps,
> >>          .mdp = &sc7280_mdp,
> >> +       .cdm = &sc7280_cdm,
> >>          .ctl_count = ARRAY_SIZE(sc7280_ctl),
> >>          .ctl = sc7280_ctl,
> >>          .sspp_count = ARRAY_SIZE(sc7280_sspp),
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index d52aae54bbd5..1be3156cde05 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> >>          .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
> >>   };
> >>
> >> +/*************************************************************
> >> + * CDM sub block config
> >
> > Nit: it is not a subblock config.
> >
>
> Ack.
>
> >> + *************************************************************/
> >> +static const struct dpu_cdm_cfg sc7280_cdm = {
> >
> > I know that I have r-b'ed this patch. But then one thing occurred to
> > me. If this definition is common to all (or almost all) platforms, can
> > we just call it dpu_cdm or dpu_common_cdm?
> >
> >> +       .name = "cdm_0",
> >> +       .id = CDM_0,
> >> +       .len = 0x228,
> >> +       .base = 0x79200,
> >> +};
>
> hmmm .... almost common but not entirely ... msm8998's CDM has a shorter
> len of 0x224 :(

Then sdm845_cdm?

>
> >> +
> >>   /*************************************************************
> >>    * VBIF sub blocks config
> >>    *************************************************************/
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> index e3c0d007481b..ba82ef4560a6 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
> >>          u32 memtype[MAX_XIN_COUNT];
> >>   };
> >>
> >> +/**
> >> + * struct dpu_cdm_cfg - information of chroma down blocks
> >> + * @name               string name for debug purposes
> >> + * @id                 enum identifying this block
> >> + * @base               register offset of this block
> >> + * @features           bit mask identifying sub-blocks/features
> >> + */
> >> +struct dpu_cdm_cfg {
> >> +       DPU_HW_BLK_INFO;
> >> +};
> >> +
> >>   /**
> >>    * Define CDP use cases
> >>    * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
> >> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
> >>          u32 wb_count;
> >>          const struct dpu_wb_cfg *wb;
> >>
> >> +       const struct dpu_cdm_cfg *cdm;
> >> +
> >>          u32 ad_count;
> >>
> >>          u32 dspp_count;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index a6702b2bfc68..f319c8232ea5 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -185,6 +185,11 @@ enum dpu_dsc {
> >>          DSC_MAX
> >>   };
> >>
> >> +enum dpu_cdm {
> >> +       CDM_0 = 1,
> >> +       CDM_MAX
> >> +};
> >> +
> >>   enum dpu_pingpong {
> >>          PINGPONG_NONE,
> >>          PINGPONG_0,
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry
