Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B006B600819
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 09:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613A510E38D;
	Mon, 17 Oct 2022 07:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F5F10E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 07:51:34 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-132fb4fd495so12381469fac.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XWLP7i62jFW6oRSoyvp2q+yVGfR5Lxj+voPavApZkTk=;
 b=AFDgqcKxcIKQr1YaXq+rVne8uvFcTZI4m6WkMq5trqjHT0ECPcb1TxC+I1giYXDg/a
 jadAvelIFRvCneIpXKITT8qpJEROC7Twif9oLRa6hFBOaiLMLjk547h/D0RO9SdugCBF
 OLdJzS6YbluYIU+FknEhCrL4q1RqAty97TcNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XWLP7i62jFW6oRSoyvp2q+yVGfR5Lxj+voPavApZkTk=;
 b=LMN2GaXakzr+U1nYfh2yEkfzkYozaD4QQ1abMaJwfPjWA98t03bC/1iRAaq84W9TXS
 0tkgAIUJr4qCraco6NEy1X8kUY00VcAi1NJa/LtHHMjb3kIoTnuvem3PMVryi+E7iFeI
 ljDbTgPjux094i5jqADuYnv3BUFljrGLAuXjV1MRGVeV/kjd4PKzKUYI2rBnwoh+9dMx
 9kWLm2ZQOqQsiqYuWC3qXYhEYMlvPPR0HQo5BEs/Hdx9pQwBX+caAk3xkY3oTAr43Mqb
 OMq9lr971B5H6ae7XZUpAzWC+gVQIFbOWCLLU9n76F/9Eigv8NAXF0iPd+xUFuC+4idd
 m03w==
X-Gm-Message-State: ACrzQf031eDiikGc6PPXIyxw7kZ/V9AGIf7HYAb6UInLeMqGWEPNMnZp
 FPr9Hh42bls50N2qXnS/GbzzpjqiYgRRtoJS3p/B7g==
X-Google-Smtp-Source: AMsMyM5SoibjyxUNWPddsJQiXBCo6gUiccPmwYk5IFGbnZUgk9qascBl19j/lpgoHfB0B+L4U97W0P8BydAkhiuaRog=
X-Received: by 2002:a05:6870:8999:b0:133:15f9:82fd with SMTP id
 f25-20020a056870899900b0013315f982fdmr4951557oaq.276.1665993093812; Mon, 17
 Oct 2022 00:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-6-jagan@amarulasolutions.com>
 <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
 <CAMty3ZAtuOKWJH6Qo-LiyCWEZW6g1JqRkRxctWiJcUpXaGMbLg@mail.gmail.com>
 <80ace77a-49c6-9b22-5c59-d0afa9b32153@denx.de>
In-Reply-To: <80ace77a-49c6-9b22-5c59-d0afa9b32153@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Oct 2022 13:21:22 +0530
Message-ID: <CAMty3ZDpez9Ls2gzGcAuM92UO2d2tkNe5FuLGuw0=GTSS-0oeQ@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 12:53 PM Marek Vasut <marex@denx.de> wrote:
>
> On 10/17/22 05:54, Jagan Teki wrote:
> > On Sun, Oct 16, 2022 at 2:53 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 10/5/22 17:13, Jagan Teki wrote:
> >>> Look like an explicit fixing up of mode_flags is required for DSIM IP
> >>> present in i.MX8M Mini/Nano SoCs.
> >>>
> >>> At least the LCDIF + DSIM needs active low sync polarities in order
> >>> to correlate the correct sync flags of the surrounding components in
> >>> the chain to make sure the whole pipeline can work properly.
> >>>
> >>> On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
> >>> Rev. 3, 11/2020 says.
> >>> "13.6.3.5.2 RGB interface
> >>>    Vsync, Hsync, and VDEN are active high signals."
> >>>
> >>> No clear evidence about whether it can be documentation issues or
> >>> something, so added a comment FIXME for this and updated the active low
> >>> sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.
> >>
> >> [...]
> >>
> >>> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> >>> +                                  struct drm_bridge_state *bridge_state,
> >>> +                                  struct drm_crtc_state *crtc_state,
> >>> +                                  struct drm_connector_state *conn_state)
> >>> +{
> >>> +     struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> >>> +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> >>> +
> >>> +     if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
> >>> +             /**
> >>> +              * FIXME:
> >>> +              * At least LCDIF + DSIM needs active low sync,
> >>> +              * but i.MX 8M Mini Applications Processor Reference Manual,
> >>> +              * Rev. 3, 11/2020 says
> >>> +              *
> >>> +              * 13.6.3.5.2 RGB interface
> >>> +              * Vsync, Hsync, and VDEN are active high signals.
> >>> +              */
> >>> +             adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> >>> +             adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> >>> +     }
> >>
> >> It would be good to explain what exactly is going on here in the
> >> comment, the comment says "Vsync, Hsync, and VDEN are active high
> >> signals." and the code below does exact opposite and sets NxSYNC flags.
> >>
> >> Yes, the MX8MM/MN does need HS/VS/DE active LOW, it is a quirk of that
> >> MXSFB-DSIM glue logic. The MX8MP needs the exact opposite on all three,
> >> active HIGH.
> >
> > This is what exactly is mentioned in the comments.
> >
> > 2nd line mentioned the active low of signals.
> >>> +              * At least LCDIF + DSIM needs active low sync,
> >
> > from 3rd line onwards it mentioned what reference manual is referring
> >
> > Not quite understand what is misleading here.
>
> This part:
> "
> +  * Vsync, Hsync, and VDEN are active high signals.
> +  */
> +  adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> "
>
> Comment claims the signals are active high by quoting datasheet, and
> then sets the exact opposite on next line of code.

The comment stated what is done first and then gave the datasheet
reference. look this sequence seems confusing, I will recheck and
update the best possible comment.

>
> Have a look at this patch, I updated the comment there for MX8MP too:
> [PATCH] drm: bridge: samsung-dsim: Add i.MX8M Plus support

I will check.

Thanks,
Jagan.
