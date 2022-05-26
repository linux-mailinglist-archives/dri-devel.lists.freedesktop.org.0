Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB33534B3B
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 10:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6910F58D;
	Thu, 26 May 2022 08:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689E010F5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 08:13:25 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id b7so752777vsq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zNrA8G7W8xImy1CA/f8Tn4I9dL7mTaFk+uvIb/eV3wY=;
 b=A/U4yg/dwMTa7ikHjmx0yWt56HCq7ojuzUZBjDMA9A9C4zLZnYCYq9G8HtKcvVNWU1
 HpelFYniLokE5zGnN9AC0ye/+jOfHyrHoOXuNkiIMGlIaLV+10eaU/R5NhYsLWvuMhkT
 cM+Mt5MAbL/LAzitybRh9N/81T7AVGwUPBtL5eb7+b9765e1waSMd5c8aXvOo0MMvDTs
 SRt4Tk5ye6URu+wkRjToUv8k55+CYSfTq9ushuvr7mD2iaYpwTNNhaPK1IEIEPHML5sE
 B/gcn5SN2PFgfHv0NUbIOM7hF7eCmcs2Cnl4aO9W8zuSkzKopPE6ZRwBN0QEPYlk6yJh
 BcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zNrA8G7W8xImy1CA/f8Tn4I9dL7mTaFk+uvIb/eV3wY=;
 b=0GDzMYEQgMOpDmF6uCHQjOzNQMQXLWWNMDhQ+HxGgcYaYFFMqHtTnvvaEa/ylE1iwq
 svP9cMyfaQDPvV2+QuqMJAcyaLBP01+tfQyPW3ynmlIO4q0HeXU2glJCsLxSnyQIC3K9
 98AoHLllSK5ERqWeppFU1nQDj0ZFhGLomKMPv/6wiPRxeW3gOdJ59hiVJ1LEE5OYM6Im
 6s2P+ywXY3vnjuwOS6QUqiv3lnqxEZsb8mKJYvyol+E7uasF6J5tQ/51t83XAq0dgT1S
 JV+tx7e8WO2j7+1WoDOW15plwpZzyIBIOIDJBvw4qD50t20QIKogcVUxrqQsdPw5l1AL
 aa+Q==
X-Gm-Message-State: AOAM532wr/J6GFE8fmgmegXxgYOV/p57l0NrtEODLfbiih3Z1i8hjSfI
 JP+7qsiSaFcNDG+yNxu/DWfPng1ODk4NOjC4DdU=
X-Google-Smtp-Source: ABdhPJy7IZUGyv7zqBT+CrvFboZMNbh3rYZ6gsvuEd2TcV8iBZSTLtKckUJsJz1OFrlMnIfHyYtdH1A+1A3ceRfZddw=
X-Received: by 2002:a67:ef5b:0:b0:335:e3a3:9b33 with SMTP id
 k27-20020a67ef5b000000b00335e3a39b33mr14948741vsr.57.1653552804397; Thu, 26
 May 2022 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
In-Reply-To: <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 26 May 2022 16:13:13 +0800
Message-ID: <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 lucas_tsai@richtek.com, jingoohan1@gmail.com, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B45=E6=9C=8826=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:06=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 26/05/2022 05:16, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add the new property for ocp level selection.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 =
++++++++
> >  include/dt-bindings/leds/rt4831-backlight.h                       | 5 =
+++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,r=
t4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ric=
htek,rt4831-backlight.yaml
> > index e0ac686..c1c59de 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-b=
acklight.yaml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-b=
acklight.yaml
> > @@ -47,6 +47,14 @@ properties:
> >      minimum: 0
> >      maximum: 3
> >
> > +  richtek,bled-ocp-sel:
>
> Skip "sel" as it is a shortcut of selection. Name instead:
> "richtek,backlight-ocp"
>
OK, if so, do I need to rename all properties from 'bled' to 'backlight' ?
If  only this property is naming as 'backlight'. it may conflict with
the others like as "richtek,bled-ovp-sel".
>
> > +    description: |
> > +      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/=
1.8A
>
> Could you explain here what is OCP (unfold the acronym)?
Yes. And the full name is 'over current protection'.
>
>
> Best regards,
> Krzysztof
