Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB9AD5E85
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 20:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5CF10E703;
	Wed, 11 Jun 2025 18:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t0ZCRbT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10A610E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 18:46:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A7AFF4A609
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 18:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872F9C4CEF1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749667613;
 bh=a4l2CHrqJdsjNmKQhyuxmXX7as3MmuRLONCmwbTJ5xI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t0ZCRbT1V5dmuVIwMEY9Ikzau3JW5DTjSIcQWfl6CCIP87Ji0l2zK3B6HCh3gymN7
 jDUyYPuxEIBn9qTDHXStZiBkJagm967Oj+i55Aqpa+TX1NlmUlavLLlAf8sjiPJvKe
 NBM4l8Hzc4DEonxtEfiHYFqKY3cu2KGo2OlT1S4MrxoZ7vyS1S97Nr/AVf58OiAxuA
 0LaWzAOOMHcOYDvzMXxHmJZcu+yq7P2z/vWuJ7SCNlJ8QsFGMaZyf7gLrgsjbQhqCF
 r+JYi/KJDrfZd5hMkhB1oeMgDcEDsfJl63raHKXYcU/iWtBsbD4nYI7i4vnHXFw/O+
 IM9W77M9NfHPA==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ade326e366dso21288366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaERAWr6YKv3N6JpDHs4pyFIpB/nNMzFyOxS346jVnbtUFdjRFN+W3baa/S8yuGX3g3tykRc6QBZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv7WTPw2Y0gOqp8J51XcvowuDzmiFZcaqIbjjoT0JexKTVG4fk
 ZGyPpBx8rn8uxRNhZ2mNYEi+nW/HULodsIiLBFOJejsTeJgIOka/PSfAaKVtdnwAZ1Mxpct9pef
 ZJvpf+uwMAKU8E6s35MMD+OEoKyiHCA==
X-Google-Smtp-Source: AGHT+IEtiYLqZxPX6vg79k1l4PJrPl4a356jYKlMYVrfSiN34x4GAKFDsw4RbXmE6kLrUUCaPNybODY9V3P09GFhmaM=
X-Received: by 2002:a17:906:6a14:b0:ad8:99cc:774c with SMTP id
 a640c23a62f3a-adea9456cdfmr18086266b.58.1749667612085; Wed, 11 Jun 2025
 11:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Jun 2025 13:46:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
X-Gm-Features: AX0GCFsOeaA5WdIXO14g7zVwNMaCmTI9osasLBHNTNRqJq2RE6YUF5IFXoLClZA
Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jun 11, 2025 at 12:32=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for the GPU present in Apple SoCs
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 96 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Docum=
entation/devicetree/bindings/gpu/apple,agx.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..23df3ebd689b1e885eb99ca57=
3343fe7f2d09dc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/apple,agx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC GPU
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: apple,agx-g13g
> +      - items:
> +          - enum:
> +              - apple,agx-g13s
> +              - apple,agx-g13c
> +              - apple,agx-g13d
> +          - const: apple,agx-g13x

I'm assuming the 'x' is a wildcard. The preferred thing to do make one
of the 3 actual devices the fallback. Typically, the oldest one is
used.

> +      - items:
> +          - const: apple,agx-g14g

This and the 1st entry can be a single enum.

> +  reg:
> +    items:
> +      - description: ASC coprocessor control
> +      - description: GPU block MMIO registers

Seems odd that the main GPU registers are not first in the list, but
either way is fine.

> +
> +  reg-names:
> +    items:
> +      - const: asc
> +      - const: sgx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  memory-region:
> +    items:
> +      - description: Region containing GPU MMU TTBs
> +      - description: Region containing GPU MMU page tables
> +      - description:
> +          Region containing a shared handoff structure for VM
> +          management coordination
> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob
> +      - description: Shared global variables with GPU firmware
> +
> +  memory-region-names:
> +    items:
> +      - const: ttbs
> +      - const: pagetables
> +      - const: handoff
> +      - const: hw-cal-a
> +      - const: hw-cal-b
> +      - const: globals
> +
> +  apple,firmware-compat:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 3
> +    description:
> +      MacOS version the current firmware is paired with, used to pick
> +      the version of firmware ABI to be used.
> +      Bootloader will overwrite this
> +
> +required:
> +  - compatible
> +  - reg
> +  - mboxes
> +  - memory-region
> +  - apple,firmware-compat
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    gpu@6400000 {
> +        compatible =3D "apple,agx-g13g";
> +        reg =3D <0x6400000 0x40000>,
> +              <0x4000000 0x1000000>;
> +        reg-names =3D "asc", "sgx";
> +        mboxes =3D <&agx_mbox>;
> +        power-domains =3D <&ps_gfx>;
> +        memory-region =3D <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>=
,
> +                        <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>=
;
> +        memory-region-names =3D "ttbs", "pagetables", "handoff",
> +                              "hw-cal-a", "hw-cal-b", "globals";
> +
> +        apple,firmware-compat =3D <0 0 0>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa163f9fe8fe3f04bf66426f9a894409..2a32c9c4ee355a1109a3e2031=
ea3663c39cc8c68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2331,6 +2331,7 @@ F:        Documentation/devicetree/bindings/arm/app=
le/*
>  F:     Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:     Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.y=
aml
>  F:     Documentation/devicetree/bindings/dma/apple,admac.yaml
> +F:     Documentation/devicetree/bindings/gpu/apple,agx.yaml
>  F:     Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:     Documentation/devicetree/bindings/input/touchscreen/apple,z2-mult=
itouch.yaml
>  F:     Documentation/devicetree/bindings/interrupt-controller/apple,*
>
> --
> 2.49.0
>
>
