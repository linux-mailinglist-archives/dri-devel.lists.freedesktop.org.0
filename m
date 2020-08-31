Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41225790F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 14:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E99889CE3;
	Mon, 31 Aug 2020 12:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96C889B51
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:16:19 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831121618euoutp02ceaf42c1e68213e34c7daf4740a16adc~wWWnCL-5c1357413574euoutp02K
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:16:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200831121618euoutp02ceaf42c1e68213e34c7daf4740a16adc~wWWnCL-5c1357413574euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598876178;
 bh=jzK2O7j1tAxVD4f3hxVXieUj6ygt7FZk+nJr28x8OgM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Psk8WFidk80zGn2N2vU4Kd0T4qyZQqm6Wb1noYtH4TxhUEgTzuWtlvXUgLTGxzT/m
 daqlFxx6Tf1qjPJwmozU9kuPgvBV8RPsKv+rj7mWqM7EEXchQSaCTolUp4bbD5oPeL
 9eQNyB/Mcqgd79TXmVt2UHoT+47yXqoadA3u3bws=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200831121618eucas1p11f39129b20cd089e0f8d380f2aee51ac~wWWmt8QNb2624926249eucas1p1L;
 Mon, 31 Aug 2020 12:16:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 48.0F.06456.21AEC4F5; Mon, 31
 Aug 2020 13:16:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831121617eucas1p1c52b700d989b217ff8246b170d10ec31~wWWmL1w-k2992729927eucas1p11;
 Mon, 31 Aug 2020 12:16:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200831121617eusmtrp1a1882a07d195a184a1f3547f942a942a~wWWmK2i8M2741427414eusmtrp1B;
 Mon, 31 Aug 2020 12:16:17 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-38-5f4cea125cd9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.8F.06017.11AEC4F5; Mon, 31
 Aug 2020 13:16:17 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831121615eusmtip176ec4cc4ea5ef8720e192bd3e9f5545a~wWWkXgosX2307423074eusmtip1f;
 Mon, 31 Aug 2020 12:16:15 +0000 (GMT)
Subject: Re: [PATCH 03/10] dt-bindings: timer: exynos4210-mct: Use
 unevaluatedProperties
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>, Sangbeom Kim
 <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <07d720dc-39d1-e749-f8d3-cf5d67f807d6@samsung.com>
Date: Mon, 31 Aug 2020 14:16:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-3-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUwTYRCG8+1udxe05KOIHRGvRkwABfHKpxjj7Xr8QBMNISpU2IAR0LTW
 M/EABSyHgDFKQwCJiUgiR1FAPGKwtSJSRBHFaqqhYsBQDw7PiLTrwb933nkmM28yPK3IY/34
 ncl7RU2yOlHFejK19761zlL0boiebfsiI9nWJoq0tzVSpPp8pYycfeNgybOBdzJS1D+JDNfm
 0aTYZJWR9sEPLMm35zLkdNd7mrS2VnHEPmhGZKg9gyLGrg4ZedJQyJLzrbcpcsX0iiMnb5k4
 0lY2QJH0tz00qTGepZeOF6r6U1jh1lAJI1w3vOIEY/kpVnjZcZMVnFYrJ9QNvZYJ9kwLJdRc
 PCrkXC1HQr9xcsSYKM/FcWLizn2iJnRJjGfCL2foHhN94MY9OIaO03rkwQOeBwXdZsalFbgM
 geGNtx55jugBBB/z73NS0Y+gpcD0b8KS84iRGpcQlKY6/1CfEDz/2YNclA+OgrqUNJmrMQ7b
 GBjQV7kpGtsQfH3/gXNRLA6DbHOOe0KOl8Bl6znKpRkcABUV3e6rfPF2uGZ5SkmMNzQVONy+
 B54PXac63LM0VsILRzEl6SlQ11f459aHPPwcWiXpldCX+TeDD/RarnKS9ofmM1nuPIBTEWTd
 sHFSkYvAbilBEhUOL63fWT3iRzYEQmVDqGQvg5RUM+WyAXvB8z5v6QYvyK89R0u2HDLSFBI9
 HX6USxEB+0GmY5jJRSrDqGSGUWkMo9IY/u8tQUw5Uoo6bVK8qA1LFveHaNVJWl1yfEjs7iQj
 GnnU5l+Wz/Vo8PGORoR5pBor/2peH62QqfdpDyY1IuBp1Tj58pbm7Qp5nPrgIVGzO1qjSxS1
 jWgiz6iU8rmlPdsUOF69V9wlintEzd8uxXv4HUMBC5S6Q/ERq8sqrFmdT3b42aNwhY9/YHam
 rXOR/4w7J7pj1hbF5uXPXDhYHY7WeRgXcj5rv2zaYpiRPWYqf0KXXn8hYmNh+BpnCz58dPOR
 23MiH1SPd34PDs5ra4pLn0bXx9R0LvJKm+D7Gd4lbH10/WRDJBNckrFCGdgddJcb9h2rYrQJ
 6rAgWqNV/wbV0wNrpAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xu7qCr3ziDXrWyVn0njvJZHHl4iEm
 i40z1rNaTH34hM3i+pfnrBbzPsta/N82kdli/pFzrBZXvr5ns5h0fwKLRf/j18wW589vYLe4
 //Uoo8W3Kx1MFpseX2O1uLxrDpvFjPP7mCzWHrnLbtG69wi7xcUVX5gs2p++ZLbYvGkqs4OY
 x4bPTWwee78tYPHYOesuu8emVZ1sHneu7WHzeHfuHLvH9m8PWD3udx9n8ti8pN6jb8sqRo/P
 m+QCuKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0
 Mv690y84wlyx+5hEA2MjcxcjJ4eEgInE8b4LLF2MXBxCAksZJd507GfqYuQASkhJzG9RgqgR
 lvhzrYsNouY9o0T/7ENsIAlhgSiJ7U1trCAJEYHbLBIvbj4Dm8oscJdR4ux8KYiOzYwSbW3z
 GEESbAKGEr1H+8BsXgE7iZXnpjOB2CwCqhLr1j1jAbFFBeIkHvf+Z4aoEZQ4OfMJWJxTwFTi
 cec1RogF6hJ/5l2CWiYucevJfCYIW15i+9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3O
 Tc8tNtIrTswtLs1L10vOz93ECEwg24793LKDsetd8CFGAQ5GJR7eH0e944VYE8uKK3MPMUpw
 MCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnA5JZXEm9oamhuYWlobmxubGah
 JM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFxUvxTCa0+npCmHtc9n8U0Yw49nL6dhXWJx/6C
 yw/EbCrUzB+e6fjM+inOJMP04au1L8xC3l3/0y3mek35QIB58fb8A8vLD6nIV6/fGl/B3/PO
 Jj0iUGnh1ujssx/OcNpbuzW5N390fXP7xw4pBdfO+L9WPXr7dC45vT2wtUx4g6drzuzlTHeV
 WIozEg21mIuKEwEc9OZONgMAAA==
X-CMS-MailID: 20200831121617eucas1p1c52b700d989b217ff8246b170d10ec31
X-Msg-Generator: CA
X-RootMTR: 20200829142531eucas1p27936c00d9ec8fe5baa12972df7641d47
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142531eucas1p27936c00d9ec8fe5baa12972df7641d47
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142531eucas1p27936c00d9ec8fe5baa12972df7641d47@eucas1p2.samsung.com>
 <20200829142501.31478-3-krzk@kernel.org>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.08.2020 16:24, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. clocks) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: timer@101c0000:
>     'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
