Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853ECA63672
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 17:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69C210E1AA;
	Sun, 16 Mar 2025 16:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oXQLq4Ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8042E10E1AA
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:43:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A38AA48BE7;
 Sun, 16 Mar 2025 16:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27E9C4CEDD;
 Sun, 16 Mar 2025 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742143435;
 bh=BCk88QVM/gnjky6nvXtsT155VA83xP6SDRxjTuCJ700=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oXQLq4Qlw4SD7HcH1DpE7NLUqV/+nkgit4KJzgr8/vmKLfMKHgG7qBNgPrNSR2KQS
 08NG9TPteRh6UxbdcEUoeAQEhq3vWhLUgf5/YnaZ9/U+5C7DCnneWxl6Ij8nqxMEvb
 /hWnaCCuag8W8rM0L2Hbqtv6jrgr7XBwPMoqDO7iiOJoyvyJYL9CWVvmdH1fmR2KSJ
 G4xoxEi1AxfpG3QugtQFKbKpLoEp2lPzmNxPfSdamAcWgps4D4dxyUj2EIm6tr8bxr
 5VnnCXncFEhSm70D0gO8haqdLZbUlsPhUlbIgOt7HKdSAPl7huhuXO8D9Q6Ey4PsHl
 QO5zs2vH0LfTA==
Date: Sun, 16 Mar 2025 17:43:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Phil Elwell <phil@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v5 4/6] dt-bindings: gpu: v3d: Add additional examples to
 improve binding checks
Message-ID: <20250316-abiding-badger-of-joy-0acd4c@krzk-bin>
References: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
 <20250316-v3d-gpu-reset-fixes-v5-4-9779cdb12f06@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250316-v3d-gpu-reset-fixes-v5-4-9779cdb12f06@igalia.com>
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

On Sun, Mar 16, 2025 at 11:15:11AM -0300, Ma=C3=ADra Canal wrote:
> To prevent future changes that might inadvertently break the ABI, add
> more examples to the binding. These examples improve coverage and help

Examples are not related to ABI at all.

> ensure `make dt_binding_check` produces more robust validation results.

No, don't add more examples differing by one property. Keep one/two
examples.

>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 34 ++++++++++++++++=
++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Do=
cumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> index 766a310ab653855d7cc9a80f18c2083218fe307e..39b8f0ee1f727628307d75884=
4008ae1189902b2 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -123,6 +123,38 @@ allOf:
>  additionalProperties: false
> =20
>  examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/soc/bcm2835-pm.h>
> +
> +    gpu@7ec00000 {
> +      compatible=3D "brcm,2711-v3d";
> +      reg =3D <0x7ec00000 0x4000>,
> +            <0x7ec04000 0x4000>;
> +      reg-names =3D "hub", "core0";
> +
> +      power-domains =3D <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;

That's the only notable difference - one new property.

> +      resets =3D <&pm BCM2835_RESET_V3D>;
> +      interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/soc/bcm2835-pm.h>
> +
> +    gpu@2000000 {
> +      compatible =3D "brcm,2712-v3d";
> +      reg =3D <0x02000000 0x4000>,
> +            <0x02008000 0x6000>,
> +            <0x02030800 0x0700>;
> +      reg-names =3D "hub", "core0", "sms";
> +
> +      power-domains =3D <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> +      resets =3D <&pm BCM2835_RESET_V3D>;
> +      interrupts =3D <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;

No differences here at all.

Best regards,
Krzysztof

