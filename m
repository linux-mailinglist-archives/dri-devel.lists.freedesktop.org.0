Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D66B3724A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 12:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0D78941D;
	Thu,  6 Jun 2019 10:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E268941D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 10:59:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190606105928euoutp01ab3b27d92050143012bad8f1b3209655~llufY4LS90059000590euoutp01M
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 10:59:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190606105928euoutp01ab3b27d92050143012bad8f1b3209655~llufY4LS90059000590euoutp01M
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190606105927eucas1p207368fec01de0de674da641c99c17c43~lluedOQor1211012110eucas1p2D;
 Thu,  6 Jun 2019 10:59:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C9.06.04325.F02F8FC5; Thu,  6
 Jun 2019 11:59:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190606105926eucas1p2e613ca3e2c9c6537877273c2cca2c3fd~lluduH-sm1527315273eucas1p2e;
 Thu,  6 Jun 2019 10:59:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190606105926eusmtrp24bf3dc59fa000e86ce44dd1d377cc89e~lludejPW10645406454eusmtrp2D;
 Thu,  6 Jun 2019 10:59:26 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-87-5cf8f20f72b7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AB.69.04140.E02F8FC5; Thu,  6
 Jun 2019 11:59:26 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190606105925eusmtip20b1887ab1b662bf9c2940fda64356a1d~lluctXinr2753927539eusmtip2H;
 Thu,  6 Jun 2019 10:59:25 +0000 (GMT)
Subject: Re: [PATCH v3 06/15] drm/bridge: tc358767: Simplify AUX data read
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <28ddfb42-db9a-f095-9230-d324db5ee483@samsung.com>
Date: Thu, 6 Jun 2019 12:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605070507.11417-7-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjtvffu7jqbXaflg0XSMEjLL4q6ZIlBxC36EQUSNbCll6m5GZuu
 LKg5JaeVtlKW07JAaVSizY+cpOUEV+h0+VEm2STsh8WIMlMxM7er5L/DOc95zznwUrjEJQil
 0lXZnFolz5SSIqKle64/at3PWVmsftKfyTfsZ/R2nYDRGzwCZnaoi2A6XzgwZmj6O8mM3/uA
 MUXGGiEz2FZFMmOfXhNMffUomejPDpbcxNjx8kWMtZnHhGyloULAuq87MLZ0IZZ1jDzH2Cnr
 Zrav3Ikd8zsl2pfKZaZrOXVMwhlR2tjUADo/tuGi8dUkrkPfAouRHwX0LtC/a8OLkYiS0BYE
 rSUWzCtI6F8I7swn88IUggLTALHiqHeWIV54hKDR04d4hweB6ckhLw6ij4AzbxD34mD6GPzU
 20ivAaenMXg1YPRFkHQELDR+IL1YTCdAo+uez0DQ4TD8vt3Hr6dPgru7QcDfBMKbiglfC7+l
 +6df6nzBOB0G+c2VOI9DYHSiGvOGAe0RQvvdESFf+yAMzxsRj4Pgq6Npmd8Ei7ZqjMdXwW0p
 wHmzAUFzgw3nhXjocrxdakEtJURAfVsMTx+A3uFewksDHQAjnkC+QwDcbjHhPC0GwzUJf70F
 3M7m5QdDoNY1Td5CUvOqZeZVa8yr1pj/5z5AxGMUwuVolApOs1PFXYjWyJWaHJUiOiVLaUVL
 /6znr2O6FXX8OWtHNIWka8XwbEYmEci1mlylHQGFS4PFWtesTCJOlede4tRZyeqcTE5jRxsp
 Qhoivrxm/LSEVsizuXMcd55Tr6gY5ReqQ8qy2B7X7tGo43ZhylY6+eHLxJqmz1Ym+ejej7dO
 DJknf2dHBmzQKV7Gb2oLcxzd06es7evstZWJeoocdVr068rWOpupoSljW1IVXlQVPZ/ExFp2
 lFqCreE3avDCH8Thwjpth4nhVD8i+pnteXFm0czc0ykh2e2uyLjfIouPkxKaNHlcJK7WyP8B
 yolaOWMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xe7p8n37EGNydLW7R3GFr0XSogdWi
 qeMtq8WPK4dZLA7uOc5kceXrezaLB3NvMll0TlzCbnF51xw2i7v3TrBYrJ9/i82B2+NyXy+T
 x4Op/5k8ds66y+4xu2Mmq8f97uNMHv1/DTyO39jO5PF5k5zHualnmQI4o/RsivJLS1IVMvKL
 S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy7n6+xFhwV6xi4oGXzA2M
 rwW7GDk5JARMJNafncLYxcjFISSwlFFix7bpTBAJcYnd898yQ9jCEn+udbFBFL0GKtq+lxUk
 ISzgJXG28TJYkYiAn0TXvANMIEXMAt+ZJCYu38sC0XGUUWL/5V0sIFVsApoSfzffZAOxeQXs
 JDZfmAvWzSKgInH1+l6wuKhAhMSZ9ytYIGoEJU7OfAJmcwLVr3m6lhHEZhZQl/gz7xIzhC0v
 0bx1NpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefn
 bmIERvG2Yz+37GDsehd8iFGAg1GJh1di4/cYIdbEsuLK3EOMEhzMSiK8ZRd+xAjxpiRWVqUW
 5ccXleakFh9iNAV6biKzlGhyPjDB5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0t
 SC2C6WPi4JRqYDyiLF0p0BnsedB3e6nnnu8TlSqjkj55zNYSYJG5FK3JdeD9lWyW2S8feK2I
 Xly8oKR+n/jFnz/VxY/xxqcdDts949B+5le7a/4GGR/l254S4/b81zaRq8lBC6zLfzQ6eagd
 3SkR1Xyd4/y2nfc4npbcdL+8MMi0i5VT5tmeTl/JR+vnqa038lBiKc5INNRiLipOBACvrHZ6
 +AIAAA==
X-CMS-MailID: 20190606105926eucas1p2e613ca3e2c9c6537877273c2cca2c3fd
X-Msg-Generator: CA
X-RootMTR: 20190605070535epcas2p36fee13315966e45d425c073162aa1aae
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190605070535epcas2p36fee13315966e45d425c073162aa1aae
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
 <CGME20190605070535epcas2p36fee13315966e45d425c073162aa1aae@epcas2p3.samsung.com>
 <20190605070507.11417-7-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559818768;
 bh=v865NwK69lmWWiFDGUwndz3M24HjP/DKAiXeTb9R+XY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=vXOnQFA6eivxdFqvIdMpY2L9vdZR0latyl4V5W2qLPKTLtil6U9q3OvLyz5D84mdu
 LjaDwmK3spZp1mSeSVi9k7U+SgAfHmUTI9D8APG3CA+cMj7KGchGWv0OgxSdNJtRd4
 iqVcGedVchJCuioVdyM9izcWDbp3UrUBUZTRBuSs=
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

T24gMDUuMDYuMjAxOSAwOTowNCwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gU2ltcGxpZnkgQVVY
IGRhdGEgcmVhZCBieSByZW1vdmluZyBpbmRleCBhcml0aG1ldGljIGFuZCBzaGlmdGluZyB3aXRo
Cj4gYSBoZWxwZXIgZnVuY3Rpb25zIHRoYXQgZG9lcyB0aHJlZSB0aGluZ3M6Cj4KPiAgICAgMS4g
RmV0Y2ggZGF0YSBmcm9tIHVwIHRvIDQgMzItYml0IHJlZ2lzdGVycyBmcm9tIHRoZSBjaGlwCj4g
ICAgIDIuIE9wdGlvbmFsbHkgZml4IGRhdGEgZW5kaWFubmVzcyAobm90IG5lZWRlZCBvbiBMRSBo
b3N0cykKPiAgICAgMy4gQ29weSByZWFkIGRhdGEgaW50byB1c2VyIHByb3ZpZGVkIGFycmF5Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNv
bT4KPiBDYzogQXJjaGl0IFRhbmVqYSA8YXJjaGl0dEBjb2RlYXVyb3JhLm9yZz4KPiBDYzogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8
TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AdGkuY29tPgo+IENjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1c2Fr
b3ZAY29nZW50ZW1iZWRkZWQuY29tPgo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgo+IENjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5hZXJvPgo+IENjOiBD
aHJpcyBIZWFseSA8Y3BoZWFseUBnbWFpbC5jb20+Cj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNo
QHBlbmd1dHJvbml4LmRlPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gaW5kZXggZTE5N2NlMGZiMTY2Li5kYTQ3ZDgxZTcx
MDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gQEAgLTMyMSw2ICszMjEsMjkg
QEAgc3RhdGljIGludCB0Y19hdXhfZ2V0X3N0YXR1cyhzdHJ1Y3QgdGNfZGF0YSAqdGMsIHU4ICpy
ZXBseSkKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IHRjX2F1eF9yZWFkX2Rh
dGEoc3RydWN0IHRjX2RhdGEgKnRjLCB2b2lkICpkYXRhLCBzaXplX3Qgc2l6ZSkKPiArewo+ICsJ
dTMyIGF1eHJkYXRhW0RQX0FVWF9NQVhfUEFZTE9BRF9CWVRFUyAvIHNpemVvZih1MzIpXTsKPiAr
CWludCByZXQsIGksIGNvdW50ID0gRElWX1JPVU5EX1VQKHNpemUsIHNpemVvZih1MzIpKTsKPiAr
Cj4gKwlyZXQgPSByZWdtYXBfYnVsa19yZWFkKHRjLT5yZWdtYXAsIERQMF9BVVhSREFUQSgwKSwg
YXV4cmRhdGEsIGNvdW50KTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlm
b3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgewo+ICsJCS8qCj4gKwkJICogT3VyIHJlZ21hcCBp
cyBjb25maWd1cmVkIGFzIExFIGZvciByZWdpc3RlciBkYXRhLAo+ICsJCSAqIHNvIHdlIG5lZWQg
dW5kbyBhbnkgYnl0ZSBzd2FwcGluZyB0aGF0IG1pZ2h0IGhhdmUKPiArCQkgKiBoYXBwZW5lZCB0
byBwcmVzZXJ2ZSBvcmlnaW5hbCBieXRlIG9yZGVyLgo+ICsJCSAqLwo+ICsJCWxlMzJfdG9fY3B1
cygmYXV4cmRhdGFbaV0pOwo+ICsJfQo+ICsKPiArCW1lbWNweShkYXRhLCBhdXhyZGF0YSwgc2l6
ZSk7Cj4gKwo+ICsJcmV0dXJuIHNpemU7Cj4gK30KPiArCgoKSG1tLCBjYW5ub3Qgd2UganVzdCB1
c2UgcmVnbWFwX3Jhd19yZWFkPwoKQmVzaWRlIHRoaXM6CgpSZXZpZXdlZC1ieTogQW5kcnplaiBI
YWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCgoKCj4gIHN0
YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAo+ICAJ
CQkgICAgICAgc3RydWN0IGRybV9kcF9hdXhfbXNnICptc2cpCj4gIHsKPiBAQCAtMzc5LDE5ICs0
MDIsMTAgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgsCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JaWYgKHJlcXVlc3Qg
PT0gRFBfQVVYX0kyQ19SRUFEIHx8IHJlcXVlc3QgPT0gRFBfQVVYX05BVElWRV9SRUFEKSB7Cj4g
LQkJLyogUmVhZCBkYXRhICovCj4gLQkJd2hpbGUgKGkgPCBzaXplKSB7Cj4gLQkJCWlmICgoaSAl
IDQpID09IDApIHsKPiAtCQkJCXJldCA9IHJlZ21hcF9yZWFkKHRjLT5yZWdtYXAsCj4gLQkJCQkJ
CSAgRFAwX0FVWFJEQVRBKGkgPj4gMiksICZ0bXApOwo+IC0JCQkJaWYgKHJldCkKPiAtCQkJCQly
ZXR1cm4gcmV0Owo+IC0JCQl9Cj4gLQkJCWJ1ZltpXSA9IHRtcCAmIDB4ZmY7Cj4gLQkJCXRtcCA9
IHRtcCA+PiA4Owo+IC0JCQlpKys7Cj4gLQkJfQo+ICsJc3dpdGNoIChyZXF1ZXN0KSB7Cj4gKwlj
YXNlIERQX0FVWF9OQVRJVkVfUkVBRDoKPiArCWNhc2UgRFBfQVVYX0kyQ19SRUFEOgo+ICsJCXJl
dHVybiB0Y19hdXhfcmVhZF9kYXRhKHRjLCBtc2ctPmJ1ZmZlciwgc2l6ZSk7Cj4gIAl9Cj4gIAo+
ICAJcmV0dXJuIHNpemU7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
