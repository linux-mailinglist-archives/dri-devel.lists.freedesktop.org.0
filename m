Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE82BEA2
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 07:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516148925A;
	Tue, 28 May 2019 05:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFA28925A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 05:35:34 +0000 (UTC)
X-UUID: be5130a6a2bb477e8ab994be11f10e88-20190528
X-UUID: be5130a6a2bb477e8ab994be11f10e88-20190528
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 649026001; Tue, 28 May 2019 13:35:30 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 28 May 2019 13:35:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 28 May 2019 13:35:29 +0800
Message-ID: <1559021729.15879.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 22/25] drm/mediatek: adjust ddp clock control flow
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Tue, 28 May 2019 13:35:29 +0800
In-Reply-To: <1555403090.11519.7.camel@mtksdaap41>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
 <1553667561-25447-23-git-send-email-yongqiang.niu@mediatek.com>
 <1555403090.11519.7.camel@mtksdaap41>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNC0xNiBhdCAxNjoyNCArMDgwMCwgQ0sgSHUg
d3JvdGU6Cj4gSGksIFlvbmdxaWFuZzoKPiAKPiBPbiBXZWQsIDIwMTktMDMtMjcgYXQgMTQ6MTkg
KzA4MDAsIHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tIHdyb3RlOgo+ID4gRnJvbTogWW9uZ3Fp
YW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiAKPiA+IGRpc3BsYXkgaGFy
ZHdhcmUgY2xvY2sgd2lsbCBub3QgdW5wcmVwYXJlIHdoZW4KPiA+IGNydGMgaXMgZGlzYWJsZSwg
dW50aWwgY3J0YyBpcyBkZXN0cm95ZWQuCj4gPiB3aXRoIHRoaXMgcGF0Y2gsIGhhcmQgY2xvY2sg
d2lsbCBkaXNhYmxlIGFuZCB1bnByZXBhcmUKPiA+IGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gUmV2
aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+CgpUaGlzIHBhdGNoIGxvb2tzIGlu
ZGVwZW5kZW50LCBzbyBJJ3ZlIGFwcGxpZWQgaXQgdG8KbWVkaWF0ZWstZHJtLWZpeGVzLTUuMiBb
MV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5n
aXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRybS1maXhlcy01LjIKClJlZ2FyZHMsCkNLCj4gCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jIHwgMjYgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ID4gaW5kZXggMGY5N2VlMy4uNjA2YzZlMiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gPiBAQCAtMTk1LDcg
KzE5NSw3IEBAIHN0YXRpYyBpbnQgbXRrX2NydGNfZGRwX2Nsa19lbmFibGUoc3RydWN0IG10a19k
cm1fY3J0YyAqbXRrX2NydGMpCj4gPiAgCj4gPiAgCURSTV9ERUJVR19EUklWRVIoIiVzXG4iLCBf
X2Z1bmNfXyk7Cj4gPiAgCWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnI7IGkr
Kykgewo+ID4gLQkJcmV0ID0gY2xrX2VuYWJsZShtdGtfY3J0Yy0+ZGRwX2NvbXBbaV0tPmNsayk7
Cj4gPiArCQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUobXRrX2NydGMtPmRkcF9jb21wW2ldLT5j
bGspOwo+ID4gIAkJaWYgKHJldCkgewo+ID4gIAkJCURSTV9FUlJPUigiRmFpbGVkIHRvIGVuYWJs
ZSBjbG9jayAlZDogJWRcbiIsIGksIHJldCk7Cj4gPiAgCQkJZ290byBlcnI7Cj4gPiBAQCAtMjA1
LDcgKzIwNSw3IEBAIHN0YXRpYyBpbnQgbXRrX2NydGNfZGRwX2Nsa19lbmFibGUoc3RydWN0IG10
a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gPiAgCXJldHVybiAwOwo+ID4gIGVycjoKPiA+ICAJd2hp
bGUgKC0taSA+PSAwKQo+ID4gLQkJY2xrX2Rpc2FibGUobXRrX2NydGMtPmRkcF9jb21wW2ldLT5j
bGspOwo+ID4gKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG10a19jcnRjLT5kZHBfY29tcFtpXS0+
Y2xrKTsKPiA+ICAJcmV0dXJuIHJldDsKPiA+ICB9Cj4gPiAgCj4gPiBAQCAtMjE1LDcgKzIxNSw3
IEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9jbGtfZGlzYWJsZShzdHJ1Y3QgbXRrX2RybV9j
cnRjICptdGtfY3J0YykKPiA+ICAKPiA+ICAJRFJNX0RFQlVHX0RSSVZFUigiJXNcbiIsIF9fZnVu
Y19fKTsKPiA+ICAJZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9ucjsgaSsrKQo+
ID4gLQkJY2xrX2Rpc2FibGUobXRrX2NydGMtPmRkcF9jb21wW2ldLT5jbGspOwo+ID4gKwkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKG10a19jcnRjLT5kZHBfY29tcFtpXS0+Y2xrKTsKPiA+ICB9Cj4g
PiAgCj4gPiAgc3RhdGljIGludCBtdGtfY3J0Y19kZHBfaHdfaW5pdChzdHJ1Y3QgbXRrX2RybV9j
cnRjICptdGtfY3J0YykKPiA+IEBAIC02MTUsMTUgKzYxNSw3IEBAIGludCBtdGtfZHJtX2NydGNf
Y3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2LAo+ID4gIAkJaWYgKCFjb21wKSB7Cj4g
PiAgCQkJZGV2X2VycihkZXYsICJDb21wb25lbnQgJXBPRiBub3QgaW5pdGlhbGl6ZWRcbiIsIG5v
ZGUpOwo+ID4gIAkJCXJldCA9IC1FTk9ERVY7Cj4gPiAtCQkJZ290byB1bnByZXBhcmU7Cj4gPiAt
CQl9Cj4gPiAtCj4gPiAtCQlyZXQgPSBjbGtfcHJlcGFyZShjb21wLT5jbGspOwo+ID4gLQkJaWYg
KHJldCkgewo+ID4gLQkJCWRldl9lcnIoZGV2LAo+ID4gLQkJCQkiRmFpbGVkIHRvIHByZXBhcmUg
Y2xvY2sgZm9yIGNvbXBvbmVudCAlcE9GOiAlZFxuIiwKPiA+IC0JCQkJbm9kZSwgcmV0KTsKPiA+
IC0JCQlnb3RvIHVucHJlcGFyZTsKPiA+ICsJCQlyZXR1cm4gcmV0Owo+ID4gIAkJfQo+ID4gIAo+
ID4gIAkJbXRrX2NydGMtPmRkcF9jb21wW2ldID0gY29tcDsKPiA+IEBAIC02NDksMjMgKzY0MSwx
NyBAQCBpbnQgbXRrX2RybV9jcnRjX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiwK
PiA+ICAJCXJldCA9IG10a19wbGFuZV9pbml0KGRybV9kZXYsICZtdGtfY3J0Yy0+cGxhbmVzW3pw
b3NdLAo+ID4gIAkJCQkgICAgIEJJVChwaXBlKSwgdHlwZSk7Cj4gPiAgCQlpZiAocmV0KQo+ID4g
LQkJCWdvdG8gdW5wcmVwYXJlOwo+ID4gKwkJCXJldHVybiByZXQ7Cj4gPiAgCX0KPiA+ICAKPiA+
ICAJcmV0ID0gbXRrX2RybV9jcnRjX2luaXQoZHJtX2RldiwgbXRrX2NydGMsICZtdGtfY3J0Yy0+
cGxhbmVzWzBdLAo+ID4gIAkJCQltdGtfY3J0Yy0+bGF5ZXJfbnIgPiAxID8gJm10a19jcnRjLT5w
bGFuZXNbMV0gOgo+ID4gIAkJCQlOVUxMLCBwaXBlKTsKPiA+ICAJaWYgKHJldCA8IDApCj4gPiAt
CQlnb3RvIHVucHJlcGFyZTsKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiAgCWRybV9tb2RlX2NydGNf
c2V0X2dhbW1hX3NpemUoJm10a19jcnRjLT5iYXNlLCBNVEtfTFVUX1NJWkUpOwo+ID4gIAlkcm1f
Y3J0Y19lbmFibGVfY29sb3JfbWdtdCgmbXRrX2NydGMtPmJhc2UsIDAsIGZhbHNlLCBNVEtfTFVU
X1NJWkUpOwo+ID4gIAlwcml2LT5udW1fcGlwZXMrKzsKPiA+ICAKPiA+ICAJcmV0dXJuIDA7Cj4g
PiAtCj4gPiAtdW5wcmVwYXJlOgo+ID4gLQl3aGlsZSAoLS1pID49IDApCj4gPiAtCQljbGtfdW5w
cmVwYXJlKG10a19jcnRjLT5kZHBfY29tcFtpXS0+Y2xrKTsKPiA+IC0KPiA+IC0JcmV0dXJuIHJl
dDsKPiA+ICB9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
