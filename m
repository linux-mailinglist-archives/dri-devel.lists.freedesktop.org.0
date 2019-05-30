Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00A2EA96
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 04:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6986E222;
	Thu, 30 May 2019 02:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBEF6E222
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 02:18:16 +0000 (UTC)
X-UUID: a31b93e34ffa48d98dd6601f83dabafe-20190530
X-UUID: a31b93e34ffa48d98dd6601f83dabafe-20190530
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 108718663; Thu, 30 May 2019 10:17:59 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 May 2019 10:17:58 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 10:17:58 +0800
Message-ID: <1559182678.6868.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/4] drm: mediatek: unbind components in
 mtk_drm_unbind()
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 May 2019 10:17:58 +0800
In-Reply-To: <20190529102555.251579-3-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
 <20190529102555.251579-3-hsinyi@chromium.org>
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
V2FuZyB3cm90ZToKPiBVbmJpbmRpbmcgY29tcG9uZW50cyAoaS5lLiBtdGtfZHNpIGFuZCBtdGtf
ZGlzcF9vdmwvcmRtYS9jb2xvcikgd2lsbAo+IHRyaWdnZXIgbWFzdGVyKG10a19kcm0pJ3MgLnVu
YmluZCgpLCBhbmQgY3VycmVudGx5IG10a19kcm0ncyB1bmJpbmQKPiB3b24ndCBhY3R1YWxseSB1
bmJpbmQgY29tcG9uZW50cy4gRHVyaW5nIHRoZSBuZXh0IGJpbmQsCj4gbXRrX2RybV9rbXNfaW5p
dCgpIGlzIGNhbGxlZCwgYW5kIHRoZSBjb21wb25lbnRzIGFyZSBhZGRlZCBiYWNrLgo+IAo+IC51
bmJpbmQoKSBzaG91bGQgY2FsbCBtdGtfZHJtX2ttc19kZWluaXQoKSB0byB1bmJpbmQgY29tcG9u
ZW50cy4KPiAKPiBBbmQgc2luY2UgY29tcG9uZW50X21hc3Rlcl9kZWwoKSBpbiAucmVtb3ZlKCkg
d2lsbCB0cmlnZ2VyIC51bmJpbmQoKSwKPiB3aGljaCB3aWxsIGFsc28gdW5yZWdpc3RlciBkZXZp
Y2UsIGl0J3MgZmluZSB0byByZW1vdmUgb3JpZ2luYWwgZnVuY3Rpb25zCj4gY2FsbGVkIGhlcmUu
CgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KCj4gCj4gRml4ZXM6IDEx
OWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNv
QyBNVDgxNzMuIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1
bS5vcmc+Cj4gLS0tCj4gY2hhbmdlIGxvZyB2MS0+djI6Cj4gKiBzZXBhcmF0ZSBhbm90aGVyIDIg
Zml4ZXMgdG8gb3RoZXIgcGF0Y2hlcy4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgfCA2ICstLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMKPiBpbmRleCA1N2NlNDcwOGVmMWIuLmU3MzYyYmRhZmE4MiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTM5Nyw2ICszOTcsNyBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHJtX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlzdHJ1Y3QgbXRrX2RybV9w
cml2YXRlICpwcml2YXRlID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gIAo+ICAJZHJtX2Rldl91
bnJlZ2lzdGVyKHByaXZhdGUtPmRybSk7Cj4gKwltdGtfZHJtX2ttc19kZWluaXQocHJpdmF0ZS0+
ZHJtKTsKPiAgCWRybV9kZXZfcHV0KHByaXZhdGUtPmRybSk7Cj4gIAlwcml2YXRlLT5kcm0gPSBO
VUxMOwo+ICB9Cj4gQEAgLTU2OCwxMyArNTY5LDggQEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHN0YXRpYyBpbnQgbXRrX2RybV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICAJc3RydWN0IG10a19kcm1f
cHJpdmF0ZSAqcHJpdmF0ZSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+IC0Jc3RydWN0
IGRybV9kZXZpY2UgKmRybSA9IHByaXZhdGUtPmRybTsKPiAgCWludCBpOwo+ICAKPiAtCWRybV9k
ZXZfdW5yZWdpc3Rlcihkcm0pOwo+IC0JbXRrX2RybV9rbXNfZGVpbml0KGRybSk7Cj4gLQlkcm1f
ZGV2X3B1dChkcm0pOwo+IC0KPiAgCWNvbXBvbmVudF9tYXN0ZXJfZGVsKCZwZGV2LT5kZXYsICZt
dGtfZHJtX29wcyk7Cj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cj4gIAlvZl9u
b2RlX3B1dChwcml2YXRlLT5tdXRleF9ub2RlKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
