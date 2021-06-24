Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353D3B2F0C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B276EACD;
	Thu, 24 Jun 2021 12:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B412F6EACD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:34:49 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r7so8234666edv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JrS4IPVgEYnoiDcj56Qmce7AHyXhyRxqB9J3hfr4IBs=;
 b=cqiPcWcohbI63n9hvXxwO0W8g2GbPxBdWjUdDvwSpT59P80Oyl8Ixgx26WIHDJ6WEY
 Ssm887eDP93Z3vkJzGZCF9mPfnHNrXDkbN0ix2RJPNwFpdHsaww0zGAIuu1O5bHEMFdi
 5EMGwBwNy/rhXYegxrbmzylxSWadgu+ec6WbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JrS4IPVgEYnoiDcj56Qmce7AHyXhyRxqB9J3hfr4IBs=;
 b=qMhTinZBLiWyigAr2VP2DjiS7KjkbWbXcBP3HAPLH3++JfyUc6XQRHqkSTprFZvtEX
 L6wlW0b//uHgzlVWo9zLg9RJMJ877A+t9XxGc1U5dryyG/ytccxU+Z7dA3LTqeRETun6
 W6tW1yl/BDrijKsAmejQ+LqA0njVfyDBqrw89H0YqO69eDYwMP/QCrWIoB7qK9zvRRCB
 GqOd9App+b5GLktPZyBWyYHxFr2nS7XQRB/W3DrdC6v58PIMItnNvaesvw2U5D4uIe4O
 Q18uJTFPRdwNcoxzyLoqRexw81JgEGALeCGQS0wFPvVJwTAIqS9oqo2hQpwRMMWSuPZy
 B7yA==
X-Gm-Message-State: AOAM533QGPA3ehdjuqsiy7r09+iKn4gTTZXRMo5sVaaUvqEGz10+qpT8
 dZn+4WkTzXBt2o3yWZpmNEloOJYe50n00BwCPMU/Gw==
X-Google-Smtp-Source: ABdhPJxyWnFVcyuQihVaxmHjYBMJxJgEhs4wXx3hV/aL+veRIkFDuNLNgmY0d/BR54XT9OYOwi5pJw7DmxvANqXwT7o=
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr6915604edy.27.1624538088480;
 Thu, 24 Jun 2021 05:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210203091306.140518-1-jagan@amarulasolutions.com>
 <CANwerB1Bev8Ljta9OyO6vAKsQqHHmaJnjV1YRGmY4bVk_J6xZA@mail.gmail.com>
In-Reply-To: <CANwerB1Bev8Ljta9OyO6vAKsQqHHmaJnjV1YRGmY4bVk_J6xZA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 24 Jun 2021 18:04:37 +0530
Message-ID: <CAMty3ZAY7Ez9UYvfftSmqLEVWgN7xE5HevqfWirmrExZH=RMWA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
To: Jonathan Liu <net147@gmail.com>
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

Hi Jonathan,

On Fri, Jun 18, 2021 at 6:40 PM Jonathan Liu <net147@gmail.com> wrote:
>
> Hi Jagan,
>
> On Wed, 3 Feb 2021 at 09:13, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > @@ -1167,6 +1151,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
> >         dw_mipi_dsi_debugfs_init(dsi);
> >         pm_runtime_enable(dev);
> >
> > +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> > +                                         &panel, &bridge);
> > +       if (ret)
> > +               return ERR_PTR(ret);
>
> On RK3399 if the error is EPROBE_DEFER, __dw_mipi_dsi_probe can be
> called again and result in the following errors:
> [    0.717589] debugfs: Directory 'ff960000.mipi' with parent '/'
> already present!
> [    0.717601] dw-mipi-dsi-rockchip ff960000.mipi: failed to create debugfs root
> [    0.717606] dw-mipi-dsi-rockchip ff960000.mipi: Unbalanced pm_runtime_enable!

Is this when you test bridge on rk3399 or panel?

Jagan.
