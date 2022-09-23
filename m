Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2065E75DC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C4A10E52D;
	Fri, 23 Sep 2022 08:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE7410E52D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 08:32:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z97so16964663ede.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tYNwB7gsFieqfbLEPXElyVbDH6AzWiehFOxjpHySY/g=;
 b=Jaaaenz1419IfujefMFH+L6vaXPGha7RsVI4MJECqFvtM8hveoiCID7P7HeIS5paLY
 2IJxZ+PdCWENWA3qzpdxveJwaGgYJDlGqzy95V5QWfFyE3DSynaCBKzwTGjJpqlbpbAv
 AosZwokVXhJWvZPjV1utM9tw1rZwiOL1M5cL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tYNwB7gsFieqfbLEPXElyVbDH6AzWiehFOxjpHySY/g=;
 b=SDJuHuR3HPpFc85dtzp0OblfluJWgzFKd7+fXTpuaUYpZsSnuIJuhUtqOfJV9acbva
 GYjbMFDOqZhtcQV3rb2zvQMTwgY2NFTVhyBPvBnuP0s3wXuZuM8IHRuctMPdut+pIOs1
 oJ5uSddAFKiZHXalctcF1u0+MQf4uf8x/2jA4o91PnNYaSi4ZOnSmlG0J8OQ6RCdIqIu
 8LZiArBQD+mG9w1Xpen0wlab7NK6fe6rDHJTmRNqBS0g/3/1x98SAsNXDdMpR3H36H/n
 GuE5XZqOzbqgrGiJrhBanzhA4onPGbT0WHLvQ9gkw6nbLPY3pfzw+uO8umu8Xfuks0XW
 A1Gg==
X-Gm-Message-State: ACrzQf2rguU/tOlaRsUENCkwtTt50r0YST0WhDn/t9k1ADYrINLnyJvE
 FX431X+AW70YS9hjD4bRAGPom2eHFuFsx6nU9l0UXw==
X-Google-Smtp-Source: AMsMyM4Mmk9Sy5Dum9OSvR8YAnVSqbcT7mbcwEpx8XOXWx/9abGrqqmT4R4kRJBwch1UT3JCPBn3TyQPId+RKz2GXq4=
X-Received: by 2002:a05:6402:11c8:b0:451:7220:6343 with SMTP id
 j8-20020a05640211c800b0045172206343mr7112954edw.184.1663921928568; Fri, 23
 Sep 2022 01:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
 <CAJ+vNU2gLKm_Si7xUsRJuzbJyEFHpC_TqsiorBAT5ADTZjsPZg@mail.gmail.com>
In-Reply-To: <CAJ+vNU2gLKm_Si7xUsRJuzbJyEFHpC_TqsiorBAT5ADTZjsPZg@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 23 Sep 2022 14:01:57 +0530
Message-ID: <CAMty3ZCWFD_YxLkjs-d_fGeakEdsbJ=MKwQM3L_6QOm0Le8=kQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 3:13 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Fri, Sep 16, 2022 at 11:18 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > Previous v4 can be available here [1], repo on linux-next [2] and
> > Engicam i.Core MX8M Mini SoM boot log [3].
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Changes for v3:
> > * bridge changes to support multi-arch
> > * updated and clear commit messages
> > * add hw_type via plat data
> > * removed unneeded quirk
> > * rebased on linux-next
> >
> > Changes for v4:
> > * include Inki Dae in MAINTAINERS
> > * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> > * update init handling to ensure host init done on first cmd transfer
> >
> > Changes for v3:
> > * fix the mult-arch build
> > * fix dsi host init
> > * updated commit messages
> >
> > Changes for v2:
> > * fix bridge handling
> > * fix dsi host init
> > * correct the commit messages
> >
> > Patch 0001:     Restore proper bridge chain in exynos_dsi
> >
> > Patch 0002:     Samsung DSIM bridge
> >
> > Patch 0003:     PHY optional
> >
> > Patch 0004:     OF-graph or Child node lookup
> >
> > Patch 0005:     DSI host initialization
> >
> > Patch 0006:     atomic check
> >
> > Patch 0007:     PMS_P offset via plat data
> >
> > Patch 0008:     atomic_get_input_bus_fmts
> >
> > Patch 0009:     input_bus_flags
> >
> > Patch 0010:     document fsl,imx8mm-mipi-dsim
> >
> > Patch 0011:     add i.MX8MM DSIM support
> >
> > [3] https://gist.github.com/openedev/22b2d63b30ade0ba55ab414a2f47aaf0
> > [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v5
>
> Jagan,
>
> I would like to try out this latest series a board I have here. It
> looks like perhaps you did not push this imx8mm-dsi-v5 branch?

Please wait for the next version patches.

Thanks,
Jagan.
