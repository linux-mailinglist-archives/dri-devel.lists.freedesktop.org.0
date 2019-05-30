Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4A2F9F6
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 12:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF7F6E0C6;
	Thu, 30 May 2019 10:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702156E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 10:06:20 +0000 (UTC)
X-UUID: 9a8d72f3862a478f86143f7e43f8ea8f-20190530
X-UUID: 9a8d72f3862a478f86143f7e43f8ea8f-20190530
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 697089773; Thu, 30 May 2019 18:06:11 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 May 2019 18:06:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 18:06:10 +0800
Message-ID: <1559210770.12373.0.camel@mtksdaap41>
Subject: Re: [PATCH v4] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 May 2019 18:06:10 +0800
In-Reply-To: <20190530091847.90263-1-hsinyi@chromium.org>
References: <20190530091847.90263-1-hsinyi@chromium.org>
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

SGksIEhzaW4tWWk6CgpPbiBUaHUsIDIwMTktMDUtMzAgYXQgMTc6MTggKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBtdGtfZHNpX3N0b3AoKSBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIG10a19k
cm1fY3J0Y19hdG9taWNfZGlzYWJsZSgpLCB3aGljaCBuZWVkcwo+IG92bCBpcnEgZm9yIGRybV9j
cnRjX3dhaXRfb25lX3ZibGFuaygpLCBzaW5jZSBhZnRlciBtdGtfZHNpX3N0b3AoKSBpcyBjYWxs
ZWQsCj4gb3ZsIGlycSB3aWxsIGJlIGRpc2FibGVkLiBJZiBkcm1fY3J0Y193YWl0X29uZV92Ymxh
bmsoKSBpcyBjYWxsZWQgYWZ0ZXIgbGFzdAo+IGlycSwgaXQgd2lsbCB0aW1lb3V0IHdpdGggdGhp
cyBtZXNzYWdlOiAidmJsYW5rIHdhaXQgdGltZWQgb3V0IG9uIGNydGMgMCIuIFRoaXMKPiBoYXBw
ZW5zIHNvbWV0aW1lcyB3aGVuIHR1cm5pbmcgb2ZmIHRoZSBzY3JlZW4uCj4gCj4gSW4gZHJtX2F0
b21pY19oZWxwZXIuYyNkaXNhYmxlX291dHB1dHMoKSwKPiB0aGUgY2FsbGluZyBzZXF1ZW5jZSB3
aGVuIHR1cm5pbmcgb2ZmIHRoZSBzY3JlZW4gaXM6Cj4gCj4gMS4gbXRrX2RzaV9lbmNvZGVyX2Rp
c2FibGUoKQo+ICAgICAgLS0+IG10a19vdXRwdXRfZHNpX2Rpc2FibGUoKQo+ICAgICAgICAtLT4g
bXRrX2RzaV9zdG9wKCk7ICAvLyBzb21ldGltZXMgbWFrZSB2YmxhbmsgdGltZW91dCBpbiBhdG9t
aWNfZGlzYWJsZQo+ICAgICAgICAtLT4gbXRrX2RzaV9wb3dlcm9mZigpOwo+IDIuIG10a19kcm1f
Y3J0Y19hdG9taWNfZGlzYWJsZSgpCj4gICAgICAtLT4gZHJtX2NydGNfd2FpdF9vbmVfdmJsYW5r
KCk7Cj4gICAgICAuLi4KPiAgICAgICAgLS0+IG10a19kc2lfZGRwX3N0b3AoKQo+ICAgICAgICAg
IC0tPiBtdGtfZHNpX3Bvd2Vyb2ZmKCk7Cj4gCj4gbXRrX2RzaV9wb3dlcm9mZigpIGhhcyByZWZl
cmVuY2UgY291bnQgZGVzaWduLCBjaGFuZ2UgdG8gbWFrZSBtdGtfZHNpX3N0b3AoKQo+IGNhbGxl
ZCBpbiBtdGtfZHNpX3Bvd2Vyb2ZmKCkgd2hlbiByZWZjb3VudCBpcyAwLgoKUmV2aWV3ZWQtYnk6
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IAo+IEZpeGVzOiAwNzA3NjMyYjViYWMgKCJk
cm0vbWVkaWF0ZWs6IHVwZGF0ZSBEU0kgc3ViIGRyaXZlciBmbG93IGZvciBzZW5kaW5nIGNvbW1h
bmRzIHRvIHBhbmVsIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJv
bWl1bS5vcmc+Cj4gLS0tCj4gY2hhbmdlIGxvZyB2My0+djQ6Cj4gKiBhZGQgY29tbWVudCBpbiBj
b2RlLgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTAgKysr
KysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggYjAwZWIyZDJlMDg2Li43
MzA1OTRhOTE0NDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtNjMw
LDYgKzYzMCwxNSBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX3Bvd2Vyb2ZmKHN0cnVjdCBtdGtfZHNp
ICpkc2kpCj4gIAlpZiAoLS1kc2ktPnJlZmNvdW50ICE9IDApCj4gIAkJcmV0dXJuOwo+ICAKPiAr
CS8qIAo+ICsJICogbXRrX2RzaV9zdG9wKCkgYW5kIG10a19kc2lfc3RhcnQoKSBpcyBhc3ltbWV0
cmljLCBzaW5jZQo+ICsJICogbXRrX2RzaV9zdG9wKCkgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBt
dGtfZHJtX2NydGNfYXRvbWljX2Rpc2FibGUoKSwKPiArCSAqIHdoaWNoIG5lZWRzIGlycSBmb3Ig
dmJsYW5rLCBhbmQgbXRrX2RzaV9zdG9wKCkgd2lsbCBkaXNhYmxlIGlycS4KPiArCSAqIG10a19k
c2lfc3RhcnQoKSBuZWVkcyB0byBiZSBjYWxsZWQgaW4gbXRrX291dHB1dF9kc2lfZW5hYmxlKCks
Cj4gKwkgKiBhZnRlciBkc2kgaXMgZnVsbHkgc2V0Lgo+ICsJICovCj4gKwltdGtfZHNpX3N0b3Ao
ZHNpKTsKPiArCj4gIAlpZiAoIW10a19kc2lfc3dpdGNoX3RvX2NtZF9tb2RlKGRzaSwgVk1fRE9O
RV9JTlRfRkxBRywgNTAwKSkgewo+ICAJCWlmIChkc2ktPnBhbmVsKSB7Cj4gIAkJCWlmIChkcm1f
cGFuZWxfdW5wcmVwYXJlKGRzaS0+cGFuZWwpKSB7Cj4gQEAgLTY5Niw3ICs3MDUsNiBAQCBzdGF0
aWMgdm9pZCBtdGtfb3V0cHV0X2RzaV9kaXNhYmxlKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIAkJ
fQo+ICAJfQo+ICAKPiAtCW10a19kc2lfc3RvcChkc2kpOwo+ICAJbXRrX2RzaV9wb3dlcm9mZihk
c2kpOwo+ICAKPiAgCWRzaS0+ZW5hYmxlZCA9IGZhbHNlOwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
