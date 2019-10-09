Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E500ED0B21
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F88E6E949;
	Wed,  9 Oct 2019 09:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57DEE6E949
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:28:28 +0000 (UTC)
X-UUID: f7a9f139fedc4b6daa8d4ca89e78a73a-20191009
X-UUID: f7a9f139fedc4b6daa8d4ca89e78a73a-20191009
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1470652035; Wed, 09 Oct 2019 17:28:22 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:28:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:28:17 +0800
Message-ID: <1570613300.7713.7.camel@mtksdaap41>
Subject: Re: [PATCH v5, 23/32] drm/mediatek: distinguish ovl and ovl_2l by
 layer_nr
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:28:20 +0800
In-Reply-To: <1567090254-15566-24-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-24-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8828B06EB7BF6350F4191CA5E055A56083ECA0F38692A4F69FB7840773E99E852000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gZGlzdGluZ3Vpc2ggb3ZsIGFuZCBvdmxfMmwgYnkg
bGF5ZXJfbnIgd2hlbiBnZXQgY29tcAo+IGlkCj4gCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1u
ZXh0LTUuNSBbMV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRl
ay9saW51eC5naXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRybS1uZXh0LTUuNQoKUmVnYXJkcywK
Q0sKCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
ay5jb20+Cj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDkgKysrKysrLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwo+IGluZGV4IGViM2JmODUuLjUzZjM4
ODMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gQEAgLTMx
OCw3ICszMTgsMTIgQEAgc3RhdGljIGludCBtdGtfZGlzcF9vdmxfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgCWlmIChpcnEgPCAwKQo+ICAJCXJldHVybiBpcnE7Cj4gIAo+
IC0JY29tcF9pZCA9IG10a19kZHBfY29tcF9nZXRfaWQoZGV2LT5vZl9ub2RlLCBNVEtfRElTUF9P
VkwpOwo+ICsJcHJpdi0+ZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+ICsK
PiArCWNvbXBfaWQgPSBtdGtfZGRwX2NvbXBfZ2V0X2lkKGRldi0+b2Zfbm9kZSwKPiArCQkJCSAg
ICAgIHByaXYtPmRhdGEtPmxheWVyX25yID09IDQgPwo+ICsJCQkJICAgICAgTVRLX0RJU1BfT1ZM
IDoKPiArCQkJCSAgICAgIE1US19ESVNQX09WTF8yTCk7Cj4gIAlpZiAoY29tcF9pZCA8IDApIHsK
PiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpZGVudGlmeSBieSBhbGlhczogJWRcbiIsIGNv
bXBfaWQpOwo+ICAJCXJldHVybiBjb21wX2lkOwo+IEBAIC0zMzEsOCArMzM2LDYgQEAgc3RhdGlj
IGludCBtdGtfZGlzcF9vdmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
CQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiAtCXByaXYtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21h
dGNoX2RhdGEoZGV2KTsKPiAtCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KTsK
PiAgCj4gIAlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgaXJxLCBtdGtfZGlzcF9vdmxfaXJx
X2hhbmRsZXIsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
