Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769A414BC6B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 15:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052958921A;
	Tue, 28 Jan 2020 14:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BC68921A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 14:58:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200128145808euoutp0153ad1d4d70c8608b850a95d72d1fff73~uFOP9hgoh0989809898euoutp01e
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 14:58:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200128145808euoutp0153ad1d4d70c8608b850a95d72d1fff73~uFOP9hgoh0989809898euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1580223488;
 bh=NoGRo3q31xRJmf8hvOu7cNIzqn2A9IS+PVrSFMvLol0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KUk3wyK9raVpE6GHjfIiVNwrDoqMgnSrwafNqa97zrKYN5RNCody7bFHF7/36CLLY
 287Fnx5kn192hCzndOJ0D73DdZ2GWxXpc4DDvh7cMY95apjGiDQoWdgJ2UVwyIJCA8
 dy62VGaKo3k8cWWVt8Ag64sISWvNIP+wfobPSr/4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200128145808eucas1p29c5b0b3fa0a09c8fb0bef3746ea47b3b~uFOP0P5NC1328213282eucas1p2q;
 Tue, 28 Jan 2020 14:58:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 39.68.60679.00C403E5; Tue, 28
 Jan 2020 14:58:08 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200128145808eucas1p2e0de9fc3d007c682251ce1a320b6906d~uFOPZJD_j1335013350eucas1p2j;
 Tue, 28 Jan 2020 14:58:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200128145808eusmtrp1a11fb64eb06bfbdff6dd5a5544a335b1~uFOPYa9551035610356eusmtrp1_;
 Tue, 28 Jan 2020 14:58:08 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-7f-5e304c00e71d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B2.2F.07950.FFB403E5; Tue, 28
 Jan 2020 14:58:08 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200128145807eusmtip15afd24a045c541970b6de3867ad42202~uFOO8Xsfb3227432274eusmtip1W;
 Tue, 28 Jan 2020 14:58:07 +0000 (GMT)
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
To: Petr Mladek <pmladek@suse.com>, anon anon <742991625abc@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
Date: Tue, 28 Jan 2020 15:58:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200128124912.chttagasucdpydhk@pathway.suse.cz>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87oMPgZxBt/3Sls87O1htbjy9T2b
 xYm+D6wWl3fNYbP4//grq8Xaz4/ZLY686Wa2aPx8n9GBw2PnrLvsHnsmnmTzaDnyltXjfvdx
 Jo/1W66yeHzeJBfAFsVlk5Kak1mWWqRvl8CVcXetc8EWroq+2cvZGxjXc3QxcnJICJhIzP3X
 ydTFyMUhJLCCUWJKy0Q2COcLo8SPwyugnM+MEm+fLWSCaXnZtYQVIrGcUWLy+1NQVW8ZJc4/
 +MAIUiUsYCtxsKmBGcQWEXCT2PGmA6yDWWAHo8Su/zfBitgErCQmtq8Cs3kF7CQOrzgAtoJF
 QFVi4tceNhBbVCBC4tODw6wQNYISJ2c+YQGxOYHqX896B2YzC4hL3HoynwnClpfY/nYOM8gy
 CYFD7BJ7ft5ihrjbReLl9QUsELawxKvjW9ghbBmJ05N7WCAa1jFK/O14AdW9nVFi+eR/bBBV
 1hJ3zv0CsjmAVmhKrN+lDxF2lNjVMBEsLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0tAlBVKtJbFi2
 gQ1mbdfOlcwTGJVmIXltFpJ3ZiF5ZxbC3gWMLKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNz
 NzECU9Ppf8e/7GDc9SfpEKMAB6MSD+8MFYM4IdbEsuLK3EOMEhzMSiK8nUxAId6UxMqq1KL8
 +KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhjXrLwYxP4qvEvpuc7l9w19
 8/deMTA4d2jahcL6/M1KPRteyn7x2WXHoDBrmXvWp0ennmcYc060+qUYteiJbSjH1TlyIvGJ
 x/7aZXkbVwVUh79dln0xeJm5+t8ve/Z+OjY//uGu1d6FMou54nrLFD/u2bz5Q9fiy9rRGz9d
 q3q+Ilp6U1sfh95tJZbijERDLeai4kQA9rYmqUkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7oMPgZxBvNjLR729rBaXPn6ns3i
 RN8HVovLu+awWfx//JXVYu3nx+wWR950M1s0fr7P6MDhsXPWXXaPPRNPsnm0HHnL6nG/+ziT
 x/otV1k8Pm+SC2CL0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3J
 LEst0rdL0Mu4u9a5YAtXRd/s5ewNjOs5uhg5OSQETCRedi1hBbGFBJYySvzZytPFyAEUl5E4
 vr4MokRY4s+1LrYuRi6gkteMEnsXfwGrFxawlTjY1MAMYosIuEnseNPBClLELLCDUeJHxyEW
 iI4bjBIrb68A62ATsJKY2L6KEcTmFbCTOLziABOIzSKgKjHxaw8biC0qECFxeMcsqBpBiZMz
 n7CA2JxA9a9nvQOzmQXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYF
 jCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAqNw27GfW3Ywdr0LPsQowMGoxMProGQQJ8Sa
 WFZcmXuIUYKDWUmEt5MJKMSbklhZlVqUH19UmpNafIjRFOi5icxSosn5wASRVxJvaGpobmFp
 aG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBsfftHNkTtdqqTzNu8KWpCi5+0Do3
 ZIug7r6levtMjvm+EFnjkfh1tVe8zYG5U75eXefe/mu204l8Z22JBZ+33WHgfnbI9Eey0rX7
 3QstRZcUsZ5aWMKj7H1R5E2HBAf3l2Pm3vWTm057pj3UOG+/Tueg3Mqfz1/PfeMY9LjsmmyL
 ofJyz2dPDyuxFGckGmoxFxUnAgCwvaoz2AIAAA==
X-CMS-MailID: 20200128145808eucas1p2e0de9fc3d007c682251ce1a320b6906d
X-Msg-Generator: CA
X-RootMTR: 20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz>
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sergey.senozhatsky@gmail.com,
 syzkaller@googlegroups.com, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/28/20 1:49 PM, Petr Mladek wrote:
> On Tue 2020-01-28 18:23:46, anon anon wrote:
>> Dear Linux kernel developers,
>>
>> I found the crash "KASAN: slab-out-of-bounds Write in vgacon_scroll"
>> when running syzkaller, hope it's unknown:
>>
>> Linux version: Linux v4.17-rc4 (75bc37fefc44)
>> Branch: master
>>
>> This crash still exists on the latest linux kernel Linux v5.5-rc6.
>> Please get C repo and crash log generated by syzkaller, as well as the
>> .config I used for linux kernel from the attachment. Thanks.
> 
> The out-of-bound access seems to be in vgacon_scroll() and thus
> in vgacon code.
> 
> Unfortunately, most people in CC are printk-guys. They were mentioned
> by ./scripts/get_maintainer.pl -f drivers/video/console/vgacon.c
> just because the very last comment (tree wide pr_warning() clean up).
> 
> Bartolomej seems to be the only relevant name.
> 
> Bartolomej,
> 
> are you going to look at it? Or should we add more people or some list

Help is welcomed as I'm not going to look at it in the foreseeable future
(I'm busy enough with other things).

> (dri-devel@lists.freedesktop.org or linux-fbdev@vger.kernel.org) into CC?

Added to Cc:, thanks.

> Thanks,
> Petr

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
