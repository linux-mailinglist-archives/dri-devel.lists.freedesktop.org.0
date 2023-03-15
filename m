Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6B6BAA48
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 09:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864C410E961;
	Wed, 15 Mar 2023 08:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8406410E94E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:01:42 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id z83so14326322ybb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678867301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLmw2pWkt+2UlVCNqfxLlIyJordQ48jgkm7yvgM5sos=;
 b=kfzb/qXnb2Lz2It2VeCU2JPOke00lu76iOWT0N8lzXzxgMgNVNJo8c992euigO3pOg
 2cTHApKRAs0MW4AwdKmoVT4E4lTpbiyLxDNjYykxKPYMO82GHOnWvLWC8eKRvhL3LBdX
 0GgIpT3UnwnxLJGXs830kO/zF3o+VhktcReF1q88KLkn2rG7/9fSv5hJxIEgVsOXZA+T
 V68WfMU1jJi88lfhhD2mNqlQoYp+CdcBAi2HBFu+egrPostJEcOHf4/w8AN6L9cdMRQf
 GzNRgl2nZ098e2UH8AS+5knHhmlK+uMTSlMPnkOYBJWhmuY9qF7ZIshgWM9U9lMG8YFU
 G49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678867301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLmw2pWkt+2UlVCNqfxLlIyJordQ48jgkm7yvgM5sos=;
 b=5hTHcUUGKCtLWP18TUGGHuHIRnSnnP1S5KKMyYPD8Hac21r5j18egaufowUBXJRpCR
 WQ3QOjisw3lb/1JGYKwOtrrFq/G168D32UiAcyh47BiCoQkZh97SvXrKdoCOuzGA9w+e
 V9rT7wYPvIB/zGsr92VB/JHlEjdtz81ytptYa+1iqUzMrW6suUD6BenjK1a7gekGpuj0
 ktRcIdbx320QxATyQVQzcqZC6szkvnEJFqqb9hxC+vD7dslQoRhtsL2iWH5cpyTVhEF6
 pPBf0/Q+VTG0nRTPcwmJ1epkP6UcrRd4iB7ErENVtVr2nfpoRY1jwT9TgWLzqdR5aMJU
 En+A==
X-Gm-Message-State: AO0yUKV6bzr+zKwJej71F8iwaW404ECPxAzrDXZ2F8qe0EnvkDK97o8f
 tSrhjArh1Ra18btqczbB8T2KPF6QBgZhWz/1TU8NeA==
X-Google-Smtp-Source: AK7set9LpeP+JeZx2ldhs9oY8bVS2Fz4YRdUKtYi/IMSTV0qIeC8WW+E425cUJjwgqA/oB9hoYpKIBLTZzuVNM14JVg=
X-Received: by 2002:a05:6902:10e:b0:98e:6280:74ca with SMTP id
 o14-20020a056902010e00b0098e628074camr23087865ybh.1.1678867301383; Wed, 15
 Mar 2023 01:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
 <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
In-Reply-To: <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 09:01:30 +0100
Message-ID: <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
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

Le ven. 10 mars 2023 =C3=A0 09:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 09/03/2023 15:23, Alexandre Mergnat wrote:
> > Add compatible for the MT8365 SoC.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1=
 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mu=
tex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.ya=
ml
> > index ca0ca549257d..931d66893dff 100644
> > --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam=
l
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam=
l
> > @@ -34,6 +34,7 @@ properties:
> >        - mediatek,mt8186-mdp3-mutex
> >        - mediatek,mt8192-disp-mutex
> >        - mediatek,mt8195-disp-mutex
> > +      - mediatek,mt8365-disp-mutex
>
> All these look compatible. Either make mt8635 compatible with something
> or even rework entire list and make everything compatible.

All of them use "mtk_mutec.c" but have specific data.

      .data =3D &mt8173_mutex_driver_data},
    { .compatible =3D "mediatek,mt8183-disp-mutex",
      .data =3D &mt8183_mutex_driver_data},
    { .compatible =3D "mediatek,mt8186-disp-mutex",
      .data =3D &mt8186_mutex_driver_data},
    { .compatible =3D "mediatek,mt8186-mdp3-mutex",
      .data =3D &mt8186_mdp_mutex_driver_data},
    { .compatible =3D "mediatek,mt8192-disp-mutex",
      .data =3D &mt8192_mutex_driver_data},
    { .compatible =3D "mediatek,mt8195-disp-mutex",
      .data =3D &mt8195_mutex_driver_data},
    { .compatible =3D "mediatek,mt8365-disp-mutex",
      .data =3D &mt8365_mutex_driver_data},

I don't see any SoC compatible with mt8635, and I have no idea which
rework you have in mind. Can you please point me an example ?

Thanks
Alex
