Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C37A0091F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 13:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3FE10E29C;
	Fri,  3 Jan 2025 12:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d75p0qSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D8510E29C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 12:16:06 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30219437e63so140972961fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 04:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735906505; x=1736511305; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/m618hW0R2m1nQFr2zn8iDxB4stTlPC9L/MKkQZd3FA=;
 b=d75p0qSdn5GpulnRhEYh41FhxcQoHytUWhDOtyDEAzJab0PEWJ0yvdANv127zMdOHc
 Et8sjQc6S27EFRiAslziKlV5MqTN+c7J/LxX0A5cjqnrWFWSlTBZU1UcIIhmIkoe+eeR
 JwqwNZu8QH2SauhU+NxWX5vcg6m1D82VFYMVJGHApTxa4TrGVV2x+xS2NxXHphxkyhfv
 qsWR2dWEdCry8OSWmu2VPcE7qW+gRslJpoVXHDlcQeb0gqdnxSrNgYPAmZSlDWB8JpFg
 0jL8CJlCLaWZUNwBiTdWJy1fhUdofCp1RGI4ZjZpUOZTN6QnMZzFoeCQyr1DgvkiylGN
 7NQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735906505; x=1736511305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/m618hW0R2m1nQFr2zn8iDxB4stTlPC9L/MKkQZd3FA=;
 b=kyzHaC46ptzf093ZhFoAZ9ebUlWDdfgdF/8ZYpOi4SD6ILp0xioKGfbmK8DuU7WEjy
 cfPoIPnZJj91k0Cgu4AzO4NOtPGAAoItFMl4CwwGE/x4jXKpJayuadMoXZYgtqZnUyT1
 GGts29lRzjna5zQvQ5nO1rU78WRPlmPJYbWjaFvzCQ62jzWNqPYkJfgluErjPOrsJyTB
 qSWUgosnba8rY5rHEFsexG0aFnxVwsoK98UAQK0fJ0PV6hRwYu//lILF00zj+PldU8+J
 fGsWSujTaniSjyCm2LYkyqIv4QZ3Kn/athu3+PNAejZqPwGemfu5UvQcUGznCVl/e4mK
 +DYw==
X-Gm-Message-State: AOJu0YxlYpH9Sm5gikSBxHF5IfMuEbXp1hE4xYhKxB7Q89ykcWoEQ7Mv
 HongZuKx+ctJK2+n0f7O1+/qFRfb1MNKY5/DeMx/RyFfwpPZGFfQtx7kGshZFsCsKkhjRkQ9dOW
 9
X-Gm-Gg: ASbGnctWYaSHk3mYKZ2K0/gpi6vCSSJcQsLHZeQqNgXyTm1j1ZhyVc6pitTtRxLWjEH
 9//2tcnhOXjV7CABc8CWflLQOH+k0Vd3FW18CqlWa9KIjwxWmiwqXZajJBFwOFmJfo/4UcXM8Wu
 atdFukfeMaVrQk5Z4m+AoZ8Hw5Z6v+eqkwp9sHOCgSxHqkP2c+Xil1OzHx4ELZmlOxiVUqT6xwg
 FhMF1R07YipH0RUnaq2ys7T8g4/HuWlWOeYQfj5Kz3Mj72muYOYgHbFuOlHcrhv88LYPbVhi2FQ
 cTSv3J9aDZ2yHRMPZJdV2KXzUF3Bm1MrEuns
X-Google-Smtp-Source: AGHT+IHqyYKM0jK9B76DdsBNsu1ksVUKqjrNzWi2li/1a+VHxpUAgfWN/haMqHCMVuXOoMkqVNCF/Q==
X-Received: by 2002:a2e:bc1b:0:b0:302:215f:94ee with SMTP id
 38308e7fff4ca-30458337550mr161864691fa.4.1735900686412; 
 Fri, 03 Jan 2025 02:38:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b096cafsm45400051fa.123.2025.01.03.02.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 02:38:05 -0800 (PST)
Date: Fri, 3 Jan 2025 12:38:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: uprev IGT
Message-ID: <gxrc6hqlmjl2pdylvi33wdukxgz6wqbhzgwk4ptyx3i55jshic@uu45kcjailxa>
References: <20241217160655.2371138-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217160655.2371138-1-vignesh.raman@collabora.com>
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

On Tue, Dec 17, 2024 at 09:36:52PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> v2:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
>     Updated flake test bug report links.
> 
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   8 +-
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  21 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   5 +
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  20 +-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  14 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  22 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 +
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  31 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   7 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 298 ++++++++++
>  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  18 +-
>  drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  15 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  | 112 ++++
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  55 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |  13 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  15 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   7 +
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   7 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   7 +
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   5 +
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  12 +-
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   5 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   3 +
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 -
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  14 +
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   5 +
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 -
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   5 +
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   2 -
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   5 +
>  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   5 -
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  26 +-
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  13 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  56 ++
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   5 +
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   5 +
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   8 -
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 543 +++++++++++++++++-
>  42 files changed, 1202 insertions(+), 211 deletions(-)
> 


> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 066d24ee3e08..7752adff05c1 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,4 +1,7 @@
>  kms_3d,Fail
> +kms_cursor_legacy@forked-bo,Fail
> +kms_cursor_legacy@forked-move,Fail
> +kms_cursor_legacy@single-bo,Fail
>  kms_cursor_legacy@torture-bo,Fail
>  kms_force_connector_basic@force-edid,Fail
>  kms_hdmi_inject@inject-4k,Fail

Interesting. Though this might by the platform legacy cursor code (it
doesn't use a plane for cursors).

Anyway,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

-- 
With best wishes
Dmitry
