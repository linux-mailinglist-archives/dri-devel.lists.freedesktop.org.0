Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7849FA4D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 14:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4110EE61;
	Fri, 28 Jan 2022 13:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B70810EE5E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 13:04:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0110761CE6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 13:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4E8C340F0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643375062;
 bh=pozd1be/gXsNCaMxUIuQeEUnQbL1l5Z46TErduibG+c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l04Ml2xCoVAkpRl86sELENLUrOIT3R94WaOfK/DinPSQUJ12Nx3hrbV2wL/S0ihRT
 WM0pW03BPa75yoE/JrMU5ku59OgfllbV8TBDl53YiACXsUKfdX4MTAimBch6PmfJyV
 9RGs00fei3vWPXQMqLY2avmqc6ssV5xa3H9xJhHwchI13euLbwxyxOGYA8yyHAtyDz
 TBbqVWDo+g5kxg2fL/C5uhhp6fWCQqm8DQdx5c3KnhxAD9yG5cKH9pn7MSqaGpUWik
 qYAQem0/FaZ1ZxhiPxRySElmb0QDV0s7FjuaBRfMCFnH/lYi+qFa4kq+jrfKx4TuAZ
 YWMQsbjKRDMFQ==
Received: by mail-qv1-f45.google.com with SMTP id a7so5752636qvl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 05:04:22 -0800 (PST)
X-Gm-Message-State: AOAM531PuKK2quf9Eg59hCxJPJUTHWZsyta/QXuu9chOQGEaV9CSkWhq
 F70exvYhFnxwyvRzdcFz9ThFn021JIRigXwZTg==
X-Google-Smtp-Source: ABdhPJxVcnGJb1TnG+9U0ivX2FAXxoLdrxrQsdqZfsyEc8ybkhITPDxt/y3lbNKwlmnjyVZu87U4oUbQf6k5k7Y4kt8=
X-Received: by 2002:a05:6214:1bce:: with SMTP id
 m14mr7360779qvc.102.1643375061715; 
 Fri, 28 Jan 2022 05:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
 <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 28 Jan 2022 07:04:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
Message-ID: <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add fsl,imx21-lcdc docs
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 4:59 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> From: Marian Cichy <m.cichy@pengutronix.de>
>
> This files documents the device tree for the new imx21-lcdc DRM driver.

No, bindings document h/w and the h/w has not changed. We already have
a binding for the LCDC.

>
> Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  .../bindings/display/imx/fsl,imx21-lcdc.yaml  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
21-lcdc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx21-lcdc=
.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx21-lcdc.yaml
> new file mode 100644
> index 000000000000..edf71cfac81c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx21-lcdc.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx21-lcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX21 LCD Controller
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx21-lcdc
> +      - items:
> +          - enum:
> +              - fsl,imx25-lcdc
> +              - fsl,imx27-lcdc
> +          - const: fsl,imx21-lcdc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: per
> +      - const: ahb
> +
> +  resets:
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description:
> +      "Video port for DPI RGB output."
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    lcdc: lcdc@53fbc000 {
> +        compatible =3D "fsl,imx25-lcdc", "fsl,imx21-lcdc";
> +        reg =3D <0x53fbc000 0x4000>;
> +        interrupts =3D <39>;
> +        clocks =3D <&clks 103>, <&clks 66>, <&clks 49>;
> +        clock-names =3D "ipg", "ahb", "per";
> +
> +        port {
> +             parallel_out: endpoint {
> +                 remote-endpoint =3D <&panel_in>;
> +             };
> +        };
> +
> +    };
> +
> +    panel: panel {
> +        compatible =3D "edt,etm0700g0dh6";
> +        power-supply =3D <&lcd_supply>;
> +        backlight =3D <&bl>;
> +
> +        port {
> +                panel_in: endpoint {
> +                        remote-endpoint =3D <&parallel_out>;
> +                };
> +        };
> +    };
> --
> 2.34.1
>
