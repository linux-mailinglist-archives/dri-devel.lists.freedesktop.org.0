Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC38285086
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 19:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CEE6E4DE;
	Tue,  6 Oct 2020 17:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2FF6E4DE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 17:14:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so14344728wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQkN1upH+slzKJbrqvfok78tbpU8Cenolhq9OlECd6A=;
 b=KSeuBH5t/vKToC5zcoC+y7kYXjwLeOm8feTMa90733C8BopxSpG0eFIiHU6f2JPIbq
 Wl8Rla+2of/uHa6ZUKH46vGJVuWPUiRfrfteZyCLXu3MMKhss2k9lztpnTokcp0dHJLc
 ZX03Qgm23v5lkOsVNWOfWbwvdm/vB59fNtIjvvS4UOctL+ct3k19ARHryUP7wQOmDcdK
 E7fcfPKg2zfvuKnMZY+AeYrYvqJQQUpvZV7alJ/8JDwSqwYVWn8sKSsmnxULqdg51vh6
 Ah9Qo3i5QLGtwRE+EqHUViTgyta+hc0O42FT8wVpXpXUAWLGQSRJX9M5QedGjQEc+MpW
 U8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQkN1upH+slzKJbrqvfok78tbpU8Cenolhq9OlECd6A=;
 b=bzwQtS0yobXIPymXNwt1nO4pOzoTrtD16v3mHRneCa+wCcaSKPruv/9cazpuZWkiEx
 HEqb++2cTMN7C389FddfQsjOGX1yJTjvXdhr53C8LthdyjDRJ9A6nV3cbyo4PD3dg+d8
 /YVMX5zGT9j+/GVBBPlzWqlzjvJG/Qtk2Cy0Va3uIIOFdHr8RlVRxu9MZySZhAQ2J7PQ
 rlrjVYEJy5jRpKthvbQjkbRBmH7vHLDsUGcGQbw4cHbhlUsbIXDMhCxnwEUW9QAYP9Em
 tQn/4lqEgbH62y9GOUjzzD7InXE8vJ3v52kZrsizKNh4W2tP5VyWGYCh6uMeRcQffW+4
 0jOA==
X-Gm-Message-State: AOAM532NDmWSQ+olI/ljpN+3z8v6pEK81s7QTBvKdCG9R/4vYHo69EFV
 514lMktwMBlKmITGUgKrmB73QPuwXipFTeA3EdGRrA==
X-Google-Smtp-Source: ABdhPJx6JoolLP3mOQPYECXAgK8Q7YDbgX/kE5v0qictkEpeZ+HVDNJCsA+ZQIvOflpmzULotVi7OCEqMN67r0A90lQ=
X-Received: by 2002:adf:e806:: with SMTP id o6mr6065570wrm.42.1602004459187;
 Tue, 06 Oct 2020 10:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
 <cacbaef2-4221-50d8-3c5d-efab9f1a9c04@i2se.com>
 <20201001064843.dlewcu3b7dvqanyy@gilmour.lan>
 <20201001085402.t6mzzwzplviunhoc@gilmour.lan>
 <CAAvKZ65WqQqH-9JVdb5M6HcKbR3yQdvZha8n9UXXCfciYRq4aA@mail.gmail.com>
 <20201002151954.wazqc5riesdomlpx@gilmour.lan>
 <CAPY8ntCkY9F0e=hOyg=rs5G2a=iEbukWgmr0adXrwJQPm=uY6A@mail.gmail.com>
 <20201006152623.sjc3jxagj4wh7g5f@gilmour.lan>
In-Reply-To: <20201006152623.sjc3jxagj4wh7g5f@gilmour.lan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 6 Oct 2020 18:14:01 +0100
Message-ID: <CAPY8ntAr+wV0F-GCxHLg+30tuu8van51BFQ9Nh_C1LD+CPRcLA@mail.gmail.com>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
To: Maxime Ripard <maxime@cerno.tech>
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
 Tim Gover <tim.gover@raspberrypi.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Tue, 6 Oct 2020 at 16:26, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Fri, Oct 02, 2020 at 04:57:05PM +0100, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Fri, 2 Oct 2020 at 16:19, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Tim,
> > >
> > > On Thu, Oct 01, 2020 at 11:15:46AM +0100, Tim Gover wrote:
> > > > hdmi_enable_4k60=1 causes the firmware to select 3.3 GHz for the PLLC
> > > > VCO to support a core-frequency of 550 MHz which is the minimum
> > > > frequency required by the HVS at 4Kp60. The side effect is that if the
> > > > display clock requirements are lower than 4Kp60 then you will see
> > > > different core frequencies selected by DVFS.
> > > >
> > > > If enable_uart=1 and the mini-uart is selected (default unless
> > > > bluetooth is disabled) then the firmware will pin the core-frequency
> > > > to either core_freq max (500 or 550). Although, I think there is a way
> > > > of pinning it to a lower fixed frequency.
> > > >
> > > > The table in overclocking.md defines options for setting the maximum
> > > > core frequency but unless core_freq_min is specified DVFS will
> > > > automatically pick the lowest idle frequency required by the display
> > > > resolution.
> > >
> > > I'm wondering if there's some way to detect this from Linux? I guess it
> > > would be nice to be able to at least detect a broken config to warn /
> > > prevent an user that their situation is not going to be reliable / work
> > > really well (like if they have a 4k display without hdmi_enable_4kp60
> > > set, or the issue we're discussing here)
> >
> > The main filter in the firmware is the parameter
> > hdmi_pixel_freq_limit. That can either be set manually from
> > config.txt, or defaults appropriately based on hdmi_enable_4kp60.
> > Under firmware_kms [1] I read back those values to use as a filter
> > within crtc_mode_valid[2].
> > I can't think of a nice way of exposing that without the vc4 driver
> > gaining a DT link to the firmware, and that starts to get ugly.
>
> I had in mind something like if the clock driver can infer that somehow
> through some the boundaries reported by the firmware maybe? IIRC,
> hdmi_enable_4kp60 will already change the max frequency reported to
> 550MHz instead of 500MHz

Yes, that's plausible, but I don't know enough about the clock
infrastructure for advertising limits to know what works there.
Tell me what you need from the mailbox service and I'll see what I can do.

We do already have RPI_FIRMWARE_GET_MAX_CLOCK_RATE and
RPI_FIRMWARE_GET_MIN_CLOCK_RATE. It'd take a few minutes of staring at
the code (or a quick test) to confirm if they definitely are changed
for CORE clock by hdmi_enable_4kp60 - I think it does.

  Dave
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
