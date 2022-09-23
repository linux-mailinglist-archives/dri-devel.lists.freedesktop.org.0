Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940775E75D9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6CD10E50C;
	Fri, 23 Sep 2022 08:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4935410E50C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 08:31:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z97so16963096ede.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vje7rqmfVDBOBMrBDL33KnVd0h6LDfzOlkHm4bdHrlM=;
 b=ESMQoh9pul519xiFeItMjUeH5Saqg5zMGGjIlD63Ral2iVH+ndyuGppp6O4nDZRi/J
 DkDsY+UBFeJgpdbKft8NSrLqWlhFD/MoLRIBJhHlzj9cC1VMrR8wWWffZFprjrubFuTN
 mrhteV8KSybXaGjSWET7W9/Ufen7iDjEcicg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vje7rqmfVDBOBMrBDL33KnVd0h6LDfzOlkHm4bdHrlM=;
 b=taLw99v9H4nHSQK1BSHWxUcqJNBQ6ZujxyHyEelCt7aeFQ2krXkeaFw4hruEgk42Wh
 IYk1gn3ZH85fjPgW8RF0WkdZu2GQNup7ze9eInK0nipHcAOEOavSd0mw82T/tzGq71Xf
 PrfUGXQZR5sSc/DTM+vVASRKUR9/bQRhr3cJVcPg+Xdh5mJOq0SE6hbtvszntottjNaQ
 aoZ+uNXo909jtI3bGQ3gP7axTdMMBhsmLyU736rvLHjdG9mJZ8/HNaDSCKt7FWhJ465e
 zOtW7oJ9+07deL6bFgXkGdw4VYvmSKpAjTcUaCuavAkIk7BpcPfNvm+AcVjcA4ZqNVTR
 znyg==
X-Gm-Message-State: ACrzQf3MCTYsAcAIa2fleyycCvezpqbrPC2vb2htxKFSscThgGlZTsjf
 2BrEu3Psm5bNdUTlrRvLMmBcu3ToQC783g1+0AJxgg==
X-Google-Smtp-Source: AMsMyM5hJlB4Vwc2zLPdF+6HhfFrtJtha6OqEJO/GkZlobtVkoa6dqU/Vy7VZV8JVXyOrhiZlFBix+1gS3dGYfrZP5k=
X-Received: by 2002:a05:6402:400e:b0:44f:1b9d:9556 with SMTP id
 d14-20020a056402400e00b0044f1b9d9556mr7203364eda.208.1663921896779; Fri, 23
 Sep 2022 01:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220916181822eucas1p2bfdd1247b0297638620846586598f2a6@eucas1p2.samsung.com>
 <20220916181731.89764-1-jagan@amarulasolutions.com>
 <9cf6b220-ac9c-3267-bdb2-29fc2f157f71@samsung.com>
In-Reply-To: <9cf6b220-ac9c-3267-bdb2-29fc2f157f71@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 23 Sep 2022 14:01:25 +0530
Message-ID: <CAMty3ZBQVab7YJBAKNkmudzDBeLUoUEW+VCEcMEtDK6fK56erQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
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

On Fri, Sep 23, 2022 at 1:04 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 16.09.2022 20:17, Jagan Teki wrote:
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
> > Patch 0001:   Restore proper bridge chain in exynos_dsi
> >
> > Patch 0002:   Samsung DSIM bridge
> >
> > Patch 0003:   PHY optional
> >
> > Patch 0004:   OF-graph or Child node lookup
> >
> > Patch 0005:   DSI host initialization
> >
> > Patch 0006:   atomic check
> >
> > Patch 0007:   PMS_P offset via plat data
> >
> > Patch 0008:   atomic_get_input_bus_fmts
> >
> > Patch 0009:   input_bus_flags
> >
> > Patch 0010:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0011:   add i.MX8MM DSIM support
> >
> > [3] https://protect2.fireeye.com/v1/url?k=f5b98b61-94329e52-f5b8002e-000babff9bb7-1f9a3bf1da680bc2&q=1&e=efefced1-2052-43c5-834f-b50867c29e3c&u=https%3A%2F%2Fgist.github.com%2Fopenedev%2F22b2d63b30ade0ba55ab414a2f47aaf0
> > [2] https://protect2.fireeye.com/v1/url?k=02c0a3da-634bb6e9-02c12895-000babff9bb7-8ed3eab856890e56&q=1&e=efefced1-2052-43c5-834f-b50867c29e3c&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v5
> > [1] https://patchwork.kernel.org/project/dri-devel/cover/20220829184031.1863663-1-jagan@amarulasolutions.com/
> >
> > Any inputs?
>
> Just to make it clear. Like I already pointed [1], this version breaks
> Exynos boards with DSI panels. Either the patch #1 has to be dropped to
> keep the current hack (the current code changes the bridge order to
> force proper pre_enable calls) or the Dave's patches have to be applied
> first [3].

Yes, I understand overall. Working on checking Dave's changes in the
Allwinner DSI host. If it doesn't impact it I will send next version
by including Dave's patches.

Thanks,
Jagan.
