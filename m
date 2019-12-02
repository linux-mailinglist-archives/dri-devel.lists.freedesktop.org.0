Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D3410E544
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 06:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E0D89F2A;
	Mon,  2 Dec 2019 05:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41DE389F08
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 05:24:46 +0000 (UTC)
X-UUID: f6777c57015a45348d910d14c3e42224-20191202
X-UUID: f6777c57015a45348d910d14c3e42224-20191202
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 847158368; Mon, 02 Dec 2019 13:24:34 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 13:24:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Dec 2019 13:24:14 +0800
Message-ID: <1575264270.16063.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Fix can't get component for external
 display plane.
From: CK Hu <ck.hu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 2 Dec 2019 13:24:30 +0800
In-Reply-To: <20191127100419.130300-1-pihsun@chromium.org>
References: <20191127100419.130300-1-pihsun@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 55615A5A8EC94A2605C689A4D635FDA520FEA8224007C4A9FD05769092DFE3A42000:8
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nHyM0wlDNnnCgrZ3XeFFZizqAnSwx9cK7hjQY20Jc9Q=; 
 b=eXjKCPqaIe1pirlqnlQVTpvo1S6AgRapAviK2OyFlcb1Bx5MBaPcfXsEVGH8FWRfWeo52oSSRXy5widrOcSuA7S/jpivUYHrmrREICaonpbHZ19mAAluQlnPR7uTW1tlrfo6sfK4m+UU4kQayEXAsa8qPC8ZH7xwu9ZSlXBGYp4=;
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFBpLUhzdW46DQoNCg0KT24gV2VkLCAyMDE5LTExLTI3IGF0IDE4OjA0ICswODAwLCBQaS1I
c3VuIFNoaWggd3JvdGU6DQo+IEZyb206IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPg0KPiANCj4gVGhlIG9yaWdpbmFsIGxvZ2ljIGlzIG9rIGZvciBwcmltYXJ5IGRp
c3BsYXksIGJ1dCB3aWxsIG5vdCBmaW5kIG91dA0KPiBjb21wb25lbnQgZm9yIGV4dGVybmFsIGRp
c3BsYXkuDQo+IA0KPiBGb3IgZXhhbXBsZSwgcGxhbmUtPmluZGV4IGlzIDYgZm9yIGV4dGVybmFs
IGRpc3BsYXksIGJ1dCB0aGVyZSBhcmUgb25seQ0KPiAyIGxheWVyIG5yIGluIGV4dGVybmFsIGRp
c3BsYXksIGFuZCB0aGlzIGNvbmRpdGlvbiB3aWxsIG5ldmVyIGhhcHBlbjoNCj4gaWYgKHBsYW5l
LT5pbmRleCA8IChjb3VudCArIG10a19kZHBfY29tcF9sYXllcl9ucihjb21wKSkpDQo+IA0KPiBG
aXggdGhpcyBieSB1c2luZyB0aGUgb2Zmc2V0IG9mIHRoZSBwbGFuZSB0byBtdGtfY3J0Yy0+cGxh
bmVzIGFzIGluZGV4LA0KPiBpbnN0ZWFkIG9mIHBsYW5lLT5pbmRleC4NCg0KUmV2aWV3ZWQtYnk6
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBGaXhl
czogZDZiNTNmNjgzNTZmICgiZHJtL21lZGlhdGVrOiBBZGQgaGVscGVyIHRvIGdldCBjb21wb25l
bnQgZm9yIGEgcGxhbmUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUGktSHN1biBTaGloIDxwaWhz
dW5AY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYyB8IDUgKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jDQo+IGluZGV4IGY4MGE4YmE3NTk3Ny4uYjM0ZTdkNzA3MDJhIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+IEBAIC0yMTUsMTEgKzIxNSwxMiBAQCBz
dHJ1Y3QgbXRrX2RkcF9jb21wICptdGtfZHJtX2RkcF9jb21wX2Zvcl9wbGFuZShzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsDQo+ICAJc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMgPSB0b19tdGtf
Y3J0YyhjcnRjKTsNCj4gIAlzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wOw0KPiAgCWludCBpLCBj
b3VudCA9IDA7DQo+ICsJdW5zaWduZWQgaW50IGxvY2FsX2luZGV4ID0gcGxhbmUgLSBtdGtfY3J0
Yy0+cGxhbmVzOw0KPiAgDQo+ICAJZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9u
cjsgaSsrKSB7DQo+ICAJCWNvbXAgPSBtdGtfY3J0Yy0+ZGRwX2NvbXBbaV07DQo+IC0JCWlmIChw
bGFuZS0+aW5kZXggPCAoY291bnQgKyBtdGtfZGRwX2NvbXBfbGF5ZXJfbnIoY29tcCkpKSB7DQo+
IC0JCQkqbG9jYWxfbGF5ZXIgPSBwbGFuZS0+aW5kZXggLSBjb3VudDsNCj4gKwkJaWYgKGxvY2Fs
X2luZGV4IDwgKGNvdW50ICsgbXRrX2RkcF9jb21wX2xheWVyX25yKGNvbXApKSkgew0KPiArCQkJ
KmxvY2FsX2xheWVyID0gbG9jYWxfaW5kZXggLSBjb3VudDsNCj4gIAkJCXJldHVybiBjb21wOw0K
PiAgCQl9DQo+ICAJCWNvdW50ICs9IG10a19kZHBfY29tcF9sYXllcl9ucihjb21wKTsNCj4gDQo+
IGJhc2UtY29tbWl0OiAxODc1ZmYzMjBmMTRhZmUyMTczMWE2ZTRjN2I0NmRkMzNlNDVkZmFhDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
