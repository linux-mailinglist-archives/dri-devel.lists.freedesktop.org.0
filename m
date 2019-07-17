Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB396B6FE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 08:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C0C6E239;
	Wed, 17 Jul 2019 06:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 866696E239
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 06:55:05 +0000 (UTC)
X-UUID: 9f1c975c797c4aa99fc512c38799216e-20190717
X-UUID: 9f1c975c797c4aa99fc512c38799216e-20190717
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1132981241; Wed, 17 Jul 2019 14:55:03 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 14:55:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 14:55:01 +0800
Message-ID: <1563346501.29169.25.camel@mtksdaap41>
Subject: Re: [PATCH v4, 24/33] drm/mediatek: distinguish ovl and ovl_2l by
 layer_nr
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 14:55:01 +0800
In-Reply-To: <1562625253-29254-25-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-25-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 11F1DE6BD2C0561D80B2B9B084DC8B4CE48F7F7536BCB170DD002279A4AB79AD2000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozNCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gZGlzdGluZ3Vpc2ggb3ZsIGFuZCBvdmxfMmwgYnkg
bGF5ZXJfbnIgd2hlbiBnZXQgY29tcAo+IGlkCj4gCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5n
Lm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYyB8IDkgKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmwuYwo+IGluZGV4IDhjYTQ5NjUuLjdlOTk4MjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jCj4gQEAgLTMyNiw3ICszMjYsMTIgQEAgc3RhdGljIGludCBtdGtf
ZGlzcF9vdmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChpcnEg
PCAwKQo+ICAJCXJldHVybiBpcnE7Cj4gIAo+IC0JY29tcF9pZCA9IG10a19kZHBfY29tcF9nZXRf
aWQoZGV2LT5vZl9ub2RlLCBNVEtfRElTUF9PVkwpOwo+ICsJcHJpdi0+ZGF0YSA9IG9mX2Rldmlj
ZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+ICsKPiArCWNvbXBfaWQgPSBtdGtfZGRwX2NvbXBfZ2V0
X2lkKGRldi0+b2Zfbm9kZSwKPiArCQkJCSAgICAgIHByaXYtPmRhdGEtPmxheWVyX25yID09IDQg
Pwo+ICsJCQkJICAgICAgTVRLX0RJU1BfT1ZMIDoKPiArCQkJCSAgICAgIE1US19ESVNQX09WTF8y
TCk7Cj4gIAlpZiAoY29tcF9pZCA8IDApIHsKPiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBp
ZGVudGlmeSBieSBhbGlhczogJWRcbiIsIGNvbXBfaWQpOwo+ICAJCXJldHVybiBjb21wX2lkOwo+
IEBAIC0zMzksOCArMzQ0LDYgQEAgc3RhdGljIGludCBtdGtfZGlzcF9vdmxfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiAtCXBy
aXYtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiAtCj4gIAlwbGF0Zm9y
bV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KTsKPiAgCj4gIAlyZXQgPSBkZXZtX3JlcXVlc3RfaXJx
KGRldiwgaXJxLCBtdGtfZGlzcF9vdmxfaXJxX2hhbmRsZXIsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
