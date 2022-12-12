Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1929C649A9D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 10:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4CF10E178;
	Mon, 12 Dec 2022 09:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CE410E176
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 09:03:25 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3e78d07ab4fso136991487b3.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64rlgrD+okUidId1fJzfFG/Lh2XWGY3xOxTXFt4UClU=;
 b=rk4MIe96SX9Q/v8+35xWTLYPSXIirs6dDqVru8TRfwT3N/B5ITBBQDL2ZAiBpz7WM/
 HHKfe4soq5UxhrAnEYzalOfWDDT4bK7cF5EzZ79KrDQ2+SmygBQdmJNUaTwN2Kq5+OrR
 RxflS/kdIg8JhLuAq01TTHRGssOEsObuuiUrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64rlgrD+okUidId1fJzfFG/Lh2XWGY3xOxTXFt4UClU=;
 b=7ZmZZ91baiHntVcT/D5LsZ/DvwWIMYsszlG/AOtaTmXvOgu0tqoMZYF4LhEiQRmOez
 p71MJWbB60kLh7GiBAvpfqrCUr7r3/Mx+gLoAHKpDMpPNm/4FdNFE01K2dPIVFyqtzLU
 2DahdO2n2x71FsZuODOYzWN5i/onz0k7CxpcmBDRedNCI3cwh3Zq887AbaWfYtyW9L++
 uTvkeln6ND8UgBA3om3kZF8yrNawIxSDkzZHkAMVqD6WEACcnqQyUi+MXBMk0WW1mf+5
 0ygwZiiBnl2VmtsHZc1tGeUf52Vz57LECNXDyZ3pLrB2IMrSuq3BDeO+8FHgzkphjVRF
 9QWQ==
X-Gm-Message-State: ANoB5pkflO/GLJ9gPa0VYbHePwyNUZ0geY+HAD9DL6Og88NUK0aFjOZb
 gRfHnFKAatwAt7vDTComrjxW8uhGbLG9wH3LxpUC0w==
X-Google-Smtp-Source: AA0mqf6U5g4mvWxqEgrmM0kAjcljcItnC4sTOd1cfpL5+0talYekW2osbjJStpWUvftCztPq6nAHL23dmcM7E9NoljQ=
X-Received: by 2002:a05:690c:58d:b0:3c7:8c92:1243 with SMTP id
 bo13-20020a05690c058d00b003c78c921243mr9743ywb.81.1670835804653; Mon, 12 Dec
 2022 01:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475@eucas1p2.samsung.com>
 <20221209152343.180139-5-jagan@amarulasolutions.com>
 <1bc92b6c-a74a-82f6-6f96-1b6429856127@samsung.com>
In-Reply-To: <1bc92b6c-a74a-82f6-6f96-1b6429856127@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 12 Dec 2022 14:33:13 +0530
Message-ID: <CAMty3ZB9yGyAdddNaW6g8j2PYJo=p8Z3MGqwzt8A=qyrM5H-fw@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 On Mon, Dec 12, 2022 at 2:28 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 09.12.2022 16:23, Jagan Teki wrote:
> > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > 0 =3D Enable and 1 =3D Disable.
> >
> > The logic for checking these mode flags was correct before
> > the MIPI_DSI*_NO_* mode flag conversion.
> >
> > Fix the MIPI_DSI*_NO_* mode flags handling.
> >
> > Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> > features")
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reported-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v9:
> > - none
> >
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/=
exynos/exynos_drm_dsi.c
> > index e5b1540c4ae4..50a2a9ca88a9 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi=
 *dsi)
> >                       reg |=3D DSIM_AUTO_MODE;
> >               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> >                       reg |=3D DSIM_HSE_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> > +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> >                       reg |=3D DSIM_HFP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> > +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> >                       reg |=3D DSIM_HBP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> > +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> >                       reg |=3D DSIM_HSA_MODE;
> >       }
> >
> > -     if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> > +     if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> >               reg |=3D DSIM_EOT_DISABLE;
> >
> >       switch (dsi->format) {
>
>
> Huh, this changes the logic in the driver! I've spent another half of
> the night trying to figure out why v8 and v9 doesn't work on all my
> Exynos boards with DSI panels again...
>
> Please drop this patch from this series. If you want to get the Exynos
> DSI -> Samsung DSIM conversion merged, please focus on the core patches
> and don't add more random 'fixes' to each new version.
>
> This change has to be discussed separately. The values written by the
> Exynos DSI driver to the registers ARE CORRECT and DSI panels work fine
> with such configuration. So either everything is correct, or these flags
> are reversed both in the Exynos DSI driver AND at least tested DSI
> panels (s6e8aa0, s6e3ha2, s6e63j0x03). I would need to check this in
> panel datasheets if I manage to get them.

This issue was reproduced as part of the series in v7 in i.MX8m
platform and reported by S=C3=A9bastien Szymanski [1] and TRM matches the
fix as well.

[1] https://lore.kernel.org/all/4c9475d0-f76f-0c59-1208-6e5395496c9e@armade=
us.com/

Jagan.
