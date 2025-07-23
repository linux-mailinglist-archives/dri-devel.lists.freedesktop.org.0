Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C96FB0EC3A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4096110E76B;
	Wed, 23 Jul 2025 07:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DylioWWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5EA10E769
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:40:11 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3ddb4a7ac19so26239275ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753256410; x=1753861210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbcyqc764F2sEfaCBH+UYC7rWjF6m5+2vt4yx/ptU5M=;
 b=DylioWWZTXY+zzG/GzSp0KiCb8I+D4qKSU9w+LFbiPWEmele9ENJNNNbz6um/gs0Y8
 uWXlg3tZcbEWWn3237ifqd3/8actzWf2zPUwgsDhG9/7qUgmzbqBAegomTllb3QiegB5
 W9oEkAiBxVjBD5eUJFOBEdQifWSxLYhbA3hDtibGPhAcRVrRPrZv9ygZJns9rrCzuNNc
 BeJZ6l7DkDZdHJjOuZbv81397IDlT3fjuLRAYiNs+RMwjmkeeTaPJFraTJIRjr4yWxNc
 nuc2jELRk0tBqAyMO8MtLuEcFFjwoP4FfO7XvDO+VZ/f0yKT554/zPK4fC3WSo6SMqHB
 aI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753256410; x=1753861210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbcyqc764F2sEfaCBH+UYC7rWjF6m5+2vt4yx/ptU5M=;
 b=jVPCASJi9eImxQd1oporLh9KeY+AGavvhZRig2bh0w7S7+WYKD00glhg/9ERivKOCD
 0atI8+n7jHpuZoydzBF4Nj/lSx5Bz4IhrhEyAVBUCAb8y4JE9+NhWU97tF2whnh+e3gp
 szGgnKv2/YXP4ZG2glVge1ZH23sQoCJCiHZjJkCqb1TlhtbjNlDJHufMSaWfM8z5Zv1h
 UUfGWaMtoCllYwq8LNhzOvA7oKmWVphqiF2waxSxZdMzltASgyiY1MLjIoEdLZFVyLsJ
 HN0gYS7kr9e/D1/uckRq6TR+vFC/WmS2DN4jOSKWVpWGvJq/zUrcjQlAgRy6yYkqi3U4
 lMRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjx5wa4zIpUnlKbcuwDmVtv2DRXXoD5TAWLLRGBU6dXsBYKTXPbX688U6F7f1X8rxYwi1c/VeNUgc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVivcRqXh1YUu5kkNzOU++tEQ1EqO/Fidq4AV2Kvr/KdpN86a/
 P03FbLZdPJBYGNQcsutIn254hkY/YkXJMG9rHT+ElGjFSne+LpKR17aUzqFrCkmtgvZVeEC2Go1
 Gf4eFapiiKDESZ1U56Ku9T7Wp8QN3Xng=
X-Gm-Gg: ASbGncu0wL2MiTaSO+hR3XxGBhYQxSDSGpjQvnkS0STqFConw9SIuE85RNBuklFWgpN
 YpMHpTMzPK+N72j9EG3eaUBmwCZE2i/2INREq4bqIGwKMNU9pgkWyULuJ6KCD6TsmaxlE63rnTH
 88FltwkIQSnsfEBRdKoIQc7hlCdFYC7/g2zt/OFrOfxk5hGDimWiMD7TAaduF4F5KaKijFAeb3B
 76HoVA=
X-Google-Smtp-Source: AGHT+IHOQzFpAKaWouHfVtjkvOSjGIpAMkfJ0fzLv3wWAksIErfPgEwi7A4hu+IQvIt5kc5elxr2GeZinpnDwDpuoiI=
X-Received: by 2002:a05:6e02:2483:b0:3e2:99f3:9c5f with SMTP id
 e9e14a558f8ab-3e32fc0705bmr33701305ab.9.1753256410269; Wed, 23 Jul 2025
 00:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com>
 <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
In-Reply-To: <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:39:56 +0800
X-Gm-Features: Ac12FXzRGVFmJEyGYLyQXwRt2VBDjuGoJJq-BPWCprf56oset2phf0Q2wkTdTTc
Message-ID: <CAA+D8ANb7kZETxO_CQazoz6-DiNCOGivLhJVwhw9p78ynP1ntQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Jul 2025 07:46:33 +0000
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

On Tue, Jul 22, 2025 at 3:16=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/18/2025, Shengjiu Wang wrote:
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
> > As this port is linked to imx8mp-hdmi-tx, add port@2 in
> > fsl,imx8mp-hdmi-tx.yaml document.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
>
> Usually, to add a new driver, a DT binding patch comes first.

ok, will move it to first patch

>
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
> Can port@2 be optional?
> Note that video output can work with only port@0 and port@1.

yes, it can be optional

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
> > +
> > +properties:
>
> In i.MX8MP TRM, HTX_PAI block diagram mentions an APB interface.
> Does it mean a clock is needed?

The APB clock is bound with the power domain, so no need to add it here.

>
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
>
> Why do you need this line?

per my understanding, this line can be added or removed.

>
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
>
> Unused. Drop.

Ok.
>
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
>
> Drop this blank line.

Ok.

Best regards
Shengjiu Wang
>
> > +            pai_to_hdmi_tx: endpoint {
> > +                remote-endpoint =3D <&hdmi_tx_from_pai>;
> > +            };
> > +        };
> > +    };
>
> --
> Regards,
> Liu Ying
