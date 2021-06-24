Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B73B2F2C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067506EADC;
	Thu, 24 Jun 2021 12:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6396EADC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:39:59 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id t32so5067112pfg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C38GYrWeEqn9ryL7zps8yOxhcW8ssLvsptRrONqKIew=;
 b=oPHof5ahVU78lKBca6qSqBEQlupAPft1mjL6zU5f5XTLP3hsB+DIYJgVYGTFXO6uv5
 zhvPSREczIT7PDEXa3sIyUoWEq/w4ltJZ3MAsDlmuwMPk6LbjaIuIM5Pg6MzJLhQMsgm
 BnnSvLMro1v1EzB+FOCmPvDuoq22wScXkFU0siaNsM03AqvMIFkiNGhPVhfIyGMemeMp
 fLQhwZtfI1cc8SePf+M9eV2vm+O+eoRCfCm4lFO3WJrNO4HZL5f7zki+It+g/Zgywz8b
 TQmklY4V+GYUKWn3gnRQSTp8NZc7w4bFBwqgyOZhJln+mwe/sdL1vWNeLlupJC9JFa8Z
 cojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C38GYrWeEqn9ryL7zps8yOxhcW8ssLvsptRrONqKIew=;
 b=R1l4iMzcmIu6zvST9DYbAEd1OAIKNGzFKj6cifI5F/+xqPCaSH2xuChya4KL3ez3Y6
 ptcHz7BK25AluubRu94AE1HUQH8UYYW8hp+/q6HUU4RSc5YvgftVp3WyCPduzJsXwaQq
 AwQFVVSiSdBjC/F3kF5Qbck3uXydmohBOph5HmT8oATkOnfz7mtiIy3dqrG7orp33vwq
 teiZYfgY7Xm0ur1BORkHiLtlIOhaHGgJOnEeF7xx+Aeak+plYvO1IGCiMiSq6YkZ2Zrh
 mN0MbZDouM1z/CGVgULQ2a+UU2QER59sTAh2jKlVmIIjZapTzfLol6i760mjoz2TYCU9
 lCJw==
X-Gm-Message-State: AOAM530d/n4adZJp2PNZT9f+x4nsvwYBDE9gqI69vhjDNM9Jla4DgBLZ
 R2pADgWNq1coPilExVg1vMfalFQ/V0QLel+X9Fo=
X-Google-Smtp-Source: ABdhPJwNnlaCJfFXIZrf+/lJ+Uih3hNkHuFBDvDdGKPZwqvnwUBK9Jg3kLd41iC+VIEjROxK5sKynkZqpLbeeUGdPdI=
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr4753939pfe.37.1624538399388; Thu, 24 Jun
 2021 05:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210203091306.140518-1-jagan@amarulasolutions.com>
 <CANwerB1Bev8Ljta9OyO6vAKsQqHHmaJnjV1YRGmY4bVk_J6xZA@mail.gmail.com>
 <CAMty3ZAY7Ez9UYvfftSmqLEVWgN7xE5HevqfWirmrExZH=RMWA@mail.gmail.com>
In-Reply-To: <CAMty3ZAY7Ez9UYvfftSmqLEVWgN7xE5HevqfWirmrExZH=RMWA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Thu, 24 Jun 2021 22:39:48 +1000
Message-ID: <CANwerB1AiiT3oXCpwP83M1=ES9M-yQoLuZO5f=eVxA42MkEbiA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Thu, 24 Jun 2021 at 22:34, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Jonathan,
>
> On Fri, Jun 18, 2021 at 6:40 PM Jonathan Liu <net147@gmail.com> wrote:
> >
> > Hi Jagan,
> >
> > On Wed, 3 Feb 2021 at 09:13, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > @@ -1167,6 +1151,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
> > >         dw_mipi_dsi_debugfs_init(dsi);
> > >         pm_runtime_enable(dev);
> > >
> > > +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> > > +                                         &panel, &bridge);
> > > +       if (ret)
> > > +               return ERR_PTR(ret);
> >
> > On RK3399 if the error is EPROBE_DEFER, __dw_mipi_dsi_probe can be
> > called again and result in the following errors:
> > [    0.717589] debugfs: Directory 'ff960000.mipi' with parent '/'
> > already present!
> > [    0.717601] dw-mipi-dsi-rockchip ff960000.mipi: failed to create debugfs root
> > [    0.717606] dw-mipi-dsi-rockchip ff960000.mipi: Unbalanced pm_runtime_enable!
>
> Is this when you test bridge on rk3399 or panel?

MIPI-DSI to LVDS bridge.

Regards,
Jonathan
