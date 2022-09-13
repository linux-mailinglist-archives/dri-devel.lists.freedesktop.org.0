Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6195B77EF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 19:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C783710E011;
	Tue, 13 Sep 2022 17:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E367010E011
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 17:29:59 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f20so14168349edf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=EMlArogLUibXaoKnYk1CV9sHo7Gq9xb+suw2yBMebFM=;
 b=mygQINdjOb5RMojcTMEEg/ey9xgaxwr7YzNek/bhXpoau2n29c7onCYy756n3DqWTt
 mh4Ls/dS0yaBlYldfJPElcEirBBKuIavahGFjSx7A39a7VR6nvM9SwKxurWUBM7ofxU8
 C+QbkQGBQ6JFzdHdy0XBdEu2hbSWjkAPO+0Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=EMlArogLUibXaoKnYk1CV9sHo7Gq9xb+suw2yBMebFM=;
 b=bVdd6kskw42mP7hqFflM656nHOze7N/CkSVy0EeDy8ikykf10e6ISaay7FPBS7saRK
 g7LKaX6TUTITKxJcFbAOktMmYEogZ0RuRBvezbX2e4XyNreGudlkQWE2t3RS3BpmDhRc
 WFiCZTz/GJvo8vQ/xM09Nkd6t0uCjpwUWRWR0J8Jj5uvc7iEt92RqhsoY7GlLDDfHLtH
 aMemsGKwKb94KxPIk5REwKD8IZoAHlkRIiIcREBE2ZHaoWdFmRn1nQvE8RkQfFocpLzA
 CTyGqRBDrvyE027zFL0cFkaCmu0pSxPtwIPLp+lB9wZK8Yjr6KkhBnE18t8DzpIbZf5u
 PeYA==
X-Gm-Message-State: ACgBeo04CJ/ARiQrrXYd4vFJXXxKCUMch1IRa2ZMm81OX9AWgQIOALOR
 yyiCUQcNXf299zVffCij7Rvudcss3H+4s/8ORKgTow==
X-Google-Smtp-Source: AA6agR5FlIp3DDeMeyc4cNSST6U1wRI8xO3EUzBAdfaktabONjxRDdspRTPz7FzXlNxwduPmlYo61+4TeRuP4CvY3GY=
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id
 g12-20020a056402428c00b0044082597a2bmr26695638edc.329.1663090198376; Tue, 13
 Sep 2022 10:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com>
 <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
 <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
 <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
In-Reply-To: <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 13 Sep 2022 22:59:47 +0530
Message-ID: <CAMty3ZAVV_dLnkBsgBCYgNbVNE-hMFiORqv7AxkDpwciJawtzw@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 3:34 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 06.09.2022 21:07, Jagan Teki wrote:
> > On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 02.09.2022 12:47, Marek Szyprowski wrote:
> >>> On 29.08.2022 20:40, Jagan Teki wrote:
> >>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
> >>>> various
> >>>> SoCs like Exynos, i.MX8M Mini/Nano.
> >>>>
> >>>> In order to access this DSI controller between various platform SoCs,
> >>>> the ideal way to incorporate this in the drm stack is via the drm bridge
> >>>> driver.
> >>>>
> >>>> This patch is trying to differentiate platform-specific and bridge
> >>>> driver
> >>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> >>>> glue code and samsung-dsim.c as a common bridge driver code.
> >>>>
> >>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
> >>>>     detach code along with conventional component_ops.
> >>>>
> >>>> - Samsung DSIM is a bridge driver which is common across all
> >>>> platforms and
> >>>>     the respective platform-specific glue will initialize at the end
> >>>> of the
> >>>>     probe. The platform-specific operations and other glue calls will
> >>>> invoke
> >>>>     on associate code areas.
> >>>>
> >>>> v4:
> >>>> * include Inki Dae in MAINTAINERS
> >>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> >>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
> >>> to wait until the DSI driver is probed and registered as component.
> >>>
> >>> I will show how to rework this the way it is done in
> >>> drivers/gpu/drm/exynos/exynos_dp.c and
> >>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
> >> I've finally had some time to implement such approach, see
> >> https://protect2.fireeye.com/v1/url?k=c5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375&q=1&e=489b94d4-84fb-408e-b679-a8d27acf2930&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked
> >>
> >> If you want me to send the patches against your v4 patchset, let me
> >> know, but imho my changes are much more readable after squashing to the
> >> original patches.
> >>
> >> Now the driver is fully multi-arch safe and ready for further
> >> extensions. I've removed the weak functions, reworked the way the
> >> plat_data is used (dropped the patch related to it) and restored
> >> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
> >> free to resend the above as v5 after testing on your hardware. At least
> >> it properly works now on all Exynos boards I have, both compiled into
> >> the kernel or as modules.
> > Thanks. I've seen the repo added on top of Dave patches - does it mean
> > these depends on Dave changes as well?
>
> Yes and no. My rework doesn't change anything with this dependency. It
> comes from my patch "drm: exynos: dsi: Restore proper bridge chain
> order" already included in your series (patch #1). Without it exynos-dsi
> driver hacks the list of bridges to ensure the order of pre_enable calls
> needed for proper operation. This works somehow with DSI panels on my
> test systems, but it has been reported that it doesn't work with a bit
> more complex display pipelines. Only that patch depends on the Dave's
> patches. If you remove it, you would need to adjust the code in the
> exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be
> better to keep it and merge Dave's patches together with dsi changes, as
> they are the first real client of it.

I think the Dave patches especially "drm/bridge: Introduce
pre_enable_upstream_first to alter bridge init order" seems not 100%
relevant to this series as they affect bridge chain call flow
globally. Having a separate series for that makes sense to me. I'm
sending v5 by excluding those parts.

Jagan.
