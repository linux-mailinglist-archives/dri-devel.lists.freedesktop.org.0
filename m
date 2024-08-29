Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438299642C5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBD510E63D;
	Thu, 29 Aug 2024 11:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SVXzZRWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E8510E633
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:12:10 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-202089e57d8so3320415ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929930; x=1725534730; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0LT3I5USuqdHB66fieoDxuDUolxHbQhLFiZF0asjZzM=;
 b=SVXzZRWR3hTHZUKNi+uDfHjeWpO3gXrbqAErd7aapssDcEwvq5iR5afh/7ADV0yI0S
 1+3K+PioyvLx+1RYgH8Iag9o8Ox2tNS+/XrLdQUm38bHmNWwEvmTKy0rTor2FN4SZflq
 S+VyGYiFUKLvu5WIldWRyt3rSjKsJSQxKVZfWK2+HsqeSLNOyDM4sPFzB225pQ0cpqCC
 Uof4n4y8S8GVqoF3rUeuDOLYTGUVnlFW2UoeCihHO5oZOVA2A2rGBTilHkyVPYoiu47l
 wMX8MIQYks95sqMOTTtwUjxkL0ms2GlhJTTYRWq+9PmKkMioxgAXd1fjlOk10HA9z/MP
 6ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929930; x=1725534730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0LT3I5USuqdHB66fieoDxuDUolxHbQhLFiZF0asjZzM=;
 b=Agqi6dvG0H0ZGd0FaLJJoY7uZHCUtO/BeDlFc4AyYQvET9UpCDxcDA77U+0G/d2BMp
 BUW2CCoSpHbmlHqCGXoN9YDWKnFIsdwWD9ZxY86UWEQm4JCfBt5Z+FXFDEijswByWRWY
 aIDQ0++fc0EPymUwbyh5PByvs+oNQBLEV28uGiZVqVYSNKR3IHWRg5z6xjH60IpCsNq2
 9iBITZOqFS7PjvCOFIBQYmVdSUPIV5kATTjUF1qvJg2pjrQoerkt4cxTVcpvuUAEV/1y
 I8+DZgDZiIVaT4vwxjxJGFKijk9/wrQLM3uMPX6newl977vbye1vGnFvcffsfonYy7Ez
 SJVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQaT4k8a/p3fARfU2CrNP2O/uMYcdW3E7XjkK4ukK/k0qzPnvMYHm1x3bTsuQhcDrdX9VsPhnfxMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyWN/vfo0xkZ7iuznHWJZYHsw2VsvfWtm6kBUYfFptOkm1bTn9
 Gqmvg1AklOkJBBUVa5twaPNkfS/kHLD3ikdlpU+raxntVPjX7b7FFMqdMDcoffu5fAAYa9MD3xt
 BqUHydKT9hFhb74Twc6+s+MPVNE+QwetVrvxJBg==
X-Google-Smtp-Source: AGHT+IHuUtkpV/kCfgeCDeFSQtyZmOGgPIEFHPTwcwQPFLoYSq23mMMBRn9u66SKdd6NIBPJ/VPiWoO9n5k9fZu1gIk=
X-Received: by 2002:a17:902:c94c:b0:1fd:9648:2d66 with SMTP id
 d9443c01a7336-20516776254mr21438125ad.17.1724929929590; Thu, 29 Aug 2024
 04:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-9-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-9-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:11:57 +0300
Message-ID: <CAA8EJppAaHtwaDLQVG6f4zTmhpkpuuF0-NK9-iB7UzFcwO3hdw@mail.gmail.com>
Subject: Re: [PATCH 09/21] drm/msm/dpu: request more mixer for 4K+ DSC case
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

On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
>
> request more mixer for the case that hdisplay exceeding 4096
> and DSC enabled.

This doesn't seem to match the code. And it misses the _reason_ to do it.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 05b203be2a9bc..33cfd94badaba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -59,6 +59,7 @@
>  #define IDLE_SHORT_TIMEOUT     1
>
>  #define MAX_HDISPLAY_SPLIT 1080
> +#define MAX_HDISPLAY_DSC_SPLIT 2560
>
>  /* timeout in frames waiting for frame done */
>  #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
> @@ -588,15 +589,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
>
>         /* Datapath topology selection
>          *
> -        * Dual display
> +        * Dual display without DSC
>          * 2 LM, 2 INTF ( Split display using 2 interfaces)
>          *
> +        * Dual display with DSC
> +        * 4 LM, 2 INTF ( Split display using 2 interfaces)

This doesn't match the code

> +        *
>          * Single display
>          * 1 LM, 1 INTF
>          * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>          *
>          * Add dspps to the reservation requirements if ctm is requested
>          */
> +
>         if (intf_count == 2)
>                 topology.num_lm = 2;
>         else if (!dpu_kms->catalog->caps->has_3d_merge)
> @@ -615,10 +620,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
>                  * 2 DSC encoders, 2 layer mixers and 1 interface
>                  * this is power optimal and can drive up to (including) 4k
>                  * screens
> +                * But for dual display with hdisplay exceeding 4096, we need
> +                * 4 layer mixer. Because DSC has a max width of 2048 and
> +                * a single plane can only be used by one mixer pair
>                  */
> -               topology.num_dsc = 2;
> -               topology.num_lm = 2;
> -               topology.num_intf = 1;
> +
> +               if (intf_count == 2 &&
> +                   mode->hdisplay > MAX_HDISPLAY_DSC_SPLIT) {
> +                       topology.num_dsc = 4;
> +                       topology.num_lm = 4;
> +                       topology.num_intf = 2;
> +               } else {
> +                       topology.num_dsc = 2;
> +                       topology.num_lm = 2;
> +                       topology.num_intf = 1;
> +               }
>         }
>
>         return topology;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
