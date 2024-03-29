Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00289132A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 06:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C2310ECB1;
	Fri, 29 Mar 2024 05:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YkmkFvBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4956010ECB1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 05:24:20 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso1662039276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 22:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711689799; x=1712294599; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y1cnsQ+TYX5gevtZTdSvBbUB7ZdNL1NVBjO5UpPgLkY=;
 b=YkmkFvBa6Pqof4UOGvMZ61/4SxIwXZh1TXzwFmKonlXsaUriFxU7aazzChsf3NLa7M
 iiLLiUCiSZw/sIAXUyWTPqYELUVgUsu6xts8gsPdaGYr4aIMnCevIrQDyUyHVve3Gc+Z
 PCwpwwlNcN3zPidIhdWgSni2La7TJnN8spp7bmykVsuZydsYE5d4VY0Yc1Af25WPAF3D
 VCrPJG66OCDX8TOgQE4jNzjQqLzDeV7pQFNlin2laKLQ8DOq+usxbDbaoFtvcSTrfOKz
 1Io+rwiXEGBe91vgFZm9UhwFvzyXO1VCQ1ceYAwoUqOjLqvytnYBTSD7yT94tr/NXnYp
 7QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711689799; x=1712294599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1cnsQ+TYX5gevtZTdSvBbUB7ZdNL1NVBjO5UpPgLkY=;
 b=TFE5SzhvqMhOg9RzgGa8yXUvjTYNQErxMJQdT8JZd3d8qF3GJbmdR3z0deDtvqg5Di
 HJxvrmbFHCTsQShYrf+xGiAmuR3zk1dYM8BTn1B68+G1Z8dJqBixjtJgUAcaH7n2CTpW
 cb7fer7J0v9KZv0MvZjs3e2AhMx7WqeSUzU0q3oYyTkUfSCGPKZqT8blVMdPRnbdEGgT
 E2eYy+w38w1s7NAqXEt8vKil7lHO/yTdDckaQFZ7fdWiMGOB33trUeuByAhE6Aw66bKH
 u3dXdZIzAAxV07uyPc8R8eNGsEXgNttDac82IwGm391KduUz8ULiyqdvojUgd04idb+n
 DdaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx3pCILo36gC8V2Ma3axHKsN4tuyP9z2NhbCWXoReHwvphHboVNy46i3aKli7Re+4YNV1Bg1Vuq5R+bC7LBs+dOHgcPVTUs9dzPIFqKRrg
X-Gm-Message-State: AOJu0YwjknpTR8+zhqXyJi6sIUFOEYdOtzNTxX4NPMsNbHJAT51T5oTA
 i4pVjKEZWJzWcG1gXiUbFhyedCsjcjBjkW2vvjRIR2umoqzYIgThF8gQfM2C8Pwy2PbC4dFXpLD
 10ubxDWKhsATyOYoxO3d8sOOyAawSKOPft6s9hw==
X-Google-Smtp-Source: AGHT+IHnJYTaJIdFKWO6mQBmk67+u6vknOcIRVk7XoYypNIe5sbgqFqIgY39n1Yb+IQT5e5iuAOhWt+sHM/xZb5wm1g=
X-Received: by 2002:a25:8110:0:b0:dd0:76e:d630 with SMTP id
 o16-20020a258110000000b00dd0076ed630mr1272196ybk.53.1711689798692; Thu, 28
 Mar 2024 22:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com>
In-Reply-To: <20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 07:23:07 +0200
Message-ID: <CAA8EJpoNBA7L3FMqf+4korbbYfrptHq3Fke86DpfNcbpiBaqzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Remove now unused connector_type from desc
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, 29 Mar 2024 at 06:02, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> Now that the connector_type is dynamically determined, the
> connector_type of the struct msm_dp_desc is unused. Clean it up.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> This cleans up after, and hence depends on,
> https://lore.kernel.org/all/20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org/
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 41 ++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 521cba76d2a0..a18fb8b32c16 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -119,55 +119,54 @@ struct dp_display_private {
>  struct msm_dp_desc {
>         phys_addr_t io_start;
>         unsigned int id;
> -       unsigned int connector_type;
>         bool wide_bus_supported;
>  };
>
>  static const struct msm_dp_desc sc7180_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
>         {}
>  };
>
>  static const struct msm_dp_desc sc7280_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>         {}
>  };
>
>  static const struct msm_dp_desc sc8180x_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> +       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1 },
> +       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2 },
>         {}
>  };
>
>  static const struct msm_dp_desc sc8280xp_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +       { .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +       { .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>         {}
>  };
>
>  static const struct msm_dp_desc sc8280xp_edp_descs[] = {

This can now be merged with sc8280xp_dp_descs

> -       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> +       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>         {}
>  };
>
>  static const struct msm_dp_desc sm8350_dp_descs[] = {

same as sc7180_dp

> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
>         {}
>  };
>
>  static const struct msm_dp_desc sm8650_dp_descs[] = {
> -       { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0 },
>         {}
>  };
>


-- 
With best wishes
Dmitry
