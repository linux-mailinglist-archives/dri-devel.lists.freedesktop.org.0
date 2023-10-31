Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B177DC808
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 09:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B18310E41D;
	Tue, 31 Oct 2023 08:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9157F10E41E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 08:19:30 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5a86b6391e9so51678567b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698740369; x=1699345169; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xr08QYldhmln2QjJdXVDVvMGXlegG4AyHEpzWJW2wkk=;
 b=B7vynd0xmeiX5VVCgHVM9nZTAslPHe+XW2EOrmikmnH+kQL9eVkawE3KCRCKOg2Vv6
 FQ5E0gf8ZxAXy/Sg99FM2zs1VdK4l8dT+qVTobkDzNcrmcyZ7k6e3FZrHq7/FU7NdNOr
 wXo0aIslchFp1/OzELiyhCIZ/GiNGQ7KQQbkAf0L4AtYD5S0pRNHQYWrlgXBwkmndVMi
 tcN5r5z0lk8FN5zjNiHK9z9UcndePTj6PzBbbmiGOHbPKnlp+PuLNbxGkkdWO2dA0n2e
 fBo16tJRxqa5EeRQ+88gzw/jYDa4v7vKQkOASsUGncKcF7juDlnIWLdNUt+pc5JpUQOk
 RNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698740369; x=1699345169;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xr08QYldhmln2QjJdXVDVvMGXlegG4AyHEpzWJW2wkk=;
 b=iTrm5ZTKsw2ue+w/xNfN1q66v36p6AMLfTaQpsBo2iQLfs61YZb524QpJntFKyiS4b
 JEB9sCy6D/U1nrbPPnBL799TWb0X1tJuc5r+7Rg2pE1Eizd9OTBrIdn2ghS4q4qJlZ3z
 hJ1puT53nndZOfLF4Dya6F4qFZph6Q1mQ5NViarLGJ18Emn18rNeIljDjYqvYDQ8BDXx
 wu+/LhKJmD5/qDPpO+RC3zM2l8cmKioS/710ogp1qGcJJEicj6pwn5aK0s7ZvPFeoXPM
 jB+iGbMiSp6NrEJT2xbA6Eq2N/9qOzoIEP/6IrO9khKU7Hvt+An9kibMJhALLfUlaib0
 GCpQ==
X-Gm-Message-State: AOJu0Yx4b2WDHYAZBVpzmQlp9u9279Yg3aaRoV7oa5Y3hLtqKGD9Y7EP
 7eU4ek75S6ZhzfoJwmMB7qTMm/uAraa4eYjt7sYx4g==
X-Google-Smtp-Source: AGHT+IH54Yf5q/xYgf4X4l3uKpmKCgK109l5WL/rQxro+ikkC/pb0jUJJxePZZgXlMEHG9DbwAI9boC+Jrf9KbHWBMc=
X-Received: by 2002:a81:ae62:0:b0:5a8:8f0d:db2d with SMTP id
 g34-20020a81ae62000000b005a88f0ddb2dmr12038746ywk.2.1698740369585; Tue, 31
 Oct 2023 01:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-10-dmitry.baryshkov@linaro.org>
 <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
In-Reply-To: <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Oct 2023 10:19:18 +0200
Message-ID: <CAA8EJpr35LgyfNOcwiE0FgGR-CfS6b996HZk0tnQrVpOX99aRg@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
 QSEED3LITE, QSEED4
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 22:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> > Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> > are all related to different versions of the same HW scaling block.
> > Corresponding driver parts use scaler_blk.version to identify the
> > correct way to program the hardware. In order to simplify the driver
> > codepath, merge these three feature bits.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
> >   4 files changed, 6 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 32c396abf877..eb867c8123d7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -31,10 +31,10 @@
> >       (VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> >
> >   #define VIG_SC7180_MASK \
> > -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
> > +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >
> >   #define VIG_SM6125_MASK \
> > -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> > +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >
>
> This merging is coming at a cost of inaccuracy. We are marking sc7180
> and sm6125 as scaler_qseed3. But they are not. Let me know what you
> think of below idea instead.
>
> >   #define VIG_SC7180_MASK_SDMA \
> >       (VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index fc5027b0123a..ba262b3f0bdc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -51,9 +51,7 @@ enum {
> >   /**
> >    * SSPP sub-blocks/features
> >    * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> > - * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
> > - * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
> > - * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
> > + * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
> >    * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
> >    * @DPU_SSPP_CSC,            Support of Color space converion
> >    * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
> > @@ -72,8 +70,6 @@ enum {
> >   enum {
> >       DPU_SSPP_SCALER_QSEED2 = 0x1,
> >       DPU_SSPP_SCALER_QSEED3,
> > -     DPU_SSPP_SCALER_QSEED3LITE,
> > -     DPU_SSPP_SCALER_QSEED4,
> >       DPU_SSPP_SCALER_RGB,
> >       DPU_SSPP_CSC,
> >       DPU_SSPP_CSC_10BIT,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 7e9c87088e17..d1b70cf72eef 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
> >               test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> >               c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> >
> > -     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
> > -                     test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
> > -                     test_bit(DPU_SSPP_SCALER_QSEED4, &features))
> > +     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
> >               c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
>
> Can we just do sblk->scaler_blk.version >= 0x3000 instead of this
> merging? That way you can still drop those enums without inaccuracy.

No. QSEED3 from sdm845 has version 1.3, msm8998, sdm660 and sdm630
have version 1.2.

>
> >
> >       if (test_bit(DPU_SSPP_CDP, &features))
> > @@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> >                       cfg->len,
> >                       kms);
> >
> > -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> > +     if (sblk->scaler_blk.len)
>
> This part seems fine.
>
> >               dpu_debugfs_create_regset32("scaler_blk", 0400,
> >                               debugfs_root,
> >                               sblk->scaler_blk.base + cfg->base,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 43135894263c..ba3ee4ba25b3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
> >                       scale_cfg->src_height[i] /= chroma_subsmpl_v;
> >               }
> >
> > -             if (pipe_hw->cap->features &
> > -                     BIT(DPU_SSPP_SCALER_QSEED4)) {
> > +             if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
> This is fine too.
> >                       scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
> >                       scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> >               } else {



-- 
With best wishes
Dmitry
