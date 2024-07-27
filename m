Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937B93DCDA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 03:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7731510E2F1;
	Sat, 27 Jul 2024 01:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ALNuJ2fS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713A10E2F1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 01:10:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E4CE720;
 Sat, 27 Jul 2024 03:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722042572;
 bh=Ci+4rr9QZI0ld75Fty9ApL64ATgr4EhnG5b2V01bEE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ALNuJ2fSYwlIqzOW9auMS3umpkmiPls84dDvZAuD9Ebk5BBGsbXt3R/+XkxLD5gnj
 ptNgiFlRHzTyS1R2aAYvV52pA/i3Kwj9iNX7DiS3/m1zvCdtCsTlZ6/HkZwuiJBwa9
 wugpdHLlM6vYxNFBTsd+pv1JzjUx4SNasZKVqMsI=
Date: Sat, 27 Jul 2024 04:09:58 +0300
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
Subject: Re: [PATCH v2 7/9] arm64: dts: renesas: r9a07g043u: Add fcpvd node
Message-ID: <20240727010958.GI300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-8-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-8-biju.das.jz@bp.renesas.com>
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

On Tue, Jul 09, 2024 at 02:51:45PM +0100, Biju Das wrote:
> Add fcpvd node to RZ/G2UL SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> index 15e84a5428ef..d88bf23b0782 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -142,6 +142,17 @@ vspd: vsp@10870000 {
>  		renesas,fcp = <&fcpvd>;
>  	};
>  
> +	fcpvd: fcp@10880000 {
> +		compatible = "renesas,r9a07g043u-fcpvd", "renesas,fcpv";
> +		reg = <0 0x10880000 0 0x10000>;
> +		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
> +			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
> +		clock-names = "aclk", "pclk", "vclk";
> +		power-domains = <&cpg>;
> +		resets = <&cpg R9A07G043_LCDC_RESET_N>;
> +	};
> +
>  	irqc: interrupt-controller@110a0000 {
>  		compatible = "renesas,r9a07g043u-irqc",
>  			     "renesas,rzg2l-irqc";

-- 
Regards,

Laurent Pinchart
