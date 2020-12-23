Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115392E1B44
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463996E8E5;
	Wed, 23 Dec 2020 10:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54E016E249
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 01:21:52 +0000 (UTC)
X-UUID: 8f3f8bc72d484bc2b9c2c87cf3720d59-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=wA1tMPUl7qbOsFxNAFBWpezyTlJCvJZ/9bkweVhcykY=; 
 b=gZ6jTh+3zXk760/4J8t3vKmYOO+KGo5QpK3tV6orsj9n6CU35gGzVXeqfFH0GmVk3kb+5+BdEEY6urRchNa68uI5wIsbCuQx1tY1sRIrMe806yyZpXxYpxSvNb3gM4XpHDedQ4iSa93m6sXN2F+NfWpEx5JFfuDUXQa1GRItkVI=;
X-UUID: 8f3f8bc72d484bc2b9c2c87cf3720d59-20201223
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 124569288; Wed, 23 Dec 2020 09:21:49 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:21:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:21:40 +0800
Message-ID: <1608686503.18252.7.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 04/17] drm/mediatek: add component OVL_2L2
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:21:43 +0800
In-Reply-To: <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-5-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
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

T24gU3VuLCAyMDIwLTEyLTEzIGF0IDA5OjE1ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTLlr6vpgZPv
vJoNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBPVkxfMkwyDQo+IA0KPiBCcmVh
ayBkcm0gcGFydCBhbmQgc29jIHBhcnQgaW50byBkaWZmZXJlbnQgcGF0Y2hlcy4NCj4gDQo+IFJl
Z2FyZHMsDQo+IENodW4tS3VhbmcuDQoNCndpbGwgYmUgZml4ZWQgaW4gbmV4dCB2ZXJzaW9uDQo+
IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmMgfCAxICsNCj4gPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmggICAgICB8IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5j
DQo+ID4gaW5kZXggOGViYTQ0Yi4uODkzODU1NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiA+IEBAIC00MDMsNiArNDAzLDcgQEAg
c3RydWN0IG10a19kZHBfY29tcF9tYXRjaCB7DQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVOVF9P
VkwxXSAgICA9IHsgTVRLX0RJU1BfT1ZMLCAgICAgICAxLCBOVUxMIH0sDQo+ID4gICAgICAgICBb
RERQX0NPTVBPTkVOVF9PVkxfMkwwXSA9IHsgTVRLX0RJU1BfT1ZMXzJMLCAgICAwLCBOVUxMIH0s
DQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVOVF9PVkxfMkwxXSA9IHsgTVRLX0RJU1BfT1ZMXzJM
LCAgICAxLCBOVUxMIH0sDQo+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9PVkxfMkwyXSA9IHsg
TVRLX0RJU1BfT1ZMXzJMLCAgICAyLCBOVUxMIH0sDQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVO
VF9QV00wXSAgICA9IHsgTVRLX0RJU1BfUFdNLCAgICAgICAwLCBOVUxMIH0sDQo+ID4gICAgICAg
ICBbRERQX0NPTVBPTkVOVF9QV00xXSAgICA9IHsgTVRLX0RJU1BfUFdNLCAgICAgICAxLCBOVUxM
IH0sDQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVOVF9QV00yXSAgICA9IHsgTVRLX0RJU1BfUFdN
LCAgICAgICAyLCBOVUxMIH0sDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29jL21l
ZGlhdGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmgNCj4gPiBpbmRleCA0YjZjNTE0Li40MjQ3NmMyIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUv
bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgNCj4gPiBAQCAtMjksNiArMjksNyBAQCBlbnVtIG10a19k
ZHBfY29tcF9pZCB7DQo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTDAsDQo+ID4gICAgICAg
ICBERFBfQ09NUE9ORU5UX09WTF8yTDAsDQo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTF8y
TDEsDQo+ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDIsDQo+ID4gICAgICAgICBERFBf
Q09NUE9ORU5UX09WTDEsDQo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX1BXTTAsDQo+ID4gICAg
ICAgICBERFBfQ09NUE9ORU5UX1BXTTEsDQo+ID4gLS0NCj4gPiAxLjguMS4xLmRpcnR5DQo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
