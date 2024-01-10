Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16082A10B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 20:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB0D10E653;
	Wed, 10 Jan 2024 19:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09F10E653
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 19:29:26 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28d80eddc63so2111634a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704914965; x=1705519765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WI8ku+I93FyTp2vVuirOMVJ2TB2x4m8v81fvqOn898=;
 b=bR36rKNGwRD3XKvLxEMBubjOEHNKtAKpU8xpQ0c9ejxjGOa4fjl8TReoCjDWzXPQmi
 xsg2Fu8OcD1llq6ytCtTsCyOtuZBEOixIZxyF4GSUn/wZF2CisZURWORvPbO05r1D1p2
 rFTc/3PNKhRFwidoORj6/alUsW5HV4mgQpKe2Pv3uEILSMTogMKms9U/lYOyjKZd6V4h
 Fsxscda+RMgIJmd5hpMAG5+zcxqnVsEVgr7lhUeFDzzkt4BCcRI6oBIsM1qiCPvNJCg5
 rMD2L8e9bQvjfqKytEKwFa8suJ3pgt58QStB8aPg6QljUot9ViEkBa21a+lsIrQBH4du
 D/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704914965; x=1705519765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7WI8ku+I93FyTp2vVuirOMVJ2TB2x4m8v81fvqOn898=;
 b=rTCKmHT2F+Ee5300iOjD+EP7goUDFCiwQPtha3+wegG4hX0N/g0dwPO/pu5bzTD+w9
 yepL4ae0RYlzc92M/bc+shhSctLaBRx78BH0h9DZDPE7De6r201pa7+MMHXBRla+UIW/
 jCODL+LGzIBSwrNdeycaNnswPM3EDK2Wb4IhKYVRIP4ZJcgwAQp37ThR+7f2w4M1dXCx
 YGZQw91YvgbV7zHI1yKuyfy3oJCIHSyUtvvLJIHIE91yHVpTzV2hqToBkF+3N0+zkzEy
 j5AIMpFNZvuz0XjWmt42zm58sZUfTGSwi32hZDodUSrZPaDWDKuE4JtPMyLgxMkSYOUK
 6tkw==
X-Gm-Message-State: AOJu0YwVKOwxZilEiz5m4aYhhduO9oH3oH8yEhA/pKDAdqeMt/u5qIfo
 mX64XV8r1TswQnxJsYJS4gpMtvLmN0KnyNhdJaw=
X-Google-Smtp-Source: AGHT+IFBPm7b4aCCiyxMadONXgXd714MoYWrp6GeucD3uHx+P0Wv8tbT76KVqGFheQffoeordqCjxEGcEb8NSyPfOMY=
X-Received: by 2002:a17:90a:560e:b0:28d:ba6e:d3de with SMTP id
 r14-20020a17090a560e00b0028dba6ed3demr1073830pjf.95.1704914965415; Wed, 10
 Jan 2024 11:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20240106215146.147922-1-aford173@gmail.com>
 <10409718.nUPlyArG6x@steina-w>
In-Reply-To: <10409718.nUPlyArG6x@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 10 Jan 2024 13:29:14 -0600
Message-ID: <CAHCN7xLhCSM3zdb5zq-WowS+TxYWLj30znniFxiQGpJRXm+ZzA@mail.gmail.com>
Subject: Re: [PATCH V7 1/2] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 5:48=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Adam,
>
> thanks for pushing this forward.
>
> Am Samstag, 6. Januar 2024, 22:51:44 CET schrieb Adam Ford:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > Add binding for the i.MX8MP HDMI parallel video interface block.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > V7:  No Change
> >
> > V6:  Add s-o-b message for myself (Adam)
> >
> > V5:  I tried to help move this along, so I took Lucas' patch and
> >      attempted to apply fixes based on feedback.  I don't have
> >      all the history, so apologies for that.
> >      Removed the pipe character from the Description.
> >      Increased the register size from 0x40 to 0x44.
> > diff --git
> > a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yam=
l
> > b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yam=
l
> > new file mode 100644
> > index 000000000000..3377f152f319
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi=
.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP HDMI Parallel Video Interface
> > +
> > +maintainers:
> > +  - Lucas Stach <l.stach@pengutronix.de>
> > +
> > +description:
> > +  The HDMI parallel video interface is a timing and sync generator blo=
ck in
> > the +  i.MX8MP SoC, that sits between the video source and the HDMI TX
> > controller. +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mp-hdmi-pvi
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
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input from the LCDIF controller.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output to the HDMI TX controller.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/imx8mp-power.h>
> > +
> > +    display-bridge@32fc4000 {
> > +        compatible =3D "fsl,imx8mp-hdmi-pvi";
> > +        reg =3D <0x32fc4000 0x44>;
>
> Shall interrupt-parent =3D <&irqsteer_hdmi>; be added here as well?

That does appear to the case.  Good catch.  The HDMI documentation
isn't as thorough as some other parts of the tech ref manual are.

I'll fix this when I resubmit

adam
>
> Best regards,
> Alexander
>
> > +        interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>;
> > +        power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                pvi_from_lcdif3: endpoint {
> > +                    remote-endpoint =3D <&lcdif3_to_pvi>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                pvi_to_hdmi_tx: endpoint {
> > +                    remote-endpoint =3D <&hdmi_tx_from_pvi>;
> > +                };
> > +            };
> > +        };
> > +    };
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
