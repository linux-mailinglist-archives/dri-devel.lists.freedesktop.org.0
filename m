Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAD31D0B94
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095CA6E9C4;
	Wed, 13 May 2020 09:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FEF6E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:16:42 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2B8632000C;
 Tue, 12 May 2020 07:16:38 +0000 (UTC)
Date: Tue, 12 May 2020 09:16:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
Message-ID: <20200512091637.198dd0c2@xps13>
In-Reply-To: <20200512065111.716801-1-noltari@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
 <20200512065111.716801-1-noltari@gmail.com>
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
IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKMDg6NTE6MTEgKzAyMDA6Cgo+IFRoZSBjdXJyZW50
IGNvZGUgY2hlY2tzIHRoYXQgdGhlIHdob2xlIE9PQiBhcmVhIGlzIGVyYXNlZC4KPiBUaGlzIGlz
IGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8gdGhlIE9PQiwg
c2luY2UgaXQgd2lsbAo+IGZhaWwgZHVlIHRvIHRoZSB1c2FibGUgT09CIGJ5dGVzIG5vdCBiZWlu
ZyAweGZmLgo+IENvcnJlY3QgdGhpcyBieSBvbmx5IGNoZWNraW5nIHRoYXQgZGF0YSBhbmQgRUND
IGJ5dGVzIGFyZW4ndCAweGZmLgo+IAo+IEZpeGVzOiAwMmI4OGVlYTlmOWMgKCJtdGQ6IGJyY21u
YW5kOiBBZGQgY2hlY2sgZm9yIGVyYXNlZCBwYWdlIGJpdGZsaXBzIikKPiBTaWduZWQtb2ZmLWJ5
OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+IC0tLQo+ICB2
MzogRml4IGNvbW1pdCBsb2cgYW5kIG1lcmdlIG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayBj
YWxscy4KPiAgdjI6IEFkZCBGaXhlcyB0YWcKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gaW5kZXggZTRlM2NlZWFjMzhmLi44MGZlMDFmMDM1
MTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBAQCAt
MjAxOCw4ICsyMDE4LDkgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZWFkX2J5X3BpbyhzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgc3RhdGljIGludCBicmNt
c3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAJCSAg
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdm9pZCAqYnVmLCB1NjQgYWRkcikKPiAgewo+ICsJc3Ry
dWN0IG10ZF9vb2JfcmVnaW9uIG9vYmVjYzsKPiAgCWludCBpLCBzYXM7Cj4gLQl2b2lkICpvb2Ig
PSBjaGlwLT5vb2JfcG9pOwo+ICsJdm9pZCAqb29iOwo+ICAJaW50IGJpdGZsaXBzID0gMDsKPiAg
CWludCBwYWdlID0gYWRkciA+PiBjaGlwLT5wYWdlX3NoaWZ0Owo+ICAJaW50IHJldDsKPiBAQCAt
MjAzNSwxMSArMjAzNiwxOSBAQCBzdGF0aWMgaW50IGJyY21zdGJfbmFuZF92ZXJpZnlfZXJhc2Vk
X3BhZ2Uoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7
Cj4gIAo+IC0JZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrLCBvb2IgKz0gc2Fz
KSB7Cj4gKwlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyspIHsKPiAgCQllY2Nf
Y2h1bmsgPSBidWYgKyBjaGlwLT5lY2Muc2l6ZSAqIGk7Cj4gLQkJcmV0ID0gbmFuZF9jaGVja19l
cmFzZWRfZWNjX2NodW5rKGVjY19jaHVuaywKPiAtCQkJCQkJICBjaGlwLT5lY2Muc2l6ZSwKPiAt
CQkJCQkJICBvb2IsIHNhcywgTlVMTCwgMCwKPiArCj4gKwkJaWYgKG10ZC0+b29ibGF5b3V0LT5l
Y2MobXRkLCBpLCAmb29iZWNjKSkgewoKUGxlYXNlIHVzZSB0aGUgbXRkY29yZS5jJ3MgaGVscGVy
cwoobXRkX29vYmxheW91dF9zZXQvZ2V0X2RhdGEvZnJlZS9lY2MvYnl0ZXMpLgoKQWxzbywgd2hh
dCBhcmUgeW91IHRyeWluZyB0byBkaXNjcmltaW5hdGUgd2l0aCB0aGUgcmV0dXJuIGNvZGUgb2Yg
dGhlCmZ1bmN0aW9uPyBTaG91bGRuJ3QgdGhpcyBmdW5jdGlvbiAiYWx3YXlzIiB3b3JrPwoKPiAr
CQkJb29iID0gTlVMTDsKPiArCQkJb29iZWNjLmxlbmd0aCA9IDA7Cj4gKwkJfSBlbHNlIHsKPiAr
CQkJb29iID0gY2hpcC0+b29iX3BvaSArIG9vYmVjYy5vZmZzZXQ7Cj4gKwkJfQo+ICsKPiArCQly
ZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsoZWNjX2NodW5rLCBjaGlwLT5lY2Muc2l6
ZSwKPiArCQkJCQkJICBvb2IsIG9vYmVjYy5sZW5ndGgsCj4gKwkJCQkJCSAgTlVMTCwgMCwKPiAg
CQkJCQkJICBjaGlwLT5lY2Muc3RyZW5ndGgpOwoKQXMgSSB0b2xkIHlvdSwgdGhpcyBoZWxwZXIg
dGFrZXMgIm1haWQgZGF0YSIgdGhlbiAic3BhcmUgYXJlYSIgdGhlbgoiZWNjIGJ5dGVzIi4gVGhl
IG5hbWVzIGFyZSBwcmV0dHkgaW1wb3J0YW50IGhlcmUgYXMgeW91IHdhbnQgdG8gYXZvaWQKY2hl
Y2tpbmcgdGhlIHNwYXJlIE9PQiBieXRlcyBvbiBwdXJwb3NlLCBzbyBtYXliZSB5b3UgY291bGQg
aGF2ZSBtb3JlCm1lYW5pbmdmdWwgbmFtZXMgYW5kIGNhbGwgImVjYyIgaW5zdGVhZCBvZiAib29i
IiB0aGUgZWNjIHJlZ2lvbj8KIAo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQlyZXR1cm4gcmV0OwoK
ClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
