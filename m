Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563949FDE87
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 11:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8722710E027;
	Sun, 29 Dec 2024 10:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EYUUz7Kb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4961010E027
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 10:13:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B5745C55FE;
 Sun, 29 Dec 2024 10:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A45C4CED7;
 Sun, 29 Dec 2024 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735467222;
 bh=NlqLtU37r1XG0IgHPwMy4frz80Jlp1bKAGpkHbUnyXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYUUz7KbakQWAduLPLZpPfKAw0zp7Chn4RWyHuhb5R2UOX6eOEVMrAmh61gg9EUGf
 xZS+fu1oK4e9KBzP3jRUBOSbx/5OSjZKYmSCYH6xSpS1aXZZUR1+EnelbVI81IZDfm
 WyowfbLqx16SJ5k6LkShsjZXVaI/u7DY4RNtT4lSkY2RMdJ6qC09pJUxWD0HnbuUQn
 FEEjF8MrmcpT7ULqKXA7f5hZNtn/Ev0qv0cipNpxiolTfU7VQnPxCbl2OwdSnJ/pXD
 JhWHuT1EqTGLEkbdSkU3LZE3D3i3919LV7WDc3gx1IPxKVykdrI44JUu6Dv9WlLnKI
 irQ271wgWebVA==
Date: Sun, 29 Dec 2024 11:13:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, krzk+dt@kernel.org, joro@8bytes.org, 
 cl@rock-chips.com, robh@kernel.org, hjc@rock-chips.com, vkoul@kernel.org, 
 devicetree@vger.kernel.org, detlev.casanova@collabora.com,
 cristian.ciocaltea@collabora.com, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <ihvrdnntfuvvycnlhysnm43wylotovvnivu4wxcne3bwc6etpj@n2rq6n77lmma>
References: <20241228122155.646957-1-andyshrk@163.com>
 <20241228122155.646957-6-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241228122155.646957-6-andyshrk@163.com>
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

On Sat, Dec 28, 2024 at 08:21:48PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - describe constraint SOC by SOC, as interrupts of rk3576 is very
>   different from others
> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> 
> Changes in v1:
> - ordered by soc name
> - Add description for newly added interrupt
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 70 +++++++++++++++----
>  1 file changed, 56 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 2531726af306..f28cea4a6d82 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - rockchip,rk3566-vop
>        - rockchip,rk3568-vop
> +      - rockchip,rk3576-vop
>        - rockchip,rk3588-vop
>  
>    reg:
> @@ -37,10 +38,22 @@ properties:
>        - const: gamma-lut
>  
>    interrupts:
> -    maxItems: 1
> -    description:
> -      The VOP interrupt is shared by several interrupt sources, such as
> -      frame start (VSYNC), line flag and other status interrupts.
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      - description:

That's contradictory. min/max say 1-4, but here you list two interrupts.

> +          vop system interrupt, such as bus error, and vsync for vop version under
> +          rk3576.
> +      - description:
> +          independent interrupts for each video port, such as vsync and other video
> +          port related error interrupts.
> +
> +  interrupt-names:
> +    items:
> +      - const: vop-sys
> +      - const: vop-vp0
> +      - const: vop-vp1
> +      - const: vop-vp2

And this says exactly 4.

Best regards,
Krzysztof

