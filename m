Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD93E12DB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4336E578;
	Thu,  5 Aug 2021 10:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732656E578
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:42:56 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id x7so4586224ilh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5CC+qqYzxNbX02yW8rXrZN1nsewW7OQh6pCCNQCnBFA=;
 b=LEd7dmKXHX4KDfaael/nb3KzkXU/tGl4vxxbobYo40113u3FNcYgtEepeQjEKRaStJ
 x0IHVyDg/65VM4KYpkmM6y2vfO++w3bW3EOwwhU1FR5UL2kWHhrZCiClZ3n3uhJQuvZX
 vQpqup26DbCBcqcOPK4SCCd8OqTD/QXvHEpBXqmuh/SFvuJqVIR0c1jFQvdurOOoiruw
 0Tnn6t4RXNPJ3MrCM3D1KZSKrI1QpDu7yavU/v/LGLewPAI+t6Zog3kCb60lx8x90+up
 KHgPke6ByhzFZuWpFkPlY6j9fIVI7knjtHTkZ0bC1V0v1IIotZMxXHIEwkHvOkjdGJ5p
 K89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5CC+qqYzxNbX02yW8rXrZN1nsewW7OQh6pCCNQCnBFA=;
 b=PMQ5+3ZAMLdYruOvB5E9hnxrvAMzjUXqUuLs1CqXXxttZpbHuF+YEBRdtP+hYMv5kM
 Q4GSaeA5M6LmBY45IdpSQcIS235PDN0PeaZ336+JVQqPEEt3glOfUF9VjBbjC0FXYgxi
 mzshbHNOnMz2Aik/C3jd7uwO4rhzkPvJxWp/zwXFEmvo1xwIxOwxcMFGAwptg0AdS4rD
 7v/tlttmF+AJmqmmMogyvjnBITbDFfmvBm7oKMlP7Nlk6Tr4jr9dW0TvS4r3QYfwlO/o
 80fwz2sZi+M/wIOWHCdUy4wPYet85jbbv9gDELTOj2glG2ZJCp/xsvqSHl5MfMRXVQUI
 SQtg==
X-Gm-Message-State: AOAM530ddfUXoSYTHCaeDNM/dTKSEG2mmw+B2LPayOV3asnwZ/DYwsvG
 7/bcDnj/v0YjX+oE+spC5rpi0q919kXH/cdRrnI=
X-Google-Smtp-Source: ABdhPJwTqaerJZpRejApHmZ+A8EHtxdWMpoIrp7SBBXp/NRJpTNn+aMXl4SQ6RSi6J+yvY9u14nAqrih4a1io1Tid9g=
X-Received: by 2002:a05:6e02:1905:: with SMTP id
 w5mr57891ilu.270.1628160175852; 
 Thu, 05 Aug 2021 03:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <CAHp75Vc5fJM-UiBiosAiTraq=6P0AFefmw1rmtFcvyWVb6rfLA@mail.gmail.com>
In-Reply-To: <CAHp75Vc5fJM-UiBiosAiTraq=6P0AFefmw1rmtFcvyWVb6rfLA@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 5 Aug 2021 18:42:20 +0800
Message-ID: <CAL9mu0+_fTTS8rBv63-PQ0H1M=yg4EtZwYXqORNRhHL0U8_KxA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add ilitek ili9341 panel driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 kbuild-all@lists.01.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>
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

Hi Andy

Thanks for your question.

On Thu, 5 Aug 2021 at 18:16, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jul 24, 2021 at 6:46 AM <dillon.minfei@gmail.com> wrote:
> >
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > Since the st,sf-tc240t-9370-t dts binding already exist in stm32f429-disco.dts
> > but, the panel driver didn't get accepted from mainline. it's time to submit
> > patch fot it.
> >
> > This driver can support two different interface by different dts bindings:
> > - spi+dpi, use spi to configure register, dpi for graphic data.
> >   st,sf-tc240t-9370-t
> > - only spi, just like tiny/ili9341.c (actually, this part is copy from tiny)
> >   adafruit,yx240qv29
>
> ...
>
> > I was submited the first patch last year, you can find it at [1].
>
> submitted

Thanks.

>
> > this patch has one major difference from that one, which is replace the low
> > level communication way, from spi_sync() to mipi_dbi_{command,
> > command_stackbuf}() interface, referred from Linus's patch [2].
>
> Can you shed a light on the road map here.

Personally, I'd like to merge tiny/mi0283qt.c, tiny/ili9341.c(already
done) into this driver later
(keep original author, copyright, dts compatible string).
then remove these two drivers under tiny, but it's up to Sam and
Laurent agreement.

For long term, just like Peter suggested, let all panel based on
ili9xxx with single-dbi or dbi & dpi interface to be supported by
single ilitek-ili9xxx.c, something like panel/panel-simple.c
 (panel/panel-ilitek-ili9322c, tiny/ili9225.c, tiny/ili9486.c,
tiny/mi0283qt.c, etc).
it's also needs maintainers permission.

> I have the SPI panel (tiny) based on the ILI9341 and I'm using
> actually mi0283qt driver. With yours we will have 3 (three!) drivers
> for the same chip. I really do not want this. Without road map on the
> prospective of these all drivers, NAK.

Yes, it will make users confused if there are three different drivers
for the same chip.
I'll continue to work on this driver.

Thanks again for point this out.

Best Regards
Dillon

>
> --
> With Best Regards,
> Andy Shevchenko
