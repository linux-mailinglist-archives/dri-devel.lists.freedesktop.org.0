Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB325FA17
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 14:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207CA6E43A;
	Mon,  7 Sep 2020 12:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541626E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 12:03:51 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200907120349epoutp024ce4643822fde133c1e5d3d0c732af64~yfstPnYVI0251102511epoutp02X
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 12:03:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200907120349epoutp024ce4643822fde133c1e5d3d0c732af64~yfstPnYVI0251102511epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599480229;
 bh=3NQtzE/Bwf17qsJJtKLMZyPdfIG6mtSCemITWo63r/I=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LtP+BpSoo+xdz7Ys9glVsr55hKptr0B7Jw/k2PoadPye1V0zTufX4iHR3REFyRzLs
 Xj2C8J+qey+lFjZBxAyVpClERVJx8aynziEXglKHqF1KfYgjjaQHp08bdEWQ2Rah83
 6Rh+4E4pN3/MJktqMV5uc2vcIN/fBHdwyV25xsJo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200907120348epcas1p3d1d2273a4d4717a5ef2a6250133dd139~yfssOvQVN1878718787epcas1p3E;
 Mon,  7 Sep 2020 12:03:48 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.155]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4BlRl06GYhzMqYkV; Mon,  7 Sep
 2020 12:03:40 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 C2.C2.29173.C91265F5; Mon,  7 Sep 2020 21:03:40 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200907120340epcas1p12e32b7aae497190e609788868cbae126~yfsk0PLCL1158611586epcas1p1c;
 Mon,  7 Sep 2020 12:03:40 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200907120340epsmtrp26a1ff9ca97584a32692db9eea44b2872~yfskzQvpZ1568315683epsmtrp2M;
 Mon,  7 Sep 2020 12:03:40 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-9c-5f56219c2577
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BD.0A.08303.C91265F5; Mon,  7 Sep 2020 21:03:40 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200907120340epsmtip2d686ef59cc3365245253a88f1becc9f0~yfskj12ZF2418724187epsmtip2I;
 Mon,  7 Sep 2020 12:03:40 +0000 (GMT)
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <beca0d09-7d84-e363-5368-29119fd9a0f9@samsung.com>
Date: Mon, 7 Sep 2020 21:03:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAJsWRmVeSWpSXmKPExsWy7bCmvu4cxbB4g5/PdCzW9h5lsbj+5Tmr
 xdu5i1ksrnx9z2ZxoPEyo8X75V1sFpseX2O1uLxrDpvFxNsb2C1m/PjHaLFt1nI2i3W3XgNl
 V9xgs3g09T6jA59H0/tjbB6z7p9l87hz7jybx9Zbph73u48zeWxeUu/RevQXi0ffllWMHptP
 V3t83iQXwBWVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
 lpkDdL+SQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CyQK84Mbe4NC9dLzk/18rQ
 wMDIFKgwITtj0Z8NjAWvjCsWTdzB2sB4R7WLkZNDQsBE4s7G44xdjFwcQgI7GCXuXrzKDOF8
 YpRof/IMKvOZUeLZlMmsMC1TnixmhUjsYpSYvHkJlPOWUeLj8v8sIFXCAj4S1+b9AesQESiX
 aO/cDzaXWWAzs8TLDY/ZQBJsAroSX3uuM4HYvAJ2Eoev7gCKc3CwCKhITDoVDxIWFYiU2Pn0
 JTtEiaDEyZlPWEBKOAXiJbr/ioGEmQXkJba/ncMMYYtL3Hoynwni0AccEudWiUDYLhJPDz1j
 hrCFJV4d38IOYUtJfH63lw3CLpa4MvMVC8iZEgINjBL9E2dDFRlL7F86mQlkL7OApsT6XfoQ
 YUWJnb/nMkLs5ZN497WHFaREQoBXoqNNCKJETeJZwwFouMlInOpdDnWah8Tqk++YJzAqzkLy
 2Cwk38xC8s0shMULGFlWMYqlFhTnpqcWGxYYI0f2JkZw0tYy38E47e0HvUOMTByMhxglOJiV
 RHi7DoXGC/GmJFZWpRblxxeV5qQWH2I0BYb0RGYp0eR8YN7IK4k3NDUyNja2MDE0MzU0VBLn
 fXhLIV5IID2xJDU7NbUgtQimj4mDU6qBKXnRhjn7Hza+2b0ywnHifneJOetzZscU3Pb9lWhn
 Jnf09LPL5tN/KEuV3v+R+/JIPM8XxY2Mt8OfL/KZeCt0rrjfsxVTqtask2g5XOGU0Tl9Mtev
 ow6/E1fys+a+138+J8VqQbOf+8ZNa6r0OS0//+VP44qduU1ou+fdYxYtq199NbHTazE9ymL+
 /mrFivepq793PM6tt/D3O9jnPJunefKDLm6NFSEB5yWXT2T+Wzfrkp39L44FEwWWH1Y2bfP+
 MyH1Cd/eEPadfZOS9p1OZfgXWsJ4/9nkGDtvm517z1tFC2fufqNx7OCLH+desxl2JpzZ3D3L
 rjXOpi/22oTGQr5dJz4Jf7/vd+PkVs0mF3YlluKMREMt5qLiRAB2CaAzYwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsWy7bCSvO4cxbB4g3e7uC3W9h5lsbj+5Tmr
 xdu5i1ksrnx9z2ZxoPEyo8X75V1sFpseX2O1uLxrDpvFxNsb2C1m/PjHaLFt1nI2i3W3XgNl
 V9xgs3g09T6jA59H0/tjbB6z7p9l87hz7jybx9Zbph73u48zeWxeUu/RevQXi0ffllWMHptP
 V3t83iQXwBXFZZOSmpNZllqkb5fAlbHozwbGglfGFYsm7mBtYLyj2sXIySEhYCIx5cli1i5G
 Lg4hgR2MEi/6+9khEjISq/q3ACU4gGxhicOHiyFqXjNKbP48mxmkRljAR+LavD+sILaIQKXE
 5zm7mEGKmAU2M0tsnbWUCaKjl0li+vf9YFVsAroSX3uuM4HYvAJ2Eoev7mAD2cAioCIx6VQ8
 iCkqECmxc4clRIWgxMmZT1hAwpwC8RLdf8VAwswCZhLzNj9khrDlJba/nQNli0vcejKfaQKj
 0Cwk3bOQtMxC0jILScsCRpZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBUaqltYNx
 z6oPeocYmTgYDzFKcDArifB2HQqNF+JNSaysSi3Kjy8qzUktPsQozcGiJM77ddbCOCGB9MSS
 1OzU1ILUIpgsEwenVANT+KlLJcKTZWSPnO8tm79BceFhlaP/1zzIWnPBLD5C/MrfCYunel6P
 PlKZ/cd63bab4RbvOy4zCjW3CDxiWvVE3DNz7eyTSik/T/x4pmrkylT2WcvP8bqrzceGsHnW
 m5NiN7v//eTNz/C1a/1VjwseScc2nc+ey9m+Srt/9fwTgT4i0+pfNTalfS+fH951re93/72t
 h9td1mlOUmebvdZWKk760uTfsje+5etXWvKpGc/iWXrOJeCzstuq+Ej1Q6K3zyxs7z5WFPUx
 hmHyylMymobchyctjxa4ZNmk0Pxpy4b8yccZvQwe3Zzts6Ke9VSzmqXHQzaLZx57v3rr/1+5
 59mtk5oWL78ePZngtFB0qRJLcUaioRZzUXEiAGGnY1BBAwAA
X-CMS-MailID: 20200907120340epcas1p12e32b7aae497190e609788868cbae126
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200904071346epcas1p1cb8ab7f69bb5ed811d09b51078c2af4b
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <CGME20200904071346epcas1p1cb8ab7f69bb5ed811d09b51078c2af4b@epcas1p1.samsung.com>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 9/3/20 5:01 PM, Maxime Ripard wrote:
> Now that all the drivers have been adjusted for it, let's bring in the
> necessary device tree changes.
>
> The VEC and PV3 are left out for now, since it will require a more specific
> clock setup.
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your v5 patch


Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>


Best regards,

Hoegeun

> ---
>   arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  48 +++++++++++-
>   arch/arm/boot/dts/bcm2711.dtsi        | 122 ++++++++++++++++++++++++++-
>   2 files changed, 169 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> index e94244a215af..09a1182c2936 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> @@ -70,6 +70,14 @@
>   	};
>   };
>   
> +&ddc0 {
> +	status = "okay";
> +};
> +
> +&ddc1 {
> +	status = "okay";
> +};
> +
>   &firmware {
>   	firmware_clocks: clocks {
>   		compatible = "raspberrypi,firmware-clocks";
> @@ -170,6 +178,38 @@
>   			  "RGMII_TXD3";
>   };
>   
> +&hdmi0 {
> +	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
> +	clock-names = "hdmi", "bvb", "audio", "cec";
> +	status = "okay";
> +};
> +
> +&hdmi1 {
> +	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
> +	clock-names = "hdmi", "bvb", "audio", "cec";
> +	status = "okay";
> +};
> +
> +&hvs {
> +	clocks = <&firmware_clocks 4>;
> +};
> +
> +&pixelvalve0 {
> +	status = "okay";
> +};
> +
> +&pixelvalve1 {
> +	status = "okay";
> +};
> +
> +&pixelvalve2 {
> +	status = "okay";
> +};
> +
> +&pixelvalve4 {
> +	status = "okay";
> +};
> +
>   &pwm1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pwm1_0_gpio40 &pwm1_1_gpio41>;
> @@ -253,3 +293,11 @@
>   &vchiq {
>   	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>   };
> +
> +&vc4 {
> +	status = "okay";
> +};
> +
> +&vec {
> +	status = "disabled";
> +};
> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> index 00bcaed1be32..4847dd305317 100644
> --- a/arch/arm/boot/dts/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/bcm2711.dtsi
> @@ -12,6 +12,18 @@
>   
>   	interrupt-parent = <&gicv2>;
>   
> +	vc4: gpu {
> +		compatible = "brcm,bcm2711-vc5";
> +		status = "disabled";
> +	};
> +
> +	clk_27MHz: clk-27M {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <27000000>;
> +		clock-output-names = "27MHz-clock";
> +	};
> +
>   	clk_108MHz: clk-108M {
>   		#clock-cells = <0>;
>   		compatible = "fixed-clock";
> @@ -238,6 +250,27 @@
>   			status = "disabled";
>   		};
>   
> +		pixelvalve0: pixelvalve@7e206000 {
> +			compatible = "brcm,bcm2711-pixelvalve0";
> +			reg = <0x7e206000 0x100>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		pixelvalve1: pixelvalve@7e207000 {
> +			compatible = "brcm,bcm2711-pixelvalve1";
> +			reg = <0x7e207000 0x100>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		pixelvalve2: pixelvalve@7e20a000 {
> +			compatible = "brcm,bcm2711-pixelvalve2";
> +			reg = <0x7e20a000 0x100>;
> +			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
>   		pwm1: pwm@7e20c800 {
>   			compatible = "brcm,bcm2835-pwm";
>   			reg = <0x7e20c800 0x28>;
> @@ -248,10 +281,25 @@
>   			status = "disabled";
>   		};
>   
> -		hvs@7e400000 {
> +		pixelvalve4: pixelvalve@7e216000 {
> +			compatible = "brcm,bcm2711-pixelvalve4";
> +			reg = <0x7e216000 0x100>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		hvs: hvs@7e400000 {
> +			compatible = "brcm,bcm2711-hvs";
>   			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> +		pixelvalve3: pixelvalve@7ec12000 {
> +			compatible = "brcm,bcm2711-pixelvalve3";
> +			reg = <0x7ec12000 0x100>;
> +			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
>   		dvp: clock@7ef00000 {
>   			compatible = "brcm,brcm2711-dvp";
>   			reg = <0x7ef00000 0x10>;
> @@ -259,6 +307,78 @@
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   		};
> +
> +		hdmi0: hdmi@7ef00700 {
> +			compatible = "brcm,bcm2711-hdmi0";
> +			reg = <0x7ef00700 0x300>,
> +			      <0x7ef00300 0x200>,
> +			      <0x7ef00f00 0x80>,
> +			      <0x7ef00f80 0x80>,
> +			      <0x7ef01b00 0x200>,
> +			      <0x7ef01f00 0x400>,
> +			      <0x7ef00200 0x80>,
> +			      <0x7ef04300 0x100>,
> +			      <0x7ef20000 0x100>;
> +			reg-names = "hdmi",
> +				    "dvp",
> +				    "phy",
> +				    "rm",
> +				    "packet",
> +				    "metadata",
> +				    "csc",
> +				    "cec",
> +				    "hd";
> +			clock-names = "hdmi", "bvb", "audio", "cec";
> +			resets = <&dvp 0>;
> +			ddc = <&ddc0>;
> +			dmas = <&dma 10>;
> +			dma-names = "audio-rx";
> +			status = "disabled";
> +		};
> +
> +		ddc0: i2c@7ef04500 {
> +			compatible = "brcm,bcm2711-hdmi-i2c";
> +			reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
> +			reg-names = "bsc", "auto-i2c";
> +			clock-frequency = <97500>;
> +			status = "disabled";
> +		};
> +
> +		hdmi1: hdmi@7ef05700 {
> +			compatible = "brcm,bcm2711-hdmi1";
> +			reg = <0x7ef05700 0x300>,
> +			      <0x7ef05300 0x200>,
> +			      <0x7ef05f00 0x80>,
> +			      <0x7ef05f80 0x80>,
> +			      <0x7ef06b00 0x200>,
> +			      <0x7ef06f00 0x400>,
> +			      <0x7ef00280 0x80>,
> +			      <0x7ef09300 0x100>,
> +			      <0x7ef20000 0x100>;
> +			reg-names = "hdmi",
> +				    "dvp",
> +				    "phy",
> +				    "rm",
> +				    "packet",
> +				    "metadata",
> +				    "csc",
> +				    "cec",
> +				    "hd";
> +			ddc = <&ddc1>;
> +			clock-names = "hdmi", "bvb", "audio", "cec";
> +			resets = <&dvp 1>;
> +			dmas = <&dma 17>;
> +			dma-names = "audio-rx";
> +			status = "disabled";
> +		};
> +
> +		ddc1: i2c@7ef09500 {
> +			compatible = "brcm,bcm2711-hdmi-i2c";
> +			reg = <0x7ef09500 0x100>, <0x7ef05b00 0x300>;
> +			reg-names = "bsc", "auto-i2c";
> +			clock-frequency = <97500>;
> +			status = "disabled";
> +		};
>   	};
>   
>   	/*
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
