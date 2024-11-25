Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493459D83DA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 11:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E0F10E3D2;
	Mon, 25 Nov 2024 10:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="ZYfrj838";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E34F10E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 10:53:01 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 1E756262A7;
 Mon, 25 Nov 2024 11:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1732531978;
 bh=hmQWA+nwpDDcGMMWDzj5b5llGkioHK+B9GAwscWHsf8=;
 h=Received:From:To:Subject;
 b=ZYfrj838yqQBq+MD5xjL1RdFq/zTs84dqXtTqrLEVI0BvgjI7PabTQ+4t8f3ceZx1
 +bgbcTJZG7kJm4sOAnseL56ApNbSwEcXv/OEmNp6qXqdzdEkw1FK5JlaHxMKxaFuzT
 Mvi8WDOvCkgBqs6ZuhRkXzc0NC56CBxP7xMrpBfZ4ltng4O+6hYdQvaxyo0xd/x+aK
 a7I2mVi6aU8U9duQei/4IcijBLyfFagIRTjS5R4R4qCxTPaulnhlTbOLpex4GQvrdX
 d86c5tDbtN75uV2MqQ/fauaRApXM9BOtbWOQmhUhhqHd8TNHTBcouEc1vNdB8K8C75
 8VrGTNu6GvA9g==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id ADFCE7F996; Mon, 25 Nov 2024 11:52:57 +0100 (CET)
Date: Mon, 25 Nov 2024 11:52:57 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, glx@linutronix.de,
 vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com,
 agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: Re: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Message-ID: <Z0RXCYZ_7fBvpcvd@gaggiata.pivistrello.it>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-17-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-17-victor.liu@nxp.com>
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

On Mon, Nov 25, 2024 at 05:33:13PM +0800, Liu Ying wrote:
> Add display controller subsystem in i.MX8qxp SoC.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

...

> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 05138326f0a5..35cc82cbbcd1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -20,6 +20,27 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> +		dc0 = &dc0;
> +		dc0-constframe0 = &dc0_constframe0;
> +		dc0-constframe1 = &dc0_constframe1;
> +		dc0-constframe4 = &dc0_constframe4;
> +		dc0-constframe5 = &dc0_constframe5;
> +		dc0-display-engine0 = &dc0_display_engine0;
> +		dc0-display-engine1 = &dc0_display_engine1;
> +		dc0-extdst0 = &dc0_extdst0;
> +		dc0-extdst1 = &dc0_extdst1;
> +		dc0-extdst4 = &dc0_extdst4;
> +		dc0-extdst5 = &dc0_extdst5;
> +		dc0-fetchlayer0 = &dc0_fetchlayer0;
> +		dc0-fetchwarp2 = &dc0_fetchwarp2;
> +		dc0-framegen0 = &dc0_framegen0;
> +		dc0-framegen1 = &dc0_framegen1;
> +		dc0-layerblend0 = &dc0_layerblend0;
> +		dc0-layerblend1 = &dc0_layerblend1;
> +		dc0-layerblend2 = &dc0_layerblend2;
> +		dc0-layerblend3 = &dc0_layerblend3;
> +		dc0-tcon0 = &dc0_tcon0;
> +		dc0-tcon1 = &dc0_tcon1;

what would you use those aliases for?

Francesco

