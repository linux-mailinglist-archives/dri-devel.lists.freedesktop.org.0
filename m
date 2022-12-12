Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192564A437
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 16:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD9210E211;
	Mon, 12 Dec 2022 15:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7AD10E211
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 15:33:55 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3bfd998fa53so151244027b3.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 07:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HlLz46JrENHa8C6qB/kOY9DxKCNNCi0KZWArbqXe5iY=;
 b=hD90rrO6DTclBGuXRutk53zM8ZzV/DuiV3HIDPKl0mci2bojEyK47hSYR2RGFqZZ20
 k68GIs6civUjbsvaObarOqUBhEpVmI16KVzM2rK6uqjjW/FSh9rw6+D1Ab5wlBcskI6v
 U9jydtKtads15RLZGISzoLjWf+7+jfu6Be4J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HlLz46JrENHa8C6qB/kOY9DxKCNNCi0KZWArbqXe5iY=;
 b=mMxbq9Hv7ZRMG15G7NlUE9U6JiQISf6LpEjN5l35yEipPNCUMCQUOSVbEwha4ia0Bg
 PNJbGWj10MyjvwcJawwVeHVvVZaWAN+UteReoFkJeHCqLS8047Ap1cMpeOr7LbtBW+P0
 Lb+EzQfQhzBDv0a0+q5GSuFJoA6XDBvLr7Og38LBqbQbYAUeh+6eQzI7y/xsg6QdudK2
 DaCfaecGY+DoqWB75vEaMwW+PbUIfBRBn9o4dA/DBvyG7a9kxXzVaj13v1/k6xiiWB/x
 PAQbjqWCTjeeegVk90COvjizQuFxE/LUpHYEDYpYwFfdwxZ91a+ZxWvZwpAewcBlS46i
 P2qQ==
X-Gm-Message-State: ANoB5pkvzfySHT06dUCeIgpHo6edOL1TVXeLdHaJENFgSlLD0iCJEhAA
 73+VllxJwn/If/GhtSztzgFBjzG/6GD5KhJWgmYxbA==
X-Google-Smtp-Source: AA0mqf6s4qYOLuJiaSiQ5ahfpuDn2VcPF75hIbI+rUJr/mTeBvuSTQMoZSAM39WJ4O7acKNC7mkG1N6EAEXx6bXvP6g=
X-Received: by 2002:a81:7357:0:b0:407:7bc3:d949 with SMTP id
 o84-20020a817357000000b004077bc3d949mr2225437ywc.186.1670859234919; Mon, 12
 Dec 2022 07:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
In-Reply-To: <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 12 Dec 2022 21:03:43 +0530
Message-ID: <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
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

On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 12.12.2022 09:43, Marek Szyprowski wrote:
> > On 12.12.2022 09:32, Jagan Teki wrote:
> >> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>> Hi Jagan,
> >>>
> >>> On 09.12.2022 16:23, Jagan Teki wrote:
> >>>> The existing drm panels and bridges in Exynos required host
> >>>> initialization during the first DSI command transfer even though
> >>>> the initialization was done before.
> >>>>
> >>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> >>>> flag and triggers from host transfer.
> >>>>
> >>>> Do this exclusively for Exynos.
> >>>>
> >>>> Initial logic is derived from Marek Szyprowski changes.
> >>>>
> >>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>> ---
> >>>> Changes from v9:
> >>>> - derived from v8
> >>>> - added comments
> >>>>
> >>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
> >>>>    include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>>>    2 files changed, 17 insertions(+), 3 deletions(-)
> >>> The following chunk is missing compared to v8:
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> index 6e9ad955ebd3..6a9403cb92ae 100644
> >>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> >>> *dsi, unsigned int flag)
> >>>                   return 0;
> >>>
> >>>           samsung_dsim_reset(dsi);
> >>> -       samsung_dsim_enable_irq(dsi);
> >>> +
> >>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >>> +               samsung_dsim_enable_irq(dsi);
> >> Is this really required? does it make sure that the IRQ does not
> >> enable twice?
> >
> > That's what that check does. Without the 'if (!(dsi->state &
> > DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
> > from pre_enable, then from the first transfer), what leads to a
> > warning from irq core.
>
> I've just noticed that we also would need to clear the
> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>
> However I've found that a bit simpler patch would keep the current code
> flow for Exynos instead of this reinitialization hack. This can be
> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
> init in pre_enable" patch:
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 0b2e52585485..acc95c61ae45 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(struct
> drm_bridge *bridge,
>
>          dsi->state |= DSIM_STATE_ENABLED;
>
> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> -       if (ret)
> -               return;
> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> +               if (ret)
> +                       return;
> +       }

Sorry, I don't understand this. Does it mean Exynos doesn't need to
init host in pre_enable? If I remember correctly even though the host
is initialized it has to reinitialize during the first transfer - This
is what the Exynos requirement is. Please correct or explain here.

Jagan.
