Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D131965051D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 23:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5677610E046;
	Sun, 18 Dec 2022 22:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE4E10E1C5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 22:25:09 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id o8so2625915ilq.6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 14:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RJn2MDoU1A6B7Lh1bcBEabZYUhEnRMX2vIfDQug5IOE=;
 b=Wfqz0RGW1s2n8bYaCllv2CAZHC7aVJ5xeadi5FHlv9dAYKqxLwWgudLWUfoIDn+MwV
 rbcGsbPMM2boqBYoJkXW65r3mkvYbKIMM38oPqM98fnuXS2n0wVlsl8Bu+JNeWJ3oDf/
 5n9Az8E89p8tkGLzw4jQu3j3iq+h9kxkcQXfT/4+/itOPvKz6+Bj2LPGUHYCekBv3jJq
 Lh6/Sk+cTcUEt5maOyRighUaogJb6Z5C9/ssaL+Knl7zr2V7nNbqs4mjlCJT5sZBmzvY
 IDC0//m+VsFRKMHSccffGUoFCUMdKXjThDKVeSmdBVP1yHG6KpPbKVEFEP5z9MIT5y8R
 9RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJn2MDoU1A6B7Lh1bcBEabZYUhEnRMX2vIfDQug5IOE=;
 b=zXbMyu1W2vRYJJ48uKQns2b2br8AdBSTKR1Cp3K9n3FHtJU8rkBzwOok6yppX8+iB8
 K6igxX7sQPtpgseS7PajKFw4TzR0BX6asRgTGJxnuT+HtopJIgySNxnxLgQ1rSxsh2QK
 dPZQa+frZ/O0hxBeV0CBlhU5bE45uMrqfOdG/T9LHqrnPWoVZJZ+hBNdHwF+Ysic03XZ
 iNOkcG8RQsvv4/1BboQITzUiDrRx25o2+8WoCnLmTXWzAoHd2sBRQCq2knYYVpDod/lY
 3vGIgp5XybzAEOyScr4g062X0pNGjTUQOs4gkp05JzNHv9SbfBTRHeqI8bccnERVIF1V
 c3gA==
X-Gm-Message-State: ANoB5plKWKBP6o+SSMwCzjfCU43Xm+Wzysu2n45rq5KtqbqFydpXyvXL
 C3NAQaBgqL6IpNrUgu1p3Hot3mO8ShdCbubrdSU=
X-Google-Smtp-Source: AA0mqf4139X6E5YCfqSa1dFv3iMzX45chU56RHC5NfLSaaNKXCS6qvx2wXaFtKEqa6EaIpzDZStYGu6vri8b/1sOE0A=
X-Received: by 2002:a05:6e02:1d84:b0:304:ad4b:974a with SMTP id
 h4-20020a056e021d8400b00304ad4b974amr2379205ila.93.1671402308085; Sun, 18 Dec
 2022 14:25:08 -0800 (PST)
MIME-Version: 1.0
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
 <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
 <CAHCN7xJnepugHxVR2oCd6YyUDA=RED33PTYmsXQkZ-wa4xgHbg@mail.gmail.com>
 <8e5755da-db8c-7169-b140-d5f964f34a86@denx.de>
In-Reply-To: <8e5755da-db8c-7169-b140-d5f964f34a86@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 18 Dec 2022 16:24:57 -0600
Message-ID: <CAHCN7xL1qqhFkroBUswpSyTGUFo6B26rmp0zRL2K8ATT4HtUGg@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To: Marek Vasut <marex@denx.de>
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
Cc: Alexander Stein <Alexander.Stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 17, 2022 at 10:33 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/18/22 05:23, Adam Ford wrote:
> > On Sat, Dec 17, 2022 at 5:56 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/16/22 14:25, Alexander Stein wrote:
> >> Hi,
> >>
> >> [...]
> >>
> >>> Oh, nice, thanks for the pointer. When setting
> >>>> samsung,burst-clock-frequency = <668250000>;
> >>> in imx8mm.dtsi
> >>> I get a non-flickering display using 4 lanes. Although admittedly this is just
> >>> random guessing. I'm not sure which clock exactly has to be in the range
> >>> CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is configured for
> >>> 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
> >>>> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
> >>>> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250, esc_clk
> >>> = 16706250
> >>
> >> If I recall it right, minimum PLL frequency is:
> >>
> >> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
> >>
> >> the link frequency is then
> >>
> >> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)
> >>
> >> So DSI83 should be in the range of 80..85 MHz input clock if I calculate
> >> this right. Can you check what is the value of mode->clock, the
> >> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
> >> sm65dsi83_get_dsi_range() ?
> >>
> >>> AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from DT
> >>> properties, while SN65DSI84 is using display mode and number of lanes.
> >>>
> >>> Is it expected that the DSIM PLL frequencies are set in DT for a specific
> >>> bridge/display setup?
> >>
> >> No, there should be negotiation between the host and bridge/panel, I
> >> tried to propose two variants, but they were all rejected.
> >
> > For one of Jagan's previous revisions, I added some code to let the
> > PHY auto adjust the frequencies instead of being fixed.  NXP had this
> > in their downstream kernel, but with this patch and another, I was
> > able to set a variety of pixel clocks from my HDMI monitor and my
> > DSI83. I haven't had time to re-base my work on Jagan's latest work,
> > but you can link to the patch I did for the older stuff here:
> >
> > https://github.com/aford173/linux/commit/e845274b0f22ba3b24813ffd6bb3cb88ab4b67e4
> > and
> > https://github.com/aford173/linux/commit/3f90057eb608f96d106029ef639813475241936f
> >
> > I've been traveling a lot lately, so I haven't had time to evaluate
> > his series, but I hope to get something like those re-based once the
> > DSI stuff has been accepted.
>
> I have these two attempts, both rejected:
>
> https://patchwork.freedesktop.org/patch/475207/
> https://patchwork.freedesktop.org/patch/496049/

I have some patches re-based to Jagan's latest branch.  It doesn't
impact any drivers other than the new samsung-dsim driver, and it
doesn't touch any of the drm helper functions either.  It adjusts hs
clock based on the connected device.  I am not sure what the impact
will have on the attached Exynos devices, so I am expecting some
iterations.  Right now it's working with my DSI83 chip, but I need to
get it working with my adv7535 part as well.  On the older branch, I
was able to sync the ad7535 with a variety of resolutions using
different pixel clock rates.

Once I get it working again with my adv7535 and cleaned up, I'll
submit the patches to the drm group, and I'll CC you, Jagan and Marek
Szyprowski with a reference to Jagan's series so people wanting to try
it can apply it to his branch.

adam
