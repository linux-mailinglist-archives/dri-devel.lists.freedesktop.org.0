Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FC2D95F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4CA6E0A8;
	Wed, 29 May 2019 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA876E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:47:13 +0000 (UTC)
X-UUID: f85fc8ea1b0f475caaf9a63d093aef2e-20190529
X-UUID: f85fc8ea1b0f475caaf9a63d093aef2e-20190529
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 561493275; Wed, 29 May 2019 17:47:04 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 May 2019 17:47:02 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 May 2019 17:47:02 +0800
Message-ID: <1559123222.6582.2.camel@mtksdaap41>
Subject: Re: [PATCH 3/3] drm: mediatek: unbind components in mtk_drm_unbind()
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 17:47:02 +0800
In-Reply-To: <20190527045054.113259-4-hsinyi@chromium.org>
References: <20190527045054.113259-1-hsinyi@chromium.org>
 <20190527045054.113259-4-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D67655A3172A9E677B28064701E21555F16641623DFE39541481F10AB8379D22000:8
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

SGksIEhzaW4tWWk6CgpPbiBNb24sIDIwMTktMDUtMjcgYXQgMTI6NTAgKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBVbmJpbmRpbmcgY29tcG9uZW50cyAoaS5lLiBtdGtfZHNpIGFuZCBtdGtf
ZGlzcF9vdmwvcmRtYS9jb2xvcikgd2lsbAo+IHRyaWdnZXIgbWFzdGVyKG10a19kcm0pJ3MgLnVu
YmluZCgpLCBhbmQgY3VycmVudGx5IG10a19kcm0ncyB1bmJpbmQKPiB3b24ndCBhY3R1YWxseSB1
bmJpbmQgY29tcG9uZW50cy4gRHVyaW5nIHRoZSBuZXh0IGJpbmQsCj4gbXRrX2RybV9rbXNfaW5p
dCgpIGlzIGNhbGxlZCwgYW5kIHRoZSBjb21wb25lbnRzIGFyZSBhZGRlZCBiYWNrLgo+IAo+IC51
bmJpbmQoKSBzaG91bGQgY2FsbCBtdGtfZHJtX2ttc19kZWluaXQoKSB0byB1bmJpbmQgY29tcG9u
ZW50cy4KPiAKPiBBbmQgc2luY2UgY29tcG9uZW50X21hc3Rlcl9kZWwoKSBpbiAucmVtb3ZlKCkg
d2lsbCB0cmlnZ2VyIC51bmJpbmQoKSwKPiB3aGljaCB3aWxsIGFsc28gdW5yZWdpc3RlciBkZXZp
Y2UsIGl0J3MgZmluZSB0byByZW1vdmUgb3JpZ2luYWwgZnVuY3Rpb25zCj4gY2FsbGVkIGhlcmUu
Cj4gCj4gRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIg
Zm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMuIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcg
PGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jCj4gaW5kZXggNTdjZTQ3MDhlZjFiLi5iYmZlM2E0NjRhZWEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC0zMTEsNiArMzExLDcgQEAgc3RhdGljIGlu
dCBtdGtfZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCj4gIHN0YXRpYyB2b2lk
IG10a19kcm1fa21zX2RlaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQo+ICB7Cj4gIAlkcm1f
a21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKPiArCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3du
KGRybSk7CgpUaGlzIGxvb2tzIG5vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2guIFRoaXMgcGF0Y2gg
aXMgcmVsYXRlZCB0byB0aGUKdW5iaW5kIHRpbWluZy4gWW91IGNvdWxkIHNlcGFyYXRlIHRoaXMg
dG8gYW4gaW5kZXBlbmRlbnQgcGF0Y2guCgo+ICAKPiAgCWNvbXBvbmVudF91bmJpbmRfYWxsKGRy
bS0+ZGV2LCBkcm0pOwo+ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKPiBAQCAtMzk3
LDcgKzM5OCw5IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiAgCXN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXZhdGUgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsKPiAgCj4gIAlkcm1fZGV2X3VucmVnaXN0ZXIocHJpdmF0ZS0+ZHJtKTsKPiArCW10a19k
cm1fa21zX2RlaW5pdChwcml2YXRlLT5kcm0pOwo+ICAJZHJtX2Rldl9wdXQocHJpdmF0ZS0+ZHJt
KTsKPiArCXByaXZhdGUtPm51bV9waXBlcyA9IDA7CgpUaGlzIGxvb2tzIG5vdCByZWxhdGVkIHRv
IHRoaXMgcGF0Y2guIFRoaXMgcGF0Y2ggaXMgcmVsYXRlZCB0byB0aGUKdW5iaW5kIHRpbWluZy4g
WW91IGNvdWxkIHNlcGFyYXRlIHRoaXMgdG8gYW4gaW5kZXBlbmRlbnQgcGF0Y2guCgpSZWdhcmRz
LApDSwoKPiAgCXByaXZhdGUtPmRybSA9IE5VTEw7Cj4gIH0KPiAgCj4gQEAgLTU2OCwxMyArNTcx
LDggQEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gIHN0YXRpYyBpbnQgbXRrX2RybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgewo+ICAJc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOwo+IC0Jc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IHByaXZhdGUt
PmRybTsKPiAgCWludCBpOwo+ICAKPiAtCWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOwo+IC0JbXRr
X2RybV9rbXNfZGVpbml0KGRybSk7Cj4gLQlkcm1fZGV2X3B1dChkcm0pOwo+IC0KPiAgCWNvbXBv
bmVudF9tYXN0ZXJfZGVsKCZwZGV2LT5kZXYsICZtdGtfZHJtX29wcyk7Cj4gIAlwbV9ydW50aW1l
X2Rpc2FibGUoJnBkZXYtPmRldik7Cj4gIAlvZl9ub2RlX3B1dChwcml2YXRlLT5tdXRleF9ub2Rl
KTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
