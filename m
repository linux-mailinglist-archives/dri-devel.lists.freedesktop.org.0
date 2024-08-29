Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758F96428C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1C310E1AE;
	Thu, 29 Aug 2024 11:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X0mbg6jV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA53510E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:04:47 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6b99988b6ceso6351027b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929487; x=1725534287; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+w6aWurefHFOT/q/zcqS9miwYxvHRLqdgWPtHwfRoIA=;
 b=X0mbg6jVf5ImasMrdOmOQdIz9jw2oLoyBpra68T6Qn8ZMIZMXBG2QzQamn0NfWjwxS
 V1kX6zOB79P7S25bkKvjKzan/eZPLtJz04jRqrczAkaYWbyYoQKb76JcwFEfL5pdgVxV
 uU+/4zxrKOP+0+vqjfE5f2Wx0Oj/sJzj4+88I/glo8X+3AQFciKLdazor0hBT9IBX4ZO
 wCFbUVKAke1XJa4HuVz1Jc2zs6KlDIqUHnS/ArhggBXUKg8frjFLy5hve8DEoyDQkM89
 qoDXXR67/opF2n8z3gVv5WkAeJdWTVLcNJY4/D85Rv06y+T+AeeGzZJ56ny9Lygv/zuZ
 U5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929487; x=1725534287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+w6aWurefHFOT/q/zcqS9miwYxvHRLqdgWPtHwfRoIA=;
 b=CyGiFSb0QTeUtr/RFhr26TQ/hAGbBIZmrXH9FMyeCXUyw54IbA64XSHqe169WcibqX
 0D0puGizQk3+83IzAC5BmpYRT+qejv/aZdpJJbN6dubWeQUMfkevZJJJpY4GrxhN11mx
 p2ZdjULPDpOMuSat08jueHikBxDpvynFHErbrBK3qwNKwQnbT/Iuu0ed3nLv2DdPfziw
 UBelIFLg5lwjQ2KmdPaaiC48Z8vJ8ZwK+pjhW3Gx9ugOQ2WrM1lePv++Yf/RUCCh0Oa7
 ZSaN+8OW5FMia2skhqdnpcOdJLNqJNCOgpR0n0KfVrGRG463dMoaBz13ZdIM8BxteOhW
 pbzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0HNsSPbQeHpkdBjK9GKOhlGjAeGq+OAJ5EDQwTqNNU+Ht4/4PQgqfewd51ZGGC8eLGH0IyF7ZME8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF3yZppSX0BRztLpVthL6/EltKKNbBuZrDNLrA//nhGlegKRuu
 1NBWU848c5hdZGBwf2aRhbIwf2MDr8yWsI5RPGzycWgTb2ePiXkoySG+t1wN4MtlrWZoVBMoYBL
 Y+1DwrlwK33ByeB3l6zkDgRxB7Lsr8UdnSyoRjQ==
X-Google-Smtp-Source: AGHT+IHgFWrfqg6VxD076bV1Ahvq7Va1k0veH8KaE24wYRXR1wihBNHx2f8OBxAR3Yx4Q/qCQP65lTON7r6fXvuKmkg=
X-Received: by 2002:a05:690c:6e10:b0:6b4:b45:2f1 with SMTP id
 00721157ae682-6d277a7a8b4mr30321547b3.34.1724929486478; Thu, 29 Aug 2024
 04:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-4-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-4-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:04:34 +0300
Message-ID: <CAA8EJprKnd269S_KMVUDk7UfT-c4ighPq4VkX-nEkwGg8ys1cQ@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
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
> From: Jonathan Marek <jonathan@marek.ca>
>
> MSM display controller support multiple slice to be sent in a single DSC
> packet.

This is not MSM-specific. It is allowed per the standard.

> Add a dsc_slice_per_pkt field to mipi_dsi_device struct and
> support this field in msm mdss driver.

This doesn't describe why this is necessary at all. Is it a fix or a feature?

>
> Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
> comment is incorrect.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  include/drm/drm_mipi_dsi.h         |  2 ++
>  2 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 5abade8f26b88..36f0470cdf588 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -157,6 +157,7 @@ struct msm_dsi_host {
>
>         struct drm_display_mode *mode;
>         struct drm_dsc_config *dsc;
> +       unsigned int dsc_slice_per_pkt;
>
>         /* connected device info */
>         unsigned int channel;
> @@ -861,17 +862,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>
>         total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -       bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> +       bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
>
>         eol_byte_num = total_bytes_per_intf % 3;
> -
> -       /*
> -        * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -        *
> -        * Since the current driver only supports slice_per_pkt = 1,
> -        * pkt_per_line will be equal to slice per intf for now.
> -        */
> -       pkt_per_line = slice_per_intf;
> +       pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
>
>         if (is_cmd_mode) /* packet data type */
>                 reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -1019,12 +1013,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 else
>                         /*
>                          * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -                        * Currently, the driver only supports default value of slice_per_pkt = 1
> -                        *
> -                        * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -                        *       and adjust DSC math to account for slice_per_pkt.
>                          */
> -                       wc = msm_host->dsc->slice_chunk_size + 1;
> +                       wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
>
>                 dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>                         DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1629,8 +1619,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>         msm_host->lanes = dsi->lanes;
>         msm_host->format = dsi->format;
>         msm_host->mode_flags = dsi->mode_flags;
> -       if (dsi->dsc)
> +       if (dsi->dsc) {
>                 msm_host->dsc = dsi->dsc;
> +               msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
> +               /* for backwards compatibility, assume 1 if not set */
> +               if (!msm_host->dsc_slice_per_pkt)
> +                       msm_host->dsc_slice_per_pkt = 1;
> +       }
>
>         ret = dsi_dev_attach(msm_host->pdev);
>         if (ret)
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 0f520eeeaa8e3..1c1b56077d44a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -182,6 +182,7 @@ struct mipi_dsi_device_info {
>   * be set to the real limits of the hardware, zero is only accepted for
>   * legacy drivers
>   * @dsc: panel/bridge DSC pps payload to be sent
> + * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet
>   */
>  struct mipi_dsi_device {
>         struct mipi_dsi_host *host;
> @@ -196,6 +197,7 @@ struct mipi_dsi_device {
>         unsigned long hs_rate;
>         unsigned long lp_rate;
>         struct drm_dsc_config *dsc;
> +       unsigned int dsc_slice_per_pkt;
>  };
>
>  /**
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
