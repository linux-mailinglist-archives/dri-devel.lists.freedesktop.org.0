Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2295D36C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE8F10EC71;
	Fri, 23 Aug 2024 16:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JpFgaCA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BBA10EC71
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 16:29:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id EC5CBC5A0D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 16:26:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C6E820008;
 Fri, 23 Aug 2024 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724430378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZSZ4ZWkj6nN5cffjKGJ15MFqfbm3AdMyv45FOgL9lo=;
 b=JpFgaCA32WqOAE3V0avi6VMRNuexZVaIWTSYeFl+0wgVveqM/f8XnfTjdFcSomsT3BDCKi
 0Hh30CESmpUDky3nmmbKHKTd3/FYNC67cupzeYCQdrWMXHbHlZvNHTbCX8xOXRv3G92xhv
 FmfEpg24mUCZNK/Nkb7CGqfpHDEAZEbbkVH5Hy2LtG7rd9/wPbnLHDPLGwy0ZUTj1l4VEZ
 2ppZ3j7o66upZ+wP+dGi41RfTvb5TavNh/t8/NvDOcVij0SEDtRzMIvQE2Pr7fKRvgS78e
 rDoh1VviE+kBhlSbxDgHf7B4cE11WmrgL3suG9gviol32opZCBDPI0VXULmqkQ==
Date: Fri, 23 Aug 2024 18:26:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <20240823182616.5a85e1ae@xps-13>
In-Reply-To: <20240821071132.281018-2-hpchen0nvt@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
 <20240821071132.281018-2-hpchen0nvt@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hi,

hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:

> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
>=20
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-=
nand.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.ya=
ml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> new file mode 100644
> index 000000000000..152784e73263
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
> +
> +maintainers:
> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,ma35d1-nand

Can we please use the -nand-controller suffix. A NAND is a the common
name for a chip with storage inside. You are describing a host
controller that can be connected to in order to talk to a NAND.

Thanks,
Miqu=C3=A8l
