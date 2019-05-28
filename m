Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC12C1C4
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5136D89CFA;
	Tue, 28 May 2019 08:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454A589CFA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:53:39 +0000 (UTC)
X-UUID: 3bf0cdba7e454cf191ca3bdb5d6ffc8c-20190528
X-UUID: 3bf0cdba7e454cf191ca3bdb5d6ffc8c-20190528
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 919406679; Tue, 28 May 2019 16:53:07 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 28 May 2019 16:53:06 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 28 May 2019 16:53:06 +0800
Message-ID: <1559033586.5141.3.camel@mtksdaap41>
Subject: Re: [PATCH v3] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 28 May 2019 16:53:06 +0800
In-Reply-To: <20190528073908.633-1-hsinyi@chromium.org>
References: <20190528073908.633-1-hsinyi@chromium.org>
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
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpPbiBUdWUsIDIwMTktMDUtMjggYXQgMTU6MzkgKzA4MDAsIEhzaW4tWWkg
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
ZCBpbiBtdGtfZHNpX3Bvd2Vyb2ZmKCkgd2hlbiByZWZjb3VudCBpcyAwLgo+IAo+IEZpeGVzOiAw
NzA3NjMyYjViYWMgKCJkcm0vbWVkaWF0ZWs6IHVwZGF0ZSBEU0kgc3ViIGRyaXZlciBmbG93IGZv
ciBzZW5kaW5nIGNvbW1hbmRzIHRvIHBhbmVsIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdh
bmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gY2hhbmdlIGxvZyB2Mi0+djM6Cj4gKiBy
ZW1vdmUgdW5uZWNlc3NhcnkgY29kZXMgaW4gdW5iaW5kCj4gKiBiYXNlZCBvbiBkaXNjdXNzaW9u
IGluIHYyLCBpZiB3ZSBtb3ZlIG10a19kc2lfc3RhcnQoKSB0byBtdGtfZHNpX3Bvd2Vyb24oKSwK
PiBpbiBvcmRlciB0byBtYWtlIG10a19kc2lfc3RhcnQoKSBhbmQgbXRrX2RzaV9zdG9wKCkgc3lt
bWV0cmljLCB3aWxsIHJlc3VsdHMgaW4KPiBubyBpcnEgZm9yIHBhbmVsIHdpdGggYnJpZGdlLiBT
byB3ZSBrZWVwIG10a19kc2lfc3RhcnQoKSBpbiBvcmlnaW5hbCBwbGFjZS4KCkkgdGhpbmsgd2Un
dmUgYWxyZWFkeSBkaXNjdXNzZWQgaW4gWzFdLiBJIG5lZWQgYSByZWFzb24gdG8gdW5kZXJzdGFu
ZAp0aGlzIGlzIGhhcmR3YXJlIGJlaGF2aW9yIG9yIHNvZnR3YXJlIGJ1Zy4gSWYgdGhpcyBpcyBh
IHNvZnR3YXJlIGJ1Zywgd2UKbmVlZCB0byBmaXggdGhlIGJ1ZyBhbmQgY29kZSBjb3VsZCBiZSBz
eW1tZXRyaWMuCgpbMV0KaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4
LW1lZGlhdGVrLzIwMTktTWFyY2gvMDE4NDIzLmh0bWwKClJlZ2FyZHMsCkNLCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwo+IGluZGV4IGIwMGViMmQyZTA4Ni4uYjdmODI5ZWNkM2FkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTYzMCw2ICs2MzAsOCBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHNpX3Bvd2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIAlpZiAoLS1kc2ktPnJl
ZmNvdW50ICE9IDApCj4gIAkJcmV0dXJuOwo+ICAKPiArCW10a19kc2lfc3RvcChkc2kpOwo+ICsK
PiAgCWlmICghbXRrX2RzaV9zd2l0Y2hfdG9fY21kX21vZGUoZHNpLCBWTV9ET05FX0lOVF9GTEFH
LCA1MDApKSB7Cj4gIAkJaWYgKGRzaS0+cGFuZWwpIHsKPiAgCQkJaWYgKGRybV9wYW5lbF91bnBy
ZXBhcmUoZHNpLT5wYW5lbCkpIHsKPiBAQCAtNjk2LDcgKzY5OCw2IEBAIHN0YXRpYyB2b2lkIG10
a19vdXRwdXRfZHNpX2Rpc2FibGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiAgCQl9Cj4gIAl9Cj4g
IAo+IC0JbXRrX2RzaV9zdG9wKGRzaSk7Cj4gIAltdGtfZHNpX3Bvd2Vyb2ZmKGRzaSk7Cj4gIAo+
ICAJZHNpLT5lbmFibGVkID0gZmFsc2U7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
