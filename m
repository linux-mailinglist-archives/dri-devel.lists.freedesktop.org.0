Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01CA18D3C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 09:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0686210E680;
	Wed, 22 Jan 2025 08:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R/kZPNcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CD310E680
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 08:02:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13B1B5C5CC9;
 Wed, 22 Jan 2025 08:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65541C4CED6;
 Wed, 22 Jan 2025 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737532950;
 bh=XspACQ/SeIuejKutebYI6GMThqDAj/TizHr7BbFXO7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/kZPNcSjiI/Ky3ZvFc/16EujczsfY9jiKFmxPVKYqXHbRZ9VdwGIhcIGF/CZ4PhP
 9C/JEFht/idis5hcpSGhoFjEaQPUxG5fPMHhkvJoLBae+iwtUu9O0EZeOWDNb0QIFW
 UFwvx5sSQt+CrtvwCNRwwjTaTPmZY6McNxNDNuKmbhbrFAUTkciATTqzTHHFN117/p
 GM75R50CvKz2W5JNtmuRgTJ+4TAL3AYiwvcoXsRiC2J9rlYiQK0Qi2vwDfzt3+4yyA
 vC9W1V9ppB9MiBcuz5GF2hcNCHP5e0zy+00nlCaKWr8yjK0ulqXfGxok5gQFFYJTXQ
 AOPAU878L6Z6w==
Date: Wed, 22 Jan 2025 09:02:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v12 10/13] dt-bindings: display: vop2: describe
 constraint SoC by SoC
Message-ID: <20250122-turquoise-condor-of-temperance-b8dfea@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103254.2528004-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121103254.2528004-11-andyshrk@163.com>
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

On Tue, Jan 21, 2025 at 06:32:47PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> As more SoCs variants are introduced, each SoC brings its own
> unique set of constraints, describe this constraints SoC by
> SoC will make things easier for adding new variant.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 

> Changes in v12:
> - Only change the description method for existing SoC.
> 
> Changes in v11:
> - Remove redundant min/maxItems constraint
> 
> Changes in v10:
> - Move interrupt-names back to top level
> - Add constraint of interrupts for all platform
> - Add constraint for all grf phandles
> - Reorder some properties
> 
> Changes in v9:
> - Drop 'vop-' prefix of interrupt-names.
> - Add blank line between DT properties
> - Remove list interrupt-names in top level
> 
> Changes in v8:
> - Fix dt_binding_check errors
> - ordered by soc name
> - Link to the previous version:
>   https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u
> 
> Changes in v4:
> - describe constraint SOC by SOC, as interrupts of rk3576 is very
>   different from others
> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> 
> Changes in v3:
> - ordered by soc name
> - Add description for newly added interrupt
> 
> Changes in v2:
> - Add dt bindings
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 44 +++++++++++++------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 2531726af306..f23939e67fd0 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -14,6 +14,7 @@ description:
>  maintainers:
>    - Sandy Huang <hjc@rock-chips.com>
>    - Heiko Stuebner <heiko@sntech.de>
> +  - Andy Yan <andyshrk@163.com>
>  
>  properties:
>    compatible:
> @@ -120,43 +121,58 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-vop
> +            enum:
> +              - rockchip,rk3566-vop
> +              - rockchip,rk3568-vop
>      then:
>        properties:
>          clocks:
> -          minItems: 7
> +          minItems: 5

I don't see any changes comparing to original binding. At least not for
clocks.

> +
>          clock-names:
> -          minItems: 7
> +          minItems: 5
> +
> +        interrupts:
> +          maxItems: 1

This is useless and not explained.

Best regards,
Krzysztof

