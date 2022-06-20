Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6181550FF3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 08:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9862A1131AB;
	Mon, 20 Jun 2022 06:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00041131AF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 06:00:54 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id k6so2180094ilq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 23:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cwN6IxyQjuvVAsZLjo36uq20E2C9scRHPNKcXTuVvbA=;
 b=g6PojB88FJpDGekaEQW5sgtt2awlIg9Kyk+OmVxnfABwAPRZbln/Y/uyyXMGCfm5er
 1R0+e483BrsBWcnsxOmWnurViueosKKnTooTuvNzUQMFav5s+AbIomGcK2PP1DZYPPpr
 VQ9yUoTx79KEo59DnPTs2lGLIKmUyAHc7ejDxujesUmt3jln8fx88SDSJ7Xc4h4fpZ+m
 YStImi8HoHdq4ffN+XYmEH9iKrQpXmIjZvY6BidOkJ07b9JEBCQIG0EV892yb0kP3kZR
 L+mSaXygBIURfwfvW7HX1XbwBPpR7BkPNJr0VxPdz7HSXxsudDSiVGYuklRWY+DOvNS3
 bRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cwN6IxyQjuvVAsZLjo36uq20E2C9scRHPNKcXTuVvbA=;
 b=2+uXnBYKXWQRF7f9WpE6OZ2JO6c1VVklD1KbxFo36Nk1Wvyc/5unSFrpcPjIn+drr4
 t0CYHHDmasTHDxQ1NZpanAd2XWlP3jnxnK0iV7tR8hbLKESgZ5HjPcFU/REAUlIBqJOZ
 jzJIdN574KbOmBF+Td35oxgZugMIwyeRGe/SU3ionUrmqk2ulzwUcPHNYFd2s1Zp1Hii
 yxs1arSbjKVw4dF4iulC8sv5bMB8OHNSLOQhQSCVY2TzVwOmvyXFugxW7YXrhAICjfcl
 ppaNaTdA6uINEVgvf3pST4pw9muaUKY2+NgwUj/6YcN8tLYrNOp/2iThHIxq/SIE64cj
 WoEg==
X-Gm-Message-State: AJIora8kaqJdGuylpuCtGATITFdkuIwGcfAiEuSOvsS48+xioXQm1n8v
 VS6JtoVkWS7XKqcYK77Focf2pWPUF3NTJY2PBE0=
X-Google-Smtp-Source: AGRyM1uXlPLygCXpmbKeDXm5LIO35jz/XjYzrLDMy2nvrMmyGvaWds72J9n4lNin+B4hhL3oHWaBa/1XDczfnzCMFbM=
X-Received: by 2002:a05:6e02:1aa4:b0:2d3:aeb9:930 with SMTP id
 l4-20020a056e021aa400b002d3aeb90930mr12576572ilv.45.1655704854169; Sun, 19
 Jun 2022 23:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-8-peterwu.pub@gmail.com>
 <20220618164820.2eeb8ae8@jic23-huawei>
In-Reply-To: <20220618164820.2eeb8ae8@jic23-huawei>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 20 Jun 2022 14:00:43 +0800
Message-ID: <CABtFH5+R761Tyd4yaWg-foSC4K=_aeYiVaTf37KvVH1Z4z9Jhw@mail.gmail.com>
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
 matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thanks for your helpful comments, and I have some questions want to
ask you below.

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E5=85=AD =E6=99=9A=E4=B8=8A11:39=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, 13 Jun 2022 19:11:38 +0800
> ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.
> >
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/Docum=
entation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > new file mode 100644
> > index 000000000000..039b3381176a
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > @@ -0,0 +1,36 @@
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage0_raw
>
> Unfortunately the kernel documentation build scripts do no support duplic=
ating
> standard ABI for particular devices so as to provide more information.
> Hence you can't have anything in this file.
>

I want to confirm with you again,
because my ABI file duplicates with standard sysfs-bus-iio (voltage,
current, and temperature channels),
Should I just remove this ABI file and modify the code of mt6370-adc
to meet your expectations??

>
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
> Curious though, voltage with a mA accuracy range?

Yes, this description is based on the data sheet.

> This scale should be presented directly to userspace anyway so no need
> for this doc.
>
> > +             higher measure range(1~22V)
> > +             Calculating with scale returns voltage in uV
>
> No. All channels return in mV. That's the ABI requirement as
> in sysfs-bus-iio and we cannot vary if for particular drivers.  If we did
> no generic tooling would work.

Ok, I got it!

>
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 VBUS ADC with higher accuracy(+-30mA)
> > +             lower measure range(1~9.76V)
> > +             Calculating with scale offset returns voltage in uV
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 TS_BAT ADC
> > +             Calculating with scale returns voltage in uV
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage7_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 CHG_VDDP ADC
> > +             Calculating with scale returns voltage in mV
> > +
> > +What:                /sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> > +KernelVersion:       5.18
> > +Contact:     chiaen_wu@richtek.com
> > +Description:
> > +             Indicated MT6370 IC junction temperature
> > +             Calculating with scale and offset returns temperature in =
degree

Shall I modify the scale of temperature to milli degrees in
mt6370-adc.c and remove this item??

>

Best regards,
ChiaEn Wu
