Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314E30707
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 05:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211DD6E192;
	Fri, 31 May 2019 03:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AA586E192
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 03:38:38 +0000 (UTC)
X-UUID: 197e5f7b1ea54b33b595da9b0eedba51-20190531
X-UUID: 197e5f7b1ea54b33b595da9b0eedba51-20190531
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 312294267; Fri, 31 May 2019 11:38:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 May 2019 11:38:28 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 31 May 2019 11:38:29 +0800
Message-ID: <1559273908.9102.2.camel@mtksdaap41>
Subject: Re: [v3 3/7] drm/mediatek: add dsi reg commit disable control
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 31 May 2019 11:38:28 +0800
In-Reply-To: <20190519092537.69053-4-jitao.shi@mediatek.com>
References: <20190519092537.69053-1-jitao.shi@mediatek.com>
 <20190519092537.69053-4-jitao.shi@mediatek.com>
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

SGksIEppdGFvOgoKT24gU3VuLCAyMDE5LTA1LTE5IGF0IDE3OjI1ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gTmV3IERTSSBJUCBoYXMgc2hhZG93IHJlZ2lzdGVyIGFuZCB3b3JraW5nIHJlZy4g
VGhlIHJlZ2lzdGVyCj4gdmFsdWVzIGFyZSB3cml0ZW4gdG8gc2hhZG93IHJlZ2lzdGVyLiBBbmQg
dGhlbiB0cmlnZ2VyIHdpdGgKPiBjb21taXQgcmVnLCB0aGUgcmVnaXN0ZXIgdmFsdWVzIHdpbGwg
YmUgbW92ZWQgd29ya2luZyByZWdpc3Rlci4KPiAKPiBUaGlzIGZ1Y250aW9uIGlzIGRlZnVhbHQg
b24uIEJ1dCB0aGlzIGRyaXZlciBkb2Vzbid0IHVzZSB0aGlzCj4gZnVuY3Rpb24uIFNvIGFkZCB0
aGUgZGlzYWJsZSBjb250cm9sLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8u
c2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCBhNDhkYjA1NmRmNmMuLmZk
MzY3OTg1YzdmZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0xMzEs
NiArMTMxLDEwIEBACj4gICNkZWZpbmUgVk1fQ01EX0VOCQkJQklUKDApCj4gICNkZWZpbmUgVFNf
VkZQX0VOCQkJQklUKDUpCj4gIAo+ICsjZGVmaW5lIERTSV9TSEFET1dfREVCVUcJMHgxOTBVCj4g
KyNkZWZpbmUgRk9SQ0VfQ09NTUlUCQlCSVQoMCkKPiArI2RlZmluZSBCWVBBU1NfU0hBRE9XCQlC
SVQoMSkKCk9uZSBtb3JlICd0YWInIGZvciBiaXR3aXNlIGRlZmluaXRpb24uCgpSZWdhcmRzLApD
SwoKPiArCj4gICNkZWZpbmUgQ09ORklHCQkJCSgweGZmIDw8IDApCj4gICNkZWZpbmUgU0hPUlRf
UEFDS0VUCQkJMAo+ICAjZGVmaW5lIExPTkdfUEFDS0VUCQkJMgo+IEBAIC0xNTcsNiArMTYxLDcg
QEAgc3RydWN0IHBoeTsKPiAgCj4gIHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIHsKPiAgCWNv
bnN0IHUzMiByZWdfY21kcV9vZmY7Cj4gKwlib29sIGhhc19zaGFkb3dfY3RsOwo+ICB9Owo+ICAK
PiAgc3RydWN0IG10a19kc2kgewo+IEBAIC01OTQsNiArNTk5LDExIEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIAl9Cj4gIAo+ICAJbXRrX2RzaV9l
bmFibGUoZHNpKTsKPiArCj4gKwlpZiAoZHNpLT5kcml2ZXJfZGF0YS0+aGFzX3NoYWRvd19jdGwp
Cj4gKwkJd3JpdGVsKEZPUkNFX0NPTU1JVCB8IEJZUEFTU19TSEFET1csCj4gKwkJICAgICAgIGRz
aS0+cmVncyArIERTSV9TSEFET1dfREVCVUcpOwo+ICsKPiAgCW10a19kc2lfcmVzZXRfZW5naW5l
KGRzaSk7Cj4gIAltdGtfZHNpX3BoeV90aW1jb25maWcoZHNpKTsKPiAgCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
