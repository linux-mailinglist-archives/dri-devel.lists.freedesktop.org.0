Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514121D0B88
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F0E6E2DC;
	Wed, 13 May 2020 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFAB8919B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:08:49 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C58C6C000C;
 Tue, 12 May 2020 07:08:45 +0000 (UTC)
Date: Tue, 12 May 2020 09:08:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Message-ID: <20200512090844.21bcaf22@xps13>
In-Reply-To: <20200512060023.684871-3-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKMDg6MDA6MjMgKzAyMDA6Cgo+IFRoZSBjdXJyZW50
IGNvZGUgZ2VuZXJhdGVzIDggb29iIHNlY3Rpb25zOgo+IFMxCTEtNQo+IEVDQwk2LTgKPiBTMgk5
LTE1Cj4gUzMJMTYtMjEKPiBFQ0MJMjItMjQKPiBTNAkyNS0zMQo+IFM1CTMyLTM3Cj4gRUNDCTM4
LTQwCj4gUzYJNDEtNDcKPiBTNwk0OC01Mwo+IEVDQwk1NC01Ngo+IFM4CTU3LTYzCj4gCj4gQ2hh
bmdlIGl0IGJ5IG1lcmdpbmcgY29udGludW91cyBzZWN0aW9uczoKPiBTMQkxLTUKPiBFQ0MJNi04
Cj4gUzIJOS0yMQo+IEVDQwkyMi0yNAo+IFMzCTI1LTM3Cj4gRUNDCTM4LTQwCj4gUzQJNDEtNTMK
PiBFQ0MJNTQtNTYKPiBTNQk1Ny02Mwo+IAo+IEZpeGVzOiBlZjVlZWVhNmU5MTEgKCJtdGQ6IG5h
bmQ6IGJyY206IHN3aXRjaCB0byBtdGRfb29ibGF5b3V0X29wcyIpCgpTb3JyeSBmb3IgbGVhZGlu
ZyB5b3UgdGhlIHdyb25nIHdheSwgYWN0dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdApkZXNlcnZl
IGEgRml4ZXMgdGFnLgoKPiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMg
PG5vbHRhcmlAZ21haWwuY29tPgo+IC0tLQo+ICB2MzogaW52ZXJ0IHBhdGNoIG9yZGVyCj4gIHYy
OiBrZWVwIG9yaWdpbmFsIGNvbW1lbnQgYW5kIGZpeCBjb3JyZWN0bHkgc2tpcCBieXRlIDYgZm9y
IHNtYWxsLXBhZ2UgbmFuZAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jIHwgMzcgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL2JyY21uYW5kLmMKPiBpbmRleCAxYzEwNzAxMTFlYmMuLjBhMWQ3NmZkZTM3YiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC0xMTAw
LDMzICsxMTAwLDMyIEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfaGFtbWluZ19vb2JsYXlvdXRfZnJl
ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gIAlzdHJ1Y3QgYnJjbW5hbmRf
Y2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7Cj4gIAlpbnQgc2FzID0gY2ZnLT5zcGFyZV9hcmVhX3Np
emUgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xazsKPiAgCWludCBzZWN0b3JzID0gY2ZnLT5wYWdlX3Np
emUgLyAoNTEyIDw8IGNmZy0+c2VjdG9yX3NpemVfMWspOwo+ICsJdTMyIG5leHQ7Cj4gIAo+IC0J
aWYgKHNlY3Rpb24gPj0gc2VjdG9ycyAqIDIpCj4gKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMpCj4g
IAkJcmV0dXJuIC1FUkFOR0U7Cj4gIAo+IC0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAv
IDIpICogc2FzOwo+ICsJbmV4dCA9IChzZWN0aW9uICogc2FzKTsKPiArCWlmIChzZWN0aW9uIDwg
c2VjdG9ycykKPiArCQluZXh0ICs9IDY7Cj4gIAo+IC0JaWYgKHNlY3Rpb24gJiAxKSB7Cj4gLQkJ
b29icmVnaW9uLT5vZmZzZXQgKz0gOTsKPiAtCQlvb2JyZWdpb24tPmxlbmd0aCA9IDc7Cj4gKwlp
ZiAoc2VjdGlvbikgewo+ICsJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBz
YXMpICsgOTsKPiAgCX0gZWxzZSB7Cj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+IC0KPiAt
CQkvKiBGaXJzdCBzZWN0b3Igb2YgZWFjaCBwYWdlIG1heSBoYXZlIEJCSSAqLwo+IC0JCWlmICgh
c2VjdGlvbikgewo+IC0JCQkvKgo+IC0JCQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBm
b3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiAtCQkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4K
PiAtCQkJICovCj4gLQkJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikgewo+IC0JCQkJb29icmVn
aW9uLT5vZmZzZXQgKz0gMjsKPiAtCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoIC09IDI7Cj4gLQkJCX0g
ZWxzZSB7Cj4gLQkJCQlvb2JyZWdpb24tPmxlbmd0aC0tOwo+IC0JCQl9Cj4gKwkJLyoKPiArCQkg
KiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiAr
CQkgKiBOQU5EIHVzZSBieXRlcyAwIGFuZCAxLgo+ICsJCSAqLwo+ICsJCWlmIChjZmctPnBhZ2Vf
c2l6ZSA+IDUxMikgewo+ICsJCQlvb2JyZWdpb24tPm9mZnNldCA9IDI7Cj4gKwkJfSBlbHNlIHsK
PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+ICsJCQluZXh0LS07CgpUaGlzIG5leHQtLSBz
ZWVtcyB2ZXJ5IHN0cmFuZ2UsIGNhbiB5b3UgZXhwbGFpbj8KCj4gIAkJfQo+ICAJfQo+ICAKPiAr
CW9vYnJlZ2lvbi0+bGVuZ3RoID0gbmV4dCAtIG9vYnJlZ2lvbi0+b2Zmc2V0Owo+ICsKPiAgCXJl
dHVybiAwOwo+ICB9Cj4gIAoKClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
