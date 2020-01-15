Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED1313C345
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 14:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618996E9EA;
	Wed, 15 Jan 2020 13:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB436E9EA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:35:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115133459euoutp0156b49e4b316a634986d06cdfffcc8c8c~qEs7bk_nA0830508305euoutp01N
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:34:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200115133459euoutp0156b49e4b316a634986d06cdfffcc8c8c~qEs7bk_nA0830508305euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579095299;
 bh=Wyj7xb2hHhoWQ11nk70/XEqS3v06yRBiPdUaYN7dYRA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=HTiK5zFlGemlOdz+30GNuhA/IJOoiGLyyEme9bd2Sm7qH8WV7A94NRF1q3KLoQ4Mw
 Co56Sbsda+scKY/PNx3FuQhRL+dy6qNndXvnFiGR7RGQ/r5cc/zoK4P5URJuM8F4lQ
 qVjaH4EM5HQDeZVdEFGqMbMH7zpA8gHcs6crk/0A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200115133458eucas1p2e3df808a4c784a69526c2dbfcff5b201~qEs7Mj4_e2289222892eucas1p25;
 Wed, 15 Jan 2020 13:34:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 1F.5E.60679.2051F1E5; Wed, 15
 Jan 2020 13:34:58 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115133458eucas1p2da22edad7c425619cc99dc49df712ada~qEs6s9DOR2438824388eucas1p2G;
 Wed, 15 Jan 2020 13:34:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200115133458eusmtrp263d592c218074fca7ebac1692b52152b~qEs6sP5Kh2458424584eusmtrp2c;
 Wed, 15 Jan 2020 13:34:58 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-29-5e1f1502c113
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.AF.08375.2051F1E5; Wed, 15
 Jan 2020 13:34:58 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200115133457eusmtip2a48b48b49458d709d82ba2176edd2660~qEs5_uYIX0906309063eusmtip29;
 Wed, 15 Jan 2020 13:34:57 +0000 (GMT)
Subject: Re: [PATCH][RESEND] video: hyperv_fb: Fix hibernation for the
 deferred IO feature
To: Sasha Levin <sashal@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <9fbc3d79-d825-c8be-b9fa-74cc79b30f56@samsung.com>
Date: Wed, 15 Jan 2020 14:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200111162957.GK1706@sasha-vm>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djPc7pMovJxBrebdCx+bJKy2NeyidHi
 ytf3bBbXtntYPFm9ld3iRN8HVoupEz+wWVzeNYfNYtnNcywWm9ZcY7N4e/ggs8Xv6ZwOPB6b
 VnWyedzvPs7kcX3ddkaP1h1/2T0+b5ILYI3isklJzcksSy3St0vgyph85i5rwTWeij+/V7E2
 MJ7h6mLk5JAQMJF41HuPpYuRi0NIYAWjxOoDm9ghnC+MEp1fJrGDVAkJfGaUmHheF6ZjfkcH
 VMdyRoknH6ewQjhvGSVWdC5lBKkSFoiRmPO+hQ3EFhFQluhctxSsiFlgE5PEk8dvwRJsAlYS
 E9tXgTXwCthJnL+xDCzOIqAqcblnN1hcVCBC4tODw6wQNYISJ2c+YQGxOQV0JT6uncQEYjML
 iEvcejIfypaX2P52DjPIMgmBa+wSsz8cYIW420Vix9wGFghbWOLV8S3sELaMxP+dIM0gDesY
 Jf52vIDq3s4osXzyPzaIKmuJO+d+AdkcQCs0Jdbv0ocIO0qsbD7HDBKWEOCTuPFWEOIIPolJ
 26ZDhXklOtqEIKrVJDYs28AGs7Zr50rmCYxKs5C8NgvJO7OQvDMLYe8CRpZVjOKppcW56anF
 Rnmp5XrFibnFpXnpesn5uZsYgSnr9L/jX3Yw7vqTdIhRgINRiYc3449cnBBrYllxZe4hRgkO
 ZiUR3pMzZOOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRq
 YJzB6D/r7/wf616KZJz7lN0a/rJda/HL0OqFk88flThhr1+cZq6u+POrjF2WNccqzprLB5sU
 va5Ldfdbu1i768/J9CgTmjCBNW/d/007/dtWXLYuW8h3a93Fs29PZ1UbPnirFPmGx6zk1fSg
 7fymi+s36RXWLRSxFW2ym9Sw0DTlRsClbG1NZSWW4oxEQy3mouJEALWcqIBVAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xe7pMovJxBhM6OC1+bJKy2NeyidHi
 ytf3bBbXtntYPFm9ld3iRN8HVoupEz+wWVzeNYfNYtnNcywWm9ZcY7N4e/ggs8Xv6ZwOPB6b
 VnWyedzvPs7kcX3ddkaP1h1/2T0+b5ILYI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
 NDaPtTIyVdK3s0lJzcksSy3St0vQy5h85i5rwTWeij+/V7E2MJ7h6mLk5JAQMJGY39HB0sXI
 xSEksJRR4seieaxdjBxACRmJ4+vLIGqEJf5c62IDsYUEXjNKPFjlD2ILC8RIzHnfAhYXEVCW
 6Fy3lBVkDrPAJiaJZ1NWQg3dzSix/V4zE0gVm4CVxMT2VYwgNq+AncT5G8vAulkEVCUu9+wG
 i4sKREgc3jELqkZQ4uTMJywgNqeArsTHtZPA5jALqEv8mXeJGcIWl7j1ZD5UXF5i+9s5zBMY
 hWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzQbcd+bt7BeGlj
 8CFGAQ5GJR7ejD9ycUKsiWXFlbmHGCU4mJVEeE/OkI0T4k1JrKxKLcqPLyrNSS0+xGgK9NxE
 ZinR5Hxg8sgriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cBY+oRt
 54FtCne/vv11tLd6ge+lrdHWCz9Y2a3+zNd3Wbax5VM6e/IbrrxdQpUfW5f8W+y9v2HjvsUG
 q4Q+xet7d08ubdLP53v+/5R0ftZNlugzWv9ezLj+JXxV5MQFF5Z4/H8cvU7+9XPmFBUOqQfr
 t5op7z5mvcRqmuzlvbkXt71Yu4Jv5nXbXCWW4oxEQy3mouJEAHSgbvrmAgAA
X-CMS-MailID: 20200115133458eucas1p2da22edad7c425619cc99dc49df712ada
X-Msg-Generator: CA
X-RootMTR: 20200111163007eucas1p2e1a121270ec036ba444e3a363d3f7fed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200111163007eucas1p2e1a121270ec036ba444e3a363d3f7fed
References: <1578350511-130150-1-git-send-email-decui@microsoft.com>
 <CGME20200111163007eucas1p2e1a121270ec036ba444e3a363d3f7fed@eucas1p2.samsung.com>
 <20200111162957.GK1706@sasha-vm>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 haiyangz@microsoft.com, Dexuan Cui <decui@microsoft.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, weh@microsoft.com, kys@microsoft.com,
 Alexander.Levin@microsoft.co, mikelley@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/11/20 5:29 PM, Sasha Levin wrote:
> On Mon, Jan 06, 2020 at 02:41:51PM -0800, Dexuan Cui wrote:
>> fb_deferred_io_work() can access the vmbus ringbuffer by calling
>> fbdefio->deferred_io() -> synthvid_deferred_io() -> synthvid_update().
>>
>> Because the vmbus ringbuffer is inaccessible between hvfb_suspend()
>> and hvfb_resume(), we must cancel info->deferred_work before calling
>> vmbus_close() and then reschedule it after we reopen the channel
>> in hvfb_resume().
>>
>> Fixes: a4ddb11d297e ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
>> Fixes: 824946a8b6fb ("video: hyperv_fb: Add the support of hibernation")
>> Signed-off-by: Dexuan Cui <decui@microsoft.com>
>> Reviewed-by: Wei Hu <weh@microsoft.com>
>> ---
>>
>> This is a RESEND of https://protect2.fireeye.com/url?k=a9db9902-f41598d1-a9da124d-000babff317b-c1ee475745c278a5&u=https://lkml.org/lkml/2019/11/20/73 .
>>
>> The only change is the addition of Wei's Review-ed-by.
>>
>> Please review.
>>
>> If it looks good, Sasha Levin, can you please pick it up via the
>> hyperv/linux.git tree, as you did last time for this driver?
> 
> Like with the input driver, if the relevant maintainers here are okay
> with this type of patches going through the hyperv tree I'll be happy to
> do it, otherwise I need an explicit ack from them on this patch.

Yes, I'm fine with hyperv_fb driver patches going through hyperv tree.

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
