Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73112316A78
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 16:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD576E08A;
	Wed, 10 Feb 2021 15:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F213F6E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 15:49:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w4so2199706wmi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 07:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYZgMVhM68r4TeIL1eqUcRIh/19tL8LpowcnJQBeiLo=;
 b=dSUu1ROVfX9VnD5N/wmt0yOiO0MLXBe7aSpyu4quDdFKJc6PcUPDxu3raKXw++Ek0N
 2Dv1lat9ACE2l0XH90tJLthIuJJ3Ra+tvFBhVqRhTvZ0+vj+gVyROAl/3EhQHjPllj73
 +CzZTMzOIFFwe3xapqnoGAEcClWh0bS70GYqYpvu52mEutOyn7KcA2gjXGCdezMzbk9e
 27ICpKRGjdb9NAtti3fPpZO/xY0g72kopq5GBuVgmkxFzZBT+zDzHq3u7Por+bNcQQny
 HtCGcV48LA+HwGngSoKFUXHkYj6Mrz8dibG32AlXDXQ84UjOg/hIoEPilnHg3PGFMfNZ
 xPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYZgMVhM68r4TeIL1eqUcRIh/19tL8LpowcnJQBeiLo=;
 b=sAPP6qtgtOk7t9etTgbOnybHHW9fjHxz2v79Llr0C3kwpkprJ80pBa5Gl7NbuhRgJI
 DNdKhxuOd8Id1ZTEBpNRCYdxWa4r3mPdc0eP19FTcksNnh0yJ5g9JHSOsZgksSju7Zce
 7Km/gKFCgbE1/NshF7hwpJTaD8q4edvBDWCG/Vc8aR4NtXLGbKBXgqDDz+9krcebz2gK
 IsuYa6t1gLPOm7L2GAtLLrNMN+qdWaBPQT6hA5LRtD5jxvfHO1kCAuXqpQZth9Q8CfhZ
 VH78tn6UoUO4zows6tmOUOt2mB629LWBUwvJGGVxl9H4z+PqhiFaApmkaqnQfJecoqYN
 BFwQ==
X-Gm-Message-State: AOAM530xoxnj77mChpLnfQUAhHg0RvI4OdrU7+c8vgPne/0DDKDhN6GG
 05NqBFHQBy9VlCvvatQ/47kXulGFVBr4mumjQuUMkQ==
X-Google-Smtp-Source: ABdhPJzVGS+MJZSjsBcZpXaEfuUikR3k1vTMjTsq3S6hU+cP8Eoa9+ZrmBtxOFY4nwMZV3HSd+UcMCdET28GHNpoKRc=
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr3534527wmf.82.1612972160635; 
 Wed, 10 Feb 2021 07:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
 <20210210144043.s4plyc7ekwnnu7k4@gilmour>
 <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
In-Reply-To: <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 10 Feb 2021 15:49:03 +0000
Message-ID: <CAPY8ntCG3vLy1NWNF09DEZWE-t_xc+q5m89Jv8GB8GofBLVp3Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
To: Marc Zyngier <maz@kernel.org>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marc.

On Wed, 10 Feb 2021 at 15:30, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Maxime,
>
> On 2021-02-10 14:40, Maxime Ripard wrote:
> > Hi Dave,
> >
> > On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
> >> On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
> >> >
> >> > The BSC controllers used for the HDMI DDC have an interrupt controller
> >> > shared between both instances. Let's add it to avoid polling.
> >>
> >> This seems to have unintended side effects.
> >> GIC interrupt 117 is shared between the standard I2C controllers
> >> (i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.
> >>
> >> Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
> >> doesn't appear to be an option for l2-intc registering as an interrupt
> >> controller. i2c-bcm2835 therefore loses out and fails to register for
> >> the interrupt.
> >>
> >> Is there an equivalent flag that an interrupt controller can add to
> >> say that the parent interrupt is shared? Is that even supported?
> >
> > Indeed, it looks like setting an equivalent to IRQF_SHARED would be the
> > solution, but I couldn't find anything that would allow us to in the
> > irqchip code.
> >
> > Marc, Thomas, is it something that is allowed?
>
> No, not really. That's because the chained handler is actually an
> interrupt flow, and not a normal handler. IRQF_SHARED acts at the wrong
> level for that.
>
> I can see two possibilities:
>
> - the l2-intc gets turned into a normal handler, and does the demux
>    from there. Horrible stuff.
>
> - the i2c controller gets parented to the l2c-int as a fake interrupt,
>    and gets called from there. Horrible stuff.
>
> Pick your poison... :-/

Thanks for the info.

Option 3 - remove l2-intc and drop back to polling the i2c-brcmstb
blocks (which the driver supports anyway).
HDMI I2C generally isn't heavily used once displays are connected, so
I'd be OK with that.

(We can keep the l2-intc that handles CEC and HPD as that is on a
unique GIC interrupt).

  Dave
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
