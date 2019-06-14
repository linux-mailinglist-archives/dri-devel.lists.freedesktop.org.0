Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9272456E3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 10:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FD3898BE;
	Fri, 14 Jun 2019 08:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81359898BE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:02:50 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190614080248euoutp018130f57c6950b94475b0f06e537a5112~oAehxJqQv1319213192euoutp01b
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:02:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190614080248euoutp018130f57c6950b94475b0f06e537a5112~oAehxJqQv1319213192euoutp01b
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190614080248eucas1p22c61ddb8a6f689cd2eccfe89bae77715~oAeharesH2378823788eucas1p2u;
 Fri, 14 Jun 2019 08:02:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 59.45.04298.8A4530D5; Fri, 14
 Jun 2019 09:02:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190614080247eucas1p1f6e27195c99fd8ed4b93ee2bafaec8f7~oAegpPCzI1076410764eucas1p1d;
 Fri, 14 Jun 2019 08:02:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190614080247eusmtrp1cd4e9815a8dbed943e482097dcbf22b3~oAegZuhC70963709637eusmtrp1j;
 Fri, 14 Jun 2019 08:02:47 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-37-5d0354a8747f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.5F.04146.7A4530D5; Fri, 14
 Jun 2019 09:02:47 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190614080246eusmtip161d49fe804192eed36dcb1cef2df561f~oAegIRW_k2270422704eusmtip1B;
 Fri, 14 Jun 2019 08:02:46 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/bridge: tfp410: fix memleak in get_modes()
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1025ac36-ac22-cff8-8095-f0808ba9e0b3@samsung.com>
Date: Fri, 14 Jun 2019 10:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610135739.6077-1-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djP87orQphjDR6/ZbK48vU9m0XnxCXs
 FrM+/mC1WD//FpsDi8fsjpmsHve7jzN5HL+xnSmAOYrLJiU1J7MstUjfLoEr4++0DWwFJzgq
 3t76xtTA2MjexcjJISFgItF6/iNTFyMXh5DACkaJjp/tbBDOF0aJacv7mEGqhAQ+M0p8PuYK
 07Hn9URWiKLljBKLD7awQzhvGSUOTPzBClIlLOAu0X7kKFhCRKCZUWLj3S9sIAlmAS2JwytP
 sIDYbAKaEn833wSL8wrYSczvXwxmswioSkxpa2cEsUUFIiS+7NzECFEjKHFy5hOwXk4BK4nr
 f5ayQ8yUl9j+dg4zhC0ucevJfLCHJAS62SUOv7vOCHG3i0T/3SPMELawxKvjW6AhICNxenIP
 C4RdL3F/RQszRHMHo8TWDTuhGqwlDh+/CPQaB9AGTYn1u/Qhwo4Sx3ZuYQEJSwjwSdx4Kwhx
 A5/EpG3TmSHCvBIdbUIQ1YoS989uhRooLrH0wle2CYxKs5B8NgvJN7OQfDMLYe8CRpZVjOKp
 pcW56anFhnmp5XrFibnFpXnpesn5uZsYgUnl9L/jn3Ywfr2UdIhRgINRiYf3gBVTrBBrYllx
 Ze4hRgkOZiUR3nnWzLFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbB
 ZJk4OKUaGPetKZqr+ep0XZ3cV7XG1y935D9lP86+yPJA09Vn7Q3nbtzJ49iofmXe7Cn5Fxas
 D2fe9698XuTs8B8WF5Mery6uuXP+zYHlnDfa3MvSdpfeLlttIX1OM+zd1jnxrrNnRDPfLbXI
 +fFuz9dapQwFrYzdYU+X9Ud7PG3hWDgzbv/dFYpbWrsPHWtTYinOSDTUYi4qTgQAZwyZECYD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7rLQ5hjDe794La48vU9m0XnxCXs
 FrM+/mC1WD//FpsDi8fsjpmsHve7jzN5HL+xnSmAOUrPpii/tCRVISO/uMRWKdrQwkjP0NJC
 z8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4++0DWwFJzgq3t76xtTA2MjexcjJISFgIrHn
 9UTWLkYuDiGBpYwS3w7/g0qIS+ye/5YZwhaW+HOtiw3EFhJ4zSjxZrMLiC0s4C7RfuQoO0iz
 iEAzo0TDuyssIAlmAS2JwytPsEA09DJKnFppBWKzCWhK/N18E2wQr4CdxPz+xWA2i4CqxJS2
 dkYQW1QgQmL2rgYWiBpBiZMzn4DZnAJWEtf/LGWHmK8u8WfeJWYIW15i+9s5ULa4xK0n85km
 MArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYRduO/dy8g/HS
 xuBDjAIcjEo8vAesmGKFWBPLiitzDzFKcDArifDOs2aOFeJNSaysSi3Kjy8qzUktPsRoCvTc
 RGYp0eR8YITnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgrJyR
 M/f4zVimZw9COW/s+3JP9lzq0ui9j+c2GnR//tUd7ZDVqs31o1a2tSRpyf+qN+v1ppxSYUg7
 sK9kYlHRUU5O/sU2i5/wdr+oFhC8Xaz47n6nS/2pu2Y2ws6d9kLLNkVsuKC90NfQ9wHPjR1Z
 nVxVNTvktyxufPa7NTh3tozx36pVoffWKrEUZyQaajEXFScCAG/Bo4e4AgAA
X-CMS-MailID: 20190614080247eucas1p1f6e27195c99fd8ed4b93ee2bafaec8f7
X-Msg-Generator: CA
X-RootMTR: 20190610135816epcas2p1cfb54f75ff70812560735019d3b85ae3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190610135816epcas2p1cfb54f75ff70812560735019d3b85ae3
References: <CGME20190610135816epcas2p1cfb54f75ff70812560735019d3b85ae3@epcas2p1.samsung.com>
 <20190610135739.6077-1-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560499368;
 bh=Jog0qZwzQE1YYWq6ZE10x06PqIKvP3vMLPKOGZJUHOM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KrTda7S+6UR67maobPCn5s8fb+GMXI2Z6yyno5cn77bXyuviYvvxHw4an9g6ZT/Vt
 9MH6BSfL0Sm9WUWH13KiT47/8NTI73hVxPnvfOElEoUcgYSfeNjYSVjGWH7LUCIMuH
 5PvqWPOAQj2sZzhaAHTDkfx0v7gZjdT9Y8KuyyVQ=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAuMDYuMjAxOSAxNTo1NywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gV2UgZG9uJ3QgZnJl
ZSB0aGUgZWRpZCBibG9iIGFsbG9jYXRlZCBieSB0aGUgY2FsbCB0byBkcm1fZ2V0X2VkaWQoKSwK
PiBjYXVzaW5nIGEgbWVtbGVhay4gRml4IHRoaXMgYnkgY2FsbGluZyBrZnJlZShlZGlkKSBhdCB0
aGUgZW5kIG9mIHRoZQo+IGdldF9tb2RlcygpLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxr
ZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCgpRdWV1ZWQgYm90aCBwYXRjaGVzIHRvIGRy
bS1taXNjLWZpeGVzLgoKCi0tClJlZ2FyZHMKQW5kcnplagoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCA3ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQx
MC5jCj4gaW5kZXggOGIwZTcxYmQzY2E3Li45ZjA4MzZjYzcxMmIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGktdGZwNDEwLmMKPiBAQCAtNzAsNyArNzAsMTIgQEAgc3RhdGljIGludCB0ZnA0MTBf
Z2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAo+ICAJZHJtX2Nv
bm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQpOwo+ICAKPiAtCXJl
dHVybiBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsKPiArCXJldCA9IGRybV9h
ZGRfZWRpZF9tb2Rlcyhjb25uZWN0b3IsIGVkaWQpOwo+ICsKPiArCWtmcmVlKGVkaWQpOwo+ICsK
PiArCXJldHVybiByZXQ7Cj4gKwo+ICBmYWxsYmFjazoKPiAgCS8qIE5vIEVESUQsIGZhbGxiYWNr
IG9uIHRoZSBYR0Egc3RhbmRhcmQgbW9kZXMgKi8KPiAgCXJldCA9IGRybV9hZGRfbW9kZXNfbm9l
ZGlkKGNvbm5lY3RvciwgMTkyMCwgMTIwMCk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
