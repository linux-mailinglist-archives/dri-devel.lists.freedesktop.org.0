Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E0C209CB6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 12:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B46EA40;
	Thu, 25 Jun 2020 10:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585406EA40
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 10:19:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200625101949euoutp02ffd5bf91252a6ecf853ef58fc39da0ef~bwixz0mKg1829918299euoutp02T
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 10:19:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200625101949euoutp02ffd5bf91252a6ecf853ef58fc39da0ef~bwixz0mKg1829918299euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593080389;
 bh=hWK6IRwNugx67GEBMWvV0xLl8H3ym1TL4+IGDZ9xQ18=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FKth+Ykk8S4r5qM/HT04auJ3H88cRhMKLd3T3G7r134xn3h12DNX9NzOwVA7AtNEs
 6X06+4yd76v0GHIFks3BSwRA6D8AGJ6lKMrDc65lfZrGlzwuPdgO1a6a/62IW7evXY
 aeExJ7dxiyzUeogKwYSY6FTRMf+fpx0SG+DD8B4U=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200625101948eucas1p1cde01f945dcfc3d8df00d09f0e133640~bwiwuqAWK1407614076eucas1p1L;
 Thu, 25 Jun 2020 10:19:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9D.10.06456.44A74FE5; Thu, 25
 Jun 2020 11:19:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200625101947eucas1p1defded45105fda1038f49c4a7b32ac12~bwiwNcMg30937309373eucas1p1q;
 Thu, 25 Jun 2020 10:19:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200625101947eusmtrp143583aae4a927f36c0efac5fc5b656f1~bwiwMmF731283212832eusmtrp1i;
 Thu, 25 Jun 2020 10:19:47 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-87-5ef47a444647
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A9.F2.06314.34A74FE5; Thu, 25
 Jun 2020 11:19:47 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200625101946eusmtip237fa30e71d37c3b185a7de4dc8ff2cfc~bwivNdHdw1802218022eusmtip2Z;
 Thu, 25 Jun 2020 10:19:46 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Andy Shevchenko <andy.shevchenko@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <3e5106a3-b7f5-e4f0-1bd1-d4af09b8c641@samsung.com>
Date: Thu, 25 Jun 2020 12:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfQdwHotuGWMUGUvEWNcZNkm+VkdmNuVJDS_T6hbcTqsg@mail.gmail.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTURjHObu7d9fV6jqVPVlkjSwMyqw+HOiFCoNbH8LIECq1m9505Ey2
 tJSiyF6mpmk10qXLLJkuw9J8pTJXaWrmW1raRMqJKNkqNyqhF+dd5Lffc57n+Z///3BoQu4k
 fWlV/DFeE8/FKSmpuLrp5+tVwSmOiDXWIRKPZT9D+EFuOYn1H2wUfuO0Uzj1djmFe7+PEbjl
 U68Yp+XckeCK4T4S99TnU9iif4zwveeDEmzJ2o8LHHoCN36xkVvms2XGMsT29HURrP3deQlb
 ZxiUsDd0eSRbYU6j2JfZ3SK2oaBMwg5lNIvYyjun2ayHZsQ+zbwqZicrFofI9kk3RvNxqiRe
 E7j5oDS2q7tVlGAiT5gvmsgzSC9ORx40MOuhx/oepSMpLWdKEEw0jrgLB4KyyzmUUEwiuNbU
 QP1beV90jhAaJgQjpTclQmFH0N9fOr1P015MFNRlrk1HEtqbCYSGJNcEwZhJcP7pIFw6FBMA
 vyr7ZzRlzGZ4ZEudsSRm/KFz1CFysQ8TDlnFhe4ZT2jJs83MeDC7od/aM8ME4wc1E/mEwAo4
 6yglBZ/FNNwybRI4GExv8wiBvWC8+aFE4EXQdvWS+ylOw1CJkAsYHYKq+3XuhQ1gfT1FuWIR
 06bL6wNdCMxWqGvcKeA8eDfhKTiYB1eqrxPCsQx0F+SCxlIYaq9y6ymguNNJZSOlYVYuw6ws
 hllZDP+vLURiM1LwiVp1DK8NiuePr9Zyam1ifMzqqKPqCjT9Gdt+N3+rRc7uQxbE0Eg5V/Zl
 YDJCTnJJ2mS1BQFNKL1l29rbIuSyaC45hdccjdQkxvFaC1pIi5UK2bqisXA5E8Md44/wfAKv
 +dcV0R6+Z9AOLtgxqMSaDuNJ48dC+1SY6Jv6M/5cORBtmGMN1S3/ccE6opNGvrKf25M/PF5z
 dhXXEFCT/kRZbAxQXVyh2usTNbrE19iqOuAfltDxqD6j/IPRLw28781hOkNyY59u0K97tn1f
 6q4FxtoXSXmRp+4qli2dW8u2HraMh06Ff40YUIq1sVzQSkKj5f4CojXVvYgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42I5/e/4PV3nqi9xBrfmKlm8nHCY0WLjjPWs
 FlMfPmGzuPL1PZtF8+L1bBZXv79ktjj55iqLRefEJewWmx5fY7W4vGsOm8WhqXsZLdYeuctu
 cagv2mLul6nMFgc/PGF14PdYM28No8flaxeZPd7faGX32DnrLrvH7I6ZrB6bVnWyeZyYcInJ
 Y//cNewe97uPM3lsXlLv0bdlFaPHgd7JLB6fN8kF8Ebp2RTll5akKmTkF5fYKkUbWhjpGVpa
 6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZVy8dIqpYDlrxar25awNjFNZuhg5OSQETCRu
 L2ph7mLk4hASWMooMXfeS0aIhLjE7vlvmSFsYYk/17rYIIreMkp8XjYLyOHgEBZIltjZa9TF
 yM4hIqAvsb8MpIJZYB2rxIfPf1ggyrezSJzb/RFsDpuApsTfzTfZQGxeATuJPU+awY5gEVCV
 uPD8CxOILSoQK/Ht3haoGkGJkzOfgNVwCgRK3LxzGcxmFjCTmLf5ITOELS+x/e0cKFtcounL
 StYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgSmg23Hfm7e
 wXhpY/AhRgEORiUe3g+3PscJsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCj
 KdBzE5mlRJPzgakqryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QD
 o6vV+VM9b9sDmPevdjiifXxXSd5Hdncr37s7/2wJZJpnPF9ST7YjVX7depnER2s2xVXluOmJ
 PZp57XTzqT379ykmJMm9krbnubjhMKfVTlMzg8ty9ZaVee/Su1S004QWTZO5td7qxweDzZXT
 XKS/VSjLH7R9urr9itTCnouy0lps1SuvSSUlKLEUZyQaajEXFScCANjlS6IdAwAA
X-CMS-MailID: 20200625101947eucas1p1defded45105fda1038f49c4a7b32ac12
X-Msg-Generator: CA
X-RootMTR: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <2203e0c2-016b-4dbe-452d-63c857f06dd1@arm.com>
 <CAHp75VfpP1cGK3FvTL0hBudRY2N_7GpXYRuUHUCipz7X2sMLmQ@mail.gmail.com>
 <be755825-b413-e5c1-7ea4-06506b20d1f0@arm.com>
 <20200624150434.GH5472@sirena.org.uk>
 <381de683-df5e-4112-5690-13dd9272ae22@arm.com>
 <70b61b75-c68b-ad89-5f6a-f1d681b9f5d0@samsung.com>
 <CAHp75VfQdwHotuGWMUGUvEWNcZNkm+VkdmNuVJDS_T6hbcTqsg@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, "Rafael
 J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25.06.2020 10:41, Andy Shevchenko wrote:
> On Wed, Jun 24, 2020 at 10:40 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>> On 24.06.2020 17:16, Robin Murphy wrote:
> ...
>
>> I have proposed such thing in my previous iteration[1], except it was
>> macro because of variadic arguments.
> You may have a function with variadic arguments. Macros are beasts and
> make in some cases more harm than help.


What harm it can do in this particular case?

With macro we have simple straightforward one-liner, with quite good 
type-checking.

Maybe I am wrong, but I suspect creation of variadic function would 
require much more coding.


Regards

Andrzej



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
