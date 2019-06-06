Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041837284
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 13:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1A68914B;
	Thu,  6 Jun 2019 11:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452CC8914B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:10:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190606111021euoutp01a511dc54b47649bfbc0b29b3754b7230~ll3-NeBhy0777107771euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:10:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190606111021euoutp01a511dc54b47649bfbc0b29b3754b7230~ll3-NeBhy0777107771euoutp01Y
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190606111020eucas1p2ae590e632b72a7fc971e7b5005897fcb~ll3_kDOEA1056510565eucas1p2D;
 Thu,  6 Jun 2019 11:10:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9B.57.04325.C94F8FC5; Thu,  6
 Jun 2019 12:10:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190606111019eucas1p2a87be594ff9713c779d669f8083ddf2e~ll39rAGwO1170411704eucas1p2i;
 Thu,  6 Jun 2019 11:10:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190606111019eusmtrp100a478d21a61320b6d0a67440621eba0~ll39bchOD0108201082eusmtrp1d;
 Thu,  6 Jun 2019 11:10:19 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-cc-5cf8f49c0078
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 84.AA.04140.B94F8FC5; Thu,  6
 Jun 2019 12:10:19 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190606111018eusmtip2a05f105da59bf9223938cba20d49757d~ll38mU85n0472604726eusmtip2n;
 Thu,  6 Jun 2019 11:10:18 +0000 (GMT)
Subject: Re: [PATCH v3 08/15] drm/bridge: tc358767: Increase AUX transfer
 length limit
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <96f190bb-8d16-84c7-e43b-7748fec9ae6e@samsung.com>
Date: Thu, 6 Jun 2019 13:10:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605070507.11417-9-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SW0gUYRiG+2dmZ0ZtZdxMP1KLpgxLPEReDJRW1MVQGHURVFq65XggDzGj
 pgVlJrUeKjPCdjUysrSsNGstRdNdD2uZuabhAWwljEBcOphklNaOo+Td87/vd3g/+Glc06Na
 QSckpwpisjaRJZ2Juo5fPQGlP6Yjgz+2k9x5XSiXbc5Scdk6u4qb7m8lOFOjBeP6p76Q3OjN
 IYzLvVpOcX0NpSQ38qGT4KpvDZPbXPi+y5cwfvT6X4yvN4xQfIlOr+Jt+RaMvzITzFsGn2P8
 ZO1K/u31bmyv0yHnLTFCYkK6IAaFRTvHmxqKsRMFrhlFXQFZqN8lDznRwITA6KyJykPOtIap
 RPC1qX3+8QNBzWTn/GMSge11EbbQUmF5iBSjAsG4VU/JhoaxI3jUGiHzMuYANBdWz+nuzF74
 nl1Pyg04M4VBy7urc5NIZj3MPB1yGDStZsJgZiJWlglmLYwMNM+VLHfMsXXUqGRWM27wSj9G
 yOzkKDfmXEQy48wqOG8swRX2hOGxW5i8Cxg7Bfdum0gl9U5onrgzz8tg3PKMUtgbuq4VEAqf
 BVtlDq406xAYa+pxxdgMrZZelRwUd4SubghS5O1Qfu4zIcvAuMKg3U3J4ApFdcW4IqtBd0Gj
 VK8GW7dxfqAn3LVOkYWINSy6zLDoGsOiawz/95Yh4gHyFNKkpDhB2pQsnAyUtElSWnJc4LGU
 pFrk+GZds5apF+jln6NmxNCIXaqGJz8jNSptupSZZEZA46y7Ot06HalRx2gzTwliSpSYlihI
 ZuRFE6yn+vSS0QgNE6dNFY4LwglBXHAx2mlFFjJ/GvMQ9T6qrbv0G9z79LGsr7f02+dBm79p
 j9fLGwPG/X7oSnxFi58udHeUDWOsTWWH/f8sCc53WxdyMy/Dg5Ow+iZCd6xwrdjpO5sxJK18
 03j2DPutf1+WX5XVXzqyJoC9HJ27Iz88+PFG+8H3p9upobaqKKpALAqnev3vV7CEFK/duAEX
 Je0/M2qld2IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7qzv/yIMVjUxmbR3GFr0XSogdWi
 qeMtq8WPK4dZLA7uOc5kceXrezaLB3NvMll0TlzCbnF51xw2i7v3TrBYrJ9/i82B2+NyXy+T
 x4Op/5k8ds66y+4xu2Mmq8f97uNMHv1/DTyO39jO5PF5k5zHualnmQI4o/RsivJLS1IVMvKL
 S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyDu6azlTQw1cx6bRuA+MV
 7i5GTg4JAROJ5cfXMHYxcnEICSxllHi7ppUFIiEusXv+W2YIW1jiz7UuNoii14wSazZ8ZAVJ
 CAtESOyfsJ4dxBYR8JPomneACaSIWeA7k8TE5XtZIDqOMko0LYAYyyagKfF3802gURwcvAJ2
 En/fpIGEWQRUJO5e388EYosCDT3zfgVYOa+AoMTJmU/AbE6g8q0t7YwgNrOAusSfeZeYIWx5
 ieats6FscYlbT+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/
 dxMjMIK3Hfu5ZQdj17vgQ4wCHIxKPLwSG7/HCLEmlhVX5h5ilOBgVhLhLbvwI0aINyWxsiq1
 KD++qDQntfgQoynQcxOZpUST84HJJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklqdmpq
 QWoRTB8TB6dUA2Ok//OsiM16MrmnHicon9v3znnKljlLzq41tDd4k8qhsOHmq/P/M/9KGes/
 NE1isPnIO9u058UaC+0Mj9A/aquP/Svj9hJ32Pjwgm9Bbtyfa88jv9yfuKNtIesVF+nYROHJ
 zVu31VUr/Gp5t/exp82y5Z1XMuTX6f2JkBDsOMKnEqqu4J27SliJpTgj0VCLuag4EQA27RQ5
 9gIAAA==
X-CMS-MailID: 20190606111019eucas1p2a87be594ff9713c779d669f8083ddf2e
X-Msg-Generator: CA
X-RootMTR: 20190605070538epcas3p105f3800f1f1afc37fd01f9dfa08fc582
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190605070538epcas3p105f3800f1f1afc37fd01f9dfa08fc582
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
 <CGME20190605070538epcas3p105f3800f1f1afc37fd01f9dfa08fc582@epcas3p1.samsung.com>
 <20190605070507.11417-9-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559819421;
 bh=JX5ePPbYDBj+wqAFZmENFNBcm+t5STmGGG0MveRD7Bg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=b3AstkD3mqMih7MzPDFPEUKAZ2s0fo69lXpdUpf9x0LEqTZ+pGS4XJqwPESKiydtw
 S3tqMlhbIo/WdShuPADsD4Ulr+z7yo1VjTMLHEo6gAZ93b5Otc71rpHp2hIqZQu6qf
 dRCEL00eWpT65t/TanStPkpr5xPF2SIkeNG96kuQ=
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUuMDYuMjAxOSAwOTowNSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gQWNjb3JkaW5nIHRv
IHRoZSBkYXRhc2hlZXQgdGMzNTg3NjcgY2FuIHRyYW5zZmVyIHVwIHRvIDE2IGJ5dGVzIHZpYQo+
IGl0cyBBVVggY2hhbm5lbCwgc28gdGhlIGFydGlmaWNpYWwgbGltaXQgb2YgOCBhcHBlcmFzIHRv
IGJlIHRvbwo+IGxvdy4gSG93ZXZlciBvbmx5IHVwIHRvIDE1LWJ5dGVzIHNlZW0gdG8gYmUgYWN0
dWFsbHkgc3VwcG9ydGVkIGFuZAo+IHRyeWluZyB0byB1c2UgMTYtYnl0ZSB0cmFuc2ZlcnMgcmVz
dWx0cyBpbiB0cmFuc2ZlcnMgZmFpbGluZwo+IHNwb3JhZGljYWxseSAod2l0aCBib2d1cyBzdGF0
dXMgaW4gY2FzZSBvZiBJMkMgdHJhbnNmZXJzKSwgc28gbGltaXQgaXQKPiB0byAxNS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+Cj4g
Q2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+CgoKUGxlYXNlIHJlbW92
ZSBBcmNoaXQncyBtYWlsIChmcm9tIGFsbCBwYXRjaGVzKSwgaXQgaXMgbm8gbG9uZ2VyIHZhbGlk
LgoKClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKwqAt
LQpSZWdhcmRzCkFuZHJ6ZWoKCgo+IENjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcu
Y29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gQ2M6
IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+Cj4gQ2M6
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IENvcnkgVHVzYXIg
PGNvcnkudHVzYXJAemlpLmFlcm8+Cj4gQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNv
bT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYwo+IGluZGV4IDI2MGZiY2QwMjcxZS4uMDEyNWUyZjdlMDc2IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+IEBAIC0zNzQsNyArMzc0LDcgQEAgc3Rh
dGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCj4gIAkJ
CSAgICAgICBzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1zZykKPiAgewo+ICAJc3RydWN0IHRjX2Rh
dGEgKnRjID0gYXV4X3RvX3RjKGF1eCk7Cj4gLQlzaXplX3Qgc2l6ZSA9IG1pbl90KHNpemVfdCwg
OCwgbXNnLT5zaXplKTsKPiArCXNpemVfdCBzaXplID0gbWluX3Qoc2l6ZV90LCBEUF9BVVhfTUFY
X1BBWUxPQURfQllURVMgLSAxLCBtc2ctPnNpemUpOwo+ICAJdTggcmVxdWVzdCA9IG1zZy0+cmVx
dWVzdCAmIH5EUF9BVVhfSTJDX01PVDsKPiAgCWludCByZXQ7Cj4gIAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
