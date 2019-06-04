Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734E33CFB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 04:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4B689175;
	Tue,  4 Jun 2019 02:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF1289175
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 02:05:52 +0000 (UTC)
X-UUID: 5629ac9e18844ae7ac5ca849e7c642eb-20190604
X-UUID: 5629ac9e18844ae7ac5ca849e7c642eb-20190604
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2031812081; Tue, 04 Jun 2019 10:05:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 10:05:41 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 4 Jun 2019 10:05:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Jun 2019 10:05:40 +0800
Message-ID: <1559613940.9975.0.camel@mtksdaap41>
Subject: Re: [PATCH v4] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 4 Jun 2019 10:05:40 +0800
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
ZCBpbiBtdGtfZHNpX3Bvd2Vyb2ZmKCkgd2hlbiByZWZjb3VudCBpcyAwLgoKQXBwbGllZCB0byBt
ZWRpYXRlay1kcm0tZml4ZXMtNS4yIFsxXSwgdGhhbmtzLgoKWzFdCmh0dHBzOi8vZ2l0aHViLmNv
bS9ja2h1LW1lZGlhdGVrL2xpbnV4LmdpdC10YWdzL2NvbW1pdHMvbWVkaWF0ZWstZHJtLWZpeGVz
LTUuMgoKUmVnYXJkcywKQ0sKCj4gCj4gRml4ZXM6IDA3MDc2MzJiNWJhYyAoImRybS9tZWRpYXRl
azogdXBkYXRlIERTSSBzdWIgZHJpdmVyIGZsb3cgZm9yIHNlbmRpbmcgY29tbWFuZHMgdG8gcGFu
ZWwiKQo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4K
PiAtLS0KPiBjaGFuZ2UgbG9nIHYzLT52NDoKPiAqIGFkZCBjb21tZW50IGluIGNvZGUuCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMCArKysrKysrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCBiMDBlYjJkMmUwODYuLjczMDU5NGE5MTQ0
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC02MzAsNiArNjMwLDE1
IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfcG93ZXJvZmYoc3RydWN0IG10a19kc2kgKmRzaSkKPiAg
CWlmICgtLWRzaS0+cmVmY291bnQgIT0gMCkKPiAgCQlyZXR1cm47Cj4gIAo+ICsJLyogCj4gKwkg
KiBtdGtfZHNpX3N0b3AoKSBhbmQgbXRrX2RzaV9zdGFydCgpIGlzIGFzeW1tZXRyaWMsIHNpbmNl
Cj4gKwkgKiBtdGtfZHNpX3N0b3AoKSBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIG10a19kcm1fY3J0
Y19hdG9taWNfZGlzYWJsZSgpLAo+ICsJICogd2hpY2ggbmVlZHMgaXJxIGZvciB2YmxhbmssIGFu
ZCBtdGtfZHNpX3N0b3AoKSB3aWxsIGRpc2FibGUgaXJxLgo+ICsJICogbXRrX2RzaV9zdGFydCgp
IG5lZWRzIHRvIGJlIGNhbGxlZCBpbiBtdGtfb3V0cHV0X2RzaV9lbmFibGUoKSwKPiArCSAqIGFm
dGVyIGRzaSBpcyBmdWxseSBzZXQuCj4gKwkgKi8KPiArCW10a19kc2lfc3RvcChkc2kpOwo+ICsK
PiAgCWlmICghbXRrX2RzaV9zd2l0Y2hfdG9fY21kX21vZGUoZHNpLCBWTV9ET05FX0lOVF9GTEFH
LCA1MDApKSB7Cj4gIAkJaWYgKGRzaS0+cGFuZWwpIHsKPiAgCQkJaWYgKGRybV9wYW5lbF91bnBy
ZXBhcmUoZHNpLT5wYW5lbCkpIHsKPiBAQCAtNjk2LDcgKzcwNSw2IEBAIHN0YXRpYyB2b2lkIG10
a19vdXRwdXRfZHNpX2Rpc2FibGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiAgCQl9Cj4gIAl9Cj4g
IAo+IC0JbXRrX2RzaV9zdG9wKGRzaSk7Cj4gIAltdGtfZHNpX3Bvd2Vyb2ZmKGRzaSk7Cj4gIAo+
ICAJZHNpLT5lbmFibGVkID0gZmFsc2U7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
