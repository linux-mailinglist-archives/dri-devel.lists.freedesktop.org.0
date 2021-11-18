Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9A456195
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 18:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE396E9BC;
	Thu, 18 Nov 2021 17:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DF46E9BC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 17:36:19 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso6379936pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+bRm7uqP0bsF+P/Rxc0l/IcDov0dVtgfjEXOkLPGT0=;
 b=HrF7p2Mnq07snrWlsC1uUoV/QOwOK6D+jyHJLVDGPOoXpXktiFNT2/IBnALefsHfEc
 bym/KI+CN0kzfrbisKb8Rpdwckwe0CxhxAUKLeaMIMhfOBlnRG0fdrUhDNpkuUirEMtU
 xREtpbdlKkAoHnb5idnvG5yXL6Fxcjs5v6tJZ1wAkZTA9Chia1WJyFltj5gOAhiWT6iq
 iXWfkDa0f1BSglI3ez+Hc2bP/OKkLPqDWCzDHu0+zrgMI0hG/rJJP/tEjiC989fFC/QN
 FiAIv0rNRiH2sk/eyQDaPeD0Ll+ehkibqhWeksPnhm5f99GlnprxNB5EtSL/b4DWR1tz
 H2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+bRm7uqP0bsF+P/Rxc0l/IcDov0dVtgfjEXOkLPGT0=;
 b=h4icRYjdJzilU11hU/GBVa4e2V2PbgN+lGWJRyVVsre/6gUkpFsdPfEMJzWrsVW8F+
 +QrDBjmGiIPYwkC3MsEx/fI9sCW0JFjntfwCNXmJKh1e0RxZeTFJ54W4aylA06ZoGaWo
 DTJhmQHcYmYyaV+U4Prj5ghNQg/85O89ENcavrEIARuEEwHN6IunzqRHdS5k+xRxQhoS
 vbdqSY/7y9yzxp+sSD88lhTmkhCzaw0YxV2UU07VBeYmItmWilJOjF69gK9zvCFyruAO
 3r2a4mfFrZNWQnjbSI7/M9kcxqJmbfzLBUlER9ya8ueXhJKIHztOK1dyECs7ZFRd0wot
 hxoQ==
X-Gm-Message-State: AOAM531UpVoIb3NKBCmLmfjUndGDvj9/o3FOq7zqoaIjnKyH/cvq5zXJ
 kRyMzGluLt4XXWM2Z/9NwHF23hRpTcb9L00VBMGUouRaTW7QxmYI
X-Google-Smtp-Source: ABdhPJxeBL4AJMTDb2HV82H3cDr2/8L/gkud36J8KUht5/4rgAwk3BbMB7A4k+maG5fh+iNaR6570D6KfBAK4ZZ3sRw=
X-Received: by 2002:a17:90b:1b06:: with SMTP id
 nu6mr12432483pjb.155.1637256978961; 
 Thu, 18 Nov 2021 09:36:18 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
 <CAPY8ntBeUhqn==To83i8=88KxH0MQzp9n+NVe4Y8eFns1NMFaw@mail.gmail.com>
In-Reply-To: <CAPY8ntBeUhqn==To83i8=88KxH0MQzp9n+NVe4Y8eFns1NMFaw@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 18 Nov 2021 09:36:07 -0800
Message-ID: <CAJ+vNU0a8gN-4cdFz3qAW3S3zzMt7_bQywAF8OcZ4sp7ZZuQxg@mail.gmail.com>
Subject: Re: RPI 7" display touch controller
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 6:28 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Tim
>
> On Thu, 18 Nov 2021 at 01:26, Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Greetings,
> >
> > I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
> > board and while I've been able to get the MIPI DSI display and
> > backlight working I still can't seem to figure out the touch
> > controller.
> >
> > It's supposed to have an FT5406 controller on it without an interrupt
> > so I added polling support drivers/input/touchscreen/edt-ft5x06.c
> > which I was able to verify using another touchscreen with that
> > controller but when reading data from the FT5406 on the RPI controller
> > the data does not make sense.
> >
> > These panels appear to route the I2C from the FT5406 to a STM32F103
> > MPU that then provides a different I2C slave interface to the 15pin
> > connector that I'm connected to. On that I2C interface I see an i2c
> > slave at 0x45 which is managed by the regulator driver Marek wrote
> > (drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
> > i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
> > is perhaps obfuscating that touch data.
> >
> > Anyone have any ideas on how to make that touch controller useful?
>
> There should be nothing unusual. 0x38 is the EDT touch controller.
> Starting with the Raspberry Pi OS Bullseye release, we're now using
> the panel directly from DRM rather than through the firmware. That's
> based on the branch at
> https://github.com/raspberrypi/linux/tree/rpi-5.10.y/
>

Dave,

That sounds like the driver that made it into mainline with Eric's
commit 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7"
Touchscreen."). I looked there but that driver just deals with the DSI
and not with touch.

> I also added polling support to edt-ft5x04.c.
> For DT, it uses a combination of the overlays vc4-kms-v3d,
> vc4-kms-dsi-7inch, and that includes edt-ft5406.dtsi, all of which are
> in /arch/arm/boot/dts/overlays

It doesn't look like you ever submitted your edt-ft5x04 polling mode
support upstream. I saw another series to add polling support
submitted by Nicolas back in 2019 but was never followed up on
(https://patchwork.kernel.org/project/linux-input/list/?series=112187&archive=both).

I have updated Nicolas' patch with the changes requested and am happy
to submit it upstream. The benefit of his patch is that it uses a dt
binding for the polling interval. I'm happy to submit this upstream.

>
> The main issue I had was configuring the regulator framework
> appropriately to allow the touch controller power to be separate from
> the bridge power. Without that if DRM powered down the panel it killed
> the touch controller too, and the touch driver never reinitialised
> itself.

I'm using the same drivers/regulator/rpi-panel-attiny-regulator.c
regulator driver from mainline that Marek added as the power-supply
for the panel as well as the backlight controller. It looks like the
version in the rpi-5.10.y has several patches on top of it so I'll
take a look at those differences to see if it may be affecting the
touchscreen controller. It's really strange to me that the touch
controller's I2C goes through the STM32F103 MPU (as in the MPU's I2C
master connects to the touchscreen controller and a different MPU I2C
bus presents the touch controller like they are translating
something?).

I wonder if I'm hitting that reinitialization issue. Do you recall any
details about that? Was it that the driver returned seemingly invalid
touch data like I'm getting or did it just not respond?

Silly question likely but how do I power down the DRM portion to test
to see if it affects the touch controller?

> On our branch rpi-panel-attiny-regulator.c has been updated to control
> those functions independently as GPIOs, which then get used via
> regulator-fixed, or as reset-gpios.
> Telling both bridge and touch that they shared a regulator didn't work
> as the DSI bridge seems mildly fussy about the DSI state when it is
> powered up.

Hmm... I wonder if this is the problem I had with the 'official' rpi
7in display that I never got working. I did get the DFROBOT rpi 5in
and 7in displays working.

>
> Hope that helps.
>

The fact you tell me that the rpi-5.10.y branch goes away from the
strange 'firmware' driver I found at
https://github.com/raspberrypi/linux/blob/rpi-4.2.y/drivers/input/touchscreen/rpi-ft5406.c
and uses the standard ft5406.c driver (with polling mode added) is
very helpful in that I feel I have a hope of getting this working.

Does the rpi-5.10.y kernel work for the official rpi 7in display as
well as the DFROBOT displays as far as you know?

Best regards,

Tim
