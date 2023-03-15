Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27E36BAA95
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 09:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96710E96C;
	Wed, 15 Mar 2023 08:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4C910E951
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:17:37 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5416698e889so232120137b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 01:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678868256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cFDHkDhzKIIZdfQe731ScSWbZ+pa4Y9mnpJSsgdej0=;
 b=Cqc1RbAoAG7SPoHu55E0XZTM+z8BoLE9CzEd+0gppfbO0rvJ2HIPlImz3fPiqXHwje
 0fylYt8YoL+Gqaz/wp/yr9FDY7oRovbssk+gZAtfdzJ8JiqF/fFjweB/p7mubvXKXdvg
 TrMAIk1i5uLDH8eB1VxrwaegWVd9al7bQPhlSbOFVxdC4ByBhbQZo2BA74lasOO4aiW0
 seUHl2jWTwnySkP4StLrYKWKwEqTurfN0Skj7FyUEbPOuInFam228Kc3LyPgyEarQ1k9
 UYP++NomYQE1tVK4OpR60XKwJGPVk0d7cfVCZ+WYms8b8MdYDcddn9RTbWnl1xg8zFVI
 aWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678868256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cFDHkDhzKIIZdfQe731ScSWbZ+pa4Y9mnpJSsgdej0=;
 b=dNJGJN0gmWPU1cr+7lq+B4mH4449u7szCjy72kB38cwMw5/4k7l4gm/KxDm0B1bPsf
 p0cveEyo8RgioZ2mR39LkjJGkFipCnfVq76PFecjuaM/Bbko8k7feCV7wHrm3h5u9NaI
 NGjeZhasEZpoJ3KaLGziGLBNuEadDof17akG+Lu0yMyfRPpT4tI9VVMnFjXAJRUV2z5r
 s0+59+tK+PjBNgNUrQ5mD6p1B2XhL7Y3JXKQuKeJ1ivVeDxxH4Va2d0ToObuwg/tYeKw
 lhtvGEhcnlSAmrCipuHLTtNBROd+naVf7bGP6cuswB61Vv08RZU7l3gVVQIfOv4/CLIk
 ffbQ==
X-Gm-Message-State: AO0yUKVJdyoSMbUqcC4zqPG41kPPspkBvzpplNUGVd7iNuOZ40uMMaOy
 NbVWwdtpl4tuN18SGDeRIadd5ZjbLdEDOn5kFGk2StntpABy3JmSOHaq6w==
X-Google-Smtp-Source: AK7set+vWYd9VC1u2ZYEyLnKAP2XlPt0kks70Y2AA7nxYNvRmd9OC+0WRfKFUao5ZMBw0zKT8aiEIEKpKMidYl4M3XU=
X-Received: by 2002:a81:b247:0:b0:52f:24ac:9575 with SMTP id
 q68-20020a81b247000000b0052f24ac9575mr26775509ywh.3.1678868256601; Wed, 15
 Mar 2023 01:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
 <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
 <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
In-Reply-To: <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 09:17:25 +0100
Message-ID: <CAFGrd9pHB_ACHRHHv41cX+hCoC6ZxoJc=x52wt_=WQcDHWf29g@mail.gmail.com>
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maybe "oneOf" should be added at least ?

  compatible:
    oneOf:
      - enum:

Regards,
Alex

Le mer. 15 mars 2023 =C3=A0 09:01, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> Le ven. 10 mars 2023 =C3=A0 09:39, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> a =C3=A9crit :
> >
> > On 09/03/2023 15:23, Alexandre Mergnat wrote:
> > > Add compatible for the MT8365 SoC.
> > >
> > > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > > ---
> > >  Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml |=
 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.=
yaml
> > > index ca0ca549257d..931d66893dff 100644
> > > --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.y=
aml
> > > +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.y=
aml
> > > @@ -34,6 +34,7 @@ properties:
> > >        - mediatek,mt8186-mdp3-mutex
> > >        - mediatek,mt8192-disp-mutex
> > >        - mediatek,mt8195-disp-mutex
> > > +      - mediatek,mt8365-disp-mutex
> >
> > All these look compatible. Either make mt8635 compatible with something
> > or even rework entire list and make everything compatible.
>
> All of them use "mtk_mutec.c" but have specific data.
>
>       .data =3D &mt8173_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8183-disp-mutex",
>       .data =3D &mt8183_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8186-disp-mutex",
>       .data =3D &mt8186_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8186-mdp3-mutex",
>       .data =3D &mt8186_mdp_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8192-disp-mutex",
>       .data =3D &mt8192_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8195-disp-mutex",
>       .data =3D &mt8195_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8365-disp-mutex",
>       .data =3D &mt8365_mutex_driver_data},
>
> I don't see any SoC compatible with mt8635, and I have no idea which
> rework you have in mind. Can you please point me an example ?
>
> Thanks
> Alex
