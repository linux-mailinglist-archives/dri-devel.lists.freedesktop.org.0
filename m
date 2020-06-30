Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788EF210493
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AD66E7E6;
	Wed,  1 Jul 2020 07:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378256E121
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:49:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f8so11954552ljc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xvMzBYx/+eZkL1U4iAm8DZ6iRc4MRD6poHIjEeZk1I0=;
 b=JXQFgrWPHof0j3cDBxYmxzEqX9RoavpSkASuonw6dNEvCOEvPn6X2dMDaw063EBgEQ
 KYGF46P6F52DF0TNrG7OrpNghsS8Ls3+ozRCcOWE+PRp4wsxTvwvUX6Xgy7UlVRbT/gU
 82vG4ANNWRsprwLsb9SYwpZnKTrVt+JUaHCISqJZGGfDuJxy5Nl24LfxZ3NWdYSYwfoG
 xO3FrjHlpPN3NT8+jl85xT64F0jnPOuR8LgSWG9xSn65OMEifV73tw0WfZm6FArgHmMP
 Uj4fpkYzuK8FVBsDLRO3ID5ZQbhmgTsAxE36chU8KC0ny2Je80/vq31H68vWx63swFWX
 oEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xvMzBYx/+eZkL1U4iAm8DZ6iRc4MRD6poHIjEeZk1I0=;
 b=o9ISNAyTayiPUQKJ35J64s5oSc3hIYbSDSAIuZ1zJDx4YF6LQFO6cz3mrPjme66l6q
 K+c7aUwPP6lZDrAcOnXnPWQSEZEWgO8CHT597UOmPqStt/5Ym53gwrrWEKsMdoVD2vcG
 ooRjceCDKwT9fDyF14aBlN/TdWv5l0bFzrmKh91f5kwG3T+UtueBBPsJugUzR1H0uBPx
 VVUJaHhr1k+COCaVTXdgVXDW93ov48dtJx7jHclbNlPoQaebeXdTcraRpNn8rt2P3VOa
 O59GOcWY+hPeifRETtC7XEmqbEGYfgbtmVl4ggI3BJJldx92N55+ArfdMG8YIkyRmnRo
 k/pQ==
X-Gm-Message-State: AOAM530fTZg4zu2r/gyfFacu0uUcw8Q9enNRBQJG1vbx8trkRi7vCooW
 s0JMgqxa8o2c9xu6vh3xW8g1RAS33pc=
X-Google-Smtp-Source: ABdhPJyvN++jQvWmhL1Nhi4QY7ErV0bsXsbkHZP2JNUtRN07KQpUgLR60RQJZ/BTWYqFLoid4vKvUg==
X-Received: by 2002:a2e:580f:: with SMTP id m15mr11054422ljb.357.1593550159379; 
 Tue, 30 Jun 2020 13:49:19 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id q1sm1195630lfp.42.2020.06.30.13.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:49:18 -0700 (PDT)
Date: Tue, 30 Jun 2020 22:49:18 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: media: renesas,fcp: Convert binding
 to YAML
Message-ID: <20200630204918.GA2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-2-laurent.pinchart+renesas@ideasonboard.com>
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

Thanks for your work.

On 2020-06-21 03:47:27 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car FCP text binding to YAML.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> =

> - Simplify comments on compatible strings
> - Update MAINTAINERS
> ---
>  .../devicetree/bindings/media/renesas,fcp.txt | 34 -----------
>  .../bindings/media/renesas,fcp.yaml           | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 57 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.y=
aml
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Do=
cumentation/devicetree/bindings/media/renesas,fcp.txt
> deleted file mode 100644
> index 79c37395b396..000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Renesas R-Car Frame Compression Processor (FCP)
> ------------------------------------------------
> -
> -The FCP is a companion module of video processing modules in the Renesas=
 R-Car
> -Gen3 and RZ/G2 SoCs. It provides data compression and decompression, data
> -caching, and conversion of AXI transactions in order to reduce the memory
> -bandwidth.
> -
> -There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) a=
nd FCP
> -for FDP (FCPF). Their configuration and behaviour depend on the module t=
hey
> -are paired with. These DT bindings currently support the FCPV and FCPF.
> -
> - - compatible: Must be one or more of the following
> -
> -   - "renesas,fcpv" for generic compatible 'FCP for VSP'
> -   - "renesas,fcpf" for generic compatible 'FCP for FDP'
> -
> - - reg: the register base and size for the device registers
> - - clocks: Reference to the functional clock
> -
> -Optional properties:
> - - power-domains : power-domain property defined with a power domain spe=
cifier
> -		   to respective power domain.
> -
> -
> -Device node example
> --------------------
> -
> -	fcpvd1: fcp@fea2f000 {
> -		compatible =3D "renesas,fcpv";
> -		reg =3D <0 0xfea2f000 0 0x200>;
> -		clocks =3D <&cpg CPG_MOD 602>;
> -		power-domains =3D <&sysc R8A7795_PD_A3VP>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,fcp.yaml
> new file mode 100644
> index 000000000000..9241bf3c5efc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Frame Compression Processor (FCP)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The FCP is a companion module of video processing modules in the Renes=
as
> +  R-Car Gen3 and RZ/G2 SoCs. It provides data compression and decompress=
ion,
> +  data caching, and conversion of AXI transactions in order to reduce the
> +  memory bandwidth.
> +
> +  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV)=
 and
> +  FCP for FDP (FCPF). Their configuration and behaviour depend on the mo=
dule
> +  they are paired with. These DT bindings currently support the FCPV and=
 FCPF.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,fcpv # FCP for VSP
> +      - renesas,fcpf # FCP for FDP
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  # R8A7790 (R-Car H2) VSP1-S

Hum, R8A7790 is H2 but the example below is from H3 R8A7795[01] is it =

not? With this fixed,

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    fcp@fea2f000 {
> +        compatible =3D "renesas,fcpv";
> +        reg =3D <0xfea2f000 0x200>;
> +        clocks =3D <&cpg CPG_MOD 602>;
> +        power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68f21d46614c..660ed6606de2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10700,7 +10700,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/renesas,fcp.txt
> +F:	Documentation/devicetree/bindings/media/renesas,fcp.yaml
>  F:	drivers/media/platform/rcar-fcp.c
>  F:	include/media/rcar-fcp.h
>  =

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
