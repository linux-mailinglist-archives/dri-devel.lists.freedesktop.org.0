Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D733C9122E4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B3410E02C;
	Fri, 21 Jun 2024 10:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B9p3Pcpq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106F210E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:59:18 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-62a2424ed00so21163127b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718967558; x=1719572358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMG6I2fL450LAEj9ZfzRXVDeBFq9SZSX/s1+uBl/ims=;
 b=B9p3PcpqDD7WrYeZVJp41RVWQrhm1DYYQogMfIfYVRVp7aHRYSbGJhmQVc7N+ZC5VQ
 sdnIITtkBDU08MhpGVwerluuO7WdIQT4Am3xNsOkjTh4uMzLqoSO2Ld5oy3gjLaLikC3
 II7hjxhTObApY92lBDIXIDmRSmil0LFoOD7nZUCkU49fuqYMInRwndUx3J+2NjHAwWwr
 auxDuPixoG405M9we4oMtld1W3HX82qL3iRQgTxODRoLu3siGx2worQtHXhQ92Xg6X39
 vrEpL5oOzGl5llMQvKlFgOKBthSfPlIin//kCPugzrU4qMQ21nn32XK6my2Y4H4i4zWW
 kZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718967558; x=1719572358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMG6I2fL450LAEj9ZfzRXVDeBFq9SZSX/s1+uBl/ims=;
 b=OUoX6hzbXVKN9++Lr0w2ccZyoL9MPQX8Wnmv+qxzC+6fVK544BOwhlGCkdBZDyAehc
 PvXiVhGdEfXrARySuQ9ra6qJBXj3fxP9rRKqNaEMaNw7+/xbhpSUBMhbIimR/r58CY/P
 2sPs4p+nRNRcNWJF03Y51JYvKpjRXrbP1+Bce7NqafMQv57MFnq7Gh/g2Q14WjAgtTbd
 KkRCerI1PC5MhMACg4z+W2MNDchuWucmbM1Nenr4gCeLVrd+mRf3goiAr9CVA3qclR6L
 /dSQRqMQr0AzHUwfrEd3uldgip7MtHMAq49kGbQGFPsGvUqjoTFFkv/UZf8CCh1n5t2Y
 8bEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3icSTa6gsub2v1S7o8HqR2L8yTtfFEtV4rhyUAvnRkmap8rXszz1PBYPz8ZprZrf1p2E/1VJADx1dERSPMx8GkjQVRlVcbriRBAT61QEe
X-Gm-Message-State: AOJu0YzfEfoTaNg7jC9no0XZ309OTqS54eh1OYaco4BB3JvbESbzqESG
 K8PckKIrqzwdjmB1Dz94P9j+CyBlxYAeNav4L6YXqbz8FWfHMRETYpHi8AHCHm45A+Gto2Gz9LS
 kSRezPEKKoxZ4NzD3WbSJDuQJxqc=
X-Google-Smtp-Source: AGHT+IFNIGuETLCk//Rdm5KBbSRMEujOoe7cshb/eDNTqBYe3z4TXdLoL26tBh1MLc5b2oFrvWYlVgUxYamBFY1lKPE=
X-Received: by 2002:a0d:eb01:0:b0:631:4e00:2c06 with SMTP id
 00721157ae682-63a8d82c7efmr83531317b3.2.1718967557858; Fri, 21 Jun 2024
 03:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240618081515.1215552-1-kikuchan98@gmail.com>
 <20240618081515.1215552-2-kikuchan98@gmail.com>
 <0455975b-837b-4a1c-8ea3-e9a504db53d0@kernel.org>
In-Reply-To: <0455975b-837b-4a1c-8ea3-e9a504db53d0@kernel.org>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Fri, 21 Jun 2024 19:59:06 +0900
Message-ID: <CAG40kxHaAwGowQ0dRoEkGSiAUJA5SyKw3SSECUmBApKaAjcHKw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

Thank you for your reply!

On Tue, Jun 18, 2024 at 6:17=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/06/2024 10:15, Hironori KIKUCHI wrote:
> > The RG28XX panel is a panel specific to the Anbernic RG28XX.
> > It is 2.8 inches in size (diagonally) with a resolution of 480x640.
> >
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >  .../display/panel/sitronix,st7701.yaml        | 36 +++++++++++++++++--
> >  1 file changed, 34 insertions(+), 2 deletions(-)
>
> Nothing explains in the commit msg why rg28xx is actually st7701.
> Changing interface to SPI suggests it is not.

Thanks, I'll explain like this;
---
dt-bindings: display: st7701: Add Anbernic RG28XX panel

The RG28XX panel is a panel specific to the Anbernic RG28XX
handheld device. It is 2.8 inches in size (diagonally) with a
resolution of 480x640.

This panel is driven by a variant of ST7701 driver IC internally,
confirmed by dumping and analyzing its BSP initialization sequence
by using a logic analyzer. It is very similar to the existing
densitron,dmt028vghmcmi-1a panel, but differs in some unknown
register values, so add a new entry for the panel to distinguish them.

Additionally, it is connected over SPI, instead of MIPI DSI. So
add and modify for SPI as well.
---

>
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,s=
t7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st770=
1.yaml
> > index b348f5bf0a9..04f6751ccca 100644
> > --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.y=
aml
> > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.y=
aml
> > @@ -22,19 +22,21 @@ description: |
> >
> >  allOf:
> >    - $ref: panel-common.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >
> >  properties:
> >    compatible:
> >      items:
> >        - enum:
> >            - anbernic,rg-arc-panel
> > +          - anbernic,rg28xx-panel
>
> What is xx? Wildcards are not allowed, in general.
>
> Can it be anything else than panel? If not, then drop "-panel".

It's supprising but it actually is a product name of the handheld device...
The panel comes with the device, and part# is completely unknown.

>
>
> >            - densitron,dmt028vghmcmi-1a
> >            - elida,kd50t048a
> >            - techstar,ts8550b
> >        - const: sitronix,st7701
> >
> >    reg:
> > -    description: DSI virtual channel used by that screen
> > +    description: DSI / SPI channel used by that screen
> >      maxItems: 1
> >
> >    VCC-supply:
> > @@ -43,6 +45,13 @@ properties:
> >    IOVCC-supply:
> >      description: I/O system regulator
> >
> > +  dc-gpios:
> > +    maxItems: 1
> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.

Thanks, I'll remove it.

>
> > +      Controller data/command selection (D/CX) in 4-line SPI mode.
> > +      If not set, the controller is in 3-line SPI mode.
> > +      No effect for DSI.
>
> Which devices can be connected over SPI? It seems not all, so this
> should be disallowed (": false" in allOf:if:then:; move the allOf to
> bottom like in example-schema) for them.

Hmm... That's a difficult question...

There are 3 types of connection that trying to support:
DSI, SPI with D/CX pin, and SPI without D/CX pin.

The dc-gpios is required for SPI with D/CX pin, but not for others.

DSI:
- anbernic,rg-arc-panel
- densitron,dmt028vghmcmi-1a
- elida,kd50t048a
- techstar,ts8550b

SPI without D/CX pin:
- anbernic,rg28xx-panel

But, there are no panels with D/CX pin so far.
How should I deal with this? just disallow all, perhaps?


BTW, does panel's compatible string consider to include it's interface?
ie, what if two panels use the exact same commands and timings, but
over different interface,
... are they "compatible" or not?

>
> Best regards,
> Krzysztof
>

Best regards,
kikuchan.
