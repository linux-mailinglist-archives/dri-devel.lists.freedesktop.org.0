Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06878BB56
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 01:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E3910E369;
	Mon, 28 Aug 2023 23:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C90F10E369
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 23:07:20 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bd0425ad4fso2767582a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 16:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693264039; x=1693868839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dJsPDY1wc6Rd90H+LVb1zFytXCquhEUSx6/I+3/14g=;
 b=Oa2ZwoJwnZCfWBcxUj8ZCbNQk7C17nQ0scxd1+LdnO66zqlsvw1hi2HnyeJc2N+Mii
 +eOaWAtYgQGsPjDOT2xfhzxjYA5WZxr1RJBFsmE1wc8f1uR8oHx50Xfno9iZ1wnIZSW3
 1bN2Vma4GV67WOEqTA0qO9knJ1EbZ25JhzTidUC2kccd5kVli6CxjqgsHMCfWdCrO/7I
 SpJihhZTkC2HYWBa9K959ihKSIV0JTPyZsxx1J4D8hh9CMg8ql74sBlNg09/6AIvmQ5O
 zAHLf9gQThiyg5+vtvOE4DHfCjz0mfg4mt8qL+lcWIYF7ty+/TZj/mthR0ik75+geVTl
 5VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693264039; x=1693868839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dJsPDY1wc6Rd90H+LVb1zFytXCquhEUSx6/I+3/14g=;
 b=kTo0BPSuAFMc91FP4vWI8KO+dgpZfVjMnXL5PbpR90OfgwNY9M8ZmnsXD55e9hMPRS
 +TDNFbHSAMeq2oXvm82LntUBt9v3VGcomf7jFGJcsNopZKXXW03AM+AzMJJ6P9i1Ejba
 eFsR9d0wCb9ZVHBBHRGxRYE/VAN6uYHxsmQotmQMoul4V293FYJteU4HqkfkCsUMi4Ou
 SPtRC1KmkDgHYQHWDF3uwLAbQQGb6An/8mGF5Izr/HLwH85GsIcxpueG5susPU6Jf09n
 vo+CSOgoeDzsGI86w/Gp7XiK+cbXb11pc0EwjSc8XhwozZEfFcKLMSinzGE0cseA60Iu
 fAhg==
X-Gm-Message-State: AOJu0YxU8A4wVC9PnHHUEGlrRhHsA91xYGI627Xpfu2kvjd0H3V56r+D
 97X96Q6Mfc9kL0lF4C28sltG3WHTX9oWtjEYpSU=
X-Google-Smtp-Source: AGHT+IFYQPU3iSnzJWyMqBwsehjvz22SJJcmHsL8RCq/wY70zd2/tTPuoEQTnEgkj6+LXbBIl96tEeN3UVVyKr7sF9Y=
X-Received: by 2002:a05:6871:6a1:b0:1b7:4521:14b6 with SMTP id
 l33-20020a05687106a100b001b7452114b6mr13680225oao.5.1693264039496; Mon, 28
 Aug 2023 16:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <CAHCN7xKasndWCkvU31Lqftty0Y1aDD370WJhaZio+_E4oajLrg@mail.gmail.com>
In-Reply-To: <CAHCN7xKasndWCkvU31Lqftty0Y1aDD370WJhaZio+_E4oajLrg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 28 Aug 2023 18:07:08 -0500
Message-ID: <CAHCN7x+jhW9a+v6pc1bNUjj59gZQWvCT4TLSUZ6jKouGNUZasw@mail.gmail.com>
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

On Mon, Aug 28, 2023 at 11:13=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Mon, Aug 28, 2023 at 10:59=E2=80=AFAM Michael Tretter
> <m.tretter@pengutronix.de> wrote:
> >
> > I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
> > which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
> > modes were working, but in many modes my monitor stayed dark.
> >
> > This series fixes the Samsung DSIM bridge driver to bring up a few more
> > modes:
> >
> > The driver read the rate of the PLL ref clock only during probe.
> > However, if the clock is re-parented to the VIDEO_PLL, changes to the
> > pixel clock have an effect on the PLL ref clock. Therefore, the driver
> > must read and potentially update the PLL ref clock on every modeset.
> >
> > I also found that the rounding mode of the porches and active area has
> > an effect on the working modes. If the driver rounds up instead of
> > rounding down and be calculates them in Hz instead of kHz, more modes
> > start to work.
> >
> > The following table shows the modes that were working in my test withou=
t
> > this patch set and the modes that are working now:
> >
> > |            Mode | Before | Now |
> > | 1920x1080-60.00 | X      | X   |
> > | 1920x1080-59.94 |        | X   |
> > | 1920x1080-50.00 |        | X   |
> > | 1920x1080-30.00 |        | X   |
> > | 1920x1080-29.97 |        | X   |
> > | 1920x1080-25.00 |        | X   |
> > | 1920x1080-24.00 |        |     |
> > | 1920x1080-23.98 |        |     |
> > | 1680x1050-59.88 |        | X   |
> > | 1280x1024-75.03 | X      | X   |
> > | 1280x1024-60.02 | X      | X   |
> > |  1200x960-59.99 |        | X   |
> > |  1152x864-75.00 | X      | X   |
> > |  1280x720-60.00 |        |     |
> > |  1280x720-59.94 |        |     |
> > |  1280x720-50.00 |        | X   |
> > |  1024x768-75.03 |        | X   |
> > |  1024x768-60.00 |        | X   |
> > |   800x600-75.00 | X      | X   |
> > |   800x600-60.32 | X      | X   |
> > |   720x576-50.00 | X      | X   |
> > |   720x480-60.00 |        |     |
> > |   720x480-59.94 | X      |     |
> > |   640x480-75.00 | X      | X   |
> > |   640x480-60.00 |        | X   |
> > |   640x480-59.94 |        | X   |
> > |   720x400-70.08 |        |     |
> >
>
> Nice!
>
> > Interestingly, the 720x480-59.94 mode stopped working. However, I am
> > able to bring up the 720x480 modes by manually hacking the active area
> > (hsa) to 40 and carefully adjusting the clocks, but something still
> > seems to be off.
>
> Checkout my
>
> branch: https://github.com/aford173/linux/commit/183cf6d154afeb9b0300500b=
09d7b8ec53047a12
>
> I found that certain resolutions don't properly round, and it seemed
> to be related to the size of HFP.  HFP of 110 when divded between 4
> lanes, required a round-up, but then I had to recalculate the rest of
> the horizontal timings to compensate.
>
> I was going to push that as an RFC, but I will investigate your patch
> series first.  With my small rounding correction, I am able to get
> 720x480 and 720p on my imx8mp, but not my mini/nano, so I am hoping
> your patch series fixes that issue for me.
>
> >
> > Unfortunately, a few more modes are still not working at all. The NXP
> > downstream kernel has some quirks to handle some of the modes especiall=
y
> > wrt. to the porches, but I cannot figure out, what the driver should
> > actually do in these cases. Maybe there is still an error in the
> > calculation of the porches and someone at NXP can chime in.
>
> Hopefully the comment in my above patch explains how the calculation
> is corrected and adjusted to get some of the missing resolutions.

I tested my above patch and it works to sync 720p-60 on my imx8mp, but
it doesn't seem to sync on my imx8mm using the same monitor and HDMI
cable.  I don't have a DSI analyzer, so I might still send out a
modified version of my patch as an RFC once this gets approved.

adam
>
> > Michael
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>
> I'll try to reivew this week and respond with my feedback.
>
> adam
>
> > ---
> > Marco Felsch (1):
> >       drm/bridge: samsung-dsim: add more mipi-dsi device debug informat=
ion
> >
> > Michael Tretter (4):
> >       drm/bridge: samsung-dsim: reread ref clock before configuring PLL
> >       drm/bridge: samsung-dsim: update PLL reference clock
> >       drm/bridge: samsung-dsim: adjust porches by rounding up
> >       drm/bridge: samsung-dsim: calculate porches in Hz
> >
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 42 +++++++++++++++++++++++++--=
--------
> >  include/drm/bridge/samsung-dsim.h     |  1 +
> >  2 files changed, 31 insertions(+), 12 deletions(-)
> > ---
> > base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> > change-id: 20230818-samsung-dsim-42346444bce5
> >
> > Best regards,
> > --
> > Michael Tretter <m.tretter@pengutronix.de>
> >
