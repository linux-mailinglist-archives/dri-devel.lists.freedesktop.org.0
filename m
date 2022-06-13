Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0205484D9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C185110E468;
	Mon, 13 Jun 2022 11:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5AE10E468
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:34:15 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id me5so10612369ejb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=psQQVR/f5fvbatmM/t2gUHb7xOqBl2kSfD6Yn4VXhn4=;
 b=CCl9lZDnz09VMHc2K+G9nhxXiKPlrTxi67Nm/sPyMli1Y1S9LcZTa57/sRZYQUmdT8
 8lVa6T1lK3uYdt95AJEg7WqWNL+L+CeCqs8XYWhgkY4LF57tVjnOahTu3+LCFwLoUKoK
 Abqvyhz8zaUi8HxhOciTkzy9iW/LMGc5rk+Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=psQQVR/f5fvbatmM/t2gUHb7xOqBl2kSfD6Yn4VXhn4=;
 b=wWj3OadOF3xvH5wnNSlW2jO3n2jf+TdGLWfhbuqxqYkjgtGuQm/uuHwgEqMvCaaJ6U
 mH+gEgXvwbRa7nzd4DjtY4qiiccSQbGvMIRP0T3z1oF0mHU5Gs+DQ1gF4EchyqAJw3LF
 YEffc+W+koGVcJDB/NDe0929bNH/Pi/DtepDgL8Dx03yz0kZui5VRBvFmwsEn61v+Ji2
 ZJffeVtuDo0KwbiwksKX9aIGttIOMl861Yc3yq7ndm59NrvYt/hlLzLizee3BWd1FLIO
 kdSnnMNoXpjiZkSsSrjMXLed93r9XjcEFXO3oE8lB9rqSM4AO9A+d8OWkXFepPl6J5h5
 f7Bw==
X-Gm-Message-State: AOAM533HSNjPk7bpBYen5roZThQT1aNsZIoLYBaTfhFW7HPx3iNv2hra
 GMAWY/GxMyAiaN5ZakYDxGoTrpmEnynJxytLL4Hfjg==
X-Google-Smtp-Source: ABdhPJwDToIMv6/nNTYJJcYjxVWlEOEDpBR/p8X/D6SOqOZf8PEhTIZZ1e2EWV6opwyScsFcWjLI2AIlpvVZAxD/h48=
X-Received: by 2002:a17:906:2cc3:b0:70d:b6c8:f83b with SMTP id
 r3-20020a1709062cc300b0070db6c8f83bmr48930490ejr.770.1655120054442; Mon, 13
 Jun 2022 04:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-9-jagan@amarulasolutions.com>
 <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
 <CGME20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc@eucas1p1.samsung.com>
 <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com>
 <8a0727e2-134f-c34e-aa32-cf828255ce8c@samsung.com>
In-Reply-To: <8a0727e2-134f-c34e-aa32-cf828255ce8c@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 13 Jun 2022 17:04:03 +0530
Message-ID: <CAMty3ZAUBVjkDuB2MjMYzZiEc9K7h6tQWn-RozHt7AYNApsJow@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
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

On Mon, Jun 13, 2022 at 5:02 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 13.06.2022 13:17, Jagan Teki wrote:
> > On Wed, May 11, 2022 at 4:01 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> >> On 04.05.2022 13:40, Jagan Teki wrote:
> >>> Fixing up the mode flags is required in order to correlate the
> >>> correct sync flags of the surrounding components in the chain
> >>> to make sure the whole pipeline can work properly.
> >>>
> >>> So, handle the mode flags via bridge, atomic_check.
> >>>
> >>> v2:
> >>> * none
> >>>
> >>> v1:
> >>> * fix mode flags in atomic_check instead of mode_fixup
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>>    drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
> >>>    1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> index b618e52d0ee3..bd78cef890e4 100644
> >>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>>        pm_runtime_put_sync(dsi->dev);
> >>>    }
> >>>
> >>> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> >>> +                                  struct drm_bridge_state *bridge_state,
> >>> +                                  struct drm_crtc_state *crtc_state,
> >>> +                                  struct drm_connector_state *conn_state)
> >>> +{
> >>> +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> >>> +
> >>> +     adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> >>> +     adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> >>
> >> 1. Shouldn't this be in mode_fixup callback?
> > Possible to do it on mode_fixup, yes. if we want to do the same stuff
> > on atomic API then atomic_check is the proper helper.
> >
> >> 2. Where this requirement comes from? As Marek says it breaks Samsung
> >> platforms and is against DSIM specification[1]:
> > At least the bridge chain starting from LCDIF+DSIM requires active high sync.
>
> Then please make this specific to the imx variant. The current version
> breaks DSI operation on all Exynos based boards.

But exynos trm also says the same?

"45.2.2.1.2 RGB Interface
Vsync, Hsync, and VDEN are active high signals"

Jagan.
