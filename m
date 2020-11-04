Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 621052A6500
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 14:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2966ED0D;
	Wed,  4 Nov 2020 13:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163736ED0D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:22:57 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201104132245euoutp012a86c3862d22829d78c124515bf6f3cb~EUML0sK870723407234euoutp01n
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:22:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201104132245euoutp012a86c3862d22829d78c124515bf6f3cb~EUML0sK870723407234euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604496165;
 bh=6e+yHFSjCNb3zgBAjutOcDJ/8OJ2PyIi+d969nIus28=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=SqVH094ynfqqpbU5t7UZuTAmV7kWOM61L8LeOPzH4AZqxsK863whls1Ehh1WiuL23
 aVGCslPJnr8YWSujXlKzl5yV2LF4l/+DKFvL+0WQzTuSWPJa7PDugq83MZ09wdxFnH
 sRaqaZchDc7azmuWtkXTMxXaeZ6lrDyOmn9VQo3c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201104132240eucas1p28d4293ef3b384a6e077f6358c913f27b~EUMGsg42n0968909689eucas1p2V;
 Wed,  4 Nov 2020 13:22:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 42.5C.05997.F1BA2AF5; Wed,  4
 Nov 2020 13:22:39 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201104132239eucas1p1e3fd7e287c0bce62c4e4cc4e19ebcf85~EUMGOvcLu0444304443eucas1p1r;
 Wed,  4 Nov 2020 13:22:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104132239eusmtrp13159b002bca4f1b3017eecede6f5c34a~EUMGN7isr1509115091eusmtrp1N;
 Wed,  4 Nov 2020 13:22:39 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-ee-5fa2ab1f2ae9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7B.10.06017.F1BA2AF5; Wed,  4
 Nov 2020 13:22:39 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201104132238eusmtip1609e7bd67ca234067597a1389990c352~EUMFMIFI40631706317eusmtip1n;
 Wed,  4 Nov 2020 13:22:38 +0000 (GMT)
Subject: Re: [PATCH v8 2/7] interconnect: Add generic interconnect driver
 for Exynos SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <346da718-2340-c862-9a1a-c5f64aae19c2@samsung.com>
Date: Wed, 4 Nov 2020 14:22:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201104123729.GA13371@kozik-lap>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjl3b27u44mr9PyaUbG6Icac1kRF4swjRgEEkUEfWgzLya5abtZ
 KYRWLvxmaOWcUqaBptRyyhQ/YolpMdKGYh8qK9PCxEqcid+5XSX/neec53nPOfDShHRYKKMT
 tVdZnVadJKfEpLVrrkcRWFcZu3t5eT/jfKhHTL3RLGQ+uH4ImUedPUKmf+Y3xZS0WyimyGkg
 md7eFyLG8m1AyPS1lFPMdEEnYoy9LwXMs85hETN4q4Zi9O2dIsZYPE5FYJWlNodSDQ20USpn
 XrdA1fAkQ1XYWItU05btx6kz4oPxbFLiNVanPHRBfOlNwxSRcs/nxvc6kyAT5XnnIi8a8D6o
 LFoS5iIxLcU1CMrsdoofXAgKTPdF/DCNINvWjtZPLMN3SF6oRlBhnKDcghRPIXAV+7ixLz4L
 I29fCd3YDwfDh6VZjweBqwhYKbvtESgcBgWvCz2vSvAhmPg8R7oxiXfC2Jdxz6ObcQwY6rNI
 fscH3paOerAXVkJ+qcNzS2B/+Dz6SMDjQGiaLCfcZoD1NDRX/RXxsY9A7xt+CbAv/OxuXOO3
 gb04n+QP7iDIbx0U8YMBgbO7Yq30ARjqmV+NRK9aBIO5RcnTh2Hh03vCTQP2ho+TPnwIbyiy
 lqzREsi+K+W3d8JCbclaBBnkja6QBiQ3bahm2lDHtKGO6b9vBSJrkT+bymkSWG6Plr0eyqk1
 XKo2IfRissaCVj+dfbnb1YxaFuM6EKaRfJPEZn0cKxWqr3Fpmg4ENCH3k0S+s8dIJfHqtHRW
 lxyrS01iuQ4UQJNyf8neyvHzUpygvspeZtkUVreuCmgvWSbaH/cgJmSRa9MGKkvPRf2ZTEPZ
 u/oGnN52kV++lR3nliKN/Vg/X3oi3BHwqb7q68zejOj05eiUqUH5wy4I/RVUOOu6onBknb4Z
 tMVs0CyMZLaMNGvNT1GO5qUjQpF8tFXWtCOCOhVlq1bZhsx9J4+p6sa2pngpwguVz7+Jc+Uk
 d0kdFkLoOPU/AcpNJXADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xu7ryqxfFG3QflLK4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbjFj8ks2BwGPTas62TzuXNvD5nG/+ziTx+Yl9R59W1YxenzeJBfA
 FqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXcWLz
 R+aCKYIVz1bPYmpg7ObrYuTkkBAwkdh0t5mli5GLQ0hgKaPE4aWb2bsYOYASUhLzW5QgaoQl
 /lzrYoOoec8o0brzAAtIQlggWqJv8yw2EFtEQFPi+t/vrCBFzAKLmSUaXi1gAkkICTxjlPj9
 qxzEZhMwlOg92scIYvMK2Em8vvUTbBCLgIrE0wcvwQaJCsRJ/JjYywZRIyhxcuYTsBpOAX2J
 npkXwXqZBdQl/sy7xAxhi0vcejKfCcKWl9j+dg7zBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJL
 i3PTc4uN9IoTc4tL89L1kvNzNzEC43rbsZ9bdjB2vQs+xCjAwajEw3tg28J4IdbEsuLK3EOM
 EhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjDl5JXEG5oamltYGpobmxub
 WSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYJzwQXfBf6lF4sW/zl3tP/L9UN3GzWpJ75IV
 HXkO3hS3/Zku/6v8zX/be5GbJSzOnOTPkzmzKtHz9sVvXzcan/xzWKVbjHW7Uq1OM8dRj3Vh
 VuElFSy8JhemCNjuDbdf/fuInUGi+++lQYX2W5YK+2nL1D7aOiM7a9OfWzqSsvK3G5X6FFIW
 HlFiKc5INNRiLipOBACtBHetAQMAAA==
X-CMS-MailID: 20201104132239eucas1p1e3fd7e287c0bce62c4e4cc4e19ebcf85
X-Msg-Generator: CA
X-RootMTR: 20201104103720eucas1p1014217e751a681796ed508af22c6bb12
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104103720eucas1p1014217e751a681796ed508af22c6bb12
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103720eucas1p1014217e751a681796ed508af22c6bb12@eucas1p1.samsung.com>
 <20201104103657.18007-3-s.nawrocki@samsung.com>
 <20201104123729.GA13371@kozik-lap>
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
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.11.2020 13:37, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2020 at 11:36:52AM +0100, Sylwester Nawrocki wrote:

>> diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
>> index d203520..c2f9e9d 100644
>> --- a/drivers/interconnect/Makefile
>> +++ b/drivers/interconnect/Makefile
>> @@ -6,3 +6,4 @@ icc-core-objs				:= core.o bulk.o
>>  obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
>>  obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
>>  obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
>> +obj-$(CONFIG_INTERCONNECT_SAMSUNG)	+= samsung/
>> \ No newline at end of file
> 
> This needs a fix.

Corrected, thanks for pointing out.
 
>> diff --git a/drivers/interconnect/samsung/Kconfig b/drivers/interconnect/samsung/Kconfig
>> new file mode 100644
>> index 0000000..508ed64
>> --- /dev/null
>> +++ b/drivers/interconnect/samsung/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config INTERCONNECT_SAMSUNG
>> +	bool "Samsung interconnect drivers"
> 
> "Samsung SoC interconnect drivers"

Changed.

>> +	depends on ARCH_EXYNOS || COMPILE_TEST
> 
> Don't the depend on INTERCONNECT?

This file gets included only if INTERCONNECT is enabled, see
higher level Kconfig file.
 
>> +	help
>> +	  Interconnect drivers for Samsung SoCs.
>> +
>> +
> 
> One line break

Fixed.

>> +config INTERCONNECT_EXYNOS
>> +	tristate "Exynos generic interconnect driver"
>> +	depends on INTERCONNECT_SAMSUNG
> 
> How about:
> default y if ARCH_EXYNOS

OK, added.

>> +	help
>> +	  Generic interconnect driver for Exynos SoCs.
>> diff --git a/drivers/interconnect/samsung/Makefile b/drivers/interconnect/samsung/Makefile
>> new file mode 100644
>> index 0000000..e19d1df
>> --- /dev/null
>> +++ b/drivers/interconnect/samsung/Makefile
>> @@ -0,0 +1,4 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +exynos-interconnect-objs		:= exynos.o
> 
> What is this line for?
 
That allows to change the module name, so it's exynos-interconnect.ko
rather than just exynos.c. It's done similarly for other SoCs in 
the subsystem.

>> +obj-$(CONFIG_INTERCONNECT_EXYNOS)	+= exynos-interconnect.o

-- 
Regards,
Sylwester
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
