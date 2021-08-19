Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC93F147E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 09:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079E56E96F;
	Thu, 19 Aug 2021 07:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9596E4B5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 07:13:55 +0000 (UTC)
X-UUID: 251875df620b4216b61ae5eb2c7ea287-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/muT9XpC+z47+tIQYbGjPzGaimqcXokZABmz7lDUyYU=; 
 b=FI7aeH3Cpo4SaUIsv/DCpm56YJ1EZ1MiV7vzXoxvH4/dbafhUwRkMN/5ZOW6bVH5D7SviUlo5FOtei90Iy6ISa03q05oyiaLq8OzkYXnH7f3MaJTDvvCqxODhutU4g2ZaIg7OcndKk1ClFHHEl7sn1C7JGTZo9JPRJAAb/2LvmI=;
X-UUID: 251875df620b4216b61ae5eb2c7ea287-20210819
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1240516873; Thu, 19 Aug 2021 15:13:50 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 15:13:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Aug 2021 15:13:47 +0800
Message-ID: <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>, devicetree
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, George Sun
 <george.sun@mediatek.com>
Date: Thu, 19 Aug 2021 15:13:48 +0800
In-Reply-To: <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Thu, 19 Aug 2021 07:45:59 +0000
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

SGkgRXplcXVpZWwsDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KDQpPbiBXZWQsIDIw
MjEtMDgtMTggYXQgMTE6MTEgLTAzMDAsIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4gK2RhbnZl
dA0KPiANCj4gSGksDQo+IA0KPiBPbiBUdWUsIDEwIEF1ZyAyMDIxIGF0IDIzOjU4LCBZdW5mZWkg
RG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBUaGlz
IHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIG11bHRpIGhhcmR3YXJlIGRlY29kZSBpbnRvIG10ay12
Y29kZWMsIA0KPiA+IGJ5IGZpcnN0DQo+ID4gYWRkaW5nIGNvbXBvbmVudCBmcmFtZXdvcmsgdG8g
bWFuYWdlIGVhY2ggaGFyZHdhcmUgaW5mb3JtYXRpb246DQo+ID4gaW50ZXJydXB0LA0KPiA+IGNs
b2NrLCByZWdpc3RlciBiYXNlcyBhbmQgcG93ZXIuIFNlY29uZGx5IGFkZCBjb3JlIHRocmVhZCB0
byBkZWFsDQo+ID4gd2l0aCBjb3JlDQo+ID4gaGFyZHdhcmUgbWVzc2FnZSwgYXQgdGhlIHNhbWUg
dGltZSwgYWRkIG1zZyBxdWV1ZSBmb3IgZGlmZmVyZW50DQo+ID4gaGFyZHdhcmUNCj4gPiBzaGFy
ZSBtZXNzYWdlcy4gTGFzdGx5LCB0aGUgYXJjaGl0ZWN0dXJlIG9mIGRpZmZlcmVudCBzcGVjcyBh
cmUgbm90DQo+ID4gdGhlIHNhbWUsDQo+ID4gdXNpbmcgc3BlY3MgdHlwZSB0byBzZXBhcmF0ZSB0
aGVtLg0KPiA+IA0KPiANCj4gSSBkb24ndCB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIGludHJv
ZHVjZSB0aGUgY29tcG9uZW50IEFQSSBpbiB0aGUNCj4gbWVkaWEgc3Vic3lzdGVtLiBJdCBkb2Vz
bid0IHNlZW0gdG8gYmUgbWFpbnRhaW5lZCwgSVJDIHRoZXJlJ3Mgbm90DQo+IGV2ZW4NCj4gYSBt
YWludGFpbmVyIGZvciBpdCwgYW5kIGl0IGhhcyBzb21lIGlzc3VlcyB0aGF0IHdlcmUgbmV2ZXIN
Cj4gYWRkcmVzc2VkLg0KPiANCj4gSXQgd291bGQgYmUgcmVhbGx5IGltcG9ydGFudCB0byBhdm9p
ZCBpdC4gSXMgaXQgcmVhbGx5IG5lZWRlZCBpbiB0aGUNCj4gZmlyc3QgcGxhY2U/DQo+IA0KPiBU
aGFua3MsDQo+IEV6ZXF1aWVsDQoNCkZvciB0aGVyZSBhcmUgbWFueSBoYXJkd2FyZSBuZWVkIHRv
IHVzZSwgbXQ4MTkyIGlzIHRocmVlIGFuZCBtdDgxOTUgaXMNCmZpdmUuIE1heWJlIG5lZWQgbW9y
ZSB0byBiZSB1c2VkIGluIHRoZSBmZWF0dXJlLg0KDQpFYWNoIGhhcmR3YXJlIGhhcyBpbmRlcGVu
ZGVudCBjbGsvcG93ZXIvaW9tbXUgcG9ydC9pcnEuDQpVc2UgY29tcG9uZW50IGludGVyZmFjZSBp
biBwcm9iIHRvIGdldCBlYWNoIGNvbXBvbmVudCdzIGluZm9ybWF0aW9uLg0KSnVzdCBlbmFibGUg
dGhlIGhhcmR3YXJlIHdoZW4gbmVlZCB0byB1c2UgaXQsIHZlcnkgY29udmVuaWVudCBhbmQNCnNp
bXBsZS4NCg0KSSBmb3VuZCB0aGF0IHRoZXJlIGFyZSBtYW55IG1vZHVsZXMgdXNlIGNvbXBvbmVu
dCB0byBtYW5hZ2UgaGFyZHdhcmUNCmluZm9ybWF0aW9uLCBzdWNoIGFzIGlvbW11IGFuZCBkcm0g
ZXRjLg0KDQpEbyB5b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbiBmb3IgdGhpcyBhcmNoaXRl
Y3R1cmU/DQoNClRoYW5rcw0KWXVuZmVpIERvbmcNCg0K

