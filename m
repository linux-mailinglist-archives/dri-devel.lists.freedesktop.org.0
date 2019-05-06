Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E38414B29
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B3D89933;
	Mon,  6 May 2019 13:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCF889933
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:48:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190506134829euoutp0130e00ddd6b6e90f3b75ca6d9af4fead8~cHCNxof9W0667606676euoutp01i
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:48:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190506134829euoutp0130e00ddd6b6e90f3b75ca6d9af4fead8~cHCNxof9W0667606676euoutp01i
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190506134828eucas1p21825be7143621fa1e463d5030a6715c5~cHCMyagnt2977829778eucas1p2-;
 Mon,  6 May 2019 13:48:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 28.A9.04377.C2B30DC5; Mon,  6
 May 2019 14:48:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190506134827eucas1p1e0e74c89f1f108ec49fe2aff4a1599a9~cHCL812sU1366013660eucas1p1B;
 Mon,  6 May 2019 13:48:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190506134827eusmtrp2016f729c5cf21c4bc8ae74db55bcacd4~cHCLuxtCR2051320513eusmtrp2P;
 Mon,  6 May 2019 13:48:27 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-0b-5cd03b2c6ccf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 82.A3.04146.B2B30DC5; Mon,  6
 May 2019 14:48:27 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190506134827eusmtip1b7db9a753493da336348be0c11be1472~cHCLVx0aZ1565315653eusmtip1b;
 Mon,  6 May 2019 13:48:27 +0000 (GMT)
Subject: Re: [PATCH next 25/25] video: fbdev: Use dev_get_drvdata()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <9a9ec193-912e-393b-53b9-bc01e342f7c5@samsung.com>
Date: Mon, 6 May 2019 15:48:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20190423075020.173734-26-wangkefeng.wang@huawei.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURTHuzuzs7PS6rgqnsxemxaEqZXBoCZpfRjqS30IohSddNRFXW3H
 RxaWUpStkVqStZlaUNqKomv4gszH4iqKZqtZ4CNIxVLJWkVEW2ucFfz2P/f8/vd/z+GSmLJW
 6kGqNamcVsMmqggHvKFrpf+wT9DHcH9DvTs9tPSLoPO/z2L0wECtjO5+uCClLS0lBD1VfJMu
 +m3G6BzrBKLfj1vRSTljWZ7DmGb9mIy5Y5qXMkbDfYKZyDNLmO7iZZyxGnefk11yCI7hEtXp
 nNYvJMoh3qjPk6Z04NdsI6t4NprDdIgkgQoAw5q3DjmQSqoSwcrzYUIsFhHUjRnshRXB6MgY
 0iH5hiOnuwgXGxUIrEU6JBbzCBZK1wmBcqFOwdzneiRkuFI+8LIzTWAwqlIC7a0ruMAQVCAU
 3jNs3KqgQqDQNCYReJzygskqmSDdqIuQ33dQJJyh59kkLhzLqTAYqjovHGOUP5helUhFvQca
 50swIQmoLhmsLg1g4ptPQ3v+bULULvDT/E4mak9Yby6TiIYaBH9zZ+zuRgQVj212RxB0mgel
 og6FupF6qbg7R/gy7ywmO8KjhmL7ShWQe1cp0geg9k0tsZmla35rRxiwfFAUoH36LZPpt4yj
 3zJOOcIMyJ1L45PiOP6ohsvw5dkkPk0T5xudnGRE//9Rr8282IRa1q50IIpEqu2Kcq+BcKWU
 TeczkzoQkJjKVcFO94crFTFs5nVOmxypTUvk+A60k8RV7oob275dVlJxbCqXwHEpnHazKyHl
 HtkoPiLZZozd+7prZseUPEI9NKyhQ9WOP8osF0aORxc9qX+x60+102hwWeX+QfdjtrzIyKiI
 tl7G2yksws2vtDnAUG36eiZL+8B460SG88Tzp7k1PeOxgYttas+MxFCn5ZLGWd671dREebWQ
 VudP/YarOu/RgoYEC3uWzOpdnm7pU+F8PHvkEKbl2X/wOaFxQwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7ra1hdiDBqOyFlc+fqezaL/8Wtm
 i/PnN7BbnOj7wGpxedccNoun0+sspnw8zmzR+Pk+o8Xee58ZHTg9Ln9/w+yxc9Zddo+WI29Z
 PTat6mTzuN99nMnjxPTvLB6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
 WhmZKunb2aSk5mSWpRbp2yXoZWya1c1acIil4t/13ywNjG+Yuxg5OSQETCQaT0xh6WLk4hAS
 WMoocebtA9YuRg6ghIzE8fVlEDXCEn+udbFB1LxmlHh/fzUrSEJYwFnizbXNjCD1IgI6EgsP
 l0LUnGGU+LTsOjOIwyywikli1e4bbCANbAJWEhPbVzGC2LwCdhITj9xlAmlmEVCReLKaHSQs
 KhAhcethBwtEiaDEyZlPWEBKOAWcJK6sDgQJMwvoSey4/osVwpaX2P52DvMERsFZSDpmISmb
 haRsASPzKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMA423bs5+YdjJc2Bh9iFOBgVOLh9VA6
 HyPEmlhWXJl7iFGCg1lJhDfx2bkYId6UxMqq1KL8+KLSnNTiQ4ymQC9MZJYSTc4HpoC8knhD
 U0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MufyCE793ut3vY0+5utVn
 x7JbnEs3BHvu2rur4L39u0vsspks78vX82z/+uv9Fd1bLAnbpcNO1FxVyf94Z3Mwo3eknqq0
 l4XRvb8zo5dUyO+8f/HKjg9b8k75/r1aKZZj7LqCm1nbpPXGkZvHHx9pX3lpcmp7woQlO9OX
 u4v2/npvsW8ZX6qMlBJLcUaioRZzUXEiALA8F0XJAgAA
X-CMS-MailID: 20190506134827eucas1p1e0e74c89f1f108ec49fe2aff4a1599a9
X-Msg-Generator: CA
X-RootMTR: 20190423074034epcas4p1f2aeab4d4e304358f2c8917af6ce23ca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190423074034epcas4p1f2aeab4d4e304358f2c8917af6ce23ca
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
 <CGME20190423074034epcas4p1f2aeab4d4e304358f2c8917af6ce23ca@epcas4p1.samsung.com>
 <20190423075020.173734-26-wangkefeng.wang@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1557150509;
 bh=60fYSlOZnGJ4TCsi1XwZigJGh2/4lZX1nrhDiHd5Q8E=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=R34w94dCefCkobnpZ0JPsVpDE1kxJGcZhmzc3GO5DNUmytvnrpoiABEWlWxKIXPjO
 4E/9pk0IDtTzkUAmvZ1Gd6fle0eVBwJcDHpVfYZJpYnuAPLbKjft+78o475tx+VYFI
 QvzoLbgJuw97QTEoRA34v4BXdGFGN/yLVsmb6JQI=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org, Wan ZongShun <mcuos.com@gmail.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Januszewski <spock@gentoo.org>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzIzLzIwMTkgMDk6NTAgQU0sIEtlZmVuZyBXYW5nIHdyb3RlOgo+IFVzaW5nIGRldl9n
ZXRfZHJ2ZGF0YSBkaXJlY3RseS4KPiAKPiBDYzogV2FuIFpvbmdTaHVuIDxtY3Vvcy5jb21AZ21h
aWwuY29tPgo+IENjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgo+IENjOiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBDYzogTWljaGFsIEphbnVzemV3c2tp
IDxzcG9ja0BnZW50b28ub3JnPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEtlZmVu
ZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KClBhdGNoIHF1ZXVlZCBmb3IgdjUu
MiwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNh
bXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
