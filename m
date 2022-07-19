Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1BF579A2D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 14:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE55110F587;
	Tue, 19 Jul 2022 12:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB8310F312
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 12:11:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r6so19299051edd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhavUp7BHi+VmzoRcY2DbuM/lf0xElZLhXi6he6CgJo=;
 b=UQaf9GCxACizE0JHp7NUyNsr3qwOY+LIlhYAMa1/BdRbxcM0pdvlvzSLhUaIY5GbO7
 qxxB7YzUm6oBQq11ShnBFy3QPZiLchV0twoqX6ZbZDy4vV/INWdByhYcHf39f5d+rYg3
 N5kWp8OctOCYswhRqzr87TmTbocRY36jeNhwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhavUp7BHi+VmzoRcY2DbuM/lf0xElZLhXi6he6CgJo=;
 b=nn4Tq0lJWHEDz6bAYindvk+C+P+UmFquqZnEvXYw+sn2UOK4/aX1UOjwQBpj/pYnaH
 5XiCZfCu9HNdkUI2R7GRca+Zjfyq1p8+wdVaqxC96KS4BR0FNcEK7qcgAdCcGWeRFWUX
 VJLZVVRrzyNwlGL7jWR/dHC8rORCWGV00V8dcD2cHXQoomrDI2LnsS7+ybxEiSV6J/JV
 LlCM2t+T39/o7Zt+nMw26fn7iaye5wraJETnnIZbolZ9YrUrkPvvq+343h3xtqFf2p6V
 p72dEFx+9/N67dLWYlKJqo7qsWPwInAHBrTuSOTk7pUFsC3AjZ2hl0X7uFl7Aom725Kj
 NsXw==
X-Gm-Message-State: AJIora96FVJVfhIxlhqb3G8T4gXhMH1UZlI2CBE31QkNo48QfeqBj1N4
 p6Nm1aTnjbtG4dcqlsujNWtEmIQRLxbkapntMgyWFg==
X-Google-Smtp-Source: AGRyM1svlcT6L8HLeoUMf6nh/a+vFXhvJFV1t0CGuwn4vRiSp/GDrFX9C4NjIAl37rhTAPVN3v/3G7ZG2swQF5P9Rzc=
X-Received: by 2002:a05:6402:d0a:b0:437:f9a1:8493 with SMTP id
 eb10-20020a0564020d0a00b00437f9a18493mr43554061edb.226.1658232687680; Tue, 19
 Jul 2022 05:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <CGME20220504114135eucas1p2b874e8c467c6b507239861d67198be25@eucas1p2.samsung.com>
 <20220504114021.33265-8-jagan@amarulasolutions.com>
 <7dc628c5-a387-1065-6e41-bb16c13cb1b6@samsung.com>
In-Reply-To: <7dc628c5-a387-1065-6e41-bb16c13cb1b6@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 19 Jul 2022 17:41:16 +0530
Message-ID: <CAMty3ZBsEfh4menMG9oEyJ-vU32DNYS+YQUX_6WgKx8hq740mg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] drm: bridge: samsung-dsim: Add module init, exit
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
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

On Mon, May 9, 2022 at 5:35 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 04.05.2022 13:40, Jagan Teki wrote:
> > Add module init and exit functions for the bridge to register
> > and unregister dsi_driver.
> >
> > Exynos drm driver stack will register the platform_driver separately
> > in the common of it's exynos_drm_drv.c including dsi_driver.
> >
> > Register again would return -EBUSY, so return 0 for such cases as
> > dsi_driver is already registered.
> >
> > v2, v1:
> > * none
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index 8f9ae16d45bc..b618e52d0ee3 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1740,6 +1740,28 @@ struct platform_driver dsi_driver = {
> >       },
> >   };
> >
> > +static int __init samsung_mipi_dsim_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret = platform_driver_register(&dsi_driver);
> > +
> > +     /**
> > +      * Exynos drm driver stack will register the platform_driver
> > +      * separately in the common of it's exynos_drm_drv.c including
> > +      * dsi_driver. Register again would return -EBUSY, so return 0
> > +      * for such cases as dsi_driver is already registered.
> > +      */
> > +     return ret == -EBUSY ? 0 : ret;
> > +}
> > +module_init(samsung_mipi_dsim_init);
>
> I've just noticed this. The above approach is really a bad pattern:
> registering the same driver 2 times and relying on the error.

If it tries to register 2nd time, then it returns EBUSY so we are
returning 0 for that case. not sure why it registers 2nd time again.

Jagan.
