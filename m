Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A956A53BA3F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A037112B2B;
	Thu,  2 Jun 2022 13:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7831112B2B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:57:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id rs12so10097155ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lCjXd1DtLAOiKDUVepuP3tVKlqmoM9phz1lypZW4eiM=;
 b=eKXUR7kiBU80Kt1ivUsBYC1Vp5ABsZgOFlwcUTfYnL3EYaoBLLC4llE6qNCbLYkoPK
 yV/E9DUt2ifgfA2Nbk6ykWpgQhfm9txSuz+Z9LmYA2e0QtK14BpQdaIg86EMFNfuUWkx
 hMXNoGeRpp7Hw5ALo7uCiIN/Vg+bFN+64MnxIrSs4784P1udBgejLUQnnHasBXCy/VJv
 Hraq92Husrz3Xf7aLdubPKJuxySVXpGPA0CZZLKoHOr29+EvAoDaQOSqIfuA/pA2wdFl
 oxnZHqbsTfLFBaxgW2BGhnhwkC0uMC12x04YUFSe3zvFWWisWKPD/j9A/tTeJZTOCSWO
 kQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lCjXd1DtLAOiKDUVepuP3tVKlqmoM9phz1lypZW4eiM=;
 b=BeWvwHId6nRzcmn8z4cEAChYCeQuHJbJax5w5Rr74aqka+PDmG1TmR0XkPyvxqeTdc
 UJr7MgeuC5+WytksdYHJukSPD9z6fQkPTnYfwo828CqKQM8k4OwL8NYP3cDRip9P19Yu
 BAoEfjmQgJYlGin0FVsNVZBRXKuYo2OJUkiou3aA9TJxitD6XcSRyIZMLh5jaFs5WDCj
 3G1zNzZyBPB63u/ml2SNg1jfQ4wmQUMsSPnq5ZE1ptn7S85fvyRcKsSZeoCAuCCTJAIB
 ZxY2OZImvQ3TPI+p+2EIaZlT2TQyH2c45Lmj/o+2Fi2DgEXt9qZQbMIYZkWhDAxqKuOv
 5u9A==
X-Gm-Message-State: AOAM533Rj+s0ExBesX3bEvb6NrVf6YwzVfb6pG4IrBev4ipgN7l6hQTY
 DFCxsgMfM8issTle/AJuvG7w6LFTwBBzHl7nu0k=
X-Google-Smtp-Source: ABdhPJw17vPxP2UwrASUkgWE75bkBumiXi0yzz2upgIbMhdhBA7mECqviI1+XnRf2zU0lOm4Q01q8wM9WsX0p02cGPY=
X-Received: by 2002:a17:907:6e04:b0:6f4:d6f3:c72a with SMTP id
 sd4-20020a1709076e0400b006f4d6f3c72amr4545345ejc.636.1654178277156; Thu, 02
 Jun 2022 06:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-8-peterwu.pub@gmail.com>
 <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
 <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com>
In-Reply-To: <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Jun 2022 15:57:19 +0200
Message-ID: <CAHp75Vf=ATRfaaaGFuuPHuQj6wTjnRPBw4W5WYfgYuUP-A-L=g@mail.gmail.com>
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

On Thu, Jun 2, 2022 at 2:07 PM szuni chen <szunichen@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=
=9C=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:57=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Tue, May 31, 2022 at 1:32 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:

...

> > > +       const char * const states[] =3D { "off", "keep", "on" };
> > > +       const char *str;
> > > +       int ret;
> > > +
> > > +       if (!fwnode_property_read_string(init_data->fwnode,
> > > +                                        "default-state", &str)) {
> > > +               ret =3D match_string(states, ARRAY_SIZE(states), str)=
;
> > > +               if (ret < 0)
> > > +                       ret =3D STATE_OFF;
> > > +
> > > +               led->default_state =3D ret;
> > > +       }
> >
> > fwnode_property_match_string()?
> Sorry, but I think the use of this function is different from my target.
> I want to read the string of the "default-state" property and figure
> out if the string is in the states array.
> But the fwnode_property_match_string aimed to figure out if the state
> in the property array.
> One is a property array and another one is a state array.

Ah, indeed. Nevertheless you may reduce the code base by doing like
the following (I wonder what your code do if there is no default-state
property):

  led->default_state =3D STATE_OFF; // it's by default off since
kzalloc(), so I don't see why we need this line at all.

  fwnode_property_read_string(init_data->fwnode, "default-state", &str);
  ret =3D match_string(states, ARRAY_SIZE(states), str);
  if (ret >=3D 0)
    led->default_state =3D ret;


--=20
With Best Regards,
Andy Shevchenko
