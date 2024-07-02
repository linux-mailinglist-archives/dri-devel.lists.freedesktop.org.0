Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015ED9248C3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 22:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6667F10E29A;
	Tue,  2 Jul 2024 20:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NxpF1hXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A0A10E29A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 20:08:47 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so55758361fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 13:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719950926; x=1720555726; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IzH64RTqn+FaUcV18/HlgJMuVfUQPdBgy9ejrE2KEAw=;
 b=NxpF1hXFSJLad681TMZ5wtIURA043ZHgMJ7JVsEbYHMhyOwe55oLBcvjBwCsyuFCFg
 HwiptnmjxzZowpbnKQTvPIP3LgXxYkmR8BGGzJ0L0AzOdibsDW1F3Obkh8MvO0sOeb7F
 7suRczcBCZIY2UNUnr1voP7zPSEGrHSippsH1jpLR666gYa1uya9dyPczIncCputoz5i
 0ZciEt1oI6cwoVYW8EAypMo6/xt3Fx9mnt2rzTq5milHYj2v7E2X8B29rQFRZRXHUYl0
 pUyUnSLhxrvWIBK+JIb97m5P+KT3v5p7Bo8tpoaSvjjrfDNwpRtRO9pgmHd3Uxm47yq0
 EUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719950926; x=1720555726;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IzH64RTqn+FaUcV18/HlgJMuVfUQPdBgy9ejrE2KEAw=;
 b=ipZ+3Jdhtqw3k4JJMkM6RStIa3ZGiGwhQDmdzGMCX8jmww1pZsIOCf0xSfos7iUPMu
 AFN5gCwkPy8u1qKuBbBr/DiV5UKrQxznT7aedLeCYm8GvxkuCL0z7CcxHJXJ5zxaWXaJ
 QdXUVE8Rs/HmwzhfHbP1ZITMBuh1x09pItvczxLtxsgr5IjRsHNheumNMMskFotwrysD
 v2VamvNpHr1nXJHMKjrh5bgFxagDusUKeR+4VYpktWsro0WPt4NYlncALdqSZBEgAJwr
 ByvNmVJLpXZsrRsdg8nsKU75oELhU5Aqi2nXoNXnmi10BQTKvVyjIVRLiWF2Ko5sWpMf
 1K0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXGzcRNjme7T+alFf3+ZiZ9d/L7mFFa159ybyXrcQSKTEjlivW+oWo83AhMQLtNIHyD2XOAZ9FEcJQOLzVrXT/SD9G6kVPjD0rQq+iCcma
X-Gm-Message-State: AOJu0YwXkZ49E80MFBVnWEJ6iRf0iF6YzXJS+j3Z/F9NM4+bNbpDLVy8
 ApET90g3C8qKk+1z5nrLlTA90NanC4rnT4Ms7goobmW4QJSPICs4TCuewSoNRkh5QFhv/v8G2/e
 dAuhsThWnjwcRPmPn2TR5k+8SOkY=
X-Google-Smtp-Source: AGHT+IEbnNwEICAmy8lZBda4cz1ZJA7iuStARN+4cLloZVt3cvlyN0vsRezK8xmrP3tIgonfEjrZvr0zWEcZ2HWVKkg=
X-Received: by 2002:a05:651c:86:b0:2ec:588d:7eb8 with SMTP id
 38308e7fff4ca-2ee5e36eb67mr61061881fa.21.1719950925725; Tue, 02 Jul 2024
 13:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240630153652.318882-1-wahrenst@gmx.net>
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 2 Jul 2024 21:08:34 +0100
Message-ID: <CALeDE9OFKS_g3KU=AuN-o_jLRyDG1eiJhXs0rLRQx-1GyA+dcA@mail.gmail.com>
Subject: Re: [PATCH 00/11] ARM: bcm2835: Implement initial S2Idle for
 Raspberry Pi
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

> This series implement the initial Suspend-To-Idle support for
> the Raspberry Pi, which was a long time on my TODO list [1]. The
> changes allow to suspend and resume the Raspberry Pi via debug UART.
> The focus is on the BCM2835 SoC, because it's less complex than its
> successors and have enough documentation.

Firstly a big thank you for this work!

> The series is a loose collection of fixes and improvements.
> So cherry-picking should be fine.
>
> Test steps:
> - configure debug console (pl011 or mini UART) as wakeup source
> - send system to idle state
>
>   echo freeze > /sys/power/state
>
> - wakeup system by console traffic
>
> The implementation isn't perfect and contains workarounds like
> patch 4 and 9. So there is still room for improvements, but
> at least the system won't freeze forever as before [2].

I've got a test kernel for Fedora that I'm going to test on
RPi3/Zero2W so let me know if you want me to test anything in
particular, I will do my best to give review/test on each individual
test over the next few days.

Cheer,
Peter

> Here are some figures for the Raspberry Pi 1 (without any
> devices connected except of a debug UART):
>
> running but CPU idle = 1.67 W
> suspend to idle      = 1.33 W
>
> The series has been tested on the following platforms:
> Raspberry Pi 1 B
> Raspberry Pi 3 A+
> Raspberry Pi 3 B+
>
> Known issues:
> - currently it's not possible to power down the USB domain [3]
> - there seems to be an issue with the DWC2 suspend handling [4]
>
> [1] - https://github.com/lategoodbye/rpi-zero/issues/9
> [2] - https://bugzilla.redhat.com/show_bug.cgi?id=2283978
> [3] - https://github.com/raspberrypi/firmware/issues/1894
> [4] - https://lore.kernel.org/linux-usb/3fd0c2fb-4752-45b3-94eb-42352703e1fd@gmx.net/T/
>
> Stefan Wahren (11):
>   firmware: raspberrypi: Improve timeout warning
>   mailbox: bcm2835: Fix timeout during suspend mode
>   pmdomain: raspberrypi-power: Adjust packet definition
>   pmdomain: raspberrypi-power: Avoid powering down USB
>   irqchip/bcm2835: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
>   drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get
>   drm/vc4: hdmi: Disable connector status polling during suspend
>   usb: dwc2: debugfs: Print parameter no_clock_gating
>   usb: dwc2: Skip clock gating on Broadcom SoCs
>   serial: 8250_bcm2835aux: add PM suspend/resume support
>   ARM: bcm2835_defconfig: Enable SUSPEND
>
>  arch/arm/configs/bcm2835_defconfig        |  2 --
>  drivers/firmware/raspberrypi.c            |  3 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 18 +++++++++++++++++-
>  drivers/irqchip/irq-bcm2835.c             |  4 +++-
>  drivers/mailbox/bcm2835-mailbox.c         |  3 ++-
>  drivers/pmdomain/bcm/raspberrypi-power.c  | 17 ++++++++++++-----
>  drivers/tty/serial/8250/8250_bcm2835aux.c | 23 +++++++++++++++++++++++
>  drivers/usb/dwc2/debugfs.c                |  1 +
>  drivers/usb/dwc2/params.c                 |  1 +
>  9 files changed, 61 insertions(+), 11 deletions(-)
>
> --
> 2.34.1
>
