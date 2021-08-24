Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC1B3F5782
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 07:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFD789DBC;
	Tue, 24 Aug 2021 05:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943089DBC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 05:07:57 +0000 (UTC)
X-UUID: 3bf5dd0fe9544c018f4735cbc9df4ffa-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HXfD2dpVdefMeboFVp42P1mXdWpz9qejPwkSFWMGwjA=; 
 b=o7LnxyPuhkMHDC59yx4anqjwX//PYd9leWgsmRK8HgVzhle2VbsK0uNI92SpX4xLrJoSxKyoPdeTVBi+rMKmfEdfenC6RC3jo504w3lyUKlk2v9aLo6o4IMBqTVmt+tbu8A4FbPD4DKZpvm5ZHKmtJH9CgEYAgZ4ND2xDk6F0vI=;
X-UUID: 3bf5dd0fe9544c018f4735cbc9df4ffa-20210824
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1442874073; Tue, 24 Aug 2021 13:07:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 13:07:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 13:07:50 +0800
Message-ID: <9ce23e77e8ea5706b1d52700d655958f49eb911e.camel@mediatek.com>
Subject: Re: [PATCH v3 02/15] dt-bindings: mediatek: add vdosys1 MERGE
 definition for mt8195
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
Date: Tue, 24 Aug 2021 13:07:50 +0800
In-Reply-To: <CAAOTY_-mJ0WHK0pXqASprrc7GW0R_ZTRmJ8Yo8pu9js-cQ5HAw@mail.gmail.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-3-nancy.lin@mediatek.com>
 <CAAOTY_-mJ0WHK0pXqASprrc7GW0R_ZTRmJ8Yo8pu9js-cQ5HAw@mail.gmail.com>
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

SGkgQ2h1bi1LdWFuZywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBGcmksIDIwMjEt
MDgtMjAgYXQgMDc6MjUgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBOYW5jeToN
Cj4gDQo+IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQ45pyI
MTjml6Ug6YCx5LiJIOS4i+WNiDU6MTjlr6vpgZPvvJoNCj4gPiANCj4gPiBBZGQgdmRvc3lzMSBN
RVJHRSBkZWZpbml0aW9uLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFu
Y3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sICAgIHwNCj4gPiAyICsrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZXJnZQ0KPiA+IC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZQ0KPiA+IC55YW1sDQo+
ID4gaW5kZXggMWEyN2IwMzcwODZiLi5iYTFlMGM4Mzc5ODggMTAwNjQ0DQo+ID4gLS0tDQo+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxtZXJnZQ0KPiA+IC55YW1sDQo+ID4gKysrDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZQ0KPiA+IC55YW1s
DQo+ID4gQEAgLTIzLDYgKzIzLDggQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgIC0gY29u
c3Q6IG1lZGlhdGVrLG10ODE3My1kaXNwLW1lcmdlDQo+ID4gICAgICAgIC0gaXRlbXM6DQo+ID4g
ICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJnZQ0KPiA+ICsgICAg
ICAtIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LXZkbzEt
bWVyZ2UNCj4gDQo+IEkgZG9uJ3Qga25vdyB3aHkgY3JlYXRlIGEgbmV3IG1lcmdlIGZvciBtdDgx
OTUuIFByb3ZpZGUgbW9yZQ0KPiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZGlmZmVyZW5jZSBvZiB0
aGVzZSB0d28gbWVyZ2UuDQo+IA0KQ29tcGFyZWQgd2l0aCBNVDgxOTUgbWVyZ2UwIGFuZCBtZXJn
ZTUsIG1lcmdlMX40IGhhcyBtb3JlIG11dGUNCmZ1bmN0aW9uLiBJIHdpbGwgcmVtb3ZlIHRoaXMg
bmV3IGNvbXBhdGlibGUsIG1vdmUgb3ZsX2FkYXB0b3IgbWVyZ2UgdG8NCm1lcmdlIGNvbW1vbiBk
cml2ZXIsIGFuZCBhZGQgbmV3IG1lcmdlIGJpbmRpbmcgcHJvcGVydHkgdG8gaW5jcmVhc2UNCm11
dGUgZnVuY3Rpb24uDQoNCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQo+ID4gDQo+ID4g
ICAgcmVnOg0KPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPiAtLQ0KPiA+IDIuMTguMA0KPiA+IA0K

