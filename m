Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51ED3F28FE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 11:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104F66EA44;
	Fri, 20 Aug 2021 09:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792866EA35
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 07:59:51 +0000 (UTC)
X-UUID: 67d87111147f49deb1e6ed22dd5dcb45-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VluiAbKGQy/3Yr6UxPnDDXbjlygkyrql8mDiSJPOAdY=; 
 b=u2x3ECk9IHJHuyY7+rigAOuyNreL9ujO4lyz7u1/Bx7LiQoh0Z7IhGZbugghUOHs4IOVN4ZXHHa8DFb4vQdj35XJMs+aOANZ8OyGjlIcd8V++l6FcngmuUOQ/YdHoN2XowjOV3YJHqH0e9R49AwgvV9i9RxXmo6+jqEuKrVYXLg=;
X-UUID: 67d87111147f49deb1e6ed22dd5dcb45-20210820
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 994131274; Fri, 20 Aug 2021 15:59:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 15:59:40 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 15:59:38 +0800
Message-ID: <1629446378.18871.27.camel@mhfsdcap03>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi Shih"
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT
 Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, George Sun
 <george.sun@mediatek.com>
Date: Fri, 20 Aug 2021 15:59:38 +0800
In-Reply-To: <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
 <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Fri, 20 Aug 2021 09:15:23 +0000
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

SGkgRXplcXVpZWwsDQoNClRoYW5rcyBmb3IgeW91ciBkZXRhaWwgZmVlZGJhY2suIA0KDQpPbiBU
aHUsIDIwMjEtMDgtMTkgYXQgMTE6MTAgLTAzMDAsIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4g
T24gVGh1LCAxOSBBdWcgMjAyMSBhdCAwNDoxMywgeXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tDQo+
IDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgRXplcXVpZWws
DQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCj4gPg0KPiA+IE9uIFdlZCwg
MjAyMS0wOC0xOCBhdCAxMToxMSAtMDMwMCwgRXplcXVpZWwgR2FyY2lhIHdyb3RlOg0KPiA+ID4g
K2RhbnZldA0KPiA+ID4NCj4gPiA+IEhpLA0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgMTAgQXVnIDIw
MjEgYXQgMjM6NTgsIFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4g
PiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBt
dWx0aSBoYXJkd2FyZSBkZWNvZGUgaW50byBtdGstdmNvZGVjLA0KPiA+ID4gPiBieSBmaXJzdA0K
PiA+ID4gPiBhZGRpbmcgY29tcG9uZW50IGZyYW1ld29yayB0byBtYW5hZ2UgZWFjaCBoYXJkd2Fy
ZSBpbmZvcm1hdGlvbjoNCj4gPiA+ID4gaW50ZXJydXB0LA0KPiA+ID4gPiBjbG9jaywgcmVnaXN0
ZXIgYmFzZXMgYW5kIHBvd2VyLiBTZWNvbmRseSBhZGQgY29yZSB0aHJlYWQgdG8gZGVhbA0KPiA+
ID4gPiB3aXRoIGNvcmUNCj4gPiA+ID4gaGFyZHdhcmUgbWVzc2FnZSwgYXQgdGhlIHNhbWUgdGlt
ZSwgYWRkIG1zZyBxdWV1ZSBmb3IgZGlmZmVyZW50DQo+ID4gPiA+IGhhcmR3YXJlDQo+ID4gPiA+
IHNoYXJlIG1lc3NhZ2VzLiBMYXN0bHksIHRoZSBhcmNoaXRlY3R1cmUgb2YgZGlmZmVyZW50IHNw
ZWNzIGFyZSBub3QNCj4gPiA+ID4gdGhlIHNhbWUsDQo+ID4gPiA+IHVzaW5nIHNwZWNzIHR5cGUg
dG8gc2VwYXJhdGUgdGhlbS4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBJIGRvbid0IHRoaW5rIGl0
J3MgYSBnb29kIGlkZWEgdG8gaW50cm9kdWNlIHRoZSBjb21wb25lbnQgQVBJIGluIHRoZQ0KPiA+
ID4gbWVkaWEgc3Vic3lzdGVtLiBJdCBkb2Vzbid0IHNlZW0gdG8gYmUgbWFpbnRhaW5lZCwgSVJD
IHRoZXJlJ3Mgbm90DQo+ID4gPiBldmVuDQo+ID4gPiBhIG1haW50YWluZXIgZm9yIGl0LCBhbmQg
aXQgaGFzIHNvbWUgaXNzdWVzIHRoYXQgd2VyZSBuZXZlcg0KPiA+ID4gYWRkcmVzc2VkLg0KPiA+
ID4NCj4gPiA+IEl0IHdvdWxkIGJlIHJlYWxseSBpbXBvcnRhbnQgdG8gYXZvaWQgaXQuIElzIGl0
IHJlYWxseSBuZWVkZWQgaW4gdGhlDQo+ID4gPiBmaXJzdCBwbGFjZT8NCj4gPiA+DQo+ID4gPiBU
aGFua3MsDQo+ID4gPiBFemVxdWllbA0KPiA+DQo+ID4gRm9yIHRoZXJlIGFyZSBtYW55IGhhcmR3
YXJlIG5lZWQgdG8gdXNlLCBtdDgxOTIgaXMgdGhyZWUgYW5kIG10ODE5NSBpcw0KPiA+IGZpdmUu
IE1heWJlIG5lZWQgbW9yZSB0byBiZSB1c2VkIGluIHRoZSBmZWF0dXJlLg0KPiA+DQo+ID4gRWFj
aCBoYXJkd2FyZSBoYXMgaW5kZXBlbmRlbnQgY2xrL3Bvd2VyL2lvbW11IHBvcnQvaXJxLg0KPiA+
IFVzZSBjb21wb25lbnQgaW50ZXJmYWNlIGluIHByb2IgdG8gZ2V0IGVhY2ggY29tcG9uZW50J3Mg
aW5mb3JtYXRpb24uDQo+ID4gSnVzdCBlbmFibGUgdGhlIGhhcmR3YXJlIHdoZW4gbmVlZCB0byB1
c2UgaXQsIHZlcnkgY29udmVuaWVudCBhbmQNCj4gPiBzaW1wbGUuDQo+ID4NCj4gPiBJIGZvdW5k
IHRoYXQgdGhlcmUgYXJlIG1hbnkgbW9kdWxlcyB1c2UgY29tcG9uZW50IHRvIG1hbmFnZSBoYXJk
d2FyZQ0KPiA+IGluZm9ybWF0aW9uLCBzdWNoIGFzIGlvbW11IGFuZCBkcm0gZXRjLg0KPiA+DQo+
IA0KPiBNYW55IGRyaXZlcnMgc3VwcG9ydCBtdWx0aXBsZSBoYXJkd2FyZSB2YXJpYW50cywgd2hl
cmUgZWFjaCB2YXJpYW50DQo+IGhhcyBhIGRpZmZlcmVudCBudW1iZXIgb2YgY2xvY2tzIG9yIGlu
dGVycnVwdHMsIHNlZSBmb3IgaW5zdGFuY2UNCj4gc3RydWN0IGhhbnRyb192YXJpYW50IHdoaWNo
IGFsbG93cyB0byBleHBvc2UgZGlmZmVyZW50IGNvZGVjIGNvcmVzLA0KPiBzb21lIGhhdmluZyBi
b3RoIGRlY29kZXIvZW5jb2RlciwgYW5kIHNvbWUgaGF2aW5nIGp1c3QgYSBkZWNvZGVyLg0KPiAN
Cj4gVGhlIGNvbXBvbmVudCBBUEkgaXMgbW9zdGx5IHVzZWQgYnkgRFJNIHRvIGFnZ3JlZ2F0ZSBp
bmRlcGVuZGVudA0KPiBzdWJkZXZpY2VzIChjYWxsZWQgY29tcG9uZW50cykgaW50byBhbiBhZ2dy
ZWdhdGVkIGRyaXZlci4NCj4gDQo+IEZvciBpbnN0YW5jZSwgYSBEUk0gZHJpdmVyIG5lZWRzIHRv
IGdsdWUgdG9nZXRoZXIgdGhlIEhETUksIE1JUEksDQo+IGFuZCBwbGFueSBjb250cm9sbGVyLCBv
ciBhbnkgb3RoZXIgaGFyZHdhcmUgYXJyYW5nZW1lbnQgd2hlcmUNCj4gZGV2aWNlcyBjYW4gYmUg
ZGVzY3JpYmVkIGluZGVwZW5kZW50bHkuDQo+IA0KVGhlIHVzYWdlIHNjZW5hcmlvIGlzIHZlcnkg
c2ltaWxhciB3aXRoIGRybSBhbmQgaW9tbXUsIFNvIGRlY2lkZSB0byB1c2UNCmNvbXBvbmVudCBm
cmFtZXdvcmsuDQpEZWNvZGUgaGFzIHRocmVlL2ZpdmUgb3IgbW9yZSBoYXJkd2FyZXMsIHRoZXNl
IGhhcmR3YXJlIGFyZSBpbmRlcGVuZGVudC4NCkZvciBtdDgxODMganVzdCBuZWVkIGNvcmUgaGFy
ZHdhcmUgdG8gZGVjb2RlLCBidXQgbXQ4MTkyIGhhcyBsYXQsc29jIGFuZA0KY29yZSBoYXJkd2Fy
ZSB0byBkZWNvZGUuIFdoZW4gbGF0IG5lZWQgdG8gdXNlLCBqdXN0IGVuYWJsZSBsYXQgaGFyZHdh
cmUsDQpjb3JlIGlzIHRoZSBzYW1lLkFuZCBtdDgxOTUgd2lsbCBoYXMgdHdvIGNvcmVzLCBlYWNo
IGNvcmUgY2FuIHdvcmsgd2VsbA0KaW5kZXBlbmRlbnQuDQoNCkZvciBlYWNoIGNvbXBvbmVudCBk
ZXZpY2UganVzdCB1c2VkIHRvIG9wZW4gdGhlaXIgcG93ZXIvY2xrL2lvbW11DQpwb3J0L2lycSB3
aGVuIG1hc3RlciBuZWVkIHRvIGVuYWJsZSBpdC4gVGhlIG1haW4gbG9naWMgaXMgaW4gbWFzdGVy
DQpkZXZpY2UuDQoNCj4gVGhlIGNvbXBvbmVudCBBUEkgbWF5IGxvb2sgc2ltcGxlIGJ1dCBoYXMg
c29tZSBpc3N1ZXMsIGl0J3Mgbm90IGVhc3kNCj4gdG8gZGVidWcsIGFuZCBjYW4gY2F1c2UgdHJv
dWJsZXMgaWYgbm90IHVzZWQgYXMgZXhwZWN0ZWQgWzFdLg0KPiBJdCdzIHdvcnRoIG1ha2luZyBz
dXJlIHlvdSBhY3R1YWxseSBuZWVkIGEgZnJhbWV3b3JrDQo+IHRvIGdsdWUgZGlmZmVyZW50IGRl
dmljZXMgdG9nZXRoZXIuDQo+IA0KRWFjaCBoYXJkd2FyZSBoYXMgaXRzIGluZGV4LCBtYXN0ZXIg
Y2FuIGdldCBoYXJkd2FyZSBpbmZvcm1hdGlvbg0KYWNjb3JkaW5nIHRoZXNlIGluZGV4LCBsb29r
cyBub3QgY29tcGxleC4gV2hhdCBkbyB5b3UgbWVhbiBhYm91dCBub3QNCmVhc3kgdG8gZGVidWc/
DQoNCj4gPiBEbyB5b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbiBmb3IgdGhpcyBhcmNoaXRl
Y3R1cmU/DQo+ID4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGRpZmZlcmVudCBwYXRjaHNldHMgdGhh
dCBhcmUgcG9zdGVkLCBpdCdzIG5vdCBjbGVhcg0KPiB0byBtZSB3aGF0IGV4YWN0bHkgYXJlIHRo
ZSBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyB0aGF0IHlvdSBpbnRlbmQNCj4gdG8gc3VwcG9ydCwg
Y2FuIHlvdSBzb21lIGRvY3VtZW50YXRpb24gd2hpY2ggY2xhcmlmaWVzIHRoYXQ/DQo+IA0KSGF2
ZSBmaXZlIGhhcmR3YXJlcyBsYXQsc29jLGNvcmUwLGNvcmUxIGFuZCBtYWluLiBMYXQgdGhyZWFk
IGNhbiB1c2UgbGF0DQpzb2MgYW5kIG1haW4sIGNvcmUgdGhyZWFkIGNhbiB1c2Ugc29jLGxhdCwg
Y29yZTAgYW5kIGNvcmUxLiBDb3JlIHRocmVhZA0KY2FuIGJlIHVzZWQgb3Igbm90IGZvciBkaWZm
ZXJlbnQgcHJvamVjdC4gQWxzbyBOZWVkIHRvIHVzZSB0aGVzZQ0KaGFyZHdhcmUgZHluYW1pYyBh
dCB0aGUgc2FtZSB0aW1lLiBTbyBJIHVzZSBjb21wb25lbnQgZnJhbWV3b3JrLCBqdXN0DQpuZWVk
IHRvIGtub3cgdGhlIHVzZWQgIGhhcmR3YXJlIGluZGV4IGFjY29yZGluZyB0byBkaWZmZXJlbnQN
CnByb2plY3QuTmVlZCBub3QgdG8gZG8gY29tcGxleCBsb2dpYyB0byBtYW5hZ2UgdGhlc2UgaGFy
ZHdhcmVzLg0KDQoNCj4gVGhhbmtzLA0KPiBFemVxdWllbA0KPiANCj4gWzFdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yb2NrY2hpcC9jb3Zlci8yMDIwMDEyMDE3
MDYwMi4zODMyLTEtZXplcXVpZWxAY29sbGFib3JhLmNvbS8NCg0KDQpUaGFua3MsDQpZdW5mZWkg
RG9uZw0KDQoNCg0KDQo=

