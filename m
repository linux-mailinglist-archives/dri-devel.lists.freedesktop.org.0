Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A5A17B07
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295F710E52B;
	Tue, 21 Jan 2025 10:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JCRBH20s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B1010E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:08:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8EEF55C4B49;
 Tue, 21 Jan 2025 10:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB28C4CEDF;
 Tue, 21 Jan 2025 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737454120;
 bh=ENLFzy2bE8WWpAn62FWGklWq2J5NXPzsV7mwFUV66PY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JCRBH20svciWwvTa1Did37XrBO0s064B/DTFoypK1t6MGJT27w12BeFGtHmYxV/as
 Odlu0WA8tRCdm7psEPen+TsZFqLn0UeVZYRUxEio7Yk6Kq1cjB0Vtx80OibDX0Y4wE
 AaRb+IxQGAJYbrccGynrYdSQLoKxXr6U2MoveJsF/FpyAcclzvOvwegFdDJmPtLOrc
 XmWBTm9SghFul+y1OV88u+wVxBQ7i2HdSjwhPpkDwOcI6FrfIcW2EKdhIIkQU7V/4U
 DLy0MOxumGpT8ESf4cG1G+R+BJqMIcOWJsah9f6MrNTdT/CVR7kSBZ/EGBVRxBZaTx
 l1CsnM4qWBSZg==
Date: Tue, 21 Jan 2025 11:08:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: Re: [RFC v3 11/18] dt-bindings: gpu: Add compatibles for T-HEAD
 TH1520 GPU
Message-ID: <20250121-tiny-crazy-goshawk-dce1dc@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172134eucas1p18cbf29a4ade281df10efce210cc8893e@eucas1p1.samsung.com>
 <20250120172111.3492708-12-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-12-m.wilczynski@samsung.com>
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

On Mon, Jan 20, 2025 at 06:21:04PM +0100, Michal Wilczynski wrote:
>    reg:
>      maxItems: 1
> @@ -25,11 +30,8 @@ properties:
>      maxItems: 3
>  
>    clock-names:
> -    items:
> -      - const: core
> -      - const: mem
> -      - const: sys
>      minItems: 1
> +    maxItems: 3

So what is the third item? It cannot be anything, but must be
constrained.

I understand that you clean it up and maybe the cleaning is correct, but
it should be separate commit with its own explanation.

>  
>    interrupts:
>      maxItems: 1
> @@ -47,8 +49,6 @@ required:
>    - clock-names
>    - interrupts
>  
> -additionalProperties: false
> -
>  allOf:
>    - if:
>        properties:
> @@ -58,7 +58,28 @@ allOf:
>      then:
>        properties:
>          clocks:
> +          minItems: 1

Drop minItems here.

>            maxItems: 1
> +        clock-names:
> +          items:
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: sys
> +
> +unevaluatedProperties: false

That's not explained. Does not look correct, either, unless you fix some
issue, but then again: separate commit.

Best regards,
Krzysztof

