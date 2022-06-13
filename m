Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52775484C6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54BA10E492;
	Mon, 13 Jun 2022 11:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD5910E492
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:17:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id v1so10428258ejg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FO5eQRnnKHa3c3u3uxHcn5ZlaPTIIVuUOMy3m36ikoQ=;
 b=K5E4/xzxiOPflSJ7TE4smffiIvjbrel6Kugrqo92KYRAU4jspIY3Q2jHQadjy+4un2
 8znSkTk//qJ/p3nmNcW1bVytKIxyBy8fpBgRbbNGhz/f45KXQ7TsWwgNnBvEhzEsGnGK
 NmiI2K01ywDlI+qtp6+Z2ocLTuCFhsTkeywP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FO5eQRnnKHa3c3u3uxHcn5ZlaPTIIVuUOMy3m36ikoQ=;
 b=jHjnDfzsKPGcq01jeRAKpJl9GJpeCMZseY0TxoTgXl/EkbmuqyuPXHnj7sVRsGHbY1
 V3nKUFEKSKbZELLJvN0qEURibtKjp6CMbr3u3+r6CO0/xNYGKzgblZ/AxGNFFRoqRHDe
 j+KLxRasherK0ac8XRuP4fZiisI6e2dZlyU+UHVPAm7N4X8WIfHW1X5Ua39a5zAuJ7KO
 DBtxjl3hjNeZrQ1PWiLVBSTrQc+ah0Go7+cXVNgbwe4vKB4TkWMM4c0o3hRl3R6R7I1k
 lw53DPIklvxRPffSyR0IFwzX4TfkXHNGEJYuexjYbDfIdXGUvd+MMttOwpEWOl6BFpM0
 iC9g==
X-Gm-Message-State: AOAM533aymRlRGMjDV2ch3uZ0HwAmIJp2woAQiiOhi24LCbrmjT4jzSP
 8ZvFjZBVWSVt1XfmHNOE9qPMP5ezWpYBmUbFO34jmQ==
X-Google-Smtp-Source: ABdhPJy1YGZXyB3xGCSbNeenonti+4M6z/MEDflCOhq9mOF1UZMvm9qqASBBngbBmqx6Ppcp1MWW8C49KWXoGSrDIkg=
X-Received: by 2002:a17:906:494b:b0:710:7954:f6ce with SMTP id
 f11-20020a170906494b00b007107954f6cemr43312372ejt.123.1655119050611; Mon, 13
 Jun 2022 04:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-9-jagan@amarulasolutions.com>
 <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
In-Reply-To: <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 13 Jun 2022 16:47:19 +0530
Message-ID: <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 4:01 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> On 04.05.2022 13:40, Jagan Teki wrote:
> > Fixing up the mode flags is required in order to correlate the
> > correct sync flags of the surrounding components in the chain
> > to make sure the whole pipeline can work properly.
> >
> > So, handle the mode flags via bridge, atomic_check.
> >
> > v2:
> > * none
> >
> > v1:
> > * fix mode flags in atomic_check instead of mode_fixup
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index b618e52d0ee3..bd78cef890e4 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >       pm_runtime_put_sync(dsi->dev);
> >   }
> >
> > +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state)
> > +{
> > +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> > +
> > +     adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> > +     adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>
>
> 1. Shouldn't this be in mode_fixup callback?

Possible to do it on mode_fixup, yes. if we want to do the same stuff
on atomic API then atomic_check is the proper helper.

> 2. Where this requirement comes from? As Marek says it breaks Samsung
> platforms and is against DSIM specification[1]:

At least the bridge chain starting from LCDIF+DSIM requires active high sync.

Jagan.
