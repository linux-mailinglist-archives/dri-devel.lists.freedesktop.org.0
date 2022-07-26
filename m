Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A2580A46
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 06:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3455112653;
	Tue, 26 Jul 2022 04:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929F8112653
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 04:15:46 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 75so23409039ybf.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 21:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lL85hlJEWNpWq8aoVq7T9RPrHigl/wy3kQyoeNe4Sas=;
 b=hCdS8QSsYIw6gGaV0XS9IAV/+XD+Kk0QE5hzusxmOf5d2dTDTQQcL3NhqMYKbFY0Tn
 ALB21R/6DazMYeCAAzfSZS7P0Z41gJsw+nZjWX6PlQXwXANm3LVAqrB5PFsMuqAHqXem
 Mqmm3Ih1NTwtWzQhnAzSzRXXrf5yfCoFcjkmFFPLCmRVp2siIg3AfNjuCMTK2YESptid
 eeP9tz5wTm7qe3sotMpBO4iTSI2DKFf7D3YatBVRT/PbkAZVFycO+siEvHp7i27pNctb
 TonIMjdDnr0jjVWHRnLmYyT6Iqx8oAClUtlkGASQ6CkTyN1ePQ9WOQPU8smSEzTDkemD
 7GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lL85hlJEWNpWq8aoVq7T9RPrHigl/wy3kQyoeNe4Sas=;
 b=gMym2SKbMJg7tFd0PqwnAFm0hQfeLk7rLPTNPVjvTzBndVfJ0wurCHpPXuEInqxESG
 IyPe71CNnzHmYUk4WuKGwIPMJp2g/FfivSysD9cZAYrUL1IuH3n3002aygvZi5Hbx/Se
 uhtFzGnO9hBPMsYyADjjKLUOvc+FGld95wwaAMGsO1XYir1x1UZElvFJgdGNfBbwG3Ue
 b+611BXxaPqv8dWk7zDCjLs9KN/U0EBr/vmk6UStcMP7WMGu1ORT55he2xSrhd9aZIww
 dXzz5syaaEZXxtXcfYVW/CiPmcanu+YRI855QRsRkA5GhWaQGH8dDMzF39neChcc+H6U
 g+Rg==
X-Gm-Message-State: AJIora8h9l3lZn6p463iI+fC6L+k0OC8EZQCH7N0W2Q5XwLJVVFhiUq8
 lZKazLuD38kRq4RzCMC8EV/LOCdg+EZnfzz6qtQ=
X-Google-Smtp-Source: AGRyM1uSqvDW6wRuMm0lak5Iwbp5WAlFUJEhBzOij+tqweUKRMo5toAZUB++pRBDQrYJNbxll8cTRP6sKMvIiCj1/Dk=
X-Received: by 2002:a05:6902:10c2:b0:671:73dd:e67e with SMTP id
 w2-20020a05690210c200b0067173dde67emr484158ybu.16.1658808945685; Mon, 25 Jul
 2022 21:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com>
In-Reply-To: <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Tue, 26 Jul 2022 12:15:34 +0800
Message-ID: <CA+hk2fYpDRw+DRRU3m=EDOP6UEQNpJLyNBHe8Zi0qOfUObTb4Q@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
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

Hi Andy,

>
> > +#define MT6370_ITORCH_MIN_UA           25000
> > +#define MT6370_ITORCH_STEP_UA          12500
> > +#define MT6370_ITORCH_MAX_UA           400000
> > +#define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > +#define MT6370_ISTRB_MIN_UA            50000
> > +#define MT6370_ISTRB_STEP_UA           12500
> > +#define MT6370_ISTRB_MAX_UA            1500000
> > +#define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
>
> Perhaps _uA would be better and consistent across your series
> regarding current units.
>

Yes, _uA will be more consistent, but in general, using upper case in
the define macro is a convention, doesn't it?

>
> > +       /*
> > +        * For the flash to turn on/off, need to wait for HW ramping up/down time
>
> we need
>
> > +        * 5ms/500us to prevent the unexpected problem.
> > +        */
> > +       if (!prev && curr)
> > +               usleep_range(5000, 6000);
> > +       else if (prev && !curr)
> > +               udelay(500);
>
> This still remains unanswered, why in the first place we allow
> switching, and a busy loop in the other place?

If I refine the description to
"For the flash to turn on/off, need to wait for 5ms/500us analog settling time.
If any flash led is already used, then the analog is settled done, we
don't need to wait again."
is it answer the question?


Best regards,
Alice
