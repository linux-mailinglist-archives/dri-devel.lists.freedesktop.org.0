Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A82104B0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7A26E820;
	Wed,  1 Jul 2020 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1406E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:56:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id o4so12232370lfi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=z85yo7jf7qPAclXdPiDA0Ly0urWg8sAFHzwhucAmoNc=;
 b=PwDyq6ORpoJdZYnx2AF40a6rD6k1idTrb28wO0N+z8lw22c6LnF1qoh31NieQyO+Ce
 E2nsMzf2RQqniTmmyCL2HFNE/DIQxD5f+GUFRrbUOC5Z+GgwU5ByZH6F/jJjlUaMk5/V
 9m/vnLMixtgM+49m+uPQaDksvPq7z7vaGNyo3qph75vEKCwe/1BIPKYr68PdoMHCUHeQ
 K2nZe/0LyZXCwTR0oQEi5OQLh3c6uq7vMj4k6jihJHPAtD2kfYL0Igs5eGnVseWQ5lOV
 QZmns1HlyxWLNSzGpR6Jxbjw/ib2R3n35t9Wk75QQyzzTNrNMfO/BkpoZNA8I9i36lnu
 F1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z85yo7jf7qPAclXdPiDA0Ly0urWg8sAFHzwhucAmoNc=;
 b=VU5CN5B2WjChwtk532Ej65E/2PyHnAeZCGhmt4kHlmmolU7N7BZIeNTRvyScT0xDQ6
 KagzCH8jsFJC9WdIVx7MQzj6kTTaMMXYYeJDY+pyHrQMa8kJLChP7OpTZ4xaLDDSWSTm
 Jx+/hfQT4wZYDZswQscaPtTqmD+6XuKCM70YN+dGZRZCqH/X47SrDwfMKXHtFHtbrMTW
 labGHLXgCMbaR7HN6XTQuhlLzydEP1wT2FFlL1efOhCcKIAknsVh3WDmaaC2tIofGCx9
 Pv2cxxpE2TEHbMYmd8QwmfwcqJcBs0nkE5kt/YZD8wFpwn+7des374BiPCHiCCxgENIT
 oArA==
X-Gm-Message-State: AOAM531ymrHqFrdVZBCsR5Dpg6JUoS50ZJPQsDyfiD8GCP6MvWWLtD3z
 XVBYagqeFtDUWDweAZMonWuk9g==
X-Google-Smtp-Source: ABdhPJzY5xmZCTIyKpSyoIPXdWaUpnwd9q6vbmLXMMNi3iaFVVVP5fvtwGvs63quIicw16llf/CJFw==
X-Received: by 2002:a19:7111:: with SMTP id m17mr13317338lfc.156.1593550556920; 
 Tue, 30 Jun 2020 13:55:56 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id k6sm1199995lfm.89.2020.06.30.13.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:55:56 -0700 (PDT)
Date: Tue, 30 Jun 2020 22:55:55 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: media: renesas, fdp1: Convert binding
 to YAML
Message-ID: <20200630205555.GD2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-5-laurent.pinchart+renesas@ideasonboard.com>
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

On 2020-06-21 03:47:30 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car FDP1 text binding to YAML.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> =

> - Update MAINTAINERS
> ---
>  .../bindings/media/renesas,fdp1.txt           | 37 -----------
>  .../bindings/media/renesas,fdp1.yaml          | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 64 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.=
txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.=
yaml
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.txt b/D=
ocumentation/devicetree/bindings/media/renesas,fdp1.txt
> deleted file mode 100644
> index 8dd1007bb573..000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,fdp1.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Renesas R-Car Fine Display Processor (FDP1)
> --------------------------------------------
> -
> -The FDP1 is a de-interlacing module which converts interlaced video to
> -progressive video. It is capable of performing pixel format conversion b=
etween
> -YCbCr/YUV formats and RGB formats. Only YCbCr/YUV formats are supported =
as
> -an input to the module.
> -
> -Required properties:
> -
> - - compatible: must be "renesas,fdp1"
> - - reg: the register base and size for the device registers
> - - interrupts : interrupt specifier for the FDP1 instance
> - - clocks: reference to the functional clock
> -
> -Optional properties:
> -
> - - power-domains: reference to the power domain that the FDP1 belongs to=
, if
> -                  any.
> - - renesas,fcp: a phandle referencing the FCP that handles memory access=
es
> -                for the FDP1. Not needed on Gen2, mandatory on Gen3.
> -
> -Please refer to the binding documentation for the clock and/or power dom=
ain
> -providers for more details.
> -
> -
> -Device node example
> --------------------
> -
> -	fdp1@fe940000 {
> -		compatible =3D "renesas,fdp1";
> -		reg =3D <0 0xfe940000 0 0x2400>;
> -		interrupts =3D <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks =3D <&cpg CPG_MOD 119>;
> -		power-domains =3D <&sysc R8A7795_PD_A3VP>;
> -		renesas,fcp =3D <&fcpf0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/=
Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> new file mode 100644
> index 000000000000..f4db96a1f53c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,fdp1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Fine Display Processor (FDP1)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description:
> +  The FDP1 is a de-interlacing module which converts interlaced video to
> +  progressive video. It is capable of performing pixel format conversion
> +  between YCbCr/YUV formats and RGB formats. Only YCbCr/YUV formats are
> +  supported as an input to the module.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,fdp1
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
> +  power-domains:
> +    maxItems: 1
> +
> +  renesas,fcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle referencing the FCP that handles memory accesses for the=
 FDP1.
> +      Not allowed on R-Car Gen2, mandatory on R-Car Gen3.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    fdp1@fe940000 {
> +        compatible =3D "renesas,fdp1";
> +        reg =3D <0xfe940000 0x2400>;
> +        interrupts =3D <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&cpg CPG_MOD 119>;
> +        power-domains =3D <&sysc R8A7795_PD_A3VP>;
> +        renesas,fcp =3D <&fcpf0>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 660ed6606de2..7383dfa510a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10710,7 +10710,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/renesas,fdp1.txt
> +F:	Documentation/devicetree/bindings/media/renesas,fdp1.yaml
>  F:	drivers/media/platform/rcar_fdp1.c
>  =

>  MEDIA DRIVERS FOR RENESAS - VIN
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
