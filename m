Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A60A15350
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 16:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3BC10EB21;
	Fri, 17 Jan 2025 15:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lnPsLbFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D85410EB21
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 15:58:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250117155845euoutp01a740535f738049ec157a3c4e9a904e3c~bhhmFGXFo1151211512euoutp01J
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 15:58:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250117155845euoutp01a740535f738049ec157a3c4e9a904e3c~bhhmFGXFo1151211512euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737129525;
 bh=iQrTDhZzkcc0SUSmaeWe9rx+7EMca0xzDJY1ML2mKoo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=lnPsLbFUDUeFhL2dDPFErQrVBqBelY6krt2QLs9B7UHdTUCutOQhh18xQnhwHVFYN
 SSlrZrOWD93fLbdZF+PXRpatSAmE8tzTuwjSw+IB+F97VIRra1OYdaMhcoSgvLJS1L
 o6P15tf5hHaYFF0yDElOHr0oKgy6V1nhNROUhvWQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250117155845eucas1p26c5b33dae5d9be18ce1b898e3d7e1943~bhhl34mfc1048310483eucas1p2w;
 Fri, 17 Jan 2025 15:58:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8B.51.20821.53E7A876; Fri, 17
 Jan 2025 15:58:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250117155844eucas1p2bb7e40910c67e412c0b4f7e54c1080ef~bhhlb0JTe0852608526eucas1p21;
 Fri, 17 Jan 2025 15:58:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250117155844eusmtrp260b0b743a93262a3c11637bf73c799d9~bhhla-e4M1206012060eusmtrp2B;
 Fri, 17 Jan 2025 15:58:44 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-79-678a7e3528b1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 20.58.19920.43E7A876; Fri, 17
 Jan 2025 15:58:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250117155843eusmtip2d3a314ce5a72f92898f9267337378886~bhhkj2sXC1841018410eusmtip2E;
 Fri, 17 Jan 2025 15:58:43 +0000 (GMT)
Message-ID: <2f8a3abd-c837-47a6-93a0-b3d8927620af@samsung.com>
Date: Fri, 17 Jan 2025 16:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djPc7qmdV3pBr1buCx6m6YzWUx9+ITN
 4vW0D2wWE8//ZLO48vU9m0Xz4vVsFpd3zWGzmPtlKrMDh8emVZ1sHneu7WHzmHcy0GP/3DXs
 Hve7jzN5fN4kF8AWxWWTkpqTWZZapG+XwJXR9vU7e8EVy4oFa9czNTDu1Oti5OCQEDCR+N0e
 3sXIxSEksIJRYuLvM+wQzhdGiQ+9XxghnM+MEv1dh9m6GDnBOmZe7WMHsYUEljNKnLvsDlH0
 kVHi/MHPbCBjeQXsJNbe1gSpYRFQlbgy8T9YPa+AoMTJmU9YQGxRAXmJ+7dmgMWFBbwlVrTO
 ZwSxRQTMJdZNWsQGMpNZYDWTxKP+G0wgCWYBcYlbT+aD2WwChhJdb7vADuIUMJJ4sW0bG0SN
 vETz1tnMIM0SAh84JH7emcIKcbWLxJrmX1AfCEu8Or6FHcKWkfi/E2QoSEM7o8SC3/ehnAmM
 Eg3PbzFCVFlL3Dn3C+w1ZgFNifW79CHCjhJXtk9jgQQkn8SNt4IQR/BJTNo2nRkizCvR0SYE
 Ua0mMev4Ori1By9cYp7AqDQLKVxmIXlzFpJ3ZiHsXcDIsopRPLW0ODc9tdgwL7Vcrzgxt7g0
 L10vOT93EyMwKZ3+d/zTDsa5rz7qHWJk4mA8xCjBwawkwpv2uyNdiDclsbIqtSg/vqg0J7X4
 EKM0B4uSOO+i/a3pQgLpiSWp2ampBalFMFkmDk6pBianWw7cC9/+W/4y4/yypIKQxbukhBWz
 TrKdV3XJ+7bhzpvT6oJr7Hb9uPcmoL7xljbTxxlXUqZYGHB+bF/TFrV340rzrO1nLCzEO/22
 CMUtaC+pXFGilt+xkWfnrYXt7dbWN1nSb/p+bSjr2LNT4u0696aD626xlt51f1l3J3SufrAS
 v1V8wb9XZVsDPzxljTn2MPMUT2tuctrS569PtHEHXbr9XzZnkcrP1m276z/3/mDm3BXpctLr
 d43gljduG6+4Lb2+Nj8ytGn5OrZzMkl7hC+Jdzb5x3cv2dai6aQVbfVypajRbxeR309XC23X
 uekTmNtvyBLgmBvnud36X9GkyCNKCQeby17s/6o69a8SS3FGoqEWc1FxIgC5UYJGuQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xe7omdV3pBm+Xa1n0Nk1nspj68Amb
 xetpH9gsJp7/yWZx5et7NovmxevZLC7vmsNmMffLVGYHDo9NqzrZPO5c28PmMe9koMf+uWvY
 Pe53H2fy+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
 syy1SN8uQS+j7et39oIrlhUL1q5namDcqdfFyMkhIWAiMfNqHzuILSSwlFFi8XlZiLiMxMlp
 DawQtrDEn2tdbF2MXEA17xklLu96AeRwcPAK2Emsva0JUsMioCpxZeJ/sDm8AoISJ2c+YQGx
 RQXkJe7fmgEWFxbwlljROp8RxBYRMJdYN2kR2ExmgdVMEj96N7BDLPjJKLH78xE2kCpmAXGJ
 W0/mM4HYbAKGEl1vu8DinAJGEi+2bYOqMZPo2trFCGHLSzRvnc08gVFoFpJDZiEZNQtJyywk
 LQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIExuG2Yz8372Cc9+qj3iFGJg7GQ4wSHMxK
 IrxpvzvShXhTEiurUovy44tKc1KLDzGaAkNjIrOUaHI+MBHklcQbmhmYGpqYWRqYWpoZK4nz
 ul0+nyYkkJ5YkpqdmlqQWgTTx8TBKdXAtHe+seuP4g+7nk/ojxafcLC58cq9qzUvHOTPRvGv
 3f6NZ0dpb7ni5NsfzHoa7Vnf9R7Vl/sRsT7hUjBrpHrGT8ejx9mC97idnWPoVG29PeXv433e
 N5SCvtlyPLxo92GK+Mw9xybOza98tf3qw5+HtRu/X5A/GNF56FuZ8A4bgbQM2QCu9uMP7h/L
 niV2nrnNtNJr76Hw+4ohzrNW3Pja5i6VP9H13bqu16cmdQZ/dJcoXnr3bYGSY9eUe5lTborM
 8kpnzXBZu1fnafSN//m5Gt0CJaYMV0yWJb0463eVdeIXp5c3VMNndyu92Jgddv2zbd6ety3T
 qybZn/4hlNP4f5/e2rzAXF3XNxqVn6/vL1ViKc5INNRiLipOBABHug5cTAMAAA==
X-CMS-MailID: 20250117155844eucas1p2bb7e40910c67e412c0b4f7e54c1080ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.01.2025 15:09, Andy Shevchenko wrote:

> On Fri, Jan 17, 2025 at 02:57:52PM +0100, Marek Szyprowski wrote:
>> On 16.01.2025 13:42, Andy Shevchenko wrote:
>>> If the selector register is represented in each page, its value
>>> in accordance to the debugfs is stale because it gets synchronized
>>> only after the real page switch happens. Synchronize cache for
>>> the page selector.
>>>
>>> Before (offset followed by hexdump, the first byte is selector):
>>>
>>>       // Real registers
>>>       18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>       ...
>>>       // Virtual (per port)
>>>       40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>       50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>       60: 01 ff 00 00 ff ff 00 00 00 00 00 00
>>>       70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
>>>       80: 03 ff 00 00 00 00 00 00 00 00 00 ff
>>>       90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>
>>> After:
>>>
>>>       // Real registers
>>>       18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>       ...
>>>       // Virtual (per port)
>>>       40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>       50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>       60: 02 ff 00 00 ff ff 00 00 00 00 00 00
>>>       70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
>>>       80: 04 ff 00 00 00 00 00 00 00 00 00 ff
>>>       90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>
>>> Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> This patch landed in linux-next some time ago as commit 1fd60ed1700c
>> ("regmap: Synchronize cache for the page selector"). Today I've noticed
>> that it causes a regression for Lontium LT9611UXC HDMI bridge driver.
> Is there any datasheet link to the HW in question?
>
> (FWIW, I have tested this with the CY8C9540 GPIO I²C expander on Intel Galileo
>   Gen 1 board.)

I'm not aware of it, but I'm not related to lt9611uxc driver development 
at all...

>> With today's linux-next I got the following messages on QCom RB5 board:
>>
>> # dmesg | grep  lt9611uxc
>> [   13.737346] lt9611uxc 5-002b: LT9611 revision: 0x00.00.00
>> [   13.804190] lt9611uxc 5-002b: LT9611 version: 0x00
>> [   13.870564] lt9611uxc 5-002b: FW version 0, enforcing firmware update
>> [   13.877437] lt9611uxc 5-002b: Direct firmware load for
>> lt9611uxc_fw.bin failed with error -2
>> [   13.887517] lt9611uxc 5-002b: probe with driver lt9611uxc failed with
>> error -2
>>
>> after reverting the $subject patch, the driver probes fine on that board.
>>
>> I'm not sure if this is really a bug caused by this change or simply the
>> driver already was aligned to old regmap behavior. Dmitry, could you
>> check the regamp usage and review the changes introduced by this patch?
>> Let me know if there is anything to check on the real hardware to help
>> resolving this issue.
> Yes, see below. And thank you for your report!
>
> ...
>
>>> +		/*
>>> +		 * If selector register has been just updated, update the respective
>>> +		 * virtual copy as well.
>>> +		 */
>>> +		if (page_chg &&
>>> +		    in_range(range->selector_reg, range->window_start, range->window_len))
>>> +			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
> Can you add a test printk() here to show
>
> page_chg
> range->selector_reg, range->window_start, range->window_len
> sel_register, mask, val
>
> ?
>
> And would commenting these three lines make it work again?

I've added the following debug message before that check:

printk("page_chg %d range->selector_reg %x range->window_start %x 
range->window_len %x sel_register %x mask %x val %x\n", page_chg, 
range->selector_reg, range->window_start, range->window_len, 
sel_register, mask, val);

Here is the result:

root@target:~# modprobe lontium_lt9611uxc
[   29.892962] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   29.907419] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 81ff mask ff val 81
[   29.926712] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 81ff mask ff val 81
[   29.958301] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 81ff mask ff val 81
[   29.979951] lt9611uxc 5-002b: LT9611 revision: 0x00.00.00
[   29.987002] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   30.052370] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   30.066808] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register b0ff mask ff val b0
[   30.079859] lt9611uxc 5-002b: LT9611 version: 0x00
[   30.085990] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   30.151735] lt9611uxc 5-002b: FW version 0, enforcing firmware update
[   30.158830] lt9611uxc 5-002b: Direct firmware load for 
lt9611uxc_fw.bin failed with error -2
[   30.168653] lt9611uxc 5-002b: probe with driver lt9611uxc failed with 
error -2

after disabling the above mentioned 3 lines:

root@target:~# modprobe lontium_lt9611uxc
[   44.584893] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   44.597589] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 81ff mask ff val 81
[   44.609936] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 81ff mask ff val 81
[   44.622277] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 81ff mask ff val 81
[   44.634579] lt9611uxc 5-002b: LT9611 revision: 0x17.04.93
[   44.641444] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   44.710694] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   44.724579] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register b0ff mask ff val b0
[   44.736853] lt9611uxc 5-002b: LT9611 version: 0x40
[   44.743253] page_chg 1 range->selector_reg ff range->window_start 0 
range->window_len 100 sel_register 80ff mask ff val 80
[   44.816433] msm_dpu ae01000.display-controller: bound ae94000.dsi 
(ops dsi_ops [msm])
[   44.843944] msm_dpu ae01000.display-controller: bound 
ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[   44.862886] adreno 3d00000.gpu: supply vdd not found, using dummy 
regulator
[   44.870974] adreno 3d00000.gpu: supply vddcx not found, using dummy 
regulator
[   44.897116] platform 3d6a000.gmu: Adding to iommu group 27
[   44.938871] msm_dpu ae01000.display-controller: bound 3d00000.gpu 
(ops a3xx_ops [msm])
[   44.952435] [drm:dpu_kms_hw_init:1156] dpu hardware revision:0x60000000
[   44.976496] [drm] Initialized msm 1.12.0 for 
ae01000.display-controller on minor 0
...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

