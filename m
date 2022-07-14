Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E9574A5E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BB1A3FF3;
	Thu, 14 Jul 2022 10:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A72A3FF2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:16:36 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 75so2411653ybf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DAB/V2thJrX7oNWAiw69xQ9s2yER1z6zgaPEDVTbARY=;
 b=WzDjqq1pRDiX/e0JhdlBpio8zOrckRWFWYoqqx6oFzHppl1HXZKC0K0Vo9UvICBDx4
 1IgGFxPhaOdHa0ijcMRnAWpg15ZqdMXn+A4AN+KbbyLfV+DLK/zGUswdeyoa6I/gMSWB
 mLZcWexKeicX3ZsiBj8qG9KhT504M9qLDNPa+/3b4OVXUQmkey6iL5NUBSkO06Ql9xqx
 7ABvX+TuwC6gjV6lZglt+ptPstfpEqlr1Yg9+65NKMHYYSOzn23aEysk+sSCVoQV5iL6
 RIo+DgXA1m8aiBJ1aC+G2pOf803m52JzwysZxxKXTmLKrJdLDZZrFNf6ymvczZtUZHNx
 NC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DAB/V2thJrX7oNWAiw69xQ9s2yER1z6zgaPEDVTbARY=;
 b=AEfCBFzh0/pms04Nuw56l3embP+hJoVmV8BdiqTmg4Eu3FKjHPwUTMzAT2xau40MWv
 BGWL6HSP9IMzhQ1VpF+mV/QttIB8YAVj/tUkfmfg8nZg/ocRzQF7AnOI/O+DF4PYjqVm
 TVdsxIyKonQtjPU/05cRuSVHHztWPzP1Y/z72laBsNd1x/E+uCAz/FQmmZxwDd1iQNbd
 VIssTj+DmblPDexwp1vN2fs4ybll7TnHtQNPo2/Pzi+xOOlsskgJd9sjoQ+SQU6lC6VW
 z7LB1yrJ49z9oJ5xDZF/O7gnr3iVVtTP4fCpyTKRNaDiB9jUsyXcdNZPkoX/n2f+T777
 zvXg==
X-Gm-Message-State: AJIora8yKquAiEuZ9br1XaGfgGRlHjJKhcuqZksvy6NRTS8mNVO2QGDZ
 DIuLE4eed9r3ZyEqurjY7/KU2rd2xytM8zdCFRo=
X-Google-Smtp-Source: AGRyM1tsa04XdX6EoBLAKq/4vJYddIuWfRGN796P9MIbmkVyYowmMMx33Ee2ini1a+JW/8CzKBWdXOgF/S8Hwfl8jYQ=
X-Received: by 2002:a05:6902:686:b0:66e:627f:4d29 with SMTP id
 i6-20020a056902068600b0066e627f4d29mr7320510ybt.385.1657793795448; Thu, 14
 Jul 2022 03:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
 <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
 <CAHp75VeMP4zDMmGfdya5Y1C0Hkb7=jeOQGE_HqyDdZcmd_Uyyg@mail.gmail.com>
In-Reply-To: <CAHp75VeMP4zDMmGfdya5Y1C0Hkb7=jeOQGE_HqyDdZcmd_Uyyg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 12:15:58 +0200
Message-ID: <CAHp75VdXGJtPd_oZPGkS1=DoWjFYxbQu_7Vtfj547QQkpz2KNA@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 11:43 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 14, 2022 at 11:27 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:
> > > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=
=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:07=E5=AF=AB=E9=
=81=93=EF=BC=9A

...

> > >  * prop_val =3D  1      -->  1 steps --> b'00
> > >  * prop_val =3D  2 ~  4 -->  4 steps --> b'01
> > >  * prop_val =3D  5 ~ 16 --> 16 steps --> b'10
> > >  * prop_val =3D 17 ~ 64 --> 64 steps --> b'11
> >
> > So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
> > Now, consider x - 1:
> > 0  ( 0 ) --> 0
> > 1  (2^0) --> 1
> > 4  (2^2) --> 2
> > 16 (2^4) --> 3
> > 64 (2^6) --> ? (but let's consider that the range has been checked alre=
ady)
> >
> > Since we take the lower limit, it means ffs():
> >
> >   y =3D (ffs(x - 1) + 1) / 2;
> >
> > Does it work for you?
>
> It wouldn't, because we need to use fls() against it actually.
>
> So,
> 0..1   (-1..0)   --> 0
> 2..4   (1..3)   --> 1
> 5..16  (4..15)  --> 2
> 17..64 (16..63) --> 3
>
> y =3D x ? ((fls(x - 1) + 1) / 2 : 0;

Okay, I nailed it down, but Daniel is right, it's simpler to have just
conditionals.

y =3D x >=3D2 ? __fls(x - 1) / 2 + 1 : 0;


--
With Best Regards,
Andy Shevchenko
