Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05780602198
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 05:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601BC10E735;
	Tue, 18 Oct 2022 03:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5713810E735
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 03:05:41 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so6917118otp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 20:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mRZ1Bn5GRC6sUQN11IKv8q0ePTjs0/xJ/26/9wZxb5k=;
 b=T9U7W1M3+O4ZAfqvPylQRg8I5s6oPhU6mUIgh1Mh/zRLOMiudbe6fJfDvXd9GTi/3I
 BeY3Icg0mfJS2gsInTYB8TGjUAHozjWaWwOXSY5lgL0e3Kv/DRckvkzNrzl9e8Lft42U
 1mjkiFSo8shvPf8TruUxwl1nvQDY9UDlHxFeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mRZ1Bn5GRC6sUQN11IKv8q0ePTjs0/xJ/26/9wZxb5k=;
 b=qGaLbXscwHaCuGaQkpCbTvksyVe6RPw2z4dbJoIRv1F3Azrvf7sNz2KBwTR9xq/TfQ
 Qgt70+icgjt9wapXgEmKL2qfYYQqnjHhnIZuEuPTlK89fQ/9lrM2A3MjqDxJ84rbsvqA
 LzZwGN5Fs1yJlX6uJ/V5cx3Wtetcfv6WgO9uk4NITZW1cCK6Av2jpz7GPOoD1vXcnITG
 OJZr/vzkLIb/twudoPKZ0gen+AeRCIf7z0eSi5kAOz9BWINnpQU6FrWWLyjEKmYRtd2U
 HYek/CdL0pSCLv4+RViDOon7Rz7nRLEhvtoQdJZltex9FWpAToR3KlH0+h4uT4RpwgS+
 A0Vw==
X-Gm-Message-State: ACrzQf1lIjKa1RQVzp/tPpwRgyKfa6yHezu1I2QB7npjDcSPPx4gX89F
 8Zgh8XGHgKRmY60bhuIH04cgixhflkXqgVK0aLS1uQ==
X-Google-Smtp-Source: AMsMyM79MAdvwUTUZM4LsRtjzTXO6r2g+p5+xfLoxqhYJmb09+c1bsnKYljSusQWoPoo63pw5fDXFzDE9IL3mnINxp4=
X-Received: by 2002:a9d:7002:0:b0:661:caa8:5fab with SMTP id
 k2-20020a9d7002000000b00661caa85fabmr448689otj.274.1666062341189; Mon, 17 Oct
 2022 20:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com>
 <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
 <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
 <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
 <CAMty3ZBLQu8YijrSVdt84-J9hoOx8qcRSaGF-FvZVsJEWVaXjQ@mail.gmail.com>
 <CGME20221017084832eucas1p190091bef8dce651ad0bf582880a56117@eucas1p1.samsung.com>
 <76423028-e58e-7271-0d74-fb4bb2bf65c8@denx.de>
 <2b0350ba-070a-8df0-9a2d-8c18da03b6cb@samsung.com>
In-Reply-To: <2b0350ba-070a-8df0-9a2d-8c18da03b6cb@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 18 Oct 2022 08:35:29 +0530
Message-ID: <CAMty3ZBFy0r1YFVpA73bG2t2FAz1SbJRQ1yvBYo62wSAde7XnA@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
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

On Mon, Oct 17, 2022 at 2:31 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 17.10.2022 10:48, Marek Vasut wrote:
> > On 10/17/22 09:43, Jagan Teki wrote:
> >> On Mon, Oct 17, 2022 at 12:49 PM Marek Vasut <marex@denx.de> wrote:
> >>> On 10/17/22 04:49, Jagan Teki wrote:
> >>>> On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>
> >>>>> On 10/5/22 17:13, Jagan Teki wrote:
> >>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
> >>>>>> various
> >>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
> >>>>>>
> >>>>>> In order to access this DSI controller between various platform
> >>>>>> SoCs,
> >>>>>> the ideal way to incorporate this in the drm stack is via the drm
> >>>>>> bridge
> >>>>>> driver.
> >>>>>>
> >>>>>> This patch is trying to differentiate platform-specific and
> >>>>>> bridge driver
> >>>>>> code by maintaining exynos platform glue code in exynos_drm_dsi.c
> >>>>>> driver
> >>>>>> and common bridge driver code in samsung-dsim.c providing that
> >>>>>> the new
> >>>>>> platform-specific glue should be supported in the bridge driver,
> >>>>>> unlike
> >>>>>> exynos platform drm drivers.
> >>>>>>
> >>>>>> - Add samsung_dsim_plat_data for keeping platform-specific
> >>>>>> attributes like
> >>>>>>      host_ops, irq_ops, and hw_type.
> >>>>>>
> >>>>>> - Initialize the plat_data hooks for exynos platform in
> >>>>>> exynos_drm_dsi.c.
> >>>>>>
> >>>>>> - samsung_dsim_probe is the common probe call across
> >>>>>> exynos_drm_dsi.c and
> >>>>>>      samsung-dsim.c.
> >>>>>>
> >>>>>> - plat_data hooks like host_ops and irq_ops are invoked during the
> >>>>>>      respective bridge call chains.
> >>>>>
> >>>>> Maybe the Subject should say "Split ... driver" or "Move ...
> >>>>> driver" ,
> >>>>> since it is not adding a new driver here ?
> >>>>
> >>>> Though it is not added a completely new driver, it is adding more
> >>>> infrastructure platform code to be compatible with both Exynos and
> >>>> i.MX8M. This is the prime reason for adding that commit head and
> >>>> explaining the same in the commit body.
> >>>
> >>> Diffstat looks like this:
> >>>
> >>>    drivers/gpu/drm/bridge/samsung-dsim.c   | 1703
> >>> ++++++++++++++++++++++
> >>>    drivers/gpu/drm/exynos/Kconfig          |    1 +
> >>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1766
> >>> ++---------------------
> >>>    include/drm/bridge/samsung-dsim.h       |  113 ++
> >>>    7 files changed, 1952 insertions(+), 1653 deletions(-)
> >>>
> >>> Looks to me like most of the code is just moved from existing driver in
> >>> this patch.
> >>
> >> Yeah, as I explained (from commit) it is moved, updated, and written
> >> the plat code. How about this head?
> >>
> >> "drm: bridge: Add Samsung DSIM bridge (Split from exynos_drm_dsi)"
> >
> > I disagree with the "Add" part of the Subject, but I'll wait for
> > others' opinion here.
>
> Maybe something like a "Generalize Exynos-DSI DRM driver into a generic
> Samsung DSIM bridge"?

I agreed.

Jagan.
