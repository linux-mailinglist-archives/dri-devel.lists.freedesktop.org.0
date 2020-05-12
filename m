Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF601D0B97
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1686E1F2;
	Wed, 13 May 2020 09:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5AE6E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:20:02 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BCD32C000D;
 Tue, 12 May 2020 07:19:59 +0000 (UTC)
Date: Tue, 12 May 2020 09:19:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Message-ID: <20200512091958.0d153319@xps13>
In-Reply-To: <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com>
 <20200512090844.21bcaf22@xps13>
 <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
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
IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKMDk6MTI6MTAgKzAyMDA6Cgo+IEhpIE1pcXVlbCwK
PiAKPiBJIGFsc28gaGFkIGEgaGFyZCB0aW1lIHVuZGVyc3RhbmRpbmcgeW91ciBlbWFpbC4KPiBJ
dCB3YXMgcXVpdGUgbWlzbGVhZGluZy4KPiAKPiA+IEVsIDEyIG1heSAyMDIwLCBhIGxhcyA5OjA4
LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiBlc2NyaWJpw7M6Cj4g
PiAKPiA+IEhpIMOBbHZhcm8sCj4gPiAKPiA+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKPiA+IDA4OjAwOjIzICsw
MjAwOgo+ID4gICAKPiA+PiBUaGUgY3VycmVudCBjb2RlIGdlbmVyYXRlcyA4IG9vYiBzZWN0aW9u
czoKPiA+PiBTMQkxLTUKPiA+PiBFQ0MJNi04Cj4gPj4gUzIJOS0xNQo+ID4+IFMzCTE2LTIxCj4g
Pj4gRUNDCTIyLTI0Cj4gPj4gUzQJMjUtMzEKPiA+PiBTNQkzMi0zNwo+ID4+IEVDQwkzOC00MAo+
ID4+IFM2CTQxLTQ3Cj4gPj4gUzcJNDgtNTMKPiA+PiBFQ0MJNTQtNTYKPiA+PiBTOAk1Ny02Mwo+
ID4+IAo+ID4+IENoYW5nZSBpdCBieSBtZXJnaW5nIGNvbnRpbnVvdXMgc2VjdGlvbnM6Cj4gPj4g
UzEJMS01Cj4gPj4gRUNDCTYtOAo+ID4+IFMyCTktMjEKPiA+PiBFQ0MJMjItMjQKPiA+PiBTMwky
NS0zNwo+ID4+IEVDQwkzOC00MAo+ID4+IFM0CTQxLTUzCj4gPj4gRUNDCTU0LTU2Cj4gPj4gUzUJ
NTctNjMKPiA+PiAKPiA+PiBGaXhlczogZWY1ZWVlYTZlOTExICgibXRkOiBuYW5kOiBicmNtOiBz
d2l0Y2ggdG8gbXRkX29vYmxheW91dF9vcHMiKSAgCj4gPiAKPiA+IFNvcnJ5IGZvciBsZWFkaW5n
IHlvdSB0aGUgd3Jvbmcgd2F5LCBhY3R1YWxseSB0aGlzIHBhdGNoIGRvZXMgbm90Cj4gPiBkZXNl
cnZlIGEgRml4ZXMgdGFnLiAgCj4gCj4gRG8gSSBuZWVkIHRvIHJlc2VuZCB0aGlzIGFnYWluPwo+
IExvb2tzIGxpa2Ugbm8gbWF0dGVyIHdoYXQgSSBkbyBpdOKAmXMgYWx3YXlzIHdyb25nLi4uCgpQ
bGVhc2UgZG9uJ3QgZ2l2ZSB1cCEgSXQgaXMgbm9ybWFsIHRvIHdvcmsgYmFjayBhbmQgZm9ydGgg
d2l0aCB0aGUKY29tbXVuaXR5LiBJIG5lZWQgdGhlIHBhdGNoIHRvIGJlIGNsZWFyIGFuZCBidWct
ZnJlZSBzbyBJIGFzayB5b3UgdG8KbWFrZSBjaGFuZ2VzIGFuZCBhc2sgcXVlc3Rpb25zLCB0aGF0
J3MgaG93IGl0IHdvcmtzLiBCdXQgYWxsIHlvdXIKcGF0Y2hlcyBhcmUgZW5oYW5jaW5nIHRoaXMg
ZHJpdmVyIHNvIHBsZWFzZSBrZWVwIHBvc3RpbmchCgo+IAo+ID4gICAKPiA+PiBTaWduZWQtb2Zm
LWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+ID4+IC0t
LQo+ID4+IHYzOiBpbnZlcnQgcGF0Y2ggb3JkZXIKPiA+PiB2Mjoga2VlcCBvcmlnaW5hbCBjb21t
ZW50IGFuZCBmaXggY29ycmVjdGx5IHNraXAgYnl0ZSA2IGZvciBzbWFsbC1wYWdlIG5hbmQKPiA+
PiAKPiA+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMzcgKysr
KysrKysrKysrLS0tLS0tLS0tLS0tCj4gPj4gMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDE5IGRlbGV0aW9ucygtKQo+ID4+IAo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYwo+ID4+IGluZGV4IDFjMTA3MDExMWViYy4uMGExZDc2ZmRlMzdiIDEwMDY0
NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPj4gQEAg
LTExMDAsMzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1taW5nX29vYmxheW91
dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiA+PiAJc3RydWN0IGJy
Y21uYW5kX2NmZyAqY2ZnID0gJmhvc3QtPmh3Y2ZnOwo+ID4+IAlpbnQgc2FzID0gY2ZnLT5zcGFy
ZV9hcmVhX3NpemUgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xazsKPiA+PiAJaW50IHNlY3RvcnMgPSBj
ZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7Cj4gPj4gKwl1MzIg
bmV4dDsKPiA+PiAKPiA+PiAtCWlmIChzZWN0aW9uID49IHNlY3RvcnMgKiAyKQo+ID4+ICsJaWYg
KHNlY3Rpb24gPiBzZWN0b3JzKQo+ID4+IAkJcmV0dXJuIC1FUkFOR0U7Cj4gPj4gCj4gPj4gLQlv
b2JyZWdpb24tPm9mZnNldCA9IChzZWN0aW9uIC8gMikgKiBzYXM7Cj4gPj4gKwluZXh0ID0gKHNl
Y3Rpb24gKiBzYXMpOwo+ID4+ICsJaWYgKHNlY3Rpb24gPCBzZWN0b3JzKQo+ID4+ICsJCW5leHQg
Kz0gNjsKPiA+PiAKPiA+PiAtCWlmIChzZWN0aW9uICYgMSkgewo+ID4+IC0JCW9vYnJlZ2lvbi0+
b2Zmc2V0ICs9IDk7Cj4gPj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA3Owo+ID4+ICsJaWYgKHNl
Y3Rpb24pIHsKPiA+PiArCQlvb2JyZWdpb24tPm9mZnNldCA9ICgoc2VjdGlvbiAtIDEpICogc2Fz
KSArIDk7Cj4gPj4gCX0gZWxzZSB7Cj4gPj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+ID4+
IC0KPiA+PiAtCQkvKiBGaXJzdCBzZWN0b3Igb2YgZWFjaCBwYWdlIG1heSBoYXZlIEJCSSAqLwo+
ID4+IC0JCWlmICghc2VjdGlvbikgewo+ID4+IC0JCQkvKgo+ID4+IC0JCQkgKiBTbWFsbC1wYWdl
IE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiA+PiAtCQkJICogTkFO
RCB1c2UgYnl0ZXMgMCBhbmQgMS4KPiA+PiAtCQkJICovCj4gPj4gLQkJCWlmIChjZmctPnBhZ2Vf
c2l6ZSA+IDUxMikgewo+ID4+IC0JCQkJb29icmVnaW9uLT5vZmZzZXQgKz0gMjsKPiA+PiAtCQkJ
CW9vYnJlZ2lvbi0+bGVuZ3RoIC09IDI7Cj4gPj4gLQkJCX0gZWxzZSB7Cj4gPj4gLQkJCQlvb2Jy
ZWdpb24tPmxlbmd0aC0tOwo+ID4+IC0JCQl9Cj4gPj4gKwkJLyoKPiA+PiArCQkgKiBTbWFsbC1w
YWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiA+PiArCQkgKiBO
QU5EIHVzZSBieXRlcyAwIGFuZCAxLgo+ID4+ICsJCSAqLwo+ID4+ICsJCWlmIChjZmctPnBhZ2Vf
c2l6ZSA+IDUxMikgewo+ID4+ICsJCQlvb2JyZWdpb24tPm9mZnNldCA9IDI7Cj4gPj4gKwkJfSBl
bHNlIHsKPiA+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+ID4+ICsJCQluZXh0LS07ICAK
PiA+IAo+ID4gVGhpcyBuZXh0LS0gc2VlbXMgdmVyeSBzdHJhbmdlLCBjYW4geW91IGV4cGxhaW4/
ICAKPiAKPiBJbiB0aGlzIGNhc2UgbmV4dCB3aWxsIGJlIDYgKHdoaWNoIGlzIHRoZSBmaXJzdCBF
Q0MgYnl0ZSkuCj4gSG93ZXZlciwgZm9yIHNtYWxsIHBhZ2UgTkFORHMgYnl0ZSA1IGlzIHJlc2Vy
dmVkIGZvciBCQlQsIHNvIHdlIHdhbnQgbmV4dCB0byBiZSA1IG9ubHkgaW4gdGhpcyBjYXNlLgoK
VGhhdCdzIGNsZWFyLCBwbGVhc2UgYWRkIGEgY29tbWVudCB0aGVyZSB0aGVuLgoKPiAKPiA+ICAg
Cj4gPj4gCQl9Cj4gPj4gCX0KPiA+PiAKPiA+PiArCW9vYnJlZ2lvbi0+bGVuZ3RoID0gbmV4dCAt
IG9vYnJlZ2lvbi0+b2Zmc2V0Owo+ID4+ICsKPiA+PiAJcmV0dXJuIDA7Cj4gPj4gfQo+ID4+ICAg
Cj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCj4gCj4gUmVnYXJkcywKPiDDgWx2
YXJvLgoKCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
