Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FDB43C0EF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 05:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FCF6E50C;
	Wed, 27 Oct 2021 03:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5236E509
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 03:44:42 +0000 (UTC)
X-UUID: 5247acccdc6049f19153313314cdfbda-20211027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KatCz9XKGgtCBLEzEVLf0OO9NA8gS5alukduL27YpSU=; 
 b=rLJWOuTKzukOyNpV1HwETlbGN4XuakW34dVx/z20HvLwj9f7nAsUwr9HUVnRBv01CY2pTvUiG6omqe0TTzk69wbno6cRsVIva51qOkkF62MJP6xaysKxW59WTktnoG7u7v5x3AArZdfo0RYp2jaHz6o62BJWbrp10z7jvYwXOoc=;
X-UUID: 5247acccdc6049f19153313314cdfbda-20211027
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2109564187; Wed, 27 Oct 2021 11:44:38 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Oct 2021 11:44:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 11:44:35 +0800
Message-ID: <629c605bc547a3d025eace87eb5f1ef724c2f080.camel@mediatek.com>
Subject: Re: [PATCH v7, 12/15] media: mtk-vcodec: Support 34bits dma address
 for vdec
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Oct 2021 11:44:35 +0800
In-Reply-To: <5e1c165d-176c-0141-dc96-0fdbda367c03@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-13-yunfei.dong@mediatek.com>
 <5e1c165d-176c-0141-dc96-0fdbda367c03@collabora.com>
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

SGkgQW5nZWxvR2lvYWNjaGlubywNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQpPbiBU
aHUsIDIwMjEtMTAtMTQgYXQgMTM6MDIgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IHdyb3RlOg0KPiA+IFVzZSB0aGUgZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCBoZWxwZXIgdG8g
c2V0IHZkZWMNCj4gPiBETUEgYml0IG1hc2sgdG8gc3VwcG9ydCAzNGJpdHMgaW92YSBzcGFjZSgx
NkdCKSB0aGF0DQo+ID4gdGhlIG10ODE5MiBpb21tdSBIVyBzdXBwb3J0Lg0KPiA+IA0KPiA+IFdo
b2xlIHRoZSBpb3ZhIHJhbmdlIHNlcGFyYXRlIHRvIDB+NEcvNEd+OEcvOEd+MTJHLzEyR34xNkcs
DQo+ID4gcmVnYXJkaW5nIHdoaWNoIGlvdmEgcmFuZ2UgVkRFQyBhY3R1YWxseSBsb2NhdGUsIGl0
DQo+ID4gZGVwZW5kcyBvbiB0aGUgZG1hLXJhbmdlcyBwcm9wZXJ0eSBvZiB2ZGVjIGR0c2kgbm9k
ZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL210a192Y29kZWNfZGVjX2Rydi5jIHwgMyArKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jIA0KPiA+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gaW5kZXggZGU4
M2UzYjgyMWI0Li5kYTk2M2NkYWM5NmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gQEAg
LTM3Niw2ICszNzYsOSBAQCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0DQo+ID4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgCQl9DQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4g
KwlpZiAob2ZfZ2V0X3Byb3BlcnR5KHBkZXYtPmRldi5vZl9ub2RlLCAiZG1hLXJhbmdlcyIsIE5V
TEwpKQ0KPiA+ICsJCWRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoJnBkZXYtPmRldiwNCj4gPiBE
TUFfQklUX01BU0soMzQpKTsNCj4gPiArDQo+IA0KV2lsbCBmaXggaW4gcGF0Y2ggdjguDQo+IFRo
aXMgZnVuY3Rpb24gcmV0dXJucyAwIGZvciBzdWNjZXNzLCBvciBuZWdhdGl2ZSBudW1iZXIgZm9y
IGZhaWx1cmU6DQo+IHBsZWFzZSBjaGVjaw0KPiB0aGUgcmV0dXJuIHZhbHVlLCBvciB0aGlzIGRy
aXZlciBtYXkgbm90IHdvcmsgY29ycmVjdGx5IGluIHNvbWUNCj4gY29ybmVyIGNhc2VzLg0KPiAN
Cj4gUmVnYXJkcywNCj4gLSBBbmdlbG8NCj4gDQo+ID4gICAJZm9yIChpID0gMDsgaSA8IE1US19W
REVDX0hXX01BWDsgaSsrKQ0KPiA+ICAgCQltdXRleF9pbml0KCZkZXYtPmRlY19tdXRleFtpXSk7
DQo+ID4gICAJc3Bpbl9sb2NrX2luaXQoJmRldi0+aXJxbG9jayk7DQo+ID4gDQo=

