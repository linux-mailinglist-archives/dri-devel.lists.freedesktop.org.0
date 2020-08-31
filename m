Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409EB257552
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 10:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325D689D2E;
	Mon, 31 Aug 2020 08:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7933B89D2E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:29:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831082914euoutp018437525376c5e66aba8e7c45b1d2d1c4~wTQW9Zr8k1617416174euoutp01J
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:29:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200831082914euoutp018437525376c5e66aba8e7c45b1d2d1c4~wTQW9Zr8k1617416174euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598862554;
 bh=/JxnUtrZ/uyGVoboq+PFXsD3m8GumhTQG57hLCOjEmM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=T3ZCmOGVZY2D06FBKRstX6NorBmy+DvphGlfUWZHSoIgFPzV2IImcV03DRQ6/TCSJ
 O3H6KNRrAirZMQ+0XoiNBlqOWJIO2wZqa+I2T+H6wqpkAS21fzrLfLqV524jc6a8Rf
 JuD6bTCXkzNXEge4WHvRyb7yiDFYRAiAEXPxjhwI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831082914eucas1p2eaa5caa130a784ca0c36a65e87bccdd9~wTQWthol41548915489eucas1p29;
 Mon, 31 Aug 2020 08:29:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CA.AA.06456.AD4BC4F5; Mon, 31
 Aug 2020 09:29:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831082914eucas1p1817759fe1a4a5becc90afccc73f4ce7b~wTQWb6htr1267612676eucas1p1a;
 Mon, 31 Aug 2020 08:29:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831082914eusmtrp26f23add50770fa4f24839105bb0afa7f~wTQWbDvJP1540715407eusmtrp2b;
 Mon, 31 Aug 2020 08:29:14 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-3b-5f4cb4da94cd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0B.6F.06017.AD4BC4F5; Mon, 31
 Aug 2020 09:29:14 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200831082913eusmtip2acd2272b33a1e6d6b6d2965aef5d4193~wTQVoxUV72078920789eusmtip2B;
 Mon, 31 Aug 2020 08:29:13 +0000 (GMT)
Subject: Re: [RFT 3/4] ARM: dts: exynos: Move CMU assigned ISP clocks to
 buses in Exynos3250
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <5c12e944-21f1-7e86-b5eb-421c70176b5c@samsung.com>
Date: Mon, 31 Aug 2020 10:29:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200831081906.GA11513@kozik-lap>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjl3f1U2rytxAcTo0WRgZpkcKEUrYwLBRn9K8pmXmfl1Dbti2qj
 8qPpTIPmWpJSkrY0danLRVGSDjVdaDUTo1IrUkwov/GjbVfLf+c5zznveQ68NCb9QfjTJ1LS
 eVWKPFlGeuMNLdOO4N66fXFbJrMCWH1nq4itNVYT7EJDIcaWvO4k2HfjoyQ7Wq4j2RsDwxjr
 cNRQrGXgA8F224pJ1uh4IWIzn7+m2IrpesRmf/uJsdO2u3iUD/d8ohTnGk2fKM5ivk5y1okv
 BPc51y7inpRpuDLDe5LLrzMj7o8lMNbrkPeOBD75xBleFRp5zDspx2wj07p9zn1+8ILSor4V
 OuRFAxMORfM6Soe8aSlTgaD3Wr1IGMYQ9DlLMbdKyvxB0NIRvuTQm/S4ICpHMGs3LA6jCHRz
 o4RbtYo5CpX37ZQbr2aCwDk3SbhFGKPH4ZmuWORekEwY6EZ0pBuLmUi41T/t4XFmAxitlR6z
 r+uhlrZ+XNCshNbbgx7sxYTC94lZjwZj1oJ1pBgTsB/0DpZ4OgCjpyH/zQIS7t4N35trSAGv
 giF7HSXgAFhoXDJcRfC1s4oShjwE3VeMi+7t0Nc543LTroggqLaFCnQ0OB/1UW4aGAn0jKwU
 jpDAzYYiTKDFkJMlFdQbwWR//C/21dsurADJTMuqmZbVMS2rY/qfW4pwM/LjM9RKBa8OS+HP
 hqjlSnVGiiLkeKrSglzfr33e/vspGu+Kb0IMjWQrxFPNe+OkhPyM+ryyCQGNyVaLd3a0H5WK
 E+TnL/Cq1DhVRjKvbkJraFzmJ9567+cRKaOQp/OneD6NVy1tRbSXvxbVWWM+Xv3t/zh2/0W0
 Jqrtoe8lk8TwK1AU2JbUC0NE+YHtTi0W36zYFnxn3ZR2/cCmTHm0NfGsb+WpnBnp2Mn98Xe7
 uE/DMQXgON2eay251r+rLLbID5y1EvMmQ+KzyJHSecPL7G9sV54movCIU1MVcbgnYtyRePlg
 ZMUezaENMlydJA/bjKnU8r9x1f/BegMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsVy+t/xe7q3tvjEG8zawmHRe+4kk8XGGetZ
 Lf5vm8hsMf/IOVaLK1/fs1m8X97FZtH/+DWzxfnzG9gtNj2+xmpxedccNosZ5/cxWbTuPcJu
 seLnVkaL9qcvmS1+7prH4sDvsffbAhaPnbPusntsWtXJ5rH92wNWj/vdx5k8Ni+p91gy7Sqb
 R9+WVYwenzfJBXBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZk
 lqUW6dsl6GV0rNrFVnCZv+L+sn3sDYx3eLoYOTkkBEwkemf1snQxcnEICSxllFj/9jM7REJG
 4uS0BlYIW1jiz7UuNoiit4wSM+5PYQRJCAvESRw/fJMFxBYR0JS4/vc7K0gRs0A/i8SqbzvY
 ITp6mSTW/T4PNopNwFCi6y3IKE4OXgE7iamPfjKB2CwCqhIztq8BWy0KNPVMzwuoGkGJkzOf
 gG3gFNCXePbtD1gNs4CZxLzND5khbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELSsoCR
 ZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgvG879nPLDsaud8GHGAU4GJV4eH8c9Y4XYk0s
 K67MPcQowcGsJMLrdPZ0nBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA1NRXkm8oamhuYWl
 obmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxkuHrDbp+JhMf+z7aLfEdPmmt9w/
 qxVm1z7+/ud1psffZLOHTx5K8Kx81595emNL7vpHz1Yc0vpfv3a9oPuVeT/S7ixZbCWxQiPs
 yW5JDteG2XfkGtlKDz25uWfyaZNjG5/a/ujLPZQT57siNNri5Zw3dy42XtLKuPJ3ecfs3CAt
 OXsHy+sLb01QYinOSDTUYi4qTgQAt7LlMQ0DAAA=
X-CMS-MailID: 20200831082914eucas1p1817759fe1a4a5becc90afccc73f4ce7b
X-Msg-Generator: CA
X-RootMTR: 20200829172553eucas1p1b62ad1cac6e0eea1dbb4669f09949419
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829172553eucas1p1b62ad1cac6e0eea1dbb4669f09949419
References: <20200829172532.29358-1-krzk@kernel.org>
 <CGME20200829172553eucas1p1b62ad1cac6e0eea1dbb4669f09949419@eucas1p1.samsung.com>
 <20200829172532.29358-3-krzk@kernel.org>
 <6ed67a82-0f29-7384-203d-dcb2e58c5a8d@samsung.com>
 <20200831081906.GA11513@kozik-lap>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sylwester Nawrocki <snawrocki@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On 31.08.2020 10:19, Krzysztof Kozlowski wrote:
> On Mon, Aug 31, 2020 at 10:11:02AM +0200, Marek Szyprowski wrote:
>> On 29.08.2020 19:25, Krzysztof Kozlowski wrote:
>>> Commit 52005dece527 ("ARM: dts: Add assigned clock parents to CMU node
>>> for exynos3250") added assigned clocks under Clock Management Unit to
>>> fix hangs when accessing ISP registers.
>>>
>>> This is not the place for it as CMU does not have a required "clocks"
>>> property:
>>>
>>>     arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>
>>> ---
>>>
>>> Not tested and I wonder whether actually correct. For example, what will
>>> happen if devfreq (exynos-bus) is not built in?
>>>
>>> Could someone verify it?
>> Sorry, but this patch is not correct. Those clocks has noting with
>> bus-freq. The assigned clocks property should stay where it is. Maybe
>> one need to fix the schemas for dts verification. Those clocks has to be
>> set (and so generic clock framework does) according to the assigned
>> clocks properties once the clock controller is instantiated.
>>
>> The only alternative would be to add exynos-subcmu variant to properly
>> link CMU with the ISP power domain, but assuming that there is no Exynos
>> 3250 ISP driver in mainline (and probably never will be), it is safe to
>> keep those clocks sourced from 24MHz crystal.
> Thanks for the clarification.  Another solution to silence the warning
> could be to add a "clocks" property for FIN_PLL, although the driver
> actually does not take it.

Okay, that would be fine. It would make dts match better the hardware 
and this would even help generic clock framework to always instantiate 
CMU after the oscilator fixed-clock (there have been some hacks there at 
some point for that...)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
