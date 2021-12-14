Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C68474B6B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA5510E13A;
	Tue, 14 Dec 2021 19:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645CF10E143
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 19:01:20 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g14so65596495edb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V5xsmmy7oHXnWtSlv73eniyPk4d9HcE6zpRG0aAXvgk=;
 b=C/9WC2zvk0WHxHKU/JH3fuLPcsQGYR2Q/VFvuXHvujLRoniC3Gj5a23rBL4dyyS9Pr
 G/iq9LlMnDLyrbUjF/vR6ahwmH9IquYEXiDgLtrtMM7sjK7tzKhxAHK/ByOvVgBlSd/C
 sFNmZeycYpVm/tyUAkbl2eKTVd764CjuFd6Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V5xsmmy7oHXnWtSlv73eniyPk4d9HcE6zpRG0aAXvgk=;
 b=xSPZkHduU2IYE2MdeuZi+pXF8lzS8/IusNiAoMxX7wbgxgBsXIYBYQu73V2zOy4xfQ
 Q9W961i/301w47xImy0CG7yvz8tsOmhv7b+J8rVC2P6uwddMQA9q7c9yD79t32puWa93
 eeGafkqROC5m/xA6du1eNyE3Bjp2qD8VMLja8yVVUf41ArFe9d5A7vqXvHr3lfLbfaD8
 DaPiWDlI0n9p290fhxuoh64IQBtIRYxuBZ2Bn+WA0i7S4Do56XtmJzvtfmFBMK6JRZFy
 9dAns5rhId3YN+hA0s8/3I1B+gOB6o4o7rnaUDl/IBknFUUR2bSSBJC707lxZQTpuwql
 guFg==
X-Gm-Message-State: AOAM530FnApxlEPrN1x1/H+Y109Q8h4WUODewFGrU7aafGJXdlbSqStH
 gvA3YR2pismkqd7ONF0+ajA+af64g7mneWM4Npeabw==
X-Google-Smtp-Source: ABdhPJy7xBgQT3e/kZUCcveALeQRRiChfjiKS4pc+pxU7Bu7E6w7PO4aL/n1VmYKZQJ94r+9G3+/iC1ZLeew/DCwvyc=
X-Received: by 2002:a17:906:b003:: with SMTP id
 v3mr7684892ejy.770.1639508479079; 
 Tue, 14 Dec 2021 11:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <20211212181416.3312656-5-jagan@amarulasolutions.com>
 <84e905cd-5a0e-0b6d-1052-bc97acbfecdc@intel.com>
In-Reply-To: <84e905cd-5a0e-0b6d-1052-bc97acbfecdc@intel.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 15 Dec 2021 00:31:08 +0530
Message-ID: <CAMty3ZAVAy_pD0CjrFEG555VkvzCA2FqPFp5e1qwUtOmiwB6Tg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm: exynos: dsi: Separate pre_enable,
 post_disable code
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 3:27 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
>
> On 12.12.2021 19:14, Jagan Teki wrote:
> > Existing driver is calling manual bridge pre_enable, enable,
> > disable and post_disable helpers with their enable and
> > disable functions.
> >
> > Separate the enable code with pre_enable and enable helpers
> > like enable the DSI in pre_enable and set the display in enable.
> >
> > Separate the disable code with disable and post_disable helpers
> > like disable the DSI in disable and reset the display in
> > post_disable.
> >
> > This way the bridge functions are compatible with respective
> > downstream bridge and panel_bridge drivers.
> >
> > Example of enable bridge function calls with panel_bridge is,
> >
> > [ 2.079030] panel_bridge_pre_enable: start
> > [ 2.079043] panel_bridge_pre_enable: end!
> > [ 2.079045] exynos_dsi_atomic_pre_enable: start
> > [ 2.079723] exynos_dsi_atomic_pre_enable: end!
> > [ 2.079728] exynos_dsi_atomic_enable: start
> > [ 2.102500] exynos_dsi_atomic_enable: end
> > [ 2.146505] panel_bridge_enable: start
> > [ 2.148547] panel_bridge_enable: enable
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - new patch
> >
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++-------------
> >   1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index 1450187c1edc..07083a545948 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -1377,10 +1377,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
> >       }
> >   }
> >
> > -static void exynos_dsi_enable(struct drm_bridge *bridge)
> > +static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
> >   {
> >       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > -     const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
> >       int ret;
> >
> >       if (dsi->state & DSIM_STATE_ENABLED)
> > @@ -1393,38 +1392,36 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
> >       }
> >
> >       dsi->state |= DSIM_STATE_ENABLED;
> > +}
> >
> > -     if (dsi->out_bridge)
> > -             funcs->pre_enable(dsi->out_bridge);
> > +static void exynos_dsi_enable(struct drm_bridge *bridge)
> > +{
> > +     struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> >
> >       exynos_dsi_set_display_mode(bridge);
> >       exynos_dsi_set_display_enable(dsi, true);
> >
> > -     if (dsi->out_bridge)
> > -             funcs->enable(dsi->out_bridge);
> > -
>
>
> Ok, apparently I haven't catch that in previous patch you have left out
> bridge attached to encoder->bridge_chain, before the previous patch out
> bridge was detached from bridge_chain, which assured exynos_dsi has full
> control about callbacks.
>
> Does it mean that after prev patch all bridge calls were called twice, I
> think it is incorrect.

I think squash this to previous patch make sense. let me know if you
are fine with it?

Thanks,
Jagan.
