Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4391122D7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 07:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3F6E888;
	Wed,  4 Dec 2019 06:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 525C36E888
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 06:24:35 +0000 (UTC)
X-UUID: 11f23f8276b24a098e06585469657245-20191204
X-UUID: 11f23f8276b24a098e06585469657245-20191204
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1899191122; Wed, 04 Dec 2019 14:24:31 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 14:24:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 14:23:36 +0800
Message-ID: <1575440670.29074.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 4/6] drm/mediatek: remove unused external function
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Wed, 4 Dec 2019 14:24:30 +0800
In-Reply-To: <20191203071036.14158-5-bibby.hsieh@mediatek.com>
References: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
 <20191203071036.14158-5-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=onmReCYD7W/Vup2pHh/rp8OuhOnAHM7QSGZUnYNplWU=; 
 b=SSiHqlRMM5/wJhvJIrH0KzvUl4ot25xcvYXU4Mvpw4bv/Nb4o34dPP4JdmrnoCrDZDd8NeWymEQXxgvfnS80DkzMrEYD5Fp/WiSa/WmbbTXT7qwlZ7opkrwDH20cpt5u3oop71JLU26vP5gDKbsduJdeEzb1P2PdH/KzGDtoTFs=;
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEJpYmJ5Og0KDQpPbiBUdWUsIDIwMTktMTItMDMgYXQgMTU6MTAgKzA4MDAsIEJpYmJ5IEhz
aWVoIHdyb3RlOg0KPiBsYXllcl9vbiBhbmQgbGF5ZXJfb2ZmIGJvdGggYXJlIHVudXNlZCBleHRl
cm5hbCBmdW5jdGlvbiwNCj4gcmVtb3ZlIHRoZW0gZnJvbSBtdGtfZGRwX2NvbXBfZnVuY3Mgc3Ry
dWN0dXJlLg0KPiANCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoN
Cj4gU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgIHwg
IDIgLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAx
NiAtLS0tLS0tLS0tLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE4IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBpbmRleCA3MjJh
NWFkYjc5ZGMuLjhhMzIyNDg2NzFjMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuYw0KPiBAQCAtMzE0LDggKzMxNCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2RkcF9jb21wX2Z1bmNzIG10a19kaXNwX292bF9mdW5jcyA9IHsNCj4gIAkuZGlzYWJsZV92
YmxhbmsgPSBtdGtfb3ZsX2Rpc2FibGVfdmJsYW5rLA0KPiAgCS5zdXBwb3J0ZWRfcm90YXRpb25z
ID0gbXRrX292bF9zdXBwb3J0ZWRfcm90YXRpb25zLA0KPiAgCS5sYXllcl9uciA9IG10a19vdmxf
bGF5ZXJfbnIsDQo+IC0JLmxheWVyX29uID0gbXRrX292bF9sYXllcl9vbiwNCj4gLQkubGF5ZXJf
b2ZmID0gbXRrX292bF9sYXllcl9vZmYsDQo+ICAJLmxheWVyX2NoZWNrID0gbXRrX292bF9sYXll
cl9jaGVjaywNCj4gIAkubGF5ZXJfY29uZmlnID0gbXRrX292bF9sYXllcl9jb25maWcsDQo+ICAJ
LmJnY2xyX2luX29uID0gbXRrX292bF9iZ2Nscl9pbl9vbiwNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oDQo+IGluZGV4IGVjNTVjNzQ4OGNjMy4uNjUzZWYx
Y2IzNzQ4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmgNCj4gQEAgLTc5LDggKzc5LDYgQEAgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyB7DQo+
ICAJdm9pZCAoKmRpc2FibGVfdmJsYW5rKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsNCj4g
IAl1bnNpZ25lZCBpbnQgKCpzdXBwb3J0ZWRfcm90YXRpb25zKShzdHJ1Y3QgbXRrX2RkcF9jb21w
ICpjb21wKTsNCj4gIAl1bnNpZ25lZCBpbnQgKCpsYXllcl9ucikoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCk7DQo+IC0Jdm9pZCAoKmxheWVyX29uKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21w
LCB1bnNpZ25lZCBpbnQgaWR4KTsNCj4gLQl2b2lkICgqbGF5ZXJfb2ZmKShzdHJ1Y3QgbXRrX2Rk
cF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgaWR4KTsNCj4gIAlpbnQgKCpsYXllcl9jaGVjayko
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCwNCj4gIAkJCSAgIHVuc2lnbmVkIGludCBpZHgsDQo+
ICAJCQkgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpzdGF0ZSk7DQo+IEBAIC0xNTEsMjAgKzE0
OSw2IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IG10a19kZHBfY29tcF9sYXllcl9ucihz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC1z
dGF0aWMgaW5saW5lIHZvaWQgbXRrX2RkcF9jb21wX2xheWVyX29uKHN0cnVjdCBtdGtfZGRwX2Nv
bXAgKmNvbXAsDQo+IC0JCQkJCSB1bnNpZ25lZCBpbnQgaWR4KQ0KPiAtew0KPiAtCWlmIChjb21w
LT5mdW5jcyAmJiBjb21wLT5mdW5jcy0+bGF5ZXJfb24pDQo+IC0JCWNvbXAtPmZ1bmNzLT5sYXll
cl9vbihjb21wLCBpZHgpOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgbXRrX2Rk
cF9jb21wX2xheWVyX29mZihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLA0KPiAtCQkJCQkgIHVu
c2lnbmVkIGludCBpZHgpDQo+IC17DQo+IC0JaWYgKGNvbXAtPmZ1bmNzICYmIGNvbXAtPmZ1bmNz
LT5sYXllcl9vZmYpDQo+IC0JCWNvbXAtPmZ1bmNzLT5sYXllcl9vZmYoY29tcCwgaWR4KTsNCj4g
LX0NCj4gLQ0KPiAgc3RhdGljIGlubGluZSBpbnQgbXRrX2RkcF9jb21wX2xheWVyX2NoZWNrKHN0
cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsDQo+ICAJCQkJCSAgIHVuc2lnbmVkIGludCBpZHgsDQo+
ICAJCQkJCSAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnN0YXRlKQ0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
