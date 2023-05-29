Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC6D714BB9
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC01B10E2C0;
	Mon, 29 May 2023 14:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68D510E215
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:03:19 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4b384c09fso3349742e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1685343798; x=1687935798; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYSmjUHKY13e/olgfNCe2jCtnFDy/mhRCAgKdXqqosc=;
 b=qQt0qUfGjmzTSnZ0DVjIHfM3Dz6z6pXCAgSw3KcgmtqPxppthlZqYCiFywwtPwNAT2
 hJNruzSJeHsISwuAjYUxtoZZP6EDSVvYqUXV3Z+VjYkmZDwacyEQTw4JItQBL38LThIe
 Rj0kAh0lYssXHSmIIW80Rt8szL+kdeEX4Bw/IdqWCXeZadudPPR9devrh3IwfKVSGjuK
 hOtN+g0wmjGlu4gCvMBM4OwD5996boLxO2E0vl+7vo1cpFQ1/3QIaVvy6TS5Bk0a3GFa
 iCyzwddv8vJRzibyFBfP+nJ1NnvlG8iycusk325s+0y+CHC7HTsEj32jterZVkQvqYe4
 fupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685343798; x=1687935798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nYSmjUHKY13e/olgfNCe2jCtnFDy/mhRCAgKdXqqosc=;
 b=hj/q7Gd+LpiOsroGZeniKlDKQQEZxXUwBddNjKeGzNEIEIDut2JZis0zvslutE6iHH
 l0b6DHLmZ5BWXBOFslP3jRM2QZPobpXEtQRZGHmyivUKATI3zF+VlDxPfdUJTa7ZzGn2
 +dZYpapOE/PZIG0RlgTSU9EKR7t8fkSyTE3xVzQXP3GKF2oJ/w9Ib8/FzjiMXqS+eZT+
 dncAG9ATYTY8dt1Ser6W6mM4OrBd3gcAmBMKAo8aDZYHpyUmGsEAR+G9jOfcYCynEIA1
 64N+59NcGUJCxLl8hTGoay2bfscXrDQAdQ4oEMjBNsl0TnFS7Wk5iOUoEhg8HXOmq0Rs
 hy5w==
X-Gm-Message-State: AC+VfDzELSKu6GSO8MUIHrn/pU1SaBwmEg56MHxryMLQPNrZkcPArEzl
 2W3dtQoHG95hOgg2jFARyyddWKdvx/S1mO+jtXHy2g==
X-Google-Smtp-Source: ACHHUZ5wC3rgKOLiDrLuAPCrJCUl5/yB6pE43oPiLauQYVLp4+RCulNBNMME5l03e12kJhRacmxRp/xSpacnqmp4pzQ=
X-Received: by 2002:ac2:5dfc:0:b0:4e8:44e3:f3da with SMTP id
 z28-20020ac25dfc000000b004e844e3f3damr3631341lfq.39.1685343797813; Mon, 29
 May 2023 00:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230519200520.10657-1-alex@shruggie.ro>
 <20230519200520.10657-2-alex@shruggie.ro>
 <20230526102032.GB626291@aspen.lan>
In-Reply-To: <20230526102032.GB626291@aspen.lan>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Mon, 29 May 2023 10:03:06 +0300
Message-ID: <CAH3L5QpPPhCZb5nzfAnunL1qP4Vw_xk_1ovNXaFixa8-aQ3QMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: backlight: document new property
 default-brightness-level
To: Daniel Thompson <daniel.thompson@linaro.org>
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
 robh+dt@kernel.org, Philippe CORNU <philippe.cornu@foss.st.com>, pavel@ucw.cz,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 1:20=E2=80=AFPM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, May 19, 2023 at 11:05:20PM +0300, Alexandru Ardelean wrote:
> > From: Yannick Fertre <yannick.fertre@foss.st.com>
> >
> > Add documentation for new default-brightness-level property.
> >
> > Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
> > Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Link to original patch:
> >   https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14=
ffd49892c4ce663cdafe98
> >
> >  .../bindings/leds/backlight/gpio-backlight.yaml          | 9 +++++++++
> >  1 file changed, 9 insertions(+)
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
> >      description: enable the backlight at boot.
> >      type: boolean
> >
> > +  default-brightness-level:
> > +    description:
> > +      The default brightness level (index into the array defined by th=
e
> > +      "brightness-levels" property).
>
> gpio-backlight does not have a brightness-levels array property!
>
> I think it is also necessary to improve the docs of both properties to
> distinguish between the meaning of default-on and
> default-brightness-level. The result of setting default-on and
> default-brightness level to zero is that the GPIO will be off (this is
> correct behaviour but hard to figure out from the current text).
>
> default-on is a control that can "enable" the backlight at boot when it
> is not linked to a display in the DT (e.g. it is mostly for legacy
> cases). When the backlight is linked to a display then the backlight
> enable state will be automatically linked to the display enable state
> instead.
>
> default-brightness-level is useful for handling displays that
> are still readable with the backlight off (e-ink, reflective/
> transflexive LCD, etc), otherwise is should be absent or set to 1.

ack
will do in V2

thanks

>
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +dependencies:
> > +  default-brightness-level: [ "brightness-levels" ]
>
> As above, depending on brightness-levels doesn't make any sense here.
>
>
> Daniel.
