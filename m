Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28619A83B22
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1728E10E7A3;
	Thu, 10 Apr 2025 07:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fp+Sj79S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019B410E7A3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 07:29:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2685268445;
 Thu, 10 Apr 2025 07:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45765C4CEEA;
 Thu, 10 Apr 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744270170;
 bh=OGYNRgQopSq7MTnNOOCJV0HUeFVtR+nQ/5cCkY8zlEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fp+Sj79S4PEoDdHd6SL77A77I9x4L+/H97awloSYzSb+qwGjS24WULW21oAyEHdqt
 Y/Vn3YBpduLwtwnj/TQlwBerBpkFp8FEhxIQT9ff1wOZxRcO/nO0jWVwa47Q2QoCV3
 frDGz/4bVhWMLdQQEchkiC14TgOUdeQ5LNi5wZG/KDmB5GSPY9kg04+5LySqFNH59r
 imdd3x3+ttQKh4BN7uYs+vbhbdiIlw6hFlJFnYfMYZNAYFsUqZthXzJrERV7ptk4uI
 rXcn1ONdmlnesAWGhy00P30R8Imhv9luMalQ2zbhgRG/B+ryBd9YqgxJPifImfh+U5
 RTPHZ2CpaqHFA==
Date: Thu, 10 Apr 2025 09:29:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, gregkh@linuxfoundation.org,
 robh@kernel.org, 
 conor+dt@kernel.org, ogabbay@kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de,
 praveen.jain@amd.com, 
 harpreet.anand@amd.com, nikhil.agarwal@amd.com, srivatsa@csail.mit.edu,
 code@tyhicks.com, ptsm@linux.microsoft.com
Subject: Re: [PATCH v2 1/3] dt-bindings: accel: add device tree for AMD PKI
 accelerator
Message-ID: <20250410-flat-violet-bull-a2a0b7@shite>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409173033.2261755-1-nipun.gupta@amd.com>
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

On Wed, Apr 09, 2025 at 11:00:31PM GMT, Nipun Gupta wrote:
> Add binding documentation for AMD PKI accelerator supported for AMD
> versal-net SoC.
>

A nit, subject: drop second/last, redundant "device tree for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

You already got this comment...

> AMD PKI accelerator is a device on AMD versa-net SoC to execute public key
> asymmetric crypto operations like ECDSA, ECDH, RSA etc. with high performance.
> The driver provides accel interface to applications for configuring the device
> and performing the required operations. AMD PKI device comprises of multiple
> Barco Silex ba414 PKI engines bundled together, and providing a queue based
> interface to interact with the device.

...

> 
>  .../bindings/accel/amd,versal-net-pki.yaml    | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml

That's a crypto device, so goes to 'crypto' directory.

> 
> diff --git a/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml b/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
> new file mode 100644
> index 000000000000..2dca7458f845
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/accel/amd,versal-net-pki.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD PKI accelerator device
> +
> +maintainers:
> +  - Nipun Gupta <nipun.gupta@amd.com>
> +  - Praveen Jain <praveen.jain@amd.com>
> +
> +description: |
> +  AMD PKI accelerator handles the public key asymmetric crypto operations.
> +  The driver provides accel interface to the application for configuring the
> +  device and performing the required operations. AMD PKI device comprises of
> +  multiple Barco Silex ba414 PKI engines bundled together, and providing a
> +  queue based interface to interact with these devices on AMD versal-net SoC.
> +
> +  Link to ba414 datasheet:
> +  https://datasheet.datasheetarchive.com/originals/crawler/barco-silex.com/34b540b9dc5db40c5bc01999401cf1e4.pdf
> +
> +properties:
> +  compatible:
> +    const: amd,versal-net-pki
> +
> +  reg:
> +    description: AMD PKI register space

Drop description, obvious.

> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

And the resets? I understand from previous email that there is a reset controller.

> +  iommus: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        amdpk@20400000000 {

crypto@

> +            compatible = "amd,versal-net-pki";
> +            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            reg = <0x204 0x00000000 0x0 0x10000>;
> +            iommus = <&smmu 0x25b>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..11f8815daa77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1154,6 +1154,14 @@ F:	Documentation/networking/device_drivers/ethernet/amd/pds_core.rst
>  F:	drivers/net/ethernet/amd/pds_core/
>  F:	include/linux/pds/
> 
> +AMD PKI DRIVER
> +M:	Nipun Gupta <nipun.gupta@amd.com>
> +M:	Praveen Jain <praveen.jain@amd.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Are you going to apply patches to this tree?

Best regards,
Krzysztof

