Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2E5AF432
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCE510E13D;
	Tue,  6 Sep 2022 19:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31D10E736
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:07:29 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id e18so16423389edj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LMW+jVRAUtxo0G5/AqL3ArJNzArMc0GdnLOnyNW830Y=;
 b=BJe01478kvZ4x9YS2hi1J8b0dF6VrcUHu60BeTRLk7dNMu4+hCwvHGgzYECpi6sYrE
 NRBp92Wprr8NLudaQWAzD4tXggjB8RyBJ78j048KxGIy4uyBc38N16WCrmtU5HIMZv+6
 cMebJz8zfq66aYV8UvRM6f0BlK7P+g+S2+Wa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LMW+jVRAUtxo0G5/AqL3ArJNzArMc0GdnLOnyNW830Y=;
 b=HZ6HVaAJvw8weOrXIWgyBAGZ+mQiLTLCJG5Uv5S/Cj7ieqfR7L+PFZjtzWas+KvYoS
 ViTRCjk7t4zRGongOmzbYkOMUKjioux+Pp4uZAszFJV77mZE1vDBo4q1ognGCoc3dJnK
 hQY/Dd9rLuCw4q1/2u73tODeJWOkGTA8AYe0keHcdEk6Tb0yEnsHhzs16+vFcMYBct1J
 rx0Fr+8BAjnYk1J6T5L9DHtk+sDRUn8ho89GlEYd+QduVlKivLyGofYd/sHH9kTG+7u8
 ej/po46BsLiQCUEbjyE85ccIZEGFlz2oOxikY40sE9gP94mUJ0mQtX3ZnU5UlEegZCGk
 B02Q==
X-Gm-Message-State: ACgBeo2HJFn6gKC9aN/j3GXmKH/WjBEOttmQUYYtoFQm8GehUQl0zTfB
 W+C9z2BQOMU8PFkYV6jINFER/AOnvwvNpTC8473cyw==
X-Google-Smtp-Source: AA6agR7YChizRCzP04sB2ovdCtbQoLg25OAxC/J2Huz/9j7HTYrEBSOd8/xgRyQaVJ/EPOqsfoRRDLvNGf+zhrvNa9g=
X-Received: by 2002:aa7:d883:0:b0:44e:bbbe:d661 with SMTP id
 u3-20020aa7d883000000b0044ebbbed661mr76210edq.248.1662491247794; Tue, 06 Sep
 2022 12:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com>
 <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
In-Reply-To: <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 7 Sep 2022 00:37:16 +0530
Message-ID: <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
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

On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi All,
>
> On 02.09.2022 12:47, Marek Szyprowski wrote:
> > On 29.08.2022 20:40, Jagan Teki wrote:
> >> Samsung MIPI DSIM controller is common DSI IP that can be used in
> >> various
> >> SoCs like Exynos, i.MX8M Mini/Nano.
> >>
> >> In order to access this DSI controller between various platform SoCs,
> >> the ideal way to incorporate this in the drm stack is via the drm bridge
> >> driver.
> >>
> >> This patch is trying to differentiate platform-specific and bridge
> >> driver
> >> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> >> glue code and samsung-dsim.c as a common bridge driver code.
> >>
> >> - Exynos specific glue code is exynos specific te_irq, host_attach, and
> >>    detach code along with conventional component_ops.
> >>
> >> - Samsung DSIM is a bridge driver which is common across all
> >> platforms and
> >>    the respective platform-specific glue will initialize at the end
> >> of the
> >>    probe. The platform-specific operations and other glue calls will
> >> invoke
> >>    on associate code areas.
> >>
> >> v4:
> >> * include Inki Dae in MAINTAINERS
> >> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> >
> > This breaks Exynos DRM completely as the Exynos DRM driver is not able
> > to wait until the DSI driver is probed and registered as component.
> >
> > I will show how to rework this the way it is done in
> > drivers/gpu/drm/exynos/exynos_dp.c and
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
>
> I've finally had some time to implement such approach, see
> https://github.com/mszyprow/linux/tree/v6.0-dsi-v4-reworked
>
> If you want me to send the patches against your v4 patchset, let me
> know, but imho my changes are much more readable after squashing to the
> original patches.
>
> Now the driver is fully multi-arch safe and ready for further
> extensions. I've removed the weak functions, reworked the way the
> plat_data is used (dropped the patch related to it) and restored
> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
> free to resend the above as v5 after testing on your hardware. At least
> it properly works now on all Exynos boards I have, both compiled into
> the kernel or as modules.

Thanks. I've seen the repo added on top of Dave patches - does it mean
these depends on Dave changes as well?

Jagan.
