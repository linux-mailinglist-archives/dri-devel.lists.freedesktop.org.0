Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73D1D0B96
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF686E9D3;
	Wed, 13 May 2020 09:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4233D6E854
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:41:19 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2440920000F;
 Tue, 12 May 2020 07:41:13 +0000 (UTC)
Date: Tue, 12 May 2020 09:41:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Message-ID: <20200512094112.0b9c3403@xps13>
In-Reply-To: <461FD58F-ACD5-4158-BC0B-8C73C53D5C0D@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com>
 <20200512090844.21bcaf22@xps13>
 <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
 <20200512091958.0d153319@xps13>
 <461FD58F-ACD5-4158-BC0B-8C73C53D5C0D@gmail.com>
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
IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKMDk6MjY6MjMgKzAyMDA6Cgo+IEhpIE1pcXXDqGws
Cj4gCj4gPiBFbCAxMiBtYXkgMjAyMCwgYSBsYXMgOToxOSwgTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+ID4gCj4gPiBIaSDDgWx2YXJvLAo+ID4g
Cj4gPiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPiB3cm90ZSBv
biBUdWUsIDEyIE1heSAyMDIwCj4gPiAwOToxMjoxMCArMDIwMDoKPiA+ICAgCj4gPj4gSGkgTWlx
dWVsLAo+ID4+IAo+ID4+IEkgYWxzbyBoYWQgYSBoYXJkIHRpbWUgdW5kZXJzdGFuZGluZyB5b3Vy
IGVtYWlsLgo+ID4+IEl0IHdhcyBxdWl0ZSBtaXNsZWFkaW5nLgo+ID4+ICAgCj4gPj4+IEVsIDEy
IG1heSAyMDIwLCBhIGxhcyA5OjA4LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPiBlc2NyaWJpw7M6Cj4gPj4+IAo+ID4+PiBIaSDDgWx2YXJvLAo+ID4+PiAKPiA+Pj4g
w4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGUgb24gVHVl
LCAxMiBNYXkgMjAyMAo+ID4+PiAwODowMDoyMyArMDIwMDoKPiA+Pj4gICAKPiA+Pj4+IFRoZSBj
dXJyZW50IGNvZGUgZ2VuZXJhdGVzIDggb29iIHNlY3Rpb25zOgo+ID4+Pj4gUzEJMS01Cj4gPj4+
PiBFQ0MJNi04Cj4gPj4+PiBTMgk5LTE1Cj4gPj4+PiBTMwkxNi0yMQo+ID4+Pj4gRUNDCTIyLTI0
Cj4gPj4+PiBTNAkyNS0zMQo+ID4+Pj4gUzUJMzItMzcKPiA+Pj4+IEVDQwkzOC00MAo+ID4+Pj4g
UzYJNDEtNDcKPiA+Pj4+IFM3CTQ4LTUzCj4gPj4+PiBFQ0MJNTQtNTYKPiA+Pj4+IFM4CTU3LTYz
Cj4gPj4+PiAKPiA+Pj4+IENoYW5nZSBpdCBieSBtZXJnaW5nIGNvbnRpbnVvdXMgc2VjdGlvbnM6
Cj4gPj4+PiBTMQkxLTUKPiA+Pj4+IEVDQwk2LTgKPiA+Pj4+IFMyCTktMjEKPiA+Pj4+IEVDQwky
Mi0yNAo+ID4+Pj4gUzMJMjUtMzcKPiA+Pj4+IEVDQwkzOC00MAo+ID4+Pj4gUzQJNDEtNTMKPiA+
Pj4+IEVDQwk1NC01Ngo+ID4+Pj4gUzUJNTctNjMKPiA+Pj4+IAo+ID4+Pj4gRml4ZXM6IGVmNWVl
ZWE2ZTkxMSAoIm10ZDogbmFuZDogYnJjbTogc3dpdGNoIHRvIG10ZF9vb2JsYXlvdXRfb3BzIikg
ICAgCj4gPj4+IAo+ID4+PiBTb3JyeSBmb3IgbGVhZGluZyB5b3UgdGhlIHdyb25nIHdheSwgYWN0
dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdAo+ID4+PiBkZXNlcnZlIGEgRml4ZXMgdGFnLiAgICAK
PiA+PiAKPiA+PiBEbyBJIG5lZWQgdG8gcmVzZW5kIHRoaXMgYWdhaW4/Cj4gPj4gTG9va3MgbGlr
ZSBubyBtYXR0ZXIgd2hhdCBJIGRvIGl04oCZcyBhbHdheXMgd3JvbmcuLi4gIAo+ID4gCj4gPiBQ
bGVhc2UgZG9uJ3QgZ2l2ZSB1cCEgSXQgaXMgbm9ybWFsIHRvIHdvcmsgYmFjayBhbmQgZm9ydGgg
d2l0aCB0aGUKPiA+IGNvbW11bml0eS4gSSBuZWVkIHRoZSBwYXRjaCB0byBiZSBjbGVhciBhbmQg
YnVnLWZyZWUgc28gSSBhc2sgeW91IHRvCj4gPiBtYWtlIGNoYW5nZXMgYW5kIGFzayBxdWVzdGlv
bnMsIHRoYXQncyBob3cgaXQgd29ya3MuIEJ1dCBhbGwgeW91cgo+ID4gcGF0Y2hlcyBhcmUgZW5o
YW5jaW5nIHRoaXMgZHJpdmVyIHNvIHBsZWFzZSBrZWVwIHBvc3RpbmchCj4gPiAgIAo+ID4+ICAg
Cj4gPj4+ICAgCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMg
PG5vbHRhcmlAZ21haWwuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiB2MzogaW52ZXJ0IHBhdGNoIG9y
ZGVyCj4gPj4+PiB2Mjoga2VlcCBvcmlnaW5hbCBjb21tZW50IGFuZCBmaXggY29ycmVjdGx5IHNr
aXAgYnl0ZSA2IGZvciBzbWFsbC1wYWdlIG5hbmQKPiA+Pj4+IAo+ID4+Pj4gZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDM3ICsrKysrKysrKysrKy0tLS0tLS0tLS0t
LQo+ID4+Pj4gMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQo+ID4+Pj4gCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMK
PiA+Pj4+IGluZGV4IDFjMTA3MDExMWViYy4uMGExZDc2ZmRlMzdiIDEwMDY0NAo+ID4+Pj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4+Pj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4+Pj4gQEAgLTExMDAs
MzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1taW5nX29vYmxheW91dF9mcmVl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiA+Pj4+IAlzdHJ1Y3QgYnJjbW5h
bmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7Cj4gPj4+PiAJaW50IHNhcyA9IGNmZy0+c3BhcmVf
YXJlYV9zaXplIDw8IGNmZy0+c2VjdG9yX3NpemVfMWs7Cj4gPj4+PiAJaW50IHNlY3RvcnMgPSBj
ZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7Cj4gPj4+PiArCXUz
MiBuZXh0Owo+ID4+Pj4gCj4gPj4+PiAtCWlmIChzZWN0aW9uID49IHNlY3RvcnMgKiAyKQo+ID4+
Pj4gKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMpCj4gPj4+PiAJCXJldHVybiAtRVJBTkdFOwo+ID4+
Pj4gCj4gPj4+PiAtCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKHNlY3Rpb24gLyAyKSAqIHNhczsKPiA+
Pj4+ICsJbmV4dCA9IChzZWN0aW9uICogc2FzKTsKPiA+Pj4+ICsJaWYgKHNlY3Rpb24gPCBzZWN0
b3JzKQo+ID4+Pj4gKwkJbmV4dCArPSA2Owo+ID4+Pj4gCj4gPj4+PiAtCWlmIChzZWN0aW9uICYg
MSkgewo+ID4+Pj4gLQkJb29icmVnaW9uLT5vZmZzZXQgKz0gOTsKPiA+Pj4+IC0JCW9vYnJlZ2lv
bi0+bGVuZ3RoID0gNzsKPiA+Pj4+ICsJaWYgKHNlY3Rpb24pIHsKPiA+Pj4+ICsJCW9vYnJlZ2lv
bi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBzYXMpICsgOTsKPiA+Pj4+IAl9IGVsc2Ugewo+
ID4+Pj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+ID4+Pj4gLQo+ID4+Pj4gLQkJLyogRmly
c3Qgc2VjdG9yIG9mIGVhY2ggcGFnZSBtYXkgaGF2ZSBCQkkgKi8KPiA+Pj4+IC0JCWlmICghc2Vj
dGlvbikgewo+ID4+Pj4gLQkJCS8qCj4gPj4+PiAtCQkJICogU21hbGwtcGFnZSBOQU5EIHVzZSBi
eXRlIDYgZm9yIEJCSSB3aGlsZSBsYXJnZS1wYWdlCj4gPj4+PiAtCQkJICogTkFORCB1c2UgYnl0
ZXMgMCBhbmQgMS4KPiA+Pj4+IC0JCQkgKi8KPiA+Pj4+IC0JCQlpZiAoY2ZnLT5wYWdlX3NpemUg
PiA1MTIpIHsKPiA+Pj4+IC0JCQkJb29icmVnaW9uLT5vZmZzZXQgKz0gMjsKPiA+Pj4+IC0JCQkJ
b29icmVnaW9uLT5sZW5ndGggLT0gMjsKPiA+Pj4+IC0JCQl9IGVsc2Ugewo+ID4+Pj4gLQkJCQlv
b2JyZWdpb24tPmxlbmd0aC0tOwo+ID4+Pj4gLQkJCX0KPiA+Pj4+ICsJCS8qCj4gPj4+PiArCQkg
KiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiA+
Pj4+ICsJCSAqIE5BTkQgdXNlIGJ5dGVzIDAgYW5kIDEuCj4gPj4+PiArCQkgKi8KPiA+Pj4+ICsJ
CWlmIChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikgewo+ID4+Pj4gKwkJCW9vYnJlZ2lvbi0+b2Zmc2V0
ID0gMjsKPiA+Pj4+ICsJCX0gZWxzZSB7Cj4gPj4+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAw
Owo+ID4+Pj4gKwkJCW5leHQtLTsgICAgCj4gPj4+IAo+ID4+PiBUaGlzIG5leHQtLSBzZWVtcyB2
ZXJ5IHN0cmFuZ2UsIGNhbiB5b3UgZXhwbGFpbj8gICAgCj4gPj4gCj4gPj4gSW4gdGhpcyBjYXNl
IG5leHQgd2lsbCBiZSA2ICh3aGljaCBpcyB0aGUgZmlyc3QgRUNDIGJ5dGUpLgo+ID4+IEhvd2V2
ZXIsIGZvciBzbWFsbCBwYWdlIE5BTkRzIGJ5dGUgNSBpcyByZXNlcnZlZCBmb3IgQkJULCBzbyB3
ZSB3YW50IG5leHQgdG8gYmUgNSBvbmx5IGluIHRoaXMgY2FzZS4gIAo+ID4gCj4gPiBUaGF0J3Mg
Y2xlYXIsIHBsZWFzZSBhZGQgYSBjb21tZW50IHRoZXJlIHRoZW4uICAKPiAKPiBJc27igJl0IOKA
nFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0ZSA2IGZvciBCQkkgd2hpbGUgbGFyZ2UtcGFnZSBOQU5E
IHVzZSBieXRlcyAwIGFuZCAxLuKAnSBlbm91Z2g/Cj4gRG8gd2UgcmVhbGx5IG5lZWQgYSBzcGVj
aWZpYyBjb21tZW50IGJlZm9yZSBuZXh0LS0/CgpHaXZlbiB0aGUgdGltZSBpdCB0b29rIG1lIHRv
IHVuZGVyc3RhbmQgdGhlc2UgbGluZXMsIEknZCBzYXkgOiAibm8iIDopCgpKdXN0IGdpdmUgbW9y
ZSBpbmZvcm1hdGlvbiBpbiB5b3VyIG1haW4gY29tbWVudCwgZXhwbGFpbmluZyB0aGFuIGluIG9u
ZQpjYXNlIHRoZSByZXNlcnZlZCBieXRlcyBhcmUgYXQgdGhlIGJlZ2lubmluZyAoZW5sYXJnaW5n
IHRoZSBvZmZzZXQpCndoaWxlIGluIHRoZSBvdGhlciBjYXNlIGl0IGlzIGF0IHRoZSBlbmQsIHNv
IHJlZHVjaW5nIHRoZSBzZWN0aW9uLgoKPiAKPiA+ICAgCj4gPj4gICAKPiA+Pj4gICAKPiA+Pj4+
IAkJfQo+ID4+Pj4gCX0KPiA+Pj4+IAo+ID4+Pj4gKwlvb2JyZWdpb24tPmxlbmd0aCA9IG5leHQg
LSBvb2JyZWdpb24tPm9mZnNldDsKPiA+Pj4+ICsKPiA+Pj4+IAlyZXR1cm4gMDsKPiA+Pj4+IH0K
PiA+Pj4+ICAgCj4gPj4+IAo+ID4+PiAKPiA+Pj4gVGhhbmtzLAo+ID4+PiBNaXF1w6hsICAgIAo+
ID4+IAo+ID4+IFJlZ2FyZHMsCj4gPj4gw4FsdmFyby4gIAo+ID4gCj4gPiAKPiA+IAo+ID4gVGhh
bmtzLAo+ID4gTWlxdcOobCAgCj4gCj4gUmVnYXJkcywKPiDDgWx2YXJvLgo+IAoKCgoKVGhhbmtz
LApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
