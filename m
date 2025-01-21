Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42698A17899
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 08:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA0410E4E3;
	Tue, 21 Jan 2025 07:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="o9x+tVD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6435B10E4E3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 07:33:12 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250121073311euoutp01d7d1397d494466230701b56076d01043~cpNUHRgeM1157911579euoutp01W
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 07:33:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250121073311euoutp01d7d1397d494466230701b56076d01043~cpNUHRgeM1157911579euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737444791;
 bh=BJrt4Xg1eumCioeAb/zJZPEjDZFr0PkoBpfji8TJvGI=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=o9x+tVD9RqIRT1FGQ8svkKrLzBessvRk9AHF98V/JzVfj2lzwbbVXWYS6phUOMGtT
 3fuw7VvJVWIZSnmCtYvH6YJ8Z828y3rKL3TuHvWtJGlHQPLHqsHkKFl6rqwSxbFtHZ
 X/G8Iz/VKbqF9JX4+3XZ92McpmRezUsDJL/b8VA8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250121073310eucas1p15b4eee8152c010ec1236a58951bd8e0d~cpNTz85eX1601516015eucas1p1R;
 Tue, 21 Jan 2025 07:33:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9C.EA.20821.6BD4F876; Tue, 21
 Jan 2025 07:33:10 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250121073310eucas1p2ec7ab1a881b9412cbe3e34b9b3282b7f~cpNTgcF6h2831328313eucas1p2C;
 Tue, 21 Jan 2025 07:33:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250121073310eusmtrp110438bdf309caea751e1a549c53dc086~cpNTf0fDQ1481614816eusmtrp1f;
 Tue, 21 Jan 2025 07:33:10 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-f4-678f4db6aa76
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.EA.19654.6BD4F876; Tue, 21
 Jan 2025 07:33:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250121073309eusmtip1d4c9d8433dce5156f04c48ced5a9f1ec~cpNTAUAXh1479514795eusmtip1e;
 Tue, 21 Jan 2025 07:33:09 +0000 (GMT)
Message-ID: <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
Date: Tue, 21 Jan 2025 08:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
In-Reply-To: <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djP87rbfPvTDbbf1LHobZrOZDH14RM2
 i9fTPrBZTDz/k83iytf3bBbNi9ezWVzeNYfNYu6XqcwOHB6bVnWyedy5tofNY97JQI/9c9ew
 e9zvPs7k8XmTXABbFJdNSmpOZllqkb5dAlfGudd7mAp+aVVs+baMvYFxhmIXIyeHhICJxMPN
 S1i7GLk4hARWMEo8f76VFSQhJPCFUWL/bhaIxGdGiTuNe5hhOhpXn2CHSCxnlJh54SwjhPOR
 UeLs9ieMIFW8AnYSu3Z8ARvFIqAq8efZOxaIuKDEyZlPwGxRAXmJ+7dmsIPYbAKGEl1vu9hA
 bGEBb4kVrfPB5ogImEusm7SIDWQBs8BqJolH/TeYQBLMAuISt57MB7M5BYwk5q2+CxWXl2je
 OpsZpEFC4AWHxK85O1kh7naROHTjPhOELSzx6vgWdghbRuL05B4WiIZ2RokFv0GKQJwJjBIN
 z28xQlRZS9w59wvoDg6gFZoS63fpQ4QdJa5sn8YCEpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqE
 IKrVJGYdXwe39uCFS8wTGJVmIYXLLCSvzULyziyEvQsYWVYxiqeWFuempxYb5qWW6xUn5haX
 5qXrJefnbmIEJqbT/45/2sE499VHvUOMTByMhxglOJiVRHhFP/SkC/GmJFZWpRblxxeV5qQW
 H2KU5mBREuddtL81XUggPbEkNTs1tSC1CCbLxMEp1cCkzmBxWPiBp4xzUt/EUxPWXZjA7TV7
 03beo2dblx/W0BN9fz39sVHPzaUbjO1ObnobsyeJd5frBiEbL6bCTZ4Veh9+9TVclQtdX1A9
 zbM6TH7uvtJVV+J9Fu3pCd0Slld583LUb5WzW3e6Cq50nS24bcYW/xV330d6a/Gf1LbxidPN
 Pb+Rv0sizY+51cu+u7N2e/XSxy+WnxJakaNuuYX1htX0yavjXeeI/9+a1/jGTnVXy/3/9bl3
 1F9VOGovF9/wuLXRsUNH7viyFb0dl9d0JB//77iH4c/E7OAVjHc9X98oyjB6dNXt2A4p9iv/
 PM7Ovfb60sYpm076fH+v9WGByvzcbymJJ9nq5LInv5TgUWIpzkg01GIuKk4EAPIVCIi7AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xu7rbfPvTDa69ErPobZrOZDH14RM2
 i9fTPrBZTDz/k83iytf3bBbNi9ezWVzeNYfNYu6XqcwOHB6bVnWyedy5tofNY97JQI/9c9ew
 e9zvPs7k8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
 Zllqkb5dgl7Gudd7mAp+aVVs+baMvYFxhmIXIyeHhICJROPqE+wgtpDAUkaJuT/cIOIyEien
 NbBC2MISf651sXUxcgHVvGeUuH+wlQUkwStgJ7FrxxewIhYBVYk/z95BxQUlTs58AmaLCshL
 3L81A2wBm4ChRNdbkEGcHMIC3hIrWuczgtgiAuYS6yYtAlvALLCaSeJH7wZ2iG1/mCRWnzwD
 NolZQFzi1pP5TCA2p4CRxLzVd5kg4mYSXVu7GCFseYnmrbOZJzAKzUJyyCwk7bOQtMxC0rKA
 kWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYCRuO/Zzyw7Gla8+6h1iZOJgPMQowcGsJMIr
 +qEnXYg3JbGyKrUoP76oNCe1+BCjKTA0JjJLiSbnA1NBXkm8oZmBqaGJmaWBqaWZsZI4L9uV
 82lCAumJJanZqakFqUUwfUwcnFINTEWlAesv5HOE3Qj8UvRWzvK22I/HDAmeitF392Q93p3G
 zyxuvzPWWWF/ywXRqaarsrjPBx77+HKBjKzlN277E/4qV2LlU7ONbNN8LnbrfcwK71nxUGqG
 fXVrXZKNfl9r2pcD3yXl/BRmNU3sOHHe+X+5hm+5rsi79yX2G/54Cn+PXt68kyWsleW+g+7m
 CRxPNe7mHbT42DIr0ON7il3PP7Uda8SCTKZYXTXY7fPzwL+fk4W7Kh9KvDjUbTtlyrVqxRDr
 VZPP7nU7vUDkSY96/u34WUu/M0iJf2KzEbxjmKnJlCpT/+3PqQcKLkZfP319wSR3Z53/kh9u
 rZpvDt05zd+55Iyu075VKrXrQ27PUmIpzkg01GIuKk4EAPaAnaNNAwAA
X-CMS-MailID: 20250121073310eucas1p2ec7ab1a881b9412cbe3e34b9b3282b7f
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
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
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

On 17.01.2025 18:28, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:
>> On 17.01.2025 15:30, Andy Shevchenko wrote:
>>> On Fri, Jan 17, 2025 at 04:09:58PM +0200, Andy Shevchenko wrote:
>>>> On Fri, Jan 17, 2025 at 02:57:52PM +0100, Marek Szyprowski wrote:
>>>>> On 16.01.2025 13:42, Andy Shevchenko wrote:
>>>>>> If the selector register is represented in each page, its value
>>>>>> in accordance to the debugfs is stale because it gets synchronized
>>>>>> only after the real page switch happens. Synchronize cache for
>>>>>> the page selector.
>>>>>>
>>>>>> Before (offset followed by hexdump, the first byte is selector):
>>>>>>
>>>>>>        // Real registers
>>>>>>        18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>>>        ...
>>>>>>        // Virtual (per port)
>>>>>>        40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>>>        50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>>>        60: 01 ff 00 00 ff ff 00 00 00 00 00 00
>>>>>>        70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
>>>>>>        80: 03 ff 00 00 00 00 00 00 00 00 00 ff
>>>>>>        90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>>>
>>>>>> After:
>>>>>>
>>>>>>        // Real registers
>>>>>>        18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>>>        ...
>>>>>>        // Virtual (per port)
>>>>>>        40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>>>        50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
>>>>>>        60: 02 ff 00 00 ff ff 00 00 00 00 00 00
>>>>>>        70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
>>>>>>        80: 04 ff 00 00 00 00 00 00 00 00 00 ff
>>>>>>        90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>>>>>>
>>>>>> Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
>>>>>> Signed-off-by: Andy Shevchenko<andriy.shevchenko@linux.intel.com>
>>>>> This patch landed in linux-next some time ago as commit 1fd60ed1700c
>>>>> ("regmap: Synchronize cache for the page selector"). Today I've noticed
>>>>> that it causes a regression for Lontium LT9611UXC HDMI bridge driver.
>>>> Is there any datasheet link to the HW in question?
>>>>
>>>> (FWIW, I have tested this with the CY8C9540 GPIO I²C expander on Intel Galileo
>>>>    Gen 1 board.)
>>>>
>>>>> With today's linux-next I got the following messages on QCom RB5 board:
>>>>>
>>>>> # dmesg | grep  lt9611uxc
>>>>> [   13.737346] lt9611uxc 5-002b: LT9611 revision: 0x00.00.00
>>>>> [   13.804190] lt9611uxc 5-002b: LT9611 version: 0x00
>>>>> [   13.870564] lt9611uxc 5-002b: FW version 0, enforcing firmware update
>>>>> [   13.877437] lt9611uxc 5-002b: Direct firmware load for
>>>>> lt9611uxc_fw.bin failed with error -2
>>>>> [   13.887517] lt9611uxc 5-002b: probe with driver lt9611uxc failed with
>>>>> error -2
>>>>>
>>>>> after reverting the $subject patch, the driver probes fine on that board.
>>>>>
>>>>> I'm not sure if this is really a bug caused by this change or simply the
>>>>> driver already was aligned to old regmap behavior. Dmitry, could you
>>>>> check the regamp usage and review the changes introduced by this patch?
>>>>> Let me know if there is anything to check on the real hardware to help
>>>>> resolving this issue.
>>>> Yes, see below. And thank you for your report!
> ...
>
>>>>>> +		/*
>>>>>> +		 * If selector register has been just updated, update the respective
>>>>>> +		 * virtual copy as well.
>>>>>> +		 */
>>>>>> +		if (page_chg &&
>>>>>> +		    in_range(range->selector_reg, range->window_start, range->window_len))
>>>>>> +			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
>>>> Can you add a test printk() here to show
>>>>
>>>> page_chg
>>>> range->selector_reg, range->window_start, range->window_len
>>>> sel_register, mask, val
>>>>
>>>> ?
>>>>
>>>> And would commenting these three lines make it work again?
>>> Also try to apply this patch (while having the above lines not commented):
>> This patch applied alone doesn't change anything. Probe still fails.
>>
>> However, with the mentioned 3 lines in the regmap code commented AND
>> this patch applied, lt9611uxc driver probe also fails.
> Does it fail in the same way?

Yes, the hw revision is reported as zero in this case: LT9611 revision: 
0x00.00.00

>> Does it mean that there is really a bug in the driver?
> Without looking at the datasheet it's hard to say. At least what I found so far
> is one page of the I²C traffic dump on Windows as an example how to use their
> evaluation board and software, but it doesn't unveil the bigger picture. At
> least what I think is going on here is that the programming is not so easy as
> just paging. Something is more complicated there.
>
> But at least (and as Mark said) the most of the regmap based drivers got
> the ranges wrong (so, at least there is one bug in the driver).

I can do more experiments if this helps. Do you need a dump of all 
regmap accesses or i2c traffic from this driver?

>>> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>>> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>>> @@ -69,7 +69,7 @@ struct lt9611uxc {
>>>    static const struct regmap_range_cfg lt9611uxc_ranges[] = {
>>>    	{
>>>    		.name = "register_range",
>>> -		.range_min =  0,
>>> +		.range_min = 0x0100,
>>>    		.range_max = 0xd0ff,
>>>    		.selector_reg = LT9611_PAGE_CONTROL,
>>>    		.selector_mask = 0xff,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

