Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A169DD0AC8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ED46E29B;
	Wed,  9 Oct 2019 09:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6CC36E29B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:17:59 +0000 (UTC)
X-UUID: 61f34e2b5982457c8d41060679298e92-20191009
X-UUID: 61f34e2b5982457c8d41060679298e92-20191009
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 546005503; Wed, 09 Oct 2019 17:17:51 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:17:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:17:48 +0800
Message-ID: <1570612671.7713.1.camel@mtksdaap41>
Subject: Re: [PATCH v5, 15/32] drm/mediatek: add commponent OVL_2L0
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:17:51 +0800
In-Reply-To: <1567090254-15566-16-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-16-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 681A688D04C331099D6C08507BCFD8CF80C3801578307909A3D5D16ED81D58D62000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29tbXBvbmVudCBPVkxf
MkwwCj4gCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0LTUuNSBbMV0sIHRoYW5rcy4KClsx
XQpodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy9jb21taXRz
L21lZGlhdGVrLWRybS1uZXh0LTUuNQoKUmVnYXJkcywKQ0sKCj4gU2lnbmVkLW9mZi1ieTogWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmMgfCAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmggfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4g
aW5kZXggYjE4YmQ2Ni4uNDIwMGY4OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0yMTksNiArMjE5LDcgQEAgc3RhdGljIHZvaWQgbXRr
X2dhbW1hX3NldChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLAo+ICAKPiAgc3RhdGljIGNvbnN0
IGNoYXIgKiBjb25zdCBtdGtfZGRwX2NvbXBfc3RlbVtNVEtfRERQX0NPTVBfVFlQRV9NQVhdID0g
ewo+ICAJW01US19ESVNQX09WTF0gPSAib3ZsIiwKPiArCVtNVEtfRElTUF9PVkxfMkxdID0gIm92
bF8ybCIsCj4gIAlbTVRLX0RJU1BfUkRNQV0gPSAicmRtYSIsCj4gIAlbTVRLX0RJU1BfV0RNQV0g
PSAid2RtYSIsCj4gIAlbTVRLX0RJU1BfQ09MT1JdID0gImNvbG9yIiwKPiBAQCAtMjU4LDYgKzI1
OSw3IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfbWF0Y2ggewo+ICAJW0REUF9DT01QT05FTlRfT0Qx
XQk9IHsgTVRLX0RJU1BfT0QsCTEsICZkZHBfb2QgfSwKPiAgCVtERFBfQ09NUE9ORU5UX09WTDBd
CT0geyBNVEtfRElTUF9PVkwsCTAsIE5VTEwgfSwKPiAgCVtERFBfQ09NUE9ORU5UX09WTDFdCT0g
eyBNVEtfRElTUF9PVkwsCTEsIE5VTEwgfSwKPiArCVtERFBfQ09NUE9ORU5UX09WTF8yTDBdCT0g
eyBNVEtfRElTUF9PVkxfMkwsCTAsIE5VTEwgfSwKPiAgCVtERFBfQ09NUE9ORU5UX1BXTTBdCT0g
eyBNVEtfRElTUF9QV00sCTAsIE5VTEwgfSwKPiAgCVtERFBfQ09NUE9ORU5UX1BXTTFdCT0geyBN
VEtfRElTUF9QV00sCTEsIE5VTEwgfSwKPiAgCVtERFBfQ09NUE9ORU5UX1BXTTJdCT0geyBNVEtf
RElTUF9QV00sCTIsIE5VTEwgfSwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmgKPiBpbmRleCA4ZDIyMDIyNC4uOWNhZWMyZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+IEBAIC0xNyw2ICsxNyw3IEBACj4g
IAo+ICBlbnVtIG10a19kZHBfY29tcF90eXBlIHsKPiAgCU1US19ESVNQX09WTCwKPiArCU1US19E
SVNQX09WTF8yTCwKPiAgCU1US19ESVNQX1JETUEsCj4gIAlNVEtfRElTUF9XRE1BLAo+ICAJTVRL
X0RJU1BfQ09MT1IsCj4gQEAgLTUwLDYgKzUxLDcgQEAgZW51bSBtdGtfZGRwX2NvbXBfaWQgewo+
ICAJRERQX0NPTVBPTkVOVF9PRDAsCj4gIAlERFBfQ09NUE9ORU5UX09EMSwKPiAgCUREUF9DT01Q
T05FTlRfT1ZMMCwKPiArCUREUF9DT01QT05FTlRfT1ZMXzJMMCwKPiAgCUREUF9DT01QT05FTlRf
T1ZMMSwKPiAgCUREUF9DT01QT05FTlRfUFdNMCwKPiAgCUREUF9DT01QT05FTlRfUFdNMSwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
