Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D644C3ED55
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 08:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A4010EA37;
	Fri,  7 Nov 2025 07:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sIgbO3bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFE310EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 07:57:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1F9A46013B;
 Fri,  7 Nov 2025 07:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F47C4CEF8;
 Fri,  7 Nov 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762502265;
 bh=xM6b+hhLff+TvwOs6RF++4PTmGDEuvRO5iMSfFtRhTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sIgbO3bu1JxVbD8WoPHAv7Hp9H/BLfgVlz9TcoFrefdlJwNMfVEla+LywVc2LpKsu
 MvoGpOAvR5+L+MVLH7LkmGGUYzEtvjjZ/py29ZREf9NDhlCU9CGIB/UYRiYbLWQ1/8
 Yiwi0ZehhnMaWuwlN/J1td0rHL51c1xlmdKkERBkeIoaZYWKIyC1sori0ZgJYgzQwJ
 SBwWc8F1kBMJYvhy48+UvxYWXJp8jxFP3xEG5TlKZOJmivSRxsgNYrXVe35YsM6C/f
 tyduoIqijZ9QRzMNhFnbfVnMtYCMs4mqMXmzFh94Ptp9bgTeSegwUNxn7rKpyGWVqf
 TqBSizwwDZ2wQ==
Date: Fri, 7 Nov 2025 08:57:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 louis.chauvet@bootlin.com, 
 aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 3/5] arm64: dts: ti: k3-am62-main: Add tidss
 clk-ctrl property
Message-ID: <20251107-honored-moth-of-opportunity-eecef9@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-4-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-4-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:25PM +0530, Swamil Jain wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> For am62 processors, we need to use the newly created clk-ctrl property to
> properly handle data edge sampling configuration. Add them in the main
> device tree.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index a290a674767b..2b6c033ae393 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -77,6 +77,11 @@ audio_refclk1: clock-controller@82e4 {
>  			#clock-cells = <0>;
>  		};
>  
> +		dss_clk_ctrl: dss-clk-ctrl@8300 {
> +			compatible = "ti,am625-dss-clk-ctrl", "syscon";
> +			reg = <0x8300 0x4>;

Same problem as last time. Nothing improved.

NAK

Best regards,
Krzysztof

