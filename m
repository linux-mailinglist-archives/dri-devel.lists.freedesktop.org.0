Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A3B30713A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6E76E92F;
	Thu, 28 Jan 2021 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id C87BD6E47A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 00:43:47 +0000 (UTC)
X-UUID: 2d3e5f84166047e1b8b9b7547dc167c8-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=Moaf8HVdiYJmhrqmKzTtI0+ZWpCyJb1HWG+7EkTaLdo=; 
 b=HXsg1wxo8L7aaUznhnxvxnOB+9X7Uql7uKcD1DvlllDWtVXvrBd9akVsOAf99b6w/zxAofDCQGf+5w/07H67Tmb/QAgIkx/eJWPUNM+mhB+5x90Jp04X3v1NT/uDBf6aZubV8SpBeYIOcH9VNRRVZkmYYepCNYoHSudS9xnvwKE=;
X-UUID: 2d3e5f84166047e1b8b9b7547dc167c8-20210128
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 996953265; Thu, 28 Jan 2021 08:43:42 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 Jan 2021 08:43:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 08:43:39 +0800
Message-ID: <1611794619.1947.0.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 07/15] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 Jan 2021 08:43:39 +0800
In-Reply-To: <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-8-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTAxLTEyIGF0IDA3OjU5ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIx5bm0MeaciDEx5pelIOmAseS4gCDkuIvljYgzOjQ05a+r6YGT77ya
DQo+ID4NCj4gPiBlbmFibGUgT1ZMX0xBWUVSX1NNSV9JRF9FTiBmb3IgbXVsdGktbGF5ZXIgdXNl
Y2FzZQ0KPiANCj4gQ291bGQgeW91IGRlc2NyaWJlIG1vcmUgaW5mb3JtYXRpb24/IFdpdGhvdXQg
dGhpcyBwYXRjaCwgd2hhdCB3b3VsZCBoYXBwZW4/DQo+IA0KDQp3aXRob3V0IHRoaXMgcGF0Y2gs
IG92bCB3aWxsIGhhbmcgdXAgd2hlbiBtb3JlIHRoYW4gMSBsYXllciBlbmFibGVkDQoNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMgfCAxMiArKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiBp
bmRleCBiNDdjMjM4Li40OTM0YmVlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYw0KPiA+IEBAIC0yMyw2ICsyMyw3IEBADQo+ID4gICNkZWZpbmUgRElT
UF9SRUdfT1ZMX1JTVCAgICAgICAgICAgICAgICAgICAgICAgMHgwMDE0DQo+ID4gICNkZWZpbmUg
RElTUF9SRUdfT1ZMX1JPSV9TSVpFICAgICAgICAgICAgICAgICAgMHgwMDIwDQo+ID4gICNkZWZp
bmUgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTiAgICAgICAgICAgICAgMHgwMDI0DQo+ID4gKyNk
ZWZpbmUgT1ZMX0xBWUVSX1NNSV9JRF9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQo
MCkNCj4gPiAgI2RlZmluZSBPVkxfQkdDTFJfU0VMX0lOICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJJVCgyKQ0KPiA+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9ST0lfQkdDTFIgICAgICAg
ICAgICAgICAgIDB4MDAyOA0KPiA+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9TUkNfQ09OICAgICAg
ICAgICAgICAgICAgIDB4MDAyYw0KPiA+IEBAIC02MSw2ICs2Miw3IEBAIHN0cnVjdCBtdGtfZGlz
cF9vdmxfZGF0YSB7DQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZ21jX2JpdHM7DQo+ID4gICAg
ICAgICB1bnNpZ25lZCBpbnQgbGF5ZXJfbnI7DQo+ID4gICAgICAgICBib29sIGZtdF9yZ2I1NjVf
aXNfMDsNCj4gPiArICAgICAgIGJvb2wgc21pX2lkX2VuOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIC8q
Kg0KPiA+IEBAIC0xMTYsNyArMTE4LDE3IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZGlzYWJsZV92
Ymxhbmsoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBt
dGtfb3ZsX3N0YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApDQo+ID4gIHsNCj4gPiArICAg
ICAgIHN0cnVjdCBtdGtfZGlzcF9vdmwgKm92bCA9IGNvbXBfdG9fb3ZsKGNvbXApOw0KPiA+ICsN
Cj4gPiAgICAgICAgIHdyaXRlbF9yZWxheGVkKDB4MSwgY29tcC0+cmVncyArIERJU1BfUkVHX09W
TF9FTik7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYob3ZsLT5kYXRhLT5zbWlfaWRfZW4pIHsNCj4g
PiArICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlZzsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgIHJlZyA9IHJlYWRsKGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09O
KTsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gcmVnIHwgT1ZMX0xBWUVSX1NNSV9JRF9FTjsN
Cj4gPiArICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBjb21wLT5yZWdzICsgRElT
UF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7DQo+IA0KPiBJIHRoaW5rIHRoaXMgc2V0dGluZyBzaG91
bGQgYmVmb3JlIHdyaXRlIDEgdG8gRElTUF9SRUdfT1ZMX0VOLg0KPiANCj4gPiArICAgICAgIH0N
Cj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIG10a19vdmxfc3RvcChzdHJ1Y3QgbXRrX2Rk
cF9jb21wICpjb21wKQ0KPiANCj4gU2hvdWxkIGNsZWFyIERJU1BfUkVHX09WTF9EQVRBUEFUSF9D
T04gd2hlbiBzdG9wPw0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQo+ID4gLS0N
Cj4gPiAxLjguMS4xLmRpcnR5DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
