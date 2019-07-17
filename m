Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DEB6B61D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 07:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B35C6E22D;
	Wed, 17 Jul 2019 05:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C86E96E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 05:53:53 +0000 (UTC)
X-UUID: 6abfcd68318c4ea9953d429e360fc308-20190717
X-UUID: 6abfcd68318c4ea9953d429e360fc308-20190717
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2052319071; Wed, 17 Jul 2019 13:53:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 13:53:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 13:53:48 +0800
Message-ID: <1563342828.29169.18.camel@mtksdaap41>
Subject: Re: [PATCH v4, 21/33] drm/mediatek: add function to background
 color input select for ovl/ovl_2l direct link
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 13:53:48 +0800
In-Reply-To: <1562625253-29254-22-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-22-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C256F03D4194D5B33990FFB01DF1B7245E0181B5106E7E4F3FA6FAEC21AA3B8C2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozNCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgZnVuY3Rpb24gdG8gYmFj
a2dyb3VuZCBjb2xvciBpbnB1dCBzZWxlY3QgZm9yIG92bC9vdmxfMmwgZGlyZWN0IGxpbmsKPiBm
b3Igb3ZsL292bF8ybCBkaXJlY3QgbGluayB1c2VjYXNlLCB3ZSBuZWVkIHNldCBiYWNrZ3JvdW5k
IGNvbG9yCj4gaW5wdXQgc2VsZWN0IGZvciB0aGVzZSBoYXJkd2FyZS4KPiB0aGlzIGlzIHByZXBh
cmF0aW9uIHBhdGNoIGZvciBvdmwvb3ZsXzJsIHVzZWNhc2UKPiAKClJldmlld2VkLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5
b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDE0ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oCj4gaW5kZXggYTBlYThjOS4uZWM2ZjMyOWEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiBAQCAtOTIsNiArOTIsOCBA
QCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIHsKPiAgCQkJICAgICBzdHJ1Y3QgbXRrX3BsYW5l
X3N0YXRlICpzdGF0ZSk7Cj4gIAl2b2lkICgqZ2FtbWFfc2V0KShzdHJ1Y3QgbXRrX2RkcF9jb21w
ICpjb21wLAo+ICAJCQkgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUpOwo+ICsJdm9pZCAo
KmJnY2xyX2luX29uKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsKPiArCXZvaWQgKCpiZ2Ns
cl9pbl9vZmYpKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApOwo+ICB9Owo+ICAKPiAgc3RydWN0
IG10a19kZHBfY29tcCB7Cj4gQEAgLTE3Miw2ICsxNzQsMTggQEAgc3RhdGljIGlubGluZSB2b2lk
IG10a19kZHBfZ2FtbWFfc2V0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsCj4gIAkJY29tcC0+
ZnVuY3MtPmdhbW1hX3NldChjb21wLCBzdGF0ZSk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBtdGtfZGRwX2NvbXBfYmdjbHJfaW5fb24oc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkK
PiArewo+ICsJaWYgKGNvbXAtPmZ1bmNzICYmIGNvbXAtPmZ1bmNzLT5iZ2Nscl9pbl9vbikKPiAr
CQljb21wLT5mdW5jcy0+YmdjbHJfaW5fb24oY29tcCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBtdGtfZGRwX2NvbXBfYmdjbHJfaW5fb2ZmKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNv
bXApCj4gK3sKPiArCWlmIChjb21wLT5mdW5jcyAmJiBjb21wLT5mdW5jcy0+YmdjbHJfaW5fb2Zm
KQo+ICsJCWNvbXAtPmZ1bmNzLT5iZ2Nscl9pbl9vZmYoY29tcCk7Cj4gK30KPiArCj4gIGludCBt
dGtfZGRwX2NvbXBfZ2V0X2lkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgCQkJZW51bSBt
dGtfZGRwX2NvbXBfdHlwZSBjb21wX3R5cGUpOwo+ICBpbnQgbXRrX2RkcF9jb21wX2luaXQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNvbXBfbm9kZSwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
