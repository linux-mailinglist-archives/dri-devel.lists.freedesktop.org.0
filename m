Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D223473A32
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 02:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD710E6EE;
	Tue, 14 Dec 2021 01:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827D010E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 01:30:06 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id m24so12434044pls.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 17:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0RKywhZ17XdnvNotnsdiIgl3sGPJ//QNUd7lYfj1SaM=;
 b=QjTGsa1h5kx80I0UTDg4Dcyw4WMk+n4UOsqoClb8085eb7nRcC/D7ePW+YXRC6U3YI
 yEGGIzf7frwmhWzwVJziM9EYiG1Cm+faZ1d+3+CFM/vuDUD2Vgew7FK+IrwgMrja2Vx5
 /Ztiz962u0awjhX3jgeTtXXiMjdXG7kVjwnTaHISzuM7Xsz1Hm2s8II2zaje81DgEId+
 muk9047tRS3TypZjO0SNgWfboK7xpIfxkVSauatWo4yuIkKDcXC2tU4uXTxY+qB3f8pS
 JOLivxju9Jbd10QSHBow1MSQR3lqwUuih/3lrGV1jQMfojwAIh/8Pz0/X2VP6N3338n1
 xf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0RKywhZ17XdnvNotnsdiIgl3sGPJ//QNUd7lYfj1SaM=;
 b=SGPBKafcGa9sFKSCwY0ogn+nUrcU+rBff0DkpZPjyAY4PRB72mvNZ7kmmD5R/Q/6I3
 Ou38PGJt3vV9mzfCwAOYuHXUx8AOULaijuLSaOk9nRH7cYenfCbu3YZU+imesRlcr6/n
 hkYcwhoUIU9KbclWW1fMmMyADojEEET0wxm2/rQgKEYYULWZFj+8tSHXmG09wEZEg1dD
 ryEEwAiqhIpEYzbZ5tReqiYR2VOaXbNA05YgVTf2axYeQe6EnHjp54Vbr7yuXy7hNiBu
 uiObVkUWF24nSNpyAUCnRaAlKJtYMEV5JEbcTNfzEc5b78tl/r2a0pNqJP9ewrxqKGv6
 2Zkg==
X-Gm-Message-State: AOAM531Bg6/m9i4NDyc2QgFgMoQxnHQPLbaL6F0XPc1Gv3FNqBQoz/7o
 rB25GSlcsXNPIjg2bq9veN4cRN63+0sgCnY55PUZlQ==
X-Google-Smtp-Source: ABdhPJxAVtFF5Uc4MMUH9mm68kIH64f8HumIH4rl1kseR5v0I8Q+MzwUeKsxrViDYz8kTHKwUbB/7deYPi9lARewa2Y=
X-Received: by 2002:a17:90b:4b4c:: with SMTP id
 mi12mr2071642pjb.66.1639445405503; 
 Mon, 13 Dec 2021 17:30:05 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
 <CAPY8ntBeUhqn==To83i8=88KxH0MQzp9n+NVe4Y8eFns1NMFaw@mail.gmail.com>
 <CAJ+vNU0a8gN-4cdFz3qAW3S3zzMt7_bQywAF8OcZ4sp7ZZuQxg@mail.gmail.com>
 <CAPY8ntAHAVtf_-EFD76h9Ua9nOxggwcgYM7GerjZYUZNmOrnUA@mail.gmail.com>
 <CAJ+vNU1Gz64d8i53LeoP-X0aV_83e61YS9d8DQjkaiNZ48oxHw@mail.gmail.com>
 <CAJ+vNU1GbcmtBhQp+RtZ95wmV5YmAhAOZpnLu2y5jnVxato44A@mail.gmail.com>
 <CAPY8ntBkB3ExJGUAhvsWRvhq66F7hbsxB5GZZHMSKP77svSVcw@mail.gmail.com>
 <CAJ+vNU3Z-A8=pqQmTiPZXS-GSdcYMZ578RjLrgW6qHckBX=4nQ@mail.gmail.com>
 <CAJ+vNU0uU0hKWv8p0nN4jtERYZzDByOg_GbS8CAnEvoBxPMv+Q@mail.gmail.com>
 <CAPY8ntDOW9S7Awxz0VS0vaEQTy7WZ39t-gh9oNioqtS1VxO_ag@mail.gmail.com>
 <CAJ+vNU3ZQy2SodE0sxiep-FaSUc4ugGK5BkZxowJF79tZ9iTpA@mail.gmail.com>
 <CAJ+vNU1wKScRB7UGLp9+QFAZNEi2O4Or1rPsaAArdSm_eL1OYA@mail.gmail.com>
In-Reply-To: <CAJ+vNU1wKScRB7UGLp9+QFAZNEi2O4Or1rPsaAArdSm_eL1OYA@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 13 Dec 2021 17:29:53 -0800
Message-ID: <CAJ+vNU0qfYGekS2+sCXFM6Xc+dsu_pAUm3E7AhoWhPSrRy523A@mail.gmail.com>
Subject: Re: RPI 7" display touch controller
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

On Mon, Dec 13, 2021 at 12:58 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Mon, Dec 13, 2021 at 11:39 AM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > On Mon, Dec 13, 2021 at 4:04 AM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > On Fri, 10 Dec 2021 at 22:40, Tim Harvey <tharvey@gateworks.com> wrote:
> > > >
> > > > On Fri, Dec 10, 2021 at 11:29 AM Tim Harvey <tharvey@gateworks.com> wrote:
> > > > >
> > > > > On Fri, Dec 10, 2021 at 10:41 AM Dave Stevenson
> > > > > <dave.stevenson@raspberrypi.com> wrote:
> > > > > >
> > > > > > On Fri, 10 Dec 2021 at 18:20, Tim Harvey <tharvey@gateworks.com> wrote:
> > > > > > >
> > > > > > > On Thu, Nov 18, 2021 at 12:52 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Nov 18, 2021 at 10:30 AM Dave Stevenson
> > > > > > > > <dave.stevenson@raspberrypi.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, 18 Nov 2021 at 17:36, Tim Harvey <tharvey@gateworks.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Thu, Nov 18, 2021 at 6:28 AM Dave Stevenson
> > > > > > > > > > <dave.stevenson@raspberrypi.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Tim
> > > > > > > > > > >
> > > > > > > > > > > On Thu, 18 Nov 2021 at 01:26, Tim Harvey <tharvey@gateworks.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Greetings,
> > > > > > > > > > > >
> > > > > > > > > > > > I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
> > > > > > > > > > > > board and while I've been able to get the MIPI DSI display and
> > > > > > > > > > > > backlight working I still can't seem to figure out the touch
> > > > > > > > > > > > controller.
> > > > > > > > > > > >
> > > > > > > > > > > > It's supposed to have an FT5406 controller on it without an interrupt
> > > > > > > > > > > > so I added polling support drivers/input/touchscreen/edt-ft5x06.c
> > > > > > > > > > > > which I was able to verify using another touchscreen with that
> > > > > > > > > > > > controller but when reading data from the FT5406 on the RPI controller
> > > > > > > > > > > > the data does not make sense.
> > > > > > > > > > > >
> > > > > > > > > > > > These panels appear to route the I2C from the FT5406 to a STM32F103
> > > > > > > > > > > > MPU that then provides a different I2C slave interface to the 15pin
> > > > > > > > > > > > connector that I'm connected to. On that I2C interface I see an i2c
> > > > > > > > > > > > slave at 0x45 which is managed by the regulator driver Marek wrote
> > > > > > > > > > > > (drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
> > > > > > > > > > > > i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
> > > > > > > > > > > > is perhaps obfuscating that touch data.
> > > > > > > > > > > >
> > > > > > > > > > > > Anyone have any ideas on how to make that touch controller useful?
> > > > > > > > > > >
> > > > > > > > > > > There should be nothing unusual. 0x38 is the EDT touch controller.
> > > > > > > > > > > Starting with the Raspberry Pi OS Bullseye release, we're now using
> > > > > > > > > > > the panel directly from DRM rather than through the firmware. That's
> > > > > > > > > > > based on the branch at
> > > > > > > > > > > https://github.com/raspberrypi/linux/tree/rpi-5.10.y/
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Dave,
> > > > > > > > > >
> > > > > > > > > > That sounds like the driver that made it into mainline with Eric's
> > > > > > > > > > commit 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7"
> > > > > > > > > > Touchscreen."). I looked there but that driver just deals with the DSI
> > > > > > > > > > and not with touch.
> > > > > > > > >
> > > > > > > > > No, we've reverted away from that driver as it exposes no regulator
> > > > > > > > > framework either, so again the touch element loses power.
> > > > > > > > >
> > > > > > > > > > > I also added polling support to edt-ft5x04.c.
> > > > > > > > > > > For DT, it uses a combination of the overlays vc4-kms-v3d,
> > > > > > > > > > > vc4-kms-dsi-7inch, and that includes edt-ft5406.dtsi, all of which are
> > > > > > > > > > > in /arch/arm/boot/dts/overlays
> > > > > > > > > >
> > > > > > > > > > It doesn't look like you ever submitted your edt-ft5x04 polling mode
> > > > > > > > > > support upstream. I saw another series to add polling support
> > > > > > > > > > submitted by Nicolas back in 2019 but was never followed up on
> > > > > > > > > > (https://patchwork.kernel.org/project/linux-input/list/?series=112187&archive=both).
> > > > > > > > >
> > > > > > > > > No I haven't as it's been crazy trying to get this lot to work under
> > > > > > > > > KMS at all over the last couple of months.
> > > > > > > > >
> > > > > > > > > > I have updated Nicolas' patch with the changes requested and am happy
> > > > > > > > > > to submit it upstream. The benefit of his patch is that it uses a dt
> > > > > > > > > > binding for the polling interval. I'm happy to submit this upstream.
> > > > > > > > >
> > > > > > > > > I hadn't seen Nicolas' patches, hence implementing it myself.
> > > > > > > > >
> > > > > > > > > If you've implemented the requested changes, could you check that the
> > > > > > > > > polling rate is as expected? We were seeing that the input framework
> > > > > > > > > wasn't delivering the requested poll rate when CONFIG_HZ=100 is
> > > > > > > > > defined in the config. I must confess that I haven't checked it on my
> > > > > > > > > current patch, but it was on my list of things to do.
> > > > > > > > > There was a report that "bd88ce25335d Input: raspberrypi-ts - switch
> > > > > > > > > to using polled mode of input devices" dropped the polling rate from
> > > > > > > > > the desired 60Hz in switching to that framework.
> > > > > > > >
> > > > > > > > Ok, I'll make a note to test that and submit it.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > The main issue I had was configuring the regulator framework
> > > > > > > > > > > appropriately to allow the touch controller power to be separate from
> > > > > > > > > > > the bridge power. Without that if DRM powered down the panel it killed
> > > > > > > > > > > the touch controller too, and the touch driver never reinitialised
> > > > > > > > > > > itself.
> > > > > > > > > >
> > > > > > > > > > I'm using the same drivers/regulator/rpi-panel-attiny-regulator.c
> > > > > > > > > > regulator driver from mainline that Marek added as the power-supply
> > > > > > > > > > for the panel as well as the backlight controller. It looks like the
> > > > > > > > > > version in the rpi-5.10.y has several patches on top of it so I'll
> > > > > > > > > > take a look at those differences to see if it may be affecting the
> > > > > > > > > > touchscreen controller. It's really strange to me that the touch
> > > > > > > > > > controller's I2C goes through the STM32F103 MPU (as in the MPU's I2C
> > > > > > > > > > master connects to the touchscreen controller and a different MPU I2C
> > > > > > > > > > bus presents the touch controller like they are translating
> > > > > > > > > > something?).
> > > > > > > > >
> > > > > > > > > The touchscreen I2C does NOT go through the STM.
> > > > > > > > > The TS interrupt line does feed into the STM, but it's not actually used.
> > > > > > > > > The TC358762 I2C does go through the STM, but it isn't used other than
> > > > > > > > > a kick to bring the bridge out of reset.
> > > > > > > >
> > > > > > > > Ok, I've determined the DFROBOT Rpi displays do differ from the
> > > > > > > > official Rpi 7in display.
> > > > > > > >
> > > > > > > > Official 7in RPI display:
> > > > > > > > - I can't find a schematic anywhere for the official display but I an
> > > > > > > > ohmmeter confirms your claim that the touch controller I2C is
> > > > > > > > connected to the 15pin display I2C.
> > > > > > > > - I do not see the ft5406@0x38 on the i2c bus until I send a command a
> > > > > > > > REG_POWERON cmdto the ATTINY@0x45 'i2c dev 2 && i2c mw 0x45 0x85 1 1'
> > > > > > > > in u-boot
> > > > > > > > - I must disable the rpi-panel-attiny-regulator.c driver as its probe
> > > > > > > > disables REG_POWERON and the linux driver won't see the FT5406
> > > > > > > > - The linux edt-ft5x06.c driver with polling added works fine and
> > > > > > > > gives me expected touch events
> > > > > > > >
> > > > > > > > With the DFROBOT 5in and 7in displays:
> > > > > > > > - the touch interface I2C does not connect directly to the 15pin
> > > > > > > > connector's I2C (shown in the schematic at schematic:
> > > > > > > > https://github.com/DFRobot/Wiki/raw/master/DFR0550_Schematics.pdf and
> > > > > > > > also verified with an ohmeter)
> > > > > > > > - I see the ft5406@0x38 on the i2c bus regardless of setting or
> > > > > > > > clearing REG_POWERON on the ATTINY@0x45
> > > > > > > > - The linux edt-ft5x06.c driver with polling added gives me data that
> > > > > > > > does not make sense for touch events
> > > > > > > >
> > > > > > > > So I can only assume the DFROBOT displays are doing something strange
> > > > > > > > but I'm not clear how what they are doing is compatible with the RPI.
> > > > > > > > I guess I have to get an RPI, hook it up and see if the touch screen
> > > > > > > > works with the rpi 5.10.y kernel.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > I wonder if I'm hitting that reinitialization issue. Do you recall any
> > > > > > > > > > details about that? Was it that the driver returned seemingly invalid
> > > > > > > > > > touch data like I'm getting or did it just not respond?
> > > > > > > > >
> > > > > > > > > If the power goes down then all the registers written during probe [1]
> > > > > > > > > are reset. I don't recall exactly what the data then contained, but I
> > > > > > > > > did get a load of I2C transactions fail with -EREMOTEIO as the
> > > > > > > > > messages weren't ACKed.
> > > > > > > > >
> > > > > > > > > [1] https://elixir.bootlin.com/linux/latest/source/drivers/input/touchscreen/edt-ft5x06.c#L1207
> > > > > > > > >
> > > > > > > > > > Silly question likely but how do I power down the DRM portion to test
> > > > > > > > > > to see if it affects the touch controller?
> > > > > > > > >
> > > > > > > > > xrandr --output DSI-1 --off
> > > > > > > > > There must be a libdrm call to do the equivalent, but I'll admit that
> > > > > > > > > I can't think of an existing tool that implements it.
> > > > > > > >
> > > > > > > > do you know of a sysfs way to do this or something that doesn't require xrandr?
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > > On our branch rpi-panel-attiny-regulator.c has been updated to control
> > > > > > > > > > > those functions independently as GPIOs, which then get used via
> > > > > > > > > > > regulator-fixed, or as reset-gpios.
> > > > > > > > > > > Telling both bridge and touch that they shared a regulator didn't work
> > > > > > > > > > > as the DSI bridge seems mildly fussy about the DSI state when it is
> > > > > > > > > > > powered up.
> > > > > > > > > >
> > > > > > > > > > Hmm... I wonder if this is the problem I had with the 'official' rpi
> > > > > > > > > > 7in display that I never got working. I did get the DFROBOT rpi 5in
> > > > > > > > > > and 7in displays working.
> > > > > > > > >
> > > > > > > > > I'm not that familiar with the DFRobot displays.
> > > > > > > > > I have tried an Osoyoo 3.5" panel [2] that pretends to be the Pi
> > > > > > > > > panel, and it looks similar. Reality is that it uses a Lattice FPGA to
> > > > > > > > > convert from DSI to DPI. All the LP configuration commands sent to it
> > > > > > > > > are ignored. Startup requirements of that compared to the Toshiba are
> > > > > > > > > unknown.
> > > > > > > > >
> > > > > > > > > [2] https://www.amazon.co.uk/OSOYOO-Capacitive-Connector-Resolution-Raspberry/dp/B087WVC1J2
> > > > > > > > >
> > > > > > > > > > > Hope that helps.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > The fact you tell me that the rpi-5.10.y branch goes away from the
> > > > > > > > > > strange 'firmware' driver I found at
> > > > > > > > > > https://github.com/raspberrypi/linux/blob/rpi-4.2.y/drivers/input/touchscreen/rpi-ft5406.c
> > > > > > > > > > and uses the standard ft5406.c driver (with polling mode added) is
> > > > > > > > > > very helpful in that I feel I have a hope of getting this working.
> > > > > > > > >
> > > > > > > > > I have one of our panels working in front of me using my patched
> > > > > > > > > version of edt-ft5x06 as the driver for the touch element.
> > > > > > > > >
> > > > > > > > > > Does the rpi-5.10.y kernel work for the official rpi 7in display as
> > > > > > > > > > well as the DFROBOT displays as far as you know?
> > > > > > > > >
> > > > > > > > > As above, I'm not aware of DFRobot.
> > > > > > > > > With the Osoyoo I can't recall exactly what it was doing with I2C. I
> > > > > > > > > think it only really responded to the ID command and PWM for the
> > > > > > > > > backlight. The reset and power control that is required on our boards
> > > > > > > > > isn't really relevant to them.
> > > > > > > > > I was doing i2cset -y -f <bus> 0x45 0x85 [1|0] to turn power on/off,
> > > > > > > > > and I seem to recall it did nothing.
> > > > > > > >
> > > > > > > > Right... this is also the same with the DFROBOT touchscreen displays.
> > > > > > > >
> > > > > > > > I do really like the build quality, availability, and pricing of the
> > > > > > > > DFROBOT displays but also a huge advantage is that they derive power
> > > > > > > > from the 15pin connector 3.3V pins so there are no other connections.
> > > > > > > > Their backlight doesn't appear to be controllable via PWM however and
> > > > > > > > instead they have a manual brightness thumbwheel on them.
> > > > > > > >
> > > > > > > > The other advantage for me at the moment is that I still haven't
> > > > > > > > gotten the official RPI 7in display to work with the IMX8MM (no pixels
> > > > > > > > displayed) where as the DFROBOT one is working for me.
> > > > > > > >
> > > > > > > > > ...
> > > > > > > > > Just for you I fired it up. It ACKs all I2C addresses just for a
> > > > > > > > > laugh, and indeed it takes no action on 0x85, only 0x86 (for PWM), and
> > > > > > > > > reading 0x80 (ID).
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > Dave,
> > > > > > >
> > > > > > > After some more investigation I've found that while the DFRobot
> > > > > > > DRF0550 and DFR0678 touch controller does not work with the ft5x06
> > > > > > > driver it does indeed work on a Rpi with the raspberrypi-ts driver. So
> > > > > > > from an Rpi perspective the latest OS image doesn't work but the
> > > > > > > 'Legacy' OS image does (which appears to have the same 5.10 kernel but
> > > > > > > uses legacy drivers?).
> > > > > >
> > > > > > You have to love cloned devices.
> > > > > > Have you checked with DFRobot as to what the actual touchscreen
> > > > > > controller chip is?
> > > > >
> > > > > Dave,
> > > > >
> > > > > I tore one apart and verified it has a  FT5316 I2C touchscreen
> > > > > controller (without IRQ) but again it routes directly to a STM32F103
> > > > > (see https://dfimg.dfrobot.com/nobody/wiki/208d6cf05cacd2ee3b349341d5bfd6e2.pdf).
> > > > > So the key difference is that while the official rpi 7in display has
> > > > > both the ft5x06 and whatever the mcu emulates on the soc's i2c the
> > > > > DRROBOT only has the emulated device. Note that I 'can' probe 0x45
> > > > > 'and' 0x38 but the slave at 0x38 does not behave like an ft5x06
> > > > >
> > > > > >
> > > > > > > So if I understand correctly the Rpi has some firmware that talks over
> > > > > > > I2C and translates touch events from this 'legacy API' over to a
> > > > > > > memory mapped area. How can I learn about this firmware and what kind
> > > > > > > of translation it does to make these touch controllers work on a non
> > > > > > > rpi?
> > > > > >
> > > > > > It does very little different from edt-ft5x06.
> > > > > >
> > > > > > At an I2C level it reads register 0x02 of the touchscreen controller
> > > > > > to get the current number of points, and then does that number of 4
> > > > > > byte reads for register (3+6*i) to get the touch information.
> > > > > > The edt-ft5x06 driver just reads all registers from 0 to generally
> > > > > > 0x21 to get all points in one hit. It then parses all the point
> > > > > > information instead of looking at the reported number of points.
> > > > >
> > > > > That seems reasonable with respect to the ft5x06 but then the firmware
> > > > > must present this data somehow as I2C registers (on 0x38 or 0x45?) or
> > > > > I don't see how the DSROBOT touch controllers currently work with
> > > > > raspberrypi-ts as they only have i2c slaves at those addresses.
> > > > >
> > > > > Is this firmware source available?
> > > > >
> > > > > >
> > > > > > There are a couple more commits to our kernel tree for edt-ft5x06 as
> > > > > > we were seeing some issues.
> > > > > > The main one is that it seems unreliable in reporting TOUCH_UP events.
> > > > > > Whilst it's implemented explicitly in the driver with the current
> > > > > > patches, I believe it could be done via the INPUT_MT_DROP_UNUSED flag
> > > > > > if input_mt_sync_frame is used as well. When time allows I was
> > > > > > intending to upstream that fix.
> > > > > >
> > > > >
> > > > > Ok, I see those in your tree.
> > > > >
> > > > > DFROBOT has not been extremely helpful but to be honest I don't think
> > > > > they understand the issue (I didn't until this morning) that their
> > > > > touch controllers work on the old Raspberrypi OS releases using
> > > > > raspberrypi-ts but not the new ones using ft5x06. I explained that
> > > > > this switch took place earlier this year when official OS releases
> > > > > bumped to 5.10 (hope I was correct there) and that they would likely
> > > > > be getting a lot of tech support calls for users with new software.
> > > > > I'm not sure how you can tell the latest software to use the
> > > > > raspberrypi-ts driver instead of the ft5x06 driver (I assume all of
> > > > > that is via device-tree) but I did find that the 'legacy' version of
> > > > > the software uses the old raspberrypi-ts driver. This part does not
> > > > > concern 'me' too much as my goal is to get the touch controllers
> > > > > working on a non rpi.
> > >
> > > The change happened with the release of Bullseye at the start of November.
> > >
> > > You can't safely use raspberrypi-ts alongside
> > > rpi-panel-attiny-regulator, hence the change to edt-ft5x06.
> > > There is no inter-processor arbitration, so the I2C controller can
> > > only be used by either the firmware (raspberrypi-ts) or Linux
> > > (rpi-panel-attiny-regulator). Trying to do it from both causes race
> > > conditions and responding to transactions from the other processor.
> > >
> >
> > Yes this makes sense - you can't have the Linux and the embedded
> > firmware accessing the same I2C controller at the same time.
> >
> > > > Looking at the i2c regs from the DFROBOT panels from slave address
> > > > 0x38 I've been able to decode the following:
> > > > 0x00[7:4] event_type? (always 0x8)
> > > > 0x00[3:0] MSBX
> > > > 0x01[7:0] LSBX
> > > > 0x02[7:4] touchid? (typically 0x0 but when I pinch sometimes it goes to a 0x1)
> > > > 0x02[3:0] MSBY
> > > > 0x03[7:0] LSBY
> > > >
> > > > I can't quite figure out how to determine up/down events yet.
> > > > Comparing this to FT5x06 registers and raspberrypi-ts.c I would guess
> > > > that 0x00[7:4] is event_type and 0x02[7:4] is touchid but I never see
> > > > event_type change from 0x8 and touchid is 0x0 unless I pinch/unpinch
> > > > (but that seems very unreliable).
> > >
> > > Sorry, but I have no information as to what the DFROBOT panel is
> > > doing. It's not our product.
> >
> > I realize that but somehow it is mimicking the official rpi
> > touchscreen enough to where the firmware/raspberrypi-ts works.
> >
> > >
> > > On the Raspberry Pi panel we have an FT5406 directly on the I2C bus at
> > > address 0x38.
> > > It sounds like DFROBOT are bridging the FT5316 to look like a FT5406,
> > > but potentially only implementing the access pattern that the Pi
> > > firmware uses.
> > >
> >
> > Here is an i2c dump from the official rpi panel:
> > u-boot=> i2c dev 2 && i2c probe
> > Setting bus to 2
> > Valid chip addresses: 45
> > u-boot=> i2c mw 0x45 0x85 1 1
> > u-boot=> i2c dev 2 && i2c probe
> > Setting bus to 2
> > Valid chip addresses: 38 45
> > u-boot=> i2c md 0x38 0 10
> > 0000: 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > u-boot=> i2c md 0x38 0 100
> > 0000: 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > 0080: 2d 2d 12 14 11 a0 01 05 00 1e 00 01 00 00 00 00    --..............
> > 0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22    ..............."
> > 00a0: 13 00 02 54 01 01 0b 01 79 01 0c 00 00 01 01 0a    ...T....y.......
> > 00b0: 00 09 00 00 00 00 00 00 00 00 00 00 00 00 00 55    ...............U
> > 00c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> > 00d0: 00 00 00 00 00 00 00 00 00 00 00 00 17 0d 00 0a    ................
> > 00e0: ff ff ff ff ff ff ff ff ff ff ff eb aa 08 eb aa    ................
> > 00f0: ff ff ff ff ff ff ff ff ff ff ff ff 01 00 32 ff    ..............2.
> >
> > This does identify as a M09/Generic edt_ft5x06 and when I apply:
> >
> > a single touch point:
> > u-boot=> i2c md 0x38 0 10
> > 0000: 00 00 01 80 de 00 fc 00 00 ff ff ff ff ff ff ff    ................
> > ^^^ 0x02=1 pt
> >
> > 2 points:
> > u-boot=> i2c md 0x38 0 10
> > 0000: 00 00 02 81 ab 00 f4 00 00 80 b0 10 f1 00 00 ff    ................
> > ^^^ 0x02=2 pt
> >
> > 0 points:
> > u-boot=> i2c md 0x38 0 10
> > 0000: 00 00 00 40 f7 01 4c 00 00 ff ff ff ff ff ff ff    ...@..L.........
> >
> > This all makes sense.
> >
> > When I look at the DFROBOT touch controller data:
> > u-boot=> i2c md 0x38 0 100
> > 0000: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0010: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0020: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0030: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0040: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0050: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0060: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0070: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0080: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 0090: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 00a0: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 00b0: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 00c0: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 00d0: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 00e0: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> > 00f0: ff ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00 ff 0f 00    ................
> >
> > This also gets identified as a M09/Generic edt_ft5x06
> >
> > But when apply a single touch point:
> >
> > u-boot=> i2c md 0x38 0 10
> > 0000: 82 3e 00 47 3e 00 47 3e 00 47 3e 00 47 3e 00 47    .>.G>.G>.G>.G>.G
> > ^^^ 0x02=0 points
> >
> > So this clearly does not follow the ft5x06 register mapping. Again I
> > was able to determine the register mapping is
> > 0x00[7:4] event_type? (always 0x8)
> > 0x00[3:0] MSBX
> > 0x01[7:0] LSBX
> > 0x02[7:4] touchid? (typically 0x0 but when I pinch sometimes it goes to a 0x1)
> > 0x02[3:0] MSBY
> > 0x03[7:0] LSBY
> >
> > It seems to only report 1 point regardless of how many points I apply
> > as the data after reg 0 just seems to repeat the values of reg 1,2,3.
> > It also does not seem to indicate any difference when I remove the
> > press so I'm not clear how to determine 0 point or pen-up
> >
> > What I don't understand is how does this work on an actual Rpi with
> > raspberrypi-ts if the firmware in the broadcom is doing what you
> > describe below?
> >
> > > The firmware is closed source, but there's nothing secret or clever in
> > > the loop that polls the touchscreen
> > >
> > >       while (in_use)
> > >       {
> > >          int err;
> > >          unsigned char num_points;
> > >
> > >          vcos_sleep(17); // 60fps
> > >
> > >          // This is a special number meaning there is no new information to be
> > >          // read.  We will set the num correctly after the read is complete
> > >          touch_data[2] = 99;
> > >          // Read number of presses
> > >          err = i2c_driver->read(i2c_handle, 2, 1, &num_points);
> > > //handle, register address, num_bytes_to_read, addr.
> > >          if (err || num_points > 10)
> > >             num_points = 0;
> > >          for (i = 0; i < num_points; i++)
> > >             i2c_driver->read(i2c_handle, 3+6*i, 4, touch_data+3+6*i);
> > > //handle, register address, num_bytes_to_read, addr.
> > >
> > >          for (i = 0; i < num_points; i++)
> > >          {
> > >             int x = (touch_data[3+6*i] & 0xf) << 8 | touch_data[4+6*i] << 0;
> > >             int y = (touch_data[5+6*i] & 0xf) << 8 | touch_data[6+6*i] << 0;
> > >             if (TC358762_state.flips & 1<<2)
> > >                x = TC358762_DISPLAY_WIDTH-1-x;
> > >             if (!(TC358762_state.flips & 1<<3))
> > >                y = TC358762_DISPLAY_HEIGHT-1-y;
> > >             touch_data[3+6*i] = touch_data[3+6*i] & 0xf0 | (x >> 8) & 0xf;
> > >             touch_data[4+6*i] = x >> 0;
> > >             touch_data[5+6*i] = touch_data[5+6*i] & 0xf0 | (y >> 8) & 0xf;
> > >             touch_data[6+6*i] = y >> 0;
> > >          }
> > >          // Make sure the setting of the number of points occurs after
> > > setting up x,y
> > >          touch_data[2] = num_points;
> > >       }
> > >
> > > touch_data is the address of the buffer that is shared with raspberrypi-ts.
> > > All those I2C reads are for address 0x38.
> > > touch_data is processed by
> > > https://github.com/torvalds/linux/blob/master/drivers/input/touchscreen/raspberrypi-ts.c#L84
> > > Note that raspberrypi-ts does do a input_mt_report_slot_inactive for
> > > each ID not included in an update, so there is no need for the TS
> > > controller to send an explicit touch up eventwd.
> > >
> > > edt-ft5x06.c reads ID registers to identify the TS controller. Does it
> > > get an erroneous answer there and try processing as EDT_M06?
> >
> > No, it processes it as GENERIC_FT but it does not respond with a
> > FT5x06 compatible register set, yet again somehow 'it works' when
> > connected to a Rpi running the 'legacy OS" with the 5.10 kernel and
> > the raspberrypi-ts driver (and does not work on the rpi using the
> > non-legacy OS which uses the ft5x06 driver).
> >
>
> Dave,
>
> When putting one of these displays on a rpi with the ft5x06 driver I
> notice that it behaves differently then when on an non rpi. The
> register API of 0x38 appears to change. When on a rpi 0x38 reg 0x02
> starts properly showing the number of touch events (but the data of
> the events is still wrong which is why it fails to work with the
> ft5x06). I'm wondering if something sent to attiny at 0x45 is changing
> the behavior of the firmware on the DFROBOT MCU that translates the
> touch events. Is the register set of the attiny at 0x45 documented
> anywhere?
>

Dave,

I've finally figured out what is going on. The microcontroller in the
DFROBOT touchscreen displays is depending on the i2c access to be
exactly the way the rpi firmware behaves as you have described above.
The ft5x06 driver ends up reading too many registers and gets the
registers out of sync.

Thanks for all of your help! I would not have been able to figure this
out without you explaining exactly what the rpi firmware does.

I'm still trying to figure out if I should create a new input driver
or if I can make some minor changes to the ft5x06 driver that can be
dealt with by a new compatible/version. I'm also having an issue where
on power-up the controller erroneously reports there is 1 point when
there isn't any until I press and release it and I'm unclear how to
deal with that.

Best regards,

Tim
