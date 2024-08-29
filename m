Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8196429D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC1510E3DC;
	Thu, 29 Aug 2024 11:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QsJw0qU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F005F10E617
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:06:10 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-68518bc1407so6622997b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929570; x=1725534370; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t00GbWajI0fY42GgBRY0b15sJ+hM+PSIwwNAsxYr2Mg=;
 b=QsJw0qU7hbeWJ7ViCW7l/LNrUzicZjO+7uM4sWmDIdB3jzZmujAOnNB5W4lsmqjQgo
 6fDdbSr2jSpcbeAD0rHeEWmVwtnXykPdq9lRff+wnS4O6HuP4bKLmOVBHn7nBZdj6+CR
 UAuSbUpmB5j2O4jki3kLyiqzjttCOYbjuQ93EXjiDd4lfUBpzOSAWsQ04gDNCyB+6ax1
 i406w8XkmpWM+lcLgks52ryXV9kiy/lgRTxtnJAaBp3zGGhX0uALgZIb/LItQComMFzQ
 kcKgX0b+aG2O4wNRftE+ttjGsEKCBTRSGaHcBOHP/+oYKGUpL7hKAUfRBPc0REy6KdAS
 UVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929570; x=1725534370;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t00GbWajI0fY42GgBRY0b15sJ+hM+PSIwwNAsxYr2Mg=;
 b=DZKRxNH5Q0EAZtdw//lvyDtdbZ1lHLj5IxRz+2AC8AO10l75IX/5yBkbjsuPtzlWi4
 EVDJI9sA+GZe9UGNvMwpfEIFaZDGSaWT5HaU3SDVkyr4vKt68Lo4cDXc3++lg3dXvppu
 UUL3PmThlQoNAKnn56vA+J4qMxzWI1jFcDDGai2PCrSSD+kdfjT/YjqS4Mr/wGLCmf/O
 2Dba832Vy+Ppab13pviYodcTIDOV2nHfYx1tHvAyXXq6bIKlK+1+V9pvK/D31EkSC82t
 iUYxtil89QtVVXfxxmLX10Ym7zb/UjpO/A1XpP6m9p4pCoOYDf+FRIFYDBKLZ9FvwiXB
 BSDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeiMBYqqJqmmebBSUNGOQYSdRjNN9bjo0Pl3dehkaqvbpAaSQIk4Jh2HNKFaNIQGCW3XhSKmIlLfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP5iTVOFKbkZ1HO/GK8uNyoqmZqtz8S8G3tKJvLvgm+7ZKKjB2
 HNCePy49t5BFC9um0j3y1jeUbgucnRfeCMZn4HXil5WsrlbTOE6LDoqoHMv4Z0lxX0VnzUA/qmZ
 THMiibW6tsnt7gZajxMl4uvP+ngenHnDfnCS87g==
X-Google-Smtp-Source: AGHT+IFIHaboJ6IIfGbmUtGfNnqOp+c8jA6Hk5SaKD8wA7zMol9LODyzVqgOo6qMWeJVq2ejhZvuGsmKKNXu0fxcXgU=
X-Received: by 2002:a05:690c:3391:b0:6b5:71b2:13da with SMTP id
 00721157ae682-6d277777516mr24559917b3.32.1724929569807; Thu, 29 Aug 2024
 04:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:05:59 +0300
Message-ID: <CAA8EJpqJxF4fOaFT6Uu=D5A35HdEDYRhgkkT0TdZ+ckDS95Nag@mail.gmail.com>
Subject: Re: [PATCH 05/21] drm/msm/dpu: polish log for resource allocation
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add resource allocation type info.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 15b42a6683639..e219d706610c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>
> +static char *dpu_hw_blk_type_name[] = {
> +       [DPU_HW_BLK_TOP] = "blk_top",
> +       [DPU_HW_BLK_SSPP] = "blk_sspp",
> +       [DPU_HW_BLK_LM] = "blk_lm",
> +       [DPU_HW_BLK_CTL] = "blk_ctl",
> +       [DPU_HW_BLK_PINGPONG] = "blk_pingpong",
> +       [DPU_HW_BLK_INTF] = "blk_intf",
> +       [DPU_HW_BLK_WB] = "blk_wb",
> +       [DPU_HW_BLK_DSPP] = "blk_dspp",
> +       [DPU_HW_BLK_MERGE_3D] = "blk_merge_3d",
> +       [DPU_HW_BLK_DSC] = "blk_dsc",
> +       [DPU_HW_BLK_CDM] = "blk_cdm",

Drop blk_, upcase all abbreviations.

> +       [DPU_HW_BLK_MAX] = "blk_none",
> +};
> +
>  int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>         struct dpu_global_state *global_state, uint32_t enc_id,
>         enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
> @@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                         continue;
>
>                 if (num_blks == blks_size) {
> -                       DPU_ERROR("More than %d resources assigned to enc %d\n",
> -                                 blks_size, enc_id);
> +                       DPU_ERROR("More than %d %s assigned to enc %d\n",
> +                                 blks_size, dpu_hw_blk_type_name[type], enc_id);
>                         break;
>                 }
>                 if (!hw_blks[i]) {
> -                       DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -                                 type, enc_id);
> +                       DPU_ERROR("%s unavailable to assign to enc %d\n",
> +                                 dpu_hw_blk_type_name[type], enc_id);
>                         break;
>                 }
>                 blks[num_blks++] = hw_blks[i];
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
