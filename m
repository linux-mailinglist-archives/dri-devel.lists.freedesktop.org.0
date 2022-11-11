Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE89D624F14
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 01:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3BE10E176;
	Fri, 11 Nov 2022 00:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9540310E176
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 00:49:45 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id y20so914522uao.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4aw+UaNQAgOK1+qXIGrMeeF8yEOKVjEysHFmiav4A0=;
 b=SVxUSRXtPbC/FuRN7RzDaoM7NRKGVc/1Cpckh3BF6YDY/7xcDVEazwFUVM+8P+ZFAf
 /EskH/xlI+NhLRpmmriV2CeRoulGHu0LWtAzaRkcaMzNl9jQvuenFAZrJFEzdwVZeDVQ
 e2XNkQdfszPdJgHriTGKV5Vdd7j99qM5cby58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A4aw+UaNQAgOK1+qXIGrMeeF8yEOKVjEysHFmiav4A0=;
 b=Nr1VRZEivC4TJS+qmLnsWABVvhmHAMsfR7G6XujZVF7xaOL4HWp4Ave2ih6XjE4T6a
 K0jZa2eI3htghzBmld3CYV4CwYbmhAkQG4gUUH0YOEtQeH/S4QnvzCYOWqWtW1Xn0tax
 QwFpG2u6FjtwWuIDcm5cXX6PziOedwItQmMPJyXrpjSfg5Y0zqGM0KBCK2sUy5nwNTpv
 DmmdQ0AvygqeelwZuQMw0ay7vF2gwqq7llNxlwLBve3/XCaK3akpYwlz69ltEXAf15c1
 zBK653IAf5uPydOfmD/hWPs63ot74XijoCSdMIEFhAxxHB/FJgEc/CVlt30cip5DNA/Q
 mqCg==
X-Gm-Message-State: ACrzQf25FtDI2Z9WzPgLX7w1viU+fFj3fkkqNhQUrj8rUTLOwrGV+c78
 MkPKBxS4Ot4WBgDIz0bgjAzBoc12E1sgCzTuHbm3bg==
X-Google-Smtp-Source: AMsMyM4SjnSFJk5YLcoD0XGiysmnVs1xUdmx2A+ffh0o+8ILjg2lbpcc+shH8KvHipgoJlQ33t6hZtZVujSfDv1ow5M=
X-Received: by 2002:ab0:35c7:0:b0:411:968:212 with SMTP id
 x7-20020ab035c7000000b0041109680212mr23473675uat.107.1668127784551; 
 Thu, 10 Nov 2022 16:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
In-Reply-To: <20221110183853.3678209-2-jagan@amarulasolutions.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 11 Nov 2022 08:49:33 +0800
Message-ID: <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.com> wro=
te:
>
> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> 0 =3D Enable and 1 =3D Disable.

Oh I see, that's confusing... IMHO you might want to change the
register macro name... (but if that's what the datasheet uses, it
might not be ideal either). At the _very_ least, I'd add a comment in
the code so the next person doesn't attempt to "fix" it again...

BTW, are you sure DSIM_HSE_MODE is correct now?

>
> The logic for checking these mode flags was correct before
> the MIPI_DSI*_NO_* mode flag conversion.
>
> Fix the MIPI_DSI*_NO_* mode flags handling.
>
> Fixes: 0f3b68b66a6d ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> features")
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> Reported-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index ec673223d6b7..b5305b145ddb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *=
dsi)
>                         reg |=3D DSIM_AUTO_MODE;
>                 if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
>                         reg |=3D DSIM_HSE_MODE;
> -               if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> +               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
>                         reg |=3D DSIM_HFP_MODE;
> -               if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> +               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
>                         reg |=3D DSIM_HBP_MODE;
> -               if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> +               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
>                         reg |=3D DSIM_HSA_MODE;
>         }
>
> -       if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> +       if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>                 reg |=3D DSIM_EOT_DISABLE;
>
>         switch (dsi->format) {
> --
> 2.25.1
>
