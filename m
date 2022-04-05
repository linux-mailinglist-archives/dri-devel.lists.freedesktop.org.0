Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD94F3C2E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 17:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA19210E2CF;
	Tue,  5 Apr 2022 15:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDAA10E2CF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 15:24:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id yy13so27503860ejb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWCWYinG+0/z4ECv9vdWittW5AxPfnIvBO6foE/ZM5Q=;
 b=P+7Y4FJ17893pJ3ZF+hQlpa/dAXlw0SF/RgcmnLFThiIoao5VfDFNP5DM+i62Mf62p
 3f3ltZjKKNlP7+K872aQsH7IEYeug8rOJwiK/RRchK/tl77z6hjPtttu2GfH3LcoTeo9
 L2BxB+1dSwQCD1eDbxmg54FNFL8OoWoCgu9F5MxdgrmI8odkV6B7w2xRpW/SfZ587NUt
 hZmy77sbaQ01lXiF7uBgSy88DkjNXtSIWx4/imMUsq7kbuu0pjPF9ORafJH0zb3DTmyR
 OL6L9Zo8rznjwUI67XUG9AZYqJ5s0R6iRpngpWOhuQ4KVI4kkpWanCkFc7QtFp9k5VUY
 XOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWCWYinG+0/z4ECv9vdWittW5AxPfnIvBO6foE/ZM5Q=;
 b=3yPt6g0pVglFL6CvDZ1XBI5mnFBop+kYRyPYt8k0ZNnsceVrPcF/e2qu7O9IaQRC19
 65RXQkBFNA0VpEEUjfAlB06O+0Ux5dVvIINKY9E9gagyLUfVfBUL5zM8jJOoIIkXikWY
 OACnRtopoywjGMJpzTACRqVqWWmS4jxNtP+Wkli8LAZV13uUh7FGuDjvY3Wu9anaeFOW
 9gxEZ8xuAMTJplnZ+b9eN8LusLlt7Sr27nKiLhtIY0uwSjVDqEEm2WdarZUFsiRx3lSX
 lDjYToJmdh9xBSpRQ7rSqg/IgWWbbxuwbke25Gu6wkJ4qFjH2zljMC2+Id+e2WX0NmlE
 UbZQ==
X-Gm-Message-State: AOAM530nfSUqzTvHG8SVlVIaWM6MD2jLYFm8V5DI4N52CFYhw5kvjVRj
 OOd5PH4/vQYvCthewUsPvFkmFNPP4cCQdc6abhEGcBaQsFuOHg==
X-Google-Smtp-Source: ABdhPJwgkkttvOrGk/KbegszC/62uBN9Zyh48ePakqu5pbOLqoob74KwlmosxYG6B7LLd9ZgobQXPlFyLWRWc6dfIDs=
X-Received: by 2002:a17:907:60cc:b0:6e0:dab3:ca76 with SMTP id
 hv12-20020a17090760cc00b006e0dab3ca76mr4132205ejc.154.1649172293064; Tue, 05
 Apr 2022 08:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
 <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
 <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
 <CAPY8ntC5RQ4pq=Bf5Z+Vi-NhD6boGnEixjporJSKgR=AaUrEpw@mail.gmail.com>
 <2b6df0ac-d429-7d49-60e8-727f8c135671@denx.de>
 <CAPY8ntDVaAoaCu19=2DxW97STQdaVMv1-DbuPuvQu50N6mY1mg@mail.gmail.com>
 <941582a8-ca70-dd96-3097-570ae731eb73@denx.de>
In-Reply-To: <941582a8-ca70-dd96-3097-570ae731eb73@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Apr 2022 16:24:36 +0100
Message-ID: <CAPY8ntAYWgqTxZ3gwYt+Eo1_hJyYc1OgLE6cDGMqAb_djPPPuA@mail.gmail.com>
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

On Tue, 5 Apr 2022 at 15:48, Marek Vasut <marex@denx.de> wrote:
>
> On 4/5/22 16:20, Dave Stevenson wrote:
>
> Hi,
>
> >>> If we can initialise the DSI host before the bridge for the
> >>> pre_enable, then all the configuration moves to the atomic_pre_enable
> >>> and there should be no need to have the delay.
> >>>
> >>> I can't 100% guarantee that, but one of the folks on the Pi forums is
> >>> using [1] which does that, and is reporting it working well. (He's
> >>> also using the DSI85 to take 2 DSI links and drive 2 LVDS single link
> >>> panels)
> >>
> >> It seems to me that checking whether the bridge got correctly
> >> initialized is orthogonal to the aforementioned patchset though ?
> >
> > It's the delay that is ugly.
>
> You do need to wait a little after the initialization and before
> checking the status, so that delay is not going away no matter how you
> frob with the DSI bridge.
>
> > Put the check in atomic_enable which will be slightly later than
> > configuration in pre_enable? Check that sufficient jiffies have passed
> > if you needed.
> > Or wire up the IRQ line from the SN65DSI83 rather than polling the IRQ
> > Status register. Delayed workqueue if the IRQ isn't wired up.
>
> Are you able to do such deferred non-atomic operations in atomic_enable
> callback ?

atomic_enable returns void so you can't fail the atomic_enable.
All you're doing is reading a register and potentially logging an
error - surely that can be done from any context.

> > If I read it right your log message is triggered by any bit being set
> > in REG_IRQ_STAT. So an inconveniently timed correctable DSI error will
> > set bit 4 and log the error even though it's been corrected. Likewise
> > bit 7 / CHA_SYNCH_ERR could get triggered by an H or V sync packet
> > being received in that 10-12ms window (we're in atomic_enable, so
> > video is already running).
>
> There should be no bits set in the IRQ_STAT register if everything works
> as it should.

On a perfect link, yes.

Looking at the top 4 bits.

Bit 4
CHA_COR_ECC_ERR
When the DSI channel A packet processor detects a correctable ECC
error, this bit is set.

The error is corrected, so why do we care? The display is still working.

Bit 5
CHA_UNC_ECC_ERR
When the DSI channel A packet processor detects an uncorrectable ECC
error, this bit is set;
Bit 6
CHA_CRC_ERR
When the DSI channel A packet processor detects a data stream CRC error,
this bit is set

It doesn't say what behaviour the DSI83 will take under these
circumstances, but shouldn't be fatal to the display.

Bit 7
CHA_SYNCH_ERR
When the DSI channel A packet processor detects an HS or VS
synchronization error, that is, an unexpected sync packet; this bit is
set.

It's happened, but shouldn't be fatal, so why do we care? The display
should pick up correctly at the start of the next frame.
As I've already said, we're in atomic_enable and video is therefore
running, this is highly plausibly going to happen. We've delayed for
4-5ms in sn65dsi83_atomic_enable, so we're a third of the way through
a frame at 60fps. The chances of seeing a VS or HS packet at an
unexpected time is therefore high.

Bits 2 & 3 look equally inconsequential.

Bit 0 as PLL unlock would cause grief.

> > If it's the PLL being unlocked that is the issue then it should only
> > be checking bit 0. Or possibly reading the actual PLL lock status from
> > REG_RC_LVDS_PLL_PLL_EN_STAT. Although as we've already checked that
> > the PLL is locked via REG_RC_LVDS_PLL_PLL_EN_STAT earlier in the
> > atomic_enable, I'm now a little confused as to the condition you are
> > actually wanting to detect.
>
> Any outstanding errors which are currently hidden and only show up
> sporadically at the worst possible moment.

If you were constantly looking at the status then that would be reasonable.
To be looking during one specific 10-12ms period of time for some
fairly generic status values seems a little redundant, and a waste of
time in delaying the atomic_enable.

It'll be interesting to see if these events just go away when the
initialisation sequence specified in the datasheet is being followed.
Let's leave the debate until then, as it's currently fairly arbitrary.

  Dave
