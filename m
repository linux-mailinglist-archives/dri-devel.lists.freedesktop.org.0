Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5764F280DD0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482C6E914;
	Fri,  2 Oct 2020 07:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDDE6E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 10:15:58 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q8so5872271lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 03:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbHB4UppKAenF5cuB/vMr8n45MQRc8w9Jto0vU1UBGI=;
 b=beAv55UsVyfGF0QS4DSb8YtWr0/kLHdy8m7Y/p3vuAvNYpKj8Er+VNcAzrvV5a2nlI
 P5CCC9NT2Dh7rpn0ytCR0SxxE/nYyM6ucU+QWymp1zSTe6mTGqB5eV7x7+C+eCFEOnE9
 3ZBduzCDBKM3GdWJTemquWib0vXuxiJ7ShPVqqMhQKcwJ2k6mIvHB2tU7jtn0D03ThEu
 2QXjy7xpu9fmyJ2oujUuQVzqAr3wReGopQc27sm263SGrZfj2VBYSxrhde1YMimP/ZxN
 IPLAxgUNwbuO4WrNPX5W5PaD6ohanEcXYl0PxyVM/bEukSoOEYvS7sviOJqjQ5GYVZYo
 aa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbHB4UppKAenF5cuB/vMr8n45MQRc8w9Jto0vU1UBGI=;
 b=ORP7Bin3OzW8o7e1P3axg/Wngm8lfsYTIJ9IKZNEX/5BDSBwWBxfFRreklB8bK4ME5
 uIHkcAX6/+8s0hXLDwSaPFRQji4r2z6aFRswISZt16iH7seBdneLbo+6v56DDV48+WR2
 Q9l/1IpwI5VhKPeSamZTFq6Xe8fRJ7+CJ7ACwcrp1f7q4zVvF/SflbKQMSWql92F7AVn
 t4KGhNVq5fOOWltjmY6aQLfgUGDorCvt+wymcR07gGUG8/tRisw/WiyRtQb3nmO0b+mL
 ce/2Q8ebWzwfuRgIw7kj4pRUwfSt2K4aC5x1FfyYxN1sBCHaNMIWqa4t+bQEYgQNe0dF
 TPxQ==
X-Gm-Message-State: AOAM530NiqxyowZ79ZEJuk9UpCl9CRs3LBeTs32GH6Id2RcWr9e0WNbY
 1Zm6pTvK2lYdB3MKT70GlwS78u/y97L0LySLMPIAuA==
X-Google-Smtp-Source: ABdhPJz+dSG1WLw5ugB6n7HEwN0s6TlyMWv5/7+mvXT01Jl0M1MTND1yxApBDlypSSLWkuxoRZKti8z/Eofzfl+gmbc=
X-Received: by 2002:a19:8044:: with SMTP id b65mr2152189lfd.366.1601547357111; 
 Thu, 01 Oct 2020 03:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
 <cacbaef2-4221-50d8-3c5d-efab9f1a9c04@i2se.com>
 <20201001064843.dlewcu3b7dvqanyy@gilmour.lan>
 <20201001085402.t6mzzwzplviunhoc@gilmour.lan>
In-Reply-To: <20201001085402.t6mzzwzplviunhoc@gilmour.lan>
From: Tim Gover <tim.gover@raspberrypi.com>
Date: Thu, 1 Oct 2020 11:15:46 +0100
Message-ID: <CAAvKZ65WqQqH-9JVdb5M6HcKbR3yQdvZha8n9UXXCfciYRq4aA@mail.gmail.com>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
To: Maxime Ripard <maxime@cerno.tech>
X-Mailman-Approved-At: Fri, 02 Oct 2020 07:02:50 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hdmi_enable_4k60=1 causes the firmware to select 3.3 GHz for the PLLC
VCO to support a core-frequency of 550 MHz which is the minimum
frequency required by the HVS at 4Kp60. The side effect is that if the
display clock requirements are lower than 4Kp60 then you will see
different core frequencies selected by DVFS.

If enable_uart=1 and the mini-uart is selected (default unless
bluetooth is disabled) then the firmware will pin the core-frequency
to either core_freq max (500 or 550). Although, I think there is a way
of pinning it to a lower fixed frequency.

The table in overclocking.md defines options for setting the maximum
core frequency but unless core_freq_min is specified DVFS will
automatically pick the lowest idle frequency required by the display
resolution.



On Thu, 1 Oct 2020 at 09:54, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Oct 01, 2020 at 08:48:43AM +0200, Maxime Ripard wrote:
> > Hi Stefan,
> >
> > On Wed, Sep 30, 2020 at 06:52:13PM +0200, Stefan Wahren wrote:
> > > Am 30.09.20 um 18:38 schrieb Nathan Chancellor:
> > > > On Wed, Sep 30, 2020 at 04:07:58PM +0200, Maxime Ripard wrote:
> > > >> Hi Nathan,
> > > >>
> > > >> On Tue, Sep 29, 2020 at 03:15:26PM -0700, Nathan Chancellor wrote:
> > > >>> On Thu, Sep 03, 2020 at 10:01:52AM +0200, Maxime Ripard wrote:
> > > >>>> Now that all the drivers have been adjusted for it, let's bring in the
> > > >>>> necessary device tree changes.
> > > >>>>
> > > >>>> The VEC and PV3 are left out for now, since it will require a more specific
> > > >>>> clock setup.
> > > >>>>
> > > >>>> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >>>> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> > > >>>> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > > >>>> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > >>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > >>> Apologies if this has already been reported or have a solution but this
> > > >>> patch (and presumably series) breaks output to the serial console after
> > > >>> a certain point during init. On Raspbian, I see systemd startup messages
> > > >>> then the output just turns into complete garbage. It looks like this
> > > >>> patch is merged first in linux-next, which is why my bisect fell on the
> > > >>> DRM merge. I am happy to provide whatever information could be helpful
> > > >>> for debugging this. I am on the latest version of the firmware
> > > >>> (currently 26620cc9a63c6cb9965374d509479b4ee2c30241).
> > > >> Unfortunately, the miniUART is in the same clock tree than the core
> > > >> clock and will thus have those kind of issues when the core clock is
> > > >> changed (which is also something that one should expect when using the
> > > >> DRM or other drivers).
> > > >>
> > > >> The only real workaround there would be to switch to one of the PL011
> > > >> UARTs. I guess we can also somehow make the UART react to the core clock
> > > >> frequency changes, but that's going to require some effort
> > > >>
> > > >> Maxime
> > > > Ack, thank you for the reply! There does not really seem to be a whole
> > > > ton of documentation around using one of the other PL011 UARTs so for
> > > > now, I will just revert this commit locally.
> > >
> > > there was a patch series & discussion about this topic, but we finally
> > > didn't find a rock solid solution.
> > >
> > > You can have a look at "[RFC 5/5] serial: 8250: bcm2835aux: add notifier
> > > to follow clock changes" from 3.4.2019 on linux-rpi-kernel.
> >
> > I couldn't find that discussion on the archive, but based on the title I
> > guess there's some patches that have been merged this cycle for the 8250
> > driver to do just that (868f3ee6e452 ("serial: 8250: Add 8250 port clock
> > update method") and cc816969d7b5 ("serial: 8250_dw: Fix common clocks
> > usage race condition")).
> >
> > However, I'm not entirely sure the clock notifier works in our case with
> > the firmware / MMIO clocks duality
>
> I was a bit intrigued by this, so I looked into it, and it seems that
> it's worth that it used to be. The core clock is supposed to be running
> at 500 Mhz in most cases, and that's what we're setting so it shouldn't
> cause any pratical issue.
>
> However, it looks like on my board now the firmware reports that the
> core clock is running at either 311MHz or 233MHz with hdmi_enable_4k60
> (which seems odd?) and that contradicts the documentation here:
> https://www.raspberrypi.org/documentation/configuration/config-txt/overclocking.md
>
> Linux then comes in, changes the frequency to 500MHz and breaks the
> UART. So either the doc is wrong, or the clock driver is.
>
> vcgencmd measure_clock core reports that it's indeed 233Mhz and I'm
> running a year-old firmware (built on the 2019-11-29), so I'd be
> inclined to think that the doc is wrong here or we're misinterpreting
> something.
>
> Dave, Tim, any idea?
>
> Thanks!
> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
