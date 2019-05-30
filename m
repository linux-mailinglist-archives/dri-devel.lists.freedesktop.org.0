Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6512EAAF
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 04:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815C6E29F;
	Thu, 30 May 2019 02:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A716E29F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 02:28:58 +0000 (UTC)
X-UUID: b975914154764829a05b0c1d75133086-20190530
X-UUID: b975914154764829a05b0c1d75133086-20190530
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1905035381; Thu, 30 May 2019 10:28:56 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 May 2019 10:28:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 10:28:54 +0800
Message-ID: <1559183334.6868.3.camel@mtksdaap41>
Subject: Re: [PATCH v2 4/4] drm: mediatek: clear num_pipes when unbind driver
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 May 2019 10:28:54 +0800
In-Reply-To: <20190529102555.251579-5-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
 <20190529102555.251579-5-hsinyi@chromium.org>
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

SGksIEhzaW4tWWk6CgpPbiBXZWQsIDIwMTktMDUtMjkgYXQgMTg6MjUgKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBudW1fcGlwZXMgaXMgdXNlZCBmb3IgbXV0ZXggY3JlYXRlZCBpbiBtdGtf
ZHJtX2NydGNfY3JlYXRlKCkuIElmIHdlCj4gZG9uJ3QgY2xlYXIgbnVtX3BpcGVzIGNvdW50LCB3
aGVuIHJlYmluZGluZyBkcml2ZXIsIHRoZSBjb3VudCB3aWxsCj4gYmUgYWNjdW11bGF0ZWQuIEZy
b20gbXRrX2Rpc3BfbXV0ZXhfZ2V0KCksIHRoZXJlIGNhbiBvbmx5IGJlIGF0IG1vc3QKPiAxMCBt
dXRleCBpZC4gQ2xlYXIgdGhpcyBudW1iZXIgc28gaXQgc3RhcnRzIGZyb20gMCBpbiBldmVyeSBy
ZWJpbmQuCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KCj4gCj4gRml4
ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlh
dGVrIFNvQyBNVDgxNzMuIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBj
aHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggODcxOGQxMjNjY2FhLi5iYmZlM2E0
NjRhZWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC00
MDAsNiArNDAwLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RybV91bmJpbmQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICAJZHJtX2Rldl91bnJlZ2lzdGVyKHByaXZhdGUtPmRybSk7Cj4gIAltdGtfZHJtX2tt
c19kZWluaXQocHJpdmF0ZS0+ZHJtKTsKPiAgCWRybV9kZXZfcHV0KHByaXZhdGUtPmRybSk7Cj4g
Kwlwcml2YXRlLT5udW1fcGlwZXMgPSAwOwo+ICAJcHJpdmF0ZS0+ZHJtID0gTlVMTDsKPiAgfQo+
ICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
