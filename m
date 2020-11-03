Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF42A453B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 13:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18DB6E0FE;
	Tue,  3 Nov 2020 12:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82886E0FE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 12:32:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201103123241euoutp024bea497f7aafd6afca8d18a22673261a~D-3LtZQjE0582105821euoutp02c
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 12:32:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201103123241euoutp024bea497f7aafd6afca8d18a22673261a~D-3LtZQjE0582105821euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604406761;
 bh=FO7mAP7Ekq36BgVKWcUVqtN7q1o4bEIIQcIDwWwaRx4=;
 h=Subject:Cc:From:To:Date:In-Reply-To:References:From;
 b=fu23NQB5xwNS0jqs+Cj6WiAM8WCfnBZWPqzS12EZXPgbT8sWI0ecbiP1q6QlN+/hI
 glZJPtfB0puMoWZI9Ly480hLRdSg3teCi0VLc8vLwEtvOrd5A8gzUbICX1lzwsF6N2
 4/i1hKkw+TSa5sxcGhhjb2jh/BD//zCPt3vdekqg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201103123236eucas1p1ef6be4ee65d9ab3a2d788be6351db717~D-3G2J9dY1675116751eucas1p1r;
 Tue,  3 Nov 2020 12:32:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 34.CB.05997.4ED41AF5; Tue,  3
 Nov 2020 12:32:36 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201103123235eucas1p110028a2f0f30846dee371df800ee8f54~D-3GbcMzp0176001760eucas1p1b;
 Tue,  3 Nov 2020 12:32:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201103123235eusmtrp16a0d8cc5933c0e1279e9633a4007d815~D-3Gao3m-2396223962eusmtrp18;
 Tue,  3 Nov 2020 12:32:35 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-8a-5fa14de4a036
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BE.BE.06017.3ED41AF5; Tue,  3
 Nov 2020 12:32:35 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201103123234eusmtip1acdebe7c896600084ac2d92c87ab912f~D-3FVXay92408524085eusmtip1f;
 Tue,  3 Nov 2020 12:32:34 +0000 (GMT)
Subject: Re: [PATCH v7 3/6] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
Message-ID: <20bc744b-bbb1-8803-3844-97d59f708f43@samsung.com>
Date: Tue, 3 Nov 2020 13:32:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <522dd3d8-7c76-92c6-ab1e-7e04797b3e9f@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SW0hUURSG23OuimPb0XCpZTGKdLXMoB1GXoiYHkyrl+7TWAcVr81RyyBR
 NMsrk2LjXSsqHRAviIZmhFljWQ6ilaRloSCTipn60FiZM6fIt+9f699rrR82TykGGXc+Oj5J
 0MZrYpWsPd324odpx0ToHfWu5WKGjFVfR6S5tJEh7xcmGVLT08+QocVZlui7WlhSNKajicnU
 xJHBjkqWzBf0IFJqeiIjDT0fOTKSUceS6109HCktNrNBa1UthhxWNfruMasayzPKVIWtBqSa
 b/EMZ07Z778oxEanCNqdB87bRzVNVcoSLeyV+rf9VDrqZ3KRHQ94D0x/ekrlIntegesQvB18
 wkpiAcGIIf+vmEeQoSuh/j2ZL8ngrKzADxEM5IRLpjkEvbUjNpMzFuC+Pg9ZGxRelEGOqRZZ
 Gyz2g4LnhTZ2wZuh7NeQjeX4ANzNvUVbmcbeUG0et/E6fA50zVm05HGCl2UTNrbDgWCetdiW
 UdgVPkzUyCTeCO0zlbZAgOc4GKrIXknKr4iDYGy+JiVwhq/GVk7i9dBXnE9L/kwE+Z0jnCR0
 CMaM0tWAA2C038JaB1F4CzR27JTKwfBsuIGW5jvC8IyTdIMjFLXpKaksh5vZCsntDUsGvUxi
 d8ibWKZ1SFm+Kln5qjTlq9KU/99bi2gDchWSxbhIQdwdL1z2FTVxYnJ8pO+FhLgWtPLV+n4b
 Fx6hjp8R3QjzSOkgDxJq1QpGkyKmxnUj4CmlizzkTd85hfyiJvWqoE1Qa5NjBbEbefC00lXu
 f9d8VoEjNUlCjCAkCtp/XRlv556OUh68SOKOq0/v868yVw+SNb2RHn6mNFOVe6h4z1vh43Ak
 7Jn/0b31Sxad1+3R3uCAjM+jERsucdEh+ll2uiJ4uMJn/Ixy0q0jwtmz+UZsoMM2t8xDAzkJ
 X2IetoXbvbJETb/Oqmz3+s5s6lSHnXCaRh5kKu3kpCf37evh7cdCS5KVtBil8dtKaUXNH4os
 SmdmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsVy+t/xu7qPfRfGG0zer2pxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWrXuPsFvMmPySzYHfY9OqTjaPO9f2sHnc7z7O5NG3ZRWjx+dNcgGsUXo2RfmlJakK
 GfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZG17PYSr4xVax8uo5
 5gbGc6xdjJwcEgImEp+nNrJ3MXJxCAksZZTYsm8mYxcjB1BCSmJ+ixJEjbDEn2tdbBA17xkl
 Hl38xgySEBZIlVg6vZsRJMEs8JVJ4vL+K1BVXxglvje9A6tiEzCU6D3axwhiiwhoSMz8ewXM
 5hWwk1jUNZEFxGYRUJGY9/IxmC0qECfxY2IvG0SNoMTJmU/A4pwC9hIv3/8Cm8ksoC7xZ94l
 KFtc4taT+UwQtrzE9rdzmCcwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqX
 rpecn7uJERjH24793LKDsetd8CFGAQ5GJR5eh9QF8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1J
 rKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgiskriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliS
 mp2aWpBaBNPHxMEp1cDo+vB0+Nl0V0/5Z9H3/n04NLFx6unmVs6byRfzVnzJez07y+3C9Ahr
 M+4zOetiJCbfrOV3unHpuI3YKpO1EzVkK1VXzI+dW9wRk9a/1P9lzFOZJfmiHhJT1t4/llP7
 2Tfvb/I3rkrBmT7LVB8+mnp//po1bbzV8UnZkYqi7+sOF1wr/xYklrlPiaU4I9FQi7moOBEA
 qBtu9/kCAAA=
X-CMS-MailID: 20201103123235eucas1p110028a2f0f30846dee371df800ee8f54
X-Msg-Generator: CA
X-RootMTR: 20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9@eucas1p1.samsung.com>
 <20201030125149.8227-4-s.nawrocki@samsung.com>
 <522dd3d8-7c76-92c6-ab1e-7e04797b3e9f@samsung.com>
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
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, a.swigon@samsung.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com,
 krzk@kernel.org, georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chanwoo,

On 03.11.2020 11:45, Chanwoo Choi wrote:
> On 10/30/20 9:51 PM, Sylwester Nawrocki wrote:
>> This patch adds registration of a child platform device for the exynos
>> interconnect driver. It is assumed that the interconnect provider will
>> only be needed when #interconnect-cells property is present in the bus
>> DT node, hence the child device will be created only when such a property
>> is present.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

>>  drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++

> We don't need to  add 'select INTERCONNECT_EXYNOS' in Kconfig?

I think by doing so we could run into some dependency issues.

> Do you want to remain it as optional according to user?
Yes, I would prefer to keep it selectable through defconfig. 
Currently it's only needed by one 32-bit ARM board.

-- 
Regards,
Sylwester
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
