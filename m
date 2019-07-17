Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1E6B5DB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 07:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730986E223;
	Wed, 17 Jul 2019 05:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E5B06E223
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 05:24:15 +0000 (UTC)
X-UUID: 41acc4304b8543639ab5b18f93e15b77-20190717
X-UUID: 41acc4304b8543639ab5b18f93e15b77-20190717
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 19208423; Wed, 17 Jul 2019 13:23:56 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 13:23:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 13:23:54 +0800
Message-ID: <1563341033.29169.12.camel@mtksdaap41>
Subject: Re: [PATCH v4, 09/33] drm/mediatek: add mutex mod register offset
 into ddp private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 13:23:53 +0800
In-Reply-To: <1562625253-29254-10-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-10-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8E5985605A1A1B50372F59E3FDB9FBBFDDD2B883BAD63194D3C420C112E8049A2000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gbXV0ZXggbW9kIHJlZ2lzdGVyIG9mZnNldCB3aWxs
IGJlIHByaXZhdGUgZGF0YSBvZiBkZHAuCj4gCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5p
dUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggNDEyYjgyZi4uOGJkZTJjZiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTQxLDEyICs0MSwxNCBAQAo+ICAjZGVm
aW5lIERJU1BfUkVHX0NPTkZJR19EU0lfU0VMCQkJMHgwNTAKPiAgI2RlZmluZSBESVNQX1JFR19D
T05GSUdfRFBJX1NFTAkJCTB4MDY0Cj4gIAo+IC0jZGVmaW5lIERJU1BfUkVHX01VVEVYX0VOKG4p
CSgweDIwICsgMHgyMCAqIChuKSkKPiAtI2RlZmluZSBESVNQX1JFR19NVVRFWChuKQkoMHgyNCAr
IDB4MjAgKiAobikpCj4gLSNkZWZpbmUgRElTUF9SRUdfTVVURVhfUlNUKG4pCSgweDI4ICsgMHgy
MCAqIChuKSkKPiAtI2RlZmluZSBESVNQX1JFR19NVVRFWF9NT0QobikJKDB4MmMgKyAweDIwICog
KG4pKQo+IC0jZGVmaW5lIERJU1BfUkVHX01VVEVYX1NPRihuKQkoMHgzMCArIDB4MjAgKiAobikp
Cj4gLSNkZWZpbmUgRElTUF9SRUdfTVVURVhfTU9EMihuKQkoMHgzNCArIDB4MjAgKiAobikpCj4g
KyNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgwX01PRDAJCQkweDJjCj4gKwo+ICsjZGVmaW5lIERJ
U1BfUkVHX01VVEVYX0VOKG4pCQkJKDB4MjAgKyAweDIwICogKG4pKQo+ICsjZGVmaW5lIERJU1Bf
UkVHX01VVEVYKG4pCQkJKDB4MjQgKyAweDIwICogKG4pKQo+ICsjZGVmaW5lIERJU1BfUkVHX01V
VEVYX1JTVChuKQkJCSgweDI4ICsgMHgyMCAqIChuKSkKPiArI2RlZmluZSBESVNQX1JFR19NVVRF
WF9NT0QobXV0ZXhfbW9kX3JlZywgbikJKG11dGV4X21vZF9yZWcgKyAweDIwICogKG4pKQo+ICsj
ZGVmaW5lIERJU1BfUkVHX01VVEVYX1NPRihuKQkJCSgweDMwICsgMHgyMCAqIChuKSkKPiArI2Rl
ZmluZSBESVNQX1JFR19NVVRFWF9NT0QyKG4pCQkJKDB4MzQgKyAweDIwICogKG4pKQo+ICAKPiAg
I2RlZmluZSBJTlRfTVVURVgJCQkJQklUKDEpCj4gIAo+IEBAIC0xNDksNiArMTUxLDcgQEAgc3Ry
dWN0IG10a19kaXNwX211dGV4IHsKPiAgCj4gIHN0cnVjdCBtdGtfZGRwX2RhdGEgewo+ICAJY29u
c3QgdW5zaWduZWQgaW50ICptdXRleF9tb2Q7Cj4gKwljb25zdCB1bnNpZ25lZCBpbnQgbXV0ZXhf
bW9kX3JlZzsKPiAgfTsKPiAgCj4gIHN0cnVjdCBtdGtfZGRwIHsKPiBAQCAtMjA4LDE0ICsyMTEs
MTcgQEAgc3RydWN0IG10a19kZHAgewo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRw
X2RhdGEgbXQyNzAxX2RkcF9kcml2ZXJfZGF0YSA9IHsKPiAgCS5tdXRleF9tb2QgPSBtdDI3MDFf
bXV0ZXhfbW9kLAo+ICsJLm11dGV4X21vZF9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMCwK
PiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10MjcxMl9kZHBf
ZHJpdmVyX2RhdGEgPSB7Cj4gIAkubXV0ZXhfbW9kID0gbXQyNzEyX211dGV4X21vZCwKPiArCS5t
dXRleF9tb2RfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCj4gIH07Cj4gIAo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDgxNzNfZGRwX2RyaXZlcl9kYXRhID0gewo+
ICAJLm11dGV4X21vZCA9IG10ODE3M19tdXRleF9tb2QsCj4gKwkubXV0ZXhfbW9kX3JlZyA9IE1U
MjcwMV9ESVNQX01VVEVYMF9NT0QwLAo+ICB9Owo+ICAKPiAgc3RhdGljIHVuc2lnbmVkIGludCBt
dGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+IEBAIC00ODEsNyArNDg3
LDggQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9hZGRfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXgg
Km11dGV4LAo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAgCQlpZiAoZGRwLT5kYXRhLT5tdXRl
eF9tb2RbaWRdIDwgMzIpIHsKPiAtCQkJb2Zmc2V0ID0gRElTUF9SRUdfTVVURVhfTU9EKG11dGV4
LT5pZCk7Cj4gKwkJCW9mZnNldCA9IERJU1BfUkVHX01VVEVYX01PRChkZHAtPmRhdGEtPm11dGV4
X21vZF9yZWcsCj4gKwkJCQkJCSAgICBtdXRleC0+aWQpOwo+ICAJCQlyZWcgPSByZWFkbF9yZWxh
eGVkKGRkcC0+cmVncyArIG9mZnNldCk7Cj4gIAkJCXJlZyB8PSAxIDw8IGRkcC0+ZGF0YS0+bXV0
ZXhfbW9kW2lkXTsKPiAgCQkJd3JpdGVsX3JlbGF4ZWQocmVnLCBkZHAtPnJlZ3MgKyBvZmZzZXQp
Owo+IEBAIC01MTksNyArNTI2LDggQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9yZW1vdmVfY29tcChz
dHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAg
CQlpZiAoZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdIDwgMzIpIHsKPiAtCQkJb2Zmc2V0ID0gRElT
UF9SRUdfTVVURVhfTU9EKG11dGV4LT5pZCk7Cj4gKwkJCW9mZnNldCA9IERJU1BfUkVHX01VVEVY
X01PRChkZHAtPmRhdGEtPm11dGV4X21vZF9yZWcsCj4gKwkJCQkJCSAgICBtdXRleC0+aWQpOwo+
ICAJCQlyZWcgPSByZWFkbF9yZWxheGVkKGRkcC0+cmVncyArIG9mZnNldCk7Cj4gIAkJCXJlZyAm
PSB+KDEgPDwgZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdKTsKPiAgCQkJd3JpdGVsX3JlbGF4ZWQo
cmVnLCBkZHAtPnJlZ3MgKyBvZmZzZXQpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
