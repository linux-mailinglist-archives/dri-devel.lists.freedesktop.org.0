Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA66F8946
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 21:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317A010E661;
	Fri,  5 May 2023 19:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C9510E660
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 19:04:17 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-b9da6374fa2so2962821276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 12:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683313454; x=1685905454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HWHgcoJmGnAT2F8+CAPhfA6XJlKIdf+siYto+H4BoOo=;
 b=RKj9nFBpM8fl24aY6oU/FY/1xlAP1+SsMGwUibTPSsbPT/8KXSw/h2ElAME7RBNse0
 bBpAwD0rtBbaFQpOxucu6V6n4c/F57w91dMUVC09+XPK0BizEaC3SSYvy7fWzCMVNoK9
 nsf9xAiJ2bUuhl0/rYbWxDSi0SODUQch+2Bu0NY61NstpMjnzJgq+rUUk5Ml3L5Crwta
 nmsZKB60KAd4CoKonTf9B/5dSb9TDrxTXXE5694b6OMREF7RUjdNLVb2vTMgjs/WxsA5
 0TCa98t8zqeYR8SndZvO80FEP8j3147Id6IqRhXBuK6V+Bf87sb+JB2hg03NMOZH73mW
 2wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683313454; x=1685905454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HWHgcoJmGnAT2F8+CAPhfA6XJlKIdf+siYto+H4BoOo=;
 b=CCtmFxuafEg0xgwJ4R3YDLytKy2eTF1EkVtWNXys8y4gNWcBNSVVGmAmjVsKNYFx3i
 ps5tqoZ589Ir0V94mUpsLs2RDU1wtKBlBUf40jP9OD6xoQasKPAJ9jxdLW0Ws+KW/iLA
 HKIO4qzLJMygWtV20s3Uf/Ita9PddrWftORvxoIgGKE9bq/4h9MC165HCsWnuysxUzFg
 L+OgmCDNkMRLkcTID4lqfzEem+GpWQNSMyTJzW9mpiiUHT5fePpIZ5h2ZGkttvxfHGsV
 djxzlSAM014VWyDYMB8nTIciaoIzrmHCSMoTrAGuBW6CWdnSbgaWZH9Nf6iyg7sf1HcG
 BKGg==
X-Gm-Message-State: AC+VfDyEb/Wd5t3JtaApoqxn2DVvPFaCKx0NQbOB4D4xzuyCHjAYkU5c
 IMvz3YHL4eLH6qGLQXAvp1uhD8F4RotOxPIuSShEFg==
X-Google-Smtp-Source: ACHHUZ6TZGYSg82gTSCkzmV3zwK9Az5lq2j0vvfTJk8c7MKh39V2p7t3YO8Jsz+Np4QDnVwguPn/klfVXCEagVKNSZ8=
X-Received: by 2002:a05:6902:1249:b0:b4c:6d0b:1e99 with SMTP id
 t9-20020a056902124900b00b4c6d0b1e99mr3054551ybu.48.1683313454429; Fri, 05 May
 2023 12:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-2-dmitry.baryshkov@linaro.org>
 <e2ddc196-5b12-5e8b-b406-665e2adfef0a@quicinc.com>
In-Reply-To: <e2ddc196-5b12-5e8b-b406-665e2adfef0a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 May 2023 22:04:03 +0300
Message-ID: <CAA8EJppyGO6gRFjLFaZaBaipbBptqHVNQqCcczgwKV-v0mGrAQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 1/9] drm/msm/dpu: fix SSPP register
 definitions
To: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 May 2023 at 20:24, Jeykumar Sankaran
<quic_jeykumar@quicinc.com> wrote:
>
>
>
> On 5/2/2023 8:05 AM, Dmitry Baryshkov wrote:
> > Reorder SSPP register definitions to sort them in the ascending order.
> > Move register bitfields after the register definitions.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 66 +++++++++++----------
> >   1 file changed, 34 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 6b68ec5c7a5a..1bf717290dab 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -26,45 +26,18 @@
> >   #define SSPP_SRC_FORMAT                    0x30
> >   #define SSPP_SRC_UNPACK_PATTERN            0x34
> >   #define SSPP_SRC_OP_MODE                   0x38
> > -
> > -/* SSPP_MULTIRECT*/
> > -#define SSPP_SRC_SIZE_REC1                 0x16C
> > -#define SSPP_SRC_XY_REC1                   0x168
> > -#define SSPP_OUT_SIZE_REC1                 0x160
> > -#define SSPP_OUT_XY_REC1                   0x164
> > -#define SSPP_SRC_FORMAT_REC1               0x174
> > -#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> > -#define SSPP_SRC_OP_MODE_REC1              0x17C
> > -#define SSPP_MULTIRECT_OPMODE              0x170
> > -#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> > -#define SSPP_EXCL_REC_SIZE_REC1            0x184
> > -#define SSPP_EXCL_REC_XY_REC1              0x188
> > -
> > -#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> > -#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> > -#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> > -#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> > -#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> > -#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> > -#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> > -#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> > -#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> > -#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> > -#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> > -#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
> > -
> >   #define SSPP_SRC_CONSTANT_COLOR            0x3c
> >   #define SSPP_EXCL_REC_CTL                  0x40
> >   #define SSPP_UBWC_STATIC_CTRL              0x44
> > -#define SSPP_FETCH_CONFIG                  0x048
> > +#define SSPP_FETCH_CONFIG                  0x48
> >   #define SSPP_DANGER_LUT                    0x60
> >   #define SSPP_SAFE_LUT                      0x64
> >   #define SSPP_CREQ_LUT                      0x68
> >   #define SSPP_QOS_CTRL                      0x6C
> > -#define SSPP_DECIMATION_CONFIG             0xB4
> >   #define SSPP_SRC_ADDR_SW_STATUS            0x70
> >   #define SSPP_CREQ_LUT_0                    0x74
> >   #define SSPP_CREQ_LUT_1                    0x78
> > +#define SSPP_DECIMATION_CONFIG             0xB4
> >   #define SSPP_SW_PIX_EXT_C0_LR              0x100
> >   #define SSPP_SW_PIX_EXT_C0_TB              0x104
> >   #define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
> > @@ -81,11 +54,33 @@
> >   #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
> >   #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
> >   #define SSPP_TRAFFIC_SHAPER_REC1           0x158
> > +#define SSPP_OUT_SIZE_REC1                 0x160
> > +#define SSPP_OUT_XY_REC1                   0x164
> > +#define SSPP_SRC_XY_REC1                   0x168
> > +#define SSPP_SRC_SIZE_REC1                 0x16C
> > +#define SSPP_MULTIRECT_OPMODE              0x170
> > +#define SSPP_SRC_FORMAT_REC1               0x174
> > +#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> > +#define SSPP_SRC_OP_MODE_REC1              0x17C
> > +#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> > +#define SSPP_EXCL_REC_SIZE_REC1            0x184
> > +#define SSPP_EXCL_REC_XY_REC1              0x188
> >   #define SSPP_EXCL_REC_SIZE                 0x1B4
> >   #define SSPP_EXCL_REC_XY                   0x1B8
> > -#define SSPP_VIG_OP_MODE                   0x0
> > -#define SSPP_VIG_CSC_10_OP_MODE            0x0
> > -#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> > +
> > +/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
> > +#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> > +#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> > +#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> > +#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> > +#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> > +#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> > +#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> > +#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> > +#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> > +#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> > +#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> > +#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
> >
> >   /* SSPP_QOS_CTRL */
> >   #define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
> > @@ -96,6 +91,7 @@
> >   #define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
> >
> >   /* DPU_SSPP_SCALER_QSEED2 */
> > +#define SSPP_VIG_OP_MODE                   0x0
> >   #define SCALE_CONFIG                       0x04
> >   #define COMP0_3_PHASE_STEP_X               0x10
> >   #define COMP0_3_PHASE_STEP_Y               0x14
> > @@ -107,6 +103,12 @@
> >   #define COMP1_2_INIT_PHASE_Y               0x2C
> >   #define VIG_0_QSEED2_SHARP                 0x30
> >
> > +/* DPU_SSPP_CSC_10BIT space */
> > +#define SSPP_VIG_CSC_10_OP_MODE            0x0
> > +
> There is an existing grouping for CSC 10 bit op modes. You can add to that.

Good idea, thanks!

> > +/* SSPP_TRAFFIC_SHAPER and _REC1 */
> I dont get the _REC1 comment. How is it relevent for this flag?

Because this define is applicable to the SSPP_T_S and SSPP_T_S_REC1 registers.

> > +#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> > +
> >   /*
> >    * Definitions for ViG op modes
> >    */



-- 
With best wishes
Dmitry
