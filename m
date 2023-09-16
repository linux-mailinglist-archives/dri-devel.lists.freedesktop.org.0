Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD27A2BF5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 02:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBF610E035;
	Sat, 16 Sep 2023 00:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E5F10E035
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 00:27:12 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d8020510203so2614751276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 17:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694824031; x=1695428831; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HFOJ8pdAeD8MTBy9n9Ge0MvARanNoOSWMjdOjkGv6BY=;
 b=Y4Swd3EUIXXcjAzkxqlHvJ9ZkQ+t1N+HhjoLa/BO7dygxxrFIEXDMf7rDg1MWQ56wM
 fiyz4+Gp4FEUJdtVOSRQPcluPGihpv6sDZkLloXvA9M+4+z1j7FgE4vsHkFLyt0dLc42
 ik/4/8A15Kkjk8RhfG5yi+athHr0Vhbusi1+kusb08apy4C4VYBUdrovtZdqYCisZj5C
 azliBJ2uyCu0rB5OJjaYtPqY9VAN79uz3FIleZdDyymiKkI/A/whpiS4q+Oe6j85/Oie
 3At0NvkAx6W7mMWpRqG3K6N2WiJf03kBJJE2wgnZ2v+D+UWI8miO+p+8iGc1HNRja2az
 +QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694824031; x=1695428831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HFOJ8pdAeD8MTBy9n9Ge0MvARanNoOSWMjdOjkGv6BY=;
 b=iYrb9dHnOeHfiiLieI1TCBpG/trszfqEb38ZfnK4OCxTc8YXn2QVI/k6MwyXWy7Bkf
 H1uscd5kklLOQUSEIZarULnW9h9+PP7HbrxAXL1hXdOYgmOcT82RBqpljmMkRpmNDQFV
 aMPYQ66s76HqHgUmSJzVrRlaUp5uLxudfZiC2TBCh4FwH5zaJNif/tVnNPS4wUfqvS7F
 QPynMxcveTVfrDhX6fbvhAwdMXze43/27l03ysa0FaORbgBNhGHCepx/BLi0WzGSghFN
 f1RJBQJda8L0A24SbJV5fwwaW5HvsDXHmNxRPAjexgtk1QXNUSfdt/KGgExB5ROikW65
 YAMQ==
X-Gm-Message-State: AOJu0YxVq8RzWp8YzW+YLfTjs7QyqmFDvat7oqhwAVgw6vTJdQHPuUww
 PqaypQak3aT0jSl9Z5yqcTI5vbpuilWqs2dRhr1EItzYBZobgPDkzKmgafgA
X-Google-Smtp-Source: AGHT+IEffMgx6tFl+GWPowmxEmTCgzRrov0K94NeZPVtL4UsaAvUY3zio7SwuEpYeOraMrnruj7Y2d64KYv3eHc4A3w=
X-Received: by 2002:a25:d08c:0:b0:d81:8507:dc51 with SMTP id
 h134-20020a25d08c000000b00d818507dc51mr3836354ybg.17.1694824031671; Fri, 15
 Sep 2023 17:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
 <20230911214521.787453-9-dmitry.baryshkov@linaro.org>
 <a2c778b0-43c4-3485-e7c6-e40484e451dc@quicinc.com>
In-Reply-To: <a2c778b0-43c4-3485-e7c6-e40484e451dc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Sep 2023 03:27:00 +0300
Message-ID: <CAA8EJpoi=XbbMUmnCcjiAWvSMoyNMOpGCQH94rQOxknL06c2KQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
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

On Sat, 16 Sept 2023 at 02:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 9/11/2023 2:45 PM, Dmitry Baryshkov wrote:
> > Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> > are all related to different versions of the same HW scaling block.
> > Corresponding driver parts use scaler_blk.version to identify the
> > correct way to program the hardware. In order to simplify the driver
> > codepath, merge these three feature bits.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I am okay with some parts of this change but not all.
>
> Please see below.
>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 4 +---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
> >   5 files changed, 7 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index b37b4076e53a..67d66319a825 100644
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
> This is like a half-n-half solution. This is telling that SC7180 and
> SM6125 have a scaler blk version of 3.1 but are still qseed3. That gives
> a misleading picture.

I had the impression that unlike QSEED2 (which was an actual thing)
the the names qseed3 / qseed3lite / qseed4 are more related to the
userspace lib. From the hardware point of view there are different
scaler versions (of course), but they do not correspond to the
3/3lite/4 names. I might be wrong here.
Can you please recommend a better name for this block?

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
> >
> any reason we cannot replace this with sblk->scaler_blk.version >= 1.2?

Is there a scaler version for the QSEED2 and/or RGB scalers? I was not
sure, so I preferred to be explicit here.
Another option might be to use core revision here, limiting it to MDP >= 3.0

But we still need to distinguish QSEED3-and-later, QSEED2 and RGB scalers.

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
> >               dpu_debugfs_create_regset32("scaler_blk", 0400,
> >                               debugfs_root,
> >                               sblk->scaler_blk.base + cfg->base,
>
> This part LGTM.
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index ca02f86c94ed..b157ed7da065 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -26,9 +26,7 @@ struct dpu_hw_sspp;
> >    */
> >   #define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
> >                        BIT(DPU_SSPP_SCALER_QSEED2) | \
> > -                      BIT(DPU_SSPP_SCALER_QSEED3) | \
> > -                      BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
> > -                      BIT(DPU_SSPP_SCALER_QSEED4))
> > +                      BIT(DPU_SSPP_SCALER_QSEED3))
> >
>
> I am not seeing DPU_SSPP_SCALER_RGB being set by any chipset in the
> catalog? So we can drop it in a separate change and then just use
> sblk->scaler_blk.len in the place of this macro and drop this macro.

It is a part of MSM8996 DPU support, see [1]

[1] https://patchwork.freedesktop.org/patch/555846/?series=123294&rev=1

>
> >   /*
> >    * Define all CSC feature bits in catalog
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index c2aaaded07ed..109355275ec5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
> >                       scale_cfg->src_height[i] /= chroma_subsmpl_v;
> >               }
> >
> > -             if (pipe_hw->cap->features &
> > -                     BIT(DPU_SSPP_SCALER_QSEED4)) {
> > +             if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
> >                       scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
> >                       scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> >               } else {
>
> This part LGTM.



-- 
With best wishes
Dmitry
