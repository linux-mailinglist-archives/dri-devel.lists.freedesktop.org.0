Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00479642A6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199DF10E621;
	Thu, 29 Aug 2024 11:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jQ/pdOh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20510E621
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:07:03 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e164caa76e4so530788276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929622; x=1725534422; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2FuiHRYmBII7CoQqq9xCL2kOtuNSnjrajQjxmPmHnZ8=;
 b=jQ/pdOh4e+fUuxEqOg50NqyVc3XZ5uaMvix3fp2lNGqivYc9Tp9iQNwF2bZjzFqcLl
 vlwCncUKLzEkLf/XZB2lHVwhiAwc8H6I9UFz9m7mkL7x8sTwLylvetMPHmBWm64lNREs
 UXH/Qz5F3KBLwQc9LBKtMmmV1ShsFc08IDfewjmC8nFlfKsW2W45KwLbqxIZC2pXdREr
 dsQ8Tlc/TOIhUVbMwDUttx8jV/4t6hQlQNeQdYYdbG3Uo3xCv1JxBdO/qjQJo4Ml2KA8
 j5NO/2sYRkzvuhKMiwLg/fvFxJ/wDqziUQHi2AWUJWZiU4cYK/R/l1Qjjzt8RTQUDhxK
 ymtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929622; x=1725534422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2FuiHRYmBII7CoQqq9xCL2kOtuNSnjrajQjxmPmHnZ8=;
 b=S2/ogyIn8mKCsHNlHfdeFjnXCzIApbgUAU0mBOeNRuSzVgfy7K21Wp3636YeC0PuVI
 dBm+7D+qKJ9D3WuoHfThvC28iZFGb9C0b1VtXCVvLTDdEIwkJVrcFiIlBCx7dcZlHkat
 HJFvR35gTLNGPu7Ib5qkJABt8LHzJWsNWIHRzIFK2cllYGT3SPjaR/uJXhdYuKaSas8h
 ECBDF4tlVrbXWaq0l199jJBDIydcUbvKB5yQSmics8Mrulo5ZDUFHUqcRv7lArPSeqjh
 V8jGL3gIl7bVNT/UPxsRpoMncB12mCp4+owOlSGTIsr6sC1coDB4e38Kpa6C6bmMiPZU
 D5+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0YpA7v5YJQINpttVGtDy2hRiIpFk9GjG/wTTk3vGos/6RtqhMdB8yADIQ+Y3hzpqT0qw6egVuKWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbrwt0cnJOVT7Icu2GH0Y5xweUtG4ZrSnaVk5PNMa99i8h54xZ
 nd5AptzQHk23eFzC6ftd37t5n2h1rP3S6OO3GNl2KHgbJjotxgieu19n3uioGY7CEwOmWZAryrl
 lVanekuwrzrtZBnol1QbXKhiggjl1YILb5+CnLQ==
X-Google-Smtp-Source: AGHT+IG6C72qHtyISBm3HKfToRlotpCAtyStHxCL0ejzZ1LSExVqFZtCpufpvVkCjEjUXY8Iy4niYfvncKhgcjxsk1k=
X-Received: by 2002:a25:a504:0:b0:e1a:6493:21e4 with SMTP id
 3f1490d57ef6-e1a6493239bmr928134276.44.1724929621911; Thu, 29 Aug 2024
 04:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:06:51 +0300
Message-ID: <CAA8EJppJUB=wmaU+Hnh1=46deh-_wgd2qKtS-MJRkowUr8bhPQ@mail.gmail.com>
Subject: Re: [PATCH 06/21] drm/msm/dpu: Add utility to get mixer number
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
> Add utility to get mixer number via CRTC handler
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h | 5 +++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7d0fff9472441..a27e39c525d1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1306,6 +1306,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>         return 0;
>  }
>
> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
> +{
> +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +       return cstate->num_mixers;
> +}

Merge with the user

> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index b26d5fe40c721..701c35803633d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -301,5 +301,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  }
>
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> +/**
> + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> + * @crtc: Pointer to drm crtc object
> + */

Move kerneldoc before the function implementation so that W=1 can check it.

> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
>
>  #endif /* _DPU_CRTC_H_ */
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
