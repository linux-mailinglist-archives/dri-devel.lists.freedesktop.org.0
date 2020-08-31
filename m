Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D72579F3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80178996E;
	Mon, 31 Aug 2020 13:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330C48996E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:02:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831125245euoutp02cad8bf39dd258fb5135871fbd5ac8748~wW2bunUJk0388203882euoutp02_
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:52:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200831125245euoutp02cad8bf39dd258fb5135871fbd5ac8748~wW2bunUJk0388203882euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598878365;
 bh=SmTcBZLiuICpXzxyvQssXFI+J43gpEVEjnucvod5ogM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=u1Pcug4xTJiTEo6exgT7xVSeP8FVZxqxJVimHstNzAIddTxaUI2Csy8MaNT3ylqrc
 KWexJb8giU6vMBccCeGOGPnk+xOoxco1XHU5/+HWr+yC9S7zBTuUarvj2DXpPSHUtf
 yNceDOdyNkR4fcNo13JBFBzHGWy7sKHfHRE58ISA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831125244eucas1p2488adaad0d5f723a9f3859aac6d4c2f1~wW2bIp6rj2782727827eucas1p2O;
 Mon, 31 Aug 2020 12:52:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 35.B4.06456.C92FC4F5; Mon, 31
 Aug 2020 13:52:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831125244eucas1p11d293e0fd2fd24887c55e9545170df05~wW2awjcR11787317873eucas1p1r;
 Mon, 31 Aug 2020 12:52:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831125244eusmtrp2d2184684efc96aed58854a95c00eb6b8~wW2avnu371595415954eusmtrp2J;
 Mon, 31 Aug 2020 12:52:44 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-24-5f4cf29cb923
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 13.D4.06017.C92FC4F5; Mon, 31
 Aug 2020 13:52:44 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831125243eusmtip1b97368b26c3daa85d24dd62df8568c8c~wW2ZqEnZP0592605926eusmtip1A;
 Mon, 31 Aug 2020 12:52:43 +0000 (GMT)
Subject: Re: [PATCH 07/10] arm64: dts: exynos: Replace deprecated "gpios"
 i2c-gpio property in Exynos5433
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>, Sangbeom Kim
 <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f0edbf1c-fe5e-328f-bf26-18af812404f7@samsung.com>
Date: Mon, 31 Aug 2020 14:52:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-7-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1BMYRj2nXvLNqd16R1ymZ1xS1Qj+kbGbRgnzPDDMMMki6OatpU9cv0h
 ayQhLUq2IpcZ7KTYUroxknZSNiq5ddHFJUmm2twithP69zzv87zf+z7vfBypOsWM5kJ0O0S9
 TqNVMwoqu+RbxfTkzhWBXoZ8d3zcVkrg6idFBL6ZmEHj+MYWBj/rfkfjc11jcV+2kcTni200
 rrZ3MPhkQxyFTzS3kbii4gaLG+wPEO6pjiawpbmGxlV5yQxOrLhD4EOFxSy+//EwjZ9c7Sbw
 4TetJM60xJMLRgk3ugyMUNiTSgm5pjpWsJiPMEJtTQEjfLLZWCGn5zUtNBy1EkLm5f1CbJYZ
 CV2WcauGrlPM3SJqQ3aKes95GxXBX++koPAqxe7on3lEJOrgYpATB7wPJMXl0DFIwan4qwgS
 nqaSMulGUF+aNKB0IbiUZvxDuP6WV98WyPUrCJrSYwmZdCBoiKyjHO8O50Oh/P4txiGM4KNp
 OF1gph0CyacjOGhZ68AM7w0x7TGMAyv5efDlaVK/h+InQmpcL+nAI/kNUPKwiZI9LlB6tqUf
 O/GzILHSSslvjoec9mRSxq7wsuV8/0bAP+bg+/sDtJx0MdS3p7AyHg4frFkD2A36cv82HETQ
 aLvOyuQYgipDIpJdflBr+844DkDyUyEjz1MuL4TXx6IG7uIMz9td5CWc4WT2GVIuKyE6SiW7
 J4HJmv5v7L3HlWQcUpsGRTMNimMaFMf0f24qoszIVYyQwoJEyVsn7pohacKkCF3QjM3bwizo
 z1ct+2XtvI3slZuKEM8h9TDl1wfLA1W0Zqe0J6wIAUeqRygXPSrboFJu0ezZK+q3BeojtKJU
 hMZwlNpVOfNia4CKD9LsEENFMVzU/1UJzml0JDKcyu31KO8sVt8tztqq1U652Dv5Sp3L7GUe
 xpqS2ATzzTW5S/G+eoXPtTQ/o9nf7Nbk1ueV32JXznnR1puy3tpXxb51aq4fv93dL7/ZZfEF
 0pf1qOyJN/rbW32GxEvBbgHVtUt8bcqx4Y2TOlaOmjCtdvVnw+T5Ot2Pt23s7ijwVVNSsMbb
 ndRLmt+NUsJvpgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec/ZOTvTVsep+SLdGEkXa3XU6WvkkG6cyA9R37poow5quc3O
 2USLSAxxLTUNLFta+5BRUmqbeSONZiVSzVLTKGVFWpm38DI1zJpbwb79n8vv+fPAn8Jld4hQ
 KlWr53itOk1O+oleLrT1by6bSEjaem1Bigoc7RjqfmvH0MPSagKVfB4gUe/UNwLdnFyJ/tQV
 4+jWMweBuqfHSXTFWSRCl78M46ijo0aMnNPPAXJ1GzFk/dJDoK6mMhKVdrRgKLf5mRi1juQR
 6O3dKQzlDQ7hyGYtweOXszWTOSTb7LKI2EZzv5i1Vl4k2b6exyQ75nCI2XrXJ4J1XmrDWNvt
 82xhbSVgJ62r9vsfUmzndQY9tyZFJ+jj5IcZFKFgYpEiIipWwUTGHN0WoZRvUW0/waWlZnD8
 FtUxRcpsSzlI7/LLNP5uwrLBOGUCFAXpKPhxLt4E/CgZXQHgrMuKm4DE3V8B269mE14dCOd7
 TKR3aRTAod4e0eIgkD4FX7U+8gyC6HwCXqjIxxcLnK4CcNiWQ3gRG4D9I4MehKQZaBpdvCWh
 pLQKzry74fEQ0WHQUjTv8Q6mE+Gr/O//dgJg+/UBDyuhlbC0s82jcToa3rR9xr16NawfLfun
 Q+CHgVtYEZCZfXCzD2L2Qcw+iAWIKkEQZxA0yRohQiGoNYJBm6w4rtNYgTsjdS/mahuAaeyg
 HdAUkC+Rzj7flyQj1BlClsYOIIXLg6Q7Xr9MlElPqLPOcLwuiTekcYIdKN3PFeOhwcd17sRp
 9UmMkolBsUxMZExkNJKHSI300yMyOlmt505xXDrH/+cwShKaDUr897YWPKl64Lg2dc5YF9hn
 7xUKT8ZP79m5rlPB385eGErvzD0Q/nXmvXPDYKqkMQSc3mNp61g/q01nhJ/OH2R15rKmhJHq
 N7UNzsLxIEfX2YTd+9ZOuA4u7deHOX5Jy8Gnzin5kwDl/eTUXara+U3FfDlXN7k0/N6BgOVl
 l2vi5CIhRc1sxHlB/RcIDXlzOQMAAA==
X-CMS-MailID: 20200831125244eucas1p11d293e0fd2fd24887c55e9545170df05
X-Msg-Generator: CA
X-RootMTR: 20200829142552eucas1p2235983e40ccd14b929a0375a1e696ec8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142552eucas1p2235983e40ccd14b929a0375a1e696ec8
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142552eucas1p2235983e40ccd14b929a0375a1e696ec8@eucas1p2.samsung.com>
 <20200829142501.31478-7-krzk@kernel.org>
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
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 29.08.2020 16:24, Krzysztof Kozlowski wrote:
> "gpios" property is deprecated.  Update the Exynos5433 DTS to fix
> dtbs_checks warnings like:
>
>    arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'sda-gpios' is a required property
>    arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'scl-gpios' is a required property
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 250fc01de78d..6246cce2a15e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -87,8 +87,8 @@
>   
>   	i2c_max98504: i2c-gpio-0 {
>   		compatible = "i2c-gpio";
> -		gpios = <&gpd0 1 GPIO_ACTIVE_HIGH /* SPK_AMP_SDA */
> -			 &gpd0 0 GPIO_ACTIVE_HIGH /* SPK_AMP_SCL */ >;
> +		sda-gpios = <&gpd0 1 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&gpd0 0 GPIO_ACTIVE_HIGH>;
>   		i2c-gpio,delay-us = <2>;
>   		#address-cells = <1>;
>   		#size-cells = <0>;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
