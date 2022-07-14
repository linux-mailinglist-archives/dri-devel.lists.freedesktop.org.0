Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49983574950
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E09A1DCE;
	Thu, 14 Jul 2022 09:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F520A1DCE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:44:24 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31bf3656517so11104447b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zQfNaPBMj9qupXp4mDqBN3FvXkuDRylRWUn+zvSSLGM=;
 b=oUdjAR6phW8mBTe5eDzj0QeWXcrYu1dSSLOGdISEQbBbC80E3nnO2FEXxGYAf5RiXM
 qwCt3mFNhcwCVxxKFv95OoQ0lQSZxF92XMKvQIcmRpKoj31iWTGkf6owEnJ4SKyFwH0k
 JauEuOFAu1eKjoPKsewxkkdItYHKrSID6UH/riAytvkcYOvK7wJWfdXGd7YOn2ZlGDPx
 UknY6TlQhPMD62NXaNa84SFcZnW0ErJAIVlOFo4CQxO3vJ5UK7w+Chs6Xo+IjKurYNSH
 WqV07lOMcczIHACgOGIOzTx9kcVs99te0vmj/tlI8+bxgqMwN7h4K7I2B72mfGLzkJ4i
 gQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zQfNaPBMj9qupXp4mDqBN3FvXkuDRylRWUn+zvSSLGM=;
 b=F2wpGUn21WKpYkb5t6VKfmffpKljnjxQ2dfXvYpmp6yhbPJVinkB+VWizEc9Wrpc+j
 KmsENuJPOl/cMrCQSiiAbaW48Uqp5uoIYFDTOVh58EaVoA5Ptq84uksXgQ7bxcMosOsW
 mWp1r0p7yISEcmOYdGfWJTBz0m80OlA98OBEBMRwqYGvpCTyzFbJF+IscUcEttXEzIa6
 pmjNdbCjjhT1GQiq+V1ZO1syJKqJJaig3p65HvmtOHmGLEWK0/Xt/tT2DFQ5JDo1jf+/
 1kbetWq2R8BYAkUuHSZRv1uEh8e+0phElmyroFaf/BwZrHeYksjHln3lBw7OPBcpPWfB
 erSw==
X-Gm-Message-State: AJIora+xYiqlcO1ua+wVbajbF1IQ0K4YGukKQBe0ff0qrAQQnScIcOpy
 4X5NrV7Iq9oWqgQRzZ9IZO1oGIesKSWlUuxAanw=
X-Google-Smtp-Source: AGRyM1tGq8KvNtgJfDDwwfnd/uLdaBM71GAdhz/B4s7iJ7PIRrr3jUFpxSU8W+abEjc+p3ioRN+vN34Iicys3Eb13K4=
X-Received: by 2002:a81:4986:0:b0:31d:388b:d08d with SMTP id
 w128-20020a814986000000b0031d388bd08dmr8542894ywa.185.1657791863639; Thu, 14
 Jul 2022 02:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
 <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
In-Reply-To: <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 11:43:46 +0200
Message-ID: <CAHp75VeMP4zDMmGfdya5Y1C0Hkb7=jeOQGE_HqyDdZcmd_Uyyg@mail.gmail.com>
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

On Thu, Jul 14, 2022 at 11:27 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:07=E5=AF=AB=E9=81=
=93=EF=BC=9A

...

> > I have tried two methods so far, as follows
> > -------------------------------------------------------------
> > /*
> >  * prop_val =3D  1      -->  1 steps --> b'00
> >  * prop_val =3D  2 ~  4 -->  4 steps --> b'01
> >  * prop_val =3D  5 ~ 16 --> 16 steps --> b'10
> >  * prop_val =3D 17 ~ 64 --> 64 steps --> b'11
> > */
>
> So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
> Now, consider x - 1:
> 0  ( 0 ) --> 0
> 1  (2^0) --> 1
> 4  (2^2) --> 2
> 16 (2^4) --> 3
> 64 (2^6) --> ? (but let's consider that the range has been checked alread=
y)
>
> Since we take the lower limit, it means ffs():
>
>   y =3D (ffs(x - 1) + 1) / 2;
>
> Does it work for you?

It wouldn't, because we need to use fls() against it actually.

So,
0..1   (-1..0)   --> 0
2..4   (1..3)   --> 1
5..16  (4..15)  --> 2
17..64 (16..63) --> 3

y =3D x ? ((fls(x - 1) + 1) / 2 : 0;


--=20
With Best Regards,
Andy Shevchenko
