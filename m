Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8257C7A9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 11:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0424C18B1E0;
	Thu, 21 Jul 2022 09:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224B42B103
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 09:31:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so2912236wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 02:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CqoqFDcKzQdjJafb6yVEzJIruLZ/32AbmJegq9jmsDE=;
 b=YAkXHOcznZLGmCMQ1RWcJzQ3Z/GteinQw/AfYqo5ctFERCkDoFahq79y6Y0pwx44gl
 GLoaT+TWNd0oMAh4jyhZmDSdFHC/Zftc1EEUiFnzxuN6N1LpjDVSm9lKMqXV2EhRL0Ry
 G079IVg2a7gAS5xznVv2gq67UufdW4WSzlQZ9DXRqk91zH4iPyHriQNKu1M+wNlTEo1n
 2zA0wZW0tNCpwEP/8UlLssY+QSaTfOjTnzVQJG4SXW9SEcPXN7mdEmbdei940aVuSXGZ
 guttcy1i/xfOMU5uu8eMfPDPGBLtmZOrxqajlos3sDC8OOgUFvJKwBYbuLu6PcMURAyn
 KT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CqoqFDcKzQdjJafb6yVEzJIruLZ/32AbmJegq9jmsDE=;
 b=1t3NfRPzxl0Ti4NasA+4ChOms6yg4MGSVRIxXbmB/6W3samX5d+H56zMzWvE9Ik9At
 QXHTZsM84b0UdpG7jdnTjTL4xcUjk9Hg7FAdjZoPgpphCaVT6nBNgZ9xFnUln0HwjzlK
 IEwm5DGIiPf5XgOwtvsuy+wwyZ6PxO1t7UaYOR96C/i/D1Oknqx8IzWlCijz2wCaQcVs
 kZbhm70xDbqz/ZR8oMUZbIPTdUQmVZjwrlvz1QK0jmrsOsDgMgoGNoHcDBd1kU2OMy1S
 5Da6Ci/y6iQElrPuKggs9gJvRRWeI2DtoH/3EgKBA41t3XOoERdVJUMXQyywR8A9Ng96
 x6gA==
X-Gm-Message-State: AJIora8uYnvZpXaT0HmSl/MlOI0oA4OKvgZcYXNGsPJfS5NdgcKv7ysU
 9Rsy1bZS3rPmUminx1dcWBREV7bp+jFOkhU1qX0=
X-Google-Smtp-Source: AGRyM1uth3ZszQR4Y69c6/F2fcYkQehI7TUvzonlMhEKjh0dv2rEa6EpJ0tm1xDP06OICuKvouAgditDjMYoi6Y6Kko=
X-Received: by 2002:a05:600c:2110:b0:3a3:1a69:aa7b with SMTP id
 u16-20020a05600c211000b003a31a69aa7bmr7190128wml.186.1658395901183; Thu, 21
 Jul 2022 02:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-12-peterwu.pub@gmail.com>
 <CAHp75VfyVufzf7CK38BVu_j0B4ax_d1gLAGYDE3H1zaKkuUB=A@mail.gmail.com>
 <20220720094510.GA29755@cyhuang-hp-elitebook-840-g3.rt>
 <CADiBU3_rtVXFX3qdSoc=F-zs9CYiNRmNPOa3RffRJD1Qc5N-bA@mail.gmail.com>
In-Reply-To: <CADiBU3_rtVXFX3qdSoc=F-zs9CYiNRmNPOa3RffRJD1Qc5N-bA@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 21 Jul 2022 17:31:29 +0800
Message-ID: <CADiBU39=kJXLuBd=3reeEVCaAhvkZXASsFYtsi6oEYJjc79dhA@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] leds: mt6370: Add MediaTek MT6370 current sink
 type LED Indicator support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Fri, Jul 15, 2022 at 08:29:42PM +0200, Andy Shevchenko wrote:
> > > On Fri, Jul 15, 2022 at 1:29 PM ChiaEn Wu <peterwu.pub@gmail.com> wro=
te:
> > > >
> > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > >
> > > > The MediaTek MT6370 is a highly-integrated smart power management I=
C,
> > > > which includes a single cell Li-Ion/Li-Polymer switching battery
> > > > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > > > Flash LED current sources, a RGB LED driver, a backlight WLED drive=
r,
> > > > a display bias driver and a general LDO for portable devices.
> > > >
> > > > In MediaTek MT6370, there are four channel current-sink RGB LEDs th=
at
> > > > support hardware pattern for constant current, PWM, and breath mode=
.
> > > > Isink4 channel can also be used as a CHG_VIN power good indicator.
> > >
> > > ...
> > >
> > > > +         This driver can also be built as a module. If so the modu=
le
> > >
> > > so, the
> > >
> > > > +         will be called "leds-mt6370.ko".
> > >
> > > No ".ko".
> > >
> > > Why did you ignore these comments? Please go and fix _everywhere_ in
> > > your series.
> > > It's basically the rule of thumb, if the reviewer gives a comment
> > > against an occurrence of something, go through entire series and chec=
k
> > > if there are other places like commented one and address them all.
> > >
> > > ...
> > >
> > > > + * Author: Alice Chen <alice_chen@richtek.com>
> > >
> > > Strange, the commit message doesn't have a corresponding SoB, why?
> > >
> > Yes, there're two authors Alice and me.
> > I'll correct it in next.
> > > ...
> > >
> > > > +#define MT6370_PWM_DUTY                                31
> > > > +#define MT6372_PMW_DUTY                                255
> > >
> > > Looks like these are limits by hardware?
> > > Check with the datasheet if (BIT(x) - 1) makes more sense here.
> > >
> > > ...
> > >
> > > > +       switch (led_no) {
> > > > +       case MT6370_LED_ISNK1:
> > > > +               sel_field =3D F_LED1_DUTY;
> > > > +               break;
> > > > +       case MT6370_LED_ISNK2:
> > > > +               sel_field =3D F_LED2_DUTY;
> > > > +               break;
> > > > +       case MT6370_LED_ISNK3:
> > > > +               sel_field =3D F_LED3_DUTY;
> > > > +               break;
> > > > +       default:
> > > > +               sel_field =3D F_LED4_DUTY;
> > >
> > > Missed break;
> > >
> > > > +       }
> > >
> > > ...
> > >
> > > > +       switch (led_no) {
> > > > +       case MT6370_LED_ISNK1:
> > > > +               sel_field =3D F_LED1_FREQ;
> > > > +               break;
> > > > +       case MT6370_LED_ISNK2:
> > > > +               sel_field =3D F_LED2_FREQ;
> > > > +               break;
> > > > +       case MT6370_LED_ISNK3:
> > > > +               sel_field =3D F_LED3_FREQ;
> > > > +               break;
> > > > +       default:
> > > > +               sel_field =3D F_LED4_FREQ;
> > >
> > > Ditto.
> > >
> > > > +       }
> > >
> > > ...
> > >
> > > > +       switch (led_no) {
> > > > +       case MT6370_LED_ISNK1:
> > > > +       case MT6370_LED_ISNK2:
> > > > +       case MT6370_LED_ISNK3:
> > > > +               *base =3D MT6370_REG_RGB1_TR + led_no * 3;
> > > > +               break;
> > > > +       default:
> > > > +               *base =3D MT6370_REG_RGB_CHRIND_TR;
> > >
> > > Ditto.
> > > It seems you dropped them for all switch-cases. It's not goot, please
> > > restore them back.
> > >
> > > > +       }
> > >
> > > ...
> > >
> > > > +       u8 val[P_MAX_PATTERNS / 2] =3D {0};
> > >
> > > { } should suffice
> > >
> > >
> > In the above range selector, we use the 'logic or' to generate the
> typo, it's 'below'.
> > pattern values.
> >
Ah, found in c11 standard 6.7.9 item 21
It is the same as 'static storage duration'.
I will follow your comment to revise it.
Thanks.
> > If to change it from '{0} to '{ }', is it correct?
> > > > +       /*
> > > > +        * Pattern list
> > > > +        * tr1: byte 0, b'[7: 4]
> > > > +        * tr2: byte 0, b'[3: 0]
> > > > +        * tf1: byte 1, b'[7: 4]
> > > > +        * tf2: byte 1, b'[3: 0]
> > > > +        * ton: byte 2, b'[7: 4]
> > > > +        * toff: byte 2, b'[3: 0]
> > > > +        */
> > > > +       for (i =3D 0; i < P_MAX_PATTERNS; i++) {
> > > > +               curr =3D pattern + i;
> > > > +
> > > > +               sel_range =3D i =3D=3D P_LED_TOFF ? R_LED_TOFF : R_=
LED_TRFON;
> > > > +
> > > > +               linear_range_get_selector_within(priv->ranges + sel=
_range,
> > > > +                                                curr->delta_t, &se=
l);
> > > > +
> > > > +               val[i / 2] |=3D sel << (4 * ((i + 1) % 2));
> > > > +       }
> > > > +
> > > > +       memcpy(pattern_val, val, 3);
> > > > +       return 0;
> > > > +}
> > >
> > > ...
> > >
> > > > +out:
> > >
> > > out_unlock:
> > >
> > > > +       mutex_unlock(&priv->lock);
> > > > +
> > > > +       return ret;
> > >
> > > ...
> > >
> > > > +out:
> > >
> > > Ditto. And so on.
> > >
> > > > +       mutex_unlock(&priv->lock);
> > > > +
> > > > +       return ret;
> > >
> > > ...
> > >
> > > > +               sub_led =3D devm_kzalloc(priv->dev,
> > > > +                                      sizeof(*sub_led) * MC_CHANNE=
L_NUM,
> > > > +                                      GFP_KERNEL);
> > >
> > > NIH devm_kcalloc(). Also check if you really need zeroed data.
> > >
> > Ok, and after the check, I also need to add one line to set the intensi=
ty to 0.
> > > > +               if (!sub_led)
> > > > +                       return -ENOMEM;
> > >
> > > ...
> > >
> > > > +                       ret =3D fwnode_property_read_u32(child, "co=
lor", &color);
> > > > +                       if (ret) {
> > > > +                               dev_err(priv->dev,
> > > > +                                       "led %d, no color specified=
\n",
> > > > +                                       led->index);
> > > > +                               return ret;
> > >
> > > return dev_err_probe(...) ; ?
> > >
> > > Ditto for many places in your entire series.
> > >
> > > > +                       }
> > >
> > > ...
> > >
> > > > +       priv =3D devm_kzalloc(&pdev->dev,
> > > > +                           struct_size(priv, leds, count), GFP_KER=
NEL);
> > >
> > > At least one parameter can be placed on the previous line.
> > >
> > > > +       if (!priv)
> > > > +               return -ENOMEM;
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
