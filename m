Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D0F25793E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 14:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AFE8984F;
	Mon, 31 Aug 2020 12:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5A88984F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:30:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831123056euoutp0277a757d83a6ad6c7fa34645d821a9a06~wWjYmgA6l2329123291euoutp02v
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:30:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200831123056euoutp0277a757d83a6ad6c7fa34645d821a9a06~wWjYmgA6l2329123291euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598877056;
 bh=aAdNm/dzVaND4IVjQoOGhc1gHHOhMrELO0GWHWLYSRw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YRWrwRgVptW1I2wULNLtJ/GQQ8lqLvb1HVvYZxXXTX9E7uJSzXrDNJKc/1IPAxPh9
 rh5GyZutXUlgpadt0ea71octNj4Z2OI08pTYJFpCA4afar+Lgigl/AGF1KLecFJ3/b
 o6IgTqasvjFqQ05l6b0g/gDFykGUjK7DrrHkDskU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831123055eucas1p266684932dbf9db192710f35b46fd643d~wWjX-AKXc1299512995eucas1p2s;
 Mon, 31 Aug 2020 12:30:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B1.DE.05997.F7DEC4F5; Mon, 31
 Aug 2020 13:30:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831123054eucas1p14913acf89e94842b48d8e005b5e01d7e~wWjXT2kzy1358313583eucas1p1i;
 Mon, 31 Aug 2020 12:30:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200831123054eusmtrp161f6cfc6de50ed8de4d8c5ad763ba97d~wWjXS9rJy0520905209eusmtrp1d;
 Mon, 31 Aug 2020 12:30:54 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-c3-5f4ced7f7ef1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CF.5E.06314.E7DEC4F5; Mon, 31
 Aug 2020 13:30:54 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200831123053eusmtip266f3538f6634be0eee709dcabfb9b647~wWjVj4NFe0780707807eusmtip2X;
 Mon, 31 Aug 2020 12:30:53 +0000 (GMT)
Subject: Re: [PATCH 04/10] dt-bindings: mfd: syscon: Document Samsung Exynos
 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <8b0a42a3-e014-c2ed-7403-021f9a476fc8@samsung.com>
Date: Mon, 31 Aug 2020 14:30:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-4-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa1BMYRjHvee2p3KaY2l6JtdZucQoub4zjHH7cMQHfDLNVDYdLWprdiuX
 D4oG0VWYsqKGsDYqW0Ikk7bVxK4uqkkXscPExKhtXSq0ezL69nv+z/O8z/8/87KkPJXxYfep
 40SNWhmlYNypirqfliWJ/dvClt42+eJ0Sz2BWxprCHw3t4TGF3ptDG6zf6TxlcGZ+E/FWRLn
 11po3DL0lcHZPVkUznz/mcRWa6kM9wyZEHa0pBDY+L6Vxs2VeQzOtT4h8J3aLhk+UVUrw416
 O4HLjBfI9V5C6eBxRqhyFFDCQ12XTDAaTjNCZ+tjRvhisciE+463tNCTaiaEssJEIaPcgIRB
 46ztHsHuayPEqH0JoiZg3W53VVPhcyp2lD3UnDdAJ6F02RnkxgK/Al4k1yMny3k9gtN1m84g
 9zG2IzBnfqalYhCBtfMY+W8jLSeNkDZuIhgoWiwNfUNQXFztakzlgyGjv5l28jTeD9pGv7te
 Ivl3NOgv2Rhng+EDId2UMXabZTl+HVy+oXLKFD8Pvlb0uSx58aFwz/za9SbHT4H6izbKyW78
 SnC8yXdFIHlv6LDlExLPhvv9eeNGn7MwUg0Sb4ayH1ZC4qnwyVw+Hn8GNJxLo5zegE9GkPbo
 jUwqshD0mAuQNLUGOi2/GKdRcixNSWWAJG+AwnPJpFMG3hPa+6dIHjwhuyJnXOYg5aRcmvaF
 YUPOuAUfSLX9obKQQjchmW5CGt2ENLr/dwsQZUDeYrw2OlLULlOLB/21ymhtvDrSf09MtBGN
 fdGG32b7A1Q5El6DeBYpJnM/TFvD5LQyQXs4ugYBSyqmcRtfNoTKuQjl4SOiJiZMEx8lamvQ
 dJZSeHPLr/aFyPlIZZx4QBRjRc2/LsG6+SShLbPm3FH3vjqlSo8gd1WLXrnTkUfxjqa+gq41
 Jj/CK3vZqbZhLnFk0fxczy8dKyM+6Nsd5TE7447Gpjy9FWQIHh5YeKRu9dyH4aGJVHv4eblf
 iGqph/C4yrhXv2eIm9R9PKjbTiVcb9ufN6/o2WhjUFLYtYD42gU5Hvqdcf6OzFWTFZRWpQxc
 RGq0yr94lNVNngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xe7p1b33iDbrvmFr0njvJZHHl4iEm
 i40z1rNaTH34hM3i+pfnrBbzPsta/N82kdli/pFzrBZXvr5ns5h0fwKLRf/j18wW589vYLe4
 //Uoo8W3Kx1MFpseX2O1uLxrDpvFjPP7mCzWHrnLbtG69wi7xcUVX5gsNm+ayuwg6rHhcxOb
 x95vC1g8ds66y+6xaVUnm8eda3vYPN6dO8fusf3bA1aP+93HmTw2L6n36NuyitHj8ya5AO4o
 PZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYxLS06w
 FPzlqLg85xNrA2MvexcjJ4eEgIlEz/Qepi5GLg4hgaWMEl/XzwZKcAAlpCTmtyhB1AhL/LnW
 xQZR855R4sH8/YwgCWGBKIm+t5dZQWwRAU2J63+/g9nMAo9YJT7NqoJo2Mwo8XjZT7BtbAKG
 Er1H+xhBFvAK2EnMXZYBEmYRUJV4v+0l2ExRgTiJx73/mUFsXgFBiZMzn7CA2JwCphLfbs9n
 h5ivLvFn3iVmCFtc4taT+UwQtrzE9rdzmCcwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55b
 bKhXnJhbXJqXrpecn7uJEZg2th37uXkH46WNwYcYBTgYlXh4fxz1jhdiTSwrrsw9xCjBwawk
 wut09nScEG9KYmVValF+fFFpTmrxIUZToOcmMkuJJucDU1peSbyhqaG5haWhubG5sZmFkjhv
 h8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGdvej/55ybXj8s2mR123OyEKxS0H/v6eedpQ04F/V
 IWwT6vbQ9m/BW+7uhvbbdttOHD25yTHN3pZ1QmTvweuqj201ut56Ss48etmwTH3S7rhlZsec
 LD5tm1Gfbr3tTq+k8+7f727OXH/mQuDPwszmw/a/jrp4vXFsujv1uZTTDp8vAkLZp7zalViK
 MxINtZiLihMBD3yhmDEDAAA=
X-CMS-MailID: 20200831123054eucas1p14913acf89e94842b48d8e005b5e01d7e
X-Msg-Generator: CA
X-RootMTR: 20200829142536eucas1p12c539f1cd45195adef96f8b752778fcf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142536eucas1p12c539f1cd45195adef96f8b752778fcf
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142536eucas1p12c539f1cd45195adef96f8b752778fcf@eucas1p1.samsung.com>
 <20200829142501.31478-4-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.08.2020 16:24, Krzysztof Kozlowski wrote:
> Samsung Exynos SoCs use syscon for system registers so document its
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 049ec2ffc7f9..0f21943dea28 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -40,6 +40,10 @@ properties:
>                - allwinner,sun50i-a64-system-controller
>                - microchip,sparx5-cpu-syscon
>                - mstar,msc313-pmsleep
> +              - samsung,exynos3-sysreg
> +              - samsung,exynos4-sysreg
> +              - samsung,exynos5-sysreg
> +              - samsung,exynos5433-sysreg

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Do you also have a patch updating Documentation/devicetree/
bindings/arm/samsung/sysreg.yaml with new compatibles?

-- 
Regards,
Sylwester
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
