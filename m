Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46195BBA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 11:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE296E5C5;
	Tue, 20 Aug 2019 09:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1646E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:55:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190820095544euoutp01ef0a79aedddd1f4457d20ebe36de73dc~8mPQphC5A2649226492euoutp01n
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:55:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190820095544euoutp01ef0a79aedddd1f4457d20ebe36de73dc~8mPQphC5A2649226492euoutp01n
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190820095544eucas1p115b3b4033a6db13f8318a0ac493378ad~8mPQQFz5f2216722167eucas1p1V;
 Tue, 20 Aug 2019 09:55:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B1.43.04469.0A3CB5D5; Tue, 20
 Aug 2019 10:55:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190820095543eucas1p27be1ddf1a584d7eeb8df65129240ff6d~8mPPhZ8nz0428804288eucas1p2U;
 Tue, 20 Aug 2019 09:55:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190820095543eusmtrp1d80cd66855a5c6aa519bae3e91ccca07~8mPPTLoi42992929929eusmtrp1s;
 Tue, 20 Aug 2019 09:55:43 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-be-5d5bc3a0b039
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 19.4A.04117.F93CB5D5; Tue, 20
 Aug 2019 10:55:43 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190820095543eusmtip19b2c1fcca1f6f15334a5abb22d0eaf40~8mPPClJCq0394903949eusmtip1I;
 Tue, 20 Aug 2019 09:55:43 +0000 (GMT)
Subject: Re: [PATCH 1/3] video: fbdev: mmp: remove duplicated MMP_DISP
 dependency
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <0534f6bf-cd94-5416-2d4a-5fc9721aa7ed@samsung.com>
Date: Tue, 20 Aug 2019 11:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:69.0) Gecko/20100101
 Thunderbird/69.0
MIME-Version: 1.0
In-Reply-To: <eb28587c-4f8f-f044-1b8b-317a8d7967aa@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87oLDkfHGlw5y2mxccZ6VosrX9+z
 WZzo+8BqcXnXHDYHFo/73ceZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugStjwodOtoJjvBW7
 Flxka2Ccyd3FyMkhIWAisbN/FjOILSSwglHi4fmYLkYuIPsLo0RD/05GCOczo8Tqc1+ZYDp2
 /P7FCpFYzijRvmodG4TzllGi8/hToCoODmGBYImZr5RB4iICMxglfs3bwwLSzSagKfF38002
 EJtXwE5iy/9FYFNZBFQl3j1+wwpiiwqESaxduJkFokZQ4uTMJ2A2p4C9xKGmZWC3MgvISzRv
 nQ1li0vcejIf6rr/bBJft+ZB2C4SDU8uM0PYwhKvjm9hh7BlJE5P7mGBsOsl7q9oYQY5VEKg
 g1Fi64adUA3WEoePX2QFeYYZ6Oj1u/Qhwo4SDZfvgf0oIcAnceOtIMQJfBKTtk1nhgjzSnS0
 CUFUK0rcP7sVaqC4xNILX9kgbA+J6ec/ME5gVJyF5MlZSB6bheSxWQg3LGBkWcUonlpanJue
 WmyYl1quV5yYW1yal66XnJ+7iRGYTk7/O/5pB+PXS0mHGAU4GJV4eD2mRcUKsSaWFVfmHmKU
 4GBWEuGtmAMU4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnV
 wJiuG1GeKc532FdYJ5m9cpe9/yOOltgvzwNTr1td67u4Irp3+tesYrlD/7J0Fuyokw65FdH7
 NEqpQu+ChGDLhTX3NF4Wyhpd7WDUsAj+vOj6ZPYrVj+LJQ/sXn7qlJFwk3w2x5WOQg23gqB6
 nuu/KjZI9kss+5Y4MWLzq9/XAi0W/clOnm3yTYmlOCPRUIu5qDgRAFcTFIcjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7rzD0fHGrzpFLXYOGM9q8WVr+/Z
 LE70fWC1uLxrDpsDi8f97uNMHn1bVjF6fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJcx4UMnW8Ex3opdCy6yNTDO5O5i5OSQEDCR2PH7
 F2sXIxeHkMBSRolj874yQSTEJXbPf8sMYQtL/LnWxQZR9JpR4tXuSyxdjBwcwgLBEjNfKYPE
 RQRmMEo8PL8QatIkRolnZx4ygnSzCWhK/N18kw3E5hWwk9jyfxHYBhYBVYl3j9+wgtiiAmES
 N+7dY4SoEZQ4OfMJC4jNKWAvcahpGdgVzALqEn/mXYKy5SWat86GssUlbj2ZzzSBUXAWkvZZ
 SFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMBo2Xbs55YdjF3vgg8xCnAw
 KvHwekyLihViTSwrrsw9xCjBwawkwlsxByjEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cBI
 ziuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwLhHMO41w6wG7pKa
 eI1y9k0HGPQf3NiYIuoe4cB/R+P8eg/PVz870ye0JRvcuOd4XZh31ZZ+HtH3NqeueSRE2BZM
 +KDqEdcd33/kzLv6NoZFbYod23YJT7unafVnndcdbd9FMW94df88fu79vVOfvb+pkf3pW8tv
 ec76ivuzdOUdP3n8j93YpcRSnJFoqMVcVJwIAPh34RqsAgAA
X-CMS-MailID: 20190820095543eucas1p27be1ddf1a584d7eeb8df65129240ff6d
X-Msg-Generator: CA
X-RootMTR: 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba
References: <CGME20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba@eucas1p1.samsung.com>
 <eb28587c-4f8f-f044-1b8b-317a8d7967aa@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566294944;
 bh=DkMyu5ytkH356rgkNA6a2eG5i/l4vvZSJP25T3d8BqE=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=VbbgXlztjlr/mo9NZu9+ee6xWeD+wHAQIu4gqG7Swhq0Yf/PkabmnLdJITg+RutMF
 IJadRbBhWiufItHm0sv2SJM0iJW5rjWJ375MqRRdczJiqyfGjM4NwgBQ7Z13P362D7
 3QgAp7U0JlN4JVKlkbT4URAbLgFfYMLxjlwIHIuo=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDYuMjAxOSAxNjowNywgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiBU
aGlzIGRlcGVuZGVuY3kgaXMgYWxyZWFkeSBwcmVzZW50IGluIGhpZ2hlciBsZXZlbCBLY29uZmln
IGZpbGUKPiAoZHJpdmVycy92aWRlby9mYmRldi9tbXAvS2NvbmZpZykuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+
CgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0t
ClJlZ2FyZHMKQW5kcnplagoKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2ZiL0tj
b25maWcgfCAgICA0IC0tLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvS2NvbmZpZyB8
ICAgIDQgLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCj4KPiBJbmRleDog
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9mYi9LY29uZmlnCj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2ZiL0tjb25maWcKPiArKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L21tcC9mYi9LY29uZmlnCj4gQEAgLTEsNiArMSw0IEBACj4gICMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+IC1pZiBNTVBfRElTUAo+IC0KPiAgY29uZmlnIE1N
UF9GQgo+ICAJdHJpc3RhdGUgImZiIGRyaXZlciBmb3IgTWFydmVsbCBNTVAgRGlzcGxheSBTdWJz
eXN0ZW0iCj4gIAlkZXBlbmRzIG9uIEZCCj4gQEAgLTEwLDUgKzgsMyBAQCBjb25maWcgTU1QX0ZC
Cj4gIAlkZWZhdWx0IHkKPiAgCWhlbHAKPiAgCQlmYiBkcml2ZXIgZm9yIE1hcnZlbGwgTU1QIERp
c3BsYXkgU3Vic3lzdGVtCj4gLQo+IC1lbmRpZgo+IEluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvbW1wL2h3L0tjb25maWcKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9tbXAvaHcvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3L0tjb25m
aWcKPiBAQCAtMSw2ICsxLDQgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5Cj4gLWlmIE1NUF9ESVNQCj4gLQo+ICBjb25maWcgTU1QX0RJU1BfQ09OVFJPTExFUgo+
ICAJYm9vbCAibW1wIGRpc3BsYXkgY29udHJvbGxlciBodyBzdXBwb3J0Igo+ICAJZGVwZW5kcyBv
biBDUFVfUFhBOTEwIHx8IENQVV9NTVAyCj4gQEAgLTE2LDUgKzE0LDMgQEAgY29uZmlnIE1NUF9E
SVNQX1NQSQo+ICAJaGVscAo+ICAJCU1hcnZlbGwgTU1QIGRpc3BsYXkgaHcgY29udHJvbGxlciBz
cGkgcG9ydCBzdXBwb3J0Cj4gIAkJd2lsbCByZWdpc3RlciBhcyBhIHNwaSBtYXN0ZXIgZm9yIHBh
bmVsIHVzYWdlCj4gLQo+IC1lbmRpZgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
