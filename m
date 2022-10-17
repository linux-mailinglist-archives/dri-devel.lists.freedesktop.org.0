Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B936005D9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 05:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14610EC34;
	Mon, 17 Oct 2022 03:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536110EC34
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 03:54:35 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so5129735otp.10
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 20:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kZFrBRjQqvKtI84d5ZY1Z+V+XGqvQ59HX9Pow5PlMCU=;
 b=RbV/uRqxG+zVsm9n1HjJ9973dtSLR6lor7ESRXg6D2NalpIkQUBr3chRaU5LY8h006
 SsqK7DmamzhMLY147g+5pRHYjicPIKzVZE1RlbeQQB7zNRgjsAcOY474YpZ5+bfkreqz
 GlVJxO/4H+FLqn5vRZ7sL6bHYD01YsT278yvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kZFrBRjQqvKtI84d5ZY1Z+V+XGqvQ59HX9Pow5PlMCU=;
 b=hbexuyTXiIpAqfl9wVpQDkvotqMOgwQjGxkVVD27GhfH/9WgqaOVC7obyF4joEm0zj
 RqFrQcZOLSAst8ufyuanzLtmzuKfrdcw5Ky4JCa3/E0dQAR/mB1MsKh9VjbK+1eOxoZM
 ymW4QWbhOzlGDz0/njYMqr5fa9xNz4yHlfOdqun2DBlTxGAB0q7SvlyMBuVxz/NUQrgD
 1A6eop6cj9qNcRQBtHU0ijsAAh+dlae9D2ff6Lagmh8fmpThRdutCnzEQW302KZg5LRg
 XaADqjon1a9D+Jl/0pOc0Ujako/iE7kr5i2OK1ViGQaoSWnBigG0bVnO5aK4gB5GEKSv
 +Q9w==
X-Gm-Message-State: ACrzQf2J4JhMFhknPt7vhhqQmwWNN5cz4f+Mh4wXZJDXptCjj79es3Wu
 EUzMXPkz8Rr7PJ8Mzas+gb+6g4rba/Uw00kivX6ssg==
X-Google-Smtp-Source: AMsMyM7xr0aPJjWI2MC+pmlsfmTuOjoE5/TV7EBoUd55WrwB/d84/wWBTtajGh+kp9TEdbo1u2Evt/voiA8BWE3DASk=
X-Received: by 2002:a9d:7002:0:b0:661:caa8:5fab with SMTP id
 k2-20020a9d7002000000b00661caa85fabmr4228372otj.274.1665978874656; Sun, 16
 Oct 2022 20:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-6-jagan@amarulasolutions.com>
 <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
In-Reply-To: <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Oct 2022 09:24:23 +0530
Message-ID: <CAMty3ZAtuOKWJH6Qo-LiyCWEZW6g1JqRkRxctWiJcUpXaGMbLg@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] drm: bridge: samsung-dsim: Add atomic_check
To: Marek Vasut <marex@denx.de>
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
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 16, 2022 at 2:53 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
> > Look like an explicit fixing up of mode_flags is required for DSIM IP
> > present in i.MX8M Mini/Nano SoCs.
> >
> > At least the LCDIF + DSIM needs active low sync polarities in order
> > to correlate the correct sync flags of the surrounding components in
> > the chain to make sure the whole pipeline can work properly.
> >
> > On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
> > Rev. 3, 11/2020 says.
> > "13.6.3.5.2 RGB interface
> >   Vsync, Hsync, and VDEN are active high signals."
> >
> > No clear evidence about whether it can be documentation issues or
> > something, so added a comment FIXME for this and updated the active low
> > sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.
>
> [...]
>
> > +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state)
> > +{
> > +     struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> > +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> > +
> > +     if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
> > +             /**
> > +              * FIXME:
> > +              * At least LCDIF + DSIM needs active low sync,
> > +              * but i.MX 8M Mini Applications Processor Reference Manual,
> > +              * Rev. 3, 11/2020 says
> > +              *
> > +              * 13.6.3.5.2 RGB interface
> > +              * Vsync, Hsync, and VDEN are active high signals.
> > +              */
> > +             adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> > +             adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> > +     }
>
> It would be good to explain what exactly is going on here in the
> comment, the comment says "Vsync, Hsync, and VDEN are active high
> signals." and the code below does exact opposite and sets NxSYNC flags.
>
> Yes, the MX8MM/MN does need HS/VS/DE active LOW, it is a quirk of that
> MXSFB-DSIM glue logic. The MX8MP needs the exact opposite on all three,
> active HIGH.

This is what exactly is mentioned in the comments.

2nd line mentioned the active low of signals.
> > +              * At least LCDIF + DSIM needs active low sync,

from 3rd line onwards it mentioned what reference manual is referring

Not quite understand what is misleading here.

>
> It would also be good to mention both MX8MM and MX8MN are affected, not
> only MX8MM.

I think I can do this once I refer to the MX8MN manual.

Jagan.
