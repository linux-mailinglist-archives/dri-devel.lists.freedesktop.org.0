Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F554F404
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 11:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904C511A5E2;
	Fri, 17 Jun 2022 09:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D4D10EFD0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 09:15:40 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id u2so2602703iln.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rwjg/1YINzqxKrc7KAD/i4G4OnLWc8a5sJgC2L1EvV8=;
 b=T7RlZkRmUrk1uPWymyVaIYEm2USnc/kiRpW1DN7Cx2fgKOPadbLJ9hDWp330pVll0b
 nVbSUAeOw0ind5aX2DvD+qJ8edzVQwQd3vVZJpL8lsPgf97MamIi1jYUacpEmf4yt4Nv
 8RRQrqnZlA+v/EIUq3IJoumZPhS6kWTzFZg2DF9GNU3fnbSMCbrE+BajwsAUMooWjcpt
 9mPv6dhXPsyKfQqvI+pMgreCD1G0ZEiRwMHTufp3vlcXKkuxk6+kqTFh4zOAP+G5b4Na
 EpWtKBRqGJyZrmKT1ZeI3lx3hOwvQwReCYUJPQvQLh44wdub2G8emdWusMIolDoHXPjN
 eScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rwjg/1YINzqxKrc7KAD/i4G4OnLWc8a5sJgC2L1EvV8=;
 b=U7oggjJ9x9wfIWkQElO+AYmig6wKzopiLx/clyNQk9yJRaLpA595muUW5I/VrtrXTs
 gDEGTylymoOMySRhTygwnOGlcS/tgO606QHPyZRoxLZCWWId6XGpQuS/+fSf7YvrYyZD
 kNrdUIcTBtPw9sZZXxx7sy8krOT5WDJxRyspJV57u0qHqTVOkbnRTa5Tzh6G0HIYa7GH
 ywW6rHwq+YvXVyt5xBfmaujPOrT4CKM46oIe3bE/YvfwL7IyTjV7yCrFMQkDlZ+ugqsi
 5/O5a9+GDrxb3yb0aONGpH31OblnwW75gxSPVXWD5jEjFSPcNDELRB2QcT7VzxoVa5Jd
 Dlsw==
X-Gm-Message-State: AJIora+NvQD0sbX+13JEI7dklqb6TY+rpSqIUbw1DGG9Pr8yTasqzJcz
 OnA5PFfd5i36gfr5BIEolFr2+udIww8dtC43x98IQXiZhok=
X-Google-Smtp-Source: AGRyM1ulXgBKYwRX4sDQBTJgY1sJ1HQy/qNt3KPa2+zyrl3Y4yDe7BzlO+x/VaU+eUVa36+znFzZdfjPq6R82D89JK0=
X-Received: by 2002:a05:6e02:144f:b0:2d1:90c9:9047 with SMTP id
 p15-20020a056e02144f00b002d190c99047mr5212028ilo.211.1655457340207; Fri, 17
 Jun 2022 02:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-12-peterwu.pub@gmail.com>
 <915871e4-b156-ab19-043f-b719e03a5711@infradead.org>
In-Reply-To: <915871e4-b156-ab19-043f-b719e03a5711@infradead.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 17:15:29 +0800
Message-ID: <CABtFH5JyESUuMkDuRSKdc7pf5M4Zah2eZ_LG1RMbMVYxYkcBxA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] iio: adc: mt6370: Add Mediatek MT6370 support
To: Randy Dunlap <rdunlap@infradead.org>
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 pavel@ucw.cz, matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Thanks for your comment!
I apologize for any inconvenience caused when you decoded this help text.
I will refine this in the next patch, thanks!

Randy Dunlap <rdunlap@infradead.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A84:17=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 6/13/22 04:11, ChiaEn Wu wrote:
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 71ab0a06aa82..09576fb478ad 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -737,6 +737,15 @@ config MEDIATEK_MT6360_ADC
> >         is used in smartphones and tablets and supports a 11 channel
> >         general purpose ADC.
> >
> > +config MEDIATEK_MT6370_ADC
> > +     tristate "Mediatek MT6370 ADC driver"
> > +     depends on MFD_MT6370
> > +     help
> > +       Say Y here to enable MT6370 ADC support.
> > +
> > +       Integrated for System Monitoring includes is used in smartphone=
s
>
> Please try again on the help text. I can't decode that.
>
> > +       and tablets and supports a 9 channel general purpose ADC.
>
> --
> ~Randy

Best Regards,
ChiaEn Wu
