Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D153BA5D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 16:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DCD112B3F;
	Thu,  2 Jun 2022 14:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E5E112B3C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 14:00:26 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id s12so2936811ejx.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AYxq+mMduPBX5NXqRBF2+5IJjnwegK5vDcEeTyInUPU=;
 b=auP1KW3KeSmMw7VIZ62/gbLMAnB923JIROgeNcNM60iNfs70SRXGH9Oh+PqNAIdl95
 sF3KgLrJAdhJvNL5E/yTCatacqFZTuJwNSgnwpd8r3nWCcjRXQOJQGh/LEv8L8WGwDHn
 GRMckxbpngc/1zSMfnGGQOEbWW1vqQbIAf/Fr7XQHihGGmhAIL+CXKz/Sx20mLoDFvK2
 Mrq/lvN37tLRQTJChv3fW11X7HfKADxJn3lW1n7mcgkdAUHAPKZhMEZRqOIIvJS+CQJo
 E9+wli3/tU0/Qxnp7IRGppAp11D6KG1QpREaRpW+RGISetT3kVGuRq7qeRk42Hciw7Be
 LYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AYxq+mMduPBX5NXqRBF2+5IJjnwegK5vDcEeTyInUPU=;
 b=XszSyv6al3QOFe/ORwmOKBGYlW1DAEmM5Hkp24unA61kjIVPjcDxJ91ABG9cU8i+Mk
 /yQOeaH37yNJYfIiWitMJF9H69D3+yFJ7q+XXVKuPCyUQR4J6Zc0wgsXDcJrnO3G/q8K
 5BhPQda3H6SUOAklrYZ5pmWbfrb1A0xon/uDwM4EBqppNcTLiaHKFYMJEb7pJyHFW5Ln
 XOitryJHoLTx+6yo5f3e5tknt1azSzHtljxsAePAFINNsjU2m4+UT8/GT1sIQ3eSpzNd
 dg6jRtfvk1BVSfguQ+/0RujxwXY0Xl9GhWbn6SOw20RtISHnkvpCLDrQX9EA50K/9Em6
 gkXQ==
X-Gm-Message-State: AOAM533RozvbHprqivHoYtm2w/4hkb59saOO8N8J3QLNxf0kVplw6mOH
 vuQl3wtXCS025pSoGhbl1E57cDEjDxPwCGowz5VNPu1r6qRUKw==
X-Google-Smtp-Source: ABdhPJxtpuBCKEOrj7yi3ocCsJZ0ETA3Lw0fV9RaebX5CwbyumoNpdxxmykaJXm5oH5aPRnpODJs/24H5iu7FWYfbjE=
X-Received: by 2002:a17:907:8a27:b0:707:cc50:e790 with SMTP id
 sc39-20020a1709078a2700b00707cc50e790mr4462180ejc.77.1654178424506; Thu, 02
 Jun 2022 07:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-8-peterwu.pub@gmail.com>
 <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
 <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com>
 <CAHp75Vf=ATRfaaaGFuuPHuQj6wTjnRPBw4W5WYfgYuUP-A-L=g@mail.gmail.com>
In-Reply-To: <CAHp75Vf=ATRfaaaGFuuPHuQj6wTjnRPBw4W5WYfgYuUP-A-L=g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Jun 2022 15:59:48 +0200
Message-ID: <CAHp75VdDLnisODLCpTEHdGcxCFATdJHfJWf+=GdGtYV2U_o9+g@mail.gmail.com>
Subject: Re: [PATCH 07/14] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: szuni chen <szunichen@gmail.com>
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

On Thu, Jun 2, 2022 at 3:57 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jun 2, 2022 at 2:07 PM szuni chen <szunichen@gmail.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=
=9C=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:57=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > On Tue, May 31, 2022 at 1:32 PM ChiaEn Wu <peterwu.pub@gmail.com> wro=
te:
...

> > > > +       const char * const states[] =3D { "off", "keep", "on" };
> > > > +       const char *str;
> > > > +       int ret;
> > > > +
> > > > +       if (!fwnode_property_read_string(init_data->fwnode,
> > > > +                                        "default-state", &str)) {
> > > > +               ret =3D match_string(states, ARRAY_SIZE(states), st=
r);
> > > > +               if (ret < 0)
> > > > +                       ret =3D STATE_OFF;
> > > > +
> > > > +               led->default_state =3D ret;
> > > > +       }
> > >
> > > fwnode_property_match_string()?
> > Sorry, but I think the use of this function is different from my target=
.
> > I want to read the string of the "default-state" property and figure
> > out if the string is in the states array.
> > But the fwnode_property_match_string aimed to figure out if the state
> > in the property array.
> > One is a property array and another one is a state array.
>
> Ah, indeed. Nevertheless you may reduce the code base by doing like
> the following (I wonder what your code do if there is no default-state
> property):
>
>   led->default_state =3D STATE_OFF; // it's by default off since
> kzalloc(), so I don't see why we need this line at all.
>
>   fwnode_property_read_string(init_data->fwnode, "default-state", &str);
>   ret =3D match_string(states, ARRAY_SIZE(states), str);
>   if (ret >=3D 0)
>     led->default_state =3D ret;

Missed change

  const char *str =3D states[STATE_OFF];

--=20
With Best Regards,
Andy Shevchenko
