Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F919247DB
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 08:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755178921B;
	Tue, 21 May 2019 06:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECF18921B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 06:14:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521061450euoutp015314a6b994fc3c90ef00a3e9258142a4~gnhaLtGqu3101931019euoutp01s
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 06:14:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190521061450euoutp015314a6b994fc3c90ef00a3e9258142a4~gnhaLtGqu3101931019euoutp01s
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190521061450eucas1p21ff0f778a95c2cf7bdebb5301c6a2de6~gnhZn5Jkg1429714297eucas1p2O;
 Tue, 21 May 2019 06:14:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1D.09.04298.95793EC5; Tue, 21
 May 2019 07:14:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190521061449eucas1p1ecd338a993fc45cf393a12699cee7fde~gnhYk9I3C2797127971eucas1p1W;
 Tue, 21 May 2019 06:14:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190521061448eusmtrp1fe6a99cb5c077e08a27cea7667fc9234~gnhYW5Wpw1036310363eusmtrp1p;
 Tue, 21 May 2019 06:14:48 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-9d-5ce39759f931
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.DE.04146.85793EC5; Tue, 21
 May 2019 07:14:48 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190521061448eusmtip2a729a98954a804c83a9821866b10a3b4~gnhX7RgVs2778327783eusmtip2Y;
 Tue, 21 May 2019 06:14:48 +0000 (GMT)
Subject: Re: [PATCHv3 20/23] drm/bridge: tc358767: copy the mode data,
 instead of storing the pointer
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <85cfa20c-56a9-250b-9df3-15febd9c3c1f@samsung.com>
Date: Tue, 21 May 2019 08:14:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503122949.12266-21-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djP87qR0x/HGLy8YGLR3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALYrLJiU1J7MstUjfLoErY/KHK0wFvXwVk06vY2pg7OXu
 YuTkkBAwkXi25ihrFyMXh5DACkaJpf+amSGcL4wSk59Og3I+M0rMaDvDAtPy8EIfM4gtJLCc
 UeLMKmuIoreMEndfvmcHSQgLpEusOjqVHSQhIjCHWeLf5HawDjYBTYm/m2+ygdi8AnYSO6b/
 BLNZBFQlbv9dBLZBVCBC4v6xDawQNYISJ2c+AYtzCthIzHh5GSzOLCAv0bx1NjOELS5x68l8
 JpBlEgL72CU2bDrEBnGqi0T3tU9QtrDEq+Nb2CFsGYnTk3ug3qmXuL+ihRmiuYNRYuuGncwQ
 CWuJw8cvAm3jANqgKbF+lz5E2FFizqWjbCBhCQE+iRtvBSFu4JOYtG06M0SYV6KjTQiiWlHi
 /tmtUAPFJZZe+Ap1jYfErttb2ScwKs5C8uUsJJ/NQvLZLIQbFjCyrGIUTy0tzk1PLTbMSy3X
 K07MLS7NS9dLzs/dxAhMVaf/Hf+0g/HrpaRDjAIcjEo8vBlTHsUIsSaWFVfmHmKU4GBWEuE9
 fQooxJuSWFmVWpQfX1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgVG3zLxO
 TFT9iMBZJb17+cXrPtfvOFL/yvB0zr/o8J2TQxb/8V/EZl807/G0qqD83bkeZuwf5VeVOzu9
 WZzVvu19toZk2HWdOR1c60rTzBfWXEn4Zb8/fm6g0bLAE23zhNlcdOfXP2y7Yz+3gH/KBIeP
 kqG7VmlPap0b0h91dNFSlhvZf45rT1FiKc5INNRiLipOBABFv8y7UQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xe7oR0x/HGBzfrWfR3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzW
 yshUSd/OJiU1J7MstUjfLkEvY/KHK0wFvXwVk06vY2pg7OXuYuTkkBAwkXh4oY+5i5GLQ0hg
 KaPEwvVHmCAS4hK7579lhrCFJf5c62KDKHrNKPHo21Y2kISwQLpE37xGVpCEiMACZonuK5fZ
 IaoOMEqs6T/EAlLFJqAp8XfzTbAOXgE7iR3Tf4LZLAKqErf/LgKrERWIkDjzfgULRI2gxMmZ
 T8BsTgEbiRkvL7OC2MwC6hJ/5l1ihrDlJZq3zoayxSVuPZnPNIFRcBaS9llIWmYhaZmFpGUB
 I8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwDjcduzn5h2MlzYGH2IU4GBU4uHNmPIoRog1
 say4MvcQowQHs5II7+lTQCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6aIvJJ4Q1NDcwtL
 Q3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjFrPCit2PWtlikxpyteWX1SgoZm8
 v/sPa+TF1KcBkTZ6MTue96aF6nZdFArdwnBXfMkVFc2YGyf93ZZMD7uc77vXyXRPJZeBULno
 Ln/2+SYHpFbcFVj740Wbgyqbf6nOhm0HD1t/anwz+aeMmrbT9zqb7W+PF5yfNuXyMrm3lqq7
 1MV+/b/0WImlOCPRUIu5qDgRAMO2nHXZAgAA
X-CMS-MailID: 20190521061449eucas1p1ecd338a993fc45cf393a12699cee7fde
X-Msg-Generator: CA
X-RootMTR: 20190503123137epcas3p1b8289e5cc5d05c7237e5196f331ca2a3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190503123137epcas3p1b8289e5cc5d05c7237e5196f331ca2a3
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123137epcas3p1b8289e5cc5d05c7237e5196f331ca2a3@epcas3p1.samsung.com>
 <20190503122949.12266-21-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558419290;
 bh=duTMSvjTqO+NmFylcV4eYMtoYxHt+wR/18mtGM9JRvc=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=sU3S27xTIKF9bUGG1rVVj257xGabAFPHsNW7TBpJ6nPYCcFd4Luq+SWv5uGxBqvj3
 b5SHMdcAyUgygNVdMSMZnyzYu3AT/y8YGu1pJkInKQ6P/X29WGSDIQxHWhfyDoJqe3
 VK4+ANxrZCEPeDqu0WLkfRdZw8BmOGF2tT1+N5KA=
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

T24gMDMuMDUuMjAxOSAxNDoyOSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gSW4gdGNfYnJpZGdl
X21vZGVfc2V0IGNhbGxiYWNrLCB3ZSBzdG9yZSB0aGUgcG9pbnRlciB0byB0aGUgZ2l2ZW4KPiBk
cm1fZGlzcGxheV9tb2RlLCBhbmQgdXNlIHRoZSBtb2RlIGxhdGVyLiBTdG9yaW5nIGEgcG9pbnRl
ciBpbiBzdWNoIGEKPiB3YXkgbG9va3MgdmVyeSBzdXNwaWNpb3VzIHRvIG1lLCBhbmQgSSBoYXZl
IG9ic2VydmVkIG9kZCBpc3N1ZXMgd2hlcmUKPiB0aGUgdGltaW5ncyB3ZXJlIGFwcGFyZW50bHkg
KGF0IGxlYXN0IG1vc3RseSkgemVyby4KPgo+IERvIGEgY29weSBvZiB0aGUgZHJtX2Rpc3BsYXlf
bW9kZSBpbnN0ZWFkIHRvIGVuc3VyZSB3ZSBkb24ndCByZWZlciB0bwo+IGZyZWVkL21vZGlmaWVk
IGRhdGEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5A
dGkuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4K
CsKgLS0KUmVnYXJkcwpBbmRyemVqCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBpbmRleCA1OTFi
ZjY0YWM5MTYuLjhmNmQ2MDFkZWYzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
PiBAQCAtMjA1LDcgKzIwNSw3IEBAIHN0cnVjdCB0Y19kYXRhIHsKPiAgCS8qIGRpc3BsYXkgZWRp
ZCAqLwo+ICAJc3RydWN0IGVkaWQJCSplZGlkOwo+ICAJLyogY3VycmVudCBtb2RlICovCj4gLQlj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZQkqbW9kZTsKPiArCXN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlCW1vZGU7Cj4gIAo+ICAJdTMyCQkJcmV2Owo+ICAJdTgJCQlhc3NyOwo+IEBAIC0xMDMy
LDEyICsxMDMyLDEyIEBAIHN0YXRpYyBpbnQgdGNfc3RyZWFtX2VuYWJsZShzdHJ1Y3QgdGNfZGF0
YSAqdGMpCj4gIAkvKiBQWEwgUExMIHNldHVwICovCj4gIAlpZiAodGNfdGVzdF9wYXR0ZXJuKSB7
Cj4gIAkJcmV0ID0gdGNfcHhsX3BsbF9lbih0YywgY2xrX2dldF9yYXRlKHRjLT5yZWZjbGspLAo+
IC0JCQkJICAgIDEwMDAgKiB0Yy0+bW9kZS0+Y2xvY2spOwo+ICsJCQkJICAgIDEwMDAgKiB0Yy0+
bW9kZS5jbG9jayk7Cj4gIAkJaWYgKHJldCkKPiAgCQkJZ290byBlcnI7Cj4gIAl9Cj4gIAo+IC0J
cmV0ID0gdGNfc2V0X3ZpZGVvX21vZGUodGMsIHRjLT5tb2RlKTsKPiArCXJldCA9IHRjX3NldF92
aWRlb19tb2RlKHRjLCAmdGMtPm1vZGUpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+
ICAKPiBAQCAtMTE4MCw3ICsxMTgwLDcgQEAgc3RhdGljIHZvaWQgdGNfYnJpZGdlX21vZGVfc2V0
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIHsKPiAgCXN0cnVjdCB0Y19kYXRhICp0YyA9
IGJyaWRnZV90b190YyhicmlkZ2UpOwo+ICAKPiAtCXRjLT5tb2RlID0gbW9kZTsKPiArCXRjLT5t
b2RlID0gKm1vZGU7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgdGNfY29ubmVjdG9yX2dldF9tb2Rl
cyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
