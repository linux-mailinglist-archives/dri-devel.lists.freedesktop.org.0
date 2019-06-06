Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30D36E01
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 10:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87247892E3;
	Thu,  6 Jun 2019 08:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4FE892E3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:01:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190606080114euoutp01cdace6a388a5941029525c14c71f01e2~ljS3_rn9-0300903009euoutp01v
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:01:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190606080114euoutp01cdace6a388a5941029525c14c71f01e2~ljS3_rn9-0300903009euoutp01v
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190606080114eucas1p240801a4725f31c59eb76659d8820b91e~ljS3fcY9F0719807198eucas1p2L;
 Thu,  6 Jun 2019 08:01:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 43.75.04377.948C8FC5; Thu,  6
 Jun 2019 09:01:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190606080113eucas1p13327c9bf0596dd2c744f776097153856~ljS2qt3t21310413104eucas1p1x;
 Thu,  6 Jun 2019 08:01:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190606080112eusmtrp149b65493e76b2ab5da42abc6b123dc11~ljS2a-qkd1821018210eusmtrp1e;
 Thu,  6 Jun 2019 08:01:12 +0000 (GMT)
X-AuditID: cbfec7f4-5632c9c000001119-b7-5cf8c84957ac
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D2.B1.04140.848C8FC5; Thu,  6
 Jun 2019 09:01:12 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190606080112eusmtip140c235a6cb15654cc48c0e0e95a858bc~ljS1oYSpx2518925189eusmtip1f;
 Thu,  6 Jun 2019 08:01:11 +0000 (GMT)
Subject: Re: [PATCH v3 02/15] drm/bridge: tc358767: Simplify polling in
 tc_main_link_setup()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <90e382a9-6613-64e8-1916-30000ef7654a@samsung.com>
Date: Thu, 6 Jun 2019 10:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605070507.11417-3-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRmVeSWpSXmKPExsWy7djPc7qeJ37EGLx6b2TR3GFr0XSogdWi
 qeMtq8WPK4dZLA7uOc5kceXrezaLB3NvMll0TlzCbnF51xw2i7v3TrBYrJ9/i82B2+NyXy+T
 x4Op/5k8ds66y+4xu2Mmq8f97uNMHv1/DTyO39jO5PF5k5zHualnmQI4o7hsUlJzMstSi/Tt
 ErgyDrUkFjQJVLy/Gt/A2MPbxcjJISFgInH3RAdzFyMXh5DACkaJAz9eskE4Xxgl7jQcZwap
 EhL4zCjx8FMyTMfeRe2sEEXLGSXufX7NDuG8ZZR4v/8vC0iVsECcxOmb+9hBbBGBAIlPTTvB
 xjILfGWSOHBpIhNIgk1AU+Lv5ptsIDavgJ3E9YWLwOIsAioS614sBLNFBSIk7h/bwApRIyhx
 cuYTsAWcQPXN39eCnccsIC/RvHU2lC0ucevJfCaQZRICj9gl9n25yQxxt4vEi45HbBC2sMSr
 41vYIWwZidOTe1gg7HqJ+ytamCGaOxgltm7YCdVsLXH4+EWgKziANmhKrN+lD2JKCDhKbH/K
 DWHySdx4KwhxAp/EpG3TmSHCvBIdbUIQMxQl7p/dCjVPXGLpha9sExiVZiF5bBaSZ2YheWYW
 wtoFjCyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAlPZ6X/Hv+xg3PUn6RCjAAejEg+v
 xMbvMUKsiWXFlbmHGCU4mJVEeBNvf4kR4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9
 sSQ1OzW1ILUIJsvEwSnVwFj895DV0fzm3IIHuyNCLUuC7pQyZ/84/PeS2ASXQ2GnVtfME+zl
 qDrGdv+v9seqUzsjDvf1XEjYYut4pG3L+/ptJVbVgQ3PpM9v8+I33Z7WNyusMnnx22VHj30N
 iIxM0z03kXfpilAhjTWeIVU1v2yWr9xY9fVvtZPmG/vZ+aXvdLeq7l0YMkuJpTgj0VCLuag4
 EQDboClrYQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7oeJ37EGDzeY2bR3GFr0XSogdWi
 qeMtq8WPK4dZLA7uOc5kceXrezaLB3NvMll0TlzCbnF51xw2i7v3TrBYrJ9/i82B2+NyXy+T
 x4Op/5k8ds66y+4xu2Mmq8f97uNMHv1/DTyO39jO5PF5k5zHualnmQI4o/RsivJLS1IVMvKL
 S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyDrUkFjQJVLy/Gt/A2MPb
 xcjJISFgIrF3UTtrFyMXh5DAUkaJhf9+MEEkxCV2z3/LDGELS/y51sUGUfSaUWLG6WUsIAlh
 gTiJ0zf3sYPYIgJ+El3zDjCBFDELfGeSmLh8LwtEx1FGiWPLZoFVsQloSvzdfJMNxOYVsJO4
 vnAR2DoWARWJdS8WgtmiAhESZ96vYIGoEZQ4OfMJmM0JVN/8fS3YScwC6hJ/5l2CsuUlmrfO
 hrLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA
 CN527OeWHYxd74IPMQpwMCrx8Eps/B4jxJpYVlyZe4hRgoNZSYQ38faXGCHelMTKqtSi/Pii
 0pzU4kOMpkDPTWSWEk3OByaXvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUw
 fUwcnFINjKU3OxlSWI43F1478PaZjunbUrUpVkEVf3YGP84V0rzhzGzry6ou/zCeb2JbqH6r
 6r6tcftLY+b3iShy8QbmFd/zCD8kYPgstoA71LMtQWal3JqiA0+m5HhwHX940G5XhsTqO0Iv
 87fUxRVeU/duiHtkErS4a+vRL6rVL3jUDNpVTs4/X66gxFKckWioxVxUnAgAPUXuD/YCAAA=
X-CMS-MailID: 20190606080113eucas1p13327c9bf0596dd2c744f776097153856
X-Msg-Generator: CA
X-RootMTR: 20190605070527epcas1p36d630a4be138dd07791047c4d45a716f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190605070527epcas1p36d630a4be138dd07791047c4d45a716f
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
 <CGME20190605070527epcas1p36d630a4be138dd07791047c4d45a716f@epcas1p3.samsung.com>
 <20190605070507.11417-3-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559808074;
 bh=MAN58sTDz07tsLX8C4vgD27ti2cafy/nMvtO+uKybQw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=J4dVqirl/Wr/Fh/zjEuv+l0vKC17E4O/vtvvE5hx9/WXHmA7m8gnxOMghjZ0r3vv4
 h9CUAfMPXzr8ZcsYFqb4WPKuL+TZdKsq9KfWf6jkxYUm6eR2T0UQQsLEmwuz+d9hRd
 Oq8k6FwBtmtD6IHP470DbJSFSS+FAtN1VnF9tft8=
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

T24gMDUuMDYuMjAxOSAwOTowNCwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gUmVwbGFjZSBleHBs
aWNpdCBwb2xsaW5nIGxvb3Agd2l0aCBlcXVpdmFsZW50IGNhbGwgdG8KPiB0Y19wb2xsX3RpbWVv
dXQoKSBmb3IgYnJldml0eS4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3LnNtaXJub3ZAZ21haWwuY29tPgo+IENj
OiBBcmNoaXQgVGFuZWphIDxhcmNoaXR0QGNvZGVhdXJvcmEub3JnPgo+IENjOiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+Cj4gQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dl
bnRlbWJlZGRlZC5jb20+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+Cj4gQ2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJAemlpLmFlcm8+Cj4gQ2M6IENocmlzIEhl
YWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0
cm9uaXguZGU+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMgfCAxNSArKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5j
Cj4gaW5kZXggZmI4YTE5NDJlYzU0Li41ZTFlNzNhOTE2OTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2Ny5jCj4gQEAgLTc3NCw3ICs3NzQsNiBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlu
a19lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRjKQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gdGMt
PmRldjsKPiAgCXVuc2lnbmVkIGludCByYXRlOwo+ICAJdTMyIGRwX3BoeV9jdHJsOwo+IC0JaW50
IHRpbWVvdXQ7Cj4gIAl1MzIgdmFsdWU7Cj4gIAlpbnQgcmV0Owo+ICAJdTggdG1wWzhdOwo+IEBA
IC04MzEsMTUgKzgzMCwxMSBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlua19lbmFibGUoc3RydWN0
IHRjX2RhdGEgKnRjKQo+ICAJZHBfcGh5X2N0cmwgJj0gfihEUF9QSFlfUlNUIHwgUEhZX00xX1JT
VCB8IFBIWV9NMF9SU1QpOwo+ICAJdGNfd3JpdGUoRFBfUEhZX0NUUkwsIGRwX3BoeV9jdHJsKTsK
PiAgCj4gLQl0aW1lb3V0ID0gMTAwMDsKPiAtCWRvIHsKPiAtCQl0Y19yZWFkKERQX1BIWV9DVFJM
LCAmdmFsdWUpOwo+IC0JCXVkZWxheSgxKTsKPiAtCX0gd2hpbGUgKCghKHZhbHVlICYgUEhZX1JE
WSkpICYmICgtLXRpbWVvdXQpKTsKPiAtCj4gLQlpZiAodGltZW91dCA9PSAwKSB7Cj4gLQkJZGV2
X2VycihkZXYsICJ0aW1lb3V0IHdhaXRpbmcgZm9yIHBoeSBiZWNvbWUgcmVhZHkiKTsKPiAtCQly
ZXR1cm4gLUVUSU1FRE9VVDsKPiArCXJldCA9IHRjX3BvbGxfdGltZW91dCh0YywgRFBfUEhZX0NU
UkwsIFBIWV9SRFksIFBIWV9SRFksIDEsIDEwMDApOwo+ICsJaWYgKHJldCkgewo+ICsJCWlmIChy
ZXQgPT0gLUVUSU1FRE9VVCkKPiArCQkJZGV2X2VycihkZXYsICJ0aW1lb3V0IHdhaXRpbmcgZm9y
IHBoeSBiZWNvbWUgcmVhZHkiKTsKPiArCQlyZXR1cm4gcmV0OwoKClJldmlld2VkLWJ5OiBBbmRy
emVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCgo+
ICAJfQo+ICAKPiAgCS8qIFNldCBtaXNjOiA4IGJpdHMgcGVyIGNvbG9yICovCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
