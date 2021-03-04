Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A6032CA3B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 02:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C058986D;
	Thu,  4 Mar 2021 01:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F3F897BC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 01:57:10 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id t15so8705053ual.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 17:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RTyJWxcY8WRLJ1Ln9cuHqqXoawGdMI14Gx6jtMbYPFs=;
 b=b850cLiIac4asP8vQKEYMklB1fazLEPb/WPkJrANxsIJOsT9Q4jPs8v8nQuXEzC70k
 Hej+glS7mXIPMzQ8XbxhNQSMlVNur2x7VHN/U/VcFbrZVk9qjSu5p76Ir0cZ/DFR7wpA
 aSwxrEuTzDqPDc9M2PLV2omvR3PTlIf3dOugI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTyJWxcY8WRLJ1Ln9cuHqqXoawGdMI14Gx6jtMbYPFs=;
 b=iJSS2GyoU7EuXLS4lVlpAEk5PT9PCGMM+cL/o9Bjb0JJw82sJ7E7+Po3Jw8QQiDZty
 a4MlHokO9H7+H43GXQ9b3rLNVij25fTgGq47dl3kBTE1bvQ4z45Kb5jqox6coIlSOQgR
 uPzWWJbdgodCS+oMEPtIEU9ZV/OT05nCw4gCf/PXPtpunEK5Vs3Oamf9p0HgYteZfcAa
 xIShTe287daQGO1m0u5Y5bmefNhGzBdYULq65+XE/WS8f19Ms0tLRcPgxlk+YE88N4r0
 sF5FlyVCPvRxuMBMk2tkqZmCODNAht3PAGtDgg6LY6SxMSFFW4G8VmzxDXzVCU8L6jxw
 u71w==
X-Gm-Message-State: AOAM530fpMWQ8HW8eQ4jGx24ku+rC05hNYqEYWHjlW4T2738SULwFAPP
 OntZ1gUcchXCsz8nZQKAcrkcqSs0pOW/eXSnebsXbQ==
X-Google-Smtp-Source: ABdhPJwlJRjmv3RQeZAgU0PeQbL4dnuHGK3yJ5/DjcSHzvBPgKvd2v0V4RjaK0J7vl6vai/8YZiNLV3Xr460C4mIpsQ=
X-Received: by 2002:a9f:206a:: with SMTP id 97mr1191374uam.82.1614823029395;
 Wed, 03 Mar 2021 17:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20210304004138.1785057-1-linus.walleij@linaro.org>
In-Reply-To: <20210304004138.1785057-1-linus.walleij@linaro.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 4 Mar 2021 09:56:58 +0800
Message-ID: <CANMq1KAiYK+0Y+j82R2Smt6Hhc3jwZ==DD2Vu4xRKcr8cOm3Fw@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde/panel: Inverse misunderstood flag
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 4, 2021 at 8:41 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> A recent patch renaming MIPI_DSI_MODE_EOT_PACKET to
> MIPI_DSI_MODE_NO_EOT_PACKET brought to light the
> misunderstanding in the current MCDE driver and all
> its associated panel drivers that MIPI_DSI_MODE_EOT_PACKET
> would mean "use EOT packet" when in fact it means the
> reverse.
>
> Fix it up by implementing the flag right in the MCDE
> DSI driver and remove the flag from panels that actually
> want the EOT packet.
>
> Suggested-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

I wonder if it's worth adding the fixes, should be:

Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
Fixes: 899f24ed8d3a ("drm/panel: Add driver for Novatek NT35510-based panels")
Fixes: ac1d6d74884e ("drm/panel: Add driver for Samsung S6D16D0 panel")
Fixes: 435e06c06cb2 ("drm/panel: s6e63m0: Add DSI transport")
Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")

But then you'd almost need to separate the patches in multiple bits
(these patches landed in very different releases).

I'll leave that up to the maintainers to decide: this would only
matter if anybody tried to use these panels on LTS releases with a
non-MCDE driver (or MCDE with other panels).

> ---
>  drivers/gpu/drm/mcde/mcde_dsi.c                   | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c     | 3 +--
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c     | 4 +---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 1 -
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c      | 3 +--
>  5 files changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 2314c8122992..b3fd3501c412 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
>                 DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_READ_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> -       if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +       if (!(d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
>                 val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>         writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
>
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index b9a0e56f33e2..ef70140c5b09 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -898,8 +898,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>          */
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
> -       dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +       dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
>
>         /*
>          * Every new incarnation of this display must have a unique
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 4aac0d1573dd..70560cac53a9 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -184,9 +184,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>          * As we only send commands we do not need to be continuously
>          * clocked.
>          */
> -       dsi->mode_flags =
> -               MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +       dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
>
>         s6->supply = devm_regulator_get(dev, "vdd1");
>         if (IS_ERR(s6->supply))
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> index eec74c10ddda..9c3563c61e8c 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> @@ -97,7 +97,6 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> -               MIPI_DSI_MODE_EOT_PACKET |
>                 MIPI_DSI_MODE_VIDEO_BURST;
>
>         ret = s6e63m0_probe(dev, s6e63m0_dsi_dcs_read, s6e63m0_dsi_dcs_write,
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index 065efae213f5..95659a4d15e9 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -449,8 +449,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
>                         MIPI_DSI_MODE_VIDEO_BURST;
>         else
>                 dsi->mode_flags =
> -                       MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -                       MIPI_DSI_MODE_EOT_PACKET;
> +                       MIPI_DSI_CLOCK_NON_CONTINUOUS;
>
>         acx->supply = devm_regulator_get(dev, "vddi");
>         if (IS_ERR(acx->supply))
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
