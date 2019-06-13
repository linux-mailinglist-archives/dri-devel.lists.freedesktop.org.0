Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DD433D2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACB789755;
	Thu, 13 Jun 2019 07:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC2C289781
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:45:10 +0000 (UTC)
X-UUID: 24f7185cfd0b495fabdabdc1f2ca9ce8-20190613
X-UUID: 24f7185cfd0b495fabdabdc1f2ca9ce8-20190613
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 666765796; Thu, 13 Jun 2019 15:45:04 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Jun 2019 15:45:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Jun 2019 15:45:03 +0800
Message-ID: <1560411902.27582.0.camel@mtksdaap41>
Subject: Re: [PATCH v3, 09/27] drm/mediatek: add mutex sof register offset
 into ddp private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Thu, 13 Jun 2019 15:45:02 +0800
In-Reply-To: <1559734986-7379-10-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-10-git-send-email-yongqiang.niu@mediatek.com>
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gbXV0ZXggc29mIHJlZ2lzdGVyIG9mZnNldCB3aWxs
IGJlIHByaXZhdGUgZGF0YSBvZiBkZHAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1
IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwLmMgfCAxMyArKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggZTFhNTEwZi4uNzE3NjA5ZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTQyLDEyICs0MiwxMyBAQAo+ICAj
ZGVmaW5lIERJU1BfUkVHX0NPTkZJR19EUElfU0VMCQkJMHgwNjQKPiAgCj4gICNkZWZpbmUgTVQy
NzAxX0RJU1BfTVVURVgwX01PRDAJCQkweDJjCj4gKyNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgw
X1NPRjAJCQkweDJjCgoweDMwPwoKUmVnYXJkcywKQ0sKCj4gIAo+ICAjZGVmaW5lIERJU1BfUkVH
X01VVEVYX0VOKG4pCQkJKDB4MjAgKyAweDIwICogKG4pKQo+ICAjZGVmaW5lIERJU1BfUkVHX01V
VEVYKG4pCQkJKDB4MjQgKyAweDIwICogKG4pKQo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYX1JT
VChuKQkJCSgweDI4ICsgMHgyMCAqIChuKSkKPiAgI2RlZmluZSBESVNQX1JFR19NVVRFWF9NT0Qo
bXV0ZXhfbW9kX3JlZywgbikJKG11dGV4X21vZF9yZWcgKyAweDIwICogKG4pKQo+IC0jZGVmaW5l
IERJU1BfUkVHX01VVEVYX1NPRihuKQkJCSgweDMwICsgMHgyMCAqIChuKSkKPiArI2RlZmluZSBE
SVNQX1JFR19NVVRFWF9TT0YobXV0ZXhfc29mX3JlZywgbikJKG11dGV4X3NvZl9yZWcgKyAweDIw
ICogKG4pKQo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYX01PRDIobikJCQkoMHgzNCArIDB4MjAg
KiAobikpCj4gIAo+ICAjZGVmaW5lIElOVF9NVVRFWAkJCQlCSVQoMSkKPiBAQCAtMTY0LDYgKzE2
NSw3IEBAIHN0cnVjdCBtdGtfZGRwX2RhdGEgewo+ICAJY29uc3QgdW5zaWduZWQgaW50ICptdXRl
eF9tb2Q7Cj4gIAljb25zdCB1bnNpZ25lZCBpbnQgKm11dGV4X3NvZjsKPiAgCWNvbnN0IHVuc2ln
bmVkIGludCBtdXRleF9tb2RfcmVnOwo+ICsJY29uc3QgdW5zaWduZWQgaW50IG11dGV4X3NvZl9y
ZWc7Cj4gIH07Cj4gIAo+ICBzdHJ1Y3QgbXRrX2RkcCB7Cj4gQEAgLTIzNSwxOCArMjM3LDIxIEBA
IHN0cnVjdCBtdGtfZGRwIHsKPiAgCS5tdXRleF9tb2QgPSBtdDI3MDFfbXV0ZXhfbW9kLAo+ICAJ
Lm11dGV4X3NvZiA9IG10MjcxMl9tdXRleF9zb2YsCj4gIAkubXV0ZXhfbW9kX3JlZyA9IE1UMjcw
MV9ESVNQX01VVEVYMF9NT0QwLAo+ICsJLm11dGV4X3NvZl9yZWcgPSBNVDI3MDFfRElTUF9NVVRF
WDBfU09GMCwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10
MjcxMl9kZHBfZHJpdmVyX2RhdGEgPSB7Cj4gIAkubXV0ZXhfbW9kID0gbXQyNzEyX211dGV4X21v
ZCwKPiAgCS5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29mLAo+ICAJLm11dGV4X21vZF9yZWcg
PSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMCwKPiArCS5tdXRleF9zb2ZfcmVnID0gTVQyNzAxX0RJ
U1BfTVVURVgwX1NPRjAsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBf
ZGF0YSBtdDgxNzNfZGRwX2RyaXZlcl9kYXRhID0gewo+ICAJLm11dGV4X21vZCA9IG10ODE3M19t
dXRleF9tb2QsCj4gIAkubXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwKPiAgCS5tdXRleF9t
b2RfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCj4gKwkubXV0ZXhfc29mX3JlZyA9IE1U
MjcwMV9ESVNQX01VVEVYMF9TT0YwLAo+ICB9Owo+ICAKPiAgc3RhdGljIHVuc2lnbmVkIGludCBt
dGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+IEBAIC01MjgsNyArNTMz
LDggQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9hZGRfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXgg
Km11dGV4LAo+ICAJfQo+ICAKPiAgCXdyaXRlbF9yZWxheGVkKGRkcC0+ZGF0YS0+bXV0ZXhfc29m
W3NvZl9pZF0sCj4gLQkJICAgICAgIGRkcC0+cmVncyArIERJU1BfUkVHX01VVEVYX1NPRihtdXRl
eC0+aWQpKTsKPiArCQkgICAgICAgZGRwLT5yZWdzICsKPiArCQkgICAgICAgRElTUF9SRUdfTVVU
RVhfU09GKGRkcC0+ZGF0YS0+bXV0ZXhfc29mX3JlZywgbXV0ZXgtPmlkKSk7Cj4gIH0KPiAgCj4g
IHZvaWQgbXRrX2Rpc3BfbXV0ZXhfcmVtb3ZlX2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICpt
dXRleCwKPiBAQCAtNTUwLDcgKzU1Niw4IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfcmVtb3ZlX2Nv
bXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKPiAgCWNhc2UgRERQX0NPTVBPTkVOVF9E
UEkxOgo+ICAJCXdyaXRlbF9yZWxheGVkKE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwKPiAgCQkJICAg
ICAgIGRkcC0+cmVncyArCj4gLQkJCSAgICAgICBESVNQX1JFR19NVVRFWF9TT0YobXV0ZXgtPmlk
KSk7Cj4gKwkJCSAgICAgICBESVNQX1JFR19NVVRFWF9TT0YoZGRwLT5kYXRhLT5tdXRleF9zb2Zf
cmVnLAo+ICsJCQkJCQkgIG11dGV4LT5pZCkpOwo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAg
CQlpZiAoZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdIDwgMzIpIHsKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
