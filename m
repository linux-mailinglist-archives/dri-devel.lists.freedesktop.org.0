Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193AA5D0C6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 21:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931EC10E693;
	Tue, 11 Mar 2025 20:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i5pzssPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C2610E698
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 20:24:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 37D05A4618C;
 Tue, 11 Mar 2025 20:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D569C4CEE9;
 Tue, 11 Mar 2025 20:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741724647;
 bh=lDwYcYL8DQlb47+KVmbSPC3vM2Na2GTDR5bm4oiQq4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5pzssPTTrZsJm2Hw0tDPGZZ8x1jxj7OirsvNjzhPzCAaSZ3pGplaqzFBABGpUuS3
 cmVWdeVOnm6P1yQo2RI3acUVEIPppz0Dzxw+JrWbeKFsB4TY0xt2HIU0SUbcYUjFxd
 xwhvTr2xB4/EdeYy4cKoQHaHls5xHVQgDe66Seie/Gi0c2VhwxgQaWTUDZMK6s2OAn
 sESL7XWb0vdXStUUxBIVzz87Ve6czr0y6mv20HL3rsqlNbdTzyvfOzUpuZSXiVajyX
 S4fK2iWEm8gR06fRME4NzfgmiR0apzVesXagPzTExSxmP7uDVKyXyt69RMokroLvhD
 Ak9Fko5Gt5YXQ==
Date: Tue, 11 Mar 2025 15:23:59 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v3 5/7] dt-bindings: gpu: v3d: Add SMS register to
 BCM2712 compatible
Message-ID: <20250311202359.GA54828-robh@kernel.org>
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
 <20250311-v3d-gpu-reset-fixes-v3-5-64f7a4247ec0@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311-v3d-gpu-reset-fixes-v3-5-64f7a4247ec0@igalia.com>
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

On Tue, Mar 11, 2025 at 03:13:47PM -0300, Maíra Canal wrote:
> V3D 7.1 exposes a new register block, called V3D_SMS. As BCM2712 has a
> V3D 7.1 core, add a new register item to its compatible. Similar to the
> GCA, which is specific for V3D 3.3, SMS is optional and should only be
> added for V3D 7.1 variants (such as brcm,2712-v3d).

Based on the schema, that is not what optional means for bindings. 
Optional is within a specific compatible, not present for one compatible 
and not present for another compatible.

> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> index 141f2ed540bb4ddb85a933d7d44a4078c386ba39..7349347da1c0034a8849deaa6d64dde6d9d5a81a 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -57,7 +57,6 @@ allOf:
>            contains:
>              enum:
>                - brcm,2711-v3d
> -              - brcm,2712-v3d
>                - brcm,7278-v3d
>      then:
>        properties:
> @@ -71,6 +70,27 @@ allOf:
>              - const: hub
>              - const: core0
>              - const: bridge
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,2712-v3d
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: hub register (required)
> +            - description: core0 register (required)
> +            - description: SMS register (required)

minItems tells us these are all 'required'.

> +            - description: bridge register (if no external reset controller)
> +          minItems: 3
> +        reg-names:
> +          items:
> +            - const: hub
> +            - const: core0
> +            - const: sms
> +            - const: bridge

This is an ABI change because previously the 3rd entry was bridge and 
you moved it. Put new entries on the end to keep compatibility. If 
there's no users yet, then that's fine, but the commit message needs to 
say that.

> +          minItems: 3
>    - if:
>        properties:
>          compatible:
> 
> -- 
> Git-154)
> 
