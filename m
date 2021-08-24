Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F63F576D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 06:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3276589D60;
	Tue, 24 Aug 2021 04:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E740589D60
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 04:53:55 +0000 (UTC)
X-UUID: e6bd17fe92f54feab2fd7170476d0670-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VmCTcsc6OQs5xiP6AIS4kmDLg5iYQQYaJHtFNW6YXx8=; 
 b=RSb0ztnU3iHceaO8TeyuWpmjPOHYdgblen6gu/qvASAYzDQOOn0APQN+oPPIdKYZJwcPo3UKEQU/dmvXnSAuyu/we1cqFa4TJLAOGe73nyduF7WHCBlbKDwqTu1dkmxJtTv0jM0+yxb/UjUW/jY0XcqlGj1+3lLNdtWboGI5Z5k=;
X-UUID: e6bd17fe92f54feab2fd7170476d0670-20210824
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 831010832; Tue, 24 Aug 2021 12:53:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 12:53:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 12:53:49 +0800
Message-ID: <231a458307f3037034cfbcb9254b5d6b20df7922.camel@mediatek.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Rob Herring"
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Tue, 24 Aug 2021 12:53:49 +0800
In-Reply-To: <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
 <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2h1bi1LdWFuZywNCg0KCVRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT24gU2F0LCAyMDIx
LTA4LTIxIGF0IDA3OjM3ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmFuY3k6
DQo+IA0KPiBOYW5jeS5MaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0OOac
iDE45pelIOmAseS4iSDkuIvljYg1OjE45a+r6YGT77yaDQo+ID4gDQo+ID4gQWRkIGRyaXZlciBk
YXRhIG9mIG10ODE5NSB2ZG9zeXMxIHRvIG1lZGlhdGVrLWRybSBhbmQgbW9kaWZ5IGRybQ0KPiA+
IGZvcg0KPiA+IG11bHRpLW1tc3lzIHN1cHBvcnQuIFRoZSB0d28gbW1zeXMgKHZkb3N5czAgYW5k
IHZkb3N5czEpIHdpbGwgYnJpbmcNCj4gPiB1cCB0d28gZHJtIGRyaXZlcnMsIG9ubHkgb25lIGRy
bSBkcml2ZXIgcmVnaXN0ZXIgYXMgdGhlIGRybSBkZXZpY2UuDQo+ID4gRWFjaCBkcm0gZHJpdmVy
IGJpbmRzIGl0cyBvd24gY29tcG9uZW50LiBUaGUgZmlyc3QgYmluZCBkcm0gZHJpdmVyDQo+ID4g
d2lsbCBhbGxvY2F0ZSB0aGUgZHJtIGRldmljZSwgYW5kIHRoZSBsYXN0IGJpbmQgZHJtIGRyaXZl
cg0KPiA+IHJlZ2lzdGVycw0KPiA+IHRoZSBkcm0gZGV2aWNlIHRvIGRybSBjb3JlLiBFYWNoIGNy
dGMgcGF0aCBpcyBjcmVhdGVkIHdpdGggdGhlDQo+ID4gY29ycmVzcG9uZGluZyBkcm0gZHJpdmVy
IGRhdGEuDQo+IA0KPiBTZXBhcmF0ZSB0aGlzIHBhdGNoIHRvIHR3byBwYXRjaC4gT25lIGlzIHN1
cHBvcnQgdHdvIG1tc3lzLCBhbmQNCj4gYW5vdGhlciBvbmUgaXMgc3VwcG9ydCBtdDgxOTUgdmRv
c3lzMS4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KT0ssIEkgd2lsbCBzZXBh
cmF0ZSBpdCBpbnRvIHR3byBwYXRjaGVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5
LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMgICB8ICAgNCArDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgfCAgMjUgKy0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAgMyArLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgIDE1ICsNCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8ICAgMSArDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgfCAzNzINCj4gPiArKysrKysr
KysrKysrKysrLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
aCAgICAgIHwgICA4ICstDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMzU0IGluc2VydGlvbnMoKyks
IDc0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IA0K

