Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1972EA2C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 19:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA6010E3CE;
	Tue, 13 Jun 2023 17:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Tue, 13 Jun 2023 17:45:00 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35AF10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 17:45:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35DHc9nx115778;
 Tue, 13 Jun 2023 12:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686677889;
 bh=2xke3ZeB7Ra/uz63LLqEWUDdhS/KFli70R0sHHHQCRo=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=TbuPr4Nll7qxfFFMNdi92qvCAFy3WoJxwAxposCKesdOhIY3EAJShLRwtmfoCEOPW
 w2AtHKVGgL3sVHsVPm8+Eyxiv0ZbCrItNUM3Jf0VhR/dR6HijPHbzhEBjwTgd1AaTk
 KHA58+g7Zj3XO8LPGjFts46N2KkXpvHzMTQD3gpw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35DHc9fT003279
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jun 2023 12:38:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 12:38:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 12:38:08 -0500
Received: from [10.250.37.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35DHc7xq004269;
 Tue, 13 Jun 2023 12:38:08 -0500
Message-ID: <3f4dd2ca-cf7a-0d1d-e528-097e032c5899@ti.com>
Date: Tue, 13 Jun 2023 12:38:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, <dri-devel@lists.freedesktop.org>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230613144800.52657-3-sarah.walker@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: matthew.brost@intel.com, christian.koenig@amd.com, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/13/23 9:47 AM, Sarah Walker wrote:
> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>   .../devicetree/bindings/gpu/img,powervr.yaml  | 71 +++++++++++++++++++
>   MAINTAINERS                                   |  7 ++
>   2 files changed, 78 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> new file mode 100644
> index 000000000000..652343876d1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2022 Imagination Technologies Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination Technologies PowerVR GPU
> +
> +maintainers:
> +  - Sarah Walker <sarah.walker@imgtec.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

oneOf shouldn't be needed, you can just do the enum followed by const.

> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,powervr-seriesaxe
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: mem
> +      - const: sys
> +    minItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: GPU interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: gpu
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  power-supply: true

Why do you need power-supply?

Andrew

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu: gpu@fd00000 {
> +        compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
> +        reg = <0x0fd00000 0x20000>;
> +        power-domains = <&some_pds 187>;
> +        clocks = <&k3_clks 187 0>;
> +        clock-names = "core";
> +        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "gpu";
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b344e1318ac3..a41517843a10 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10084,6 +10084,13 @@ IMGTEC IR DECODER DRIVER
>   S:	Orphan
>   F:	drivers/media/rc/img-ir/
>   
> +IMGTEC POWERVR DRM DRIVER
> +M:	Frank Binns <frank.binns@imgtec.com>
> +M:	Sarah Walker <sarah.walker@imgtec.com>
> +M:	Donald Robson <donald.robson@imgtec.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
> +
>   IMON SOUNDGRAPH USB IR RECEIVER
>   M:	Sean Young <sean@mess.org>
>   L:	linux-media@vger.kernel.org
