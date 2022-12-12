Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C090649A07
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 09:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE27410E163;
	Mon, 12 Dec 2022 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B6A10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:32:18 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3b56782b3f6so135743847b3.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 00:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n5nV2CvDZfukPo6kYti38gUyvFyPZkuwTvD1jwHN2S4=;
 b=rfFx7d3Wh6bqiy8B51bav3A6IV7Da0E6ToVVDvU2NEnFwl/P6NHu0H45jGRkiFwFE6
 TH6ELNdwU+HeziYyJV5rizHisFsWpRwDpbaAy7/dkn961GMb9jUM1dt38j5Ap3ao7ZkT
 jbmzQeL1Sh5ktJdrps5lYbjKdiLmCgZROurzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n5nV2CvDZfukPo6kYti38gUyvFyPZkuwTvD1jwHN2S4=;
 b=GX4lW9jgq9/9c5dex2RX2wAQKnq32+FEEVmoJ20SRrVSkS4LfFDrHSNeYCq6AccSgi
 wgcNIaQh6gxeU4/SnHUieAkcEEZXHDeah8LB/wubi9THX86hQthEKrZgQkFS3rJJBAFP
 bgErchnWP8XyhOlOhJG+Cg8Mlgpz77BzSNQMJ40zCxebOKlhrzJGY+qjNFZfDSCkIlsP
 q6+/lga+kpeEfg5s9SfIUhl1mEhseMtm6/am/+FRH4wbnOA/8TdnjmRTIqkOIxOzG9Nf
 5jd4I0WFSwIw7OBzRzLsvna5aN8Gnrpw+n0kSrFp3eGtlH3iQzWVbxR3vtKG7Rvyptop
 mHdg==
X-Gm-Message-State: ANoB5pmQDH7CE/uSasezjVxsBmRhyimenl33ibXiBGC8jcUB2F0mzOF2
 6y3yZ3l0UJBL2M2PJ5o3uJNyZwbZotz4pgrxlQ8MFg==
X-Google-Smtp-Source: AA0mqf6aTgUMMJHWUlm3ipUcDMMe3rX+Hw9+V8yHcM7MQTUwAt81ByVoivunR2I2iDWTQaKHwKkwiP4ZMc7kFzzpqbE=
X-Received: by 2002:a81:9a13:0:b0:398:ab7a:aba9 with SMTP id
 r19-20020a819a13000000b00398ab7aaba9mr20562238ywg.106.1670833937138; Mon, 12
 Dec 2022 00:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
In-Reply-To: <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 12 Dec 2022 14:02:05 +0530
Message-ID: <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 09.12.2022 16:23, Jagan Teki wrote:
> > The existing drm panels and bridges in Exynos required host
> > initialization during the first DSI command transfer even though
> > the initialization was done before.
> >
> > This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> > flag and triggers from host transfer.
> >
> > Do this exclusively for Exynos.
> >
> > Initial logic is derived from Marek Szyprowski changes.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes from v9:
> > - derived from v8
> > - added comments
> >
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
> >   include/drm/bridge/samsung-dsim.h     |  5 +++--
> >   2 files changed, 17 insertions(+), 3 deletions(-)
>
> The following chunk is missing compared to v8:
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 6e9ad955ebd3..6a9403cb92ae 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> *dsi, unsigned int flag)
>                  return 0;
>
>          samsung_dsim_reset(dsi);
> -       samsung_dsim_enable_irq(dsi);
> +
> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> +               samsung_dsim_enable_irq(dsi);

Is this really required? does it make sure that the IRQ does not enable twice?

Jagan.
