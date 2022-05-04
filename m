Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B1519B66
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C6A10FE43;
	Wed,  4 May 2022 09:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E2D10FE39
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:16:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ba17so996535edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=da581RkMgZGvhZwLWVEWYBqPGlo/ZQ+aiTnsSHDQZvg=;
 b=VUu1PeIZgsLWQZcfyMt3xaF/2RYXrlQGuhDH4eIiWDqVVEoCEJv7VFKQmEjhGWnr0j
 VwVv8xFU6m+oPpjMrEE1y//U9kJjmLj3lJ2ueVmrDm9Rfibh+aLxLljdfCS3GXnEmU0B
 08c6HRmDCXtvWoohmXgdEKKJ2jkxHi/f4Qf5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=da581RkMgZGvhZwLWVEWYBqPGlo/ZQ+aiTnsSHDQZvg=;
 b=ozEndE7Uvb7WlkGt/8W3nM9ddj6FEFBqK4FtqSODBu52Kx1BF82w2set534Y9DdVG2
 tf2CXzGczFBjvSYFDtg1q3xC8vvEmhPu8ROHCnfXK9hEzhZ049Wo9dEx3qhoAZVeieJL
 V6Z2/Aqj28ZSqLYt+uEyhnTE51lge3PugZDdmW/DG9D2A/O8F6mxK2hGW9lkxGWgyWOI
 WVH/h5ktHV6AqYPx0jGRH3BNmCRYyI0zilWk5SC/xMgJpT6QTK/CvFjrG04QlKTsZ49/
 EZv6T5OdUraToWKaFRT3qXfanh3fILp3IZMajTLUZt1LDTYlPIrqjzZFBMOL7YYNgXQT
 e5tg==
X-Gm-Message-State: AOAM530yo6j0DnzAF/IuJFDjLgJpDKcjc4BqREarofC8GiD9VUnSW4Qb
 8FzPAwWs0ZJzST80BRmt7w3wA/oS+Zg4dS9JYLTAkw==
X-Google-Smtp-Source: ABdhPJxPmefC2PO6Pp4JkUx8X+XPLZJi7VWWpgAVjdNtNFSLnP08fQm8AMIc2msy6Dv26Ew10hHVsT3InC1MV+jFK4g=
X-Received: by 2002:a05:6402:254a:b0:427:c112:6df9 with SMTP id
 l10-20020a056402254a00b00427c1126df9mr14754378edb.367.1651655790467; Wed, 04
 May 2022 02:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <CGME20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16@eucas1p2.samsung.com>
 <20220408162108.184583-2-jagan@amarulasolutions.com>
 <0146abe6-c588-820c-09f4-b12de2e734ac@samsung.com>
In-Reply-To: <0146abe6-c588-820c-09f4-b12de2e734ac@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 4 May 2022 14:46:19 +0530
Message-ID: <CAMty3ZBN=SPZze6n8=0hHPRc0jw6U+UJ7Ejv+8Bg3bkvwdY46w@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm: bridge: Add Samsung DSIM bridge driver
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Tue, Apr 12, 2022 at 3:15 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 08.04.2022 18:20, Jagan Teki wrote:
> > Samsung MIPI DSIM controller is common DSI IP that can be used in various
> > SoCs like Exynos, i.MX8M Mini/Nano.
> >
> > In order to access this DSI controller between various platform SoCs, the
> > ideal way to incorporate this in the drm stack is via the drm bridge driver.
> >
> > This patch is trying to differentiate platform-specific and bridge driver
> > code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> > glue code and samsung-dsim.c as a common bridge driver code.
> >
> > - Exynos specific glue code is exynos specific te_irq, host_attach, and
> >    detach code along with conventional component_ops.
> >
> > - Samsung DSIM is a bridge driver which is common across all platforms and
> >    the respective platform-specific glue will initialize at the end of the
> >    probe. The platform-specific operations and other glue calls will invoke
> >    on associate code areas.
> >
> > Updated MAINTAINERS file for this bridge with exynos drm maintainers along
> > with Andrzej as he is the original author.
> >
> > Tomasz Figa has been not included in MAINTAINERS as he is not available via
> > samsung.com.
> >
> > v1:
> > * Don't maintain component_ops in bridge driver
> > * Don't maintain platform glue code in bridge driver
> > * Add platform-specific glue code and make a common bridge
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Well, it took me a while to make this working on Exynos. I'm not really
> happy of the design, although I didn't spent much time thinking how to
> improve it and clarify some ambiguities. It doesn't even look that one
> has compiled the Exynos code after this conversion.

Well, I was successfully built the each commit on exynos and non-exynos

>
> The following changes are needed to get it to the same working state as
> before this patch (the next patches however break it even further):
>
> commit e358ee6239305744062713c5aa2e8d44f740b81a (HEAD)
> Author: Marek Szyprowski <m.szyprowski@samsung.com>
> Date:   Tue Apr 12 11:30:26 2022 +0200
>
>      drm: exynos: dsi: fixup driver after conversion

What exactly it is fixing the existing conversion, could you point that out?

Jagan.
