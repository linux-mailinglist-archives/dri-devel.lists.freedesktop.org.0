Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CCD38489
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EFA8999E;
	Fri,  7 Jun 2019 06:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47658999E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:42:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607064212euoutp015574f5e5aea2659cc3bdd12370a11d3f~l13J9uwCG1080110801euoutp01i
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:42:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607064212euoutp015574f5e5aea2659cc3bdd12370a11d3f~l13J9uwCG1080110801euoutp01i
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607064212eucas1p298d26982546a2b1b38d8b81a4cc1e17a~l13JW2ozf3057230572eucas1p2Q;
 Fri,  7 Jun 2019 06:42:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8A.6F.04377.3470AFC5; Fri,  7
 Jun 2019 07:42:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607064211eucas1p174370d94ad4fc041efb6fd43c549b880~l13IkkNvt3212532125eucas1p1C;
 Fri,  7 Jun 2019 06:42:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607064210eusmtrp2b19e77c660c443d0cd64838fe0e35dd1~l13IU8uix0307003070eusmtrp21;
 Fri,  7 Jun 2019 06:42:10 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-ee-5cfa0743d466
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4B.BC.04146.2470AFC5; Fri,  7
 Jun 2019 07:42:10 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607064210eusmtip16216a1cef3c6d602454481abeb3ef8f8~l13Hsd0Xw1500215002eusmtip1T;
 Fri,  7 Jun 2019 06:42:10 +0000 (GMT)
Subject: Re: [PATCH v4 15/15] drm/bridge: tc358767: Replace magic number in
 tc_main_link_enable()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <b20c99e3-fe15-6456-8b70-c2843bf07773@samsung.com>
Date: Fri, 7 Jun 2019 08:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607044550.13361-16-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djP87rO7L9iDJ6/0rJo7rC1aDrUwGrx
 48phFouDe44zWVz5+p7N4sHcm0wWnROXsFtc3jWHzeLuvRMsFuvn32Jz4PJ4MPU/k8fOWXfZ
 PWZ3zGT1uN99nMmj/6+Bx/Eb25k8Pm+S8zg39SxTAEcUl01Kak5mWWqRvl0CV8aWyQEFc7kq
 Xk/4xtzAeIaji5GTQ0LARGLqhOvsXYxcHEICKxglel/3QDlfGCU6/z+Fcj4zSszevJgJpuXd
 89tQieWMEtN6T7BCOG8ZJRZePMQKUiUskCxx9P5mFhBbRCBA4lPTTjaQImaB00wS7btuM4Mk
 2AQ0Jf5uvskGYvMK2Ems236cEcRmEVCRaFwwFywuKhAhcf/YBlaIGkGJkzOfgA3lFLCXOPi0
 F6yGWUBeonnrbGYIW1zi1pP5TCDLJASusUssuveGFeJuF4l/9zYzQ9jCEq+Ob2GHsGUk/u+c
 D/VbvcT9FS3MEM0djBJbN+yEarCWOHz8ItAgDqANmhLrd+lDhB0lLm+7zQYSlhDgk7jxVhDi
 Bj6JSdumM0OEeSU62oQgqhUl7p/dCjVQXGLpha9sExiVZiH5bBaSb2Yh+WYWwt4FjCyrGMVT
 S4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxApPX6X/Hv+xg3PUn6RCjAAejEg+vA8PPGCHWxLLi
 ytxDjBIczEoivGUXfsQI8aYkVlalFuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoE
 k2Xi4JRqYNz+55jWxNyqKvdHa6ZcEP6nf3fNbk9+tqNOwawn37G6GK8uu58ZHDDD543n0xLX
 x/5l1Z9CJvkYXzHft/HT7/v/XyhN//hln1l7Tv+t97NNFFX0p9ZptNrmZf6btltd1rFgSVzm
 KRYbP8m3C4q/VPzKm/ZXPilO9f9a1WNLV7w0nD1tDad0hawSS3FGoqEWc1FxIgAqGqOEWgMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsVy+t/xu7pO7L9iDP4dNLZo7rC1aDrUwGrx
 48phFouDe44zWVz5+p7N4sHcm0wWnROXsFtc3jWHzeLuvRMsFuvn32Jz4PJ4MPU/k8fOWXfZ
 PWZ3zGT1uN99nMmj/6+Bx/Eb25k8Pm+S8zg39SxTAEeUnk1RfmlJqkJGfnGJrVK0oYWRnqGl
 hZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaWyQEFc7kqXk/4xtzAeIaji5GTQ0LAROLd
 89vsXYxcHEICSxklGk4dZ4ZIiEvsnv8WyhaW+HOtiw3EFhJ4zSgxbZEQiC0skCxx9P5mFhBb
 RMBPomveASaQQcwCZ5kkfu/eCdVwjFHi1mEXEJtNQFPi7+abYHFeATuJdduPM4LYLAIqEo0L
 5oLFRQUiJM68X8ECUSMocXLmEzCbU8Be4uDTXrAaZgF1iT/zLjFD2PISzVtnQ9niEreezGea
 wCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgrG479nPzDsZL
 G4MPMQpwMCrx8Dow/IwRYk0sK67MPcQowcGsJMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGU6Dn
 JjJLiSbnA9NIXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRjb9
 1p/HpnPv29vJd6P26Y/yl5en18WF550MEFEXDX3k+K6jwf5P7TJ7E5VNC6vkD9ovWJZgO/0N
 Q31br7KGJYOXzCNfZveSitAzvMtv12yxPfP8yr5LrgUPLzhz2v7i/8pb+9c6efODdR/nX9IR
 TFTZGcU/TzFmleNlecPg2XfkYzQOy1bXK7EUZyQaajEXFScCADQ8mRrrAgAA
X-CMS-MailID: 20190607064211eucas1p174370d94ad4fc041efb6fd43c549b880
X-Msg-Generator: CA
X-RootMTR: 20190607044651epcas1p3cccde08d3b4f4a414f84ef757973e804
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607044651epcas1p3cccde08d3b4f4a414f84ef757973e804
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
 <CGME20190607044651epcas1p3cccde08d3b4f4a414f84ef757973e804@epcas1p3.samsung.com>
 <20190607044550.13361-16-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559889732;
 bh=3qxmw66B41o0ihEUJxKIfGNz16QqnTiQIV4yVoLj8P4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=vNS+CswafpSV6iODjg7g7s0xdIcyzm4sp+nGwGHaJQRfGl1FMNs9eu+ZkIfWREaak
 y4+9euNlLiPOdlzrSvb5vqkrH2c49j4/xJ0UGp4dX8FIb4Opcyn/T67QS5cPyN+FUL
 TP7AgGUtjDs4naQprEMcJnc5SYIAYXdm5d03ndIs=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwNjo0NSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gV2UgZG9uJ3QgbmVl
ZCA4IGJ5dGUgYXJyYXksIERQX0xJTktfU1RBVFVTX1NJWkUgKDYpIHNob3VsZCBiZQo+IGVub3Vn
aC4gVGhpcyBhbHNvIGdldHMgcmlkIG9mIGEgbWFnaWMgbnVtYmVyIGFzIGEgYm9udXMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3LnNtaXJub3ZAZ21haWwuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVn
YXJkcwpBbmRyemVqCj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4g
Q2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4K
PiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiBDYzogQW5kcmV5
IEd1c2Frb3YgPGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KPiBDYzogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogQ29yeSBUdXNhciA8Y29yeS50
dXNhckB6aWkuYWVybz4KPiBDYzogQ2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgo+IENj
OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2Ny5jCj4gaW5kZXggNGEyNDUxNDRhYTgzLi4wNWM1ZmFiMDExZjggMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gQEAgLTg3NCw3ICs4NzQsNyBAQCBzdGF0aWMgaW50
IHRjX21haW5fbGlua19lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRjKQo+ICAJdTMyIGRwX3BoeV9j
dHJsOwo+ICAJdTMyIHZhbHVlOwo+ICAJaW50IHJldDsKPiAtCXU4IHRtcFs4XTsKPiArCXU4IHRt
cFtEUF9MSU5LX1NUQVRVU19TSVpFXTsKPiAgCj4gIAlkZXZfZGJnKHRjLT5kZXYsICJsaW5rIGVu
YWJsZVxuIik7Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
