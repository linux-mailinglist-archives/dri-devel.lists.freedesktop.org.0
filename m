Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC9D0B46
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C16E2D7;
	Wed,  9 Oct 2019 09:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6B136E92D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:32:49 +0000 (UTC)
X-UUID: 7e75eb430c4e48749a7d6101df136f4f-20191009
X-UUID: 7e75eb430c4e48749a7d6101df136f4f-20191009
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2095053244; Wed, 09 Oct 2019 17:32:42 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:32:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:32:37 +0800
Message-ID: <1570613559.7713.11.camel@mtksdaap41>
Subject: Re: [PATCH v5, 08/32] drm/mediatek: add mutex mod register offset
 into ddp private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:32:39 +0800
In-Reply-To: <1567090254-15566-9-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-9-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F6B5DD69EC391BE372CBC5B543A24EB03A151202504F6FD4319AFF8479D0F03D2000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gbXV0ZXggbW9kIHJlZ2lzdGVyIG9mZnNldCB3aWxs
IGJlIHByaXZhdGUgZGF0YSBvZiBkZHAuCj4gCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0
LTUuNSBbMV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9s
aW51eC5naXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRybS1uZXh0LTUuNQoKUmVnYXJkcywKQ0sK
Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20+Cj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMjQgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggYjZj
YzNkOC4uYWUyMmUyMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5j
Cj4gQEAgLTMzLDEyICszMywxNCBAQAo+ICAjZGVmaW5lIERJU1BfUkVHX0NPTkZJR19EU0lfU0VM
CQkJMHgwNTAKPiAgI2RlZmluZSBESVNQX1JFR19DT05GSUdfRFBJX1NFTAkJCTB4MDY0Cj4gIAo+
IC0jZGVmaW5lIERJU1BfUkVHX01VVEVYX0VOKG4pCSgweDIwICsgMHgyMCAqIChuKSkKPiAtI2Rl
ZmluZSBESVNQX1JFR19NVVRFWChuKQkoMHgyNCArIDB4MjAgKiAobikpCj4gLSNkZWZpbmUgRElT
UF9SRUdfTVVURVhfUlNUKG4pCSgweDI4ICsgMHgyMCAqIChuKSkKPiAtI2RlZmluZSBESVNQX1JF
R19NVVRFWF9NT0QobikJKDB4MmMgKyAweDIwICogKG4pKQo+IC0jZGVmaW5lIERJU1BfUkVHX01V
VEVYX1NPRihuKQkoMHgzMCArIDB4MjAgKiAobikpCj4gLSNkZWZpbmUgRElTUF9SRUdfTVVURVhf
TU9EMihuKQkoMHgzNCArIDB4MjAgKiAobikpCj4gKyNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgw
X01PRDAJCQkweDJjCj4gKwo+ICsjZGVmaW5lIERJU1BfUkVHX01VVEVYX0VOKG4pCQkJKDB4MjAg
KyAweDIwICogKG4pKQo+ICsjZGVmaW5lIERJU1BfUkVHX01VVEVYKG4pCQkJKDB4MjQgKyAweDIw
ICogKG4pKQo+ICsjZGVmaW5lIERJU1BfUkVHX01VVEVYX1JTVChuKQkJCSgweDI4ICsgMHgyMCAq
IChuKSkKPiArI2RlZmluZSBESVNQX1JFR19NVVRFWF9NT0QobXV0ZXhfbW9kX3JlZywgbikJKG11
dGV4X21vZF9yZWcgKyAweDIwICogKG4pKQo+ICsjZGVmaW5lIERJU1BfUkVHX01VVEVYX1NPRihu
KQkJCSgweDMwICsgMHgyMCAqIChuKSkKPiArI2RlZmluZSBESVNQX1JFR19NVVRFWF9NT0QyKG4p
CQkJKDB4MzQgKyAweDIwICogKG4pKQo+ICAKPiAgI2RlZmluZSBJTlRfTVVURVgJCQkJQklUKDEp
Cj4gIAo+IEBAIC0xNDEsNiArMTQzLDcgQEAgc3RydWN0IG10a19kaXNwX211dGV4IHsKPiAgCj4g
IHN0cnVjdCBtdGtfZGRwX2RhdGEgewo+ICAJY29uc3QgdW5zaWduZWQgaW50ICptdXRleF9tb2Q7
Cj4gKwljb25zdCB1bnNpZ25lZCBpbnQgbXV0ZXhfbW9kX3JlZzsKPiAgfTsKPiAgCj4gIHN0cnVj
dCBtdGtfZGRwIHsKPiBAQCAtMjAwLDE0ICsyMDMsMTcgQEAgc3RydWN0IG10a19kZHAgewo+ICAK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEgbXQyNzAxX2RkcF9kcml2ZXJfZGF0
YSA9IHsKPiAgCS5tdXRleF9tb2QgPSBtdDI3MDFfbXV0ZXhfbW9kLAo+ICsJLm11dGV4X21vZF9y
ZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMCwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2RkcF9kYXRhIG10MjcxMl9kZHBfZHJpdmVyX2RhdGEgPSB7Cj4gIAkubXV0ZXhf
bW9kID0gbXQyNzEyX211dGV4X21vZCwKPiArCS5tdXRleF9tb2RfcmVnID0gTVQyNzAxX0RJU1Bf
TVVURVgwX01PRDAsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0
YSBtdDgxNzNfZGRwX2RyaXZlcl9kYXRhID0gewo+ICAJLm11dGV4X21vZCA9IG10ODE3M19tdXRl
eF9tb2QsCj4gKwkubXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwLAo+ICB9
Owo+ICAKPiAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRw
X2NvbXBfaWQgY3VyLAo+IEBAIC00NzMsNyArNDc5LDggQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9h
ZGRfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJCWJyZWFrOwo+ICAJZGVm
YXVsdDoKPiAgCQlpZiAoZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdIDwgMzIpIHsKPiAtCQkJb2Zm
c2V0ID0gRElTUF9SRUdfTVVURVhfTU9EKG11dGV4LT5pZCk7Cj4gKwkJCW9mZnNldCA9IERJU1Bf
UkVHX01VVEVYX01PRChkZHAtPmRhdGEtPm11dGV4X21vZF9yZWcsCj4gKwkJCQkJCSAgICBtdXRl
eC0+aWQpOwo+ICAJCQlyZWcgPSByZWFkbF9yZWxheGVkKGRkcC0+cmVncyArIG9mZnNldCk7Cj4g
IAkJCXJlZyB8PSAxIDw8IGRkcC0+ZGF0YS0+bXV0ZXhfbW9kW2lkXTsKPiAgCQkJd3JpdGVsX3Jl
bGF4ZWQocmVnLCBkZHAtPnJlZ3MgKyBvZmZzZXQpOwo+IEBAIC01MTEsNyArNTE4LDggQEAgdm9p
ZCBtdGtfZGlzcF9tdXRleF9yZW1vdmVfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4
LAo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAgCQlpZiAoZGRwLT5kYXRhLT5tdXRleF9tb2Rb
aWRdIDwgMzIpIHsKPiAtCQkJb2Zmc2V0ID0gRElTUF9SRUdfTVVURVhfTU9EKG11dGV4LT5pZCk7
Cj4gKwkJCW9mZnNldCA9IERJU1BfUkVHX01VVEVYX01PRChkZHAtPmRhdGEtPm11dGV4X21vZF9y
ZWcsCj4gKwkJCQkJCSAgICBtdXRleC0+aWQpOwo+ICAJCQlyZWcgPSByZWFkbF9yZWxheGVkKGRk
cC0+cmVncyArIG9mZnNldCk7Cj4gIAkJCXJlZyAmPSB+KDEgPDwgZGRwLT5kYXRhLT5tdXRleF9t
b2RbaWRdKTsKPiAgCQkJd3JpdGVsX3JlbGF4ZWQocmVnLCBkZHAtPnJlZ3MgKyBvZmZzZXQpOwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
