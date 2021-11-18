Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E6455DFD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 15:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0818D6E907;
	Thu, 18 Nov 2021 14:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1846E907
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 14:28:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso5007695wmf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rlNuge4/Sr0/N1IjlujE+v42CdUk2n7rMp6ZEpdSTc=;
 b=CAoZ0sO34gXeSJnCbv+Tz5nh3yxg2s5XpOZ+RE9u7jaypZpLPJ9Tk0aQVa0aIONa/j
 cUAHIXwpFiP7nL8r46Y+bTVUex/5hEug4gLYYsUt0uaVix/Ho3xJ/Thne/im/AxWhUG2
 YHj0T1EQNF6tpvidpA6M0LYnv47myyHXuCIaINBF8HVJmIrs2QEVEbdERqfUywiwV+Jk
 38KGp90gA1CQxyn39gUnq2YTQyKZoGMS4jtHWN8YvH3tZ50Z+u2RVBNl0SwyZU2CE8dk
 CdE7NTjiORA6CDsdMmz3tOjSq9INUnCNPPyQzSeVqitb07w5G8kGqqjUO5rjD0pyw7Hm
 eplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rlNuge4/Sr0/N1IjlujE+v42CdUk2n7rMp6ZEpdSTc=;
 b=1jjtzVl5bf4Hof9yDdam+qoxccOjsqSZyLYK5QN56EsNLC9uRWiXv46fxdnPAw6xXJ
 ngGr6zCxyaKxvq+QDZF75kStda58Md3rY2PIVizQGvDvMUvvq1MEYks+3gM9bRtRC7jg
 z8DA1aT37X49b3Pj22626cIdFrWFMSXIW2Jy0mApzAP8vFLIaHNWR7tY8Taj16nl6VS3
 Xj4rY8igpXD62sfPGFd7QJ/wt9x5h7YY2fNNhfmlAtwbuGy/WF12fr/TuPFg+OLbpMzQ
 sWprmOCWuVUp27ggOxAmVqvO9q722ReJnykhS/lkzXI23F46vA24ed8aliN4fNb7wL/D
 3fsA==
X-Gm-Message-State: AOAM530qsfehkBfDiWbAuNySzNZp8PeQC+cEu2zBT0hBs+OzxSoSD7Yl
 O/FbU3wdtiH0marpTMfZ2RezUGwPqrkUfQh8vTaNMLBVDDfkricj
X-Google-Smtp-Source: ABdhPJxsOC0+2oR0F8T+7NHbLBEfxrJbgti5YAAuxd37tCMjbjCjxInC58TFl0zqx4+Hp+JHLVLAxTAi7/F8Cyvq3mY=
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr10528189wms.144.1637245725096; 
 Thu, 18 Nov 2021 06:28:45 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 18 Nov 2021 14:28:28 +0000
Message-ID: <CAPY8ntBeUhqn==To83i8=88KxH0MQzp9n+NVe4Y8eFns1NMFaw@mail.gmail.com>
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
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tim

On Thu, 18 Nov 2021 at 01:26, Tim Harvey <tharvey@gateworks.com> wrote:
>
> Greetings,
>
> I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
> board and while I've been able to get the MIPI DSI display and
> backlight working I still can't seem to figure out the touch
> controller.
>
> It's supposed to have an FT5406 controller on it without an interrupt
> so I added polling support drivers/input/touchscreen/edt-ft5x06.c
> which I was able to verify using another touchscreen with that
> controller but when reading data from the FT5406 on the RPI controller
> the data does not make sense.
>
> These panels appear to route the I2C from the FT5406 to a STM32F103
> MPU that then provides a different I2C slave interface to the 15pin
> connector that I'm connected to. On that I2C interface I see an i2c
> slave at 0x45 which is managed by the regulator driver Marek wrote
> (drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
> i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
> is perhaps obfuscating that touch data.
>
> Anyone have any ideas on how to make that touch controller useful?

There should be nothing unusual. 0x38 is the EDT touch controller.
Starting with the Raspberry Pi OS Bullseye release, we're now using
the panel directly from DRM rather than through the firmware. That's
based on the branch at
https://github.com/raspberrypi/linux/tree/rpi-5.10.y/

I also added polling support to edt-ft5x04.c.
For DT, it uses a combination of the overlays vc4-kms-v3d,
vc4-kms-dsi-7inch, and that includes edt-ft5406.dtsi, all of which are
in /arch/arm/boot/dts/overlays

The main issue I had was configuring the regulator framework
appropriately to allow the touch controller power to be separate from
the bridge power. Without that if DRM powered down the panel it killed
the touch controller too, and the touch driver never reinitialised
itself.
On our branch rpi-panel-attiny-regulator.c has been updated to control
those functions independently as GPIOs, which then get used via
regulator-fixed, or as reset-gpios.
Telling both bridge and touch that they shared a regulator didn't work
as the DSI bridge seems mildly fussy about the DSI state when it is
powered up.

Hope that helps.

  Dave
