Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0ED2D35E
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 03:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FB06E05F;
	Wed, 29 May 2019 01:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5B206E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 01:35:16 +0000 (UTC)
X-UUID: 309489357c424e4daafe8cb7ec3897c9-20190529
X-UUID: 309489357c424e4daafe8cb7ec3897c9-20190529
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1821457272; Wed, 29 May 2019 09:35:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 29 May 2019 09:35:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 May 2019 09:35:11 +0800
Message-ID: <1559093711.11380.6.camel@mtksdaap41>
Subject: Re: [PATCH 1/3] drm: mediatek: fix unbind functions
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 09:35:11 +0800
In-Reply-To: <20190527045054.113259-2-hsinyi@chromium.org>
References: <20190527045054.113259-1-hsinyi@chromium.org>
 <20190527045054.113259-2-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4teWk6CgpPbiBNb24sIDIwMTktMDUtMjcgYXQgMTI6NTAgKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBtb3ZlIG1pcGlfZHNpX2hvc3RfdW5yZWdpc3RlcigpIHRvIC5yZW1vdmUg
c2luY2UgbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigpCj4gaXMgY2FsbGVkIGluIC5wcm9iZS4KCklu
IHRoZSBsYXRlc3Qga2VybmVsIFsxXSwgbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigpIGlzIGNhbGxl
ZCBpbgptdGtfZHNpX2JpbmQoKSwgSSB0aGluayB3ZSBkb24ndCBuZWVkIHRoaXMgcGFydC4KClsx
XQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jP2g9djUu
Mi1yYzIKCj4gCj4gZGV0YXRjaCBwYW5lbCBpbiBtdGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoKSwg
c2luY2UgLmJpbmQgd2lsbCB0cnkgdG8KPiBhdHRhY2ggaXQgYWdhaW4uCj4gCj4gRml4ZXM6IDJl
NTRjMTRlMzEwZiAoImRybS9tZWRpYXRlazogQWRkIERTSSBzdWIgZHJpdmVyIikKPiBTaWduZWQt
b2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYwo+IGluZGV4IGIwMGViMmQyZTA4Ni4uYzliNmQzYTY4YzhiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTg0NCw2ICs4NDQsOCBAQCBzdGF0aWMgdm9pZCBt
dGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoc3RydWN0IG10a19kc2kgKmRzaSkKPiAgCS8qIFNraXAg
Y29ubmVjdG9yIGNsZWFudXAgaWYgY3JlYXRpb24gd2FzIGRlbGVnYXRlZCB0byB0aGUgYnJpZGdl
ICovCj4gIAlpZiAoZHNpLT5jb25uLmRldikKPiAgCQlkcm1fY29ubmVjdG9yX2NsZWFudXAoJmRz
aS0+Y29ubik7Cj4gKwlpZiAoZHNpLT5wYW5lbCkKPiArCQlkcm1fcGFuZWxfZGV0YWNoKGRzaS0+
cGFuZWwpOwoKSSB0aGluayBtdGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoKSBoYXMgbXVjaCB0aGlu
ZyB0byBkbyBhbmQgSSB3b3VsZCBsaWtlCnlvdSB0byBkbyBtb3JlLiBZb3UgY291bGQgcmVmZXIg
dG8gWzJdIGZvciBjb21wbGV0ZSBpbXBsZW1lbnRhdGlvbi4KClsyXQpodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmM/aD12NS4yLXJjMiNuMTU3NQoK
UmVnYXJkcywKQ0sKCj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIG10a19kc2lfZGRwX3N0YXJ0KHN0
cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gQEAgLTEwNzMsNyArMTA3NSw2IEBAIHN0YXRpYyB2
b2lkIG10a19kc2lfdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFz
dGVyLAo+ICAJc3RydWN0IG10a19kc2kgKmRzaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICAK
PiAgCW10a19kc2lfZGVzdHJveV9jb25uX2VuYyhkc2kpOwo+IC0JbWlwaV9kc2lfaG9zdF91bnJl
Z2lzdGVyKCZkc2ktPmhvc3QpOwo+ICAJbXRrX2RkcF9jb21wX3VucmVnaXN0ZXIoZHJtLCAmZHNp
LT5kZHBfY29tcCk7Cj4gIH0KPiAgCj4gQEAgLTExNzksNiArMTE4MCw3IEBAIHN0YXRpYyBpbnQg
bXRrX2RzaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCj4gIAltdGtf
b3V0cHV0X2RzaV9kaXNhYmxlKGRzaSk7Cj4gIAljb21wb25lbnRfZGVsKCZwZGV2LT5kZXYsICZt
dGtfZHNpX2NvbXBvbmVudF9vcHMpOwo+ICsJbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2kt
Pmhvc3QpOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
