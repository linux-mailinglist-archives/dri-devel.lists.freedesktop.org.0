Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9F4F3784
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D61210E1AA;
	Tue,  5 Apr 2022 14:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970F410E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:20:53 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ot30so17094332ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q1fMuMhL+18VtHIJ1hthiMl2z1rfYCKzCiFivu8sGdg=;
 b=QvMaJ/0XjgD1VrVIr6oeQ/HYib+BvRfuLNijSYVQVgW2VixpWdRRH7LX0kgTo+UdID
 GhDRnERSrXbzehluW9qXXwen/SEIYAo91cydk4hDTG+iR91+PNk6rmV6uHiHZnrC9tpJ
 f2U3zRpQbfZYhFd1NdH5Qg4oYhCxwfbnT0Lvez4LgpxpfzsSy08y32bf9sUG91ZbQtyZ
 Ldey99hFnABQ5gjgLnxLRhCkVy2a7Q9/5BjnYmQgidRctpBAqtTOcBJZaPh+N/dCZIoN
 aPk+5rPlMxSV/opodS6ptHJr5x6zyrF8fmkV8GYCiJ73560YTlMGtL0g+62NXvfHu9++
 prOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1fMuMhL+18VtHIJ1hthiMl2z1rfYCKzCiFivu8sGdg=;
 b=wf9PQWtZmBvMDmKO3WeneGOGzLMFNdgS6TMRkNApdXSJPv6Ie3FZ+DbKrQHxhYvCe/
 J8Ca2Mo2ZbGdTlmiF54wfswjqaDPOpySolQIJCTf1N4e3asUbiNXDeb0PcqydncCTMRj
 mAiRmJR1d2x6m0pInusHE+avl2fgAag/q2B6m5CfklYIlScepcV8xygnky1i1AJMaDX6
 3h7F3Cpuic0oKLaq8LRy9MTU7i1xPNfzJUJ9uRXHKNCKKB/2abxNlPzgrVtrMGLExkpU
 xxzVcpXDdu99sYAZRq1NMSlm9O9uioghYgfHC3+LnzOfh/l6y8acLEsWZGu5RPFED+0Y
 KMcg==
X-Gm-Message-State: AOAM53099hYTT9Z6OAEtKEuzy7RvC4iwmR62oNdYm+kfdZ8UFDWoL0YC
 IpvGOy/pFljJhfwOEbnLaaerAzcSMdfrU1UJjKBYAR7wmT+LJw==
X-Google-Smtp-Source: ABdhPJwoJsHCZQXLE9epHc88jNGZ9zS8Z4g13Vj4/WXDPGm5Cs0gg9f4Lgu44dI4oSCB0apQr1gHnxydDHNr7McPTmE=
X-Received: by 2002:a17:907:2cc7:b0:6df:b76d:940d with SMTP id
 hg7-20020a1709072cc700b006dfb76d940dmr3651418ejc.742.1649168452084; Tue, 05
 Apr 2022 07:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
 <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
 <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
 <CAPY8ntC5RQ4pq=Bf5Z+Vi-NhD6boGnEixjporJSKgR=AaUrEpw@mail.gmail.com>
 <2b6df0ac-d429-7d49-60e8-727f8c135671@denx.de>
In-Reply-To: <2b6df0ac-d429-7d49-60e8-727f8c135671@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Apr 2022 15:20:34 +0100
Message-ID: <CAPY8ntDVaAoaCu19=2DxW97STQdaVMv1-DbuPuvQu50N6mY1mg@mail.gmail.com>
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Tue, 5 Apr 2022 at 14:49, Marek Vasut <marex@denx.de> wrote:
>
> On 4/5/22 15:25, Dave Stevenson wrote:
> > On Tue, 5 Apr 2022 at 14:08, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> Hi Dave,
> >>
> >> On Tue, Apr 05, 2022 at 01:00:28PM +0100, Dave Stevenson wrote:
> >>> On Tue, 5 Apr 2022 at 12:42, Laurent Pinchart wrote:
> >>>> On Sun, Feb 13, 2022 at 03:26:48AM +0100, Marek Vasut wrote:
> >>>>> In rare cases, the bridge may not start up correctly, which usually
> >>>>> leads to no display output. In case this happens, warn about it in
> >>>>> the kernel log.
> >>>>
> >>>> Do you know what this is caused by ? It's a bit annoying to add a 10+ms
> >>>> delay at start time just to be notified of rare cases.
> >>>
> >>> The datasheet [1] section 7.4.2 Initialization Sequence states in step 2
> >>> "After power is applied and stable, the DSI CLK lanes MUST be in HS
> >>> state and the DSI data lanes MUST be driven
> >>> to LP11 state"
> >>> Data lanes shouldn't go to HS until step 8 after the DSI83 has been configured.
> >>>
> >>> Configuration from the driver is being done from atomic_enable,
> >>> therefore the data lanes are likely in HS mode and sending video, not
> >>> LP11.
> >>>
> >>> Deviate from the specified initialisation sequence at your peril!
> >>>
> >>> The SN65DSI8[3|4|5] is one of the DSI devices that I'd been looking at
> >>> with the DSI ordering patches [2] so that we could initialise it in
> >>> the way specified in the datasheet. I've had no responses to v2 of
> >>> those patches though.
> >>
> >> Sounds like I need to review that :-) It's still in my queue, I'll try
> >> to push it to the top.
> >>
> >> Do you think this patch could then be reverted ?
> >
> > If we can initialise the DSI host before the bridge for the
> > pre_enable, then all the configuration moves to the atomic_pre_enable
> > and there should be no need to have the delay.
> >
> > I can't 100% guarantee that, but one of the folks on the Pi forums is
> > using [1] which does that, and is reporting it working well. (He's
> > also using the DSI85 to take 2 DSI links and drive 2 LVDS single link
> > panels)
>
> It seems to me that checking whether the bridge got correctly
> initialized is orthogonal to the aforementioned patchset though ?

It's the delay that is ugly.
Put the check in atomic_enable which will be slightly later than
configuration in pre_enable? Check that sufficient jiffies have passed
if you needed.
Or wire up the IRQ line from the SN65DSI83 rather than polling the IRQ
Status register. Delayed workqueue if the IRQ isn't wired up.

If I read it right your log message is triggered by any bit being set
in REG_IRQ_STAT. So an inconveniently timed correctable DSI error will
set bit 4 and log the error even though it's been corrected. Likewise
bit 7 / CHA_SYNCH_ERR could get triggered by an H or V sync packet
being received in that 10-12ms window (we're in atomic_enable, so
video is already running).

If it's the PLL being unlocked that is the issue then it should only
be checking bit 0. Or possibly reading the actual PLL lock status from
REG_RC_LVDS_PLL_PLL_EN_STAT. Although as we've already checked that
the PLL is locked via REG_RC_LVDS_PLL_PLL_EN_STAT earlier in the
atomic_enable, I'm now a little confused as to the condition you are
actually wanting to detect.

  Dave
