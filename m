Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1721E4A14
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 18:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B386E34D;
	Wed, 27 May 2020 16:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AE26E34D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 16:27:30 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c12so14822158lfc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XMhd8kBFatjxSzyX/p3050Yxy/ALKXPMLe1zG6XyHx0=;
 b=tg9oAlgp7VoL+EBWwFKZCwxZNy5lyMQoLLYGxu4yU21LOLoOeptabgcOIvROr+RaB1
 6oUeR/F5grzuF0LSLIyDzq8DBWr8p0a8mc6PB+g8LiOBY0d36llnTQ/4gNghXAihICLb
 LF2BCjUirUHryM1vMjxs131Od0fDR0I/cKVFkskphzXRGwpuwsMFL0jCPeLhm1OPybx1
 +R9NO6yWU/Y7sbUoGmk3JcWkxYYhkyH76f25Nuu5Ix0e5o3tcYC8dKaG1fg0UsZonmSG
 HNvIx8E9lCYlPvNpMOn+TEbUNDM2e1ltKGgeo12aEF9cRVxOgr8Yf+Udq+PwMdOfPVox
 IL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XMhd8kBFatjxSzyX/p3050Yxy/ALKXPMLe1zG6XyHx0=;
 b=d7zTGoNrQvqdeOvKsc1gdpuSE2aV/hrRfS4RhKopnYZWETIKalAjg2fTa3/BZTDMW9
 K9onu/49wZ7RyOzhtSSzg/OlYTrVb/6gQZ0ylJI1NLlJmjHaRXHshkK38LUQokgnrW+a
 iJsH+CWCV0LNZsZv/lMF3qswd+sQqCEuTMzY/R4GLosj7uU9lA86QpcdbNGaXxo2QSbb
 jP6KGRHfocdTwv7HCmQsoguaTox8GApNI/adUlHmByeOFSMtj5aAE2WwlBhxZ825x0i+
 WxZFGldUeKEW+0Ff/SnP7t1wDxsfBYhHTHo9p5YSTsVoddpp346vra5rck8OPPQnxi0F
 81oA==
X-Gm-Message-State: AOAM530hGHFunYDHQpZzNxTFNKZ00skdWtrrQkhwRRfHgIDPEIqq4JMz
 er8npPaZq8q/s8U3vXksKwJh6zhKh+ch8Mrzzo7DsQ==
X-Google-Smtp-Source: ABdhPJxFvruh7NtW7OmnRsxfpA4KD4Sao+jVZ0SfkQQXEH279eVxlLFNAkd0wXGZRueXvW68axsCFwH8oNuW2YHoWP0=
X-Received: by 2002:a05:6512:3208:: with SMTP id
 d8mr3516857lfe.38.1590596848480; 
 Wed, 27 May 2020 09:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <49c552751ec619e03371bc4bb1b9ec66c8423bf7.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <49c552751ec619e03371bc4bb1b9ec66c8423bf7.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 09:27:17 -0700
Message-ID: <CADaigPU2YUoffXjaaBOxWRni3thKW9gM0+yr75TRgpeeW3CXaw@mail.gmail.com>
Subject: Re: [PATCH v3 012/105] drm/vc4: drv: Support BCM2711
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 has a reworked display pipeline, and the load tracker needs
> some adjustement to operate properly. Let's add a compatible for BCM2711
> and disable the load tracker until properly supported.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.c   |  1 +-
>  drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
>  drivers/gpu/drm/vc4/vc4_kms.c   | 42 +++++++++++++++++++++++-----------
>  drivers/gpu/drm/vc4/vc4_plane.c |  5 ++++-
>  4 files changed, 38 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 76f93b662766..d7f554a6f0ed 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -364,6 +364,7 @@ static int vc4_platform_drm_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id vc4_of_match[] = {
> +       { .compatible = "brcm,bcm2711-vc5", },
>         { .compatible = "brcm,bcm2835-vc4", },
>         { .compatible = "brcm,cygnus-vc4", },
>         {},

Patch 6 Acked-by: Eric Anholt <eric@anholt.net>
Patch 7-11 Reviewed-by: Eric Anholt <eric@anholt.net>

This one to start probing needs to move later in the series once the
vc5 support is actually present in the driver.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
