Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D7552981
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 04:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA741123FA;
	Tue, 21 Jun 2022 02:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104D91123F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 02:43:05 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q11so12896688iod.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 19:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XBEE2W3FjydD0/XD0h/jv8cpLUWQxzRJ40zan6MUb+E=;
 b=oWfVzxZxhoE4HCZZdM8AG2g15e+tsDablb3uv6NkJNr1Kh3zVrgyKtEPApzczQpRms
 bD8RZbDm7aMtscYJEN8XXGOlsTqkZf1dtxoWPDORJ7urpKFNz5I0ZAkz1Y6lu2L3VKxk
 jsgOC3+8UD4PmI07mrFKGYJUB4K2+cCuGgR1lLkTssDUPma6usi742emzjDomnez/fO7
 gkncrR62Ovc5cM/k3mTqd9wRYOhJWE1fAYa4f47f2OUNxvJeF/xsemZbX25KUkPaIWm8
 FPCUCW3ESzi7b+Cjy8YYs3GbGU2ami25BYtYRPOZWh4ANtHkZtNS3Ocb5DmSnpwpiC2t
 VZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XBEE2W3FjydD0/XD0h/jv8cpLUWQxzRJ40zan6MUb+E=;
 b=gqW/QTT9gGr/I8J+RJTeGvIpWOcy3rIj1H9H7iH0i92zIf4Qs4ugdIQDkdBpPM1jmz
 Ti1/Ui2Wyn8y785hUz6+OpQYD+PgwZL+fJ8shbXIt5Coj/vGwQlP3GrfdXDT84cFQfsL
 bHIw1os/tVE79tD0xlqDyOfl3IM3+N7kXEJblgkZ64Ga0hyzSuV6LG06dwdNqkR6If4Y
 p0giAG8UVQQgn7ygUUEqyTsymrC9OZ4xf0i/kVmbeEtQs2kb/ne6OEw+iumdIdizaDFa
 D15+xUgJsGr5ZwgjtarLMZdUh/K7bpp4URm8QREeHVr5SlUVuNfU6iEZQbT5JiFp71JB
 TvWQ==
X-Gm-Message-State: AJIora9iCB8PnxGmbHXFAxYpVCU7yCoi2oUQSZSAnKBHamX7g6RsXV4R
 HGU5rlNPJ3yw/AxZqGN7XFuZml6bRQiwBIrY5JE=
X-Google-Smtp-Source: AGRyM1vpQzgV0zlZHowqIGzYAAvxpyakFnm6y9bItBulj3V4Z+ncRS7AdAAHY3Rk9Fm+0HC+g4QHLAUy8HRH6yxI77s=
X-Received: by 2002:a02:6d61:0:b0:338:398c:1be8 with SMTP id
 e33-20020a026d61000000b00338398c1be8mr10684754jaf.271.1655779384400; Mon, 20
 Jun 2022 19:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-8-peterwu.pub@gmail.com>
 <20220618164820.2eeb8ae8@jic23-huawei>
 <CABtFH5+R761Tyd4yaWg-foSC4K=_aeYiVaTf37KvVH1Z4z9Jhw@mail.gmail.com>
 <20220620193500.145f05b9@jic23-huawei>
In-Reply-To: <20220620193500.145f05b9@jic23-huawei>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Tue, 21 Jun 2022 10:42:53 +0800
Message-ID: <CABtFH5KsiDchvshPEEs2hejCWW3z+7RFUXuUBkpR-uiWqOMKyQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC
 sysfs guideline
To: Jonathan Cameron <jic23@kernel.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com,
 ChiaEn Wu <chiaen_wu@richtek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, szunichen@gmail.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, pavel@ucw.cz,
 matthias.bgg@gmail.com, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thanks for your reply!

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A82:35=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Mon, 20 Jun 2022 14:00:43 +0800
> ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > Hi Jonathan,
> >
> > Thanks for your helpful comments, and I have some questions want to
> > ask you below.
> >
> > Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8818=
=E6=97=A5 =E9=80=B1=E5=85=AD =E6=99=9A=E4=B8=8A11:39=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Mon, 13 Jun 2022 19:11:38 +0800
> > > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > >
> > > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > > >
> > > > Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.
> > > >
> > > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > ---
> > > >  .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++=
++++
> > > >  1 file changed, 36 insertions(+)
> > > >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6=
370
> > > >
> > > > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/D=
ocumentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > > > new file mode 100644
> > > > index 000000000000..039b3381176a
> > > > --- /dev/null
> > > > +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > > > @@ -0,0 +1,36 @@
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage0_=
raw
> > >
> > > Unfortunately the kernel documentation build scripts do no support du=
plicating
> > > standard ABI for particular devices so as to provide more information=
.
> > > Hence you can't have anything in this file.
> > >
> >
> > I want to confirm with you again,
> > because my ABI file duplicates with standard sysfs-bus-iio (voltage,
> > current, and temperature channels),
> > Should I just remove this ABI file and modify the code of mt6370-adc
> > to meet your expectations??
>
> yes.

OK! I got it! I will refine the code in the next patch!

>
> >
> > >
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
> > > Curious though, voltage with a mA accuracy range?
> >
> > Yes, this description is based on the data sheet.
>
> Weird :)

First, I want to apologize to you because I rechecked the datasheet
and asked the hardware engineer,
the conclusion is I wrote the wrong unit...
The correction is that the accuracy of vbusdiv5 is +-75"mV", not "mA",
and another one, vbusdiv2, is +-30mV.
I sincerely apologize for this mistake and for any inconvenience...

>
> >
> > > This scale should be presented directly to userspace anyway so no nee=
d
> > > for this doc.
> > >
> > > > +             higher measure range(1~22V)
> > > > +             Calculating with scale returns voltage in uV
> > >
> > > No. All channels return in mV. That's the ABI requirement as
> > > in sysfs-bus-iio and we cannot vary if for particular drivers.  If we=
 did
> > > no generic tooling would work.
> >
> > Ok, I got it!
> >
> > >
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage1_=
raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 VBUS ADC with higher accuracy(+-30mA=
)
> > > > +             lower measure range(1~9.76V)
> > > > +             Calculating with scale offset returns voltage in uV
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage4_=
raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 TS_BAT ADC
> > > > +             Calculating with scale returns voltage in uV
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage7_=
raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 CHG_VDDP ADC
> > > > +             Calculating with scale returns voltage in mV
> > > > +
> > > > +What:                /sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> > > > +KernelVersion:       5.18
> > > > +Contact:     chiaen_wu@richtek.com
> > > > +Description:
> > > > +             Indicated MT6370 IC junction temperature
> > > > +             Calculating with scale and offset returns temperature=
 in degree
> >
> > Shall I modify the scale of temperature to milli degrees in
> > mt6370-adc.c and remove this item??
>
> yes.
>
> Thanks,
>
> Jonathan
>
> >
> > >
> >
> > Best regards,
> > ChiaEn Wu
>

Best regards,
ChiaEn Wu
