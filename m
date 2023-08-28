Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4D78B528
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 18:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695DB10E313;
	Mon, 28 Aug 2023 16:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A3810E313
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 16:13:25 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so8424725ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 09:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693239204; x=1693844004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3oQ/TCI9qAhTdz1RnC/RmkKq0FRQb+BPnyluK4WRQ50=;
 b=Kmcrk3aH0HjSMgWDmTHoTFhaDyI2hXAnoy97ZjirBfh3VI1BDVvSuiTnk6SZv0gb91
 730hKvS5W4d9EB60QxjdzMMBYM1ZEWzZcrS3Kkv9TD2fpp0mqqsRyyjQpjc08NPx8NZE
 1NINecCOCTx55Mp867L2PWJ3HbNx9jh3aTg1cCjcEci55sf325MmXofUEA8zRrK8Yiq2
 TH5/gNH55uI3bD9dFcCq7aFJ6+LuMlEMX95FK5nPzEZ/NMVK6S0hV/+gjHPql6JCKhPF
 NhCLnU368McvQGVWQcHGt3nREYikRUW85sR7NfrSCNCb9W5H9rmr97hjWvye/R94E4nh
 IC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693239204; x=1693844004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oQ/TCI9qAhTdz1RnC/RmkKq0FRQb+BPnyluK4WRQ50=;
 b=RNahjV6OCqd8X46bgLl3f/vDSru477CCGptUm1t+R0wsCQZDv/+Ex0MjmBN6ELj5ef
 2kfKyP390obFtFl0q79gr9849ssXLM2U9S6s4c3dBxa/ftbvA12DvCmVzqcjRvGDv5Gq
 k8vuz9UnnepdkEmbDdrClL+esvQwGaEpwwZ3AzKfUX4EXaE8l18S60IOdu4NDqvuGSAF
 YEgFDngpCs2Jp52w//GJgucvZCnuS04bAbQNUVNg+eQdPkoCLW581WdCRx23sQwebF8U
 ggXSkpX9OFd4jul2xVjR6wEtQlTlw6N+Kd+ub0yG5iftIWucNvCb4N+XjQGOAz0nbeUc
 BXFw==
X-Gm-Message-State: AOJu0YxtaI3pIecg6YTXraSgUZx9xHuaoo/p7OIti5Dz3aEYtc+USOPS
 x4anlwQBRJgrDAY9+rnu/KuKbiE9elHo3iVBIDs=
X-Google-Smtp-Source: AGHT+IE9WVbZFA6VKXRmZQwd4Bsd5eKMBQnzQdi9z46AyWjOq/Y9acDDQWCRhGYzvWCIA4p+5VK3oj+YN+T+bFwlSgU=
X-Received: by 2002:a17:90b:124a:b0:26d:1f85:556 with SMTP id
 gx10-20020a17090b124a00b0026d1f850556mr20280538pjb.45.1693239204465; Mon, 28
 Aug 2023 09:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 28 Aug 2023 11:13:13 -0500
Message-ID: <CAHCN7xKasndWCkvU31Lqftty0Y1aDD370WJhaZio+_E4oajLrg@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
To: Michael Tretter <m.tretter@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 10:59=E2=80=AFAM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
> which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
> modes were working, but in many modes my monitor stayed dark.
>
> This series fixes the Samsung DSIM bridge driver to bring up a few more
> modes:
>
> The driver read the rate of the PLL ref clock only during probe.
> However, if the clock is re-parented to the VIDEO_PLL, changes to the
> pixel clock have an effect on the PLL ref clock. Therefore, the driver
> must read and potentially update the PLL ref clock on every modeset.
>
> I also found that the rounding mode of the porches and active area has
> an effect on the working modes. If the driver rounds up instead of
> rounding down and be calculates them in Hz instead of kHz, more modes
> start to work.
>
> The following table shows the modes that were working in my test without
> this patch set and the modes that are working now:
>
> |            Mode | Before | Now |
> | 1920x1080-60.00 | X      | X   |
> | 1920x1080-59.94 |        | X   |
> | 1920x1080-50.00 |        | X   |
> | 1920x1080-30.00 |        | X   |
> | 1920x1080-29.97 |        | X   |
> | 1920x1080-25.00 |        | X   |
> | 1920x1080-24.00 |        |     |
> | 1920x1080-23.98 |        |     |
> | 1680x1050-59.88 |        | X   |
> | 1280x1024-75.03 | X      | X   |
> | 1280x1024-60.02 | X      | X   |
> |  1200x960-59.99 |        | X   |
> |  1152x864-75.00 | X      | X   |
> |  1280x720-60.00 |        |     |
> |  1280x720-59.94 |        |     |
> |  1280x720-50.00 |        | X   |
> |  1024x768-75.03 |        | X   |
> |  1024x768-60.00 |        | X   |
> |   800x600-75.00 | X      | X   |
> |   800x600-60.32 | X      | X   |
> |   720x576-50.00 | X      | X   |
> |   720x480-60.00 |        |     |
> |   720x480-59.94 | X      |     |
> |   640x480-75.00 | X      | X   |
> |   640x480-60.00 |        | X   |
> |   640x480-59.94 |        | X   |
> |   720x400-70.08 |        |     |
>

Nice!

> Interestingly, the 720x480-59.94 mode stopped working. However, I am
> able to bring up the 720x480 modes by manually hacking the active area
> (hsa) to 40 and carefully adjusting the clocks, but something still
> seems to be off.

Checkout my

branch: https://github.com/aford173/linux/commit/183cf6d154afeb9b0300500b09=
d7b8ec53047a12

I found that certain resolutions don't properly round, and it seemed
to be related to the size of HFP.  HFP of 110 when divded between 4
lanes, required a round-up, but then I had to recalculate the rest of
the horizontal timings to compensate.

I was going to push that as an RFC, but I will investigate your patch
series first.  With my small rounding correction, I am able to get
720x480 and 720p on my imx8mp, but not my mini/nano, so I am hoping
your patch series fixes that issue for me.

>
> Unfortunately, a few more modes are still not working at all. The NXP
> downstream kernel has some quirks to handle some of the modes especially
> wrt. to the porches, but I cannot figure out, what the driver should
> actually do in these cases. Maybe there is still an error in the
> calculation of the porches and someone at NXP can chime in.

Hopefully the comment in my above patch explains how the calculation
is corrected and adjusted to get some of the missing resolutions.

> Michael
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

I'll try to reivew this week and respond with my feedback.

adam

> ---
> Marco Felsch (1):
>       drm/bridge: samsung-dsim: add more mipi-dsi device debug informatio=
n
>
> Michael Tretter (4):
>       drm/bridge: samsung-dsim: reread ref clock before configuring PLL
>       drm/bridge: samsung-dsim: update PLL reference clock
>       drm/bridge: samsung-dsim: adjust porches by rounding up
>       drm/bridge: samsung-dsim: calculate porches in Hz
>
>  drivers/gpu/drm/bridge/samsung-dsim.c | 42 +++++++++++++++++++++++++----=
------
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 31 insertions(+), 12 deletions(-)
> ---
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> change-id: 20230818-samsung-dsim-42346444bce5
>
> Best regards,
> --
> Michael Tretter <m.tretter@pengutronix.de>
>
