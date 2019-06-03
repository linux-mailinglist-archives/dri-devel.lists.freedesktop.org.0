Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A73268A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 04:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB148938C;
	Mon,  3 Jun 2019 02:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB7A08938C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 02:19:42 +0000 (UTC)
X-UUID: 2a27758f1ed445d3ae430e40fa8cbcf4-20190603
X-UUID: 2a27758f1ed445d3ae430e40fa8cbcf4-20190603
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1566463222; Mon, 03 Jun 2019 10:19:39 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 3 Jun 2019 10:19:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 3 Jun 2019 10:19:34 +0800
Message-ID: <1559528374.32185.4.camel@mtksdaap41>
Subject: Re: [v4 3/7] drm/mediatek: add dsi reg commit disable control
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 3 Jun 2019 10:19:34 +0800
In-Reply-To: <20190601092615.67917-4-jitao.shi@mediatek.com>
References: <20190601092615.67917-1-jitao.shi@mediatek.com>
 <20190601092615.67917-4-jitao.shi@mediatek.com>
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
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry
 Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy
 Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gU2F0LCAyMDE5LTA2LTAxIGF0IDE3OjI2ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gTmV3IERTSSBJUCBoYXMgc2hhZG93IHJlZ2lzdGVyIGFuZCB3b3JraW5nIHJlZy4g
VGhlIHJlZ2lzdGVyCj4gdmFsdWVzIGFyZSB3cml0ZW4gdG8gc2hhZG93IHJlZ2lzdGVyLiBBbmQg
dGhlbiB0cmlnZ2VyIHdpdGgKPiBjb21taXQgcmVnLCB0aGUgcmVnaXN0ZXIgdmFsdWVzIHdpbGwg
YmUgbW92ZWQgd29ya2luZyByZWdpc3Rlci4KPiAKPiBUaGlzIGZ1Y250aW9uIGlzIGRlZnVhbHQg
b24uIEJ1dCB0aGlzIGRyaXZlciBkb2Vzbid0IHVzZSB0aGlzCj4gZnVuY3Rpb24uIFNvIGFkZCB0
aGUgZGlzYWJsZSBjb250cm9sLgoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEwICsrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCBhNDhkYjA1NmRmNmMuLmVlYTQ3Mjk0MDc5ZSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0xMzEsNiArMTMxLDEwIEBACj4g
ICNkZWZpbmUgVk1fQ01EX0VOCQkJQklUKDApCj4gICNkZWZpbmUgVFNfVkZQX0VOCQkJQklUKDUp
Cj4gIAo+ICsjZGVmaW5lIERTSV9TSEFET1dfREVCVUcJMHgxOTBVCj4gKyNkZWZpbmUgRk9SQ0Vf
Q09NTUlUCQkJQklUKDApCj4gKyNkZWZpbmUgQllQQVNTX1NIQURPVwkJCUJJVCgxKQo+ICsKPiAg
I2RlZmluZSBDT05GSUcJCQkJKDB4ZmYgPDwgMCkKPiAgI2RlZmluZSBTSE9SVF9QQUNLRVQJCQkw
Cj4gICNkZWZpbmUgTE9OR19QQUNLRVQJCQkyCj4gQEAgLTE1Nyw2ICsxNjEsNyBAQCBzdHJ1Y3Qg
cGh5Owo+ICAKPiAgc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgewo+ICAJY29uc3QgdTMyIHJl
Z19jbWRxX29mZjsKPiArCWJvb2wgaGFzX3NoYWRvd19jdGw7Cj4gIH07Cj4gIAo+ICBzdHJ1Y3Qg
bXRrX2RzaSB7Cj4gQEAgLTU5NCw2ICs1OTksMTEgQEAgc3RhdGljIGludCBtdGtfZHNpX3Bvd2Vy
b24oc3RydWN0IG10a19kc2kgKmRzaSkKPiAgCX0KPiAgCj4gIAltdGtfZHNpX2VuYWJsZShkc2kp
Owo+ICsKPiArCWlmIChkc2ktPmRyaXZlcl9kYXRhLT5oYXNfc2hhZG93X2N0bCkKPiArCQl3cml0
ZWwoRk9SQ0VfQ09NTUlUIHwgQllQQVNTX1NIQURPVywKPiArCQkgICAgICAgZHNpLT5yZWdzICsg
RFNJX1NIQURPV19ERUJVRyk7Cj4gKwo+ICAJbXRrX2RzaV9yZXNldF9lbmdpbmUoZHNpKTsKPiAg
CW10a19kc2lfcGh5X3RpbWNvbmZpZyhkc2kpOwo+ICAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
