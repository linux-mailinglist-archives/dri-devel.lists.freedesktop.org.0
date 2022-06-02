Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97653BCEB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 18:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464451131FE;
	Thu,  2 Jun 2022 16:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428FC10E5BE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 12:07:20 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y196so4591256pfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XwcwX6loUblFTwI5Bhmlqw2TBVsxdFoQXDJc3TovI80=;
 b=k7esYmpY4T8Q9KWtH0jxmxeHnbiHqRF3LqvsK/4Ug3Jqt1gx+19gOZth9lZtzHsVKs
 z65zFnDsir6/cGI09w4DESfFBhn0W5yFwcDHUhGt52REfaoXr8Lc3VEDfnfNLuP0/o4D
 QhmI2Ziwo2TGGYdyx1kXgJ3Stahlm838VXMAuafTcApdKShsfEtVjX9TkbD+0Bn3YGXN
 cu4WTkIfORLzLsRbi8XMZ5t129tM/R0mlJLffyFB4beE1GnzDQtiOj8V92AdJoeaUJkr
 MOUy0Z8FtpbwiXb1/kULCSN9k82OaEpM+B4qbR683RScjbId31DRofz7DKXeQlDpP1zH
 wMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XwcwX6loUblFTwI5Bhmlqw2TBVsxdFoQXDJc3TovI80=;
 b=q4vbsQh/rNkYByiHvadYFxks9GZzZv8ZdmmEtoxx22tIEQnYzXem1arEvcJ+9HtWR9
 TET2lvI6d8Z5z/uJbxHBX9R0ROriSGKaS6VL8cQjtgc0LQJSbh1r8Jvjvziqn+huYTkX
 g+RADNKQ/H09k5XJO36Pp6zirTZ3aZsoijAFxey8JicbBuFl8G4VY3bvNlaAtVUEJfBq
 XvaVSPhszpN5fs0srzq+ePTAw0b4IUqfFr9xmX52GSaScjP+kn0FG/TuEAGwHsjfR9/t
 cY0UJCdccyOzBN3HDrqFhz1HMzHgoh+Wpy6TRoET3NM1y2+ztL64dPuFtXBI5O5vxJWe
 bIbw==
X-Gm-Message-State: AOAM533hCHeTx52fotfHFs5OQ+XONEJsWmwb/AynZz/bmVnnHE5Jt94K
 tsME/euNFp9StTuw0Px84HUqS0cFd05LeqFXcWI=
X-Google-Smtp-Source: ABdhPJwLN3JLAZweJSj8I9PDnQ5t3UDnCmJ6jzOmk2NgYlJRjY/uTSAVQc8mkFdLPGGc+2hlm0r13u/yFcGFZ+aEYy0=
X-Received: by 2002:a63:2c15:0:b0:3f6:6a5f:8f0a with SMTP id
 s21-20020a632c15000000b003f66a5f8f0amr3954364pgs.76.1654171639739; Thu, 02
 Jun 2022 05:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-8-peterwu.pub@gmail.com>
 <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
In-Reply-To: <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Thu, 2 Jun 2022 20:07:08 +0800
Message-ID: <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com>
Subject: Re: [PATCH 07/14] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 02 Jun 2022 16:56:21 +0000
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
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang@richtek.com,
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
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for the valuable suggestion.

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:57=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Tue, May 31, 2022 at 1:32 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: Alice Chen <alice_chen@richtek.com>
> >
> > Add Mediatek MT6370 flashlight support
>
> Same comments about the commit message.
>
> ...
>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>
> + blank line?
Thanks, this will be refined in the new version.
>
> > +#include <media/v4l2-flash-led-class.h>
>
> + blank line
Thanks, this will be refined in the new version.
>
> > +enum {
> > +       MT6370_LED_FLASH1,
> > +       MT6370_LED_FLASH2,
> > +       MT6370_MAX_LEDS
> > +};
>
> ...
>
> > +       struct mt6370_led *led =3D container_of(fl_cdev, struct mt6370_=
led,
> > +                                             flash);
>
> > +       struct mt6370_led *led =3D container_of(fl_cdev, struct mt6370_=
led,
> > +                                             flash);
>
> Make a helper out of this
>
>   #define to_mt637_led()  container_of()
>
> and reuse.
Thanks, this will be refined in the new version.
>
> ...
>
> > +       /*
> > +        * For the flash turn on/off, HW rampping up/down time is 5ms/5=
00us,
>
> ramping
>
> > +        * respectively
>
> Period!
Thanks, this will be refined in the new version.
>
> > +        */
>
> ...
>
> > +       const char * const states[] =3D { "off", "keep", "on" };
> > +       const char *str;
> > +       int ret;
> > +
> > +       if (!fwnode_property_read_string(init_data->fwnode,
> > +                                        "default-state", &str)) {
> > +               ret =3D match_string(states, ARRAY_SIZE(states), str);
> > +               if (ret < 0)
> > +                       ret =3D STATE_OFF;
> > +
> > +               led->default_state =3D ret;
> > +       }
>
> fwnode_property_match_string()?
Sorry, but I think the use of this function is different from my target.
I want to read the string of the "default-state" property and figure
out if the string is in the states array.
But the fwnode_property_match_string aimed to figure out if the state
in the property array.
One is a property array and another one is a state array.
>
> ...
>
> > +       if (!count || count > MT6370_MAX_LEDS) {
> > +               dev_err(&pdev->dev,
> > +               "No child node or node count over max led number %lu\n"=
, count);
> > +               return -EINVAL;
>
> return dev_err_probe(...);
Thanks, will refine in the new version
>
> > +       }
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Sincerely,
Alice Chen
