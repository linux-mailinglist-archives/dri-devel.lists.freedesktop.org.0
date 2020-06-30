Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E32104A6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE48D6E82A;
	Wed,  1 Jul 2020 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4A66E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 21:02:19 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s16so6778951lfp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uWt7/06d177SfGjZmfsBPnXSQpNbyy3gFoJVxWVDYA8=;
 b=dWiHaRI9VnBeDGP7DBdo1Kn3R0l0ukl7bAyOh3hYflvX56bsicOIXT5eyoKQWEpgsz
 uN9qZDGUHmCtaXEgbq1ILRdXaP9pcO/LGjNWSRvrnFvBT6kq+ldPBPE1be9HDX/19O7A
 iWGAdSE6l3c12NiLsgAB84yc61rnyoDyWmBzm2/gNBYBPWrnwENbAydJ8FO5PtRPzQAL
 t6uP2/j1ogqW3zWVKRMe5UrDRGSpUwGBsSTzvv2nMcBVhfBSAd9s1m4fk+cQdSzZI3yk
 7lsBtXifH+ssoUg9bVGV0mg546Es98wXaPD4VkWqNu1WhhVL0mFu4pQabXDR7z3LAr/+
 KGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uWt7/06d177SfGjZmfsBPnXSQpNbyy3gFoJVxWVDYA8=;
 b=iPMiyUDiInPdvqVIMUc/ZDMubgLpwjFsrk319+wDubfn9gmFxh5mB56RfhnU9w40E7
 UW1FBmA2+Dycx3J/5xcoVh1n1fpssBwHiz/oZXc0YpurNnuH+R6VRKs7cO1Up+LwZIe3
 RmNprcPRo91sqFR1tJLbbBc5wr8A+RVFl9268hC9pGP9zZlE3vSmiZVcqsEzU2NZLDF3
 mXwpOnj67qZAYg8iKaJU4sev3sjr/WSreyodEKUASFluxffOxzY9U0XvYuzq/ha1et/2
 HJQV4yZSFpuSe6ehVcOf9FSKd+smGDaIjnbYNukaQ9smQbo0iWVDDWQlGy8DVZX/r4dI
 X2WA==
X-Gm-Message-State: AOAM530YMg6xpwXTWXzHRtZl4RibBM3vM6F8KK/UuOk4KsMW3NA/vW8c
 rHCPTVPI85vKA4gD2AgkUlcCbg==
X-Google-Smtp-Source: ABdhPJwZjvJqCkP+feeQt9eJNqt+pF2IsjHIAxp+Ix8bRXd77wLBq2nhoq0jT6XBaRy6ZcqVrj+ttQ==
X-Received: by 2002:a19:c744:: with SMTP id x65mr13370113lff.133.1593550935782; 
 Tue, 30 Jun 2020 14:02:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id u15sm1087979ljh.56.2020.06.30.14.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 14:02:14 -0700 (PDT)
Date: Tue, 30 Jun 2020 23:02:14 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: media: renesas, vsp1: Convert binding
 to YAML
Message-ID: <20200630210214.GG2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for your patch.

On 2020-06-21 03:47:33 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car VSP1 text binding to YAML.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> =

> - Simplify comments on compatible strings
> - Update MAINTAINERS
> ---
>  .../bindings/media/renesas,vsp1.txt           | 30 -------
>  .../bindings/media/renesas,vsp1.yaml          | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 84 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.=
txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.=
yaml
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.txt b/D=
ocumentation/devicetree/bindings/media/renesas,vsp1.txt
> deleted file mode 100644
> index cd5a955b2ea0..000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -* Renesas VSP Video Processing Engine
> -
> -The VSP is a video processing engine that supports up-/down-scaling, alp=
ha
> -blending, color space conversion and various other image processing feat=
ures.
> -It can be found in the Renesas R-Car Gen2, R-Car Gen3, RZ/G1, and RZ/G2 =
SoCs.
> -
> -Required properties:
> -
> -  - compatible: Must contain one of the following values
> -    - "renesas,vsp1" for the R-Car Gen2 and RZ/G1 VSP1
> -    - "renesas,vsp2" for the R-Car Gen3 and RZ/G2 VSP2
> -
> -  - reg: Base address and length of the registers block for the VSP.
> -  - interrupts: VSP interrupt specifier.
> -  - clocks: A phandle + clock-specifier pair for the VSP functional cloc=
k.
> -
> -Optional properties:
> -
> -  - renesas,fcp: A phandle referencing the FCP that handles memory acces=
ses
> -                 for the VSP. Not needed on Gen2, mandatory on Gen3.
> -
> -
> -Example: R8A7790 (R-Car H2) VSP1-S node
> -
> -	vsp@fe928000 {
> -		compatible =3D "renesas,vsp1";
> -		reg =3D <0 0xfe928000 0 0x8000>;
> -		interrupts =3D <0 267 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks =3D <&mstp1_clks R8A7790_CLK_VSP1_S>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/=
Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> new file mode 100644
> index 000000000000..65e8ee61ce90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,vsp1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas VSP Video Processing Engine
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description:
> +  The VSP is a video processing engine that supports up-/down-scaling, a=
lpha
> +  blending, color space conversion and various other image processing fe=
atures.
> +  It can be found in the Renesas R-Car Gen2, R-Car Gen3, RZ/G1, and RZ/G=
2 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,vsp1 # R-Car Gen2 and RZ/G1
> +      - renesas,vsp2 # R-Car Gen3 and RZ/G2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  renesas,fcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle referencing the FCP that handles memory accesses for the=
 VSP.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +if:
> +  properties:
> +    compatible:
> +      items:
> +        - const: renesas,vsp1
> +then:
> +  properties:
> +    renesas,fcp: false
> +else:
> +  required:
> +    - renesas,fcp
> +
> +examples:
> +  # R8A7790 (R-Car H2) VSP1-S
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vsp@fe928000 {
> +        compatible =3D "renesas,vsp1";
> +        reg =3D <0xfe928000 0x8000>;
> +        interrupts =3D <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&cpg CPG_MOD 131>;
> +    };
> +
> +  # R8A77951 (R-Car H3) VSP2-BC
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vsp@fe920000 {
> +        compatible =3D "renesas,vsp2";
> +        reg =3D <0xfe920000 0x8000>;
> +        interrupts =3D <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&cpg CPG_MOD 624>;
> +
> +        renesas,fcp =3D <&fcpvb1>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7383dfa510a3..22e079cc3e3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10730,7 +10730,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/renesas,vsp1.txt
> +F:	Documentation/devicetree/bindings/media/renesas,vsp1.yaml
>  F:	drivers/media/platform/vsp1/
>  =

>  MEDIA DRIVERS FOR ST STV0910 DEMODULATOR ICs
> -- =

> Regards,
> =

> Laurent Pinchart
> =


-- =

Regards,
Niklas S=F6derlund
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
