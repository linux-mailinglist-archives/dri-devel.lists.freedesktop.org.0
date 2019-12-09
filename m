Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B01165E2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 05:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6E96E04E;
	Mon,  9 Dec 2019 04:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1D7F6E04E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 04:48:45 +0000 (UTC)
X-UUID: 7db8f50916fd4b488594c5170206f671-20191209
X-UUID: 7db8f50916fd4b488594c5170206f671-20191209
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 75638292; Mon, 09 Dec 2019 12:48:41 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 12:47:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 12:48:31 +0800
Message-ID: <1575866920.32541.4.camel@mtksdaap41>
Subject: Re: [PATCH v4 0/7] drm/mediatek: fix cursor issue and apply CMDQ in
 MTK DRM
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Mon, 9 Dec 2019 12:48:40 +0800
In-Reply-To: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
References: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 55801605C57CA610921F609EFECE446D43442399BAEEDB01006B5353DB3550B02000:8
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YcgZtnqzg5VT3Hj1syPa/xCvJ6RF8xt8gpVFl7qpqMI=; 
 b=glfGCYkYNOGN2BY8rePw6TlmD+rXhi9x84TLt5gd7g8twW+mDutlcXvD5XlXPH08bgfg2ODPnpB19AtwcksCXZVQF0cTPMErgDUM14//VvalbDh2WG+t+wLFqFUFXUNNSm3Gk09ffGTyGVRCt37DfFas2+16hPUfP3jR/iH8dVc=;
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

SGksIEJpYmJ5Og0KDQpJJ3ZlIHRyaWVkIHRvIGFwcGx5IHRoaXMgc2VyaWVzIHRvIDUuNS1yYzEs
IGJ1dCB0aGVyZSBhcmUgbWFueQ0KY29uZmxpY3RzLiBQbGVhc2UgcmVzZW5kIHRoaXMgc2VyaWVz
IGJhc2VkIG9uIDUuNS1yYzEuDQoNCkFuZCBJJ3ZlIGZvdW5kIHRoYXQgaWYgSSBjb25maWcgQ09O
RklHX01US19DTURRPW0sIHRoZSBjb2RlIGluc2lkZQ0KJyNpZmRlZiBDT05GSUdfTVRLX0NNRFEn
IHdvdWxkIG5vdCBiZSBidWlsdC4gSSB0aGluayB5b3Ugc2hvdWxkIGNoYW5nZQ0KdGhpcyB0byAn
I2lmIElTX0VOQUJMRUQoQ09ORklHX01US19DTURRKScuDQoNClJlZ2FyZHMsDQpDSw0KDQpPbiBU
aHUsIDIwMTktMTItMDUgYXQgMTc6MjcgKzA4MDAsIEJpYmJ5IEhzaWVoIHdyb3RlOg0KPiBUaGUg
Q01EUSAoQ29tbWFuZCBRdWV1ZSkgaW4gTVQ4MTgzIGlzIHVzZWQgdG8gaGVscCB1cGRhdGUgYWxs
DQo+IHJlbGV2YW50IGRpc3BsYXkgY29udHJvbGxlciByZWdpc3RlcnMgd2l0aCBjcml0aWNhbCB0
aW1lIGxpbWF0aW9uLg0KPiBUaGlzIHBhdGNoIGFkZCBjbWRxIGludGVyZmFjZSBpbiBkZHBfY29t
cCBpbnRlcmZhY2UsIGxldCBhbGwNCj4gZGRwX2NvbXAgaW50ZXJmYWNlIGNhbiBzdXBwb3J0IGNw
dS9jbWRxIGZ1bmN0aW9uIGF0IHRoZSBzYW1lIHRpbWUuDQo+IA0KPiBUaGVzZSBwYXRjaGVzIGFs
c28gY2FuIGZpeHVwIGN1cnNvciBtb3ZpbmcgaXMgbm90IHNtb290aA0KPiB3aGVuIGhlYXZ5IGxv
YWQgaW4gd2ViZ2wuDQo+IA0KPiBUaGlzIHBhdGNoIGRlcGVuZHMgb24gcHRhY2g6DQo+IGFkZCBk
cm0gc3VwcG9ydCBmb3IgTVQ4MTgzDQo+IChodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2Nv
dmVyLzExMTIxNTE5LykNCj4gc3VwcG9ydCBnY2Ugb24gbXQ4MTgzIHBsYXRmb3JtDQo+IChodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExMjU1MTQ3KQ0KPiBkcm0vbWVkaWF0ZWs6
IFJlZmFjdG9yIHBsYW5lIGluaXQvY2hlY2sgYW5kIHN1cHBvcnQgcm90YXRpb24NCj4gKGh0dHBz
Oi8vcHctZW1lcmlsLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjkwMTUvKQ0KPiBkcm0vbWVkaWF0
ZWs6IENoZWNrIHJldHVybiB2YWx1ZSBvZiBtdGtfZHJtX2RkcF9jb21wX2Zvcl9wbGFuZQ0KPiAo
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzExNTQ1MTcvKQ0KPiANCj4g
Q2hhbmdlcyBzaW5jZSB2MzoNCj4gIC0gcmVtb3ZlIHJlZHVuZGFudCBjb2RlIGFuZCB2YXJpYWJs
ZQ0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gIC0gbW92ZSBzb21lIGNoYW5nZXMgdG8gYW5v
dGhlciBwYXRjaA0KPiAgLSBkaXNhYmxlIGxheWVyIGluIGF0b21pY19kaXNhYmxlKCkNCj4gDQo+
IENoYW5nZXMgc2luY2UgdjE6DQo+ICAtIHJlbW92ZSByZWR1bmRhbnQgY29kZQ0KPiAgLSBtZXJn
ZSB0aGUgZHVwbGljYXRlIGNvZGUNCj4gIC0gdXNlIGFzeW5jIGluc3RlYWQgb2YgY3Vyc29yDQo+
IA0KPiBDaGFuZ2VzIHNpbmNlIHYwOg0KPiAgLSByZW1vdmUgcmVkdW5kYW50IGNvZGUNCj4gIC0g
cmVtb3ZlIHBhdGNoDQo+ICAgICJkcm0vbWVkaWF0ZWs6IGZpeCBhdG9taWNfc3RhdGUgcmVmZXJl
bmNlIGNvdW50aW5nIg0KPiAgICBBZnRlciByZW1vdmUgdGhpcyBwYXRjaCwgdGhlIGlzc3VlIHdl
IG1ldCBiZWZvcmUgaXMgZ29uZS4NCj4gICAgU28gSSBkbyBub3QgYWRkIGFueSBleHRyYSBjb2Rl
IHRvIGRvIHNvbWV0aGluZy4NCj4gDQo+IEJpYmJ5IEhzaWVoICg3KToNCj4gICBkcm0vbWVkaWF0
ZWs6IHVzZSBEUk0gY29yZSdzIGF0b21pYyBjb21taXQgaGVscGVyDQo+ICAgZHJtL21lZGlhdGVr
OiBoYW5kbGUgZXZlbnRzIHdoZW4gZW5hYmxpbmcvZGlzYWJsaW5nIGNydGMNCj4gICBkcm0vbWVk
aWF0ZWs6IHVwZGF0ZSBjdXJzb3JzIGJ5IHVzaW5nIGFzeW5jIGF0b21pYyB1cGRhdGUNCj4gICBk
cm0vbWVkaWF0ZWs6IGRpc2FibGUgYWxsIHRoZSBwbGFuZXMgaW4gYXRvbWljX2Rpc2FibGUNCj4g
ICBkcm0vbWVkaWF0ZWs6IHJlbW92ZSB1bnVzZWQgZXh0ZXJuYWwgZnVuY3Rpb24NCj4gICBkcm0v
bWVkaWF0ZWs6IHN1cHBvcnQgQ01EUSBpbnRlcmZhY2UgaW4gZGRwIGNvbXBvbmVudA0KPiAgIGRy
bS9tZWRpYXRlazogYXBwbHkgQ01EUSBjb250cm9sIGZsb3cNCj4gDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYyAgIHwgICA3ICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgIHwgIDY3ICsrKystLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jICAgIHwgIDQzICsrLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgIHwgMTY1ICsrKysrKysrKysr
KysrKystLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmggICAg
IHwgICAyICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMg
fCAxMzIgKysrKysrKysrKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuaCB8ICA0NyArKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jICAgICAgfCAgODYgKy0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmggICAgICB8ICAgNyAtDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5jICAgIHwgIDQ3ICsrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fcGxhbmUuaCAgICB8ICAgMiArDQo+ICAxMSBmaWxlcyBjaGFuZ2Vk
LCAzODEgaW5zZXJ0aW9ucygrKSwgMjI0IGRlbGV0aW9ucygtKQ0KPiANCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
