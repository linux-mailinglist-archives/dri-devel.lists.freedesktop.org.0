Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CC382566
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EB26E8E2;
	Mon, 17 May 2021 07:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB646E509
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 12:31:28 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k14so1658598eji.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eckqMwpEIroRZE69KD3Ne9vC93wMSyCChn6bW92xB28=;
 b=qxsJ6UqPYeYNVjSUnnzbteIwHv+wmPzMifNJiXeYO5OI4nFMUE3n3jdR86k2kjPrnz
 fg+MZSaqB9EuxgLvF8mQJq9r1Mn0Vmc9P6rkI6HROgolgJY4h6+Q9BY2fT7jIY5F89Fz
 ZkEadOMmMaD57ecKFGfm6u9WItYiAswVeAmvJxrFZ8S4VxcwdwG8x6nZsz+Ct6oFChUC
 QkCvuY0fEXZQPzPZlSQypIRkkn8UE1b1YAZFnMPiSMY+UxbfiG2w71aM/OIORe6Nqwvj
 OFIqOTVhOTnzE96rSeggi3uMZWTov/SrGJ6cYZVdAur8zieb2EhM1YCNAzzVtjZqLgRO
 a96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eckqMwpEIroRZE69KD3Ne9vC93wMSyCChn6bW92xB28=;
 b=gl0h7txRiP+zyq1+1YEruA93spSVbDBX5AVPTX0HMiTUuP1F79HRzPMmH5xhvqcKvo
 ryDnIP4QvdXm5GefIP01ubzsCsj+Lp0cGbltaYrywZ/T31VFd6bUhUgdgoTCbdoGF9HD
 x+mXqmDAl9HxiOkJKRmgRmDhZxxCf19QcQgifWxh6zFOOO4qJbv/sUTDQ3P0T33OFkv5
 ESmPgGIV9F2awDK54H9QcoC4hMjtJcS9AbkLg6FIueEa8T+xLl1+3+Hc5ia2kjt+WLcK
 +jzQOeixxcnf/rzXzuWkIo1ATSCoM2wzhEIXBkwigFLQ9Pim6LTLMVlkHaDBokaQan/p
 BZCg==
X-Gm-Message-State: AOAM532XVP0Z5iRNDKjW8BFJyLFB4/FQSomQ0TDNmAigzrz4M//aJzKK
 xowsDjvaTutCt/EspryULthx0D9r6Qa5RX7EpkQ=
X-Google-Smtp-Source: ABdhPJyMocjUwulbuwuJTGv1j+LscDh6BLMiewFmxo7PPWGXTM8vvLThYsVj/9y2uCWKAF38AloslnRqGm2OQkvDs64=
X-Received: by 2002:a17:907:f91:: with SMTP id
 kb17mr56164390ejc.521.1621168287278; 
 Sun, 16 May 2021 05:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210516074833.451643-1-javierm@redhat.com>
In-Reply-To: <20210516074833.451643-1-javierm@redhat.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 16 May 2021 13:31:16 +0100
Message-ID: <CALeDE9NsdNDf+S9kYqsJGftjj+mS8sZPexMJUvtNqbc7CTjrqA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/rockchip: remove existing generic drivers to take
 over the device
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 17 May 2021 07:32:15 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 16, 2021 at 8:48 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> There are drivers that register framebuffer devices very early in the boot
> process and make use of the existing framebuffer as setup by the firmware.
>
> If one of those drivers has registered a fbdev, then the fallback fbdev of
> the DRM driver won't be bound to the framebuffer console. To avoid that,
> remove any existing generic driver and take over the graphics device.
>
> By doing that, the fb mapped to the console is switched correctly from the
> early fbdev to the one registered by the rockchip DRM driver:
>
>     [   40.752420] fb0: switching to rockchip-drm-fb from EFI VGA
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>

Tested on Pinebook Pro (eDP), Rock960 (HDMI) and Firefly3399.

> ---
>
> Changes in v2:
> - Move drm_aperture_remove_framebuffers() call to .bind callback (tzimmermann).
> - Adapt subject line, commit message, etc accordingly.
>
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 212bd87c0c4..b730b8d5d94 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -16,6 +16,7 @@
>  #include <linux/console.h>
>  #include <linux/iommu.h>
>
> +#include <drm/drm_aperture.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> @@ -114,6 +115,15 @@ static int rockchip_drm_bind(struct device *dev)
>         struct rockchip_drm_private *private;
>         int ret;
>
> +       /* Remove existing drivers that may own the framebuffer memory. */
> +       ret = drm_aperture_remove_framebuffers(false, "rockchip-drm-fb");
> +       if (ret) {
> +               DRM_DEV_ERROR(dev,
> +                             "Failed to remove existing framebuffers - %d.\n",
> +                             ret);
> +               return ret;
> +       }
> +
>         drm_dev = drm_dev_alloc(&rockchip_drm_driver, dev);
>         if (IS_ERR(drm_dev))
>                 return PTR_ERR(drm_dev);
> --
> 2.31.1
>
