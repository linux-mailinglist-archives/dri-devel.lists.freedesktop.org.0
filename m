Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF329641FA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE410E198;
	Thu, 29 Aug 2024 10:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IgnH2Nzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0A610E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:35:11 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6c0e22218d0so5944427b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724927710; x=1725532510; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kq79Xl7SQIb+Lw9vp0M7UjB/SSF9XrLeMvRoawMdetU=;
 b=IgnH2NzdGWh6NbT9G5cnCPLW9gp80j5ibygXgNml+G0GLxwglihc79vrPDBL2Kg237
 coWYhvF1mDYAHjEOqiYhBFBjzzgW8zcNUX7RMEsyXHQP5gv4MtaYlwW2gNil+n2NsEuW
 HlKWJJNRSq6g0txznlIoCA+8UKqmU/COOezSsMq0LeBqaspiCr71OIn9q0cBdwGUMV5+
 fMIYQJs32N/KOHqnAqn0Ho633yLdSOYE77p5hiXMnKJXaZaxNUMwB9VJMBOqjZQ8wrNO
 8lRL7VmrgAxhtZ9IWOM7yYzXiLBUwf/f3hmhoa3TiSuJ9OEPj9WfnjHZm57jqRwhBu48
 FDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724927710; x=1725532510;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kq79Xl7SQIb+Lw9vp0M7UjB/SSF9XrLeMvRoawMdetU=;
 b=Z8Oj7UUEWcTrQ1ECpxOFnpp7C5gzRYutM5CLJZeJPM8jIH8zTBqB2inO21hDpgkCHA
 y4No5hodNiqy64isgFZ3fpcNPpCuYkDGb7AoKwtnNg92LbTIPxK6LOnNZwn61C0etcQb
 bLvYNYHGMV3f1974rR6AVn1z+fwnDSuVs/aX/GDFtGlURhMNlbwELb3yGgbP09oG5F+a
 7OPhuNQ4tJ3Z1ytEaylgjrCUEuKjHXtMMtAhNJ95tai5bpM0a+sVRC1cws5qTlOdh0xw
 16adgqAJ9WpqLF+3vEL+3mST5U+IlOjgf7BIgU+Q0QWlJetZCNtSJkocYxSH05Ujxc9Y
 qsNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYd+R+YBoEENN3Fysx9KtfeDGkgSMhmsEYpJw76xeCxBeqE+knzJkOy9mOt0sxa/D2sndP4Q2HLMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyItAdlSoXV4VvCvtau2+oiG8Yd3P2TGWEEclc9/YW4UztWPfzs
 A4dLfhz0QF3K8nnLrC80XQ5dgrByfnRy5dHj6zeMnvXLYtBl0vsOadjvh138HukTYMcOHZ40KGV
 z7xcHJQJYt/2+uwdV5m9kdZrszmOM1EGVataYVw==
X-Google-Smtp-Source: AGHT+IHgylNA9acmi7Jpgg+5AiFrARVY6/x1pKrYQGxG1xaaobSbZE7WofyUs6wiOW9YFtPA4UP+FOrs9ipxDKVDuqE=
X-Received: by 2002:a05:690c:fc4:b0:615:2a14:4ea6 with SMTP id
 00721157ae682-6d275e33603mr28071377b3.8.1724927710370; Thu, 29 Aug 2024
 03:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 13:34:58 +0300
Message-ID: <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
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
> Add support to DSI CTRL v2.8.0 with priority support

Proper description is missing

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Several tags are missing here.

Also, how is this patch related to quadpipe?

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf376..6388bb12696ff 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>         return ret;
>  }
>
> +#define DSI_VBIF_CTRL                  (0x01CC - 4)
> +#define DSI_VBIF_CTRL_PRIORITY         0x07
> +
>  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
>                                   u32 len)
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +       u32 reg;
>
>         dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
>         dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> +       if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
> +               reg = dsi_read(msm_host, DSI_VBIF_CTRL);
> +               reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
> +               dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> +       }
>         dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
>
>         /* Make sure trigger happens */
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
