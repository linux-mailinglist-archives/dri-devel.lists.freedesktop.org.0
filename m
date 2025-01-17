Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA87A153AC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574D910EB3B;
	Fri, 17 Jan 2025 16:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="XlvF2Bf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04210EB3D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:05:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250117160544euoutp02f1e3a9ff2983979c31ba18796fc5b60f~bhnsmutxW1791517915euoutp02H
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:05:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250117160544euoutp02f1e3a9ff2983979c31ba18796fc5b60f~bhnsmutxW1791517915euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737129944;
 bh=a6tOqrnrINZNt1HeWOxCpX+rnRHQcGPQqaCPkjFcLhY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=XlvF2Bf7Xl4wJ/6zY53SS+ocamC+NcRqFl+TggXA3W3rUr2LZ8fc85B7q3rQfvDRu
 GtPJ6mOlXK1NrckCma89c7QQPdgypVAEECq56dY056qgwQu+IHwSnhRUNWFwlTkaHF
 DeJXPQYcytinFcNIsspvUV8EvJ1TQE+lMZTt24d0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250117160544eucas1p2320342f0aea349a27352d6ac3edae71c~bhnsXvexG2157321573eucas1p23;
 Fri, 17 Jan 2025 16:05:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7E.8C.20409.8DF7A876; Fri, 17
 Jan 2025 16:05:44 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250117160544eucas1p121973640d5f6d8845b1c30bd692c3b15~bhnsAwLaZ0745607456eucas1p1l;
 Fri, 17 Jan 2025 16:05:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250117160544eusmtrp292e22fc965da2d2e93d08a7f57272459~bhnr99jpR1671216712eusmtrp2J;
 Fri, 17 Jan 2025 16:05:44 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-a7-678a7fd8558d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5A.15.19654.7DF7A876; Fri, 17
 Jan 2025 16:05:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250117160543eusmtip24de2560432668e730613392f07ea07d7~bhnrRiRQR1732817328eusmtip2v;
 Fri, 17 Jan 2025 16:05:43 +0000 (GMT)
Message-ID: <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
Date: Fri, 17 Jan 2025 17:05:42 +0100
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
In-Reply-To: <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87o36rvSDY69krHobZrOZDH14RM2
 i9fTPrBZTDz/k83iytf3bBbNi9ezWVzeNYfNYu6XqcwOHB6bVnWyedy5tofNY97JQI/9c9ew
 e9zvPs7k8XmTXABbFJdNSmpOZllqkb5dAlfG3DdrWQvOq1WsXhbfwPhbtouRk0NCwERi496r
 bF2MXBxCAisYJa78n8IM4XxhlNh7dRE7hPOZUeLD6QMsMC03Wj+wQiSWM0p0tuxjgnA+MkpM
 n/UcKMPBwStgJzHnZiVIA4uAqsTO6VfAmnkFBCVOznwCZosKyEvcvzWDHcQWFvCWWNE6nxHE
 FhEwl1g3aRHYTcwCq5kkHvXfYAJJMAuIS9x6Mh/MZhMwlOh628UGYnMKGEl0f3vMDFEjL9G8
 dTYzxKVvOCSO/4d61EXi06b/bBC2sMSr41vYIWwZif8754M9ICHQziix4Pd9KGcCo0TD81uM
 EFXWEnfO/WID+YxZQFNi/S59iLCjxJXt01hAwhICfBI33gpC3MAnMWnbdGaIMK9ER5sQRLWa
 xKzj6+DWHrxwiXkCo9IspGCZheTLWUi+mYWwdwEjyypG8dTS4tz01GKjvNRyveLE3OLSvHS9
 5PzcTYzApHT63/EvOxiXv/qod4iRiYPxEKMEB7OSCG/a7450Id6UxMqq1KL8+KLSnNTiQ4zS
 HCxK4ryL9remCwmkJ5akZqemFqQWwWSZODilGph8H3nO9jV2u/jriNGTd6yZj631l2xZHdVV
 q/LSatrN0OyueYt+Oqo4GB/bc/5si4V1ccO6z+1LnyTNWnz6q+x3mVh1v2+nZ696b566Uc7F
 eOEu4QOJ1494f5da2bDUc1XCxl6xryda3Bbc6Cq6vLKR8/5CX8Ws+0fjNi1Of+7PdmRj7ekC
 c5aum2o8kkVPM+OOOCWKvZh8gaO3mn2z5ybNjyu0Z2yfqKJ99srLHM2N+kpf98qe49jb0PrE
 aubfy2VzdZpmNk594DXnl1Vs8vSZxQVzn5VPcjG/bybCdDQuY1H1Tv4gvce/rmaebX3hrZ44
 c0avqM+NjdtvNMn9vM/TI2eyin2iwAnefEcVaemnSizFGYmGWsxFxYkAzUN1abkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7o36rvSDX6KWvQ2TWeymPrwCZvF
 62kf2Cwmnv/JZnHl63s2i+bF69ksLu+aw2Yx98tUZgcOj02rOtk87lzbw+Yx72Sgx/65a9g9
 7ncfZ/L4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
 LLVI3y5BL2Pum7WsBefVKlYvi29g/C3bxcjJISFgInGj9QNrFyMXh5DAUkaJaec2skEkZCRO
 TmtghbCFJf5c62KDKHrPKHHpfxNQgoODV8BOYs7NSpAaFgFViZ3Tr7CA2LwCghInZz4Bs0UF
 5CXu35rBDmILC3hLrGidzwhiiwiYS6ybtAhsJrPAaiaJH70b2CEWzGeSOLfnONgVzALiEree
 zGcCsdkEDCW63naBxTkFjCS6vz1mhqgxk+ja2sUIYctLNG+dzTyBUWgWkkNmIRk1C0nLLCQt
 CxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRG4bZjP7fsYFz56qPeIUYmDsZDjBIczEoi
 vGm/O9KFeFMSK6tSi/Lji0pzUosPMZoCQ2Mis5Rocj4wDeSVxBuaGZgamphZGphamhkrifOy
 XTmfJiSQnliSmp2aWpBaBNPHxMEp1cDk7LjAegP3jUKFj71/dJplt993U3/YydZQY60wef/O
 X80LFku2feE9sLHj9srPc8/N5Tc9sitK+tHqyWFcpkf5zhVNKou/usnf/fja6T89v8ikejsv
 Sby/MP6KjZDdEqWXzVsYv9/dOuffuqPzUsyXvSsLZtu1PytrUYqFy87qE1k5np9Fe/4aBUeW
 CAXc235vgav+k+lPphQ/fflEdDXXhsk7s+9OKkvbEn+4yGXK/ooTbyOis7Qlq2/ObbS2vnvx
 9/8J5952VXuKtrVsS59bwhv1/P2KuEy1OblTX5w4fa1wqxFzSPaUoLioZW5/v1+qVF6X78zv
 FnjlmrJbi3B0wGORN89kRW8sZE+v3XZlrRJLcUaioRZzUXEiANPcemRLAwAA
X-CMS-MailID: 20250117160544eucas1p121973640d5f6d8845b1c30bd692c3b15
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com> <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
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

On 17.01.2025 15:30, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 04:09:58PM +0200, Andy Shevchenko wrote:
>> On Fri, Jan 17, 2025 at 02:57:52PM +0100, Marek Szyprowski wrote:
>>> On 16.01.2025 13:42, Andy Shevchenko wrote:
>>>> If the selector register is represented in each page, its value
>>>> in accordance to the debugfs is stale because it gets synchronized
>>>> only after the real page switch happens. Synchronize cache for
>>>> the page selector.
>>>>
>>>> Before (offset followed by hexdump, the first byte is selector):
>>>>
>>>>       // Real registers
>>>>       18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>       ...
>>>>       // Virtual (per port)
>>>>       40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>       50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>       60: 01 ff 00 00 ff ff 00 00 00 00 00 00
>>>>       70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
>>>>       80: 03 ff 00 00 00 00 00 00 00 00 00 ff
>>>>       90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>
>>>> After:
>>>>
>>>>       // Real registers
>>>>       18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>       ...
>>>>       // Virtual (per port)
>>>>       40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>       50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>       60: 02 ff 00 00 ff ff 00 00 00 00 00 00
>>>>       70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
>>>>       80: 04 ff 00 00 00 00 00 00 00 00 00 ff
>>>>       90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>
>>>> Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
>>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> This patch landed in linux-next some time ago as commit 1fd60ed1700c
>>> ("regmap: Synchronize cache for the page selector"). Today I've noticed
>>> that it causes a regression for Lontium LT9611UXC HDMI bridge driver.
>> Is there any datasheet link to the HW in question?
>>
>> (FWIW, I have tested this with the CY8C9540 GPIO I²C expander on Intel Galileo
>>   Gen 1 board.)
>>
>>> With today's linux-next I got the following messages on QCom RB5 board:
>>>
>>> # dmesg | grep  lt9611uxc
>>> [   13.737346] lt9611uxc 5-002b: LT9611 revision: 0x00.00.00
>>> [   13.804190] lt9611uxc 5-002b: LT9611 version: 0x00
>>> [   13.870564] lt9611uxc 5-002b: FW version 0, enforcing firmware update
>>> [   13.877437] lt9611uxc 5-002b: Direct firmware load for
>>> lt9611uxc_fw.bin failed with error -2
>>> [   13.887517] lt9611uxc 5-002b: probe with driver lt9611uxc failed with
>>> error -2
>>>
>>> after reverting the $subject patch, the driver probes fine on that board.
>>>
>>> I'm not sure if this is really a bug caused by this change or simply the
>>> driver already was aligned to old regmap behavior. Dmitry, could you
>>> check the regamp usage and review the changes introduced by this patch?
>>> Let me know if there is anything to check on the real hardware to help
>>> resolving this issue.
>> Yes, see below. And thank you for your report!
>>
>> ...
>>
>>>> +		/*
>>>> +		 * If selector register has been just updated, update the respective
>>>> +		 * virtual copy as well.
>>>> +		 */
>>>> +		if (page_chg &&
>>>> +		    in_range(range->selector_reg, range->window_start, range->window_len))
>>>> +			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
>> Can you add a test printk() here to show
>>
>> page_chg
>> range->selector_reg, range->window_start, range->window_len
>> sel_register, mask, val
>>
>> ?
>>
>> And would commenting these three lines make it work again?
> Also try to apply this patch (while having the above lines not commented):

This patch applied alone doesn't change anything. Probe still fails.

However, with the mentioned 3 lines in the regmap code commented AND 
this patch applied, lt9611uxc driver probe also fails. Does it mean that 
there is really a bug in the driver?

>  From 0fe5fe51d8b86305a4ca1ae44ede34a24fe2f9d7 Mon Sep 17 00:00:00 2001
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date: Fri, 17 Jan 2025 16:29:19 +0200
> Subject: [PATCH 1/1] TBD:
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index f4c3ff1fdc69..35a1dd568bbb 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -69,7 +69,7 @@ struct lt9611uxc {
>   static const struct regmap_range_cfg lt9611uxc_ranges[] = {
>   	{
>   		.name = "register_range",
> -		.range_min =  0,
> +		.range_min = 0x0100,
>   		.range_max = 0xd0ff,
>   		.selector_reg = LT9611_PAGE_CONTROL,
>   		.selector_mask = 0xff,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

