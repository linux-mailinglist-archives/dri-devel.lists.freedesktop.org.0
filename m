Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408BF113CE3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169846F5C6;
	Thu,  5 Dec 2019 08:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA6AF6F5C6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:13:56 +0000 (UTC)
X-UUID: 1eae3ca3ba74429fa92ad57cedf1b72a-20191205
X-UUID: 1eae3ca3ba74429fa92ad57cedf1b72a-20191205
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 985730359; Thu, 05 Dec 2019 16:08:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 16:08:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 16:08:12 +0800
Message-ID: <1575533323.11236.5.camel@mtksdaap41>
Subject: Re: [PATCH v2] drm/mediatek: add ctm property support
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Thu, 5 Dec 2019 16:08:43 +0800
In-Reply-To: <1575277423-31182-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1575277423-31182-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AE4A3690827D802DD0F66D5D9CC38B9F4D54BDD034A40FED4BC1007954A2A5DE2000:8
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fYO5uWzyAp5Mepj7WHcXlxm3oDWpfSRVYpybAKDaNFk=; 
 b=LAPskKWOxSlESJShch3X6ttl0+yhEbrAkc1eBKguJxo/LQYFvly8fRyN/2ywTk86Q38tDMOLM/MT7vinMbIajkkvMHbdmnDNn0AeyxbxEZ01VYkdp3mTXilnmQO/UjkJ7U8+h0cLl9NkHL2Bo2GJ4UIvOKRjRhfMZv7R4WAPatI=;
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

SGksIFlvbmdxaWFuZzoNCg0KT24gTW9uLCAyMDE5LTEyLTAyIGF0IDE3OjAzICswODAwLCB5b25n
cWlhbmcubml1QG1lZGlhdGVrLmNvbSB3cm90ZToNCj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+IA0KPiBhZGQgY3RtIHByb3BlcnR5IHN1cHBvcnQN
Cj4gDQo+IENoYW5nZS1JZDogSTgxMTFkYTdiMzA5YjE4MDljNjMwMmU3NzQ4ZGQ5ZmQwNmRjOTdi
ZGUNCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
ICAgICB8IDE1ICsrKysrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmMgfCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDExICsrKysrKw0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCg0KW3NuaXBd
DQoNCg0KPiBAQCAtODcwLDYgKzg3NSwxMiBAQCBpbnQgbXRrX2RybV9jcnRjX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiwNCj4gIAkJfQ0KPiAgDQo+ICAJCW10a19jcnRjLT5kZHBf
Y29tcFtpXSA9IGNvbXA7DQo+ICsNCj4gKwkJaWYgKGNvbXBfaWQgPT0gRERQX0NPTVBPTkVOVF9D
Q09SUikNCj4gKwkJCWhhc19jdG0gPSB0cnVlOw0KPiArDQo+ICsJCWlmIChjb21wX2lkID09IERE
UF9DT01QT05FTlRfR0FNTUEpDQoNCk5vdCBvbmx5IEREUF9DT01QT05FTlRfR0FNTUEgaGFzIGdh
bW1hIGZ1bmN0aW9uLCBidXQgYWxzbw0KRERQX0NPTVBPTkVOVF9BQUwwIGFuZCBERFBfQ09NUE9O
RU5UX0FBTDEuIEkgdGhpbmsgaXQncyBubyBnb29kIHRvIHVzZQ0KY29tcF9pZCB0byBkZWNpZGUg
d2hhdCBmdW5jdGlvbiBvZiB0aGlzIGNvbXBvbmVudCBoYXMuIFRoZSBlYXN5IHdheSBpcw0KanVz
dCB0byBjaGVjayB3ZWF0aGVyIHRoZSBmdW5jdGlvbiBwb2ludCBleGlzdC4NCg0KUmVnYXJkcywN
CkNLDQoNCj4gKwkJCWdhbW1hX2x1dF9zaXplID0gTVRLX0xVVF9TSVpFOw0KPiAgCX0NCj4gIA0K
PiAgCWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnI7IGkrKykNCj4gQEAgLTg5
MSw3ICs5MDIsNyBAQCBpbnQgbXRrX2RybV9jcnRjX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtX2RldiwNCj4gIAlpZiAocmV0IDwgMCkNCj4gIAkJcmV0dXJuIHJldDsNCj4gIAlkcm1fbW9k
ZV9jcnRjX3NldF9nYW1tYV9zaXplKCZtdGtfY3J0Yy0+YmFzZSwgTVRLX0xVVF9TSVpFKTsNCj4g
LQlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCgmbXRrX2NydGMtPmJhc2UsIDAsIGZhbHNlLCBN
VEtfTFVUX1NJWkUpOw0KPiArCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KCZtdGtfY3J0Yy0+
YmFzZSwgMCwgaGFzX2N0bSwgZ2FtbWFfbHV0X3NpemUpOw0KPiAgCXByaXYtPm51bV9waXBlcysr
Ow0KPiAgI2lmZGVmIENPTkZJR19NVEtfQ01EUQ0KPiAgCW10a19jcnRjLT5jbWRxX2NsaWVudCA9
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
