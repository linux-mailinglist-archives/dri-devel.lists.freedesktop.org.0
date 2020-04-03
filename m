Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145E19D089
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1D6EB01;
	Fri,  3 Apr 2020 06:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36F6EAE7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 02:00:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so4534660wrt.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 19:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXBmPI1aMBP86rFq67gcQrBQ0rMBGLe0pgjXqjE6OXg=;
 b=we5VT1tIaUauueTImm6VHNLLfFfkERkS+qqB5I25fA1/vaM4+IgSg5UQaU5G1vGJBQ
 ZlsjJbcJ47yqWyqfDwAh16Ut3J/+m1JDN1spRFmk2bdi8/58Y7GcgseoMV81RiQ5zN1P
 ncJVoY5weEO3ypUFN8zZY3/NmO2qfEOctfRxSWTBPntCQG17sDsHfCvEDcreLYUVK0EN
 osYpYl+eIIbJ1zoUiSDtEsc5b9F9MzsNMetN+j0HtSrpgmPSgsCtAvvwovDWgrt0xf0r
 u3ylqWoVNVVNEIsAFAB13uHetGhVjlKZ3Aox3ZZX4ZQiPPPAv8FajG1SfTHVYegjbwQT
 5OeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXBmPI1aMBP86rFq67gcQrBQ0rMBGLe0pgjXqjE6OXg=;
 b=gdP93SIZCZEcrhjWYwgeDomIbz4hcY3WGADtrMJnAKHDdMGpuAlsNYj3e3A/lRkX1j
 sc2UgsV/wFkDJZe4565sqK29P9aZePfLqSYejMtfO5sCPZxkz03Nm+CcQgsb9SaaZQT0
 r/sCPEgeLh8I3aYUec88wW6amu21jU3/qTFvV4xxOCdIzCZVjkVlr8yAdpGADD1UEqHc
 1Db9dldFnEOD42gYFj5lFms5LXCe85lbsESV5Xp1IYeXNvjATf/n8kiIk84sXT4BLjjN
 eebCF4MMlj7Z2XSxreYxnGwmEufNzi9AyGH/Af82L9acu6GYsROcCFt7iUonMM9Ai8GR
 yAYw==
X-Gm-Message-State: AGi0PuYC55LwjpxJ2mhHn3DedSLMu9vz71Eeo3P9klbnvt7JDHNtPiDP
 jtcgYq58+D+Tu0Uttm48e7M8d8Aijz9O0l3tVJ9qMw==
X-Google-Smtp-Source: APiQypJpeSSwOq64/N7vOjBoWjJ/56BFT+hlHKLS0f3nog579CzDJTnDcAtebBwG/3cPxDxAd++E7WmJ/MKvp8wSlgA=
X-Received: by 2002:adf:a4c9:: with SMTP id h9mr49479wrb.426.1585879229770;
 Thu, 02 Apr 2020 19:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
 <1583466184-7060-4-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1583466184-7060-4-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Fri, 3 Apr 2020 10:00:18 +0800
Message-ID: <CAKoKPbxF05D4vhKNkCsVCRHsfEAVmdFf8akVzSAHNEfXnwpFwA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/hisilicon: Enforce 128-byte stride alignment to
 fix the hardware limitation
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linuxarm@huawei.com,
 kraxel@redhat.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tao,

On Fri, 6 Mar 2020 at 11:44, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> because the hardware limitation,The initial color depth must set to 32bpp
> and must set the FB Offset of the display hardware to 128Byte alignment,
> which is used to solve the display problem at 800x600 and 1440x900
> resolution under 16bpp.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>

Thanks for the patch.
Acked-by: Xinliang Liu <xinliang.liu@linaro.org>
Applied to drm-misc.

-Xinliang

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c  | 9 +++++----
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c     | 2 +-
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 55b46a7..cc70e83 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -94,6 +94,10 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
>                 return -EINVAL;
>         }
>
> +       if (state->fb->pitches[0] % 128 != 0) {
> +               DRM_DEBUG_ATOMIC("wrong stride with 128-byte aligned\n");
> +               return -EINVAL;
> +       }
>         return 0;
>  }
>
> @@ -119,11 +123,8 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
>         writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
>
>         reg = state->fb->width * (state->fb->format->cpp[0]);
> -       /* now line_pad is 16 */
> -       reg = PADDING(16, reg);
>
> -       line_l = state->fb->width * state->fb->format->cpp[0];
> -       line_l = PADDING(16, line_l);
> +       line_l = state->fb->pitches[0];
>         writel(HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_WIDTH, reg) |
>                HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_OFFS, line_l),
>                priv->mmio + HIBMC_CRT_FB_WIDTH);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 222356a..79a180a 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -94,7 +94,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>         priv->dev->mode_config.max_height = 1200;
>
>         priv->dev->mode_config.fb_base = priv->fb_base;
> -       priv->dev->mode_config.preferred_depth = 24;
> +       priv->dev->mode_config.preferred_depth = 32;
>         priv->dev->mode_config.prefer_shadow = 1;
>
>         priv->dev->mode_config.funcs = (void *)&hibmc_mode_funcs;
> @@ -307,7 +307,7 @@ static int hibmc_load(struct drm_device *dev)
>         /* reset all the states of crtc/plane/encoder/connector */
>         drm_mode_config_reset(dev);
>
> -       ret = drm_fbdev_generic_setup(dev, 16);
> +       ret = drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
>         if (ret) {
>                 DRM_ERROR("failed to initialize fbdev: %d\n", ret);
>                 goto err;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> index 99397ac..322bd54 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -50,7 +50,7 @@ void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
>  int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>                       struct drm_mode_create_dumb *args)
>  {
> -       return drm_gem_vram_fill_create_dumb(file, dev, 0, 16, args);
> +       return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
>  }
>
>  const struct drm_mode_config_funcs hibmc_mode_funcs = {
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
