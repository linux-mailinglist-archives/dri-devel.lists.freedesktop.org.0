Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66506F49D3
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 20:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B2610E057;
	Tue,  2 May 2023 18:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2E910E057
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 18:40:53 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b60365f53so4815894b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 11:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683052852; x=1685644852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j9I/fY681zol8PqXhiDG/vchs4lKKtE1w7jrrREjGas=;
 b=YZt7oVm86x/C+bmILbyE8jSQ+gAV8VbWITg5sCCiZJebKRtlzUNGBdX7uqi07EeVNO
 5SciqNs64BH0ZuhcaepLxfP1PAgpYdqvU99XqBrZFcviFXEiUiNCuLZndVSciiTtMw21
 JkcINtBLQ1yRY6jEVcCKZUBPGsKkMWXr4zyc0Gn9hfLr8AImsMBO2I4g3hr6yoni5DvO
 ioA7dSYKp3JK1UTUw5Si5uUiK44T7cLYrxbZYunV4S9vveKzJ+U8cWmzl73k+6zt57X/
 k9kf+oUncbNiB469BJ+2ma1JmotO9+NvGmeUqKc4i3gs6p7JmukLTtx7om4PfG2tibFc
 OHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683052852; x=1685644852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j9I/fY681zol8PqXhiDG/vchs4lKKtE1w7jrrREjGas=;
 b=NdXFCT20g3186/lurQuej2Wcl7xmdgXtMLy7shUNR+UvINpmbpJNQv87gWEJ9m23r8
 Ff8g1ws3tI6UxbNWw9hDh41D7YSrbVf09xlCHMt5LgVsIbxzgrtEzT84XXpnL5cCniY7
 q3ulCIPsxPKjaNccwmwXw1WOx0ktJiZZtMO8Am0lpMFDJMPXqQ9I2PJtiPs4cgSfusOm
 gW8MVL9Jm58KzVe+MiswzFddXyJDM1dDTDsz+vXjJYtsJo/PiIi/jkC/W8C1CTp1C5iK
 wrbxJkSKobumTKf6ON5Fp37BlAr+yYiSBQJLFaWT3p/4UmNFO/2T7MMGv5TUJTwMdt3Q
 dLOQ==
X-Gm-Message-State: AC+VfDyRhvjvNL71oPzHpv4pBMVMzz9j/UMshx2xd4XB4/I3bzOFJiFS
 DUnsnvB0MBzv3JDDmuTZEY6DdECj4WaMc6jB+dg=
X-Google-Smtp-Source: ACHHUZ6PKezicQDj/QRPnP6gMfGXmHL2EzMCzyXxonGT4aSmO1mb09WzaNBULelXXyu5pc/A2moM1SAPoskVoe4fv4s=
X-Received: by 2002:a05:6a21:918c:b0:c6:c0c1:b1fe with SMTP id
 tp12-20020a056a21918c00b000c6c0c1b1femr18593162pzb.57.1683052852144; Tue, 02
 May 2023 11:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230502010811eucas1p1df7fcdcb3e3d363d39eb711f19618628@eucas1p1.samsung.com>
 <20230502010759.17282-1-aford173@gmail.com>
 <05fb14ea-1083-8efd-dad0-a0e707af8131@samsung.com>
In-Reply-To: <05fb14ea-1083-8efd-dad0-a0e707af8131@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 2 May 2023 13:40:41 -0500
Message-ID: <CAHCN7xKEUOWy=_ABdbwZzYURc-sD9HrR4LGXroBaWo82tHzZUw@mail.gmail.com>
Subject: Re: [PATCH V3 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 2, 2023 at 3:35=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 02.05.2023 03:07, Adam Ford wrote:
> > This series fixes the blanking pack size and the PMS calculation.  It t=
hen
> > adds support to allows the DSIM to dynamically DPHY clocks, and support
> > non-burst mode while allowing the removal of the hard-coded clock value=
s
> > for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> > burst-clock device tree entry when burst-mode isn't supported by connec=
ted
> > devices like an HDMI brige.  In that event, the HS clock is set to the =
value
> > requested by the bridge chip.
> >
> > This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should=
 work
> > on i.MX8M Mini as well.
> >
> > Adam Ford (6):
> >    drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
> >    drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
> >    drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
> >    drm: bridge: samsung-dsim: Dynamically configure DPHY timing
> >    drm: bridge: samsung-dsim: Support non-burst mode
> >    drm: bridge: samsung-dsim: Let blanking calcuation work in non-burst
> >      mode
> >
> > Lucas Stach (1):
> >    drm: bridge: samsung-dsim: fix blanking packet size calculation
> >
> >   drivers/gpu/drm/bridge/Kconfig        |   1 +
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 150 ++++++++++++++++++++++---=
-
> >   include/drm/bridge/samsung-dsim.h     |   5 +
> >   3 files changed, 136 insertions(+), 20 deletions(-)
>
> Works fine (=3D doesn't break) on Exynos.
>
Thank is great news.  Thank you for testing!

> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

adam
>
>
> >
> > ---
> > V3:  When checking if the bust-clock is present, only check for it
> >       in the device tree, and don't check the presence of the
> >       MIPI_DSI_MODE_VIDEO_BURST flag as it breaks an existing Exynos
> >       board.
> >
> >       Add a new patch to the series to select GENERIC_PHY_MIPI_DPHY in
> >       Kconfig otherwise the build breaks on the 32-bit Exynos.
> >
> >       Change vco_min variable name to min_freq
> >
> >       Added tested-by from Chen-Yu Tsai
> >
> > V2:  Instead of using my packet blanking calculation, this integrates
> >       on from Lucas Stach which gets modified later in the series to
> >       cache the value of the HS-clock instead of having to do the
> >       calucations again.
> >
> >       Instead of completely eliminating the PLL clock frequency from
> >       the device tree, this makes it optional to avoid breaking some
> >       Samsung devices.  When the samsung,pll-clock-frequency is not
> >       found, it reads the value of the clock named "sclk_mipi"
> >       This also maintains backwords compatibility with older device
> >       trees.
> >
> >       This also changes the DPHY calcuation from a Look-up table,
> >       a reverse engineered algorithm which uses
> >       phy_mipi_dphy_get_default_config to determine the standard
> >       nominal values and calculates the cycles necessary to update
> >       the DPHY timings accordingly.
> >
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
