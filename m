Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45632E1B24
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBE76E8E9;
	Wed, 23 Dec 2020 10:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 586416E875
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 01:36:13 +0000 (UTC)
X-UUID: 9b86282bee9343a4b2d733b07cdd2414-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=igemKLkcQLI3htu4s5toT7cvfqLMBfICa3D565HL4bA=; 
 b=ObuJrw8+oKC2xfZhMqn8vvImXA1Dj8Zli5/3iiovlbafA7fq9TfdtT/7LVFodnEX943EcyknzfLBgH0S7Iv+Wd5L8vKw7ZMpBnIR5mJl0d+dqAAYtOvRcqFCtPVxlU0nCToJGbj/ptjh91vOiwnEHpa8UtcCC+b1J1mO3VNKwqQ=;
X-UUID: 9b86282bee9343a4b2d733b07cdd2414-20201223
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 296003127; Wed, 23 Dec 2020 09:36:06 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:36:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:36:02 +0800
Message-ID: <1608687363.18252.9.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 10/17] drm/mediatek: fix aal size config
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:36:03 +0800
In-Reply-To: <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-11-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTEyLTE2IGF0IDIzOjEwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MjLlr6vpgZPv
vJoNCj4gPg0KPiA+IGZpeCBhYWwgc2l6ZSBjb25maWcNCj4gPg0KPiA+IEZpeGVzOiAwNjY0ZDEz
OTJjMjYgKGRybS9tZWRpYXRlazogQWRkIEFBTCBlbmdpbmUgYmFzaWMgZnVuY3Rpb24pDQo+ID4g
U2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMgfCAxMSArKysrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jDQo+ID4gaW5kZXggYmU2MWQxMS4uZTdkNDgxZTAgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gPiBAQCAt
MzMsOCArMzMsMTMgQEANCj4gPiAgI2RlZmluZSBESVNQX1JFR19VRk9fU1RBUlQgICAgICAgICAg
ICAgICAgICAgICAweDAwMDANCj4gPg0KPiA+ICAjZGVmaW5lIERJU1BfQUFMX0VOICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDAwMA0KPiA+ICsjZGVmaW5lIERJU1BfQUFMX0NGRyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMA0KPiA+ICsjZGVmaW5lIEFBTF9SRUxBWV9NT0RF
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDApDQo+ID4gKyNkZWZpbmUgQUFM
X0VOR0lORV9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMSkNCj4gPiAg
I2RlZmluZSBESVNQX0FBTF9TSVpFICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMzANCj4g
Pg0KPiA+ICsjZGVmaW5lIERJU1BfQUFMX09VVFBVVF9TSVpFICAgICAgICAgICAgICAgICAgIDB4
MDRkOA0KPiA+ICsNCj4gPiAgI2RlZmluZSBESVNQX0NDT1JSX0VOICAgICAgICAgICAgICAgICAg
ICAgICAgICAweDAwMDANCj4gPiAgI2RlZmluZSBDQ09SUl9FTiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBCSVQoMCkNCj4gPiAgI2RlZmluZSBESVNQX0NDT1JSX0NGRyAgICAgICAgICAg
ICAgICAgICAgICAgICAweDAwMjANCj4gPiBAQCAtMTg0LDcgKzE4OSwxMSBAQCBzdGF0aWMgdm9p
ZCBtdGtfYWFsX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQg
dywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWdu
ZWQgaW50IHZyZWZyZXNoLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBicGMsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpDQo+ID4gIHsNCj4gPiAtICAgICAg
IG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3LCBjb21wLCBESVNQX0FBTF9TSVpF
KTsNCj4gPiArICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHcgPDwgMTYgfCBoLCBjb21w
LCBESVNQX0FBTF9TSVpFKTsNCj4gPiArICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHcg
PDwgMTYgfCBoLCBjb21wLCBESVNQX0FBTF9PVVRQVVRfU0laRSk7DQo+ID4gKw0KPiA+ICsgICAg
ICAgbXRrX2RkcF93cml0ZV9tYXNrKE5VTEwsIEFBTF9SRUxBWV9NT0RFLCBjb21wLCBESVNQX0FB
TF9DRkcsDQo+IA0KPiBjbWRxX3BrdA0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICBBQUxfUkVMQVlfTU9ERSB8IEFBTF9FTkdJTkVfRU4pOw0KPiANCj4gVGhpcyBwYXRjaCBpcyB0
byBmaXggc2l6ZSBjb25maWcsIHNvIG1vdmUgdGhpcyBzdGF0ZW1lbnQgdG8gYW5vdGhlciBwYXRj
aC4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KDQp3aWxsIGJlIGZpeGVkIGlu
IG5leHQgdmVyc2lvbg0KDQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBtdGtfYWFsX3N0
YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApDQo+ID4gLS0NCj4gPiAxLjguMS4xLmRpcnR5
DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
PiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
