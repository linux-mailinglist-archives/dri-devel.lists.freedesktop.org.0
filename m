Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8690CB0BF4F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4E10E49F;
	Mon, 21 Jul 2025 08:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RTyMAS0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370EE10E244
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:27:13 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-87c26c9e8d5so124713839f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 20:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753068432; x=1753673232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5GJULZkEl8j6az+Nmf6Q9IdIMazJkldN2OlkYV3zqRI=;
 b=RTyMAS0qMCrGLP1fPxSk5tsFl6KTyQLUlOqCm2/+ec2hWMX5nhU+nibGEVnY+/U6Rx
 QAC/YBT24oPc4uEUY1HvAnjai6lM9LSfz0KIPnq+PNWPbP2zNZ6j0k3967t2mz2fzNxw
 jOUGtoRjRMEduDX5o6UsIeH6zQS+kCAoiC7AjYJi7WalnSgSVSvIQlXCKTHNhnpmvKjw
 +HDUFbzD7yy9O1IBlTYY5HU3xYy+IqJXibwg/qcB2Vjk0qBssiv0gDX5aoqr/0aNMBjU
 FrDNFxLxJwRhLHsshqTACwjTIGGXepLCwTGei1kT2fSojumZx2RS05hRn/xgwJkYw8uY
 Ym/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753068432; x=1753673232;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GJULZkEl8j6az+Nmf6Q9IdIMazJkldN2OlkYV3zqRI=;
 b=gzNk5MPyTtsdGaPe4221XOc7I9YVIJ8udOsfvD9MroljCXjyKnYhTkARplkMeYkrek
 k709bRs7QICqQ/vCa2CyjVwmaUqvo2wxiMauLCotOdi9cM8o6xpQ9n6+sXvrKiaWVFji
 WO2q7LCLS74P0qKOOhjloklVrD7+mxwpT55jhPLCFkEo/mW2JEwQAneYTqHhfxTdTNF+
 bmKiFbAti6LTBrJUzU0ymtj+EzPSZy0nJoB/YgkGluU99mrzdiZFgWKvok9n1XiYPNTt
 Jr8DI+Uqa6hoyRIivc91PEGzy1OSv7/OPUL1pucfyTylpYW5xja6DiieMB+CVxbDWW5T
 cG4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIZrmL2txs+PGubPm+7Hpu73jZFTB4WTgw1b2IihbCmWrlgi/5YXwV3bR0WQ7Dv1tJcnO3AEr5I80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJIQcYd7kt9xdia/v+QoViBUFE8z4yku+MSPot+tRmYHZXY5VS
 TIVggdd/8c3R9N64XA0PB7Ebi6DGpOQR0dFgeiJgx+DU9OzunW3/ImwlobvxUxgUVP2ZDej5enA
 7xsFCrYczBaKAt2hUVZpLrYL6d7jwWjM=
X-Gm-Gg: ASbGncvSnhCsYxeTt9F+IZsYRKKZfdWO3poJxNJrx6D3CCU8etHXnzL/VvUq0eoEoAc
 tqeEow9sQbSsvHR7MjGK90V2ptNTVoDQKS55n7sCZ5kuJGMP7zzMWtkDkl8YT9xPwFURxbLfI7O
 1NO0gNW/p2otzx7imGkg+j5PnX7YuQPg2q6gbjWIEZrybxM1SX1znEYmMZIW94klPCFskltSjq3
 jPwrQthUjjz/kdo9g==
X-Google-Smtp-Source: AGHT+IG8vUHFP70UXed9iRLKIptriKCIABWtAWB4NI0eKfx64HKik6dvxbUYvCeLTR40uVNuIWcVYOwlyUyYpDWTz70=
X-Received: by 2002:a05:6e02:2587:b0:3e2:9f78:3783 with SMTP id
 e9e14a558f8ab-3e29f783956mr91962715ab.21.1753068432378; Sun, 20 Jul 2025
 20:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com>
 <aHp1be6omEO8qB8o@lizhi-Precision-Tower-5810>
In-Reply-To: <aHp1be6omEO8qB8o@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:26:56 +0800
X-Gm-Features: Ac12FXxLXoN3PdgILVQcoB0Vod44PqH8KIxOUI90ky-y_nERjNH_OhhfrJs7NGk
Message-ID: <CAA+D8AMz4MAn7M40ipTefXapQ0-KZnUT3H6iVzBscO4UmrK6cw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
 l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Jul 2025 08:45:46 +0000
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

On Sat, Jul 19, 2025 at 12:25=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:49PM +0800, Shengjiu Wang wrote:
>
> Subject needn't said binding again.
>
> dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
>
> Need empty line between two paragraph

Ok.
>
> > As this port is linked to imx8mp-hdmi-tx, add port@2 in
> > fsl,imx8mp-hdmi-tx.yaml document.
>
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to imx8mp-hdmi-tx (
> look like pai_to_hdmi_tx?)

yes, linked to pai_to_hdmi_tx.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml
> > index 05442d437755..cf810b277557 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > @@ -49,9 +49,14 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description: HDMI output port
> >
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel audio input port
> > +
> >      required:
> >        - port@0
> >        - port@1
> > +      - port@2
>
> Are you sure it is required?  It may cause may dtb check warning.

yes, it is required.
>
> >
> >  required:
> >    - compatible
> > @@ -98,5 +103,13 @@ examples:
> >                      remote-endpoint =3D <&hdmi0_con>;
> >                  };
> >              };
> > +
> > +            port@2 {
> > +                reg =3D <2>;
> > +
> > +                endpoint {
> > +                    remote-endpoint =3D <&pai_to_hdmi_tx>;
> > +                };
> > +            };
> >          };
> >      };
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-h=
dmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdm=
i-pai.yaml
> > new file mode 100644
> > index 000000000000..d2d723935032
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai=
.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description:
> > +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module t=
hat acts as the
> > +  bridge between the Audio Subsystem to the HDMI TX Controller.
>
> remove "a digital module that acts as the"

Ok, will update it in the next version.

best regards
Shengjiu Wang

>
> Frank
>
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mp-hdmi-pai
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Output to the HDMI TX controller.
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/imx8mp-power.h>
> > +
> > +    hdmi@32fc4800 {
> > +        compatible =3D "fsl,imx8mp-hdmi-pai";
> > +        reg =3D <0x32fc4800 0x800>;
> > +        interrupt-parent =3D <&irqsteer_hdmi>;
> > +        interrupts =3D <14>;
> > +        power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> > +
> > +        port {
> > +
> > +            pai_to_hdmi_tx: endpoint {
> > +                remote-endpoint =3D <&hdmi_tx_from_pai>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.34.1
> >
