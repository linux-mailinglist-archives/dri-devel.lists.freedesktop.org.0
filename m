Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CBA9D354A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5075F89711;
	Wed, 20 Nov 2024 08:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bF9Zttze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523010E3A9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 08:22:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B98BCA42CAF;
 Wed, 20 Nov 2024 08:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26FEC4CECD;
 Wed, 20 Nov 2024 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732090948;
 bh=76zuNGW4eisgA6+rUAF0FiulsIP5rdtlV6s0x8DYYBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bF9Zttzesv7JIRF5B7lKUfzK3zcIwLwysn2ymuQcrxecpgPxrl+ohzHEhPfO57QE8
 7HaMyMC6/yPsRURu53Qo4PBnMVnduHf9IdWpWVSFpsUDIKELiNe3S2umd/FELw/A6S
 C4/0fvRigCUfJsr/4kPLvCT6xL+7p001tQ3uShpokS5oITAyngcZnQttPwWwppZeg9
 ICvjul2C1NKhCSFiyZk/UqAXH7qxz9c9LJM4PRyOpKmzsaiT7VirqElCYXRY0WB7on
 14pgurY9r+wzs2mYZxZ+PGTyP0RSJasfs78B+I5vixiLU0iPBCikoPAkBJdrHq226a
 GDWaWeJaY+9ng==
Date: Wed, 20 Nov 2024 09:22:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH v2 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
Message-ID: <2pfix2ozehlfb6pwrrhxhqh7gho56dh33usrnaqxq7anstytsp@ij5y7zm5cqlu>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45d9fb0cf@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45d9fb0cf@imgtec.com>
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

On Mon, Nov 18, 2024 at 01:01:53PM +0000, Matt Coster wrote:
> The current compatible strings are not specific enough to constrain the

No, they are specific enough.

> hardware in devicetree. For example, the current "img,img-axe" string
> refers to the entire family of Series AXE GPUs. The more specific
> "img,img-axe-1-16m" string refers to the AXE-1-16M GPU which, unlike the
> rest of its family, only uses a single power domain.
> 
> While in this instance there is already "ti,am62-gpu" for the more

That's the specific compatible.

> specific case, the intent here is to draw a line between properties
> inherent to the IP core and choices made by the silicon vendor at
> integration time. For example, the number of power domains is a property
> of the IP core, whereas the decision to use one or three clocks (see
> next patch) is a vendor one.
> 
> Work is currently underway to add support for volcanic-based Imagination
> GPUs, for which bindings will be added in "img,powervr-volcanic.yaml".
> The split between rogue and volcanic cores is non-obvious at times, so
> add a generic top-level "img,img-rogue" compatible string here to allow
> for simpler differentiation in devicetrees without referring back to the
> bindings.
> 
> Make these changes now before introducing more compatible strings to keep
> the legacy versions to a minimum.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v2:
> - Clarified justification for compatible strings
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml    | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 256e252f8087fa0d6081f771a01601d34b66fe19..ef7070daf213277d0190fe319e202fdc597337d4 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -12,10 +12,19 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - ti,am62-gpu
> -      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,img-axe-1-16m
> +          - const: img,img-rogue

NAK, that's ABI break. You are stuck with whatever you sent earlier.


> +
> +      # This legacy combination of compatible strings was introduced early on before the more
> +      # specific GPU identifiers were used. Keep it around here for compatibility, but never use
> +      # "img,img-axe" in new devicetrees.

Wrap according to Linux coding style. But anyway this is not needed,
just deprecate things.

> +      - items:
> +          - const: ti,am62-gpu
> +          - const: img,img-axe

So you want to use deprecated here?

Anyway, entire change is not needed and without proper justification.
Your marketing terms are not proper justification.

Best regards,
Krzysztof

