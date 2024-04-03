Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975AB896B33
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDAC112622;
	Wed,  3 Apr 2024 09:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="meQtWRVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E30F112600
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:57:56 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso5728343276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712138275; x=1712743075; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8a49vn1g2GfhymP3UDOjKfMABn27AFlfMB3+8PtG0hY=;
 b=meQtWRVgB0sr7/pKIv6j7BJHb+l78o1A+vvbAVUOUOxW9wRwVLDyxZAmFNfiRtKLMm
 XidtZ14CAWtdWN4YCHPbOdbx3Dv262hpNC7T9oH5k7sdfmYmaIk+lUT8QescO26WoGb4
 xjKob6J2yby/2yM7HUUJ3qhWigE9SIu0L9XzUilLn1U4wJSvAJKOwHcbXn2TYceZltSl
 XBSbkkbcgye9qzB1ZVNp99h2V+jTuwM6ExOpJId2KX7phR5OFjB6IYWsCgm3oAxLbloK
 ixfq9fqutn8D4zSRojKctF0xgoHzshFhG2v1HcsMowX80/J3YUepeq20XuHxMWE056on
 Sfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712138275; x=1712743075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8a49vn1g2GfhymP3UDOjKfMABn27AFlfMB3+8PtG0hY=;
 b=pxd6vB9YDbyEr9B/CZVZvdEB2/tq1UjqRiSube4C5SwcOKAET+tWBhveARAdxASvld
 LtKl62OOST11VW6fGugSqBZTCHeN7JUP+nq2ShtRtkTNUPXxUvjQrmB/yR+ovEPPHJgy
 stJjX0ELFMiTti+KGYOFzN6TpSr3ot6qDYSCbl52q8xxG8MsRi7J4EpJjyQ9NdVJeiZS
 aCSWbeLDO6clgA6trQGSguuy2hnOJfNCOXSTN5rsyZW75KAXsNzTugkqeE/QBha+thBa
 ywxKlSg1C1pfpyr2a/b0v06mwAdBnwF65FcHVcfW6C7j6yCciTqQgU1buwFeuLASGQFj
 jiPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXggE3tBoalaGTtE/Acdi8DqMKzFDuGp5zbnNqXfW/mLqCXW+esR45TcaFQuMizvS2P70eRhQqDVgtJw7jr3tlO4mZy/JSGm7esjWzL7jl/
X-Gm-Message-State: AOJu0YyXeq0MROw9KPQVRZA6D8E0vfEVoAYKh6bSYGj/c9APLQB4Iewr
 MsegLgQeSo9UNXuqtVnxK72edxvHGptRFGFIJ0SkmPfB1poT8b7zR4+nTEvtzUN8XrPzXFRY3UA
 BLFnw5Qbe/FcIVr0RW4CdEb0EIvtUf6x/YQBAWw==
X-Google-Smtp-Source: AGHT+IG8nlvk6XbQkC/Ui1tRnBB3XNXB6LgbVsTQjpZEjnESvNEsU3CRk8wWXBQbvmEg7ARzBiH2C1TQfqjjaNgmJqs=
X-Received: by 2002:a5b:f07:0:b0:dc7:4c92:16a3 with SMTP id
 x7-20020a5b0f07000000b00dc74c9216a3mr11791901ybr.27.1712138275452; Wed, 03
 Apr 2024 02:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 12:57:44 +0300
Message-ID: <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> Add necessary DPU timing and control changes for DSC to work with DSI
> video mode.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d9e7dbf0499c..c7b009a60b63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
>                 timing->h_front_porch = timing->h_front_porch >> 1;
>                 timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>         }
> +
> +       /*
> +        * for DSI, if compression is enabled, then divide the horizonal active
> +        * timing parameters by compression ratio.
> +        */
> +       if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> +               timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
> +               timing->xres = timing->width;
> +       }
>  }
>
>  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 965692ef7892..079efb48db05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>                 intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>
>         data_width = p->width;
> +       if (p->wide_bus_en && !dp_intf)
> +               data_width = p->width >> 1;

How is wide_bus relevant to the DSC case?
Is there a need for the Fixes tag?

> +
> +       if (p->compression_en)
> +               intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +
> +       if (p->compression_en && dp_intf)
> +               DPU_ERROR("missing adjustments for DSC+DP\n");
>
>         hsync_data_start_x = hsync_start_x;
>         hsync_data_end_x =  hsync_start_x + data_width - 1;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
