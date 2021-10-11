Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00059428665
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 07:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AD16E40F;
	Mon, 11 Oct 2021 05:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64976E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 05:42:21 +0000 (UTC)
X-UUID: a738c0e3d88c4adf9b8ef6d36eb6d4f1-20211011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k9ifZ9vuBiBf5AnO4d5XKJK0BFQtIYXAIA+5OzwhUnY=; 
 b=nJ3gX/DP7gCnvkX2P/bhep/gTweRoI/2+OQgvhmYFthlhLqhZax9Im3utWOvcBkVQOl9YNt3Ml+rlsfH8XMWCSnuivWIqCXiUCIAFkaQcdCjacSt2VR7kqYFT/I4ug7udeVud0U+pPK5ysouTsQpB13PFL2TwLqX7neSolXdTeg=;
X-UUID: a738c0e3d88c4adf9b8ef6d36eb6d4f1-20211011
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1263059338; Mon, 11 Oct 2021 13:42:14 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 13:42:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 13:42:11 +0800
Message-ID: <e41bc32907c5c8abc65b66c1612cb9265d21614c.camel@mediatek.com>
Subject: Re: [PATCH v6, 12/15] media: mtk-vcodec: Support 34bits dma address
 for vdec
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Oct 2021 13:42:15 +0800
In-Reply-To: <09ce48f4-a785-97d9-2920-eacb39c59573@collabora.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-13-yunfei.dong@mediatek.com>
 <09ce48f4-a785-97d9-2920-eacb39c59573@collabora.com>
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

SGkgQmVuamlhbWluLA0KDQoNCk9uIFRodSwgMjAyMS0xMC0wNyBhdCAxMzozNyArMDIwMCwgQmVu
amFtaW4gR2FpZ25hcmQgd3JvdGU6DQo+IExlIDAxLzA5LzIwMjEgw6AgMTA6MzIsIFl1bmZlaSBE
b25nIGEgw6ljcml0IDoNCj4gPiBVc2UgdGhlIGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQgaGVs
cGVyIHRvIHNldCB2ZGVjDQo+ID4gRE1BIGJpdCBtYXNrIHRvIHN1cHBvcnQgMzRiaXRzIGlvdmEg
c3BhY2UoMTZHQikgdGhhdA0KPiA+IHRoZSBtdDgxOTIgaW9tbXUgSFcgc3VwcG9ydC4NCj4gPiAN
Cj4gPiBXaG9sZSB0aGUgaW92YSByYW5nZSBzZXBhcmF0ZSB0byAwfjRHLzRHfjhHLzhHfjEyRy8x
Mkd+MTZHLA0KPiA+IHJlZ2FyZGluZyB3aGljaCBpb3ZhIHJhbmdlIFZERUMgYWN0dWFsbHkgbG9j
YXRlLCBpdA0KPiA+IGRlcGVuZHMgb24gdGhlIGRtYS1yYW5nZXMgcHJvcGVydHkgb2YgdmRlYyBk
dHNpIG5vZGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5k
b25nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYyB8IDMgKysrDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYyANCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+IGlu
ZGV4IDAwMjM1MmZjZjhkZS4uMWE4ZDkzMDgzMjdkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0K
PiA+IEBAIC00MTcsNiArNDE3LDkgQEAgc3RhdGljIGludCBtdGtfdmNvZGVjX3Byb2JlKHN0cnVj
dA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAkJfQ0KPiA+ICAgCX0NCj4gPiAg
IA0KPiA+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShwZGV2LT5kZXYub2Zfbm9kZSwgImRtYS1yYW5n
ZXMiLCBOVUxMKSkNCj4gPiArCQlkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYs
DQo+ID4gRE1BX0JJVF9NQVNLKDM0KSk7DQo+ID4gKw0KPiANCj4gSGkgWXVuZmVpLA0KPiANCj4g
RG9lcyBhbGwgU29DIHN1cHBvcnQgMzRiaXRzIGlvdmEgc3BhY2UgPw0KPiBJZiBub3QgeW91IG5l
ZWQgdG8gYWxzbyBjaGVjayBTb0MgdmVyc2lvbiBiZWZvcmUgc2V0dGluZyBkbWEgbWFzay4NCj4g
DQpOb3QgYWxsIFNvQyBzdXBwb3J0IDM0Yml0cy4gV2lsbCBhZGQgZG1hLXJhbmdlcyBwcm9wZXJ0
eSBpbiBkdHNpIGlmIHRoZQ0KU29DIHN1cHBvcnQgMzRiaXRzLg0KDQpsaWtlIHRoaXM6DQpkbWEt
cmFuZ2VzID0gPD47DQoNClRoYW5rcywNCll1bmZlaSBEb25nDQo+IFJlZ2FyZHMsDQo+IEJlbmph
bWluDQo+IA0KPiA+ICAgCWZvciAoaSA9IDA7IGkgPCBNVEtfVkRFQ19IV19NQVg7IGkrKykNCj4g
PiAgIAkJbXV0ZXhfaW5pdCgmZGV2LT5kZWNfbXV0ZXhbaV0pOw0KPiA+ICAgCXNwaW5fbG9ja19p
bml0KCZkZXYtPmlycWxvY2spOw0K

