Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39547477D5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 04:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323EC89166;
	Mon, 17 Jun 2019 02:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 312A489166
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 02:01:47 +0000 (UTC)
X-UUID: 4de6393a8e0f4e1e8ad7e81b66a42026-20190617
X-UUID: 4de6393a8e0f4e1e8ad7e81b66a42026-20190617
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1834233125; Mon, 17 Jun 2019 10:01:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Jun 2019 10:01:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Jun 2019 10:01:29 +0800
Message-ID: <1560736889.25168.0.camel@mtksdaap41>
Subject: Re: [PATCH v3, 19/27] drm/mediatek: add function to background
 color input select for ovl/ovl_2l direct link
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Mon, 17 Jun 2019 10:01:29 +0800
In-Reply-To: <1559734986-7379-20-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-20-git-send-email-yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFdlZCwgMjAxOS0wNi0wNSBhdCAxOTo0MiArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgZnVuY3Rpb24gdG8gYmFj
a2dyb3VuZCBjb2xvciBpbnB1dCBzZWxlY3QgZm9yIG92bC9vdmxfMmwgZGlyZWN0IGxpbmsKPiBm
b3Igb3ZsL292bF8ybCBkaXJlY3QgbGluayB1c2VjYXNlLCB3ZSBuZWVkIHNldCBiYWNrZ3JvdW5k
IGNvbG9yCj4gaW5wdXQgc2VsZWN0IGZvciB0aGVzZSBoYXJkd2FyZS4KPiB0aGlzIGlzIHByZXBh
cmF0aW9uIHBhdGNoIGZvciBvdmwvb3ZsXzJsIHVzZWNhc2UKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDE2ICsrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiBpbmRleCAxNThjMWU1Li5hYTFlMTgz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4g
QEAgLTkyLDYgKzkyLDkgQEAgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyB7Cj4gIAkJCSAgICAg
c3RydWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUpOwo+ICAJdm9pZCAoKmdhbW1hX3NldCkoc3Ry
dWN0IG10a19kZHBfY29tcCAqY29tcCwKPiAgCQkJICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0
YXRlKTsKPiArCXZvaWQgKCpiZ2Nscl9pbl9vbikoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwK
PiArCQkJICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIHByZXYpOwoKcHJldiBpcyB1c2VsZXNzLCBz
byByZW1vdmUgaXQuCgpSZWdhcmRzLApDSwoKPiArCXZvaWQgKCpiZ2Nscl9pbl9vZmYpKHN0cnVj
dCBtdGtfZGRwX2NvbXAgKmNvbXApOwo+ICB9Owo+ICAKPiAgc3RydWN0IG10a19kZHBfY29tcCB7
Cj4gQEAgLTE3Myw2ICsxNzYsMTkgQEAgc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfZ2FtbWFf
c2V0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsCj4gIAkJY29tcC0+ZnVuY3MtPmdhbW1hX3Nl
dChjb21wLCBzdGF0ZSk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtdGtfZGRwX2Nv
bXBfYmdjbHJfaW5fb24oc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwKPiArCQkJCQkgICAgZW51
bSBtdGtfZGRwX2NvbXBfaWQgcHJldikKPiArewo+ICsJaWYgKGNvbXAtPmZ1bmNzICYmIGNvbXAt
PmZ1bmNzLT5iZ2Nscl9pbl9vbikKPiArCQljb21wLT5mdW5jcy0+YmdjbHJfaW5fb24oY29tcCwg
cHJldik7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtdGtfZGRwX2NvbXBfYmdjbHJf
aW5fb2ZmKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gK3sKPiArCWlmIChjb21wLT5mdW5j
cyAmJiBjb21wLT5mdW5jcy0+YmdjbHJfaW5fb2ZmKQo+ICsJCWNvbXAtPmZ1bmNzLT5iZ2Nscl9p
bl9vZmYoY29tcCk7Cj4gK30KPiArCj4gIGludCBtdGtfZGRwX2NvbXBfZ2V0X2lkKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSwKPiAgCQkJZW51bSBtdGtfZGRwX2NvbXBfdHlwZSBjb21wX3R5cGUp
Owo+ICBpbnQgbXRrX2RkcF9jb21wX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2
aWNlX25vZGUgKmNvbXBfbm9kZSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
