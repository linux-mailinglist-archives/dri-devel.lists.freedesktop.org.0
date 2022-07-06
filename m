Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30920568582
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB6211332D;
	Wed,  6 Jul 2022 10:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952B9112C3F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 10:27:20 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id h23so26243729ejj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ENJfxqPBBQz/R+NUn7IaG1mKPSNywix+0hK+k3KoFs=;
 b=IiUuZfq1K1q4mgiK8JNxARJvGCUN/B4iMGo9yJEkxZ5pzF0QaF+G8t8bUjT0SqAvwj
 ILK0vfItMCR0rViqjawuEeztKvbwM+EOj1ESxn1YNL6ARzyWcb8g2Ux38YrXaWWtVbv7
 sMPgbHAFd3Y86zDG6NVFnuzAfqbbi9h20AOhKPCyAS8cWi/1axw3BVOK/QgqC4GeBWUz
 4yz15kg2iC0hCrCrtn/0Fj1+ze080J9SEaJPt/WO/ckdxT2rYyeCniVYzDK3V/PilsH2
 3x+XhOtshZz04srjpkl3U9cozhqEVs88nQbWyyFFAeovAY/Pbs507ryHNDYLPagG82eA
 yDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ENJfxqPBBQz/R+NUn7IaG1mKPSNywix+0hK+k3KoFs=;
 b=Vzo3IsCG4QN5ccXN/nKhXifI6vJomOgqUYEfxHdsRNV2xKkoHiwlsgDca+wf6VqLLU
 A4zFs12TYHYV3GRF4XiPxSxyq170Rj6NoSq7akzXtJ3pOCH3QHpwZJPcW9Ys/9JZHZL3
 UixFtQSbV4F4xMQWuS+cBHxk1kPDqM/mT07nMgYjxH6grgOZ7v5ZqriWok7psjku8nXd
 ttMnfzhzaSSl539n7sWudav+FQJWR0MG8yehcjbTUsW0F4OrfyzLhwlSB1Y4XfFNcr0C
 mvhYiX5+BnZim9Ui8x9d1e6Zb5Qsr1GXtnyESAtwBsChTk9un5U+hIQNgCbpPppHD99C
 N1CA==
X-Gm-Message-State: AJIora8X4BZPzw7txqrgAVp+pvJy3enOytNcacgMAuCTjget+U0YywTi
 c2zvKFFJ4/oeqgiOsmi/8wrRjcZeki64gw77JFFqOA==
X-Google-Smtp-Source: AGRyM1uyQJXaVGt6eK1Teb+QwFBHkAgAo9HOCH69e8hv9+oG+G/GNw8fRKb2aCECxpZYld2xPeasBAHKb0bxsegL9CA=
X-Received: by 2002:a17:907:2d9e:b0:726:a03a:16c4 with SMTP id
 gt30-20020a1709072d9e00b00726a03a16c4mr36786267ejc.742.1657103239036; Wed, 06
 Jul 2022 03:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <7d3bcbaa027422018b956507d5ac5d19422dc892.camel@pengutronix.de>
 <27702b37-2904-3a2a-dd0b-1111efe70826@kontron.de>
In-Reply-To: <27702b37-2904-3a2a-dd0b-1111efe70826@kontron.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 6 Jul 2022 11:27:03 +0100
Message-ID: <CAPY8ntA_P1qzkd7YJ3HqOsa5D9GDCGm6LWo8tmytbYqxgJDR+g@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder.

Apologies Lucas - I missed your response.

On Wed, 6 Jul 2022 at 08:09, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Am 10.06.22 um 09:52 schrieb Lucas Stach:
> > Hi,
> >
> > Am Mittwoch, dem 11.05.2022 um 16:58 +0200 schrieb Marek Szyprowski:
> >> Hi Dave,
> >>
> >> On 05.04.2022 13:43, Dave Stevenson wrote:
> >>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> >>> <dave.stevenson@raspberrypi.com>  wrote:
> >>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> >>>> <dave.stevenson@raspberrypi.com>  wrote:
> >>>>> Hi All
> >>>> A gentle ping on this series. Any comments on the approach?
> >>>> Thanks.
> >>> I realise the merge window has just closed and therefore folks have
> >>> been busy, but no responses on this after a month?
> >>>
> >>> Do I give up and submit a patch to document that DSI is broken and no one cares?
> >>
> >> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> >> DSIM bridge' thread, otherwise I would miss it since I'm not involved
> >> much in the DRM development.
> >>
> >> This resolves most of the issues in the Exynos DSI and its recent
> >> conversion to the drm bridge framework. I've added the needed
> >> prepare_upstream_first flags to the panels and everything works fine
> >> without the bridge chain order hacks.
> >>
> >> Feel free to add:
> >>
> >> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>
> >>
> >> The only remaining thing to resolve is the moment of enabling DSI host.
> >> The proper sequence is:
> >>
> >> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> >> video enable.
> >>
> >> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> >> far done in the first host transfer call, which usually happens in
> >> panel's prepare, then the #4 happens. Then video enable is done in the
> >> enable callbacks.
> >>
> >> Jagan wants to move it to the dsi host pre_enable() to let it work with
> >> DSI bridges controlled over different interfaces
> >> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> >> ). This however fails on Exynos with DSI panels, because when dsi's
> >> pre_enable is called, the dsi device is not yet powered. I've discussed
> >> this with Andrzej Hajda and we came to the conclusion that this can be
> >> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
> >> Then DSI client (next bridge or panel) would call it after powering self
> >> on, but before sending any DSI commands in its pre_enable/prepare functions.
> >>
> >> I've prepared a prototype of such solution. This approach finally
> >> resolved all the initialization issues! The bridge chain finally matches
> >> the hardware, no hack are needed, and everything is controlled by the
> >> DRM core. This prototype also includes the Jagan's patches, which add
> >> IMX support to Samsung DSIM. If one is interested, here is my git repo
> >> with all the PoC patches:
> >>
> >> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework
> >
> > While this needs rework on the bridge chip side, I fear that we need
> > something like that to allow the bridge to control the sequencing of
> > the DSI host init. While most bridges that aren't controlled via the
> > DSI channel might be fine with just initializing the host right before
> > a video signal is driven, there are some that need a different
> > sequencing.
> >
> > The chip I'm currently looking at is a TC368767, where the datasheet
> > states that the DSI lanes must be in LP-11 before the reset is
> > released. While the datasheet doesn't specify what happens if that
> > sequence is violated, Marek Vasut found that the chip enters a test
> > mode if the lanes are not in LP-11 at that point and I can confirm this
> > observation.
>
> The SN65DSI84 also has this requirement according to the datasheet.

SN65DSI8[3|4|5] need LP-11 before the chip comes out of reset, but
that only happens as part of enabling the bridge chain. This patch set
allows it to request the DSI host to be initialised first in order to
meet that constraint, which is common with many DSI sink devices.

Lucas' comment with TC368767 is that it is doing other things for
display negotiation over the AUX channel prior to enabling the video
path, and that is needing the DSI interface to be enabled and in LP-11
much earlier (and potentially clock lane in HS if not using an
external clock).

> > Now with the TC358767 being a DSI to (e)DP converter, we need to
> > release the chip from reset pretty early to establish the DP AUX
> > connection to communicate with the display, in order to find out which
> > video modes we can drive. As the chip is controlled via i2c in my case,
> > initializing the DSI host on first DSI command transaction is out and
> > doing so before the bridge pre_enable is way too late.
> >
> > What I would need for this chip to work properly is an explicit call,
> > like the mipi_dsi_host_init() added in the PoC above, to allow the
> > bridge driver to kick the DSI host initialization before releasing the
> > chip from reset state.
>
> So to sum up on the missing parts:
>
> 1. This series needs more reviews, but is generally agreed on.
> 2. Jagan will integrate Marek's mipi_dsi_host_init() PoC when respinning
> his series "drm: bridge: Add Samsung MIPI DSIM bridge".

I'm still not clear as to whether Marek's mipi_dsi_host_init is needed
in the majority of cases.
Exynos appeared to be trying to check for no contention as part of the
initialisation to LP-11, and that isn't necessary. No one has come
back on that one.

Adding a mipi_dsi_host_init would potentially solve the additional
issue for TC358767.
However it leaves a number of open questions. The first I can think of
is that there are no defined mechanisms for specifying the link
frequency prior to having a video mode set. Yes struct mipi_dsi_device
has hs_rate, but that is defined as the maximum HS rate that the
device supports, and therefore open to variation in the
implementation. Exynos has various vendor specific DT parameters to
configure link frequencies, which ought to be standardised if that is
the preferred approach.

> 3. Bridge drivers need to be adjusted to call mipi_dsi_host_init() if
> required.

Which hopefully is only the weirder devices such as TC358767.
SN65DSI8[3|4|5] do not need this, but they will need
pre_enable_upstream_first if/when the enable logic is shifted from
atomic_enable to atomic_pre_enable.

Cheers.
  Dave

> Did I get anything wrong here, or is there some point that I'm missing?
> Jagan, do you have any plan to pick up the threads?
>
> Thanks
> Frieder
