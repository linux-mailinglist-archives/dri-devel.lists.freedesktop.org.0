Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBA559384
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B0510F0C7;
	Fri, 24 Jun 2022 06:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8A112694
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 06:25:40 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id h187so681144ybg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3WRM/jegNDF7MJkfKHHwllsaLEoDBdN6Clej3P/Y4lI=;
 b=D530abNNVW04AkYbW5cBkqRo9d5231SDuKgu4fDW7AaH4jE4mVT5OFUcx+HC+Oclit
 8chp6jbBbNGEk0P3WtO4E/T3LUNKEl4CZYHCB8kDC72f1y33a5Jl8zQdYz/7h8rofzI9
 molKE7wLhlBuYhpF8PG8/LP34IC1bse0Fsc34U93w63mTGtgoR/kSBJU3IAZV6RJIDoX
 vewJ811NMZGN+RX3N8aqUoPR3IjQiufTbvKsQ7KYzVX9rrK377CYprRQ3djZSphTlWnA
 kr90KekhWjo1rMkgj80oOFkzfZZBsx36WCy428UlmluupR0YrGtaLVqkr96HnOa5PXRo
 +Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WRM/jegNDF7MJkfKHHwllsaLEoDBdN6Clej3P/Y4lI=;
 b=zA0zS5zQpkf+WHx+jPjCSZoKkzIeV7MzxcLtl0rBSpi8mI2Sr10zd1/5tHW1nI5aab
 eWv5hc7/zouogjwiNjseNS7Qbbef5449v3hS34KSZnZ+oLBd9dK16E5FyYUldLzj/3J8
 H6WwR3wCLeitE7ZqlFStmGKJrwkGX/d5b18QB0zgphLB+0/CxnVOCH+P+r6Dv8lZqF3W
 jZdERej1FzjuROoH/JOTIrGCyzGxQfDXlkclg8RVrC8OxOmUvE8sbsv93LkUR3p7PcVT
 Qi6Eu9Eswys9725rn42ByHF1Sc2Th3styOnnKHWGRXe1pTW/7DF8+Ll13BZTlrNeLxf9
 ZKVw==
X-Gm-Message-State: AJIora+1lb6wdsUnk/KJFH9gR7zih5elaQEKKrYp9B/CAzN568OMNeQG
 Zx7pLx9zAUT5TSuvOLeZANuNnPD3XYOd8MdDjqxpNw==
X-Google-Smtp-Source: AGRyM1sT2bkts91ktfEoGKQU7+LXoN5AOODxkIaXfQ8ZFlQvpAh1fKz3hE77tVb6U5oyh1MbZfwUv7onSbM8QOjAaWU=
X-Received: by 2002:a25:1f57:0:b0:669:b6fa:167e with SMTP id
 f84-20020a251f57000000b00669b6fa167emr4052148ybf.295.1656051940195; Thu, 23
 Jun 2022 23:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-13-peterwu.pub@gmail.com>
 <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
In-Reply-To: <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Jun 2022 08:25:29 +0200
Message-ID: <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To: ChiaEn Wu <peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, szunichen@gmail.com, chiaen_wu@richtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 8:23 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> Thanks for your patch!
>
> On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 current sink type LED Indicator driver.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> (...)
> >  drivers/leds/Kconfig       |  11 +
> >  drivers/leds/Makefile      |   1 +
> >  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++++++++++++
>
> There is a drivers/leds/flash subdirectory these days, put the driver
> in that directory instead.

Sorry I'm commenting on the wrong patch.

I meant this one. Move that into drivers/leds/flash
 drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++


Yours,
Linus Walleij
