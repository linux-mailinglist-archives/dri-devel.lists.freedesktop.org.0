Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161BE456262
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 19:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFFA6E98E;
	Thu, 18 Nov 2021 18:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E026E98E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 18:30:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i5so13396585wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4RYu3cocqHvKgqX/dbpDzXUbYJs9EwTlwQ3tFei5gno=;
 b=Bw8SAKevhHL0LOHwIcjlPB/XdLMIAc7qTZNpTFDTe/CVjcUIejzyMXOwiBe7TzKFFE
 HAkXif88ayTwoiekUWnxI3+PLrSKKEWLOq7fpXjsJyoXzuRaaErCYz9NpaO3kgz50Jgn
 Muj8MjUwNJV5aulD7ReUR5Gm9czy/Bgdxi7T8yglhgj5rMZx2+TVUOaI2rNquEkEnJSy
 SeZCEBC7FPdffP6XL74DImYLyK/g7jt/VowCbygPjPz7RLcxizwFLGnG0yG4rePupgi7
 kVU0Mwtm0T23eTXQilniv9KIfrdOkVg+Jb2judB0ftzcVpkc+xjdoX6+2uzpz5hjeIE+
 WOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4RYu3cocqHvKgqX/dbpDzXUbYJs9EwTlwQ3tFei5gno=;
 b=YsR8X/pgDVJCt5bbwj5HLRISv0a+eBEcqnrsG9//sPBJiTrG0e4oCrJZqmt0ww7GLC
 lwyIsoPvdx2vyItaXY5hHVxb7U7VMxxZmVArxxFprmCUZBop4sJ0zbB3btvqq7UcD96Y
 JM50oOqDkKspV6oektJX+amw5P3hXkw6dNREz9rKgq8xuowkhumENI8avZCXKmb8FLq+
 k8A2rG0Uw55XiZCQcF+cY0ruRjrlPUYedUSOauefC5kObeV3J8oKPH1grv3vY0g0CSEe
 MjXmC0oGa+7KC44fkz8dFPGjh3Kd6bqMBRwjcxQ7L8+lfQsthA1n9JhsMPMkR3Iiag5p
 dcjg==
X-Gm-Message-State: AOAM530prJqa5G2LMAnDRVy+uvZkGboTXkDkELGZSjQpOGd//rrw1zik
 L5L5SIBdkwHWYQ4f1ci2sZZdn9HCQScJokTqPDDpLQ==
X-Google-Smtp-Source: ABdhPJy+2A0aCVLO44zvpjoVoWZIsPIn9DzKppQA0vEJAE6CPv7rCuMar6ymk0VuZKiMrwFxF9ogotrZCxZV0pO4zog=
X-Received: by 2002:a5d:5850:: with SMTP id i16mr33238928wrf.197.1637260212829; 
 Thu, 18 Nov 2021 10:30:12 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
 <CAPY8ntBeUhqn==To83i8=88KxH0MQzp9n+NVe4Y8eFns1NMFaw@mail.gmail.com>
 <CAJ+vNU0a8gN-4cdFz3qAW3S3zzMt7_bQywAF8OcZ4sp7ZZuQxg@mail.gmail.com>
In-Reply-To: <CAJ+vNU0a8gN-4cdFz3qAW3S3zzMt7_bQywAF8OcZ4sp7ZZuQxg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 18 Nov 2021 18:29:56 +0000
Message-ID: <CAPY8ntAHAVtf_-EFD76h9Ua9nOxggwcgYM7GerjZYUZNmOrnUA@mail.gmail.com>
Subject: Re: RPI 7" display touch controller
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: Marek Vasut <marex@denx.de>, Eric Anholt <eric@anholt.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Nov 2021 at 17:36, Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Thu, Nov 18, 2021 at 6:28 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Tim
> >
> > On Thu, 18 Nov 2021 at 01:26, Tim Harvey <tharvey@gateworks.com> wrote:
> > >
> > > Greetings,
> > >
> > > I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
> > > board and while I've been able to get the MIPI DSI display and
> > > backlight working I still can't seem to figure out the touch
> > > controller.
> > >
> > > It's supposed to have an FT5406 controller on it without an interrupt
> > > so I added polling support drivers/input/touchscreen/edt-ft5x06.c
> > > which I was able to verify using another touchscreen with that
> > > controller but when reading data from the FT5406 on the RPI controller
> > > the data does not make sense.
> > >
> > > These panels appear to route the I2C from the FT5406 to a STM32F103
> > > MPU that then provides a different I2C slave interface to the 15pin
> > > connector that I'm connected to. On that I2C interface I see an i2c
> > > slave at 0x45 which is managed by the regulator driver Marek wrote
> > > (drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
> > > i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
> > > is perhaps obfuscating that touch data.
> > >
> > > Anyone have any ideas on how to make that touch controller useful?
> >
> > There should be nothing unusual. 0x38 is the EDT touch controller.
> > Starting with the Raspberry Pi OS Bullseye release, we're now using
> > the panel directly from DRM rather than through the firmware. That's
> > based on the branch at
> > https://github.com/raspberrypi/linux/tree/rpi-5.10.y/
> >
>
> Dave,
>
> That sounds like the driver that made it into mainline with Eric's
> commit 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7"
> Touchscreen."). I looked there but that driver just deals with the DSI
> and not with touch.

No, we've reverted away from that driver as it exposes no regulator
framework either, so again the touch element loses power.

> > I also added polling support to edt-ft5x04.c.
> > For DT, it uses a combination of the overlays vc4-kms-v3d,
> > vc4-kms-dsi-7inch, and that includes edt-ft5406.dtsi, all of which are
> > in /arch/arm/boot/dts/overlays
>
> It doesn't look like you ever submitted your edt-ft5x04 polling mode
> support upstream. I saw another series to add polling support
> submitted by Nicolas back in 2019 but was never followed up on
> (https://patchwork.kernel.org/project/linux-input/list/?series=112187&archive=both).

No I haven't as it's been crazy trying to get this lot to work under
KMS at all over the last couple of months.

> I have updated Nicolas' patch with the changes requested and am happy
> to submit it upstream. The benefit of his patch is that it uses a dt
> binding for the polling interval. I'm happy to submit this upstream.

I hadn't seen Nicolas' patches, hence implementing it myself.

If you've implemented the requested changes, could you check that the
polling rate is as expected? We were seeing that the input framework
wasn't delivering the requested poll rate when CONFIG_HZ=100 is
defined in the config. I must confess that I haven't checked it on my
current patch, but it was on my list of things to do.
There was a report that "bd88ce25335d Input: raspberrypi-ts - switch
to using polled mode of input devices" dropped the polling rate from
the desired 60Hz in switching to that framework.

> >
> > The main issue I had was configuring the regulator framework
> > appropriately to allow the touch controller power to be separate from
> > the bridge power. Without that if DRM powered down the panel it killed
> > the touch controller too, and the touch driver never reinitialised
> > itself.
>
> I'm using the same drivers/regulator/rpi-panel-attiny-regulator.c
> regulator driver from mainline that Marek added as the power-supply
> for the panel as well as the backlight controller. It looks like the
> version in the rpi-5.10.y has several patches on top of it so I'll
> take a look at those differences to see if it may be affecting the
> touchscreen controller. It's really strange to me that the touch
> controller's I2C goes through the STM32F103 MPU (as in the MPU's I2C
> master connects to the touchscreen controller and a different MPU I2C
> bus presents the touch controller like they are translating
> something?).

The touchscreen I2C does NOT go through the STM.
The TS interrupt line does feed into the STM, but it's not actually used.
The TC358762 I2C does go through the STM, but it isn't used other than
a kick to bring the bridge out of reset.

> I wonder if I'm hitting that reinitialization issue. Do you recall any
> details about that? Was it that the driver returned seemingly invalid
> touch data like I'm getting or did it just not respond?

If the power goes down then all the registers written during probe [1]
are reset. I don't recall exactly what the data then contained, but I
did get a load of I2C transactions fail with -EREMOTEIO as the
messages weren't ACKed.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/input/touchscreen/edt-ft5x06.c#L1207

> Silly question likely but how do I power down the DRM portion to test
> to see if it affects the touch controller?

xrandr --output DSI-1 --off
There must be a libdrm call to do the equivalent, but I'll admit that
I can't think of an existing tool that implements it.

> > On our branch rpi-panel-attiny-regulator.c has been updated to control
> > those functions independently as GPIOs, which then get used via
> > regulator-fixed, or as reset-gpios.
> > Telling both bridge and touch that they shared a regulator didn't work
> > as the DSI bridge seems mildly fussy about the DSI state when it is
> > powered up.
>
> Hmm... I wonder if this is the problem I had with the 'official' rpi
> 7in display that I never got working. I did get the DFROBOT rpi 5in
> and 7in displays working.

I'm not that familiar with the DFRobot displays.
I have tried an Osoyoo 3.5" panel [2] that pretends to be the Pi
panel, and it looks similar. Reality is that it uses a Lattice FPGA to
convert from DSI to DPI. All the LP configuration commands sent to it
are ignored. Startup requirements of that compared to the Toshiba are
unknown.

[2] https://www.amazon.co.uk/OSOYOO-Capacitive-Connector-Resolution-Raspberry/dp/B087WVC1J2

> > Hope that helps.
> >
>
> The fact you tell me that the rpi-5.10.y branch goes away from the
> strange 'firmware' driver I found at
> https://github.com/raspberrypi/linux/blob/rpi-4.2.y/drivers/input/touchscreen/rpi-ft5406.c
> and uses the standard ft5406.c driver (with polling mode added) is
> very helpful in that I feel I have a hope of getting this working.

I have one of our panels working in front of me using my patched
version of edt-ft5x06 as the driver for the touch element.

> Does the rpi-5.10.y kernel work for the official rpi 7in display as
> well as the DFROBOT displays as far as you know?

As above, I'm not aware of DFRobot.
With the Osoyoo I can't recall exactly what it was doing with I2C. I
think it only really responded to the ID command and PWM for the
backlight. The reset and power control that is required on our boards
isn't really relevant to them.
I was doing i2cset -y -f <bus> 0x45 0x85 [1|0] to turn power on/off,
and I seem to recall it did nothing.
...
Just for you I fired it up. It ACKs all I2C addresses just for a
laugh, and indeed it takes no action on 0x85, only 0x86 (for PWM), and
reading 0x80 (ID).

  Dave
