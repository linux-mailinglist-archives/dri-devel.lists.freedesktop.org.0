Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC2BEDCC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAD16EE81;
	Thu, 26 Sep 2019 08:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id A06B46EE81
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:50:18 +0000 (UTC)
X-UUID: 0c4a7e567f8849e7ac519e12f71e549b-20190926
X-UUID: 0c4a7e567f8849e7ac519e12f71e549b-20190926
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 123560541; Thu, 26 Sep 2019 16:50:14 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Sep 2019 16:50:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Sep 2019 16:50:06 +0800
Message-ID: <1569487807.9612.0.camel@mtksdaap41>
Subject: Re: [PATCH v7 2/9] drm/mediatek: fixes CMDQ reg address of mt8173
 is different with mt2701
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Thu, 26 Sep 2019 16:50:07 +0800
In-Reply-To: <20190919065806.111016-3-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
 <20190919065806.111016-3-jitao.shi@mediatek.com>
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gVGh1LCAyMDE5LTA5LTE5IGF0IDE0OjU3ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gQ29uZmlnIHRoZSBkaWZmZXJlbnQgQ01EUSByZWcgYWRkcmVzcyBpbiBkcml2ZXIg
ZGF0YS4KClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAyNyArKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggNTJiNDlkYWVlZDlm
Li43ZTI0ZDAzY2RjY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAt
MTIzLDcgKzEyMyw2IEBACj4gICNkZWZpbmUgVk1fQ01EX0VOCQkJQklUKDApCj4gICNkZWZpbmUg
VFNfVkZQX0VOCQkJQklUKDUpCj4gIAo+IC0jZGVmaW5lIERTSV9DTURRMAkJMHgxODAKPiAgI2Rl
ZmluZSBDT05GSUcJCQkJKDB4ZmYgPDwgMCkKPiAgI2RlZmluZSBTSE9SVF9QQUNLRVQJCQkwCj4g
ICNkZWZpbmUgTE9OR19QQUNLRVQJCQkyCj4gQEAgLTE0OCw2ICsxNDcsMTAgQEAKPiAgCj4gIHN0
cnVjdCBwaHk7Cj4gIAo+ICtzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSB7Cj4gKwljb25zdCB1
MzIgcmVnX2NtZHFfb2ZmOwo+ICt9Owo+ICsKPiAgc3RydWN0IG10a19kc2kgewo+ICAJc3RydWN0
IG10a19kZHBfY29tcCBkZHBfY29tcDsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiBAQCAtMTc0
LDYgKzE3Nyw3IEBAIHN0cnVjdCBtdGtfZHNpIHsKPiAgCWJvb2wgZW5hYmxlZDsKPiAgCXUzMiBp
cnFfZGF0YTsKPiAgCXdhaXRfcXVldWVfaGVhZF90IGlycV93YWl0X3F1ZXVlOwo+ICsJY29uc3Qg
c3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgKmRyaXZlcl9kYXRhOwo+ICB9Owo+ICAKPiAgc3Rh
dGljIGlubGluZSBzdHJ1Y3QgbXRrX2RzaSAqZW5jb2Rlcl90b19kc2koc3RydWN0IGRybV9lbmNv
ZGVyICplKQo+IEBAIC05MzYsNiArOTQwLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jbWRxKHN0
cnVjdCBtdGtfZHNpICpkc2ksIGNvbnN0IHN0cnVjdCBtaXBpX2RzaV9tc2cgKm1zZykKPiAgCWNv
bnN0IGNoYXIgKnR4X2J1ZiA9IG1zZy0+dHhfYnVmOwo+ICAJdTggY29uZmlnLCBjbWRxX3NpemUs
IGNtZHFfb2ZmLCB0eXBlID0gbXNnLT50eXBlOwo+ICAJdTMyIHJlZ192YWwsIGNtZHFfbWFzaywg
aTsKPiArCXUzMiByZWdfY21kcV9vZmYgPSBkc2ktPmRyaXZlcl9kYXRhLT5yZWdfY21kcV9vZmY7
Cj4gIAo+ICAJaWYgKE1US19EU0lfSE9TVF9JU19SRUFEKHR5cGUpKQo+ICAJCWNvbmZpZyA9IEJU
QTsKPiBAQCAtOTU1LDkgKzk2MCw5IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY21kcShzdHJ1Y3Qg
bXRrX2RzaSAqZHNpLCBjb25zdCBzdHJ1Y3QgbWlwaV9kc2lfbXNnICptc2cpCj4gIAl9Cj4gIAo+
ICAJZm9yIChpID0gMDsgaSA8IG1zZy0+dHhfbGVuOyBpKyspCj4gLQkJd3JpdGViKHR4X2J1Zltp
XSwgZHNpLT5yZWdzICsgRFNJX0NNRFEwICsgY21kcV9vZmYgKyBpKTsKPiArCQl3cml0ZWIodHhf
YnVmW2ldLCBkc2ktPnJlZ3MgKyByZWdfY21kcV9vZmYgKyBjbWRxX29mZiArIGkpOwo+ICAKPiAt
CW10a19kc2lfbWFzayhkc2ksIERTSV9DTURRMCwgY21kcV9tYXNrLCByZWdfdmFsKTsKPiArCW10
a19kc2lfbWFzayhkc2ksIHJlZ19jbWRxX29mZiwgY21kcV9tYXNrLCByZWdfdmFsKTsKPiAgCW10
a19kc2lfbWFzayhkc2ksIERTSV9DTURRX1NJWkUsIENNRFFfU0laRSwgY21kcV9zaXplKTsKPiAg
fQo+ICAKPiBAQCAtMTEwMSw2ICsxMTA2LDggQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gZXJyX3Vu
cmVnaXN0ZXJfaG9zdDsKPiAgCj4gKwlkc2ktPmRyaXZlcl9kYXRhID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKGRldik7Cj4gKwo+ICAJZHNpLT5lbmdpbmVfY2xrID0gZGV2bV9jbGtfZ2V0KGRl
diwgImVuZ2luZSIpOwo+ICAJaWYgKElTX0VSUihkc2ktPmVuZ2luZV9jbGspKSB7Cj4gIAkJcmV0
ID0gUFRSX0VSUihkc2ktPmVuZ2luZV9jbGspOwo+IEBAIC0xMTk0LDkgKzEyMDEsMTkgQEAgc3Rh
dGljIGludCBtdGtfZHNpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJ
cmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJf
ZGF0YSBtdDgxNzNfZHNpX2RyaXZlcl9kYXRhID0gewo+ICsJLnJlZ19jbWRxX29mZiA9IDB4MjAw
LAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIG10
MjcwMV9kc2lfZHJpdmVyX2RhdGEgPSB7Cj4gKwkucmVnX2NtZHFfb2ZmID0gMHgxODAsCj4gK307
Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHNpX29mX21hdGNo
W10gPSB7Cj4gLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1kc2kiIH0sCj4gLQl7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kc2kiIH0sCj4gKwl7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10MjcwMS1kc2kiLAo+ICsJICAuZGF0YSA9ICZtdDI3MDFfZHNpX2RyaXZl
cl9kYXRhIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kc2kiLAo+ICsJ
ICAuZGF0YSA9ICZtdDgxNzNfZHNpX2RyaXZlcl9kYXRhIH0sCj4gIAl7IH0sCj4gIH07Cj4gIAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
