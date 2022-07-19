Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4557A1BC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE36113E6D;
	Tue, 19 Jul 2022 14:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2748510F123
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 14:36:32 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id z23so27561734eju.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQr+4s+FhzoxECxm7BqHn1h9tuohSElbeBWEv9A2R1E=;
 b=VIXDfSJGAosBHSf5LOrQEaBEpPay5nzfpNe/RLOvdqqLLHR1XMhWra9AJ3FjENEPbU
 U+R5Vptuv/Y21mo/LCekZbMJGdsFC6pBgGUKMijUwMl0hPFTRMg0IPusP+IgvOATouL0
 1HlBbIyenG1mdsUjK++AQp5ejnxEeJdEZIrXYF5FYk58YfKQmeBJwli0/j7R3y4CJSow
 knOVLLoEJMVtSSWOo2k42fFKy5aldU/cW1eUAoU8wIiStSlayyRXbBCJvFZqalUo9+HK
 sQmaGOEVIeItYhfjCThuUj808s0d8HAisE1dwA12trx3PWnFJLVCrbEaJBN61S4nMkf6
 fZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQr+4s+FhzoxECxm7BqHn1h9tuohSElbeBWEv9A2R1E=;
 b=kA7yHx0gfrRG8moCWbb7KXQqJFPbF/kVNPRYSt8GsWrbtoUOGZaDvhREQ/h71/4V3J
 NJWWDL7yt+x6zW6haxlFjUMq9fsk/qt3QYahV3MkU45WL1/Jq1eNEYUIIVmWQk895972
 zvTyCWN/420wZ1JXghgYVPheCGqAD9LuYMkGZBuIMFEnPBzD9DWre1WBc9gf95q1ZTy7
 EjMnlJWNUYLPitVI8U92+Ivulu0JOCMK99d3ggNT7oad/nVH1G+qRu69OCkr+ayTdTtv
 7h+3pdb9Gc8B3BO9fa7CxwRzEfHhvgRJS+8NFh3DEXurepwzYrXHS++UvFoPuOogRNju
 2XrA==
X-Gm-Message-State: AJIora+QPA1FgVcaUYisMmHMZ1kz6aE5H6Rr1GXM5d3J1uCq72zMVaNb
 AqmIQd7Kk9H1JwPRZoETHaDG14Jsxdisjdb3y9dGiTRufTY=
X-Google-Smtp-Source: AGRyM1vvl457QfeQVl6C03fhf1D5amw3dcWwcoqjW52xTWVFAl9GzPiKMwBSgti6G8OgbsEUu37AMjDTQqQZcL9wwA4=
X-Received: by 2002:a17:907:97c2:b0:72b:9ec4:9a60 with SMTP id
 js2-20020a17090797c200b0072b9ec49a60mr29970311ejc.154.1658241390643; Tue, 19
 Jul 2022 07:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <7d3bcbaa027422018b956507d5ac5d19422dc892.camel@pengutronix.de>
In-Reply-To: <7d3bcbaa027422018b956507d5ac5d19422dc892.camel@pengutronix.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:36:13 +0100
Message-ID: <CAPY8ntD-rP4LdmP91KHEPFDFU4wY4f=SSs__E2MbG2v-+2orhA@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

On Fri, 10 Jun 2022 at 08:52, Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi,
>
> Am Mittwoch, dem 11.05.2022 um 16:58 +0200 schrieb Marek Szyprowski:
> > Hi Dave,
> >
> > On 05.04.2022 13:43, Dave Stevenson wrote:
> > > On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> > > <dave.stevenson@raspberrypi.com>  wrote:
> > > > On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> > > > <dave.stevenson@raspberrypi.com>  wrote:
> > > > > Hi All
> > > > A gentle ping on this series. Any comments on the approach?
> > > > Thanks.
> > > I realise the merge window has just closed and therefore folks have
> > > been busy, but no responses on this after a month?
> > >
> > > Do I give up and submit a patch to document that DSI is broken and no one cares?
> >
> > Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> > DSIM bridge' thread, otherwise I would miss it since I'm not involved
> > much in the DRM development.
> >
> > This resolves most of the issues in the Exynos DSI and its recent
> > conversion to the drm bridge framework. I've added the needed
> > prepare_upstream_first flags to the panels and everything works fine
> > without the bridge chain order hacks.
> >
> > Feel free to add:
> >
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> >
> > The only remaining thing to resolve is the moment of enabling DSI host.
> > The proper sequence is:
> >
> > 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> > video enable.
> >
> > #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> > far done in the first host transfer call, which usually happens in
> > panel's prepare, then the #4 happens. Then video enable is done in the
> > enable callbacks.
> >
> > Jagan wants to move it to the dsi host pre_enable() to let it work with
> > DSI bridges controlled over different interfaces
> > (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> > ). This however fails on Exynos with DSI panels, because when dsi's
> > pre_enable is called, the dsi device is not yet powered. I've discussed
> > this with Andrzej Hajda and we came to the conclusion that this can be
> > resolved by adding the init() callback to the struct mipi_dsi_host_ops.
> > Then DSI client (next bridge or panel) would call it after powering self
> > on, but before sending any DSI commands in its pre_enable/prepare functions.
> >
> > I've prepared a prototype of such solution. This approach finally
> > resolved all the initialization issues! The bridge chain finally matches
> > the hardware, no hack are needed, and everything is controlled by the
> > DRM core. This prototype also includes the Jagan's patches, which add
> > IMX support to Samsung DSIM. If one is interested, here is my git repo
> > with all the PoC patches:
> >
> > https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework
>
> While this needs rework on the bridge chip side, I fear that we need
> something like that to allow the bridge to control the sequencing of
> the DSI host init. While most bridges that aren't controlled via the
> DSI channel might be fine with just initializing the host right before
> a video signal is driven, there are some that need a different
> sequencing.
>
> The chip I'm currently looking at is a TC368767, where the datasheet
> states that the DSI lanes must be in LP-11 before the reset is
> released. While the datasheet doesn't specify what happens if that
> sequence is violated, Marek Vasut found that the chip enters a test
> mode if the lanes are not in LP-11 at that point and I can confirm this
> observation.
> Now with the TC358767 being a DSI to (e)DP converter, we need to
> release the chip from reset pretty early to establish the DP AUX
> connection to communicate with the display, in order to find out which
> video modes we can drive. As the chip is controlled via i2c in my case,
> initializing the DSI host on first DSI command transaction is out and
> doing so before the bridge pre_enable is way too late.
>
> What I would need for this chip to work properly is an explicit call,
> like the mipi_dsi_host_init() added in the PoC above, to allow the
> bridge driver to kick the DSI host initialization before releasing the
> chip from reset state.

This is going off on a slight tangent from the original patch set, but
a thought has just come to mind for this use case.

For this sort of bridge device where you want to power up early
(either just for LP-11 state, or for HS on the clock lane), is power
up at mipi_dsi_attach, and power down at mipi_dsi_detach sufficient?
We have mode_flags in struct mipi_dsi_device passed in
mipi_dsi_attach, so an extra flag in there (eg
MIPI_DSI_EARLY_POWER_ON) would be very easy and be a simple way to
signal an alternate DSI host behaviour.

It still leaves the configuration of link frequency as an open
question, but potentially solves the sequencing issue. Just a thought.
Perhaps dsi_attach() is still too late in the process.

  Dave
