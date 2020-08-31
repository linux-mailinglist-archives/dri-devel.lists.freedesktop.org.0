Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80924257901
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 14:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2596E17D;
	Mon, 31 Aug 2020 12:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B356E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:14:45 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831121444euoutp01bd8131b52b6e889a65b489f15f8e40e6~wWVPXTXkz1624716247euoutp01u
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:14:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200831121444euoutp01bd8131b52b6e889a65b489f15f8e40e6~wWVPXTXkz1624716247euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598876084;
 bh=zSTEE6uLKLGM4J7inGc+ik3l31ISpa3neweh8a9wkwA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=VRC0Rew75h7ZHwWO9Ez9fHM0LHWKyDTID87cKS5km3frCw7P3eQS2PYeHd9q26HD4
 aO1DMzAzzdGoYOi9pKc6mUOojZiUKMiDYh69NFY4EwYDGEGnyst3tbgWo0O/rjD3lc
 xLboCMl8Xgq/IB+2n+QwlY5QH2a/vgjSLhAahYKk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200831121443eucas1p16c64fd440125b982299ee0a6c435ea39~wWVOxQ4kH2219922199eucas1p1f;
 Mon, 31 Aug 2020 12:14:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B7.3C.05997.3B9EC4F5; Mon, 31
 Aug 2020 13:14:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200831121442eucas1p2c7b4735411874067468cef6958c952fa~wWVN_tcvo1552615526eucas1p2r;
 Mon, 31 Aug 2020 12:14:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200831121442eusmtrp1ec2536821be4246eadbc590adda0c8e2~wWVN6AO4k2625426254eusmtrp1T;
 Mon, 31 Aug 2020 12:14:42 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-f1-5f4ce9b362aa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 52.5F.06017.2B9EC4F5; Mon, 31
 Aug 2020 13:14:42 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831121440eusmtip1abde50978bbd948d7c4dd98620c12f37~wWVMP1Wck2307523075eusmtip1I;
 Mon, 31 Aug 2020 12:14:40 +0000 (GMT)
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
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
Message-ID: <ec9deeb1-8599-d755-cbfa-5db9787368e1@samsung.com>
Date: Mon, 31 Aug 2020 14:14:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbVRzHPffcF7CSQ0H5hQ1dummcyTZR506caeYj8Wb6xxLjNCY8KtzA
 lMfopVOMyYBlyspD3AbMhkdjjMOaBSjPgcWsAxpG1m6CYAakEkAHWBhrIcwNkHJZxn+f7+/3
 Oef8fskRsfY8HyMez8yRjZmGdB0fyrb23vfsbZp+L/HFipXnaIm7j6GDt5wMbbxYz9Hy8Ume
 Dgf+4WiNP5autX6HaW23m6ODi/M8PectY+m3E7OYejwNAvUu9iC6NFjIUPvEEEcHOqp4etHT
 xdDL3WMCPePoFuitugBDv5maxrTJXo4PPyU1+At4ybFkZaUrljFBstvO8tLo0K+8NOd2C1Lb
 0l+c5C1yMVLTj6ek0mYbkvz2p4+GfRz6eoqcfvykbNyvTwpNa6/uxSfm8RfXVgdwHrJhMwoR
 gbwC3oW/uSBrSR2CvLkwMwpd5wCC2ocNnBr8CC7MOfhHJ24uWrHauIRgxuzYDAsIXJ7ZDSuS
 HIPKeyVMsBFFRlgImBuEYMBkBMHy7LwQtHgSByU9pSjIGqKHq3WujTpLnoWiqbtMkJ8kCdDi
 +oNRnQjo+36SDXIIOQD5NueGj0k03J6sZVR+Btp8VRsjAbkpguXepXVJXA9vw8rpMHWHSJhx
 NQsq74D+88Ws6p9GUNw5IqihDIHXZUWqdQhG3f/xwYsw2QP1HfvV8hswMHMBq/eHw5++CHWG
 cDjXWrlZ1kDh11rV3g0PbJWMyjFQNLnGliGdZctmli3bWLZsY3n8rhWxNhQtm5SMVFl5KVP+
 fJ9iyFBMman7krMy7Gj9q/avugLtqOPhJ05ERKTbplnueTdRyxlOKrkZTgQi1kVp3rzRn6DV
 pBhyv5SNWYlGU7qsONF2kdVFa17+YTpeS1INOfJnsnxCNj7qMmJITB6qWfnl8PM5B6/N/WYP
 11mP/Hx55+38XUdj33+isy/GYU7W1x9zSDf0dwaj4KfxJGM891FXcWPFwZTY0d0avab4LV+s
 3hSSupAd1579e8vwBz3voH8/PbJmoq+WKwWN1T6czl73j+31ya/V+EmEvaYa7apykqJRY27F
 zrsF4x8ufKVjlTRD3AvYqBj+BwATMVemAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xu7qbXvrEG8ydqWXRe+4kk8WVi4eY
 LDbOWM9qMfXhEzaL61+es1rM+yxr8X/bRGaL+UfOsVpc+fqezWLS/QksFv2PXzNbnD+/gd3i
 /tejjBbfrnQwWWx6fI3V4vKuOWwWM87vY7JYe+Quu0Xr3iPsFhdXfGGyaH/6ktli86apzA5i
 Hhs+N7F57P22gMVj56y77B6bVnWyedy5tofN4925c+we2789YPW4332cyWPzknqPvi2rGD0+
 b5IL4I7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQ
 y9gx9xhzwXvmisP/LjM3MK5i7mLk5JAQMJG48HUBkM3FISSwlFGi+/QSpi5GDqCElMT8FiWI
 GmGJP9e62EBsIYH3jBK/79mC2MICYRLTP/UygfSKCNxmkXhx8xnYUGaBu4wSZ+dLQQztYJRY
 8PkWO0iCTcBQovdoHyOIzStgJ3FwxXGwOIuAqkT30w9MILaoQJzE497/zBA1ghInZz5hAbE5
 BUwlGlcdYodYoC7xZ94lqGXiEreezGeCsOUltr+dwzyBUWgWkvZZSFpmIWmZhaRlASPLKkaR
 1NLi3PTcYiO94sTc4tK8dL3k/NxNjMAUsu3Yzy07GLveBR9iFOBgVOLh/XHUO16INbGsuDL3
 EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTG95JfGGpobmFpaG5sbm
 xmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYZ1+culd/JWvjK50skaCTGZ2zdt/s9XK6
 O0mjbvKWVxZLP/mLvYnV+LznvJHozi931q8O9FNU/u3mv5iX85JJtOaP2s2TGie6/982jfWz
 nffnZstferatB9g/9n6dJ3P8TNmNw/IBBw/y99y5+cid5dfriZrGqzYYumft8/7DvOwF79VQ
 R78nO5VYijMSDbWYi4oTAQSvoU43AwAA
X-CMS-MailID: 20200831121442eucas1p2c7b4735411874067468cef6958c952fa
X-Msg-Generator: CA
X-RootMTR: 20200829142522eucas1p2ecc9517be9060d7291b27deba1be8fe4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142522eucas1p2ecc9517be9060d7291b27deba1be8fe4
References: <CGME20200829142522eucas1p2ecc9517be9060d7291b27deba1be8fe4@eucas1p2.samsung.com>
 <20200829142501.31478-1-krzk@kernel.org>
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
> Additional properties actually might appear (e.g. assigned-clocks) so
> use unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
>     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
