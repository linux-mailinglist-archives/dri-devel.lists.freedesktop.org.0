Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE051BAFC
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B8A10F87A;
	Thu,  5 May 2022 08:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 08:51:02 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0453810F87A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651740659;
 bh=xx/4O0ev2h+cTTB8VZtp7yVZgwGZrAIwxUX58uMFqq0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dzorFjTn4/ngd2Wi1+CzEdJA1yFsaLr3Wo/+a6qwTw2YNJJoDL8gYsHD2LynIQKiE
 zPhmvvmXoFKWI0b3uGIGPUbfU1arWWiJV1BupyrfwKTvAPITzoIk+vSyXCKrPaP9Ba
 XYwvl+OYN7bU1AQ0lCQqEL0G6RbHFOKP88eudkdo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.145.208] ([217.61.145.208]) by web-mail.gmx.net
 (3c-app-gmx-bs47.server.lan [172.19.170.99]) (via HTTP); Thu, 5 May 2022
 10:45:03 +0200
MIME-Version: 1.0
Message-ID: <trinity-bfbffcba-d1ed-40f7-8f37-0c8ad9245e3c-1651740303894@3c-app-gmx-bs47>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Aw: [PATCH v11 17/24] arm64: dts: rockchip: rk356x: Add HDMI nodes
Content-Type: text/plain; charset=UTF-8
Date: Thu, 5 May 2022 10:45:03 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220422072841.2206452-18-s.hauer@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-18-s.hauer@pengutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:jhHeBB0cVrPpmyuSV8dkcZkfMMoOV6qVeNwsgrvv2BcHyrAD72naC0el219Z5ID+Z/Re/
 5cFt0p836fqtEg3/WBhTIHvozZg+qauPcPv2V/HiN+36OxKfXenbX8mkMkS9cP2hLcbpAH94/XF2
 Ee6ya9jarBvfYFc40yW1cB6jkU4h5+hrxI+2CoRz8QUdvDTl7CO0aKJbcxroi4icmuounMlaKfuM
 CBLLu9ZCJdj7X2zTm/5V/04h2hTpMkujwQRLAsZ33x0MlM6NRmewtbu3BWtKgTAXxCzJT8uuXB02
 xo=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YjcJVrEXibw=:A+AcC61IRY3bgBtsRF2dxM
 KoNFfmwNHFfjXx3BBKcBL9F0aHsQiub4Q2/pq/bDSyq6fBVBD1GHe/MD28Pyk/cv3lG/of2Ky
 D+dlcreePP1MuT/EQHLcIyPuOVRA1w5H/4oeb3hMR8ee3cJ3xbmAzMdOvKLCd/RXzMRwhKIM4
 vU6fTtI8OHXtcPK8pchQ4H5zfDld5VJylfVJgSzQKlVOfF8GrL/LdJeDHb8/+mZg5e2nWFoH6
 DG4t4Ah0/ryFtQDCW2sinlypVG+NjzQFoI1HxHjsziD2Aj+UfRfw4L2q6iONPxu/72jNMkz47
 fsET8vr27rk+VP99SPN2iK6WVI4XxTdwqmLqjsqpa1iBny8I/MIm83PrFRt/3s6THtkjU2lb2
 34RB4NO/AqaiIzTDb5mZvk1mT62vfC964yPu1p71QjAS82YE09LdNOfPHBsRf7FGo16Wx4iDe
 tCFcha8GCsmocstBhh2YO57RRMOk1cgmfdsXhpLh4S+vBGEetSxMKjuN9p6ER7UwCfNwwVNWj
 4VM3fhBqAMk52Lhi8OC4vIAPfTsEwy78D4w0eUUOkQFsraaWd0F6K1Zr3+WjYmNyl1mmYMvqQ
 HNxjNlysuqshfcmdFuwjyVbIyNPmUspSFFwiKkYNhJMvOsNS7XOB6VlygGgq6OpwSrfwVauzC
 bFywJkP936xmj+46WW1Rtmeq0UC/8t6LU+lvyRxOfcEBOhjVOJx6vjIHm949j/RuEnKmY+JyK
 U97uSssGRhUHt3KfU19gxqOXAVYbVRvwWM/85B1LHBuK8qyEs+bKb+zYcqitexrcSueSGz9SK
 h4ILt93
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Gesendet: Freitag, 22. April 2022 um 09:28 Uhr
> Von: "Sascha Hauer" <s.hauer@pengutronix.de>
> Betreff: [PATCH v11 17/24] arm64: dts: rockchip: rk356x: Add HDMI nodes
>
> Add support for the HDMI port found on RK3568.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>
> Notes:
>     Changes since v7:
>     - Rename hclk to niu

clock-name no more present since v9, see below

>     Changes since v5:
>     - Drop unnecessary #size-cells/#address-cells from nodes with only s=
ingle endpoint
>
...
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -620,6 +620,38 @@ vop_mmu: iommu@fe043e00 {
>  		status =3D "disabled";
>  	};
>
> +	hdmi: hdmi@fe0a0000 {
> +		compatible =3D "rockchip,rk3568-dw-hdmi";
> +		reg =3D <0x0 0xfe0a0000 0x0 0x20000>;
> +		interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru PCLK_HDMI_HOST>,
> +			 <&cru CLK_HDMI_SFR>,
> +			 <&cru CLK_HDMI_CEC>,
> +			 <&pmucru CLK_HDMI_REF>,
> +			 <&cru HCLK_VO>;
> +		clock-names =3D "iahb", "isfr", "cec", "ref";

noticed there are still 5 clocks, but only 4 clock-names. So i added "niu"=
 after ref.
maybe missing clock-name was causing my iommu page-faults...on a quick tes=
t i have not got it,
but they came not every time.

what do you think?

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;
> +		power-domains =3D <&power RK3568_PD_VO>;

regards Frank
