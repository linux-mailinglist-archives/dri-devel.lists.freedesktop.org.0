Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3650A2E1B29
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14216E8F7;
	Wed, 23 Dec 2020 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54AC46E875
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 01:37:56 +0000 (UTC)
X-UUID: f5a2956beaf046c48bfb24a60aa9f527-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=xbwGmFFXUIPvzjsYAQjwo15U9o4mg+NebaRJaHTcEIw=; 
 b=tpfp7Ou+xiR9ZTfnxWFpc4Fs/XQXJUiWNqdkSazWyQkNobDZVNKYWH8FCamid47vW08Q8809rVmC6+NFPFSU/pyp9lrFeIwFtWpqwOUa1Dy9G48qAOZoWWMPV63R4sIULTen+Q5N/oIx+M3tUBY/YB5bRXLzvKjSSHhUC7aUGvI=;
X-UUID: f5a2956beaf046c48bfb24a60aa9f527-20201223
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1184589703; Wed, 23 Dec 2020 09:37:54 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:37:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:37:50 +0800
Message-ID: <1608687471.18252.10.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 12/17] drm/mediatek: fix gamma size config
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:37:51 +0800
In-Reply-To: <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
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

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDA3OjQwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTPlr6vpgZPv
vJoNCj4gPg0KPiA+IGZpeCBnYW1tYSBzaXplIGNvbmZpZw0KPiANCj4gSSB3b3VsZCBsaWtlIHlv
dSB0byBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24uIFRoZSBvcmlnaW5hbCBjb2RlIHdvcmtzDQo+
IGluIG10ODE3Mywgd2h5IGRvIHlvdSBtb2RpZnkgdGhpcz8gVGhlIGRlc2NyaXB0aW9uIG1heSBi
ZSBzb21ldGhpbmcNCj4gbGlrZSB0aGlzOg0KPiANCj4gQWNjb3JkaW5nIHRvIGRhdGEgc2hlZXQs
IHRoZSB3aWR0aCBpcyBpbiBiaXRzIFszMSwgMTZdIGFuZCBoZWlnaHQgaXMNCj4gaW4gYml0cyBb
MTUsIDBdLiBFdmVuIHRob3VnaCB3cm9uZyBzZXR0aW5nIG1heSB3b3JrcyBpbiBzb21lIFNvQyBz
dWNoDQo+IGFzIG10ODE3MywgYnV0IGl0IGRvZXMgbm90IHdvcmsgaW4gbXQ4MTkyLg0KPiANCj4g
UmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCg0KaXQgc3RpbGwgd29ya3MgaW4gbXQ4MTkyLg0KanVz
dCBtb2RpZnkgdGhpcyBmb2xsb3cgZGF0YSBzaGVldA0KDQo+IA0KPiA+DQo+ID4gRml4ZXM6IGUw
YTVkMzM3MDI0NSAoZHJtL21lZGlhdGVrOiBBZGQgR0FNTUEgZW5naW5lIGJhc2ljIGZ1bmN0aW9u
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYw0KPiA+IGluZGV4IDAwZDU2ODcuLjUyYjZmYzcgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gPiBAQCAtMjk3LDcg
KzI5Nyw3IEBAIHN0YXRpYyB2b2lkIG10a19nYW1tYV9jb25maWcoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCwgdW5zaWduZWQgaW50IHcsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJwYywgc3RydWN0IGNtZHFfcGt0ICpjbWRx
X3BrdCkNCj4gPiAgew0KPiA+IC0gICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAx
NiB8IHcsIGNvbXAsIERJU1BfR0FNTUFfU0laRSk7DQo+ID4gKyAgICAgICBtdGtfZGRwX3dyaXRl
KGNtZHFfcGt0LCB3IDw8IDE2IHwgaCwgY29tcCwgRElTUF9HQU1NQV9TSVpFKTsNCj4gPiAgICAg
ICAgIG10a19kaXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9HQU1NQV9DRkcsIGNtZHFfcGt0KTsN
Cj4gPiAgfQ0KPiA+DQo+ID4gLS0NCj4gPiAxLjguMS4xLmRpcnR5DQo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
aw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
