Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEE25790A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 14:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BD36E19B;
	Mon, 31 Aug 2020 12:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B506E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:15:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831121537euoutp028c495aa6c156d4929c0b255bb3ad0b0c~wWWAn2MYt1317213172euoutp02B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:15:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200831121537euoutp028c495aa6c156d4929c0b255bb3ad0b0c~wWWAn2MYt1317213172euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598876137;
 bh=UJaaP850TcSo0Wk4YAvKHVnjzMrMzArNu+6pdtEXdic=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=EowjvH/nrcmSMQjQbvddNNvMMRPsnK8IgMgf2tF3EgFyvo1yLUN9IwpQi/IVnQv9O
 6V98la2sA7tXlYxlp3XjSUJbmCr0esbF5drthzEgat+b/6ATqaT3YwuTWvNhoaj7rF
 BR9oDOw3n4aABUenVDwiJGoXe/VFOiRvaommk0ds=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831121536eucas1p27115e29900beb7719f5d71c84ab00f4e~wWWAJe8_L2676526765eucas1p2W;
 Mon, 31 Aug 2020 12:15:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 79.5C.05997.8E9EC4F5; Mon, 31
 Aug 2020 13:15:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831121536eucas1p1699b8f10f2312de987ec27cff551db49~wWV-sf3Px2392423924eucas1p1n;
 Mon, 31 Aug 2020 12:15:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831121536eusmtrp233519dc8867fe1bda633ce061dabfe4a~wWV-rdhkM2586825868eusmtrp2H;
 Mon, 31 Aug 2020 12:15:36 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-a3-5f4ce9e8db07
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D2.4C.06314.8E9EC4F5; Mon, 31
 Aug 2020 13:15:36 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831121534eusmtip1a908de5eccebd235b68a4c3ca3458167~wWV_AZ6hT2131921319eusmtip1o;
 Mon, 31 Aug 2020 12:15:34 +0000 (GMT)
Subject: Re: [PATCH 02/10] dt-bindings: gpu: arm,mali-midgard: Use
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
Message-ID: <618bd5f4-0100-c219-5d5e-77743de22a7a@samsung.com>
Date: Mon, 31 Aug 2020 14:15:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-2-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUxTQRSGnbuDFoe6cIJbUhcUg4iimahx19xEYtT4YEwAi9yAkYJpBcQX
 FUWQTXCJ2BBAo4JEI5aliIJJBeoSi8rigqYquABR1Basa+VyIfL2/Wf+M+f8kxFo9UnOV9gV
 u1fSx2pjNJwnU9X4wxbwsSskfP5z1yySZbtHkZbHFopcz7vGktNvOjny1PmBJQWOKcRdlUuT
 wnobS1r6ejlywp7DkOMdPTRpairjib2vAZH+ljSKmDraWNJck8+RvKY6ilytf8WTlNp6njwu
 cVIk9V0XTcpNp+mVE8UyRzIn1vYXMeIN4yteNJUe48SXbbc48bPNxovm/tesaM+wUmL5hQNi
 dkUpEh2mqZtGb/dcFinF7EqQ9IHLd3hGdze/Q3ta6H3lde/pgyiTTkceAuBgSM2s59ORp6DG
 JQgq7Z8ZRTgR2FPucLJLjR0InC7v4Y4vx1xDHcUILH8+DomvCE7d+TYgBGEc3g7mvBC5Ph63
 M+BMLxs00bgdgaunl5ev4nAQZDVkI5lVeDkcvfR3kBk8E049cg/yBBwGldZWSvF4w72znYzM
 HngRVP56wspMYx940VlIKTwNzJ/yaXkY4LsCVJpzh5KuheeHL1MKj4NuawWv8GRw35Cb5YbD
 CDJvtvOKyBl4AWsRUlxL4aXtJydno/EcuFYTqJRXwZGcc4ORAXvBs0/eyhJecKLqDK2UVZB2
 VK24Z8Cv0jNDK/hCRqebyUEa44hoxhFxjCPiGP/PLUJMKfKR4g26KMmwIFZKnGfQ6gzxsVHz
 dsbpTGjgqz74a3VWo5rfERaEBaQZo3I1bAhXs9oEQ5LOgkCgNeNVqx8+CFOrIrVJ+yV9XLg+
 PkYyWNAkgdH4qBae7wpV4yjtXmm3JO2R9MOnlODhexAlskvWX8m6pQ0NMr8tyBz9MyBMc9E/
 5VIDigjOqnauyy+JLF4zZYUf+6isKLXpdlzf7wOwqnfm13NLuhZGx39P6sP33wb7XdiftPmh
 ddP72R1bFx//0B/gkey/5Ztf46jqN90hW3URGdO2vUaJYyNaE9Iaszd+P1Rx2VEcGpLbkzB9
 brKGMURrg/xpvUH7D2po3DOmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xu7ovXvrEG7Qd4bLoPXeSyeLKxUNM
 FhtnrGe1mPrwCZvF9S/PWS3mfZa1+L9tIrPF/CPnWC2ufH3PZjHp/gQWi/7Hr5ktzp/fwG5x
 /+tRRotvVzqYLDY9vsZqcXnXHDaLGef3MVmsPXKX3aJ17xF2i4srvjBZtD99yWyxedNUZgcx
 jw2fm9g89n5bwOKxc9Zddo9NqzrZPO5c28Pm8e7cOXaP7d8esHrc7z7O5LF5Sb1H35ZVjB6f
 N8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
 Zby6/JSx4ApzxeZ9z5gbGHuYuxg5OSQETCQ+dP5g72Lk4hASWMoo8XfpXSCHAyghJTG/RQmi
 Rljiz7UuNoia94wSv9/1MoLUCAtESWyf4QMSFxG4zSLx4uYzsKHMAncZJc7Ol4Jo2Mwosebp
 fEaQBJuAoUTv0T4wm1fATqJt2T8wm0VAVWLKhf9gtqhAnMTj3v/MEDWCEidnPmEBsTkFTCW2
 /r7ECrFAXeLPvEtQy8Qlbj2ZzwRhy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW5
 6bnFhnrFibnFpXnpesn5uZsYgSlk27Gfm3cwXtoYfIhRgINRiYf3x1HveCHWxLLiytxDjBIc
 zEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wveWVxBuaGppbWBqaG5sbm1ko
 ifN2CByMERJITyxJzU5NLUgtgulj4uCUamBsruxOkFvz6YPHhBf/bWRFhHPN+PYd6P3+duU8
 IYnbC5olzBqsw573eXDkVQvU+W9gU2O47JLzqG6bhRmv8MffjN1XRG7c15cOrlHd/nXTlxrh
 tpZwjzVcu5bcW2rXZJ7bnJ8eJyaunRRyqndahuJDH8FIO0HPlFdmxcJsl3fb37huP/tArhJL
 cUaioRZzUXEiAEOjGK03AwAA
X-CMS-MailID: 20200831121536eucas1p1699b8f10f2312de987ec27cff551db49
X-Msg-Generator: CA
X-RootMTR: 20200829142527eucas1p21347ea8f219b266872f6b78c376ccd67
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142527eucas1p21347ea8f219b266872f6b78c376ccd67
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142527eucas1p21347ea8f219b266872f6b78c376ccd67@eucas1p2.samsung.com>
 <20200829142501.31478-2-krzk@kernel.org>
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
> Additional properties or nodes actually might appear (e.g. operating
> points table) so use unevaluatedProperties to fix dtbs_check warnings
> like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: gpu@14ac0000:
>     'opp_table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
