Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3916F4F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 04:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57296E85C;
	Wed,  8 May 2019 02:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02AB06E85C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 02:56:50 +0000 (UTC)
X-UUID: 32694377cbc74a0cb64b2150d0736679-20190508
X-UUID: 32694377cbc74a0cb64b2150d0736679-20190508
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1513612528; Wed, 08 May 2019 10:56:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS33N1.mediatek.inc (172.27.4.75) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 May 2019 10:56:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 May 2019 10:56:40 +0800
Message-ID: <1557284200.31731.8.camel@mtksdaap41>
Subject: Re: [v2 3/5] drm/mediatek: add dsi reg commit control
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 8 May 2019 10:56:40 +0800
In-Reply-To: <20190416060501.76276-4-jitao.shi@mediatek.com>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-4-jitao.shi@mediatek.com>
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

SGksIEppdGFvOgoKT24gVHVlLCAyMDE5LTA0LTE2IGF0IDE0OjA0ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gTmV3IERTSSBJUCBoYXMgc2hhZG93IHJlZ2lzdGVyIGFuZCB3b3JraW5nIHJlZy4g
VGhlIHJlZ2lzdGVyCj4gdmFsdWVzIGFyZSB3cml0ZW4gdG8gc2hhZG93IHJlZ2lzdGVyLiBBbmQg
dGhlbiB0cmlnZ2VyIHdpdGgKPiBjb21taXQgcmVnLCB0aGUgcmVnaXN0ZXIgdmFsdWVzIHdpbGwg
YmUgbW92ZWQgd29ya2luZyByZWdpc3Rlci4KClRoaXMgcGF0Y2ggbG9va3MgZ29vZCwgYnV0IHRo
ZSBtZXNzYWdlIGlzIG5vdCBjb21wbGV0ZS4gVGhlIG1lc3NhZ2UgbWFrZQp1cyBiZWxpZXZlIHlv
dSB1c2Ugc2hhZG93IHJlZ2lzdGVyIHRvIHdvcmssIGJ1dCBhY3R1YWxseSwgc2hhZG93CnJlZ2lz
dGVyIGlzIGRlZmF1bHQgdHVybiBvbiBpbiBuZXcgRFNJIElQIGFuZCB5b3Ugd2FudCB0byB0dXJu
IG9mZiBpdC4KClJlZ2FyZHMsCkNLCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYyB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA1NzNlNmJlYzZkMzYu
LmJlNDI0MDVhMGE3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0x
MzEsNiArMTMxLDEwIEBACj4gICNkZWZpbmUgVk1fQ01EX0VOCQkJQklUKDApCj4gICNkZWZpbmUg
VFNfVkZQX0VOCQkJQklUKDUpCj4gIAo+ICsjZGVmaW5lIERTSV9TSEFET1dfREVCVUcJMHgxOTBV
Cj4gKyNkZWZpbmUgRk9SQ0VfQ09NTUlUCQlCSVQoMCkKPiArI2RlZmluZSBCWVBBU1NfU0hBRE9X
CQlCSVQoMSkKPiArCj4gICNkZWZpbmUgQ09ORklHCQkJCSgweGZmIDw8IDApCj4gICNkZWZpbmUg
U0hPUlRfUEFDS0VUCQkJMAo+ICAjZGVmaW5lIExPTkdfUEFDS0VUCQkJMgo+IEBAIC0xNTcsNiAr
MTYxLDcgQEAgc3RydWN0IHBoeTsKPiAgCj4gIHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIHsK
PiAgCWNvbnN0IHUzMiByZWdfY21kcV9vZmY7Cj4gKwlib29sIGhhc19zaGFkb3dfY3RsOwo+ICB9
Owo+ICAKPiAgc3RydWN0IG10a19kc2kgewo+IEBAIC01OTQsNiArNTk5LDExIEBAIHN0YXRpYyBp
bnQgbXRrX2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIAl9Cj4gIAo+ICAJbXRr
X2RzaV9lbmFibGUoZHNpKTsKPiArCj4gKwlpZiAoZHNpLT5kcml2ZXJfZGF0YS0+aGFzX3NoYWRv
d19jdGwpCj4gKwkJd3JpdGVsKEZPUkNFX0NPTU1JVCB8IEJZUEFTU19TSEFET1csCj4gKwkJICAg
ICAgIGRzaS0+cmVncyArIERTSV9TSEFET1dfREVCVUcpOwo+ICsKPiAgCW10a19kc2lfcmVzZXRf
ZW5naW5lKGRzaSk7Cj4gIAltdGtfZHNpX3BoeV90aW1jb25maWcoZHNpKTsKPiAgCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
