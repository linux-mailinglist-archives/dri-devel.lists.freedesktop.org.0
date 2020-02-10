Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF031571BB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 10:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763A26E94D;
	Mon, 10 Feb 2020 09:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFE26E94D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:33:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200210093321euoutp0280478fa687c883a29b480e7f2d83bd3d~yALYYhcDG2840028400euoutp029
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:33:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200210093321euoutp0280478fa687c883a29b480e7f2d83bd3d~yALYYhcDG2840028400euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1581327201;
 bh=1Ft4FdCOlN0UPSbjYrJq0FDcB1R8VpMLjiMvloISLao=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=L1Th6vFvtntIYtOlB7uZNK/xM0ts0FOLHBEgUupe/w/vt9lFBkrmdWQozlTSt3QkX
 3Xye7JqT7dbMLwJhWA7UJ/GswpFo0dnv9mTSMiQR6my7qeEhGbtctCDmKqHSEjRIim
 OemgyeyBIIj7xdnynHxYe82JmmM8xyCZqGkWppMk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200210093321eucas1p224a37798dbf0161faac7b030d4238460~yALYN5muI2861028610eucas1p2p;
 Mon, 10 Feb 2020 09:33:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 66.E2.61286.063214E5; Mon, 10
 Feb 2020 09:33:21 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200210093320eucas1p16f163c29ce6adaa1b72426fad78cbcb0~yALXxxYzo0299202992eucas1p1W;
 Mon, 10 Feb 2020 09:33:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200210093320eusmtrp2fc3e3e6306573b2edc27add0acc0b6e1~yALXxOm702219422194eusmtrp2J;
 Mon, 10 Feb 2020 09:33:20 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-13-5e4123604040
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 13.C6.08375.063214E5; Mon, 10
 Feb 2020 09:33:20 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200210093320eusmtip254c9320dd3595c6730b4bf48fe6a278d~yALXjTw2Q2376423764eusmtip2L;
 Mon, 10 Feb 2020 09:33:20 +0000 (GMT)
Subject: Re: [PATCH v2] drm/bridge: tfp410: add pclk limits
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <b42e35ef-e319-1790-475a-c0f0ce63245e@samsung.com>
Date: Mon, 10 Feb 2020 10:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1868bed7-b493-303a-084e-1f52520e7a04@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7qJyo5xBq8uM1tc+fqezaJz4hJ2
 i0N90Rbr599ic2DxeH+jld1jdsdMVo/73ceZPI7f2M4UwBLFZZOSmpNZllqkb5fAlfF+pmpB
 D2vF30mbmRoY3zJ3MXJySAiYSPy7tpu9i5GLQ0hgBaPEtYZFbBDOF0aJncuvQmU+M0pM6PvD
 DtPSeeoVM0RiOaNE74UnUFVvGSXeTrzOAlIlLGAt0XDtLROILSKwnlHiTocNiM0moCnxd/NN
 NhCbV8BOYsKSJ2A2i4CqxKrFP1lBbFGBCIlp2/8xQtQISpyc+QRsJqeAlcTrx1vA4swC8hLb
 385hhrDFJW49mc8EcoSEQDO7ROul+VCnukhs/D2VBcIWlnh1fAtUXEbi/875TBB2vcT9FS3M
 EM0djBJbN+yEBo21xJ1zv4Cu4wDaoCmxfpc+RNhR4s7LZlaQsIQAn8SNt4IQN/BJTNo2nRki
 zCvR0SYEUa0ocf/sVqiB4hJLL3xlg7A9JA7OWMM4gVFxFpIvZyH5bBaSz2Yh3LCAkWUVo3hq
 aXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYGo5/e/4px2MXy8lHWIU4GBU4uF1sHeIE2JNLCuu
 zD3EKMHBrCTCayntGCfEm5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs1NSC1CKY
 LBMHp1QDY9aykKBDf9PiXi3Zb65o92ZChrfD19UFbGXfC9NE+eUUDquLrHiw55z2928ekhJr
 XmyfrHDviaXROpnP6VK6kawrKj9Z7Oh1efZR5+whrq5axo9fH8jJ7tmrH80a/uYQ59npQuuO
 PnuT6p7b8nz569y7fvvzslVYpuxNtflnblhR0JG3KUOsQomlOCPRUIu5qDgRAIFb/ywpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xe7oJyo5xBvNXK1tc+fqezaJz4hJ2
 i0N90Rbr599ic2DxeH+jld1jdsdMVo/73ceZPI7f2M4UwBKlZ1OUX1qSqpCRX1xiqxRtaGGk
 Z2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/F+pmpBD2vF30mbmRoY3zJ3MXJySAiY
 SHSeegVkc3EICSxllPh66y4jREJcYvd8mCJhiT/Xutggil4zSmzdMJEdJCEsYC3RcO0tE0hC
 RGA9o8T5bdfZIaouMUlsvd/AAlLFJqAp8XfzTTYQm1fATmLCkidgNouAqsSqxT9ZQWxRgQiJ
 xxPbGSFqBCVOznwC1sspYCXx+vEWsDizgLrEn3mXmCFseYntb+dA2eISt57MZ5rAKDgLSfss
 JC2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmDcbDv2c/MOxksbgw8xCnAw
 KvHwOtg7xAmxJpYVV+YeYpTgYFYS4bWUdowT4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5Hxg
 TOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamAM3zHJld1Odsod
 /q4FKhyP9XW57zjE3lld0vfPvqf72MGwEu/yuSUlAdXyTHWNyg5hN0PfSsf+5Hu1dZqFv+Xx
 vTJXjxWZ77E72Fx3jvXfrPX6LqJZXy5YFTwUUpRm3bq654Xq88oFp7oz27ITrn2MWiSmHryS
 Y8X9kwl3d9dkVn1z2rv4RZYSS3FGoqEWc1FxIgBLjytnsQIAAA==
X-CMS-MailID: 20200210093320eucas1p16f163c29ce6adaa1b72426fad78cbcb0
X-Msg-Generator: CA
X-RootMTR: 20200210082202eucas1p25526395f284a3518d6486faefd9361cc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200210082202eucas1p25526395f284a3518d6486faefd9361cc
References: <20200113134528.9851-1-tomi.valkeinen@ti.com>
 <20200121094655.9092-1-tomi.valkeinen@ti.com>
 <CGME20200210082202eucas1p25526395f284a3518d6486faefd9361cc@eucas1p2.samsung.com>
 <123befc8-8c57-4718-c23d-1bec9cf55ef4@ti.com>
 <58e2b0d6-0e18-d2e0-d139-835d22b3a364@samsung.com>
 <1868bed7-b493-303a-084e-1f52520e7a04@ti.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.02.2020 10:05, Tomi Valkeinen wrote:
> On 10/02/2020 10:49, Andrzej Hajda wrote:
>
>>> Is this ok to merge?
>>
>> Yes, If I remember you have merge rights. If not, let me know.
> Yes, I have.
>
> Generally speaking, how do you manage bridge patches? If you give reviewed-by/acked-by, does it mean 
> it's good for the sender to push to drm-misc-next?


Yes, unless other reviewers found some issues :) it would be good then
to wait for their acceptance.

My bad, I did not write it in my r-b mail, I hope next it will be better :)


Regards

Andrzej


>  Or do you usually merge bridge patches yourself?
>
>   Tomi
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
