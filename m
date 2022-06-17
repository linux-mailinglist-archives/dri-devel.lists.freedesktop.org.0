Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0C54F469
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 11:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438A610E5F1;
	Fri, 17 Jun 2022 09:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A05910E5F1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 09:34:46 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id l14so2628788ilq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DE+zQZQcyF759AJuVRCgUw1QrZjmmIkS9SVF/uua3CY=;
 b=TDYeLEaQ+IkQCFwsN5ZQ3F+UqxbwCBkt2zAq1tT7vFaTl9fJAuS6YerABjtHK4mOxb
 TrWcAGr6YdcXb4ALZYnuW0EpzY4enIB9a/N3rtcIPVVz4H1oggG/gQz0f3KJwQbFOZs+
 ZDCH0HPt5AB9qRpQyELl2+owWkOE4MPyxjEyB1griWQ0FRFlaxna+kw6cHUIvotV2buP
 qGa7xwHI7l3QT8uJSCUU0PAsReT6s7CYfX0V77qw7CtMyEcqx6Q0ejjLwWvhsopT7FxJ
 em13cvYi2AvF5IlY6VaJ05xly218vuCyMNqAGbLG4d8okAD+4yvBpXEn1shR0HMx1yLK
 ISlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DE+zQZQcyF759AJuVRCgUw1QrZjmmIkS9SVF/uua3CY=;
 b=wTSvaH7CHrGvDGO4jy4eGJxTjJI5Zsj62mRMAOqbCVP2ZxbtKLzo3cvqVczFtR0/Or
 uYP5NW5YYuh0yCMn4ZM1FRMziFOdGv/FFnLWBGU9TQPG+CBXPKtQaNr6tVMMTi3+LEvg
 3RTyPf+roy9+pm77gJWt9wl47T1jrVcjv6d+K3xSHNcHcJ4HQly6KlhZkDhsaUKo3gPD
 r2siNd0anCNIjfwLxN5b44/I5PhecDEb0S+roAIhg6qSKejDAY1YSoe6JGDDnZC0XxaN
 Ao3XmVQ3fwUP4Z8dTXwMYiIl6OZ9R3y+XcsqJL0iPIW3xGiDZtlEKi6TUqdOHXEajXlY
 nnyQ==
X-Gm-Message-State: AJIora/VjVeFBr2VFNh5yYFdoMY8F9D/BeO3WHgNcUF0RMtXBj3fQ/9e
 nqbRmyBGmmcgnK5G7JwEkX7Hy8OZIuakOMQXwyM=
X-Google-Smtp-Source: AGRyM1ubwnEFy3CYAH9fHWaontZ0WgA5WaEtmBHPaT66gte2AsL67svPaO35GdaGEkb9HpkJB7x7C2X7WR6oIGxmrjk=
X-Received: by 2002:a05:6e02:4a1:b0:2d3:a778:f0f1 with SMTP id
 e1-20020a056e0204a100b002d3a778f0f1mr5168320ils.212.1655458485946; Fri, 17
 Jun 2022 02:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-16-peterwu.pub@gmail.com>
 <20220613170853.bffuwkcmflfgg4gt@ash.lan>
In-Reply-To: <20220613170853.bffuwkcmflfgg4gt@ash.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 17:34:35 +0800
Message-ID: <CABtFH5JKnxF5TqV=9EiAZEm4Un0npNo-GX8xLD4W5+S+pA+ysg@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] video: backlight: mt6370: Add Mediatek MT6370
 support
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com,
 ChiaEn Wu <chiaen_wu@richtek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 szunichen@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for your helpful feedback!

Daniel Thompson <daniel.thompson@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A81:08=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Jun 13, 2022 at 07:11:46PM +0800, ChiaEn Wu wrote:
> > +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> > +                                         struct backlight_properties *=
props)
>
> Most of the changes in this version looks good... but it looks the new
> code in this function has a number of problems. See below...
>
>
> > +{
> > +     struct device *dev =3D priv->dev;
> > +     u8 prop_val;
> > +     u32 brightness;
> > +     unsigned int mask, val;
> > +     int ret;
> > +
> > +     /* Vendor optional properties
> > +      * if property not exist, keep value in default.
> > +      */
>
> That's not the right strategy for booleans. Not existing means false
> (e.g. flags should actively be unset).
>

I am so sorry for making these mistakes...
I will try to refine them in the right strategy in the next patch!

>
> > +     if (device_property_read_bool(dev, "mediatek,bled-pwm-enable")) {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_PW=
M,
> > +                                      MT6370_BL_PWM_EN_MASK,
> > +                                      MT6370_BL_PWM_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> As above comment... all of the boolean properties are now being read
> incorrectly.
>
>
> > +
> > +     if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable"=
)) {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_PW=
M,
> > +                                      MT6370_BL_PWM_HYS_EN_MASK,
> > +                                      MT6370_BL_PWM_HYS_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-pwm-hys-input=
-bit",
> > +                                   &prop_val);
> > +     if (!ret) {
> > +             val =3D min_t(u8, prop_val, 3)
> > +                   << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_PW=
M,
> > +                                      MT6370_BL_PWM_HYS_SEL_MASK, val)=
;
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-ovp-microvolt=
",
> > +                                   &prop_val);
> > +     if (!ret) {
> > +             val =3D min_t(u8, prop_val, 3)
> > +                   << (ffs(MT6370_BL_OVP_SEL_MASK) - 1);
>
> This has been renamed but still seems to the using 0, 1, 2, 3 rather
> than an actual value in microvolts.

I=E2=80=99m so sorry for using the not actual value in microvolts and micro=
amps.
I will refine these mistakes along with DT in the next patch. Thank you!

>
>
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OVP_SEL_MASK, val);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (device_property_read_bool(dev, "mediatek,bled-ovp-shutdown"))=
 {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OVP_EN_MASK,
> > +                                      MT6370_BL_OVP_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-ocp-microamp"=
,
> > +                                   &prop_val);
> > +     if (!ret) {
> > +             val =3D min_t(u8, prop_val, 3)
> > +                   << (ffs(MT6370_BL_OC_SEL_MASK) - 1);
>
> Likewise, should this be accepting a value in microamps?
>
>
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OC_SEL_MASK, val);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (device_property_read_bool(dev, "mediatek,bled-ocp-shutdown"))=
 {
> > +             ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BS=
TCTRL,
> > +                                      MT6370_BL_OC_EN_MASK,
> > +                                      MT6370_BL_OC_EN_MASK);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     /* Common properties */
> > +     ret =3D device_property_read_u32(dev, "max-brightness", &brightne=
ss);
> > +     if (ret)
> > +             brightness =3D MT6370_BL_MAX_BRIGHTNESS;
> > +
> > +     props->max_brightness =3D min_t(u32, brightness,
> > +                                   MT6370_BL_MAX_BRIGHTNESS);
> > +
> > +     ret =3D device_property_read_u32(dev, "default-brightness", &brig=
htness);
> > +     if (ret)
> > +             brightness =3D props->max_brightness;
> > +
> > +     props->brightness =3D min_t(u32, brightness, props->max_brightnes=
s);
> > +
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-channel-use",
> > +                                   &prop_val);
> > +     if (ret) {
> > +             dev_err(dev, "mediatek,bled-channel-use DT property missi=
ng\n");
> > +             return ret;
> > +     }
> > +
> > +     if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
> > +             dev_err(dev, "No channel specified (ch_val:%d)\n", prop_v=
al);
>
> Error string has not been updated to match condition that triggers it.
>

I will refine this wrong error string in the next patch, thanks!

>
> > +             return -EINVAL;
> > +     }
>
>
> Daniel.

Best regards,
ChiaEn Wu
