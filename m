Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F368E6BB8DC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 16:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4653A10E971;
	Wed, 15 Mar 2023 15:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4D010E971
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 15:59:41 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id n125so6162808ybg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678895980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Hkb0Z/tYYZSdI2YGR7CKQ+EDo9PzMXn0G/3i+Y5MwM=;
 b=HAvxY2y0K98/w3C339mOOAQzkXNU7suKDrE+oReOnAWfju0KoSCgolXdK+X4r8CHgN
 afroLwSaC3Wk3W9YQ9WmLcLtBWLq8ohidkk5GyWA1ua9r58tBWi716eqikZ6WWjMnjX6
 3HpK5Y2MjFvO5Aecw1aUn4xEjsk4IEZARbMPHMmUNRYnyEhc0dERnPIcwEuIIkioSz7v
 qKI+pEHFV4AV5vKJV1pVlmlnx2C71iwjsEtqfre5+RK9YuC6r4JpoqlgV4jx+mwjv5MN
 YZZwlGAnv7UcksfYDh5vmrh1x+tyvVOnmpRCxVj0cqWkzGXgUIafjbjn2mn/k7pBylNJ
 wBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678895980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Hkb0Z/tYYZSdI2YGR7CKQ+EDo9PzMXn0G/3i+Y5MwM=;
 b=gHWLmTj14VI50YtmCWfU/UbZ0s5qSoa5y2KsW2Yr9SDoNXzVlGNl7h80C/FzIdAHwO
 tPWuXjEPtumRpu7kVAX6xTQlcEIYEYLcWoCVfAlv5NYf5SbZDW6SHszj//OYa7BtHa1h
 Dbt6ZDdDi8uCRd9OWo1+IWwdm7gjdehb+rQ1jiaC61pll0IsOVL3qCCdih+TNV4CssTh
 lL+gDWJDiG21yLVhVfL7TKYf+yJhdphs1fDw32ZW+M0kWVN9V7HdvL0zJu1aENhWJ6Nd
 hJZHc9cUhyhvt94f2KwaCAKht2ugWw8L6DX19ksJ/MpBgK0uZbw4WmfXitOqztjre7GI
 DuJA==
X-Gm-Message-State: AO0yUKUshXhi5rVIiKpzh6LRhkh+hvtV6r1MpCSgQ8xoDK9phTjFJKMl
 ovGF/TBwvl4y0rmp59i3PG28hXt2jjAobNgj6Uuh3g==
X-Google-Smtp-Source: AK7set+cRmZtlbO9MMeDKr/hukXl0wpMQ3FA/Xz+syeKJfKfZEuF5mOSKngD+5GIMx1/X8Swm2YFxI5NP785yU6JIh0=
X-Received: by 2002:a5b:386:0:b0:b0a:7108:71e9 with SMTP id
 k6-20020a5b0386000000b00b0a710871e9mr12111573ybp.4.1678895980181; Wed, 15 Mar
 2023 08:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-21-45cbc68e188b@baylibre.com>
 <4b4d4749-c5ea-3a02-190e-3db703623977@linaro.org>
In-Reply-To: <4b4d4749-c5ea-3a02-190e-3db703623977@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 16:59:29 +0100
Message-ID: <CAFGrd9pQJWYpdruUvbZNcQRZk5viyOAUCDpJcu5anA13E26Unw@mail.gmail.com>
Subject: Re: [PATCH 21/21] panel: startek-kd070fhfid015: add support of this
 display
To: neil.armstrong@linaro.org
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Le jeu. 9 mars 2023 =C3=A0 15:51, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
> > +
> > +#include <drm/drm_crtc.h>
>
> Is this include needed ?

Seems not, I remove it.

> > +     struct gpio_desc *enable_gpio;
> > +     struct gpio_desc *reset_gpio;
> > +     struct gpio_desc *dcdc_en_gpio;
>
> Isn't this "DCDC" a regulator ???

According to the panel datasheet, this is an input signal needed
passing through TFT connector (PIN30):
"Power IC supply enable, High active"

> > +     /* Interface setting, video mode */
> > +     ret =3D mipi_dsi_generic_write(dsi,
> > +                     (u8[]){DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00},=
 6);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to set display interface setting: %d=
\n",
> > +                     ret);
> > +             return ret;
> > +     }
>
> Use mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0=
x00); instead,
> it's simpler and doesn't need explicit return check.

"mipi_dsi_generic_write_seq" doesn't exist but I will add it below
"mipi_dsi_dcs_write_seq" in drm_mipi_dsi.h
I must keep the return check to jump out of "stk_panel_init" if
something goes wrong, but I can drop the error print.

> > +static int stk_panel_enable(struct drm_panel *panel)
> > +{
> > +     struct stk_panel *stk =3D to_stk_panel(panel);
> > +
> > +     if (stk->enabled)
> > +             return 0;
> > +
> > +     backlight_enable(stk->backlight);
> > +
> > +     stk->enabled =3D true;
> > +
> > +     return 0;
> > +}
>
> Is this really needed ? the backlight core will enable it automatically.

Ok, it's managed by drm_panel.c driver.
Then I can also remove stuff from stk_panel_disable.


Regards,
Alex
