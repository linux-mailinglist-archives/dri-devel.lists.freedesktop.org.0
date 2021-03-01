Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550B0327A32
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551576E50B;
	Mon,  1 Mar 2021 08:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF936E50B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:59:48 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id u18so4861820ljd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 00:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AYs79IPnRt3qtzNnShKWZ7vyowWc2VUelHvdooVHnZg=;
 b=kcf6kcitYZpg70CypoUp8KXILwBgfW62DpbNjWslqlp4qw62fI7tzmXjPZQCmQxMc8
 y7E4AtX2Fmm4bNLcfXcEPW4KygtdDIAQoh7/Gppn2wuQW/GKYs0Umn4Wm46XccGHSmBe
 jy7uA45XkN8GMGoDoJDciHZsVQhSFIR5XDAoh0rW972s2s04adtjid+35nHXnoln8MA8
 FxCO26S/5xLKeLnx947E7nXZn0Rnap1zKbmn2OkkQ+VOi8uxBgu0gE1sSxomW3gthjJM
 ufu7iyDDX3VZgWZtHNc17YGxcgin7Xk21+hnZeVkHrui+fqknKWQ+8YcQvAzXeWUB5vl
 a9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AYs79IPnRt3qtzNnShKWZ7vyowWc2VUelHvdooVHnZg=;
 b=GTdpkiCQA3PpcYARyqFFOLAyOFiJrGdxzexWcEJ/lwNoVMoIcxwrJV1Rs7NQgs24VW
 fPJOldv204NQmgyw4LSI2txOP9d/fwfo8qEflZzHsqlS+KvqqmSrwVRmtB7Je1pUccep
 in0k1mdFP1ymXYNRcSclJkSR/UX/wZnDVVWiYzqK85K14j1OF3E2vAV4qdKCYadCX7dY
 RBd3hjZXLK4QS6tIVOf5Uq8GRS2aYGz8+KfuGXmZ3Z9TNe6w5epVt0avmVHFRQ6Lt4i5
 LAWnlkRxzySLvFL3eMsUfteU8NqCCD42DIxmzT0TdVX2zwCQ1/w34kf8V8Zp53Fjyhxi
 EtJg==
X-Gm-Message-State: AOAM532Bbt9lVrajJqLsTger9O26KspLV9zBLsly2no1FQj7oBjdg6O4
 NhaOixorLWCtxCMUJQbIEPRlV0GOYzMwbSrJDiravg==
X-Google-Smtp-Source: ABdhPJyj3pw+C0NXHPjoJdDWHXn0vLK/WBMS4zWE5j9GGEZHyMLzxq+OeogebxlDuBb2zgJuFq1OMvgpJB8dxst6o6c=
X-Received: by 2002:a2e:9754:: with SMTP id f20mr6463797ljj.200.1614589186573; 
 Mon, 01 Mar 2021 00:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
In-Reply-To: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Mar 2021 09:59:35 +0100
Message-ID: <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Nicolas Boichat <drinkcat@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, MSM <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 11, 2021 at 4:34 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.

Unless someone like me interpreted it literally...

Like in these:

>  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-

> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 2314c8122992..f4cdc3cfd7d0 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
>                 DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_READ_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> -       if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +       if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>                 val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;

If you read the code you can see that this is interpreted as inserting
an EOT packet, so here you need to change the logic such:

if (!d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
    val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;

This will make sure the host generates the EOT packet in HS mode
*unless* the flag is set.

(I checked the data sheet.)

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index b9a0e56f33e2..9d9334656803 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
>         dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +               MIPI_DSI_MODE_NO_EOT_PACKET;

Here you should just delete the MIPI_DSI_MODE_EOT_PACKET
flag because this was used with the MCDE driver which interpret the
flag literally.

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 4aac0d1573dd..b04b9975e9b2 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>          */
>         dsi->mode_flags =
>                 MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +               MIPI_DSI_MODE_NO_EOT_PACKET;

Same, just delete the flag.

> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> -               MIPI_DSI_MODE_EOT_PACKET |
> +               MIPI_DSI_MODE_NO_EOT_PACKET |
>                 MIPI_DSI_MODE_VIDEO_BURST;

Same, just delete the flag.

> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index 065efae213f5..6b706cbf2f9c 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
>         else
>                 dsi->mode_flags =
>                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -                       MIPI_DSI_MODE_EOT_PACKET;
> +                       MIPI_DSI_MODE_NO_EOT_PACKET;

Same, just delete the flag.

These are all just semantic bugs due to the ambiguity of the flags, it is
possible to provide a Fixes: flag for each file using this flag the wrong way
but I dunno if it's worth it.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
