Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080624CA44E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B2C10EED6;
	Wed,  2 Mar 2022 11:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D240610EEF5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 11:57:20 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so14104547b3.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 03:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BsNIu6fDISsVxMduZrcPuozipWlQALxU0u67vMbxYao=;
 b=X8ZyG8kIb5j4Jbo18O460EcWiOxOqm/lqp8jA4xpSswgoZhkd3Yd7XuxHqdKfnQ8mN
 +gzbG7kYF2dAFxGrxWaeilKuTn6AJsWs2I9DJNAsTeUK+C3uEiRr/joIB3swCzmz5MEB
 KC/FYekt633+329fwQMw6pineJ1DI/tatyw69Io3hhRuZmK+bFgxJhmqkY0VXvN2OFcd
 OC3zMZc0oFDu0gBipKVa8FylNPNllURFQDf9tPmxIHGH4TDhQqCT/zAHd6gPILPLaCKh
 9piHp2+q1Qo1kUol+0angk3lwH4aslFzGwK/BTwueND7yVkQDP5oC+BAOpgP5tsKQycL
 9Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BsNIu6fDISsVxMduZrcPuozipWlQALxU0u67vMbxYao=;
 b=j3ZGVnr6AreADR0qobb4gA39KsIjCkxtYABChGInFQOChOOTF9vIsYGC+9v1rBf+ab
 RewCwWXwYHzGxd/TAqyopvmbYm7jiy+SgniTFldbEJshToPgNX11La4PhZSAtxb2yz2c
 AjfbsajDo1VcjLukrCPaWDwl1T0lr9qTc3Bqe35FHwqD56CvnAYP7xeJWD+6qEO/cfNr
 OfsEgYBue3EGGam0JrtFmYMk8FCnFMvhaWPz+1jcFd+KC2csIi6rPCJ6wDPL5LMYdXsh
 pkFW7OXq5H+DI18x7N2XWzjzMeOx2Hs2zZJdw0stz2XhKeggOrncmmHi2Lw6m3ScBRn7
 uWuA==
X-Gm-Message-State: AOAM5333cHaq8M533Zx2expjpdGnXcWmz+Ej9ouzp5ixHK30w43V5y7T
 2QiykhBMApVDDCEqhQZVz2FrpkstV+73QiZmTXCOH4GAKJQI0g==
X-Google-Smtp-Source: ABdhPJzQT8wc1uvejvbDswKE1xFf86Rsc1kIJCWBTZu1aAD3z0A+xiKiDs9DBReOqFney4N4+81zklgdpuLd+UX8e5Y=
X-Received: by 2002:a81:9c47:0:b0:2db:9e18:6e75 with SMTP id
 n7-20020a819c47000000b002db9e186e75mr12672123ywa.437.1646222240030; Wed, 02
 Mar 2022 03:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
 <20220301141247.126911-8-jagan@amarulasolutions.com>
 <CACRpkdb4msdDt+pqggyaMXNxs_PWNqcP1+N5RL5nVw6QxWZ1Qw@mail.gmail.com>
 <CAMty3ZCqJ0KuoiRKzwG4VubBJVwzx-k0XTpBtF0XGVaJhxDaXw@mail.gmail.com>
In-Reply-To: <CAMty3ZCqJ0KuoiRKzwG4VubBJVwzx-k0XTpBtF0XGVaJhxDaXw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Mar 2022 12:57:08 +0100
Message-ID: <CACRpkdZiX1wwcN+XQ_jg8NGLer3kEgQM6LKwqAnp9-hSg7opEQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm: bridge: anx7625: Switch to
 devm_drm_of_get_bridge
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 2, 2022 at 5:37 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> On Wed, Mar 2, 2022 at 4:50 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Tue, Mar 1, 2022 at 3:13 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > > +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> > > +       if (IS_ERR(bridge)) {
> > > +               dev_err(dev, "error to get bridge\n");
> > > +               return PTR_ERR(bridge);
> > >         }
> > >
> > >         d->bridge_out = bridge;
> >
> > Also notice how this bridge gets used in other places:
> >
> > struct drm_connector *connector = drm_panel_bridge_connector(mcde->bridge);
>
> mcde->bridge bridge is the current bridge pointer it cannot affect
> this change. d->bridge_out is what we are finding of the downstream
> bridge.

Sorry I confused things.

Got lost in my own code :/

The bridge in the other file is for DPI obviously...
I should rename it dpi_panel_bridge.

> > Since you deleted:
> >
> > -       } else if (bridge) {
> > -               /* TODO: AV8100 HDMI encoder goes here for example */
> > -               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> > -               return -ENODEV;
>
> So, this means mcde dsi can support if the downstream bridge is the
> panel not if the downstream bridge is the next bridge. With
> devm_drm_of_get_bridge we cannot find that diff. Identifying the
> panel-bridge with some name pointer during panel_bridge_add might
> solve this, not sure that is proper way to do that?

I'd say leave it, as the DSI bridge (bridge_out) doesn't really care
about this being a panel or not. A further bridge down the chain
should "just work" (famous last words).

Just make sure we properly remove bridge_out in unbind call.

Yours,
Linus Walleij
