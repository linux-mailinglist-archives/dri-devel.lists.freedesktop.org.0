Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E76C470F33
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EAC10E32B;
	Sat, 11 Dec 2021 00:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC19110E32B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 00:07:25 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q25so15544800oiw.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qig9qwOGoBvnHg7tX1jnWpBgUUxlTEaBoNWwy9fRxAA=;
 b=LYKvaouQK49EpVPst3Wl1jp9uanlO8+/fsf3o8zvyUAD/TWtG7bSAnYGfveQgsi+l/
 pOULHbtJZkHDhj1P02cSLpjfe6NEgoe3OAdNNcnBOiuPOPRdeZnpi8Y3Fff5aby81YQs
 fPhpADdzgSMu37lIhibBpY9OzkPocIVBDZs0IDTmESOd7sqUhWdUsIwT4MaPiGkGzN9O
 DaE8Ps69zfMEhxBnqYEXiPM/uWWeLnq69F7+JEBaAG6jO6dIP2g1bYOOwB1YhlxNC0tC
 mzf/RG8CYNTlgX1j753NKNt5UlAox5RHR7S5ZiwMmcwBL2qVHz0DRZAnnKmhNp145y2B
 +J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qig9qwOGoBvnHg7tX1jnWpBgUUxlTEaBoNWwy9fRxAA=;
 b=LUdU+doTjjRInL5M0LX/shl2SJzG7mz5I9cqi0JgY7XtbkZw/V2UZzwvDCwyjEGv5b
 B3gu3FHSSdwFifsG+vT/YN2u7C4TTukn0q2NBahh5g9FEr8uwTeWG6qQIK1sNIlwADT4
 m/hGLaLZe+2rg9IAND4uXvM5MRGk/bepxYVnWPOZUY33Ej9olQESxEMKoV6F6EIH4F29
 2ljXsFl3pKhzt28B9+2mzlwmZXshEMfKzzxLwzPgpmNk8hK6Fwr2i8DhZ6mErz6mZjIo
 1ZKQm4Otr650d2kRUmzEKdB6Rf5kvIkbHF5MzVOWFsCcoKuY5HXDeMmXh/OYs1RWFAC7
 sf4Q==
X-Gm-Message-State: AOAM532uFiIoOnUUxNLWUBjGGMrAdrrDG+JoKyYnTpL+jHRmjbG7X8TY
 Vhemx8mEk5K9RLBfnuya6RiBWnChQEvUTvq3KIcJMw==
X-Google-Smtp-Source: ABdhPJzXH8G3CxM8f1dVbL2fs9y2zVr5fX8welXMizONG6Brv5hnOIdYNhyIV1TO6rIbKlx9NQGdXT1Zm6G0UGYTiTs=
X-Received: by 2002:a54:4791:: with SMTP id o17mr15621211oic.114.1639181245034; 
 Fri, 10 Dec 2021 16:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
 <20211210174819.2250178-3-jagan@amarulasolutions.com>
In-Reply-To: <20211210174819.2250178-3-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Dec 2021 01:07:13 +0100
Message-ID: <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: bridge: Switch to devm_drm_of_get_bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 6:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
>
> Replace explicit finding calls with devm_drm_of_get_bridge.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Nice overall!

> -       /* Look for a panel as a child to this node */
> -       for_each_available_child_of_node(dev->of_node, child) {
> -               panel = of_drm_find_panel(child);
> -               if (IS_ERR(panel)) {
> -                       dev_err(dev, "failed to find panel try bridge (%ld)\n",
> -                               PTR_ERR(panel));
> -                       panel = NULL;
> -
> -                       bridge = of_drm_find_bridge(child);
> -                       if (!bridge) {
> -                               dev_err(dev, "failed to find bridge\n");
> -                               return -EINVAL;
> -                       }
> -               }
> -       }
> -       if (panel) {
> -               bridge = drm_panel_bridge_add_typed(panel,
> -                                                   DRM_MODE_CONNECTOR_DSI);

And we are guaranteed that the right type of connector will be
used here? (Just checking.)

> -               if (IS_ERR(bridge)) {
> -                       dev_err(dev, "error adding panel bridge\n");
> -                       return PTR_ERR(bridge);
> -               }
> -               dev_info(dev, "connected to panel\n");
> -               d->panel = panel;

How does this assignment happen after your patch?
I'm using that...

devm_drm_of_get_bridge() needs some more argument right?

> -       } else if (bridge) {
> -               /* TODO: AV8100 HDMI encoder goes here for example */
> -               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> -               return -ENODEV;
> -       } else {
> -               dev_err(dev, "no panel or bridge\n");
> -               return -ENODEV;
> +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +       if (IS_ERR(bridge)) {
> +               dev_err(dev, "error to get bridge\n");
> +               return PTR_ERR(bridge);

I'm gonna want to test this somehow on the hardware. But the TODO comment
there wasn't supposed to be deleted if I will still need to take some special
action whether this is a panel bridge or some other bridge.

Yours,
Linus Walleij
