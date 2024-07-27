Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78F93DCCF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 03:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FEC10E2C3;
	Sat, 27 Jul 2024 01:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iyOMvMTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC31810E2C3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 01:08:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD4F4720;
 Sat, 27 Jul 2024 03:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722042435;
 bh=4PKnJYbTQUvutpyXRpFNchVE+pnTdZBeWUxBO2khX/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iyOMvMTQdxg+RlSBqOepJ0xtfAuZ1H3o5ftahHWyKif+gEYl4DKZa6oNm/Z+wkldn
 PN7BKv75UYwk7gc+YR4qmNmsSyml2vv9EQnLjMAzWH/JgnGnUwJV8BgBmq7T6a4Vt0
 UF4mbDMyQ9tpWCXW5h7CHVqsNlvPzVbIxoJSbxuY=
Date: Sat, 27 Jul 2024 04:07:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: renesas: r9a07g043u: Add vspd node
Message-ID: <20240727010741.GH300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-7-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:51:44PM +0100, Biju Das wrote:
> Add vspd node to RZ/G2UL SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> index 18ef297db933..15e84a5428ef 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -129,6 +129,19 @@ csi2cru: endpoint@0 {
>  		};
>  	};
>  
> +	vspd: vsp@10870000 {
> +		compatible = "renesas,r9a07g043u-vsp2", "renesas,r9a07g044-vsp2";
> +		reg = <0 0x10870000 0 0x10000>;
> +		interrupts = <SOC_PERIPHERAL_IRQ(149) IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
> +		clock-names = "aclk", "pclk", "vclk";
> +		power-domains = <&cpg>;
> +		resets = <&cpg R9A07G043_LCDC_RESET_N>;
> +		renesas,fcp = <&fcpvd>;

This patch looks fine, but I would move it after 7/9, as here you
reference a node that doesn't exist yet.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	};
> +
>  	irqc: interrupt-controller@110a0000 {
>  		compatible = "renesas,r9a07g043u-irqc",
>  			     "renesas,rzg2l-irqc";

-- 
Regards,

Laurent Pinchart
