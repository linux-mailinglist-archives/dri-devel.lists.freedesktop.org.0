Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E51D7DE673
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 20:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BFA10E770;
	Wed,  1 Nov 2023 19:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A5B10E770
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 19:40:08 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-579de633419so2068137b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 12:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698867607; x=1699472407; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0jpOR9y+vFijEjrWLnD2TLSnh9hkNPGIwFUihlXvVfM=;
 b=D1KnmC/LUeSUOW1JhdA50OXdi08zFuoYD4SqjGJ6D00dttFt1ebDSr+8IK5hx3VCHn
 9MeZ4bs2E3PGAZpuf0N1f4+ZVSKThNQUEUexWgCYme8hbOMqpTBujBNYkK8KmJ/Y5eR2
 ziQfJ1ATE0H+eswIZo7qMid804VhQ8kp8K+atY+DnAbgwi8K9bQjX/EMU2w/rao77b5P
 4vg+P6b8cMHTFJ2vkOgsbsd4ckMVAsHhReViBjvdmEd2Y4j9NtlOEtj46u4AaVcyvWo1
 mU4+o6BBZiZe5AkBPGdLq1gFDWgR5rZJcnXQsQoH3wKGhfKErQlrB/7nA+45C3wUtHqH
 kpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698867607; x=1699472407;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0jpOR9y+vFijEjrWLnD2TLSnh9hkNPGIwFUihlXvVfM=;
 b=AEYeRkGspCXrVJm4DgLocAiRuUZ3brqRraVEpZpg6/6LjSjDZynUyDG17/P0/wdke8
 9/M8bWZT1kdK+kYV6URPB6pVjqf2pWFWNheYi9yFy9+UAFVju9JP4755MqgpLWvf5OYf
 wMWzWEcFi23o5EvXKiBqmuB2e2SbACd7MpQPcXmDwEOWNa60mGQaQ/bf5UStd/Gb8VNm
 aqdUfZXB1icfwGEqJu6b9sCp82UWM5Rdn4YWnK2fJg0dBjoh1CIFMXlXYNP+u5YuYtUG
 jpjmo6HcRDvHTtnu8V4Zp0qFq+ZZcIpgumMZMZacmSI8UL2yeceBesv5mXKcsjr8sY0+
 p8JQ==
X-Gm-Message-State: AOJu0YwS3fjCNUB8AhHULKwdx4feR/yZzIwy2JEGhDse1Hxx331gdhA1
 6OLcxReKfeJwpvm8k1l93dgUjMyf+qF1i5cG64wdnQ==
X-Google-Smtp-Source: AGHT+IHuLqAxFmg6Pjc8KI/XT67ilo5WsfnG+ZyT/XfkzQM0B9ukCZ/ekaipN4/MPQbfyKAQFDVPOEw86yUaYSpaXJ8=
X-Received: by 2002:a81:9b45:0:b0:5a7:af86:8d3b with SMTP id
 s66-20020a819b45000000b005a7af868d3bmr16412079ywg.37.1698867606856; Wed, 01
 Nov 2023 12:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-10-dmitry.baryshkov@linaro.org>
 <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
 <CAA8EJpr35LgyfNOcwiE0FgGR-CfS6b996HZk0tnQrVpOX99aRg@mail.gmail.com>
 <6d25aaec-58ef-6f66-d2f8-d351ab703d05@quicinc.com>
In-Reply-To: <6d25aaec-58ef-6f66-d2f8-d351ab703d05@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Nov 2023 21:39:55 +0200
Message-ID: <CAA8EJprX=8w7WDb8YF3Tf5bmkeym024oESSeoBtq5OU25CtcgQ@mail.gmail.com>
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

On Wed, 1 Nov 2023 at 20:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/31/2023 1:19 AM, Dmitry Baryshkov wrote:
> > On Mon, 30 Oct 2023 at 22:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> >>> Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> >>> are all related to different versions of the same HW scaling block.
> >>> Corresponding driver parts use scaler_blk.version to identify the
> >>> correct way to program the hardware. In order to simplify the driver
> >>> codepath, merge these three feature bits.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
> >>>    4 files changed, 6 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> index 32c396abf877..eb867c8123d7 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> @@ -31,10 +31,10 @@
> >>>        (VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> >>>
> >>>    #define VIG_SC7180_MASK \
> >>> -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
> >>> +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >>>
> >>>    #define VIG_SM6125_MASK \
> >>> -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> >>> +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> >>>
> >>
> >> This merging is coming at a cost of inaccuracy. We are marking sc7180
> >> and sm6125 as scaler_qseed3. But they are not. Let me know what you
> >> think of below idea instead.
> >>
> >>>    #define VIG_SC7180_MASK_SDMA \
> >>>        (VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> index fc5027b0123a..ba262b3f0bdc 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> @@ -51,9 +51,7 @@ enum {
> >>>    /**
> >>>     * SSPP sub-blocks/features
> >>>     * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> >>> - * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
> >>> - * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
> >>> - * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
> >>> + * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
> >>>     * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
> >>>     * @DPU_SSPP_CSC,            Support of Color space converion
> >>>     * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
> >>> @@ -72,8 +70,6 @@ enum {
> >>>    enum {
> >>>        DPU_SSPP_SCALER_QSEED2 = 0x1,
> >>>        DPU_SSPP_SCALER_QSEED3,
> >>> -     DPU_SSPP_SCALER_QSEED3LITE,
> >>> -     DPU_SSPP_SCALER_QSEED4,
> >>>        DPU_SSPP_SCALER_RGB,
> >>>        DPU_SSPP_CSC,
> >>>        DPU_SSPP_CSC_10BIT,
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>> index 7e9c87088e17..d1b70cf72eef 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> >>> @@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
> >>>                test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> >>>                c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> >>>
> >>> -     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
> >>> -                     test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
> >>> -                     test_bit(DPU_SSPP_SCALER_QSEED4, &features))
> >>> +     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
> >>>                c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
> >>
> >> Can we just do sblk->scaler_blk.version >= 0x3000 instead of this
> >> merging? That way you can still drop those enums without inaccuracy.
> >
> > No. QSEED3 from sdm845 has version 1.3, msm8998, sdm660 and sdm630
> > have version 1.2.
> >
>
> Ah got it.
>
> HW versioning is getting harder to generalize with the example you have
> given. In my opinion, in that case lets keep these enums intact because
> we dont have any other way of knowing the Qseed version otherwise and in
> terms of LOC, we are not really saving so much in this change.
>
> In the prev change I agreed because along with the name and the version,
> we could still interpret the version but with compressing the enums into
> just QSEED3, this becomes very confusing. So now, in the future if we
> have QSEED5 HW, we will have to change this anyway as its LUT
> programming can change. So we need this distinction.

I'm trying to eliminate them, because they cause more confusion than
the bonuses.
Currently we have QSEED3  / 3LITE / 4, which are somewhat compatible.

We are aiming to support QSEED2 and RGB, which are incompatible with
the QSEED3/3lite/4 family programming sequence. So they get their own
feature bits (DPU_SSPP_SCALER_QSEED2 and DPU_SSPP_SCALER_RGB).

QSEED5-to-be will either be compatible with QSEED3 (and thus can fall
into the same bucket) or it will be a different kind of scaler (and
will get its own feature).

I'm not a fan of DPU_SSPP_SCALER_QSEED3LITE/QSEED4 and I'd like to
remove those two bits for the following reasons:
- We already encode this info into the scaler version. How should
driver behave it it has e.g. version 3.1, but DPU_SSPP_SCALER_QSEED3?
Or vice versa: version 1.2 but QSEED4 feature bit? Having a single
QSEED3 removes this issue.
- Adding QSEED5-compatible-with-QSEED3 requires changing several
places which deal with the feature bits and the per-version setup
sequence. This seems like an overkill. It is easy to miss one of the
places and thus end up with the half-supported scaler

I admit, it might not be ideal to use QSEED3 for all scaler versions.
I'm open to suggestions on the better name for this feature bit. But I
have no doubts that there should be a single feature bit for all
QSEED3/3LITE/4 scalers.

>
> The below two changes seem fine and that way we are eliminating the
> usages of the enum and we will end up with only one place using this.
>
>
> >>
> >>>
> >>>        if (test_bit(DPU_SSPP_CDP, &features))
> >>> @@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> >>>                        cfg->len,
> >>>                        kms);
> >>>
> >>> -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> >>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> >>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> >>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> >>> +     if (sblk->scaler_blk.len)
> >>
> >> This part seems fine.
> >>
> >>>                dpu_debugfs_create_regset32("scaler_blk", 0400,
> >>>                                debugfs_root,
> >>>                                sblk->scaler_blk.base + cfg->base,
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> index 43135894263c..ba3ee4ba25b3 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
> >>>                        scale_cfg->src_height[i] /= chroma_subsmpl_v;
> >>>                }
> >>>
> >>> -             if (pipe_hw->cap->features &
> >>> -                     BIT(DPU_SSPP_SCALER_QSEED4)) {
> >>> +             if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
> >> This is fine too.
> >>>                        scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
> >>>                        scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> >>>                } else {
> >
> >
> >



-- 
With best wishes
Dmitry
