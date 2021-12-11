Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2347121E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 07:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B692C10E9BE;
	Sat, 11 Dec 2021 06:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A9E10E9BE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 06:30:05 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t5so35910758edd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 22:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45gYyp/LH8Yh+4Quc0RZZryBEQFveslIoKz3TB5FrP4=;
 b=ciXDvjftMrr9Nf2NKNvcndMo/u9VbeWTyHwikmAUaIXZILeDHotOpLIdApFHeBZuGy
 E8roVb5/e0sBBwhK7QdkAGq0VZTe3Do+f9kK/AAy/QgZUKxoXkOuG/hl1uyxnkrt38If
 2pPBtTyhXThQ8jEGw0ft7UbmsU4EF9bMePUGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45gYyp/LH8Yh+4Quc0RZZryBEQFveslIoKz3TB5FrP4=;
 b=WvpciRixMrfA2m0uXGmCgVRJY6qnDw8JwwxJ/msxdpjodes0JQCzVKo94MHryVbEd8
 NzMFYRCRTQ5gVtm2dSoziKdUAvkTcVEWGrCOLVtzOdZ9berP6PZIVDoQRPjk3QlXV3B0
 eN8SHjcksqp5YaqEkiWBIBhpORQsAkWEKsrNf9OrP293wsQrfdnx1/IqEj0/29FtIkC5
 s9PmcZRLi3lcmtq+oBYSz1ZVtu5xMTgv46Ej4eekS/Jeg1OY8QCeD/7MkTM2B7/OlW3M
 oJ9cp1bOFHPOlIApMIU1WAkj8bz6rHstlnjOtW9CdAiieTOU6e7uKhYTiKtXpLGm3GHh
 XGBA==
X-Gm-Message-State: AOAM531XD31dh1UwrEYKQoOTSftXOEWZKEGCKZmnyoFb7iHXdpv6yfsL
 skpyeKymB+/tlc8P4wKtLwx8c+ZVxXwjph8k3T/hRw==
X-Google-Smtp-Source: ABdhPJzOc7DXoTv6rRM6jE61YHbKn0YtCORKfDFzJ1FTBp3lshE0zR5AwnU8/KYRvsWcgp0xVZ0JZAeYGbNOhgn2+wo=
X-Received: by 2002:a17:906:4099:: with SMTP id
 u25mr30932419ejj.453.1639204204296; 
 Fri, 10 Dec 2021 22:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
 <20211210174819.2250178-3-jagan@amarulasolutions.com>
 <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
In-Reply-To: <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 11 Dec 2021 11:59:53 +0530
Message-ID: <CAMty3ZDDdxkTiC2GByuiVW9obXW_jdBFK+R2-BAh0k_uB=GApQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: bridge: Switch to devm_drm_of_get_bridge
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Sat, Dec 11, 2021 at 5:37 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Dec 10, 2021 at 6:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > devm_drm_of_get_bridge is capable of looking up the downstream
> > bridge and panel and trying to add a panel bridge if the panel
> > is found.
> >
> > Replace explicit finding calls with devm_drm_of_get_bridge.
> >
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Nice overall!
>
> > -       /* Look for a panel as a child to this node */
> > -       for_each_available_child_of_node(dev->of_node, child) {
> > -               panel = of_drm_find_panel(child);
> > -               if (IS_ERR(panel)) {
> > -                       dev_err(dev, "failed to find panel try bridge (%ld)\n",
> > -                               PTR_ERR(panel));
> > -                       panel = NULL;
> > -
> > -                       bridge = of_drm_find_bridge(child);
> > -                       if (!bridge) {
> > -                               dev_err(dev, "failed to find bridge\n");
> > -                               return -EINVAL;
> > -                       }
> > -               }
> > -       }
> > -       if (panel) {
> > -               bridge = drm_panel_bridge_add_typed(panel,
> > -                                                   DRM_MODE_CONNECTOR_DSI);
>
> And we are guaranteed that the right type of connector will be
> used here? (Just checking.)

Yes. Each panel driver initialised the connector_type via
drm_panel_init and it will check during devm_drm_of_get_bridge.

>
> > -               if (IS_ERR(bridge)) {
> > -                       dev_err(dev, "error adding panel bridge\n");
> > -                       return PTR_ERR(bridge);
> > -               }
> > -               dev_info(dev, "connected to panel\n");
> > -               d->panel = panel;
>
> How does this assignment happen after your patch?
> I'm using that...
>
> devm_drm_of_get_bridge() needs some more argument right?

Yes, but I think we don't need to preserve the panel here. Yes I
didn't add that change, will take care in v2.

>
> > -       } else if (bridge) {
> > -               /* TODO: AV8100 HDMI encoder goes here for example */
> > -               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> > -               return -ENODEV;
> > -       } else {
> > -               dev_err(dev, "no panel or bridge\n");
> > -               return -ENODEV;
> > +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> > +       if (IS_ERR(bridge)) {
> > +               dev_err(dev, "error to get bridge\n");
> > +               return PTR_ERR(bridge);
>
> I'm gonna want to test this somehow on the hardware. But the TODO comment
> there wasn't supposed to be deleted if I will still need to take some special
> action whether this is a panel bridge or some other bridge.

Agreed. Even I do like to add this prints, since
devm_drm_of_get_bridge is not able to return differentiated bridge so
it it not possible now. May be we can discuss this point.

Thanks,
Jagan.
