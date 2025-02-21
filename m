Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6465DA3EFC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF1010EA43;
	Fri, 21 Feb 2025 09:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VINOrWZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A08F10EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:16:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6A95761184;
 Fri, 21 Feb 2025 09:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC04C4CED6;
 Fri, 21 Feb 2025 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740129379;
 bh=v4duxCBt31nnMKSAT2iTqhqPuTqDH0EcdtbEtxT5aeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VINOrWZ0MlUK8m4ViqyGszczMyknnwNDy1cX7Of0w9PFryWoN6z7k0/JPV/1ysj75
 iFXW2hjpcurfgMZtpyccXSeUa2fjzkvI4wxV0OwSjmr48Vkz8LCixF+LxySC+DdM1s
 5LRKP1R8WgRkclg9lf5i1Sjb0pQS2npaJS7ltxBVZame8ZtZkBILQdlvdxjrCLuAYS
 rEkcRctogB0dwhmdJ9jDXO+rcOd7qerQCf6FHAsHpMrp2dGwF0i+dlcTybyNDLas49
 EURRBLSAPtBNQnQclY5NzJtmxLDFNcFB9UpKuF9a9oCseJajZGe0XPoPruGwH7pU+R
 zV2aEAciRde8g==
Date: Fri, 21 Feb 2025 10:16:16 +0100
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
Subject: Re: [PATCH v5 15/21] dt-bindings: gpu: Add support for T-HEAD TH1520
 GPU
Message-ID: <20250221-adaptable-tamarin-of-variation-ad6dc6@krzk-bin>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140310eucas1p1297441a3da276569cd86b6b9e4544242@eucas1p1.samsung.com>
 <20250219140239.1378758-16-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-16-m.wilczynski@samsung.com>
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

On Wed, Feb 19, 2025 at 03:02:33PM +0100, Michal Wilczynski wrote:
>    reg:
>      maxItems: 1
> @@ -60,6 +65,16 @@ allOf:
>          clocks:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3

Missing constraint for clock-names. They *always* go together.

Best regards,
Krzysztof

