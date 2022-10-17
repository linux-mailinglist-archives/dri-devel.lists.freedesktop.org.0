Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B86007F1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 09:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA70810E12B;
	Mon, 17 Oct 2022 07:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BF110E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 07:43:29 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-131dda37dddso12460087fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 00:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ATIms5kSTeUsYq3a6qs11i+14w2DWzAnEfeQbKlhXNk=;
 b=o8/ijuKiI+M1K0ijv8Sha8wXlREe8jjsWPdKkjL9hXNVWw/85rnuUq7HwKkVFkyPfD
 9L+4j0PC3hCYuScHLDzYGjBQ5SmXUudwerY80y5nviCg+iLjcLwxY9LkdYTup6bCyqck
 DWqFXs+Al5B4g4Idf1fYg/W6XwOuNM8WFmhsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ATIms5kSTeUsYq3a6qs11i+14w2DWzAnEfeQbKlhXNk=;
 b=waI47B24R+yi28N3TuUUO9krQHuZR1lX71884rxqv5ftAcoo7HP7wp2uocbtLoXjES
 PetWhbzMN1sBFHZcStR2rFSkJmsVTO6PJVVPDWfmrZ66b1Mty2L/2b2cxAvxFIyHqeZW
 ZiVwyYfIn9YwWaNvqDG4jDzu4MJMaW/iQ9JynYPKGFF31ewPwfO2Nrm2NY5Ytx+AR7M1
 esLi8swu1n9xfW2O+P5nQFk6KHsrZC1Yq//c0soKWsBsdw/LU7JiWApINBm+Fxik3WPX
 sMa0hv1Mu/dx01gOs9qt4GZMvrNJA9K0WL66StsEHEKR3UKQKeuybkQ2fcEn3lYPCnuL
 fJdg==
X-Gm-Message-State: ACrzQf0BYu+U/E/IlPSxPw69o5fVmCehBX5MAgi2knBcjBWC1guDw9up
 WAKq7ZCxgRiu3C7mW9UJ6Llgqj0NbAreG9F7mkT/sQ==
X-Google-Smtp-Source: AMsMyM7g02EeiDnhBL3r7CZltNPjxIRCJahMTfVKO6Vls9khNac8f62uFegFqqR3ndIn/92rvrJhd+h2mC8jDJJ37HI=
X-Received: by 2002:a05:6870:8999:b0:133:15f9:82fd with SMTP id
 f25-20020a056870899900b0013315f982fdmr4939223oaq.276.1665992608900; Mon, 17
 Oct 2022 00:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com>
 <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
 <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
 <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
In-Reply-To: <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Oct 2022 13:13:17 +0530
Message-ID: <CAMty3ZBLQu8YijrSVdt84-J9hoOx8qcRSaGF-FvZVsJEWVaXjQ@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 12:49 PM Marek Vasut <marex@denx.de> wrote:
>
> On 10/17/22 04:49, Jagan Teki wrote:
> > On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 10/5/22 17:13, Jagan Teki wrote:
> >>> Samsung MIPI DSIM controller is common DSI IP that can be used in various
> >>> SoCs like Exynos, i.MX8M Mini/Nano.
> >>>
> >>> In order to access this DSI controller between various platform SoCs,
> >>> the ideal way to incorporate this in the drm stack is via the drm bridge
> >>> driver.
> >>>
> >>> This patch is trying to differentiate platform-specific and bridge driver
> >>> code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
> >>> and common bridge driver code in samsung-dsim.c providing that the new
> >>> platform-specific glue should be supported in the bridge driver, unlike
> >>> exynos platform drm drivers.
> >>>
> >>> - Add samsung_dsim_plat_data for keeping platform-specific attributes like
> >>>     host_ops, irq_ops, and hw_type.
> >>>
> >>> - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
> >>>
> >>> - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
> >>>     samsung-dsim.c.
> >>>
> >>> - plat_data hooks like host_ops and irq_ops are invoked during the
> >>>     respective bridge call chains.
> >>
> >> Maybe the Subject should say "Split ... driver" or "Move ... driver" ,
> >> since it is not adding a new driver here ?
> >
> > Though it is not added a completely new driver, it is adding more
> > infrastructure platform code to be compatible with both Exynos and
> > i.MX8M. This is the prime reason for adding that commit head and
> > explaining the same in the commit body.
>
> Diffstat looks like this:
>
>   drivers/gpu/drm/bridge/samsung-dsim.c   | 1703 ++++++++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig          |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1766 ++---------------------
>   include/drm/bridge/samsung-dsim.h       |  113 ++
>   7 files changed, 1952 insertions(+), 1653 deletions(-)
>
> Looks to me like most of the code is just moved from existing driver in
> this patch.

Yeah, as I explained (from commit) it is moved, updated, and written
the plat code. How about this head?

"drm: bridge: Add Samsung DSIM bridge (Split from exynos_drm_dsi)"

Jagan.
