Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D638966
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBC689C3B;
	Fri,  7 Jun 2019 11:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC8189C3B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:52:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607115200euoutp01d06e4d5537d68aa059044b422d2c7a7a~l6FpZ6O_o1198711987euoutp01O
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:52:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607115200euoutp01d06e4d5537d68aa059044b422d2c7a7a~l6FpZ6O_o1198711987euoutp01O
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607115200eucas1p2b690face61aa9fc3bb41f808fc8b8419~l6Fo75Blj2169021690eucas1p2v;
 Fri,  7 Jun 2019 11:52:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5E.60.04298.FDF4AFC5; Fri,  7
 Jun 2019 12:51:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607115159eucas1p21a8cbb985c5322246172723f4e65bc91~l6FoBGtJ20920209202eucas1p2E;
 Fri,  7 Jun 2019 11:51:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607115158eusmtrp19eb7afe29815599c347742fa6b566e18~l6FnxloQ21211812118eusmtrp1S;
 Fri,  7 Jun 2019 11:51:58 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-9f-5cfa4fdf35a2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.0E.04140.EDF4AFC5; Fri,  7
 Jun 2019 12:51:58 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607115158eusmtip14072518519d75751a2e98b92896e2eaa~l6FnYxFW12952829528eusmtip1M;
 Fri,  7 Jun 2019 11:51:58 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: mxsfb: Remove driver
To: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <80891dd1-370b-6070-011b-b7ac822e17de@samsung.com>
Date: Fri, 7 Jun 2019 13:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1bb6a117-dcf4-8842-0c3a-c3e015b2f0a9@denx.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djPc7r3/X/FGBx9Y2Fx5et7NouHV/0t
 Vk3dyWJxou8Dq0XXr5XMFm/aGhktXmwRd2D3mDfrBIvHzll32T02repk87jffZzJY+O7HUwe
 /X8NPD5vkgtgj+KySUnNySxLLdK3S+DK2LB/E0vBBpaKd0s3MTcwHmbuYuTkkBAwkbi55C9L
 FyMXh5DACkaJmVs3QTlfGCUO3PvIBuF8ZpSYt+kXXMvuf9ehqpYzSiyZOZsVwnnLKLFj4hom
 kCphAXOJ9RsesoLYIgLOEj0XdrOA2MwCjYwSm764gdhsAlYSE9tXMYLYvAJ2Eqt+vQSrZxFQ
 kdj4Yh9YXFQgQuL+sQ2sEDWCEidnPgGbwylgLfFg/X5GiJniEreezGeCsOUltr+dwwxykITA
 IXaJh51TmSDOdpFYeGcpO4QtLPHq+BYoW0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfG0SVtcTh
 4xeBzuAAWqEpsX6XPkTYUeJJ/wl2kLCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJrFh2QY2
 mLVdO1cyT2BUmoXktVlI3pmF5J1ZCHsXMLKsYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93E
 CExKp/8d/7SD8eulpEOMAhyMSjy8Huw/Y4RYE8uKK3MPMUpwMCuJ8JZd+BEjxJuSWFmVWpQf
 X1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgVFYWvDYC/WbK18eOKHzL+pF
 wRyW+OrSs7OOfn3Een3yWeslzbbTFPb9+11T++1D/5HqVVPmqx47vqxj3bK5crNXci9pLVmp
 uEPjw9QXYvwTVayvN7ny2v/qPmucHBX+9eRDVZX57puqObKmTvAK4y3nKjxc8ly+ym6+2S2D
 PRNNWGetl1vqsU5eiaU4I9FQi7moOBEABLyps0YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7r3/H/FGBy8YGJx5et7NouHV/0t
 Vk3dyWJxou8Dq0XXr5XMFm/aGhktXmwRd2D3mDfrBIvHzll32T02repk87jffZzJY+O7HUwe
 /X8NPD5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
 LdK3S9DL2LB/E0vBBpaKd0s3MTcwHmbuYuTkkBAwkdj97zpLFyMXh5DAUkaJWZN+sXYxcgAl
 ZCSOry+DqBGW+HOtiw2i5jWjxKKm7UwgCWEBc4n1Gx6ygtgiAs4SPRd2gw1iFmhklLj26wMj
 RMduRonOt//YQKrYBKwkJravYgSxeQXsJFb9egnWzSKgIrHxxT6wuKhAhMSZ9ytYIGoEJU7O
 fAJmcwpYSzxYvx+shllAXeLPvEvMELa4xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZ
 wMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzAKtx37uWUHY9e74EOMAhyMSjy8M5h+xgix
 JpYVV+YeYpTgYFYS4S278CNGiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBCSKvJN7Q1NDc
 wtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAPj5cNPyiwWHsucZfQt77jdDhlP
 +fumHE2MrZl/JCPfsKxlWeW/78OFdp6uij2KWc8v3Or6fK73+NX39/me7/uu98Vzx7XP19Pn
 Pk9b4GHjXN/0qfqXv1erkWbnxrr7IfyOhzL9XLPEnmyPm/lfyaODU+ZuiNb0HdwXVL9FPnFc
 /GfKQdPjBybPUWIpzkg01GIuKk4EAAr0bk/YAgAA
X-CMS-MailID: 20190607115159eucas1p21a8cbb985c5322246172723f4e65bc91
X-Msg-Generator: CA
X-RootMTR: 20190520134337epcas3p369f0aaf00906512fa716324896822679
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190520134337epcas3p369f0aaf00906512fa716324896822679
References: <20190520130612.2214-1-festevam@gmail.com>
 <CGME20190520134337epcas3p369f0aaf00906512fa716324896822679@epcas3p3.samsung.com>
 <1bb6a117-dcf4-8842-0c3a-c3e015b2f0a9@denx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559908320;
 bh=tpMJfYD01vcrrcWGI7V9BDF6/fR/cy2YAVkzfTMTeTI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=XFq9bpCJD8oHFqZXp0lkVLd4cJKjL6k8pwq/HLgBYBDFS0PH09Y0LWBpLcxrVgn4i
 9biCCB3MJ8H6eob2RINyfpO2e1hQOIRnCR7YUcimqx9VO2+wnX1o138dG8zTb/dxEF
 wng6IbckAP3PtliXGUdkWBWLkOaeELKa2nzIWwaU=
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
Cc: dri-devel@lists.freedesktop.org, shawnguo@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjAvMTkgMzo0MyBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNS8yMC8xOSAzOjA2
IFBNLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+PiBUaGVyZSBpcyBhIERSTSB2ZXJzaW9uIG9mIHRo
ZSBteHNmYiBkcml2ZXIgZm9yIHF1aXRlIHNvbWUgdGltZQo+PiBhdCBkcml2ZXJzL2dwdS9kcm0v
bXhzZmIvLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGtlZXAgbWFpbnRhaW5pbmcKPj4gdGhlIGZi
ZGV2IHZlcnNpb24gYW55IGxvbmdlci4KPj4KPj4gUmVtb3ZlIHRoZSBmYmRldiBteHNmYiBkcml2
ZXIgaW4gZmF2b3VyIG9mIHRoZSBEUk0gdmVyc2lvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRmFi
aW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+IAo+IEFja2VkLWJ5OiBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4KClBhdGNoIHF1ZXVlZCBmb3IgdjUuMywgdGhhbmtzLgoKQmVzdCBy
ZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0
ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
