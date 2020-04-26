Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8E1B984F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F3789DBC;
	Mon, 27 Apr 2020 07:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8485D89B05
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587905821; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VP/mAC4xwNDT9V91K8RLHYB6nE7AooWd1wTlk6uRfp4=;
 b=AbMvu2fRXjCFm6r4XAiK02os0W+/STwoQ44/jocLsIYNNVAtsKI7bA90aQ74cVvhs5lLan
 y4d+F5TbWTAuE/jofT7aZmiSn7uZjLRQedgWMMNrNJZDpCXraPxAcOa+Dvq1A+6VE+7OU/
 EEEX6kOGv5zhpzoTKdy5z9BpNqSjfRo=
Date: Sun, 26 Apr 2020 14:56:47 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <NYBE9Q.YH08US7A7DC3@crapouillou.net>
In-Reply-To: <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
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
> From: Jonathan Bakker <xc-racer2@live.ca>
> =

> All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.
> =

> There is no external regulator for it so it can be enabled by default.
> =

> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> =

> diff --git a/arch/arm/boot/dts/s5pv210.dtsi =

> b/arch/arm/boot/dts/s5pv210.dtsi
> index 2ad642f51fd9..abbdda205c1b 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
>  			#interrupt-cells =3D <1>;
>  		};
> =

> +		gpu: gpu@f3000000 {
> +			compatible =3D "samsung,s5pv210-sgx540-120";
> +			reg =3D <0xf3000000 0x10000>;
> +			interrupt-parent =3D <&vic2>;
> +			interrupts =3D <10>;
> +			clock-names =3D "core";
> +			clocks =3D <&clocks CLK_G3D>;
> +
> +			assigned-clocks =3D <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
> +			assigned-clock-rates =3D <0>, <66700000>;
> +			assigned-clock-parents =3D <&clocks MOUT_MPLL>;

What are these clocks for, and why are they reparented / reclocked?

Shouldn't they be passed to 'clocks' as well?

-Paul

> +		};
> +
>  		fimd: fimd@f8000000 {
>  			compatible =3D "samsung,s5pv210-fimd";
>  			interrupt-parent =3D <&vic2>;
> --
> 2.25.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
