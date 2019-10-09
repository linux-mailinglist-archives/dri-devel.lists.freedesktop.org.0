Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0638D0B53
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6CB6E941;
	Wed,  9 Oct 2019 09:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38A396E941
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:33:42 +0000 (UTC)
X-UUID: bd1c4bed054b419e875e3979d164f1cd-20191009
X-UUID: bd1c4bed054b419e875e3979d164f1cd-20191009
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1626025133; Wed, 09 Oct 2019 17:33:36 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:33:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:33:33 +0800
Message-ID: <1570613616.7713.13.camel@mtksdaap41>
Subject: Re: [PATCH v5, 10/32] drm/mediatek: add mutex sof register offset
 into ddp private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:33:36 +0800
In-Reply-To: <1567090254-15566-11-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-11-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 249AE8EC08E0A52E09ECE236DDF6C34DA7BE6F12C7E6CED2986292B9B84AD3502000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gbXV0ZXggc29mIHJlZ2lzdGVyIG9mZnNldCB3aWxs
IGJlIHByaXZhdGUgZGF0YSBvZiBkZHAKPiAKCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQt
NS41IFsxXSwgdGhhbmtzLgoKWzFdCmh0dHBzOi8vZ2l0aHViLmNvbS9ja2h1LW1lZGlhdGVrL2xp
bnV4LmdpdC10YWdzL2NvbW1pdHMvbWVkaWF0ZWstZHJtLW5leHQtNS41CgpSZWdhcmRzLApDSwoK
PiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNv
bT4KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAxMyArKysrKysrKysrLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggOWJkYmQ4ZC4uNDg2NmE5
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTM0LDEy
ICszNCwxMyBAQAo+ICAjZGVmaW5lIERJU1BfUkVHX0NPTkZJR19EUElfU0VMCQkJMHgwNjQKPiAg
Cj4gICNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgwX01PRDAJCQkweDJjCj4gKyNkZWZpbmUgTVQy
NzAxX0RJU1BfTVVURVgwX1NPRjAJCQkweDMwCj4gIAo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVY
X0VOKG4pCQkJKDB4MjAgKyAweDIwICogKG4pKQo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYKG4p
CQkJKDB4MjQgKyAweDIwICogKG4pKQo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYX1JTVChuKQkJ
CSgweDI4ICsgMHgyMCAqIChuKSkKPiAgI2RlZmluZSBESVNQX1JFR19NVVRFWF9NT0QobXV0ZXhf
bW9kX3JlZywgbikJKG11dGV4X21vZF9yZWcgKyAweDIwICogKG4pKQo+IC0jZGVmaW5lIERJU1Bf
UkVHX01VVEVYX1NPRihuKQkJCSgweDMwICsgMHgyMCAqIChuKSkKPiArI2RlZmluZSBESVNQX1JF
R19NVVRFWF9TT0YobXV0ZXhfc29mX3JlZywgbikJKG11dGV4X3NvZl9yZWcgKyAweDIwICogKG4p
KQo+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYX01PRDIobikJCQkoMHgzNCArIDB4MjAgKiAobikp
Cj4gIAo+ICAjZGVmaW5lIElOVF9NVVRFWAkJCQlCSVQoMSkKPiBAQCAtMTU1LDYgKzE1Niw3IEBA
IHN0cnVjdCBtdGtfZGRwX2RhdGEgewo+ICAJY29uc3QgdW5zaWduZWQgaW50ICptdXRleF9tb2Q7
Cj4gIAljb25zdCB1bnNpZ25lZCBpbnQgKm11dGV4X3NvZjsKPiAgCWNvbnN0IHVuc2lnbmVkIGlu
dCBtdXRleF9tb2RfcmVnOwo+ICsJY29uc3QgdW5zaWduZWQgaW50IG11dGV4X3NvZl9yZWc7Cj4g
IH07Cj4gIAo+ICBzdHJ1Y3QgbXRrX2RkcCB7Cj4gQEAgLTIyNiwxOCArMjI4LDIxIEBAIHN0cnVj
dCBtdGtfZGRwIHsKPiAgCS5tdXRleF9tb2QgPSBtdDI3MDFfbXV0ZXhfbW9kLAo+ICAJLm11dGV4
X3NvZiA9IG10MjcxMl9tdXRleF9zb2YsCj4gIAkubXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQ
X01VVEVYMF9NT0QwLAo+ICsJLm11dGV4X3NvZl9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfU09G
MCwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10MjcxMl9k
ZHBfZHJpdmVyX2RhdGEgPSB7Cj4gIAkubXV0ZXhfbW9kID0gbXQyNzEyX211dGV4X21vZCwKPiAg
CS5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29mLAo+ICAJLm11dGV4X21vZF9yZWcgPSBNVDI3
MDFfRElTUF9NVVRFWDBfTU9EMCwKPiArCS5tdXRleF9zb2ZfcmVnID0gTVQyNzAxX0RJU1BfTVVU
RVgwX1NPRjAsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBt
dDgxNzNfZGRwX2RyaXZlcl9kYXRhID0gewo+ICAJLm11dGV4X21vZCA9IG10ODE3M19tdXRleF9t
b2QsCj4gIAkubXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwKPiAgCS5tdXRleF9tb2RfcmVn
ID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCj4gKwkubXV0ZXhfc29mX3JlZyA9IE1UMjcwMV9E
SVNQX01VVEVYMF9TT0YwLAo+ICB9Owo+ICAKPiAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRw
X21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+IEBAIC01MTksNyArNTI0LDggQEAg
dm9pZCBtdGtfZGlzcF9tdXRleF9hZGRfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4
LAo+ICAJfQo+ICAKPiAgCXdyaXRlbF9yZWxheGVkKGRkcC0+ZGF0YS0+bXV0ZXhfc29mW3NvZl9p
ZF0sCj4gLQkJICAgICAgIGRkcC0+cmVncyArIERJU1BfUkVHX01VVEVYX1NPRihtdXRleC0+aWQp
KTsKPiArCQkgICAgICAgZGRwLT5yZWdzICsKPiArCQkgICAgICAgRElTUF9SRUdfTVVURVhfU09G
KGRkcC0+ZGF0YS0+bXV0ZXhfc29mX3JlZywgbXV0ZXgtPmlkKSk7Cj4gIH0KPiAgCj4gIHZvaWQg
bXRrX2Rpc3BfbXV0ZXhfcmVtb3ZlX2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwK
PiBAQCAtNTQxLDcgKzU0Nyw4IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfcmVtb3ZlX2NvbXAoc3Ry
dWN0IG10a19kaXNwX211dGV4ICptdXRleCwKPiAgCWNhc2UgRERQX0NPTVBPTkVOVF9EUEkxOgo+
ICAJCXdyaXRlbF9yZWxheGVkKE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwKPiAgCQkJICAgICAgIGRk
cC0+cmVncyArCj4gLQkJCSAgICAgICBESVNQX1JFR19NVVRFWF9TT0YobXV0ZXgtPmlkKSk7Cj4g
KwkJCSAgICAgICBESVNQX1JFR19NVVRFWF9TT0YoZGRwLT5kYXRhLT5tdXRleF9zb2ZfcmVnLAo+
ICsJCQkJCQkgIG11dGV4LT5pZCkpOwo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAgCQlpZiAo
ZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdIDwgMzIpIHsKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
