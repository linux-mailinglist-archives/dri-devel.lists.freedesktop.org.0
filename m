Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDED433272
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2C6EB6D;
	Tue, 19 Oct 2021 09:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFD26EB6D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 09:37:17 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 ez7-20020a17090ae14700b001a132a1679bso1583314pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 02:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ND/+F3Ar6OquSntMCxz9qgsi04nnrmfHfmUAomzm/4I=;
 b=FPakQL+OMRNJjPfkzZN3ZBE8vdbu/9WnnBjj5mkIEUhTkx7Rqb3FRIWk2gTwmabN7M
 HxNn2wpfA4/+8yXJ8q6aEc5XptfDatWuu5senZReW2tIxnCl+HFfZfi9PSRNGuEbADeY
 ZEYbYrsxuWJ68e0fiDjYy9jUS6UtwJuk2HeCVJoqCWTKfim7fNlioHJVMpSIa2OuEnNk
 YggCW/wWGMuA34KEplUEC0mqlRVGginPMszr7va+pAIXfa+mioE7T38vVgbWQ/ScPKu3
 /yu8jhTUMmg6M4x1xPeZgyGRMSR7Vs8+LYL45JPI7o3IFKVTfcM+8aFZ0ER4GSZGA6Ri
 Y4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ND/+F3Ar6OquSntMCxz9qgsi04nnrmfHfmUAomzm/4I=;
 b=Nhk0jJcpEV2HQGJByxLRRBQdIB+qmkNBnancTpmMbag8Wu7snMGl8mIWCn4ndmpd/e
 SiOE0ZaxyFAiTXfAuKicq4WlD+39wM1UVI4t1ICGR5BUXbIGca6AvjawxLfM5VKY15CA
 4zfhxJezmhjLHrwvEOz0LFkYq6E7jMz78G6t6LBnDJDJ8jG6v3NWGqoEq20svWzoydph
 gG/cQ0gLhIOovwlk9JQaSGyshyueWWHRi24j9ap9sRbp2DUuR0NqFpxZRNrYrMkQV+8W
 wnpEo5c+w1O9u1x4A+bZKuVISydFGmmtc9y4UapCfqjfp8KDG1kW7hP+Zf2a2vtNhDk2
 USiQ==
X-Gm-Message-State: AOAM530dIE5FqQ70OrDGtANeFSxMdG9hMcHFYPj/QiC4e7nfoxtgENDi
 gYe92pq6ovDZfpnmh3CSkD1EUtYONfUl7Z061+pvSQ==
X-Google-Smtp-Source: ABdhPJwsNzQstsNgy6Pe+DD2TzMylbTunvzCItyZxXHwgT3oEqiF2GJNSa9MTlQx6hVpPU1RNzpxX1vZmj9bsgW0VE4=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr5260275pjb.232.1634636237402; 
 Tue, 19 Oct 2021 02:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com>
 <20211002233447.1105-5-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-5-digetx@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Oct 2021 11:37:06 +0200
Message-ID: <CAG3jFyt2NVWyGRWj3QPKhrYgcaRZ+QVifNEHA9CvY0XwnnLvRA@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] drm/bridge: tc358768: Disable non-continuous clock
 mode
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Non-continuous clock mode doesn't work because driver doesn't support it
> properly. The bridge driver programs wrong bitfields that are required by
> the non-continuous mode (BTACNTRL1 register bitfields are swapped in the
> code), but fixing them doesn't help.
>
> Display panel of ASUS Transformer TF700T tablet supports non-continuous
> mode and display doesn't work at all using that mode. There are no
> device-trees that are actively using this DSI bridge in upstream yet,
> so clearly the broken mode wasn't ever tested properly. It's a bit too
> difficult to get LP mode working, hence let's disable the offending mode
> for now and fall back to continuous mode.
>
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 5b3f8723bd3d..cfceba5ef3b8 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -631,6 +631,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  {
>         struct tc358768_priv *priv = bridge_to_tc358768(bridge);
>         struct mipi_dsi_device *dsi_dev = priv->output.dev;
> +       unsigned long mode_flags = dsi_dev->mode_flags;
>         u32 val, val2, lptxcnt, hact, data_type;
>         const struct drm_display_mode *mode;
>         u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
> @@ -638,6 +639,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         const u32 internal_delay = 40;
>         int ret, i;
>
> +       if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> +               dev_warn_once(priv->dev, "Non-continuous mode unimplemented, falling back to continuous\n");
> +               mode_flags &= ~MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +       }
> +
>         tc358768_hw_enable(priv);
>
>         ret = tc358768_sw_reset(priv);
> @@ -776,7 +782,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>                 val |= BIT(i + 1);
>         tc358768_write(priv, TC358768_HSTXVREGEN, val);
>
> -       if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> +       if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>                 tc358768_write(priv, TC358768_TXOPTIONCNTRL, 0x1);
>
>         /* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
> @@ -864,7 +870,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         if (!(dsi_dev->mode_flags & MIPI_DSI_MODE_LPM))
>                 val |= TC358768_DSI_CONTROL_TXMD;
>
> -       if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> +       if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>                 val |= TC358768_DSI_CONTROL_HSCKMD;
>
>         if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> --

Reviewed-by: Robert Foss <robert.foss@linaro.org>
