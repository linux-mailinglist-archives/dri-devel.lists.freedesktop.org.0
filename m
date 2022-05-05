Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FCA51B949
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE9610E13D;
	Thu,  5 May 2022 07:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575D410E46D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 07:39:01 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ba17so4218497edb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 00:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6iJR95dCQe/jE0fXiwNw2SOTk6uzj9U7Yx5URoMZENE=;
 b=AwyRT/doF7/LoEqyDAqRtTknqtYm95ElPBpWm5pUuA7wYZojLPCMvxY2e//0vODY7i
 pX0Dqa4zoUz5jGx1SCeL91ePGCEHgwOETzzE89X9pU+qUgdptb9t0zDZQRbm0vDMwCpR
 wISZk5oDQSSDPzRITYJoPV00xG2HM2AC9d4kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6iJR95dCQe/jE0fXiwNw2SOTk6uzj9U7Yx5URoMZENE=;
 b=jOymWt2k9LTl/r8PpgMNx1MqsJcZPzrZv3HhZdMfQwyCfR5bqF3AY1lZjYGpxwYVm6
 ovkbVJCUsJd8x2+2U5Bv3Ys7fpbqRoyFtwW1r54k7fJIBwg9Cc5Rzs7gRFOwgPA2BZzF
 mo417azRiXqIYRPE9MfXRc/sTDI0xb6jPnysRfSGuQNV/ydICrS6D61XiowHPn2dVf1M
 7i8LKZhiSlkQN74xSew8hXPUCCUu2wbBpRmnAWsVfBf/36ruCWv0YJjCxiih514beWPq
 yhq4i5/u7+0+ajekDNG71zDSTyiEMNuMtuXj2ZIG+JH7sbdF/UTYu8GMrL8ZvZjq+qjS
 vSrg==
X-Gm-Message-State: AOAM531UMDkTfcihUmZEBHU2mIJeF4L6U3wNow3r9z868GdGDr95W24y
 ZOvzyUk95h3WSlfrYPyJ7phnbt6Pnng1NoUv1fd2XA==
X-Google-Smtp-Source: ABdhPJyEAFkfvN4dY2ZtOBeJ5gS6IRtgCLf0IefxhbigcnBcWZluCmsWpdXMGbgxLKiinLPH8EQgyPXX/A0voLDHtJc=
X-Received: by 2002:a05:6402:370b:b0:41d:8508:20af with SMTP id
 ek11-20020a056402370b00b0041d850820afmr28543149edb.16.1651736339766; Thu, 05
 May 2022 00:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <2184168.iZASKD2KPV@steina-w>
In-Reply-To: <2184168.iZASKD2KPV@steina-w>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 5 May 2022 13:08:48 +0530
Message-ID: <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
Subject: Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI DSIM bridge
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 5, 2022 at 12:57 PM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hello Jagan,
>
> thanks for the second version of this patchset.
>
> Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > Previous v1 can be available here [1].
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > On, summary this patch-set break the entire DSIM driver into
> > - platform specific glue code for platform ops, component_ops.
> > - common bridge driver which handle platform glue init and invoke.
> >
> > Patch 0000:   Samsung DSIM bridge
> >
> > Patch 0001:   Common lookup code for OF-graph or child
> >
> > Patch 0002:   platform init flag via driver_data
> >
> > Patch 0003/10:  bridge fixes, atomic API's
> >
> > Patch 0011:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0012:   add i.MX8MM DSIM support
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
> >
> > Anyone interested, please have a look on this repo [2]
> >
> > [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2
> > [1]
> > https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.184583-> 1-jagan@amarulasolutions.com/
> >
> > Any inputs?
>
> I was able to get my LVDS display running using this driver and an LVDS
> bridge. Actually my setup is similar to yours. My chain is like this:
> MIPI-DSI -> sn65dsi83 -> LVDS panel
> I noticed some things though:
> My setup only works if I use less than 4 lanes. See [1]. When using 4 lanes
> the image is flickering, but the content is "visible". Your DT has only 2
> lanes configured, do you have the possibility to use 4 lanes? I have no idea
> how to tackle this. It might be the DSIM side or the bridge side.
> Apparently the downstream kernel from NXP supports 4 lanes, if I can trust the
> config. I have no way to verify this though.

What is dsi_lvds_bridge node? have you added your dts changes on top
of imx8mm-dsi-v2 branch I'm pointing it.

I will check 4 lanes and let you know.

>
> Another thing is I get the following warning
> > sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check output
> bridge driver. Falling back to SPWG24.

This couldn't be much affected but will fix it.

>
> This seems to be caused by a wrong bridge chain. Using commit 81e80429 at [2]
> I get the following output:
> > bridge chain: /soc@0/bus@30800000/i2c@30a40000/dsi-lvds-bridge@2d -> /
> panel_lvds0 -> /soc@0/bus@32c00000/dsi@32e10000 ->
> Which seems weird. I would have expected something like
> dsi@32e10000 -> dsi-lvds-bridge@2d -> panel_lvds0
> Do you happen to see somthing similar? But this is completely unrelated to
> your patchset though.

Can you share the link to the exact commit?

Thanks,
Jagan.
