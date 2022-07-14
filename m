Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95235748D9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B4DA3C14;
	Thu, 14 Jul 2022 09:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44004A3C14
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:27:45 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3137316bb69so10787947b3.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eoEUqCQ0HzWcRS/EEisE9qpbq5xcTJ7+l4FqGraIDiM=;
 b=Ld+ADuIcLOILCqHSVmutQbx0yNCzFYK+d1CfgjosNRjzv4la0za1LrNxPVbXKyGrBU
 plEeNvs9LuKtBpdK2m8TdIf5+YpouBnaZ9Vsy9DWCZQPgh7oBlkDpas1TKNSR2vAuZ/m
 ORq+hpDzjNbMh57lvUku8daA4iIIz1ZvXj/KjuJUO8f4GYx3HxMDS3SJKg0sxPO5bA1n
 KdTdyIG7yt7UXNPxNXnsFgVEMla/Hw7WsDWj9pGpxJIEBu4dM2YsIkBZZHbP1tv7Iw1s
 /UceXFWGcqnbfJelCGnMi9F2w99ZJ8EasltdyIOX+aD94fVjhuHVUAYCDxWNBrPm1xlZ
 NyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eoEUqCQ0HzWcRS/EEisE9qpbq5xcTJ7+l4FqGraIDiM=;
 b=QbRYl1aci/wjaMb81DAI9aXPBVoEcEkwa4wvqVYccdss5AnPPMFKSOD9FmlRDqgi8S
 y3iXhgSxdwyptzXFCe2jn/VpHZy83UFei/TU3zudF7AUIpvlMsDvE6WINh264Rvd1zeN
 9CS+H3BNL1ARtHbZyQe44mAXkCemGActj1hRJuUJMITLBshslX/QGPIwKI397BE4kCCx
 5PcIM5utePtxMR7GQpcB7uOupi4GQktOA1Jqx8xjZXSOmNJ22nPKhTl7PJKIHZhd8jw7
 /Bw5LOaR3NZiaFpIjn3ePkg0kc07YgucMsRJ2HiUBJdndVT/0XRj6s595qBby1nT+792
 zlng==
X-Gm-Message-State: AJIora97azYssCRK71SZup6zuoAMUIvBL5Edwt4om7ec1vDrxw71sB+6
 8fMHHS3F1COyn3XdHaags/zLfnXuVl48UjdxfSk=
X-Google-Smtp-Source: AGRyM1vfgn4gESJkQheSbCNETjn+vwZk7ww5qzlDRalqVBynMRD8SYo6G8iLMHpByXaVRHoDkU+ZiCki5RU9ApOFE6k=
X-Received: by 2002:a81:72c4:0:b0:31c:b309:c4e8 with SMTP id
 n187-20020a8172c4000000b0031cb309c4e8mr8841348ywc.520.1657790864413; Thu, 14
 Jul 2022 02:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
In-Reply-To: <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 11:27:07 +0200
Message-ID: <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
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

On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:07=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrot=
e:
> > > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=
=E6=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:14=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wr=
ote:

Please, once again, remove unneeded context when replying!
^^^^^^^

...

> > > > > +               prop_val =3D (ilog2(roundup_pow_of_two(prop_val))=
 + 1) >> 1;
> > > >
> > > > Isn't something closer to get_order() or fls()?
> > >
> > > I will revise it to "(get_order(prop_va * PAGE_SIZE) + 1) / 2" and
> > > this change is meet your expectations??
> >
> > Nope. Try again. What about fls()?
>
> I have tried two methods so far, as follows
> -------------------------------------------------------------
> /*
>  * prop_val =3D  1      -->  1 steps --> b'00
>  * prop_val =3D  2 ~  4 -->  4 steps --> b'01
>  * prop_val =3D  5 ~ 16 --> 16 steps --> b'10
>  * prop_val =3D 17 ~ 64 --> 64 steps --> b'11
> */

So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
Now, consider x - 1:
0  ( 0 ) --> 0
1  (2^0) --> 1
4  (2^2) --> 2
16 (2^4) --> 3
64 (2^6) --> ? (but let's consider that the range has been checked already)

Since we take the lower limit, it means ffs():

  y =3D (ffs(x - 1) + 1) / 2;

Does it work for you?

> // 1. use fls() and ffs() combination
> prop_val =3D ffs(prop_val) =3D=3D fls(prop_val) ? fls(prop_val) >> 1 :
> (fls(prop_val) + 1) >> 1;
>
> // 2. use one line for-loop, but without fls()
> for (i =3D --prop_val, prop_val =3D 0; i >> 2 * prop_val !=3D 0; prop_val=
++);
> -------------------------------------------------------------
> Do these changes meet your expectations??

No, this is ugly. Yes, I understand that a bit arithmetics is hard...

--=20
With Best Regards,
Andy Shevchenko
