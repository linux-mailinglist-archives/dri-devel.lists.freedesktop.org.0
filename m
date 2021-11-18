Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD556456270
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 19:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245206E9AC;
	Thu, 18 Nov 2021 18:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532A56E9AC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 18:32:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso8421208wml.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gaTBhNNfF+Oxvm5eSYifsspf4ml88WJzKVOOS+4EOEc=;
 b=IRB5LNQ7Ou+x9LNQODeoyLJHJW1UIcMuTgFWZA6V/m344VdvhGTiLjk0NjRCjyBSsX
 N477vxn7+WYSOwKq3+ckhNTDqV6fDuoeVpa1jPSEcYA3onyLTVOLWp3MwCXlHyQnBOnt
 Kbf3hw0sP8LxiC/HWQTMN81cwqf2Tl6wv6+PHZ5ARnFXbJ/5FDsmIgb9V5TyYiigWYhQ
 O62JP8LZrt1q59fFOTst/TN1QddcvE/jhQq5VBOTtiEBI2dOrDBPKGs6KZeNOHr1cne9
 O4xsP7V4kc3jA05fzFvHhnZzjCc1jl5+FCoKE8SNCseCvRZp8QMeJudiyqLFwAhs2bE4
 mkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaTBhNNfF+Oxvm5eSYifsspf4ml88WJzKVOOS+4EOEc=;
 b=4O2R8IoHOB5iqyLbswQj0ERUIGzwzv1a57uv9hHzku+rdFD/RPlzaJQ59vvlbkCkdf
 j+SeZFwYMMsVI9bvZLzNhQIxvxY8buOOOWmgWo4oSYciPvEPfvO/t+1fF7tzOeuZUEAz
 8ZsIZAuS+BN5s7feZw2XqBQSR57kpW3yWGJTHyWNqgPlEGjJQnFnYJWsunRKfle5ezE2
 2DHQpvnoI4Y74okw5ozu9bP5+6udV1MArZNkMVQrOavb0U6UzFHAtFb9LK1nTCoxtCXx
 v0CPzwhxbGlWvc5cnHmkjrdI2X3Lnx9OlrMXSgmyiSwnQ8ndNAHxKbyOJcFyFXe5IIrz
 nx1A==
X-Gm-Message-State: AOAM530qrm9YTVMF9vKk5UZBIALsQifYPfhG7SQD5S3RtGmzmeD3eE+q
 5BNmvPWBX4yC9JaNWkDQ+73gUCqSOvYyYtIHiHB2MQ==
X-Google-Smtp-Source: ABdhPJzf8eOHItAMuspLvMAoI0ocOfTYJ5h0sxfTWyDZeDuGaAFD9vv0m7WAE6P5/815UN/jVvV5RBgc2aaq3MxX4Bg=
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr12050480wmq.180.1637260357759; 
 Thu, 18 Nov 2021 10:32:37 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
 <e927cb88-3c93-b6df-19f5-b60100fbaea7@denx.de>
 <CAJ+vNU3BwYmXHJfoH9OfcN=_4vNzpL6uLVhDqjQsTZCNd75qfg@mail.gmail.com>
 <5c3e738d-22ee-42c2-8fb5-0c2da83c566b@denx.de>
In-Reply-To: <5c3e738d-22ee-42c2-8fb5-0c2da83c566b@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 18 Nov 2021 18:32:20 +0000
Message-ID: <CAPY8ntDai4VZKdqu-GdWrHJe8bThkrJVZk6fJka2f1drseqZOA@mail.gmail.com>
Subject: Re: RPI 7" display touch controller
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
Cc: Eric Anholt <eric@anholt.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Nov 2021 at 17:44, Marek Vasut <marex@denx.de> wrote:
>
> On 11/18/21 6:02 PM, Tim Harvey wrote:
> > On Thu, Nov 18, 2021 at 4:53 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 11/18/21 2:25 AM, Tim Harvey wrote:
> >>> Greetings,
> >>>
> >>> I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
> >>> board and while I've been able to get the MIPI DSI display and
> >>> backlight working I still can't seem to figure out the touch
> >>> controller.
> >>>
> >>> It's supposed to have an FT5406 controller on it without an interrupt
> >>> so I added polling support drivers/input/touchscreen/edt-ft5x06.c
> >>> which I was able to verify using another touchscreen with that
> >>> controller but when reading data from the FT5406 on the RPI controller
> >>> the data does not make sense.
> >>>
> >>> These panels appear to route the I2C from the FT5406 to a STM32F103
> >>> MPU that then provides a different I2C slave interface to the 15pin
> >>> connector that I'm connected to. On that I2C interface I see an i2c
> >>> slave at 0x45 which is managed by the regulator driver Marek wrote
> >>> (drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
> >>> i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
> >>> is perhaps obfuscating that touch data.
> >>>
> >>> Anyone have any ideas on how to make that touch controller useful?
> >>
> >> Look around:
> >> https://github.com/dh-electronics/meta-dhsom-stm32-bsp/blob/dunfell-3.1/recipes-kernel/linux/linux-stable/5.10/dh-stm32mp1-dhsom/0038-ARM-dts-stm32-Add-AV96-DTO-for-DH-644-100-DSI-mezzan.patch
> >
> > Marek,
> >
> > Thanks. This dt overlay actually disables the touchscreen controller
> > with a note that the IRQ must be hooked up to work. Did you actually
> > wire up an IRQ and get it to work? I implemented polling mode for the
> > controller but the data did not make sense.
>
> The touchscreen IRQ line is accessible on some pin header on the 7"
> display control board I think, so you can attach it manually to your
> development board that way. I have a new version of that AV96 adapter
> board here now, I just didn't get to assembling it yet ... so, feel free
> to add that one IRQ patchwire and try it.

Sadly not. The touchscreen interrupt line goes into the
microcontroller, and the line on the pin header is an output from the
microcontroller. The software in the micro does NOT do anything with
either GPIO.

  Dave

> > This dt overlay also interests me as I am also wanting to get some
> > overlays in the kernel tree [1]. I'm curious if you have any thoughts
> > on why there are currently no overlays in the mainline tree.
> >
> > 1 - https://lore.kernel.org/linux-arm-kernel/20211115202426.16114-1-tharvey@gateworks.com/T/
>
> It would be nice to upstream the DTOs, I think the reason why they're
> not upstream is because the DTO support is still incomplete, but I might
> be wrong. Thanks for pointing this patch out, I'll keep an eye on it.
