Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9F260056D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 04:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C27910E259;
	Mon, 17 Oct 2022 02:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395FC10E259
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 02:49:42 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 x6-20020a4ac586000000b0047f8cc6dbe4so2474533oop.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Jrsl0UCrrczEefB5mN7PjqCqG5f1N/sWxxZQbZjv3s=;
 b=Xi3eyoMMPzVM7+iKFTYOQPhI1SIJwbYywWs8FFmiz3JpO1rC3Y/lBkhkVySVVxwzLO
 ss74QRLdRA/8A/uJuH4m4AFQhGyKyMFTsT1UZLuFvpVjq2FVFeiy1PqwxdaGYrLZgZ7R
 D8hyFaK6xkIFEGB+cNNQDJ482ixbgtydWt2w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Jrsl0UCrrczEefB5mN7PjqCqG5f1N/sWxxZQbZjv3s=;
 b=xpMurwJhr2TnD004NqrpnSTC1lL64JYzAwFzBr2CgkLEp9DKyz1XNgps9NnqCHL/AF
 vyUjvzjvYLR3hTa3QemFXlUZ0bKt9SrJg3v1CkIkiXpKkDR1iEdw+PBaklb0/OGU+fpY
 Gs8CM81mDOqv+Rq2RLZzEZToFcF8uqrYdazblpfz+gN0B0mXL5TDC3MZoJmvAQcqrLBy
 5F0zQz3YPmeHp0IufB1PRv6ir54fkn1NP51wCqha2k5QuadaZVobux+9jH1atlK5foBI
 jqw7k3aa84PMao28fZldnHXYq4NtrLHR5jYzVolGkB5O395gVjOgMnB9f+AljPC+UCdd
 G6+g==
X-Gm-Message-State: ACrzQf1w+BTqXji76zq/w61G1C5XT9VyDOn4fDsibUjMdeiK1KfdzG5E
 35IkcqM+noBjo7x6xzWZ26/N+kUTcikfBA6cGZUFNA==
X-Google-Smtp-Source: AMsMyM6ZKL7rdFD2T1i6bvy9KnjQQWq1NZKyEdqAj+XsyeUJYp3ifQl1EA8TE/V4w+GlY/4+m/n4n+nRCQQzd4NZIAY=
X-Received: by 2002:a4a:d4c1:0:b0:476:42e3:b45e with SMTP id
 r1-20020a4ad4c1000000b0047642e3b45emr3369161oos.89.1665974981414; Sun, 16 Oct
 2022 19:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com>
 <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
In-Reply-To: <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Oct 2022 08:19:30 +0530
Message-ID: <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
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

On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
> > Samsung MIPI DSIM controller is common DSI IP that can be used in various
> > SoCs like Exynos, i.MX8M Mini/Nano.
> >
> > In order to access this DSI controller between various platform SoCs,
> > the ideal way to incorporate this in the drm stack is via the drm bridge
> > driver.
> >
> > This patch is trying to differentiate platform-specific and bridge driver
> > code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
> > and common bridge driver code in samsung-dsim.c providing that the new
> > platform-specific glue should be supported in the bridge driver, unlike
> > exynos platform drm drivers.
> >
> > - Add samsung_dsim_plat_data for keeping platform-specific attributes like
> >    host_ops, irq_ops, and hw_type.
> >
> > - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
> >
> > - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
> >    samsung-dsim.c.
> >
> > - plat_data hooks like host_ops and irq_ops are invoked during the
> >    respective bridge call chains.
>
> Maybe the Subject should say "Split ... driver" or "Move ... driver" ,
> since it is not adding a new driver here ?

Though it is not added a completely new driver, it is adding more
infrastructure platform code to be compatible with both Exynos and
i.MX8M. This is the prime reason for adding that commit head and
explaining the same in the commit body.

Jagan.
