Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F368D257502
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 10:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7892289A67;
	Mon, 31 Aug 2020 08:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F4E89A67
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:11:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831081105euoutp02263b9b45cd8cdebac72c1be464a7e816~wTAgEZ5GZ1070110701euoutp02B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:11:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200831081105euoutp02263b9b45cd8cdebac72c1be464a7e816~wTAgEZ5GZ1070110701euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598861465;
 bh=L4Y2MN3eNaoXj8sBu+7wSf3vN95kUkOb7XJy86InDnk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LIRDAs+NO3B50ImcVa8Ersph4f/eDz47G/BZI2mJ0XiRpZMZS6eDfeRdXCXmjTF3w
 uQgVGvSAPhQhuPftETYdA5YwJSIG0JxOCpdlfqnTi2O8mjxpIt4wY+uQ8Rls8OMk2x
 X9Noa8BFq/WJBDoDkBeLrlHsNnGBs+NvCa2uIfL4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831081104eucas1p2e204496088d78ba11d4e40ff2d2a5868~wTAfocBas1051910519eucas1p2v;
 Mon, 31 Aug 2020 08:11:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 35.77.06456.890BC4F5; Mon, 31
 Aug 2020 09:11:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831081104eucas1p1be98b7d24013fce8e37c886a1734f427~wTAfNSYbX1551415514eucas1p1L;
 Mon, 31 Aug 2020 08:11:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831081104eusmtrp2346272fc0075a1cef0f7f0b5b62a4bb2~wTAfLi2R80483604836eusmtrp2l;
 Mon, 31 Aug 2020 08:11:04 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-63-5f4cb0986128
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D7.8C.06017.790BC4F5; Mon, 31
 Aug 2020 09:11:04 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200831081103eusmtip25d8e3e346e91aaefcc0a51d457ad9895~wTAeXZGpx0707407074eusmtip2b;
 Mon, 31 Aug 2020 08:11:03 +0000 (GMT)
Subject: Re: [RFT 3/4] ARM: dts: exynos: Move CMU assigned ISP clocks to
 buses in Exynos3250
To: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Hoegeun Kwon
 <hoegeun.kwon@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <6ed67a82-0f29-7384-203d-dcb2e58c5a8d@samsung.com>
Date: Mon, 31 Aug 2020 10:11:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200829172532.29358-3-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3cuO45mZ0vxoSucKDKykm6HiqjWh8PqQ1R+CbysOpjkpmxO
 M6LUyLVp97Q1Vo4uNMy0dGmzUhJzmDlLTcMM71TasLJZRrS2HS2//f/P83uf//PAS2HyD8Qc
 KkmTxms1qmSGlOCVDRPuKPP9nfGrbvfOZ8+4G0XsA3MZwfoqL2BsUb2bYNu9oyQ7esdEsucG
 RjC2peW+mC0f6CDYtmoryZpbakTsqaf1YtY+8RCxhqFPGDtRfR3fMot7Om7DOaflvZgrLzaS
 XNV4L8H15LlEXMWtE9ytwjckd9ZRjLix8gW7QvZJNh3kk5PSee3KzQmSQzmGcZT6I/xI4UtF
 FqqQmVAIBfQacBZ8xU1IQslpO4Jsw01SMN8RXMy+hgQzhuBjZx459WTYbZyk7iB4cMkqFswo
 go5+Kx6gZtNxUHLTFWyE0a8xKO1pDjYwmofHngYioEk6GkweU3CslN4MDl9BkMHpxfDO2BVk
 wv2DGl704wIjg8arg0EdQq+Fz/kvMGHmQqjyWCd1BHQNFokCwUCfouBsfi0u7L0dip90TOrZ
 MOxyiAU9D3zOqQcnEfS574kFk4+gLceMBGojdLt/+Vel/BGRUFa9Uihvhc673eJAGehQeOuR
 CUuEwsXKK5hQlsLpXLlALwGLq/Rf7LNXrdh5xFimnWaZdo5l2jmW/7k2hBejCF6vUyfyumgN
 n7FCp1Lr9JrEFQdS1OXI//2a/ri+PULe1v11iKYQM1P68/mOeDmhStdlqusQUBgTJt3W3BQn
 lx5UZR7ltSnxWn0yr6tDcymciZCuvvEpVk4nqtL4wzyfymunuiIqZE4WimqKdQw9L/wS6VXk
 RB1vupy5LmPEpqjdmNssa4C8VKfSFqP0qvTblDHaLs/pdGZhHx/ZvXRYs5xQ1/wuklgWpRu+
 xCmrQrkNf8baH9Xsti9SZDeWpM60J4zaDjhlZsOx3L4BR62JGNljZ3131+fqY7LMDleBcYbC
 G8+c38vgukOq6GWYVqf6C6EOk+d6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xe7ozNvjEG+z/xmjRe+4kk8XGGetZ
 Lf5vm8hsMf/IOVaLK1/fs1m8X97FZtH/+DWzxfnzG9gtNj2+xmpxedccNosZ5/cxWbTuPcJu
 seLnVkaL9qcvmS1+7prH4sDvsffbAhaPnbPusntsWtXJ5rH92wNWj/vdx5k8Ni+p91gy7Sqb
 R9+WVYwenzfJBXBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZk
 lqUW6dsl6GU0tX9jLPguWjHtjHMD42bBLkZODgkBE4lX5zrZuhi5OIQEljJK/NvUywyRkJE4
 Oa2BFcIWlvhzrQuq6C2jRO+P0+wgCWGBOInjh2+ygCREBC4yS2xaNwcswSyQKjGxaSoTRMdm
 Ronpe+4zgiTYBAwlut6CjOLk4BWwk9jyfyoLiM0ioCpxu/MW2DpRoKlnel5A1QhKnJz5BKyG
 U8BU4k3PKWaIBWYS8zY/hLLlJba/nQNli0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKp
 pcW56bnFRnrFibnFpXnpesn5uZsYgdG+7djPLTsYu94FH2IU4GBU4uH9cdQ7Xog1say4MvcQ
 owQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BnpvILCWanA9MRHkl8YamhuYWlobmxubG
 ZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhjNlru53dh6fdvWlj8iKTP5s0599Sya+uXn
 g/7yTXu658dn/DnYw7CrMDP/v/6mNw+vtIo8557/Iep+6JaKrR8Lp6+N5hM4m6x+0+yYu4zz
 iQ1rrt/kUOpw8z/3b9KJGJe5NZNsL10Iu+7Ne98hVJL/xcXXV9TiVujc8jih5fM89PuxsJ9L
 EuPclViKMxINtZiLihMByz1vjgwDAAA=
X-CMS-MailID: 20200831081104eucas1p1be98b7d24013fce8e37c886a1734f427
X-Msg-Generator: CA
X-RootMTR: 20200829172553eucas1p1b62ad1cac6e0eea1dbb4669f09949419
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829172553eucas1p1b62ad1cac6e0eea1dbb4669f09949419
References: <20200829172532.29358-1-krzk@kernel.org>
 <CGME20200829172553eucas1p1b62ad1cac6e0eea1dbb4669f09949419@eucas1p1.samsung.com>
 <20200829172532.29358-3-krzk@kernel.org>
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

Hi Krzysztof,

On 29.08.2020 19:25, Krzysztof Kozlowski wrote:
> Commit 52005dece527 ("ARM: dts: Add assigned clock parents to CMU node
> for exynos3250") added assigned clocks under Clock Management Unit to
> fix hangs when accessing ISP registers.
>
> This is not the place for it as CMU does not have a required "clocks"
> property:
>
>    arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Not tested and I wonder whether actually correct. For example, what will
> happen if devfreq (exynos-bus) is not built in?
>
> Could someone verify it?

Sorry, but this patch is not correct. Those clocks has noting with 
bus-freq. The assigned clocks property should stay where it is. Maybe 
one need to fix the schemas for dts verification. Those clocks has to be 
set (and so generic clock framework does) according to the assigned 
clocks properties once the clock controller is instantiated.

The only alternative would be to add exynos-subcmu variant to properly 
link CMU with the ISP power domain, but assuming that there is no Exynos 
3250 ISP driver in mainline (and probably never will be), it is safe to 
keep those clocks sourced from 24MHz crystal.


> ---
>   arch/arm/boot/dts/exynos3250.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index c67c70e46794..6d467022d929 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -214,10 +214,6 @@
>   			compatible = "samsung,exynos3250-cmu";
>   			reg = <0x10030000 0x20000>;
>   			#clock-cells = <1>;
> -			assigned-clocks = <&cmu CLK_MOUT_ACLK_400_MCUISP_SUB>,
> -					  <&cmu CLK_MOUT_ACLK_266_SUB>;
> -			assigned-clock-parents = <&cmu CLK_FIN_PLL>,
> -						 <&cmu CLK_FIN_PLL>;
>   		};
>   
>   		cmu_dmc: clock-controller@105c0000 {
> @@ -835,6 +831,8 @@
>   			compatible = "samsung,exynos-bus";
>   			clocks = <&cmu CLK_DIV_ACLK_400_MCUISP>;
>   			clock-names = "bus";
> +			assigned-clocks = <&cmu CLK_MOUT_ACLK_400_MCUISP_SUB>;
> +			assigned-clock-parents = <&cmu CLK_FIN_PLL>;
>   			operating-points-v2 = <&bus_mcuisp_opp_table>;
>   			status = "disabled";
>   		};
> @@ -843,6 +841,8 @@
>   			compatible = "samsung,exynos-bus";
>   			clocks = <&cmu CLK_DIV_ACLK_266>;
>   			clock-names = "bus";
> +			assigned-clocks =  <&cmu CLK_MOUT_ACLK_266_SUB>;
> +			assigned-clock-parents = <&cmu CLK_FIN_PLL>;
>   			operating-points-v2 = <&bus_isp_opp_table>;
>   			status = "disabled";
>   		};

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
