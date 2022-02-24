Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD64C280D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 10:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501B810F770;
	Thu, 24 Feb 2022 09:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CCA10F770
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 09:27:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bg10so3003121ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 01:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+kUny2RZ0RuNdhH0rcF0HLlqfcfBOEW7obgNCv8j1s=;
 b=mYHsOBAn5oGqkqGiL0olxjHcyHEPj4RpaseQt4OcNS3I5AbhfqU+nrzOwrN05KlqTv
 nQySHUxq+GSoZYjKaPyVm5JTQP+GAMcYbc5xj1jSk5O4mrwqgKUUZbFvzcLnm9sl/AsL
 rF3NYgIHCPwiRf0+i7kaMYWpFKnhUkMIdOuds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+kUny2RZ0RuNdhH0rcF0HLlqfcfBOEW7obgNCv8j1s=;
 b=rzSUaqoa3DnJ2fRb0l4LJVqJHn9812urn5Li41I8SczsrDruZFlqIjo+v4KYg8LzNV
 gorwtXtRXZGcxD2jTByVlron7DcRXnoE9jHEevU2ISOHfBzcNSV9xj2C6ltcyjmNY5II
 MOQfOr9yaaCrOI4k4SwAk2xwbvI7ZCZwk8dO8x19ThZ/Nm409aEiJBYOGUUotBubN7z1
 M6L7b22Mor92JdLB0ums5/6i0Jw1TAQ9hI5kIKM5ydXoEjc+3GCEsVHW9M8GQgjnYGjp
 36oHhbHa1R2bArdnZzeFzuTFUN0BZcyTzLSc2sGlsc15Vd42ytatyWFj81+k0K9Ny+by
 pHJw==
X-Gm-Message-State: AOAM5329mE8ME1QiFeQ0KWMy5BnjKZkr3cIs+rRulh8tWIdDQvWz6rNZ
 BRtpyaHAZZhIbT4Vjlq5ryVXtsleVFlEDmm+9fqeuuv8vBQkqQ==
X-Google-Smtp-Source: ABdhPJy7NWl6V7uQam8s7xz0z+Q+MYOsJR+U5qx3JJg14ZPkRQFjj+oSeW7E1FTEJBiFECOjP0PDKrc2HCoOW/rfY68=
X-Received: by 2002:a17:906:4ccd:b0:6b7:75ca:3eac with SMTP id
 q13-20020a1709064ccd00b006b775ca3eacmr1498686ejt.167.1645694852581; Thu, 24
 Feb 2022 01:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
 <20211210174819.2250178-3-jagan@amarulasolutions.com>
 <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
 <CAMty3ZDDdxkTiC2GByuiVW9obXW_jdBFK+R2-BAh0k_uB=GApQ@mail.gmail.com>
In-Reply-To: <CAMty3ZDDdxkTiC2GByuiVW9obXW_jdBFK+R2-BAh0k_uB=GApQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 24 Feb 2022 14:57:10 +0530
Message-ID: <CAMty3ZC4FP31zAU5CE88iG3JtXYaKo6b43bKjWuLiorHsrYBgQ@mail.gmail.com>
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

On Sat, Dec 11, 2021 at 11:59 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Linus,
>
> On Sat, Dec 11, 2021 at 5:37 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Fri, Dec 10, 2021 at 6:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > devm_drm_of_get_bridge is capable of looking up the downstream
> > > bridge and panel and trying to add a panel bridge if the panel
> > > is found.
> > >
> > > Replace explicit finding calls with devm_drm_of_get_bridge.
> > >
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Nice overall!
> >
> > > -       /* Look for a panel as a child to this node */
> > > -       for_each_available_child_of_node(dev->of_node, child) {
> > > -               panel = of_drm_find_panel(child);
> > > -               if (IS_ERR(panel)) {
> > > -                       dev_err(dev, "failed to find panel try bridge (%ld)\n",
> > > -                               PTR_ERR(panel));
> > > -                       panel = NULL;
> > > -
> > > -                       bridge = of_drm_find_bridge(child);
> > > -                       if (!bridge) {
> > > -                               dev_err(dev, "failed to find bridge\n");
> > > -                               return -EINVAL;
> > > -                       }
> > > -               }
> > > -       }
> > > -       if (panel) {
> > > -               bridge = drm_panel_bridge_add_typed(panel,
> > > -                                                   DRM_MODE_CONNECTOR_DSI);
> >
> > And we are guaranteed that the right type of connector will be
> > used here? (Just checking.)
>
> Yes. Each panel driver initialised the connector_type via
> drm_panel_init and it will check during devm_drm_of_get_bridge.
>
> >
> > > -               if (IS_ERR(bridge)) {
> > > -                       dev_err(dev, "error adding panel bridge\n");
> > > -                       return PTR_ERR(bridge);
> > > -               }
> > > -               dev_info(dev, "connected to panel\n");
> > > -               d->panel = panel;
> >
> > How does this assignment happen after your patch?
> > I'm using that...
> >
> > devm_drm_of_get_bridge() needs some more argument right?
>
> Yes, but I think we don't need to preserve the panel here. Yes I
> didn't add that change, will take care in v2.
>
> >
> > > -       } else if (bridge) {
> > > -               /* TODO: AV8100 HDMI encoder goes here for example */
> > > -               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> > > -               return -ENODEV;
> > > -       } else {
> > > -               dev_err(dev, "no panel or bridge\n");
> > > -               return -ENODEV;
> > > +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> > > +       if (IS_ERR(bridge)) {
> > > +               dev_err(dev, "error to get bridge\n");
> > > +               return PTR_ERR(bridge);
> >
> > I'm gonna want to test this somehow on the hardware. But the TODO comment
> > there wasn't supposed to be deleted if I will still need to take some special
> > action whether this is a panel bridge or some other bridge.
>
> Agreed. Even I do like to add this prints, since
> devm_drm_of_get_bridge is not able to return differentiated bridge so
> it it not possible now. May be we can discuss this point.

Any comments on this? I will try to send the next version based on it.

Thanks,
Jagan.
