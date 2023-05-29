Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A572A714BBA
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F97310E2C1;
	Mon, 29 May 2023 14:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA610E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:03:40 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so3137918e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1685343818; x=1687935818; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ktk43I3ESCcl+4luTfcpacoXkK0rOIgacSkU1dOgQfA=;
 b=EzVaURV3PRKZ1IXRJ20SKWyI2R3+cbBKjkEDiWxGuhXDEs4tYnYXxcmcG5TWdUw+q1
 JlEeNlM+mHBU7+DOoZqm+tBjhkOifHP1AsCo1tDsqPHHr/XlHBr9QoOqORH4P+lZw+5O
 dmHKET4mthkLuOTwi0yJJ+Mcz4uyXC4TIvQaAlE7AD0k5LaBcXXifSf8/pbPE7aUh26Z
 ZA3c8gDgyVhDf24nQQyh8Bf99q1L0NtrjfeBqJT+FQHgJO6VGJrqIFrJMCMnnVBA1KjI
 1HfSoT34FV/E0bjV7QblXJA1taCMNKAHRREduGMGSHwxb7KqkhCubTTC6w6jYdNcnJxf
 Erzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685343818; x=1687935818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ktk43I3ESCcl+4luTfcpacoXkK0rOIgacSkU1dOgQfA=;
 b=PsECq0b8wOc+Ah/szeiostBF5/rOqpQbTCWK6TYQLFvQ20zmCcZ7aAIjLANm0MCkDM
 NjqourGjFpa1pwM1Qx4sRd8w8GxYxb7FkjBTM+IbLOD9c9mPVBNQITKJL7OCHYEwz8Vz
 uChVuS8LAyN7eHAa1Jd6pVorVnTescU+cZEyF3kVrMGjQdQ9CbiP65mme5giQQZ0dJd7
 rglaRKeMZpoK/V/4HX1OJP+DWvPgBjH3nFbpYWwQTvTEDX7Dj7FFqAwr5vLqt3BY4/zf
 74aNPyg7ZyTWVrb+lPF0JwZEZdX3Mq0lMTRkcNElNg78jCEzmF7SacZOBimNyBKBGyTY
 TBsQ==
X-Gm-Message-State: AC+VfDwEu11kEGzMh9UFiP3HIMQLtMcgk2mQ6wJwlEXG4O+0rnxWYtuC
 iORynSglh4iXgKikyhUSqofJMwOrr9yPkyrxqWijLQ==
X-Google-Smtp-Source: ACHHUZ4VkOxh0fNxPG1zh86fdppD/WvIcYVQsx7Tso8mCQBz019IqnPTS//0K6ZRb1vNKJxSPmxN81F9XNk7zNJRGYk=
X-Received: by 2002:ac2:46d2:0:b0:4f1:3d7d:409e with SMTP id
 p18-20020ac246d2000000b004f13d7d409emr3772539lfo.0.1685343818417; Mon, 29 May
 2023 00:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230519200520.10657-1-alex@shruggie.ro>
 <20230519200520.10657-2-alex@shruggie.ro>
 <9faab8c9-a38b-3f06-c2fb-6c7803b22eb1@foss.st.com>
In-Reply-To: <9faab8c9-a38b-3f06-c2fb-6c7803b22eb1@foss.st.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Mon, 29 May 2023 10:03:27 +0300
Message-ID: <CAH3L5Qpo6j9XdpfY5dPbYM3prLRPbrFPODPubnaNqu_4pQeaow@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: backlight: document new property
 default-brightness-level
To: Philippe CORNU <philippe.cornu@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 29 May 2023 14:08:20 +0000
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, pavel@ucw.cz, daniel.thompson@linaro.org,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 3:05=E2=80=AFPM Philippe CORNU
<philippe.cornu@foss.st.com> wrote:
>
>
>
> On 5/19/23 22:05, Alexandru Ardelean wrote:
> > From: Yannick Fertre <yannick.fertre@foss.st.com>
> >
> > Add documentation for new default-brightness-level property.
> >
> > Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
>
> Hi Alexandru,
> same comments as for the 1/2 patch.

Ack

Will do
Thanks
Alexandru

> Many thanks
> Philippe :-)
>
> > Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Link to original patch:
> >    https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa1=
4ffd49892c4ce663cdafe98
> >
> >   .../bindings/leds/backlight/gpio-backlight.yaml          | 9 ++++++++=
+
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-back=
light.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backligh=
t.yaml
> > index 584030b6b0b9..b96c08cff0f0 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.y=
aml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.y=
aml
> > @@ -23,6 +23,15 @@ properties:
> >       description: enable the backlight at boot.
> >       type: boolean
> >
> > +  default-brightness-level:
> > +    description:
> > +      The default brightness level (index into the array defined by th=
e
> > +      "brightness-levels" property).
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +dependencies:
> > +  default-brightness-level: [ "brightness-levels" ]
> > +
> >   required:
> >     - compatible
> >     - gpios
