Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677E2BEA9
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 07:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB03089B3B;
	Tue, 28 May 2019 05:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A1B89B3B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 05:36:12 +0000 (UTC)
X-UUID: 431b29fe870c431c9b09dc0979a77c29-20190528
X-UUID: 431b29fe870c431c9b09dc0979a77c29-20190528
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1074673266; Tue, 28 May 2019 13:36:00 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 28 May 2019 13:35:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 28 May 2019 13:35:59 +0800
Message-ID: <1559021759.15879.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 24/25] drm/mediatek: respect page offset for PRIME
 mmap calls
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Tue, 28 May 2019 13:35:59 +0800
In-Reply-To: <1555403634.11519.11.camel@mtksdaap41>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
 <1553667561-25447-25-git-send-email-yongqiang.niu@mediatek.com>
 <1555403634.11519.11.camel@mtksdaap41>
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

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNC0xNiBhdCAxNjozMyArMDgwMCwgQ0sgSHUg
d3JvdGU6Cj4gSGksIFlvbmdxaWFuZzoKPiAKPiBPbiBXZWQsIDIwMTktMDMtMjcgYXQgMTQ6MTkg
KzA4MDAsIHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tIHdyb3RlOgo+ID4gRnJvbTogWW9uZ3Fp
YW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiAKPiA+IFJlc3BlY3QgcGFn
ZSBvZmZzZXQgZm9yIFBSSU1FIG1tYXAgY2FsbHMKPiAKPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNr
Lmh1QG1lZGlhdGVrLmNvbT4KCgpUaGlzIHBhdGNoIGxvb2tzIGluZGVwZW5kZW50LCBzbyBJJ3Zl
IGFwcGxpZWQgaXQgdG8KbWVkaWF0ZWstZHJtLWZpeGVzLTUuMiBbMV0sIHRoYW5rcy4KClsxXQpo
dHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy9jb21taXRzL21l
ZGlhdGVrLWRybS1maXhlcy01LjIKClJlZ2FyZHMsCkNLCgo+IAo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIHwgNyArKysrKystCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gaW5kZXggYzIzMDIzNy4u
NTI0ZTQ5NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2dlbS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+
ID4gQEAgLTE0NCw3ICsxNDQsNiBAQCBzdGF0aWMgaW50IG10a19kcm1fZ2VtX29iamVjdF9tbWFw
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+ID4gIAkgKiBWTV9QRk5NQVAgZmxhZyB0aGF0
IHdhcyBzZXQgYnkgZHJtX2dlbV9tbWFwX29iaigpL2RybV9nZW1fbW1hcCgpLgo+ID4gIAkgKi8K
PiA+ICAJdm1hLT52bV9mbGFncyAmPSB+Vk1fUEZOTUFQOwo+ID4gLQl2bWEtPnZtX3Bnb2ZmID0g
MDsKPiA+ICAKPiA+ICAJcmV0ID0gZG1hX21tYXBfYXR0cnMocHJpdi0+ZG1hX2Rldiwgdm1hLCBt
dGtfZ2VtLT5jb29raWUsCj4gPiAgCQkJICAgICBtdGtfZ2VtLT5kbWFfYWRkciwgb2JqLT5zaXpl
LCBtdGtfZ2VtLT5kbWFfYXR0cnMpOwo+ID4gQEAgLTE4Myw2ICsxODIsMTIgQEAgaW50IG10a19k
cm1fZ2VtX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ID4gIAo+ID4gIAlvYmogPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPiA+ICAKPiA+ICsJLyoK
PiA+ICsJICogU2V0IHZtX3Bnb2ZmICh1c2VkIGFzIGEgZmFrZSBidWZmZXIgb2Zmc2V0IGJ5IERS
TSkgdG8gMCBhbmQgbWFwIHRoZQo+ID4gKwkgKiB3aG9sZSBidWZmZXIgZnJvbSB0aGUgc3RhcnQu
Cj4gPiArCSAqLwo+ID4gKwl2bWEtPnZtX3Bnb2ZmID0gMDsKPiA+ICsKPiA+ICAJcmV0dXJuIG10
a19kcm1fZ2VtX29iamVjdF9tbWFwKG9iaiwgdm1hKTsKPiA+ICB9Cj4gPiAgCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
