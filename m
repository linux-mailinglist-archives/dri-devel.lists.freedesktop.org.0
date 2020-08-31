Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD02579E2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD97892F6;
	Mon, 31 Aug 2020 13:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C988930F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:00:56 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831130055euoutp010406d0a260d2aec286b67aba36fd9363~wW9kEBJWo2170121701euoutp01_
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:00:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200831130055euoutp010406d0a260d2aec286b67aba36fd9363~wW9kEBJWo2170121701euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598878855;
 bh=f/rWok6CJ7/IYjKn1cpZQvn31jSua31cQD97YIm0q8Q=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FVnP0RXJlfY2ZvA5nG7Pgx9A/IX08DF7NCMbuZUdk+I0a2CKjDwrkbErVDYiSg0rI
 GztQKaB6VQpx3rGgwaeug1WKBIggyv69Q0uQNKCRX1PzdfEWnxTHegFcs0PZOy1ggg
 Fp309Oo0wX7vxDLW6rasaIxZteXOr6BY8SaMPDlI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831130054eucas1p2328868ab157425b00cef2b6247f73897~wW9jleBVl2410024100eucas1p2p;
 Mon, 31 Aug 2020 13:00:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5D.B3.05997.684FC4F5; Mon, 31
 Aug 2020 14:00:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200831130054eucas1p235cdcf361f5474a0871c51129d12541c~wW9jP3-qD2812528125eucas1p2C;
 Mon, 31 Aug 2020 13:00:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200831130054eusmtrp1f69895d85ce6af64b2b57b067f199817~wW9jO3Rrl2421924219eusmtrp1Y;
 Mon, 31 Aug 2020 13:00:54 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-16-5f4cf4867686
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.B2.06314.684FC4F5; Mon, 31
 Aug 2020 14:00:54 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200831130052eusmtip25eaef84dfc2e904b6394d553b241f70c~wW9hx00Mp2992729927eusmtip2N;
 Mon, 31 Aug 2020 13:00:52 +0000 (GMT)
Subject: Re: [PATCH 08/10] arm64: dts: exynos: Add compatibles to sysreg nodes
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
Message-ID: <0e2b595a-eacc-bddb-617b-d22c908212fc@samsung.com>
Date: Mon, 31 Aug 2020 15:00:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-8-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRTle7vayGu0vFlWDEaMmEvrF4W0/XjQQgWCtOlUD1scqxmtlLAs
 UlNT02wZwoZIMq200dHSxsi0UdRnmllkMoaWlJSJo7RaPZ+S/86599zv3nP4OFJ9kfHm9kfH
 iIZoXZSGcaXKn32XFiQ5N4QH3S4JwuelBgK3t9YQ+P6VYhrnvutl8CtnH43zhnzwn/ILJL5e
 K9G4fXiAwdmOLApn9vSTuKWlhMWO4TqER9pTCGzp6aDxi8prDL7SUk3gu7VdLD5rq2Vxa4GT
 wMnvP5K41JJLrpoulAydZgTbiJkSHpq6WMFSeI4R3nY8YoQvksQKFSPdtOBIsxNC6c2TQkZZ
 IRKGLLM3u21zXblXjNp/VDQEhkS47nM4cujD1eTx+vyn7Cn0g0hFLhzwi+HroJVKRa6cmi9A
 UPn4A60QJ4K2J9WEQoYQDCbWk6mIGxuxtc1R6rcQlBcnjYsGESS3mVn5XQ9+M5SlVJFyw5Pv
 pMCZWsLKhOQ7EXzrHxhTMXwwnK/LQDJW8SGQmXeGkTHFz4PMJ5doGU/jd4HV/pJQNFOh4Wov
 JWMXfgnYHplIGZO8F7zpvU4oeA5UfL42thn4Jg6KWstYxeo6GC66N4494JN9oj4LGnPSKWXg
 DIL0qk5WIVkIHHYzUlQr4K30g5ETIHktFFcGKuXV0P3TRinBuMPrz1OVI9whu/zyeF4qSElS
 K2pf+Fl4eTx5b0jr/UNlIY1pkjXTJDumSXZM//eaEVWIvMRYoz5SNC6MFo8FGHV6Y2x0ZMCe
 Q3oL+vdXG0ftzgeo8tfuGsRzSDNF9a1ufbia1h01xulrEHCkxlO1prlxl1q1VxcXLxoOhRti
 o0RjDZrJURov1aIbH3eq+UhdjHhQFA+Lhokuwbl4n0IRfagd5ehjMr4XpM932R7iltQV5Dsa
 t3ErO8P9yHNzyEAyOeqsCo5o8VtGBHtYE/P1Xf7SK0/P5ng3SZVmzdujPaHV972ZNbPZkFvv
 s+lS6LGOX3cSQldoE+cGLV86t9G/bP7g7x2aTXTTlnzfd9ri8DDpxtrn1VcTYg8eyA6zumko
 4z5dsB9pMOr+Aj1XheKnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7ptX3ziDc5ckrToPXeSyeLKxUNM
 FhtnrGe1mPrwCZvF9S/PWS3mfZa1+L9tIrPF/CPnWC2ufH3PZjHp/gQWi/7Hr5ktzp/fwG5x
 /+tRRotvVzqYLDY9vsZqcXnXHDaLGef3MVmsPXKX3aJ17xF2i4srvjBZtD99yWyxedNUZgcx
 jw2fm9g89n5bwOKxc9Zddo9NqzrZPO5c28Pm8e7cOXaP7d8esHrc7z7O5LF5Sb1H35ZVjB6f
 N8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
 Zdy/P5m1YB9zxYmlh9kbGH8xdTFycEgImEjsvSTfxcjFISSwlFHi8JftzBBxKYn5LUpdjJxA
 prDEn2tdbBA17xklXuy5wwSSEBbwk5j18SUzSEJE4DaLxIubz5hBEswCdxklzs6XgujYzChx
 4fhusASbgKFE79E+RhCbV8BOon9eMxuIzSKgKtF/cBoriC0qECfxuPc/M0SNoMTJmU9YQGxO
 AVOJvXtmQS1Ql/gz7xKULS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEkt
 Lc5Nzy021CtOzC0uzUvXS87P3cQITCHbjv3cvIPx0sbgQ4wCHIxKPLwBwNQixJpYVlyZe4hR
 goNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6a3vJJ4Q1NDcwtLQ3Njc2Mz
 CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjByLBItUCn4883whE6ugtt4n6NFFvQKvF52f
 w7lnX6vV43q4xt72ZtF6f+eag7K6M6ftknKMucbxNuRetotdZuWEotmSv+t+BPJ7TFg4M1mr
 7euuDTWfEjovnG4SFbjv0LhOP/LXAjvjCwVb7xT/0P/7bdrKGNeGR59k5z6PiLs2/7XehX9T
 W5RYijMSDbWYi4oTAchKo7k3AwAA
X-CMS-MailID: 20200831130054eucas1p235cdcf361f5474a0871c51129d12541c
X-Msg-Generator: CA
X-RootMTR: 20200829142557eucas1p2a9613c8ba9a57ee4842f8ec24b0c5450
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142557eucas1p2a9613c8ba9a57ee4842f8ec24b0c5450
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142557eucas1p2a9613c8ba9a57ee4842f8ec24b0c5450@eucas1p2.samsung.com>
 <20200829142501.31478-8-krzk@kernel.org>
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
> System register nodes, implementing syscon binding, should use
> appropriate compatible.  This fixes dtbs_check warnings:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: syscon@13b80000:
>     compatible: ['syscon'] is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
