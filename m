Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13771574991
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEB6A3CDA;
	Thu, 14 Jul 2022 09:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1240AA3CD3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:50:08 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id i206so2307332ybc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBLXrSfINFn+OkykEbtev0CVHfJNR4Ha91FDbpJe6vw=;
 b=jco1TUUJamGLBjUMKQJxmHydRs46RlrJYGVBVuXrdgoujFg+bNA+FRuqu9xySWKxm+
 iJ1MtPVhlh7NDYej/YkFvBQH1rWl4haWJzS8oJMmpCSCAzDBnx5brocoXUfXiB/uAfdM
 OFCWFOj+Wa/coQ+L/p2yRun8h9nxwhqAUhtPNkhFXDvtJQmjTfMKd8aLu5aGAQ9r4rKt
 pG3Pip2NDEZSbCM/gpswT2iVdDW8lMLvPHmzuu6unQZJ9SrI3aON/fekc5ofeaTFY0gc
 5sGqoeNtKloDBRE9yF69b0PWXyQ8T9A1xzHCn4bZ9woFCXpR/laDfNHFMvp3+dX42tLc
 fMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBLXrSfINFn+OkykEbtev0CVHfJNR4Ha91FDbpJe6vw=;
 b=N3emlyvYqBHOy22JJtU2v4L/yz8aBTxRMdKrfIjPseX4D53QEunPm9FePOMOn6x702
 4c2sKwzjokXdjcOa0PYWxTn9PskePDPzGFednT8VOLBPZ2J5dJcY5Lkl3RvQc32W9cjQ
 AVKlU7X923pnLlKZ4Ai87mcOnT30xsja71YFA4Wivmn8b9JyGwK7xbV9yAKNhRs/HB+R
 e+rqTya3s9kF+lguVBLEENaqQPie1V2VQn4qOavFYF8pkwa6UJ95hkWKsszNllk838Q6
 OCXZsc2vCLsXkAFf+N5foI3nr5tUN6yNzf1OzOs2i+QCTYhe/1jYzGnk/ifk69P+sDUE
 dVlw==
X-Gm-Message-State: AJIora/0/KRJLe/MdACNAxSmtzjuGwDSF0molpV5fOyirWIRazYFeYz0
 uninYl4evIziCYA96HDLJrkw3MtsKiXDgC6Kwe4=
X-Google-Smtp-Source: AGRyM1uVizFvY1JstQJgDopDPPcpsJilLyYnoZh/AYBxHpJVN7WLVW/f3jKrRS5Q3mGaEk9B3sqdSTOJVu/pQIHekz4=
X-Received: by 2002:a25:df97:0:b0:66f:6e7c:b3c0 with SMTP id
 w145-20020a25df97000000b0066f6e7cb3c0mr7544434ybg.93.1657792207178; Thu, 14
 Jul 2022 02:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
 <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
 <20220714094709.6ekfnfcf5sktiegi@maple.lan>
In-Reply-To: <20220714094709.6ekfnfcf5sktiegi@maple.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 11:49:30 +0200
Message-ID: <CAHp75VdVSvux3HRPOj=xWXZoBdn1e=nSmWi9+BZUX69XAPcZPg@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 11:47 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Jul 14, 2022 at 11:27:07AM +0200, Andy Shevchenko wrote:
> > On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > > I have tried two methods so far, as follows
> > > -------------------------------------------------------------
> > > /*
> > >  * prop_val =  1      -->  1 steps --> b'00
> > >  * prop_val =  2 ~  4 -->  4 steps --> b'01
> > >  * prop_val =  5 ~ 16 --> 16 steps --> b'10
> > >  * prop_val = 17 ~ 64 --> 64 steps --> b'11
> > > */
> >
> > So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
> > Now, consider x - 1:
> > 0  ( 0 ) --> 0
> > 1  (2^0) --> 1
> > 4  (2^2) --> 2
> > 16 (2^4) --> 3
> > 64 (2^6) --> ? (but let's consider that the range has been checked already)
> >
> > Since we take the lower limit, it means ffs():
> >
> >   y = (ffs(x - 1) + 1) / 2;
> >
> > Does it work for you?
>
> To be honest, for this tiny table, writing code that *doesn't* require intricate
> deciphering together with a huge comment saying what is does would probably be
> better:
>
>                 prop_val = (prop_val <=  1 ? 0 :
>                             prop_val <=  4 ? 1 :
>                             prop_val <= 16 ? 2 :
>                                              3);
>
> This would be "obviously correct" and require no comment.

Agree. It will also limit checking (and whatever needed for that).

-- 
With Best Regards,
Andy Shevchenko
