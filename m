Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D512A415C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA13E6E8B9;
	Tue,  3 Nov 2020 10:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020526E8B9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:12:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201103101215euoutp0171cf47af3fef6dd8eae802dee3c85841~D98kSpNyk0554405544euoutp017
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:12:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201103101215euoutp0171cf47af3fef6dd8eae802dee3c85841~D98kSpNyk0554405544euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604398335;
 bh=5Cdq8D2ei6pRrjUOz42dMBnPyD6ZsklGTpQ1TtT+q1o=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=SkHZQCzzNUQNkiZrSagzqgUxt4McYA1qYLqUMoePJBIYp9Y74Lmz8lWi2YeuUrm1W
 auea03BI04ahYE24S9jgEHH7KchE3p6KcqPP2ZK048zDfh0ae3u8OinyWGxBxeIBUY
 IAJ7Msr+eXAyi/4E9n6qtdWIbWlWue3uGEqy0VBE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201103101209eucas1p15ff1f5cf6e9c9270b98490150386ef29~D98fU4_q51674616746eucas1p10;
 Tue,  3 Nov 2020 10:12:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 26.8E.06318.9FC21AF5; Tue,  3
 Nov 2020 10:12:09 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201103101209eucas1p21ea6a9fb64035a234fbc1ab20d158965~D98e735R60829208292eucas1p2I;
 Tue,  3 Nov 2020 10:12:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201103101209eusmtrp20905f1a34835ff86c743a9694198ff74~D98e65u2c1429214292eusmtrp2O;
 Tue,  3 Nov 2020 10:12:09 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-81-5fa12cf9c424
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D3.B4.06017.9FC21AF5; Tue,  3
 Nov 2020 10:12:09 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201103101208eusmtip27a23e0e196183e82444d49262ca4d057~D98d7GS0c0801308013eusmtip2X;
 Tue,  3 Nov 2020 10:12:08 +0000 (GMT)
Subject: Re: [PATCH v7 0/6] Exynos: Simple QoS for exynos-bus using
 interconnect
To: Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov
 <georgi.djakov@linaro.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <fae047dd-2564-61be-a185-ceb6f89d3e07@samsung.com>
Date: Tue, 3 Nov 2020 11:12:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <3e3038da-d5de-7ea9-9cb9-082ce63af91d@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0zMYRzH99z3Z+l4HNZnCdstjJW0Yl9jJMxtZszKH22Vi68y3WV3XcQ/
 d/mRfroy7tyaYqN2W0u3nF91yHFiOnMmKiUdykrSSVHSt29N/73en8/7eT6f97OHJWQeKog9
 pM7gNWplmpz2J+1PRtxhI6FXklYPPV3DdVw+jbgaczXFNfu+UFyZs4niXv/spzlTvY3mSjqM
 JOd232A4z91SmhssdCLO7HZIuCrne4ZrNVTS3Ol6J8OZz/fQ0XMUNmsurWh7U0crOvJdEkVR
 rRUpBm2Ld1Px/hsO8GmHMnlN+MZ9/qk/uh7QR3IWHGvPvsjo0QjOQ34s4Cjo/N4qyUP+rAxX
 IujKvs+Iwofg2rMxUhSDCN705kmmj3gffJs6UoHAkltAiWIAgf5mNyO45uE9UFWcgwSej2Ph
 1XDT5FUEfieBj9Z2WmjQOAIKHxdNmqR4IzSbWkiBSRwChjEzJfACnAjGmlOk6JkLjZe8E8yy
 fngTZFcuE8oEDoQWb5lE5CVwq6+UEDcdYMBhWC7yVui1vGREngdfXbVTHAzjd8om0wA+iaDg
 XisjCiOCDlc5El3roa3pNy0MJvAKqL4bLpY3Q0+JgRLKgGfD27654g6zocRuIsSyFM6ekYnu
 EPhjNU09YhDke8dJI5JbZgSzzEhjmZHG8n9uOSKtKJDXaVUpvDZSzR9dpVWqtDp1yqr96Sob
 mvhqz/+6ft5GjtHkBoRZJA+QRvPlSTJKmanNUjUgYAn5fGnMi+eJMukBZdZxXpOepNGl8doG
 tJAl5YHSyKs9CTKcoszgD/P8EV4z3ZWwfkF6VPGr+OqcTl98+Go9s05Tum1s7efoE2xIVPnR
 JR7Xduf1Ie/eRb7ROL/OmOBdxb+diXFhUelfYz7VBCTvjD3XuGP38KOcbrs63xP6oXuL62HY
 0pX3e3wFdQm/1n9WJQW0BEfM6kr11Pdx49uGdukumHVG3hQaHpq/eGtjv+OgXe8YlpPaVGXE
 SkKjVf4Db3rfPmYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7o/dRbGG7yZI21xf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWrXuPsFvMmPySzYHfY9OqTjaPO9f2sHnc7z7O5NG3ZRWjx+dNcgGsUXo2RfmlJakK
 GfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZnx4fYCtoF6241zSN
 vYHxp0AXIyeHhICJxJMD75i6GLk4hASWMkr8arnD1sXIAZSQkpjfogRRIyzx51oXG4gtJPCe
 UWL/iwwQW1ggSGLtxHZGEFtEIETi6L/LrCA2s8BNJomLWzwgZq5hkpi36jNYgk3AUKL3aB9Y
 A6+AncT16bdYQGwWARWJxr8zwGpEBeIkfkzsZYOoEZQ4OfMJC8g9nAL2Ek0r1CDmq0v8mXeJ
 GcIWl7j1ZD4ThC0vsf3tHOYJjEKzkHTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfm
 pesl5+duYgRG8LZjP7fsYOx6F3yIUYCDUYmH1yF1QbwQa2JZcWXuIUYJDmYlEV6ns6fjhHhT
 EiurUovy44tKc1KLDzGaAv02kVlKNDkfmFzySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeW
 pGanphakFsH0MXFwSjUwyq491PV7/vnuowekD8xidrCLvjzn7cwXnsq/nxQF3dCRL/NzWewe
 nMZ6rNn4xzLh3KDI8o+84ZuOnKpnyp7xS9SCQVVi2+lDs5YIOjx46cxnxTXXQ81Pk/9M1d7D
 5r6cDRq/azsq3dQTj99659C8bd6S3tQK9Xr9zXsOGkdU7Hom9OIw65V6JZbijERDLeai4kQA
 JM4m4/YCAAA=
X-CMS-MailID: 20201103101209eucas1p21ea6a9fb64035a234fbc1ab20d158965
X-Msg-Generator: CA
X-RootMTR: 20201030125221eucas1p14e525f75c4b8dadae04144ce7684d776
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201030125221eucas1p14e525f75c4b8dadae04144ce7684d776
References: <CGME20201030125221eucas1p14e525f75c4b8dadae04144ce7684d776@eucas1p1.samsung.com>
 <20201030125149.8227-1-s.nawrocki@samsung.com>
 <b586c2b7-9ca1-e641-b70c-27493ffd05e0@samsung.com>
 <9285e2d4-f2fa-92f2-ba25-832f32f77d78@linaro.org>
 <3e3038da-d5de-7ea9-9cb9-082ce63af91d@samsung.com>
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
 krzk@kernel.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chanwoo, Georgi

On 03.11.2020 09:53, Chanwoo Choi wrote:
> On 11/3/20 5:29 PM, Georgi Djakov wrote:
>> On 11/3/20 09:54, Chanwoo Choi wrote:

>>> When I tested this patchset on Odroid-U3,
>>> After setting 0 bps by interconnect[1][2],
>>> the frequency of devfreq devs sustain the high frequency
>>> according to the pm qos request.
>>>
>>> So, I try to find the cause of this situation.
>>> In result, it seems that interconnect exynos driver
>>> updates the pm qos request to devfreq device
>>> during the kernel booting. Do you know why the exynos
>>> interconnect driver request the pm qos during probe
>>> without the mixer request?
>>
>> That's probably because of the sync_state support, that was introduced
>> recently. The icc_sync_state callback needs to be added to the driver
>> (i just left a comment on that patch), and then check again if it works.
>>
>> The idea of the sync_state is that there could be multiple users of a
>> path and we must wait for all consumers to tell their bandwidth needs.
>> Otherwise the first consumer may lower the bandwidth or disable a path
>> needed for another consumer (driver), which has not probed yet. So we
>> maintain a floor bandwidth until everyone has probed. By default the floor
>> bandwidth is INT_MAX, but can be overridden by implementing the get_bw()
>> callback.

Thanks for detailed explanation Georgi.

> Thanks for guide. I tested it with your comment of patch2.
> It is well working without problem as I mentioned previously.
> 
> I caught the reset operation of PM QoS requested from interconnect
> on kernel log. In result, after completed the kernel booting,
> there is no pm qos request if hdmi cable is not connected.

Thanks for the bug report Chanwoo, it's related to the sync_state
feature as you guys already figured out.  I had to reorder some code 
in the interconnect driver probe() to avoid some issues, 
i.e. to register PM QoS request before icc_node_add() call but 
I forgot to check initial state of the bus frequencies.

I thought the get_bw implementation might be needed but the default
behaviour seems fine, the PM QoS derived bus frequencies will be 
clamped in the devfreq to valid OPP values.

Chanwoo, in order to set the bandwidth to 0 we could also just blank 
the display. Below are some of the commands I use for testing.

# blank display (disable the mixer entirely)
echo 4 > /sys/devices/platform/exynos-drm/graphics/fb0/blank

# unblank display
echo 0 > /sys/devices/platform/exynos-drm/graphics/fb0/blank

# modetest with 2 planes (higher bandwidth test)
./modetest -s 47:1920x1080 -P 45:1920x1080 -v

-- 
Regards,
Sylwester
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
