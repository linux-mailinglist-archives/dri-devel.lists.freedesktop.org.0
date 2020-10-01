Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6B280DCF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32886E916;
	Fri,  2 Oct 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD086E063
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 19:45:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k25so5671746ljg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 12:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2gfbOiiR0so3N0eX6gQPc6WKY7PeKJeRfa9G0R50hA=;
 b=L8wFd+HleRUy2It+KmWJB1fwyoQVZjtyVGCA52KJRhRXbSNUGkkwN3/7mIaxQepJR7
 iuog+JhLqKQBpndNTN35oHdPDn2rnXahO3Xx7vmOsxZXqDUs1JrtwY5UwiWm423plAQj
 lo4HD9GZCPKZ25/bwDhXwjYcudcL/Zg3xzqRhLqf4r9rXjw1u5njkPwGOnFinErUgbBz
 YCDMiwdlkMrqWJj2GxZ5QqLrv8qMsrR+Iqj0LfK5k4TPlCzy3PughEAPTlwiNRXlpGVR
 XFx8eCdsk0HIUFNeGUhrVgk3rWB5BrHFd9Ow8NqbjOPmaYbuAs3sCg2YWbchqAuzJNzK
 2vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2gfbOiiR0so3N0eX6gQPc6WKY7PeKJeRfa9G0R50hA=;
 b=huvcWgbQa+BfdwtXpAW3FUWlwoL8RNgBqUMYbF77X2wmwtl2qD2spxH38ZokiD2nJC
 7z8EARO7+xcEdiGzMWe6n41kdtC/8DxRDFtp8Pc85rIPxf5oqT3JSvTW11KtuQ+VbOUY
 nXv8jh5rHrWJTXnh4+5BLPiriotdvyer0lRc/KFy2cDXMrlDAcO6z87q8IS7EdixqsAh
 C+rJFJ3FM/8VsHGFaXe5ox5KCDch0dcOv32JbCl8RIN3rRK1Ks1JKiOYH+r6l0n8LOmk
 PzaCo+NjWZDMVHulYVCj81JKEzS7OUdqGy88KDYInYAtsKiNz1wtX11Bmem4LoF0jcuL
 cOxA==
X-Gm-Message-State: AOAM533I+G+FDYzq4ywTl/eeuiZJypMtfJ8EeHDAGQslvyMpk8zyGIM8
 hE3ZcyZJn41CJY5BXiqLfAaxOFTc2yRjxcvTosw+vw==
X-Google-Smtp-Source: ABdhPJzhr62N6D/DY0NMD6Re7tm+lJuTbYgAQTgrVa6ZpBk/+rg4S7xE0mJMNKGk9FcSYDYEXfBWz/WFBYcaS/gYx8o=
X-Received: by 2002:a2e:804f:: with SMTP id p15mr2979567ljg.199.1601581557161; 
 Thu, 01 Oct 2020 12:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
 <cacbaef2-4221-50d8-3c5d-efab9f1a9c04@i2se.com>
 <20201001064843.dlewcu3b7dvqanyy@gilmour.lan>
 <20201001085402.t6mzzwzplviunhoc@gilmour.lan>
 <CAAvKZ65WqQqH-9JVdb5M6HcKbR3yQdvZha8n9UXXCfciYRq4aA@mail.gmail.com>
 <8bc3f2b0d1b5ae59996bc9316a401a68c92ebac7.camel@suse.de>
In-Reply-To: <8bc3f2b0d1b5ae59996bc9316a401a68c92ebac7.camel@suse.de>
From: Tim Gover <tim.gover@raspberrypi.com>
Date: Thu, 1 Oct 2020 20:45:45 +0100
Message-ID: <CAAvKZ65qyKDrmzHR=HELJmrRdchJ8MEXJZJGcj1oyNXg-BamZA@mail.gmail.com>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, my previous statement was misleading.

enable_uart will select the mini_uart for gpio14,15 unless the
disable-bt device tree overlay is loaded. As well as disabling
bluetooth disable-bt swaps the uart0 pin configs to point the regular
UART to gpio 14,15. After resolving the DT overlays the firmware does
the initial UART setup according to which controller is pointed at
pins 14,15.

I'll have to speak to others about exactly when the fixing of the core
clock takes effect. There have been a few changes related to the
initial turbo frequency configuration and how this is reported via the
mbox APIs

On Thu, 1 Oct 2020 at 17:47, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Tim, thanks for the info!
>
> On Thu, 2020-10-01 at 11:15 +0100, Tim Gover wrote:
> > hdmi_enable_4k60=1 causes the firmware to select 3.3 GHz for the PLLC
> > VCO to support a core-frequency of 550 MHz which is the minimum
> > frequency required by the HVS at 4Kp60. The side effect is that if the
> > display clock requirements are lower than 4Kp60 then you will see
> > different core frequencies selected by DVFS.
> >
> > If enable_uart=1 and the mini-uart is selected (default unless
>
> What is the actual test made to check if mini-uart is selected? I can't get
> firmware to trigger this behaviour with 64-bit upstream kernel/dts. Note that I
> see the core clk setup at 200MHz just before having VC4 set it to 500MHz.
>
> The only thing I've got on my config.txt is:
>
> enable_uart=1
> arm_64bit=1
>
> Maybe we're missing some kind of DT alias upstream?
>
> Regards,
> Nicolas
>
> > bluetooth is disabled) then the firmware will pin the core-frequency
> > to either core_freq max (500 or 550). Although, I think there is a way
> > of pinning it to a lower fixed frequency.
> >
> > The table in overclocking.md defines options for setting the maximum
> > core frequency but unless core_freq_min is specified DVFS will
> > automatically pick the lowest idle frequency required by the display
> > resolution.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
