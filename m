Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F013E1B9845
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B478930A;
	Mon, 27 Apr 2020 07:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1202D6E29B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587905650; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGs1VbCXpq3w2bD385Ag0nyW5WilZcot3VZIcHvBKBA=;
 b=WgSWzgZ1oOoj+AbGcqvEGtTfzTVBQzFedGQ2dDOe/N42jNpWaMGtbZ3E/vaikqD/2rDXMX
 hI+YRAoyaapaSEK8YkTDlcs5PrVwEmccrvT5wN9dnpAtejFz81BMJMROx42MAEjI5115H4
 Ljp1howOILhfEB60hF1DGes1umRV6U4=
Date: Sun, 26 Apr 2020 14:53:55 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 09/12] ARM: dts: sun6i: a31: add sgx gpu child node
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <VTBE9Q.B8A32JWI2Q9V3@crapouillou.net>
In-Reply-To: <47740d708e00632735a8c1957109ca349029c716.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <47740d708e00632735a8c1957109ca349029c716.1587760454.git.hns@goldelico.com>
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



Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> From: Philipp Rossak <embed3d@gmail.com>
> =

> We are adding the devicetree binding for the PVR-SGX-544-115 gpu.
> =

> This driver is currently under development in the openpvrsgx-devgroup.
> Right now the full binding is not figured out, so we provide here a
> placeholder. It will be completed as soon as there is a demo =

> available.
> =

> The currently used binding that is used during development is more
> complete and was already verifyed by loading the kernelmodule =

> successful.
> =

> Signed-off-by: Philipp Rossak <embed3d@gmail.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> =

> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi =

> b/arch/arm/boot/dts/sun6i-a31.dtsi
> index f3425a66fc0a..933a825bf460 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -1417,5 +1417,16 @@ p2wi: i2c@1f03400 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  		};
> +
> +		gpu: gpu@1c400000 {
> +			compatible =3D "allwinner,sun8i-a31-sgx544-115",
> +				     "img,sgx544-115", "img,sgx544";
> +			reg =3D <0x01c40000 0x10000>;
> +			/*
> +			 * This node is currently a placeholder for the gpu.
> +			 * This will be completed when a full demonstration
> +			 * of the openpvrsgx driver is available for this board.
> +			 */

This node doesn't have clocks, so I don't see how it'd work.

Better delay the introduction of the GPU node for this board until you =

know it works.

-Paul

> +		};
>  	};
>  };
> --
> 2.25.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
