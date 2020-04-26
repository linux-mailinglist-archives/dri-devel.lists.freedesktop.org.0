Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60AD1B9848
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4815E89332;
	Mon, 27 Apr 2020 07:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611546E090
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587905451; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSLBf9Fagf4q+HhwxFOFootc8dZMFZo1PVNBvnmStFM=;
 b=EE3tEVxRcTYljO+UifVqubFUQrC6iAs/RgFg4h5hzwmgAYOrQ//6ynWjCqU3jLthKM680I
 w4zrgopXWxMruQHZLwU9wrdD4t2QmfxnpJ9QHuBFsFR9VT00zMgd+L6pZkn0GZNklEZs4M
 RG+3Oi3W8AcC1Pwg4rvYx8qpse7EG9k=
Date: Sun, 26 Apr 2020 14:50:37 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 06/12] ARM: DTS: omap4: add sgx gpu child node
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <DOBE9Q.00IRKFIW0JMG@crapouillou.net>
In-Reply-To: <5f493a50fedef45c3cacd91cbf999092d9c05164.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <5f493a50fedef45c3cacd91cbf999092d9c05164.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?iso-8859-1?q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> Add SGX GPU node with interrupt. Tested on PandaBoard ES.
> =

> Since omap4420/30/60 and omap4470 come with different SGX variants
> we need to introduce a new omap4470.dtsi. If an omap4470 board
> does not want to use SGX it is no problem to still include
> omap4460.dtsi.
> =

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/omap4.dtsi   | 11 ++++++-----
>  arch/arm/boot/dts/omap4470.dts | 15 +++++++++++++++
>  2 files changed, 21 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/boot/dts/omap4470.dts
> =

> diff --git a/arch/arm/boot/dts/omap4.dtsi =

> b/arch/arm/boot/dts/omap4.dtsi
> index 763bdea8c829..15ff3d7146af 100644
> --- a/arch/arm/boot/dts/omap4.dtsi
> +++ b/arch/arm/boot/dts/omap4.dtsi
> @@ -389,7 +389,7 @@ abb_iva: regulator-abb-iva {
>  			status =3D "disabled";
>  		};
> =

> -		target-module@56000000 {
> +		sgx_module: target-module@56000000 {
>  			compatible =3D "ti,sysc-omap4", "ti,sysc";
>  			reg =3D <0x5600fe00 0x4>,
>  			      <0x5600fe10 0x4>;
> @@ -408,10 +408,11 @@ target-module@56000000 {
>  			#size-cells =3D <1>;
>  			ranges =3D <0 0x56000000 0x2000000>;
> =

> -			/*
> -			 * Closed source PowerVR driver, no child device
> -			 * binding or driver in mainline
> -			 */
> +			gpu: gpu@0 {
> +				compatible =3D "ti,omap4-sgx540-120", "img,sgx540-120", =

> "img,sgx540";
> +				reg =3D <0x0 0x2000000>;	/* 32MB */
> +				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +			};
>  		};
> =

>  		/*
> diff --git a/arch/arm/boot/dts/omap4470.dts =

> b/arch/arm/boot/dts/omap4470.dts
> new file mode 100644
> index 000000000000..f29c581300bf
> --- /dev/null
> +++ b/arch/arm/boot/dts/omap4470.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Device Tree Source for OMAP4470 SoC
> + *
> + * Copyright (C) 2012 Texas Instruments Incorporated - =

> http://www.ti.com/
> + *
> + * This file is licensed under the terms of the GNU General Public =

> License
> + * version 2.  This program is licensed "as is" without any warranty =

> of any
> + * kind, whether express or implied.
> + */
> +#include "omap4460.dtsi"
> +
> +&sgx {

Does this even compile?

The node's handle is named sgx_module, not sgx.

-Paul

> +	compatible =3D "ti,omap4470-sgx544-112", "img,sgx544-112", =

> "img,sgx544";
> +};
> --
> 2.25.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
