Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FDA3010
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA606E0F0;
	Fri, 30 Aug 2019 06:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88FE16E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:36:32 +0000 (UTC)
X-UUID: f87a23ab6bbe4b4194fdb629b252278d-20190830
X-UUID: f87a23ab6bbe4b4194fdb629b252278d-20190830
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1604358296; Fri, 30 Aug 2019 14:36:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 14:36:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 14:36:31 +0800
Message-ID: <1567146985.5942.22.camel@mtksdaap41>
Subject: Re: [PATCH v5, 31/32] drm/mediatek: add connection from RDMA0 to DSI0
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 14:36:25 +0800
In-Reply-To: <1567090254-15566-32-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-32-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 50A5F5C4F5D72EB5221C973FC30EC94B6C7215BA6C5A3B2CA8C5D11468BADDBA2000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9t
IFJETUEwIHRvIERTSTAKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVr
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggZmQzODY1OC4uNmE3Y2IxNSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTQyLDYgKzQyLDcgQEAK
PiAgI2RlZmluZSBPVkwxXzJMX01PVVRfRU5fUkRNQTEJCQkJQklUKDQpCj4gICNkZWZpbmUgRElU
SEVSMF9NT1VUX0lOX0RTSTAJCQkJQklUKDApCj4gICNkZWZpbmUgRElTUF9QQVRIMF9TRUxfSU5f
T1ZMMF8yTAkJCTB4MQo+ICsjZGVmaW5lIERTSTBfU0VMX0lOX1JETUEwCQkJCTB4MQo+ICAKPiAg
I2RlZmluZSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMAkJCTB4MmMKPiAgI2RlZmluZSBNVDI3MDFf
RElTUF9NVVRFWDBfU09GMAkJCTB4MzAKPiBAQCAtMzkxLDYgKzM5Miw5IEBAIHN0YXRpYyB1bnNp
Z25lZCBpbnQgbXRrX2RkcF9zZWxfaW4oY29uc3Qgc3RydWN0IG10a19tbXN5c19yZWdfZGF0YSAq
ZGF0YSwKPiAgCQkgICBuZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTApIHsKPiAgCQkqYWRkciA9
IE1UODE4M19ESVNQX1BBVEgwX1NFTF9JTjsKPiAgCQl2YWx1ZSA9IERJU1BfUEFUSDBfU0VMX0lO
X09WTDBfMkw7Cj4gKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEwICYmIG5l
eHQgPT0gRERQX0NPTVBPTkVOVF9EU0kwKSB7Cj4gKwkJKmFkZHIgPSBkYXRhLT5kc2kwX3NlbF9p
bjsKPiArCQl2YWx1ZSA9IERTSTBfU0VMX0lOX1JETUEwOwo+ICAJfSBlbHNlIHsKPiAgCQl2YWx1
ZSA9IDA7Cj4gIAl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
