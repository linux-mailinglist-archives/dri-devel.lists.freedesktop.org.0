Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50592577E0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C855B6E038;
	Mon, 31 Aug 2020 11:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849236E038
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:03:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831110320euoutp0144287b11bacbf37ff36bf6b74f063c4b~wVW6J9EH32082420824euoutp01J
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:03:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200831110320euoutp0144287b11bacbf37ff36bf6b74f063c4b~wVW6J9EH32082420824euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598871801;
 bh=rdQyIH2KOZH3mhnhVLTP2HA6DF/GY37pGXwK8J6cMPY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=EUBTbbxvVZD6jTsfgMGaX0o9FOLV+ncfjYKMgCPIemGxfmmLqbsDl58YCCv19GEq8
 GXucueQNPiyRp49z4S91YuoDca+wPuKEXnsPkEiGTNRzy1jUijxW1Rx7OQxa6ITva9
 KzEQJI6qESkukdVe3OxZv0m0UvQnisPUZ7Y7ALvI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831110320eucas1p2765da242473e9988f32f057578943200~wVW55A-OD0430004300eucas1p2t;
 Mon, 31 Aug 2020 11:03:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 04.83.06456.8F8DC4F5; Mon, 31
 Aug 2020 12:03:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200831110320eucas1p218471e8d1a63955970f53645eac0d2f9~wVW5dXzvR2473124731eucas1p2E;
 Mon, 31 Aug 2020 11:03:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200831110320eusmtrp1db8dd80652955c7991139c8c05960840~wVW5ckhvL1245712457eusmtrp10;
 Mon, 31 Aug 2020 11:03:20 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-57-5f4cd8f87567
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F7.A5.06017.8F8DC4F5; Mon, 31
 Aug 2020 12:03:20 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831110319eusmtip1f2c6861d2f1bddd76c9598166476d1be~wVW4m3u761056310563eusmtip1K;
 Mon, 31 Aug 2020 11:03:19 +0000 (GMT)
Subject: Re: [RFT 2/4] ARM: dts: exynos: Move fixed clocks under root node
 in Exynos3250
To: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Hoegeun Kwon
 <hoegeun.kwon@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1700b99a-4b57-2aa2-50f5-a2dcf32b037e@samsung.com>
Date: Mon, 31 Aug 2020 13:03:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200829172532.29358-2-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0iTYRjl3XfZt+HsdVo+WRQNCgrSJKsXi9mN+qIi//THSJ35YdY2ZUvL
 qJTsout+QW1Jmo0UIS+rtDTTxDZqOEstxMrMC2RlK6emIlrzs/LfOec95znPAy9HKXuZAC5e
 f0gw6DVaFSunK2yjzuUjbTuiVjzLVpELzhcSUp5TypDJiisUyWtwMqR1yMUSV6GJJZe6v1Kk
 qalMSqzdbxnSUpXLkpympxJyuqZBSopGHyJytrePIqNVt+j1s/ia4Xyaf2z+IOWtxZksXznc
 yfAfz9kl/H1LKm/JesPyFx8UI95tXRAui5CvixW08cmCIUgdLd8/ONLIJFrwkfEfQ9I0ZPcy
 IRkHOARcZdmsCck5JS5C0NzezohkEIErq2+auBHcsX9m/0aum0unsBIXIkjL3CaaXAheWbP+
 JDjOF0dAdkOoR/fDryko+dhIewIUFqC638Z4MIuDwdRvmhqkwGr4NvABeTCNF0NvX9cUno0j
 wfayixY9PvDiRg/tmS/Dq+BJtUwcuRAq+3MpEftDe0+exNMLOJODi3Wj00tvhvKyd1IR+8IX
 +4NpPB8c187TYiAdwSfnPalIziNoOZmDRNdaeO8cYz3NFF4KpVVBorwB8nPuSjwyYG9o6/cR
 l/CGqxXZlCgrIOOMUnQvAbO95F/ts1fN1GWkMs+4zDzjHPOMc8z/e/MRXYz8hSSjLk4wBuuF
 w4FGjc6YpI8L3Jegs6I/n88xYR94hIaaY+oR5pDKSzHyfHuUktEkG1N09Qg4SuWn2NjoiFQq
 YjUpRwVDQpQhSSsY69E8jlb5K1YW9O1V4jjNIeGgICQKhr+vEk4WkIbUc0PDrjmCSPv7A9qr
 N8ITe9SFIbmpJL1h0U/ZzjO24Qjt7T21zbEThtbvYd4dnQF1W21mR8av0pqU+IrxH9Z3ae6D
 a0tUBf6Jk5Zj5ZZz+iyH/fPDU+HHi2tvajN2r4kp+ZK8y13gu3pTx824OS/ldVvGkqt1nHtp
 VbT66HCK3wkVbdyvCV5GGYya34zPjj94AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xu7o/bvjEG3T+YbXoPXeSyWLjjPWs
 Fv+3TWS2mH/kHKvFla/v2SzeL+9is+h//JrZ4vz5DewWmx5fY7W4vGsOm8WM8/uYLFr3HmG3
 WPFzK6NF+9OXzBY/d81jceD32PttAYvHzll32T02repk89j+7QGrx/3u40wem5fUeyyZdpXN
 o2/LKkaPz5vkAjij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMy
 y1KL9O0S9DK+/DjLWrBEoOLPh6/sDYzHeboYOTkkBEwkpsxaz9bFyMUhJLCUUWLy7gWMEAkZ
 iZPTGlghbGGJP9e6oIreMkrs2/AOrEhYIEri+swmZpCEiMBFZolN6+awgySYBVIlJjZNZYLo
 2MwocftiKxtIgk3AUKLrbReYzStgJ/Hm012wSSwCqhJPXz4Cs0UF4iTO9LyAqhGUODnzCUsX
 IwcHp4CpxJ7dnBDzzSTmbX7IDGHLS2x/OwfKFpe49WQ+0wRGoVlIumchaZmFpGUWkpYFjCyr
 GEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAqN927GfW3Ywdr0LPsQowMGoxMP746h3vBBrYllx
 Ze4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoC/TaRWUo0OR+YiPJK4g1NDc0tLA3N
 jc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDK7847FXz+bE6RjY+kLOOyR26HA+7M
 ePdvoe/HpG/KrHHuE3fcuDGVva5E70L1zW9bzFZcSzG7lXLtlJxp/6rv0nvEQhfaLVp187/r
 uZ+hBnmaTMvOSbB+4Z144Ghi+tUbHyWN5pa1GV+ayiNVYnvsh6Xkuv5LRyS79+ae79f95voi
 fRNbQoegEktxRqKhFnNRcSIAjNR2mgwDAAA=
X-CMS-MailID: 20200831110320eucas1p218471e8d1a63955970f53645eac0d2f9
X-Msg-Generator: CA
X-RootMTR: 20200829172549eucas1p15e565c0703d5c5abf5527dfe7b03a602
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829172549eucas1p15e565c0703d5c5abf5527dfe7b03a602
References: <20200829172532.29358-1-krzk@kernel.org>
 <CGME20200829172549eucas1p15e565c0703d5c5abf5527dfe7b03a602@eucas1p1.samsung.com>
 <20200829172532.29358-2-krzk@kernel.org>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.08.2020 19:25, Krzysztof Kozlowski wrote:
> The fixed clocks are kept under dedicated node fixed-rate-clocks, thus a
> fake "reg" was added.  This is not correct with dtschema as fixed-clock
> binding does not have a "reg" property:
>
>    arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   arch/arm/boot/dts/exynos3250.dtsi | 42 +++++++++++++------------------
>   1 file changed, 17 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index d3fb45a56527..c67c70e46794 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -97,33 +97,25 @@
>   		};
>   	};
>   
> -	fixed-rate-clocks {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		xusbxti: clock@0 {
> -			compatible = "fixed-clock";
> -			reg = <0>;
> -			clock-frequency = <0>;
> -			#clock-cells = <0>;
> -			clock-output-names = "xusbxti";
> -		};
> +	xusbxti: clock-0 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		#clock-cells = <0>;
> +		clock-output-names = "xusbxti";
> +	};
>   
> -		xxti: clock@1 {
> -			compatible = "fixed-clock";
> -			reg = <1>;
> -			clock-frequency = <0>;
> -			#clock-cells = <0>;
> -			clock-output-names = "xxti";
> -		};
> +	xxti: clock-1 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		#clock-cells = <0>;
> +		clock-output-names = "xxti";
> +	};
>   
> -		xtcxo: clock@2 {
> -			compatible = "fixed-clock";
> -			reg = <2>;
> -			clock-frequency = <0>;
> -			#clock-cells = <0>;
> -			clock-output-names = "xtcxo";
> -		};
> +	xtcxo: clock-2 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		#clock-cells = <0>;
> +		clock-output-names = "xtcxo";
>   	};
>   
>   	pmu {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
