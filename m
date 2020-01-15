Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592813C72E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713D96EAD8;
	Wed, 15 Jan 2020 15:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFB46EAD8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:16:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115151646euoutp01cd0de01afc58ade2ef7a76e6fe0d18a0~qGFzbiLn_2976929769euoutp019
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:16:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200115151646euoutp01cd0de01afc58ade2ef7a76e6fe0d18a0~qGFzbiLn_2976929769euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579101406;
 bh=N07jBECcaGqq4VB4q54/zMIlWBsa3RYsqTuCu9Rdyu4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Tgc2rK2P8dK5dTX0UKLooPDPdkXgjOiINboFzTl8ms9+mjmCaixvjTgxqzdp+8FS4
 hYFFh0EwZSzEtsQ3PVY6SE7AqHgP9Wk+8g6215HR0INyJ4DHve3JJmyir6O4w3sTLl
 POQsNvJ/nYBK5lvIPskM21fq7M3kf4pwPEoWbE9U=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115151646eucas1p11734f25e7720fc56a7ec3c9e3776633f~qGFzEQ0XS2610926109eucas1p1i;
 Wed, 15 Jan 2020 15:16:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 22.91.60698.DDC2F1E5; Wed, 15
 Jan 2020 15:16:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115151645eucas1p2241fc1538cd4518051c56325fcad5901~qGFyuRK4l3174031740eucas1p2t;
 Wed, 15 Jan 2020 15:16:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200115151645eusmtrp2a0ebdaf8a88140c8f9893147b0fabeb6~qGFytaF8P2330623306eusmtrp2e;
 Wed, 15 Jan 2020 15:16:45 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-2b-5e1f2cdde18d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 38.BD.07950.DDC2F1E5; Wed, 15
 Jan 2020 15:16:45 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115151644eusmtip156aac6e446621275c61f447d2333550a~qGFxrL4fL1521915219eusmtip1R;
 Wed, 15 Jan 2020 15:16:44 +0000 (GMT)
Subject: Re: [PATCH v4] video: hyperv: hyperv_fb: Use physical memory for fb
 on HyperV Gen 1 VMs.
To: Dexuan Cui <decui@microsoft.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <5a58696d-7f23-a577-c25e-ebe748b1aef0@samsung.com>
Date: Wed, 15 Jan 2020 16:16:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <HK0P153MB0148F18913BEA45144AF8443BF3C0@HK0P153MB0148.APCP153.PROD.OUTLOOK.COM>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGc2emM0O1MlYIxw21UaNGQYTEKypq4sM8qYlrXNAKE1AWSQuu
 D+IKgiCgCFYQIwZKqWBqWWRVUMCojRubYkCDQUjaIigRCyLDQOTtO8t///MnlyWV8fQs9kh4
 pKAJV4eqaDlVXDdoWfF5+Tz/lQ0ja3CMLYfBwyl1DK66aEL4wy87jS9kF9K4qYTHefnPCdx6
 rpzAnflFDG5I7JXh1OReGr8vy6Bxz4WvNH7w7DOD7X1XCJzTaqGwfrAIYZOxicbW2qckdqQ5
 bXThHX9SEH/HeIbPrugmeJPhCs1XZxoZvj2+nuDLW6NpPqnXSvOXSocZ/v7NRppPNBsQ329y
 3zZ1r3xdoBB65Lig8fQ7JA9O0BVQEW0zT1qMibJoFO8ah5xY4Hwg4XmSTGQlp0fwtHJuHJKP
 8k8ExnsOJBX9CArsf+gJhflDISENchE8eqOTSYUVgaPFMDph2RlcAAwP7BAFLtxCOP/zHSnu
 kFw6A9defR97ieZ8ITnGgERWcH6Q1mgaY4pbBEMNGaTIrtwe6OuolUk70+HFrU5KfN+J2w/X
 C1eLbZJzg4+dWYTE86DEmjHmBVwFC08cg5R09Wa4m/laJvEM6Kk3MxLPgZHHWYQkKEAwHPt9
 XF2CIPf63/HMa6HNIuZnRy2WQmGZp9TeBG8H7pBiG7hp0GKdLh0xDVKK08bbCoi9rJS2F8PD
 nIf0hG3c4zwyCal0k5LpJsXRTYqj++97F1EG5CZEacOCBK13uHDCQ6sO00aFB3kEHAszodEv
 +vJv/a9SVDV0uAZxLFJNVQQPufsrZerj2lNhNQhYUuWieJE+11+pCFSfOi1ojh3URIUK2ho0
 m6VUbgrve90HlFyQOlIIEYQIQTMxJVinWdFozqeunb67SLmmvfjLk9mNFpvX0ZDa1DJDaXAH
 s6OsTu9Zrusfad6d4OHrtq/bq/d9p8397KHsvoWV968Nzi9a75Nl7bItNrt45utWbjVtXuUj
 PxpnWbJl/fYF0c3pj5KVV6ectdhJ54vLnOtvmG3fUnuqvTekK2b+dtbfzvLrGjjxQ0Vpg9Ve
 y0iNVv0Pu4MiUZ4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe8/Zzs7MxWkqvo3SOF0JnU5nexWTvnnoU5CQpKnDTi5yTnbm
 rSIsNXPW8IKay7QypXS5HOYlo3TljSDBG3iPErTyssoCm0rOJfjtD8/v9zw88CdxcQVfQl5K
 0rHaJGUiTbjwPqz3TPpO+njH+I91HEa5i7UCtFbULUBvsi0ADf1eIlBWtZlAIy0MelbfhaHR
 G+0Ymql/KUC9BhsflRTaCDT4qoJA37I+E+j5+0kBWvqZh6Ha0Y889HTlJUAW0wiBFt514she
 Jjzpztj/FgGm0nSVqX79FWMsdXkE8/aBScBM5/dgTPtoJsEU2BYIJqd1TcA8KR0mGENTHWB+
 WbxOu56Thmo1KTp2v0rD6U7QUTIUIJUFI2mAPFgqC1ScDwkIov3CQi+wiZdSWa1fWJxUddfY
 wEue2JP+0WTgZ4J8Dz0QkpCSw6YhM6YHLqSYqgFwvX8c6AG5MdgLe8ypTsYNro7oCSfzHcDC
 HDvuYNyoeLj2J8LBuFMH4c3lAdyRccoogFOfaCffgMF+ayNwDAgqBBbm1m1mERUGy4Ytm5lH
 HYKrvRWbsgcVCd+1Gv8zu2Ff+QzPcUtIRcNis8K5/whcrdy65QnHZqowZ/aGLQsVeAEQG7fZ
 xm2KcZti3KY8BLw64M6mcOoENRcg5ZRqLiUpQRqvUVvARjOau1eaWoF+8YwVUCSgXUUd614x
 Yr4ylctQWwEkcdpd1HdvX4xYdEGZcYXVamK1KYksZwVBG78V4hKPeM1Gz5J0sbIgmQIFyxSB
 isDjiPYU3aY6o8VUglLHXmbZZFa75WGkUJIJrn+oSTvgo6jCJKzrc7GyeWIg3XcuZ5BdPNUy
 ktdWLfQ7ZJ8qkw/NUXJT3OOJFz+O6kMeHd45tQM2z3qllXPHdtleC1W4YTqq61ZfUXZj4osv
 EfJ0bDl8nCy4WDNmWwi334lEZ82a+x60/2xpQaebpOjavMQ0WVyiXSlfnW+jeZxKKTuGaznl
 P9CockovAwAA
X-CMS-MailID: 20200115151645eucas1p2241fc1538cd4518051c56325fcad5901
X-Msg-Generator: CA
X-RootMTR: 20200106223809eucas1p19d62a7481db309e28b64977639dc94c7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200106223809eucas1p19d62a7481db309e28b64977639dc94c7
References: <20191209075749.3804-1-weh@microsoft.com>
 <CY4PR21MB06293C21EC5338C98080F6AED7580@CY4PR21MB0629.namprd21.prod.outlook.com>
 <CGME20200106223809eucas1p19d62a7481db309e28b64977639dc94c7@eucas1p1.samsung.com>
 <HK0P153MB0148F18913BEA45144AF8443BF3C0@HK0P153MB0148.APCP153.PROD.OUTLOOK.COM>
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
Cc: "sashal@kernel.org" <sashal@kernel.org>, "info@metux.net" <info@metux.net>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, kbuild test robot <lkp@intel.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
 Wei Hu <weh@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "hch@lst.de" <hch@lst.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/6/20 11:37 PM, Dexuan Cui wrote:
>> From: Michael Kelley <mikelley@microsoft.com>
>> Sent: Monday, December 9, 2019 8:33 AM
>> To: Wei Hu <weh@microsoft.com>; b.zolnierkie@samsung.com; KY
>> Srinivasan <kys@microsoft.com>; Haiyang Zhang <haiyangz@microsoft.com>;
>> Stephen Hemminger <sthemmin@microsoft.com>; sashal@kernel.org;
>> hch@lst.de; m.szyprowski@samsung.com; mchehab+samsung@kernel.org;
>> sam@ravnborg.org; gregkh@linuxfoundation.org;
>> alexandre.belloni@bootlin.com; info@metux.net; arnd@arndb.de;
>> dri-devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org;
>> linux-kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; Dexuan Cui
>> <decui@microsoft.com>
>> Cc: kbuild test robot <lkp@intel.com>
>> Subject: RE: [PATCH v4] video: hyperv: hyperv_fb: Use physical memory for
>> fb on HyperV Gen 1 VMs.
>>
>> From: Wei Hu <weh@microsoft.com> Sent: Sunday, December 8, 2019 11:58
>> PM
>>>
>>> On Hyper-V, Generation 1 VMs can directly use VM's physical memory for
>>> their framebuffers. This can improve the efficiency of framebuffer and
>>> overall performance for VM. The physical memory assigned to framebuffer
>>> must be contiguous. We use CMA allocator to get contiguous physicial
>>> memory when the framebuffer size is greater than 4MB. For size under
>>> 4MB, we use alloc_pages to achieve this.
>>>
>>> To enable framebuffer memory allocation from CMA, supply a kernel
>>> parameter to give enough space to CMA allocator at boot time. For
>>> example:
>>>     cma=130m
>>> This gives 130MB memory to CAM allocator that can be allocated to
>>> framebuffer. If this fails, we fall back to the old way of using
>>> mmio for framebuffer.
>>>
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>> Signed-off-by: Wei Hu <weh@microsoft.com>
>>> ---
>>>     v2: Incorporated review comments form hch@lst.de, Michael Kelley
>> and
>>>     Dexuan Cui
>>>     - Use dma_alloc_coherent to allocate large contiguous memory
>>>     - Use phys_addr_t for physical addresses
>>>     - Corrected a few spelling errors and minor cleanups
>>>     - Also tested on 32 bit Ubuntu guest
>>>     v3: Fixed a build issue reported by kbuild test robot and incorported
>>>     some review comments from Michael Kelley
>>>     - Add CMA check to avoid link failure
>>>     - Fixed small memory leak introduced by alloc_apertures
>>>     - Cleaned up so code
>>>     v4: Removed request_pages variable as it is no longer needed
>>>
>>>  drivers/video/fbdev/Kconfig     |   1 +
>>>  drivers/video/fbdev/hyperv_fb.c | 182
>> +++++++++++++++++++++++++-------
>>>  2 files changed, 144 insertions(+), 39 deletions(-)
>>>
>>
>> Reviewed-by: Michael Kelley <mikelley@microsoft.com>
> 
> Tested-by: Dexuan Cui <decui@microsoft.com>
> 
> For a Gen-1 VM running on recent Hyper-V hosts, this patch can greatly 
> reduce the CPU utilization because it avoids the slow data copy from the 
> shadow framebuffer to the MMIO framebuffer, and hence it resolves the
> "blurred screen" issue when we output a lot of characters on the text-mode
> ternimal (e.g. "dmesg").

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
