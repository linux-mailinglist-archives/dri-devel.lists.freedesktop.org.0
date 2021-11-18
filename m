Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AE456117
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 18:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87EE6EC71;
	Thu, 18 Nov 2021 17:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465EE6EC71
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 17:02:44 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so6307099pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBvHwLf6TvYVTnLz2Y2Nm+9rTbWnCy+RHrisGFRh+fs=;
 b=YPX6bY1AwUrrb1k8AZzYAWkbNcxTyloN6ImamthwX1OlqQDqJQ6aG/UfGwPGBMLyto
 2lNemD8IYnivnIii2TyVAwNnmzEbCfZWLEIYP7VxHWuYyxG4/9xofA8xuSwQW/02pIr3
 5cljc3BWfTyITinoG0XSFtV8fOjxLWswRyD40T8MxYzbTxfeNMJQCgzeVsXTsyjSHLoe
 6hZi7l5tMcMFFpU28XCq0PXkS+yplJvlFNmJ/K2QjEvTBGeCNF6ElbssR3mf+bmjjctm
 xBs/N4IfUgtGeBuc7IdXeqymHHO1mNQwpmhFXlSCxxuaUIBy0GX2bSHh1YReuS2pSXjT
 w95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBvHwLf6TvYVTnLz2Y2Nm+9rTbWnCy+RHrisGFRh+fs=;
 b=1WWkUXcnMO+Am47FjrtAfB+Va0iC/5GFyW219FlGFRBrBYA0zBO9UcpIoMgwdxJOp0
 UZOvPQQW1DAN/1inp2LafglBUL7UBj2iEhuUBZmIBWh9Z3hHrMXSfJbTKjnXe4GGhqpN
 /bOqe0qqdaF9DkanBRpY2BLUMfOqmOf0hoZ38hbSHC0e5Zo/d66nnXs+MBYYRq5paQCZ
 Xn6HZJvviF6Ce98y2UHgdEI6Cz5UmpOaj3HeSURYzz1yW5qfgZo8HJuX+OZZPJ7MaLQ+
 hmoo+k9Y4QQpDqfF6Bv8DFD3q8N/UHOUGc0ysfXKK8S0T9jPA29B8E4PZunyiex5X7xv
 XbDQ==
X-Gm-Message-State: AOAM533oqG68YNBSdxrNFATy3UI7vAscy8z47gqVO57W0Gx+LLTShr6a
 q97v9lBCix2NE9a7ZI07c+N+yvNZa+Pf8jWFMyko6nZl5OILM+2s
X-Google-Smtp-Source: ABdhPJzRPsBtIw7h5V2QnfreH6yEQFYgH8iGCovhGY04LOauYaN1vhjrk/7Ah2OaTNJgBbXHOhQ3lYXbMbp9LxVFGc8=
X-Received: by 2002:a17:902:714f:b0:142:892d:a46 with SMTP id
 u15-20020a170902714f00b00142892d0a46mr67327259plm.39.1637254963667; Thu, 18
 Nov 2021 09:02:43 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
 <e927cb88-3c93-b6df-19f5-b60100fbaea7@denx.de>
In-Reply-To: <e927cb88-3c93-b6df-19f5-b60100fbaea7@denx.de>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 18 Nov 2021 09:02:32 -0800
Message-ID: <CAJ+vNU3BwYmXHJfoH9OfcN=_4vNzpL6uLVhDqjQsTZCNd75qfg@mail.gmail.com>
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

On Thu, Nov 18, 2021 at 4:53 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/18/21 2:25 AM, Tim Harvey wrote:
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
> Look around:
> https://github.com/dh-electronics/meta-dhsom-stm32-bsp/blob/dunfell-3.1/recipes-kernel/linux/linux-stable/5.10/dh-stm32mp1-dhsom/0038-ARM-dts-stm32-Add-AV96-DTO-for-DH-644-100-DSI-mezzan.patch

Marek,

Thanks. This dt overlay actually disables the touchscreen controller
with a note that the IRQ must be hooked up to work. Did you actually
wire up an IRQ and get it to work? I implemented polling mode for the
controller but the data did not make sense.

This dt overlay also interests me as I am also wanting to get some
overlays in the kernel tree [1]. I'm curious if you have any thoughts
on why there are currently no overlays in the mainline tree.

1 - https://lore.kernel.org/linux-arm-kernel/20211115202426.16114-1-tharvey@gateworks.com/T/
