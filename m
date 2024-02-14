Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C812E8541EF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 05:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A58D10E2A0;
	Wed, 14 Feb 2024 04:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kPzQTNxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9353B10E1D5;
 Wed, 14 Feb 2024 04:07:08 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51182f8590bso4277911e87.0; 
 Tue, 13 Feb 2024 20:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707883626; x=1708488426; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZXfQB71HxIQgrSQJJpuPCI9XbT5yqli7HqbSUk3/QI=;
 b=kPzQTNxgyv3romgNap9SAdqrEYnN5H2vLAINgIpQAIbXnlx1L0iFYEfmemvvrzFDxY
 WmGiVfi1FU9VAHnNTERGwYIAJ7N8vXK+kb8sH9ZVo3p3iQel7y5pszWcZhV/8d5MKKX0
 vyfghIxcrhjnoh5dZgCLX0a9ZXoazMXHfDH+nGapVGZl/8ju3ThEP3HQnQ7grdBetWCX
 hmMB2IRJxGfcqV7iXhxi92IkihRc/dn5jk+wM0R1EtCQX60w3KSJRytwX7m7S8ip4Hc8
 vjGIUEV+eOrnFMYCWQCX6gKz+GUFzGEC4HtzsfPFm/RE81uwdKD3K1l7fQofGd9vMf9x
 h9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707883626; x=1708488426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ZXfQB71HxIQgrSQJJpuPCI9XbT5yqli7HqbSUk3/QI=;
 b=f8j5yU2wHcWwYiX5vR3uUMhTDeM9zBUZ9OZlyKy6WaCaKHjYFWFEAYxxPQLvpI6Vgt
 GnwTbK8EA6hqZ+wHuCEYDM6KneVJqzAMJY6fybMe/VVF3l0VV+7Hcr0r6XudaKI2Rtg1
 b4ccqGTXYg4bXvfkbko/+E0pUXJCLoqZdScMkoDSJyBAvmTWYNUomRPwlLj1Mc1Hba1a
 abyP61neI50Y+C7abcK8als+3xJb6e/XBiKJNqfspPLv9yq9Cf4SI6DKTgcTp4YiKlz6
 GawfZC1DRRj3zhX9JFjL6hn6Ib0mzuIEpkWSRsEqVvloXQmmAp6YLLKErnoD8rn1BT0u
 GU8g==
X-Gm-Message-State: AOJu0YyiVDusBiLncvXefvc/2jDuFKFXIouhpR1QMegDVHhz6hdt07/4
 IdM09ZZeZ6eFSuoG+yyIt9ABzxvtYUByKD1/8dPDi/fkIjYc5SrzHgzE+Lr17m7Zmpxi1s1k6K6
 T8HfjniI81qMM9dwOL3e+vgM946NoQhm809M=
X-Google-Smtp-Source: AGHT+IEAX4klNHOsJYaO2Oq6GaGzz2vwdvad30ffEYRYeg4r9Kim7/Ou7kbT1c3N/057cbxwTWiHkHa/RDHYFw7yrjg=
X-Received: by 2002:a05:6512:3a8b:b0:511:6764:a8c7 with SMTP id
 q11-20020a0565123a8b00b005116764a8c7mr1283527lfu.10.1707883625892; Tue, 13
 Feb 2024 20:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20240214034036.660921-1-airlied@gmail.com>
In-Reply-To: <20240214034036.660921-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 14 Feb 2024 14:06:53 +1000
Message-ID: <CAPM=9txd9gqY7SZ_F6X-0Hk4kaXYRwQWrA+L4_j4kLw4fODkfA@mail.gmail.com>
Subject: Re: [PATCH] nouveau/gsp: add kconfig option to enable GSP paths by
 default
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
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

(ignore this one, sent another just after)

On Wed, 14 Feb 2024 at 13:40, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> Turing and Ampere will continue to use the old paths by default,
> but we should allow distros to decide what the policy is.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/Kconfig                | 8 ++++++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 3 +++
>  2 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 1e6aaf95ff7c..ceef470c9fbf 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -100,3 +100,11 @@ config DRM_NOUVEAU_SVM
>         help
>           Say Y here if you want to enable experimental support for
>           Shared Virtual Memory (SVM).
> +
> +config DRM_NOUVEAU_GSP_DEFAULT
> +       bool "Use GSP firmware for Turing/Ampere (needs firmware installed)"
> +       depends on DRM_NOUVEAU
> +       default n
> +       help
> +         Say Y here if you want to use the GSP codepaths by default on
> +         Turing and Ampere GPUs.
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index a41735ab6068..fadbb89ffff2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -2313,6 +2313,9 @@ r535_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
>         struct nvkm_subdev *subdev = &gsp->subdev;
>         int ret;
>
> +#if IS_ENABLED(CONFIG_DRM_NOUVEAU_GSP_DEFAULT)
> +       fwif->enable = true;
> +#endif
>         if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", fwif->enable))
>                 return -EINVAL;
>
> --
> 2.43.0
>
