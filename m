Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA9180A971
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344BA10EADC;
	Fri,  8 Dec 2023 16:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E361310E095
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:40:30 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5c85e8fdd2dso21570607b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702053629; x=1702658429; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CtIjztq82Ng605c+NcEssJ2cJtY62a3iRKW7Z12Ri0I=;
 b=QU0ZKLgyo0hZdsmXwSRFylMr453921iZQPVrkVhYiYiwsy6IVq15s2sPXk5/JZCB2W
 ReUZuMzOuLyL43DgNsCkL0Tt4+kndXaT81Vz/Jx15ohDOhoyzfzm7OuE6X2G85ylwjjd
 EsXdwk+hx9HW6atzlSzR9c4lR9ktJOL8tTUFN8ZK1iLGWNrLDKNnZqz5OPCHXtsNpj5b
 NbXl3rs99fCtqGt2vhHHm+TqzbqYfQY1Jrmv7vhNZ/Hz1UpLIrDZxepfGPhQRDO0glc0
 loKOefrbU7FU+5hgi6Iw9N4unK7gVm1y3xHExtJV43ApUAJL/L85Rmh8zmDLIUJVIfuv
 yKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702053629; x=1702658429;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CtIjztq82Ng605c+NcEssJ2cJtY62a3iRKW7Z12Ri0I=;
 b=uLSLy4wDFTDQsGJ0nvnIQ05/pPnvbgyGTFRg9sNvxtQY9mEvY69h7kkmy6lOx4huCJ
 xbhheYJxJaHrta1684ftTJNFoItFPOH9pdHQZHlS8uspqiE2IEwlj6xKIiieFB2qtvqC
 nKdtUJC+XCA8xt9AgeHpALI7lN2igOE0+yBlntdcVXbwR47MNK5gQH04auusk8oLWZaD
 PeOm7O8iL9Zvcx7GlvkAsULswpwYb8WaNaCKjLDpsQ6AHdf+efYv+nBH00aOGbaITQ5O
 b8auWRbYYhIm5usGiyS1YMNExV3ibojxZQK4p6vxfjFBHExzrHQzDTWpbnOJkH8im7Ir
 6xhQ==
X-Gm-Message-State: AOJu0YxP4aV9Stg2Z0zmIYW8o6HIqNqcAWDek5Kq2vi1NdGNzfg4x6sC
 N0q+wU4MAdu658SjKXJLeOKTWCyIZT+iz92UHHjPnQ==
X-Google-Smtp-Source: AGHT+IHvTBdkl+EMYls7dvGnTWOsuUM1VpIOdfLz7rVspnKaURICzUDPvLEdtBIUgsSqTefjgUvEZwF1pXlTXS5RX5M=
X-Received: by 2002:a81:4a45:0:b0:5d8:5727:80fa with SMTP id
 x66-20020a814a45000000b005d8572780famr254821ywa.98.1702053629351; Fri, 08 Dec
 2023 08:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-5-quic_abhinavk@quicinc.com>
 <CAA8EJpro4ehwZ8Gs+ASUmrMJS0HbnDXd5pXwijs1jkDpR-kAOQ@mail.gmail.com>
 <ceb7e736-22f3-0cf3-3d65-7ec33e7c9d95@quicinc.com>
 <CAA8EJprr=T1cNst_dTNSToW_fVOM3mo-yRmWuK=8BU5rDNd54Q@mail.gmail.com>
 <5d4104ae-8737-6576-79ab-e68126bd826a@quicinc.com>
In-Reply-To: <5d4104ae-8737-6576-79ab-e68126bd826a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 18:40:18 +0200
Message-ID: <CAA8EJpq=XTeRM59qvLuxPLatpbBdeqq1MHtx3PuKgb_HeN+PfA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] drm/msm/dpu: move csc matrices to dpu_hw_util
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

On Fri, 8 Dec 2023 at 18:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/8/2023 8:27 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 18:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/8/2023 3:12 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>> Since the type and usage of CSC matrices is spanning across DPU
> >>>> lets introduce a helper to the dpu_hw_util to return the CSC
> >>>> corresponding to the request type. This will help to add more
> >>>> supported CSC types such as the RGB to YUV one which is used in
> >>>> the case of CDM.
> >>>>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 54 +++++++++++++++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 39 ++-------------
> >>>>    3 files changed, 64 insertions(+), 36 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >>>> index 0b05061e3e62..59a153331194 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >>>> @@ -87,6 +87,60 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
> >>>>    #define QOS_QOS_CTRL_VBLANK_EN            BIT(16)
> >>>>    #define QOS_QOS_CTRL_CREQ_VBLANK_MASK     GENMASK(21, 20)
> >>>>
> >>>> +static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
> >>>> +       {
> >>>> +               /* S15.16 format */
> >>>> +               0x00012A00, 0x00000000, 0x00019880,
> >>>> +               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> >>>> +               0x00012A00, 0x00020480, 0x00000000,
> >>>> +       },
> >>>> +       /* signed bias */
> >>>> +       { 0xfff0, 0xff80, 0xff80,},
> >>>> +       { 0x0, 0x0, 0x0,},
> >>>> +       /* unsigned clamp */
> >>>> +       { 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
> >>>> +       { 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
> >>>> +};
> >>>> +
> >>>> +static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
> >>>> +       {
> >>>> +               /* S15.16 format */
> >>>> +               0x00012A00, 0x00000000, 0x00019880,
> >>>> +               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> >>>> +               0x00012A00, 0x00020480, 0x00000000,
> >>>> +       },
> >>>> +       /* signed bias */
> >>>> +       { 0xffc0, 0xfe00, 0xfe00,},
> >>>> +       { 0x0, 0x0, 0x0,},
> >>>> +       /* unsigned clamp */
> >>>> +       { 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
> >>>> +       { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
> >>>> +};
> >>>> +
> >>>> +/**
> >>>> + * dpu_hw_get_csc_cfg - get the CSC matrix based on the request type
> >>>> + * @type:              type of the requested CSC matrix from caller
> >>>> + * Return: CSC matrix corresponding to the request type in DPU format
> >>>> + */
> >>>> +const struct dpu_csc_cfg *dpu_hw_get_csc_cfg(enum dpu_hw_csc_cfg_type type)
> >>>> +{
> >>>> +       const struct dpu_csc_cfg *csc_cfg = NULL;
> >>>> +
> >>>> +       switch (type) {
> >>>> +       case DPU_HW_YUV2RGB_601L:
> >>>> +               csc_cfg = &dpu_csc_YUV2RGB_601L;
> >>>> +               break;
> >>>> +       case DPU_HW_YUV2RGB_601L_10BIT:
> >>>> +               csc_cfg = &dpu_csc10_YUV2RGB_601L;
> >>>> +               break;
> >>>> +       default:
> >>>> +               DPU_ERROR("unknown csc_cfg type\n");
> >>>> +               break;
> >>>> +       }
> >>>> +
> >>>> +       return csc_cfg;
> >>>> +}
> >>>> +
> >>>>    void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
> >>>>                   u32 reg_off,
> >>>>                   u32 val,
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >>>> index fe083b2e5696..49f2bcf6de15 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >>>> @@ -19,6 +19,11 @@
> >>>>    #define MISR_CTRL_STATUS_CLEAR          BIT(10)
> >>>>    #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
> >>>>
> >>>> +enum dpu_hw_csc_cfg_type {
> >>>> +       DPU_HW_YUV2RGB_601L,
> >>>> +       DPU_HW_YUV2RGB_601L_10BIT,
> >>>> +};
> >>>> +
> >>>>    /*
> >>>>     * This is the common struct maintained by each sub block
> >>>>     * for mapping the register offsets in this block to the
> >>>> @@ -368,4 +373,6 @@ bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
> >>>>                              const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
> >>>>                              bool enable);
> >>>>
> >>>> +const struct dpu_csc_cfg *dpu_hw_get_csc_cfg(enum dpu_hw_csc_cfg_type type);
> >>>
> >>> I don't think we need extra enum and wrapper. Just export const data
> >>> structures directly.
> >>>
> >>
> >> I liked this approach because the blocks of DPU such as plane and CDM
> >> are clients to the dpu_hw_util and just request the type and the util
> >> handles their request of returning the correct csc matrix.
> >>
> >> Do you see any issue with this?
> >
> > Not an issue, but I don't see anything that requires an extra
> > abstraction. We perfectly know which CSC config we would like to get.
> >
>
> Correct, so the clients know which "type" of matrix they need and not
> the matrix itself. That was the idea behind this.

I consider this to be an unnecessary abstraction. In our case, knowing
the type = knowing the address of the matrix. I don't foresee any
additional logic there.

>
> >>
> >>>> +
> >>>>    #endif /* _DPU_HW_UTIL_H */
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>> index 3235ab132540..31641889b9f0 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>>> @@ -21,6 +21,7 @@
> >>>>    #include "dpu_kms.h"
> >>>>    #include "dpu_formats.h"
> >>>>    #include "dpu_hw_sspp.h"
> >>>> +#include "dpu_hw_util.h"
> >>>>    #include "dpu_trace.h"
> >>>>    #include "dpu_crtc.h"
> >>>>    #include "dpu_vbif.h"
> >>>> @@ -508,50 +509,16 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
> >>>>           }
> >>>>    }
> >>>>
> >>>> -static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
> >>>> -       {
> >>>> -               /* S15.16 format */
> >>>> -               0x00012A00, 0x00000000, 0x00019880,
> >>>> -               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> >>>> -               0x00012A00, 0x00020480, 0x00000000,
> >>>> -       },
> >>>> -       /* signed bias */
> >>>> -       { 0xfff0, 0xff80, 0xff80,},
> >>>> -       { 0x0, 0x0, 0x0,},
> >>>> -       /* unsigned clamp */
> >>>> -       { 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
> >>>> -       { 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
> >>>> -};
> >>>> -
> >>>> -static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
> >>>> -       {
> >>>> -               /* S15.16 format */
> >>>> -               0x00012A00, 0x00000000, 0x00019880,
> >>>> -               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> >>>> -               0x00012A00, 0x00020480, 0x00000000,
> >>>> -               },
> >>>> -       /* signed bias */
> >>>> -       { 0xffc0, 0xfe00, 0xfe00,},
> >>>> -       { 0x0, 0x0, 0x0,},
> >>>> -       /* unsigned clamp */
> >>>> -       { 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
> >>>> -       { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
> >>>> -};
> >>>> -
> >>>>    static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
> >>>>                                                       const struct dpu_format *fmt)
> >>>>    {
> >>>> -       const struct dpu_csc_cfg *csc_ptr;
> >>>> -
> >>>>           if (!DPU_FORMAT_IS_YUV(fmt))
> >>>>                   return NULL;
> >>>>
> >>>>           if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
> >>>> -               csc_ptr = &dpu_csc10_YUV2RGB_601L;
> >>>> +               return dpu_hw_get_csc_cfg(DPU_HW_YUV2RGB_601L_10BIT);
> >>>>           else
> >>>> -               csc_ptr = &dpu_csc_YUV2RGB_601L;
> >>>> -
> >>>> -       return csc_ptr;
> >>>> +               return dpu_hw_get_csc_cfg(DPU_HW_YUV2RGB_601L);
> >>>>    }
> >>>>
> >>>>    static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
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
