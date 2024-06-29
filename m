Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC55091CCE4
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 15:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA2910E067;
	Sat, 29 Jun 2024 13:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VujohaPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CF410E067
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 13:04:05 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5ba33b08550so724563eaf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719666245; x=1720271045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkIrYflEOoy6jtTabWktMcFcPY7E3RXh56B/EgJcCTQ=;
 b=VujohaPJw+mW42RueSDwDAH/5txxdcvkQB9vOdiob5UZi8QDvXBPtKjl2YDHGPvHLO
 AsCY8Uw8IBKpH08ZkeNFQxapuqg3qboPPluCuHUCq1lStcMoRf/X5h9fQf9+DwM3tGbz
 b1NXrPZHitD+G7H7UbXVSS8CC09YgDuWahXQLbWL1Zswo3CFAo4DQVhmgfAfxUIU+6g+
 uSUtCHJxK/VzrpTh3FWx25FQ38ChwinOxjCYg8nVauvgRpZel0kiBF2M3TqJMyHZAyqP
 xIrOlP1hMSvjcFti7beTyeIjw/ydsen5H1pVtB27wvci0k5GmKdUPbt3GR3yheKpGTjA
 Q5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719666245; x=1720271045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkIrYflEOoy6jtTabWktMcFcPY7E3RXh56B/EgJcCTQ=;
 b=gtHahZ9W1J0+02GaKQTT1Jm25pGSWMh465ydrgj/FyX119LRVPi14hHdgs+dpwpMOi
 8h3RGsK1BV/HTqwoFUBCBd8QGFboOI9n5luBh+vnFZbX/Kutq8Rt5/n3bo/DDd+bbP2r
 u21REvbzP2xqKso0E5+eX8wmTWp+3t66KTWM0DnXE3nXr86IPzcGr/5ffhzpiLKShHc9
 7+IJNqoHqbE//EMPdgTvMP9alrR8lcKlkkGZ3dWHucyY5BjiOaZRbjHz7MFRYg6i7Gc2
 F9tjoYh+zvCN82L0CKfRARVNRwYwp3qzqrhxaIV1Msji4ps4PwulkOntNru9ih/ZBtJO
 uehg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJMGRfV19OEsl+Clhskw4S+/zu2waXM0Wmcj0ITb2f5XGjftLKUYGhdvh5vLRrPrd5FB/nnkKvo6p/KzbR+AQthkBAl0ugfwRSmA8alejZ
X-Gm-Message-State: AOJu0YwDcCYMP0qeZ667sYJK7PlFIFC0sRn1mPNNcekswYXpuahB8soS
 8L9UpSBZH8zB5cO/9ptFGGUThAmCfhYKKBnfOeN7jXVLDoIOc15RMFIMFaHeODrKDqySPfPiSdx
 9taLBfRMV2vcNDVrXwHsI3da9Y63snaUx/YI6Cw==
X-Google-Smtp-Source: AGHT+IHIWwG40xdoyk9zXVmAxYMSBaZ/ND6gAS8dOzZl1jedjTZmN5V7ueba1+HzrCC+PVHsS+xTVD4BocQqM7rYpBQ=
X-Received: by 2002:a0d:e612:0:b0:64a:3d7c:2782 with SMTP id
 00721157ae682-64c73606e65mr4798507b3.41.1719649627349; Sat, 29 Jun 2024
 01:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240628051019.975172-1-kikuchan98@gmail.com>
 <20240628051019.975172-2-kikuchan98@gmail.com>
 <20240628-splashy-slug-1d74e3fd9fe6@spud>
In-Reply-To: <20240628-splashy-slug-1d74e3fd9fe6@spud>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Sat, 29 Jun 2024 17:26:56 +0900
Message-ID: <CAG40kxERY2r2cj58kjVMMg1JVOChRKraKYFo_K5C5fnx0g80Qw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
To: Conor Dooley <conor@kernel.org>
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

Hello Conor,

Thank you for your reply.

On Sat, Jun 29, 2024 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, Jun 28, 2024 at 02:10:15PM +0900, Hironori KIKUCHI wrote:
> > The RG28XX panel is a display panel of the Anbernic RG28XX, a handheld
> > gaming device from Anbernic. It is 2.8 inches in size (diagonally) with
> > a resolution of 480x640.
> >
> > This panel is driven by a variant of the ST7701 driver IC internally,
> > confirmed by dumping and analyzing its BSP initialization sequence
> > by using a logic analyzer. It is very similar to the existing
> > densitron,dmt028vghmcmi-1a panel, but differs in some unknown
> > register values, so add a new entry for the panel to distinguish them.
> >
> > Additionally, the panel is connected via SPI instead of MIPI DSI.
> > So add and modify for SPI as well.
> >
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >  .../display/panel/sitronix,st7701.yaml        | 69 +++++++++++++++++--
> >  1 file changed, 64 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,s=
t7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st770=
1.yaml
> > index b348f5bf0a9..835ea436531 100644
> > --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.y=
aml
> > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.y=
aml
> > @@ -20,21 +20,19 @@ description: |
> >    Densitron DMT028VGHMCMI-1A is 480x640, 2-lane MIPI DSI LCD panel
> >    which has built-in ST7701 chip.
> >
> > -allOf:
> > -  - $ref: panel-common.yaml#
> > -
> >  properties:
> >    compatible:
> >      items:
> >        - enum:
> >            - anbernic,rg-arc-panel
> > +          - anbernic,rg28xx-panel
>
> Please no wildcards in compatibles - what is the actual model of this
> panel? I don't really want to see the model of the handheld here if
> possible.

Well, the "RG28XX" is the actual product name of the device...
Besides, there is no vendor name or model name on the panel; there is
no information at all.
Since the panel cannot be disassembled from the housing of the device,
I named it like this.

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
> > @@ -43,6 +41,13 @@ properties:
> >    IOVCC-supply:
> >      description: I/O system regulator
> >
> > +  dc-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Controller data/command selection (D/CX) in 4-line SPI mode.
> > +      If not set, the controller is in 3-line SPI mode.
> > +      Disallowed for DSI.
> > +
> >    port: true
> >    reset-gpios: true
> >    rotation: true
> > @@ -57,7 +62,38 @@ required:
> >    - port
> >    - reset-gpios
> >
> > -additionalProperties: false
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            # SPI connected panels
> > +            enum:
> > +              - anbernic,rg28xx-panel
> > +    then:
> > +      $ref: /schemas/spi/spi-peripheral-props.yaml
>
> I'm not really keen on this. I'd rather see a different binding for the
> SPI version compared to the MIPI ones. Is doing things like this common
> for panels? If it is, I'll turn a blind eye..

This might be the first case that a driver supports both DSI and SPI
for a panel.
The panel can be either a DSI device or an SPI device.
I'm not sure if this is the right way to represent it in the documentation.=
..

>
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              # DSI or SPI without D/CX pin
> > +              enum:
> > +                - anbernic,rg-arc-panel
> > +                - anbernic,rg28xx-panel
> > +                - densitron,dmt028vghmcmi-1a
> > +                - elida,kd50t048a
> > +                - techstar,ts8550b
>
> This is all the compatibles in the file, so nothing is allowed to use
> dc-gpios? Why bother adding it?

There are 3 types of connections that the driver supports: DSI, SPI
with D/CX pin, and SPI without D/CX pin.
Although most SPI panels don't have a D/CX pin, theoretically "SPI
with D/CX pin" exists.
So, it's just prepared for that.

IMHO, once it's found, the list should be negated. List panels for SPI
with D/CX pin, instead.

>
> Confused,
> Conor.
>
> > +    then:
> > +      required:
> > +        - dc-gpios
> > +    else:
> > +      properties:
> > +        dc-gpios: false
> > +
> > +unevaluatedProperties: false
> >
> >  examples:
> >    - |
> > @@ -82,3 +118,26 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@0 {
> > +            compatible =3D "anbernic,rg28xx-panel", "sitronix,st7701";
> > +            reg =3D <0>;
> > +            spi-max-frequency =3D <3125000>;
> > +            VCC-supply =3D <&reg_lcd>;
> > +            IOVCC-supply =3D <&reg_lcd>;
> > +            reset-gpios =3D <&pio 8 14 GPIO_ACTIVE_HIGH>; /* LCD-RST: =
PI14 */
> > +            backlight =3D <&backlight>;
> > +
> > +            port {
> > +                panel_in_rgb: endpoint {
> > +                    remote-endpoint =3D <&tcon_lcd0_out_lcd>;
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.45.2
> >

Best regards,
kikuchan.
