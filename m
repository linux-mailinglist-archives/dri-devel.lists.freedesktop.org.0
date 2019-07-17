Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6556B5F3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 07:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9593C6E229;
	Wed, 17 Jul 2019 05:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00BB06E229
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 05:32:06 +0000 (UTC)
X-UUID: 63807a7f58414eb2859707a1f8ff8aae-20190717
X-UUID: 63807a7f58414eb2859707a1f8ff8aae-20190717
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1883150426; Wed, 17 Jul 2019 13:31:56 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 13:31:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 13:31:54 +0800
Message-ID: <1563341514.29169.14.camel@mtksdaap41>
Subject: Re: [PATCH v4, 11/33] drm/mediatek: add mutex sof register offset
 into ddp private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 13:31:54 +0800
In-Reply-To: <1562625253-29254-12-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-12-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 86CB27915B31E087E11638F66BC5816F7C93AAD27091893D150F28DAAEDA8DA92000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozMyArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gbXV0ZXggc29mIHJlZ2lzdGVyIG9mZnNldCB3aWxs
IGJlIHByaXZhdGUgZGF0YSBvZiBkZHAKPiAKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVk
aWF0ZWsuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1
QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMgfCAxMyArKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cC5jCj4gaW5kZXggYWIzOTZlZS4uZDAxNWMxYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcC5jCj4gQEAgLTQyLDEyICs0MiwxMyBAQAo+ICAjZGVmaW5lIERJU1BfUkVH
X0NPTkZJR19EUElfU0VMCQkJMHgwNjQKPiAgCj4gICNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgw
X01PRDAJCQkweDJjCj4gKyNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgwX1NPRjAJCQkweDMwCj4g
IAo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYX0VOKG4pCQkJKDB4MjAgKyAweDIwICogKG4pKQo+
ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYKG4pCQkJKDB4MjQgKyAweDIwICogKG4pKQo+ICAjZGVm
aW5lIERJU1BfUkVHX01VVEVYX1JTVChuKQkJCSgweDI4ICsgMHgyMCAqIChuKSkKPiAgI2RlZmlu
ZSBESVNQX1JFR19NVVRFWF9NT0QobXV0ZXhfbW9kX3JlZywgbikJKG11dGV4X21vZF9yZWcgKyAw
eDIwICogKG4pKQo+IC0jZGVmaW5lIERJU1BfUkVHX01VVEVYX1NPRihuKQkJCSgweDMwICsgMHgy
MCAqIChuKSkKPiArI2RlZmluZSBESVNQX1JFR19NVVRFWF9TT0YobXV0ZXhfc29mX3JlZywgbikJ
KG11dGV4X3NvZl9yZWcgKyAweDIwICogKG4pKQo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYX01P
RDIobikJCQkoMHgzNCArIDB4MjAgKiAobikpCj4gIAo+ICAjZGVmaW5lIElOVF9NVVRFWAkJCQlC
SVQoMSkKPiBAQCAtMTYzLDYgKzE2NCw3IEBAIHN0cnVjdCBtdGtfZGRwX2RhdGEgewo+ICAJY29u
c3QgdW5zaWduZWQgaW50ICptdXRleF9tb2Q7Cj4gIAljb25zdCB1bnNpZ25lZCBpbnQgKm11dGV4
X3NvZjsKPiAgCWNvbnN0IHVuc2lnbmVkIGludCBtdXRleF9tb2RfcmVnOwo+ICsJY29uc3QgdW5z
aWduZWQgaW50IG11dGV4X3NvZl9yZWc7Cj4gIH07Cj4gIAo+ICBzdHJ1Y3QgbXRrX2RkcCB7Cj4g
QEAgLTIzNCwxOCArMjM2LDIxIEBAIHN0cnVjdCBtdGtfZGRwIHsKPiAgCS5tdXRleF9tb2QgPSBt
dDI3MDFfbXV0ZXhfbW9kLAo+ICAJLm11dGV4X3NvZiA9IG10MjcxMl9tdXRleF9zb2YsCj4gIAku
bXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwLAo+ICsJLm11dGV4X3NvZl9y
ZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfU09GMCwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2RkcF9kYXRhIG10MjcxMl9kZHBfZHJpdmVyX2RhdGEgPSB7Cj4gIAkubXV0ZXhf
bW9kID0gbXQyNzEyX211dGV4X21vZCwKPiAgCS5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29m
LAo+ICAJLm11dGV4X21vZF9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMCwKPiArCS5tdXRl
eF9zb2ZfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX1NPRjAsCj4gIH07Cj4gIAo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDgxNzNfZGRwX2RyaXZlcl9kYXRhID0gewo+ICAJ
Lm11dGV4X21vZCA9IG10ODE3M19tdXRleF9tb2QsCj4gIAkubXV0ZXhfc29mID0gbXQyNzEyX211
dGV4X3NvZiwKPiAgCS5tdXRleF9tb2RfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCj4g
KwkubXV0ZXhfc29mX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9TT0YwLAo+ICB9Owo+ICAKPiAg
c3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQg
Y3VyLAo+IEBAIC01MjcsNyArNTMyLDggQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9hZGRfY29tcChz
dHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJfQo+ICAKPiAgCXdyaXRlbF9yZWxheGVk
KGRkcC0+ZGF0YS0+bXV0ZXhfc29mW3NvZl9pZF0sCj4gLQkJICAgICAgIGRkcC0+cmVncyArIERJ
U1BfUkVHX01VVEVYX1NPRihtdXRleC0+aWQpKTsKPiArCQkgICAgICAgZGRwLT5yZWdzICsKPiAr
CQkgICAgICAgRElTUF9SRUdfTVVURVhfU09GKGRkcC0+ZGF0YS0+bXV0ZXhfc29mX3JlZywgbXV0
ZXgtPmlkKSk7Cj4gIH0KPiAgCj4gIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfcmVtb3ZlX2NvbXAoc3Ry
dWN0IG10a19kaXNwX211dGV4ICptdXRleCwKPiBAQCAtNTQ5LDcgKzU1NSw4IEBAIHZvaWQgbXRr
X2Rpc3BfbXV0ZXhfcmVtb3ZlX2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKPiAg
CWNhc2UgRERQX0NPTVBPTkVOVF9EUEkxOgo+ICAJCXdyaXRlbF9yZWxheGVkKE1VVEVYX1NPRl9T
SU5HTEVfTU9ERSwKPiAgCQkJICAgICAgIGRkcC0+cmVncyArCj4gLQkJCSAgICAgICBESVNQX1JF
R19NVVRFWF9TT0YobXV0ZXgtPmlkKSk7Cj4gKwkJCSAgICAgICBESVNQX1JFR19NVVRFWF9TT0Yo
ZGRwLT5kYXRhLT5tdXRleF9zb2ZfcmVnLAo+ICsJCQkJCQkgIG11dGV4LT5pZCkpOwo+ICAJCWJy
ZWFrOwo+ICAJZGVmYXVsdDoKPiAgCQlpZiAoZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdIDwgMzIp
IHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
