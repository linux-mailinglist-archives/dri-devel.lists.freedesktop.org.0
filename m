Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E11A5F697B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 16:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657C10E036;
	Thu,  6 Oct 2022 14:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C1D10E036
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 14:21:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qw20so4288972ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fXBXPvzEiAEH5ehv1zHDRG9gqpMMOtis32/SucrCl80=;
 b=Wcj68O3BWIgWWj19pCPkOJ1c7xaya+yrBKMqyHBXAG2vcU8EsrOR0oAunzIXiBWn2b
 FkNWsWDQ3LZ6YKBA2T8VwhsoaQmnttOGXoSduqCq/I1kzOMvRmS7WjZxpVQyNcgAw1Rq
 cRt9bMVLA01HuYpifaVfgmApE7JHhyN4QhhOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fXBXPvzEiAEH5ehv1zHDRG9gqpMMOtis32/SucrCl80=;
 b=UQOQt7nmnqeB972H5BhTxjwlA1kPo1pYmDRvmVwaQxLdQ+CumhL7mx9hQvkcsi+jIt
 TAhmthv0c3ucCq31GzhOmSnDsRGLCDJG+z1ao5YXg4nFWvIzYl3Oyj4zev39mjwXGMAT
 Pig+MHeeqZ6P2eclVeUeXXc4/mMAG28msTjoIycjSxfdwJZnZ+aTKh4+PjAZHCHYZA1n
 zY5ao5QKvMdKz9F/XChMqHw/W/ZQIAkZmh6/NxFYU+NWwdGbQwABjUdjCGQn8IZHLQuc
 MN1ixxrJxkKsiykr1d3YKkRQKTNQxRpg10s1sPBg51ZAH/hViORlDflXCDwono2pdHcO
 SrjA==
X-Gm-Message-State: ACrzQf1GcAcuGg4+JiZHM1Z9d44SOxjiK9VFf7l9gP6q9fBJyBuX+uND
 3LMxRCQ1tAo1DDMV47ofR9D9pkJjvRs6cYuXkAomjQ==
X-Google-Smtp-Source: AMsMyM5zfD+IcIiD4jIzzJDInCXOJceYLLjeWumY18xRsBZqIMlxpH/IpvyguY/dHTVbb8rSW4Yk4t4RAniBUAaC698=
X-Received: by 2002:a17:906:5a4c:b0:78c:c893:74e6 with SMTP id
 my12-20020a1709065a4c00b0078cc89374e6mr40190ejc.545.1665066094875; Thu, 06
 Oct 2022 07:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20221005151323eucas1p2c69fc9989b84a9d74d568469ccd81f35@eucas1p2.samsung.com>
 <20221005151309.7278-1-jagan@amarulasolutions.com>
 <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
In-Reply-To: <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 6 Oct 2022 19:51:23 +0530
Message-ID: <CAMty3ZDN6jK-fup=eHeU5doF8xqcuq87YPah4gVhcWuL-xdFmA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, Oct 6, 2022 at 2:21 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 05.10.2022 17:12, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Changes for v7:
> > * fix the drm bridge attach chain for exynos drm dsi driver
> > * fix the hw_type checking logic
> >
> > Changes for v6:
> > * handle previous bridge for exynos dsi while attaching bridge
> >
> > Changes for v5:
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
> > Patch 0001:   Samsung DSIM bridge
> >
> > Patch 0002:   PHY optional
> >
> > Patch 0003:   OF-graph or Child node lookup
> >
> > Patch 0004:   DSI host initialization
> >
> > Patch 0005:   atomic check
> >
> > Patch 0006:   PMS_P offset via plat data
> >
> > Patch 0007:   atomic_get_input_bus_fmts
> >
> > Patch 0008:   input_bus_flags
> >
> > Patch 0009:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0010:   add i.MX8MM DSIM support
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
>
> This finally doesn't break Exynos DSI. :) Feel free to add:
>
> Acked-by: Marek Szyprowski
>
> Tested-by: Marek Szyprowski
>
> The next step would be to merge Dave's patchset and remove the hacks
> added here and there. Otherwise we will end up adding even more hacks soon.

I've some concerns about one of those patches, I will try to comment
on that patch in mailing list or will send updated changes on top of
those.

Thanks,
Jagan.
