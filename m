Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA20416F57
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 04:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC76E865;
	Wed,  8 May 2019 02:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 041F86E865
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 02:59:21 +0000 (UTC)
X-UUID: a4a81512090942aaac24d180c54b5cf8-20190508
X-UUID: a4a81512090942aaac24d180c54b5cf8-20190508
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1494308194; Wed, 08 May 2019 10:59:16 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS33N1.mediatek.inc (172.27.4.75) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 May 2019 10:59:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 May 2019 10:59:15 +0800
Message-ID: <1557284354.31731.9.camel@mtksdaap41>
Subject: Re: [v2 4/5] drm/mediatek: add frame size control
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 8 May 2019 10:59:14 +0800
In-Reply-To: <20190416060501.76276-5-jitao.shi@mediatek.com>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-5-jitao.shi@mediatek.com>
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com, Ajay
 Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul
 Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gVHVlLCAyMDE5LTA0LTE2IGF0IDE0OjA1ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gT3VyIG5ldyBEU0kgY2hpcCBoYXMgZnJhbWUgc2l6ZSBjb250cm9sLgo+IFNvIGFk
ZCB0aGUgZHJpdmVyIGRhdGEgdG8gY29udHJvbCBmb3IgZGlmZmVyZW50IGNoaXBzLgo+IAoKUmV2
aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IGJlNDI0MDVh
MGE3OC4uNDU4YTcwMGNlNzRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
QEAgLTc4LDYgKzc4LDcgQEAKPiAgI2RlZmluZSBEU0lfVkJQX05MCQkweDI0Cj4gICNkZWZpbmUg
RFNJX1ZGUF9OTAkJMHgyOAo+ICAjZGVmaW5lIERTSV9WQUNUX05MCQkweDJDCj4gKyNkZWZpbmUg
RFNJX1NJWkVfQ09OCQkweDM4Cj4gICNkZWZpbmUgRFNJX0hTQV9XQwkJMHg1MAo+ICAjZGVmaW5l
IERTSV9IQlBfV0MJCTB4NTQKPiAgI2RlZmluZSBEU0lfSEZQX1dDCQkweDU4Cj4gQEAgLTE2Miw2
ICsxNjMsNyBAQCBzdHJ1Y3QgcGh5Owo+ICBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSB7Cj4g
IAljb25zdCB1MzIgcmVnX2NtZHFfb2ZmOwo+ICAJYm9vbCBoYXNfc2hhZG93X2N0bDsKPiArCWJv
b2wgaGFzX3NpemVfY3RsOwo+ICB9Owo+ICAKPiAgc3RydWN0IG10a19kc2kgewo+IEBAIC00MzAs
NiArNDMyLDkgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3Qg
bXRrX2RzaSAqZHNpKQo+ICAJd3JpdGVsKHZtLT52ZnJvbnRfcG9yY2gsIGRzaS0+cmVncyArIERT
SV9WRlBfTkwpOwo+ICAJd3JpdGVsKHZtLT52YWN0aXZlLCBkc2ktPnJlZ3MgKyBEU0lfVkFDVF9O
TCk7Cj4gIAo+ICsJaWYgKGRzaS0+ZHJpdmVyX2RhdGEtPmhhc19zaXplX2N0bCkKPiArCQl3cml0
ZWwodm0tPnZhY3RpdmUgPDwgMTYgfCB2bS0+aGFjdGl2ZSwgZHNpLT5yZWdzICsgRFNJX1NJWkVf
Q09OKTsKPiArCj4gIAlob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xl
biAqIGRzaV90bXBfYnVmX2JwcCAtIDEwKTsKPiAgCj4gIAlpZiAoZHNpLT5tb2RlX2ZsYWdzICYg
TUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFKQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
