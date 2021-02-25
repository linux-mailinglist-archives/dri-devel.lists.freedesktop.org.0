Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54A324FF0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 13:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157A6E0B8;
	Thu, 25 Feb 2021 12:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC7E6E0B8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 12:46:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id i9so4231550wml.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 04:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ctQ049Qrt9wEqVuupXOSFKQVJpuUemyU7XofTRjq+zE=;
 b=QJzWtazFE2cK3tpA6ycjUChBEA4Amhwi709FTWrdo1+DAiEJvohAaRyFZ46sy0rfIY
 ZhzAlAWwoT6XBBaFe4LlTpfRgDKW9GkI//5nsROxlHpUSl7shutTqZdDJP0hTTSTkmvz
 oyc/K+WYIsivVGmpYKCx2vFDvRjxJwqCI+G7d7EbGdxGhmA9SfT3X1FmIwU36eVf36Is
 JaqI1Fbd2JoP20pRWejlP4OW1hxjv4T/XnXLaOPJdZ5fbmzscbm8NFRZcg522u1kPmwy
 JeJ2eh/IGjwSTVGmgEcEE2bLWHpgQYOi49sfJP6h3pIh8tEFFCB60p3C26U/D7FZcxV2
 J36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ctQ049Qrt9wEqVuupXOSFKQVJpuUemyU7XofTRjq+zE=;
 b=SC2B+yK9/QMTVuF0o0MJpGzpKFKRzWpwhcZpjPPiOxxzZ9xYrL2b+ddunDbC9eYSTt
 1YQzCw6yydbcg6XUPeXLGanIl2VHWEkL/O6hQ8ctrtX8EC2yvbz2dcNKElovXW7byDuA
 J3hOq69DaD9ALVFVX9lNctA3Vk6GEgpmIgf81k9Bly3g3KhbUQrqXtCn2ha70qJShbqG
 ZUtmEJsYRPBp/+67AJTBVxVaWIqGkvn+6XQHVcILIxSW9mNsOtDdf2Xp4VjhBKZZbOcx
 J442ZXSJCbNPLn0pMleYDG2G0bq3n7S4tO5/vf/z9n/l86bRqo5OIctss28isLhmu+y6
 jsZQ==
X-Gm-Message-State: AOAM5330IuQxmSkPPSQjqMB8bqCThNHkpMd0lSiLxLVgCciWezZS1UfC
 FggO/f/+28iCjtrnG4DSS9c0zOOU1Wsmb81p6Y2H1ayXRycs0g==
X-Google-Smtp-Source: ABdhPJyS3y7Yt+vLL3FwWd9OVsFOCvL/NwZCXN8irm4poF/xlmOev3fS/gusBSNEIsD3iDXERJ0p1Ut7wP57qcYbWL8=
X-Received: by 2002:a1c:1982:: with SMTP id 124mr3143741wmz.84.1614257190909; 
 Thu, 25 Feb 2021 04:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <d17ea299-b21e-b298-9098-f47b780be106@rock-chips.com>
In-Reply-To: <d17ea299-b21e-b298-9098-f47b780be106@rock-chips.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 25 Feb 2021 12:46:19 +0000
Message-ID: <CAPj87rMBt9bJhPcyX--xa_wMse9JCttHCfz1PkFXFwHcRheuJg@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Huang Jiachai <hjc@rock-chips.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandy,

On Thu, 25 Feb 2021 at 02:17, Huang Jiachai <hjc@rock-chips.com> wrote:
>      RK3399 and px30 can support YTR afbc format[RGB only], there is an
> hidden control bit to control this.

Great, thanks for providing this information!

> Hi Alyssa,
>
>      Can you add the following patch to test on your platform? thanks.
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 99bdb5a2a185..0780ad46230a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -105,7 +105,7 @@
>   #define AFBC_FMT_U8U8U8U8      0x5
>   #define AFBC_FMT_U8U8U8                0x4
>
> -#define AFBC_TILE_16x16                BIT(4)
> +#define AFBC_FMT_YTR           BIT(4)
>
>   /*
>    * The coefficients of the following matrix are all fixed points.
> @@ -952,7 +952,9 @@ static void vop_plane_atomic_update(struct drm_plane
> *plane,
>          if (rockchip_afbc(fb->modifier)) {
>                  int afbc_format =
> vop_convert_afbc_format(fb->format->format);
>
> -               VOP_AFBC_SET(vop, format, afbc_format | AFBC_TILE_16x16);
> +               if (fb->modifier & AFBC_FORMAT_MOD_YTR)
> +                       afbc_format |= AFBC_FMT_YTR;
> +               VOP_AFBC_SET(vop, format, afbc_format);
>                  VOP_AFBC_SET(vop, hreg_block_split, 0);
>                  VOP_AFBC_SET(vop, win_sel, VOP_WIN_TO_INDEX(vop_win));
>                  VOP_AFBC_SET(vop, hdr_ptr, dma_addr);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> index 4a2099cb582e..48e131b88c23 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -20,6 +20,7 @@
>   #define ROCKCHIP_AFBC_MOD \
>          DRM_FORMAT_MOD_ARM_AFBC( \
>                  AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 | AFBC_FORMAT_MOD_SPARSE \
> +                       | AFBC_FORMAT_MOD_YTR \
>          )

Looks good - this will help us confirm. I think the complete patch
though would advertise both YTR and non-YTR modifiers: per Arm's
recommendation, it sounds like [AX]RGB8888 formats should only
advertise the non-YTR variant, and [AX]BGR8888 should advertise both
variants. Does that make sense?

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
