Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DA06B9A06
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25EE10EA8A;
	Tue, 14 Mar 2023 15:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A3210E83A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:41:54 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5445009c26bso87169817b3.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r2eydF/1OI43/2Qfy2ViK1gUkj+J848Ww0RP8NZLzkg=;
 b=CRM/UqAq5qfr1H0agZTquPf7F6XZuZziTHQKjqGa2GtNhGUA0uIqR4AonYy3BjkNxR
 Dn2x2pvh2jDuYX0/8HTrQ9QvEP1Bra13gN7RFFv0MO+ybviQOMHeA1t7tlVDaffhlCFb
 fpY6FBaKNbEOpr8FTpOCJTniJVqyBvnou6HfJcc2gGTbn9i1KEymDgKCmKDnAbgIfLAv
 Oo6aiBLVDCOmURKlhw5YBLvM0jZ14ygUriLyY/DytvNkZzhTy+IvSRl4c2fBgN8hrBBl
 iP2NhVkLmhgI2Wgf7iX4M82kSp5oPF/7PBGy/xzE8C6Htuu8pAszxxoN4RBTwbMHMOjB
 OxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2eydF/1OI43/2Qfy2ViK1gUkj+J848Ww0RP8NZLzkg=;
 b=FztBSvclzDB1xLRIzIUX8sUSv9353IEoWAwvfbTNltuvE/t22Fi3w5ixsa43W5NSr2
 UfeGcS3VnkrPN/t3fGM5EyQGAg/oTOPiXXbQn5EHernonZEydkdWF3FGtqYHYH0/VydF
 u2XwtiBvujonWMC6fOF4vhgOUi82/6KdUsLxqu/slyYjIS+9qIm+I9ikf33lVAX9ywoy
 HPg3TYzBNQIAkpWhtipzV1gSjZr3V2dq0WgU5359pgdR7QBVCStH+G01mpTSpzcMCNnZ
 x2tAy4A/GqedEsWJQImYaMfpJflo7B/XJlVUScyaOmtLxjmnM+xhhJyYLdBOOgIZhEbX
 zRHQ==
X-Gm-Message-State: AO0yUKU4v1lhJJhCdm25/MISdzimye6samGKK5QwOdxio6YimxOPBvIc
 9vssnByXqLrrGtibC2DfibHdaxdvLDlU1fofEHkU3Q==
X-Google-Smtp-Source: AK7set9v/eRM4FHR0LXUi+liNzAoAGgf5LamjGr4AG1H13f4k9tvPJTy1x7RYWvaReVp2v+ylEUat+sM+RsbXH7uYuY=
X-Received: by 2002:a81:ac16:0:b0:541:6d4c:9276 with SMTP id
 k22-20020a81ac16000000b005416d4c9276mr7853585ywh.5.1678808513389; Tue, 14 Mar
 2023 08:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
 <20230314153545.3442879-28-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230314153545.3442879-28-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Mar 2023 17:41:42 +0200
Message-ID: <CAA8EJpqTT1BK5oDNbL=t8BMwVjK_swDdD-L4o2PZ2Zec09qSnQ@mail.gmail.com>
Subject: Re: [PATCH v6 27/32] drm/msm/dpu: add support for wide planes
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Mar 2023 at 17:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> It is possible to use multirect feature and split source to use the SSPP
> to output two consecutive rectangles. This commit brings in this
> capability to support wider screen resolutions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 127 +++++++++++++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
>  3 files changed, 133 insertions(+), 17 deletions(-)
>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index f52120b05b6e..494c1144075a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

[...]

> @@ -1016,21 +1026,58 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 return -E2BIG;
>         }
>
> +       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +
>         max_linewidth = pdpu->catalog->caps->max_linewidth;
> +       if (DPU_FORMAT_IS_UBWC(fmt))
> +               max_linewidth /= 2;

I added this check and only after sending it caught my mind that this
check should not be applied in the non-multirec case. Please ignore
the series, I will resend it later.

>
> -       /* check decimated source width */
>         if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> -               DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -                               DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -               return -E2BIG;
> -       }
> +               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +                       return -E2BIG;
> +               }
>

[skipped the rest]

-- 
With best wishes
Dmitry
