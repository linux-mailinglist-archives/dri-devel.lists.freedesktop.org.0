Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DE44DED2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 01:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A156E3E3;
	Fri, 12 Nov 2021 00:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06C86E3E3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 00:10:40 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id z6so6963806pfe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8KXF8FkiqJpTMtAZKbLKGcHP0MiYwmddcLbIP9o/gAg=;
 b=S0MEwcvzo0kDvuMdql/chi/GRlx3A9EM4kvgwuQdU4PGU3al2NBBlBf+OmPRB5/xga
 jcVur3qnt8JLouEPJzI6lTmgOMFxtRHaWi46D4x2uPkf8GiOnIqQADaGvqvtoGR2TT6Q
 e3dsiXzHqUzOH+P/3qCOjmcX+4/+AanENhnVlx8RlkknZ8Q2b/MOnsJsKjg2ebEgoGC5
 wUNrTN3Iv1UT1zSTJVp2u92IdwMNJLentFc8Qex5h6nNtZcXcZYZeUAPuBmAaWJ8CnsF
 RpnVCLD4VgKCBQU9Z7j8sTHOv95S73zaRgeWwPFyKCe3Tutuduuvi+SJorgaPjw3WVfO
 OoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KXF8FkiqJpTMtAZKbLKGcHP0MiYwmddcLbIP9o/gAg=;
 b=DhOZW+hhBWb8RQzQawytpQEP0x8VOtKrwqpIFstjdLpzJZQ+3Au7N99oiJHK9pogIk
 6vhGiDVADEE54veLkhcx9fa+1o67dDGP+bcM4NOfj3/DC1zBCrg2xiXEugPWKaEe6JCy
 5ArFqB0TLsVu4q3TXyTb5HC4BoFo7BIfJUrm0A8JQ5DkBTJInN7YkqEbYUSYgu4a0uTB
 y4XfR7KqR9uR2QkCpI4UTbQF2z0vKu50R8zjjOSGxbUtfgNGf4TE3f2ZmQxJqsIen6iM
 mZv/pltJsOCmvGijTGDyRrWol8CdV5WM9H1u1vVsOQH3uCB5m5yv58QrTV1Fq+Qp6JRt
 4fxw==
X-Gm-Message-State: AOAM533nx46UFjJSrGxWWd4c2Zef9xKRbsbX9j1rxSBGB3xxSShDVt4I
 8+sVau+KFkpqWawVribPgxkS56e2fTAjsWlP5YFw2w==
X-Google-Smtp-Source: ABdhPJxIeywZq8cs7uV8LCKfJ34pw/rT4lPVohVhJP0QHbUNNCvaH6/v1ecdcmi1gDfgMIl/QnEVl7psKs9hJSGQiwE=
X-Received: by 2002:a05:6a00:22c3:b0:4a0:605:6446 with SMTP id
 f3-20020a056a0022c300b004a006056446mr10157120pfj.27.1636675840355; Thu, 11
 Nov 2021 16:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
In-Reply-To: <20211111101456.584061-1-jagan@amarulasolutions.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 11 Nov 2021 16:10:29 -0800
Message-ID: <CAJ+vNU2P3rosfJVEDsU4xZWCn40w-yEGrsZiD7YcJ0Z-snH6kA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] arm64: imx8mm: Add MIPI DSI support
To: Jagan Teki <jagan@amarulasolutions.com>, Marek Vasut <marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 2:15 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series support MIPI DSI on i.MX8MM.
>
> The DSIM bridge still need to work to make it compatible for
> exynos drm dsi hardware block.
>
> This series work directly on to of linux-next with recent
> dispmix-blk-ctrl changes.
>

Jagan,

Thanks - I was able to get this series working using the set of
exynos/drm patches from Michael submitted back in 2020-09-11:
https://patchwork.kernel.org/project/dri-devel/list/?series=347439&archive=both&state=*

> Tested on i.Core MX8M Mini SoM with EDIMM2.2 and CTOUCH2
> Carrier boards.
>
> Required changes:
> 1. DSIM driver
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210704090230.26489-1-jagan@amarulasolutions.com/

This exynos/drm RFC series you posted back in July was where I
recalled the discussion about if the exynos driver could be split up
vs duplicating parts of it in a separate driver.

There were also some comments about this series. Can you address those
comments, rebase and resend?

I have not been able to get my hardware to work with this series yet
and am still debugging that (currently crashing in
samsung_dsim_host_attach)

> 2. DPHY change
> https://www.spinics.net/lists/devicetree/msg381691.html

This was originally from Marek submitted on Oct 3 2020: [PATCH] phy:
exynos-mipi-video: Add support for NXP i.MX8MM

This one seems to have been acked but never got picked up for some reason.

Marek, can you add the tags and re-submit?

> 3. Bus format fix
> https://github.com/openedev/linux/commit/6ca9781ed53ea75e26341dd57250e63794638b20
>

Jagan, can you submit this?

Best regards,

Tim


> Complete repo:
> https://github.com/openedev/linux/commits/111021-imx8mm-dsim
>
> Any inputs?
> Jagan.
>
> Jagan Teki (3):
>   arm64: dts: imx8mm: Add eLCDIF node support
>   arm64: dts: imx8mm: Add MIPI DSI pipeline
>   arm64: dts: imx8mm-icore: Enable LVDS panel for EDIMM2.2
>
>  .../freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 85 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 74 ++++++++++++++++
>  2 files changed, 159 insertions(+)
>
> --
> 2.25.1
>
