Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5ED898D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 10:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5E189EFF;
	Mon, 12 Aug 2019 08:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id D61B889EFF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 08:40:51 +0000 (UTC)
X-UUID: bb1fdf773bde477f920666978733070e-20190812
X-UUID: bb1fdf773bde477f920666978733070e-20190812
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1888449034; Mon, 12 Aug 2019 16:40:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 12 Aug 2019 16:40:39 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 12 Aug 2019 16:40:39 +0800
Message-ID: <1565599241.3510.0.camel@mtksdaap41>
Subject: Re: [PATCH v6 2/7] drm/mediatek: fixes CMDQ reg address of mt8173
 is different with mt2701
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 12 Aug 2019 16:40:41 +0800
In-Reply-To: <20190811104008.53372-3-jitao.shi@mediatek.com>
References: <20190811104008.53372-1-jitao.shi@mediatek.com>
 <20190811104008.53372-3-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24842.000
X-TM-AS-Result: No-13.018600-8.000000-10
X-TMASE-MatchedRID: L8tZF6zWW2rmLzc6AOD8DfHkpkyUphL9SWg+u4ir2NNquuOqohJ0c+8i
 8dew1/WnrdoLblq9S5olCvqYcPZDx7VdhtJxXnUI8pRHzcG+oi1vV3/OnMClWlVkJxysad/Iu/0
 GhfXBucU9osQh+w/oGQ81SqsdNAtCQSWnAG0egjGiAZ3zAhQYgn607foZgOWyf2dEskHXJhBRLT
 ERhRg1g3YZvR6JDTidiNK3wKXSWGL+651tSm/JkUeDzzDviY0OGEfoClqBl86bKItl61J/ycnjL
 TA/UDoAoTCA5Efyn8CNo+PRbWqfRDsAVzN+Ov/sSGDwQigllyZJi14HLH6kDpCPr2awuHdZ/xhI
 NXxE7nbxWl/hXOyjTA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.018600-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24842.000
X-TM-SNTS-SMTP: C14B02D73BB3E63EA400F57743FC20A46C0A1B48032BFB28AC7C29B36717EC8C2000:8
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

SGksIEppdGFvOgoKT24gU3VuLCAyMDE5LTA4LTExIGF0IDE4OjQwICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gQ29uZmlnIHRoZSBkaWZmZXJlbnQgQ01EUSByZWcgYWRkcmVzcyBpbiBkcml2ZXIg
ZGF0YS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAyOSArKysr
KysrKysrKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBp
bmRleCA1MmI0OWRhZWVkOWYuLmFjOGU4MGUzNzlmNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwo+IEBAIC0xMjMsNyArMTIzLDYgQEAKPiAgI2RlZmluZSBWTV9DTURfRU4JCQlC
SVQoMCkKPiAgI2RlZmluZSBUU19WRlBfRU4JCQlCSVQoNSkKPiAgCj4gLSNkZWZpbmUgRFNJX0NN
RFEwCQkweDE4MAo+ICAjZGVmaW5lIENPTkZJRwkJCQkoMHhmZiA8PCAwKQo+ICAjZGVmaW5lIFNI
T1JUX1BBQ0tFVAkJCTAKPiAgI2RlZmluZSBMT05HX1BBQ0tFVAkJCTIKPiBAQCAtMTQ4LDYgKzE0
NywxMCBAQAo+ICAKPiAgc3RydWN0IHBoeTsKPiAgCj4gK3N0cnVjdCBtdGtfZHNpX2RyaXZlcl9k
YXRhIHsKPiArCWNvbnN0IHUzMiByZWdfY21kcV9vZmY7Cj4gK307Cj4gKwo+ICBzdHJ1Y3QgbXRr
X2RzaSB7Cj4gIAlzdHJ1Y3QgbXRrX2RkcF9jb21wIGRkcF9jb21wOwo+ICAJc3RydWN0IGRldmlj
ZSAqZGV2Owo+IEBAIC0xNzQsNiArMTc3LDcgQEAgc3RydWN0IG10a19kc2kgewo+ICAJYm9vbCBl
bmFibGVkOwo+ICAJdTMyIGlycV9kYXRhOwo+ICAJd2FpdF9xdWV1ZV9oZWFkX3QgaXJxX3dhaXRf
cXVldWU7Cj4gKwljb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSAqZHJpdmVyX2RhdGE7
Cj4gIH07Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGtfZHNpICplbmNvZGVyX3RvX2Rz
aShzdHJ1Y3QgZHJtX2VuY29kZXIgKmUpCj4gQEAgLTkzNiw2ICs5NDAsNyBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHNpX2NtZHEoc3RydWN0IG10a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0IG1pcGlfZHNp
X21zZyAqbXNnKQo+ICAJY29uc3QgY2hhciAqdHhfYnVmID0gbXNnLT50eF9idWY7Cj4gIAl1OCBj
b25maWcsIGNtZHFfc2l6ZSwgY21kcV9vZmYsIHR5cGUgPSBtc2ctPnR5cGU7Cj4gIAl1MzIgcmVn
X3ZhbCwgY21kcV9tYXNrLCBpOwo+ICsJdTMyIHJlZ19jbWRxX29mZiA9IGRzaS0+ZHJpdmVyX2Rh
dGEtPnJlZ19jbWRxX29mZjsKPiAgCj4gIAlpZiAoTVRLX0RTSV9IT1NUX0lTX1JFQUQodHlwZSkp
Cj4gIAkJY29uZmlnID0gQlRBOwo+IEBAIC05NTUsOSArOTYwLDExIEBAIHN0YXRpYyB2b2lkIG10
a19kc2lfY21kcShzdHJ1Y3QgbXRrX2RzaSAqZHNpLCBjb25zdCBzdHJ1Y3QgbWlwaV9kc2lfbXNn
ICptc2cpCj4gIAl9Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8IG1zZy0+dHhfbGVuOyBpKyspCj4g
LQkJd3JpdGViKHR4X2J1ZltpXSwgZHNpLT5yZWdzICsgRFNJX0NNRFEwICsgY21kcV9vZmYgKyBp
KTsKPiArCQltdGtfZHNpX21hc2soZHNpLCAocmVnX2NtZHFfb2ZmICsgY21kcV9vZmYgKyBpKSAm
ICh+MHgzVSksCj4gKwkJCSAgICAgKDB4ZmZVTCA8PCAoKChpICsgY21kcV9vZmYpICYgM1UpICog
OFUpKSwKPiArCQkJICAgICB0eF9idWZbaV0gPDwgKCgoaSArIGNtZHFfb2ZmKSAmIDNVKSAqIDhV
KSk7CgpJZiB3cml0ZWIoKSBoYXMgdGhlIHNhbWUgcHJvYmxlbSBpbiBNVDI3MDEsIEkgdGhpbmsg
d2UgbmVlZCBhIHBhdGNoIHRoYXQKanVzdCBjaGFuZ2Ugd3JpdGViKCkgdG8gbXRrX2RzaV9tYXNr
KCksIGFuZCB0aGVuIGEgcGF0Y2ggdG8gZml4IENNRFEgcmVnCmFkZHJlc3Mgb2YgTVQ4MTczLiBT
byBicmVhayB0aGlzIHBhdGNoIGludG8gdHdvIHBhdGNoZXMuCgpSZWdhcmRzLApDSwoKPiAgCj4g
LQltdGtfZHNpX21hc2soZHNpLCBEU0lfQ01EUTAsIGNtZHFfbWFzaywgcmVnX3ZhbCk7Cj4gKwlt
dGtfZHNpX21hc2soZHNpLCByZWdfY21kcV9vZmYsIGNtZHFfbWFzaywgcmVnX3ZhbCk7Cj4gIAlt
dGtfZHNpX21hc2soZHNpLCBEU0lfQ01EUV9TSVpFLCBDTURRX1NJWkUsIGNtZHFfc2l6ZSk7Cj4g
IH0KPiAgCj4gQEAgLTExMDEsNiArMTEwOCw4IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl91
bnJlZ2lzdGVyX2hvc3Q7Cj4gIAo+ICsJZHNpLT5kcml2ZXJfZGF0YSA9IG9mX2RldmljZV9nZXRf
bWF0Y2hfZGF0YShkZXYpOwo+ICsKPiAgCWRzaS0+ZW5naW5lX2NsayA9IGRldm1fY2xrX2dldChk
ZXYsICJlbmdpbmUiKTsKPiAgCWlmIChJU19FUlIoZHNpLT5lbmdpbmVfY2xrKSkgewo+ICAJCXJl
dCA9IFBUUl9FUlIoZHNpLT5lbmdpbmVfY2xrKTsKPiBAQCAtMTE5NCw5ICsxMjAzLDE5IEBAIHN0
YXRpYyBpbnQgbXRrX2RzaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
CXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kc2lfZHJpdmVy
X2RhdGEgbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSA9IHsKPiArCS5yZWdfY21kcV9vZmYgPSAweDIw
MCwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBt
dDI3MDFfZHNpX2RyaXZlcl9kYXRhID0gewo+ICsJLnJlZ19jbWRxX29mZiA9IDB4MTgwLAo+ICt9
Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RzaV9vZl9tYXRj
aFtdID0gewo+IC0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZHNpIiB9LAo+IC0J
eyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiB9LAo+ICsJeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDI3MDEtZHNpIiwKPiArCSAgLmRhdGEgPSAmbXQyNzAxX2RzaV9kcml2
ZXJfZGF0YSB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiwKPiAr
CSAgLmRhdGEgPSAmbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSB9LAo+ICAJeyB9LAo+ICB9Owo+ICAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
