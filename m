Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B52E6F6B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DF8892D3;
	Tue, 29 Dec 2020 09:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 402D2892F1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 01:34:18 +0000 (UTC)
X-UUID: 86957de574ae457bad31d87bbbcdbf0c-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=fdAfDBXqjGSdAm6mjwKnuxy0qCLmgADvcqdksYzyP64=; 
 b=f3N6W/SCZAL2vIZcNuS++blm0MIBzN1bCwBoywYO31YbLuMiVS7zaQvjXvKk1xY997RNHVGvpZIckyXH7Q7bLiL5FapNVmLA5wzM3vqED+2aomvCBW5clkPv9dCjhBUgei4r9sVhw5oVWuNnR+HegIb0yoB4FibmRJg8Pk3ni2k=;
X-UUID: 86957de574ae457bad31d87bbbcdbf0c-20201229
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1746881491; Tue, 29 Dec 2020 09:34:13 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 09:35:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 09:35:18 +0800
Message-ID: <1609205650.24062.2.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 7/8] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 09:34:10 +0800
In-Reply-To: <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-8-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTEyLTI5IGF0IDAwOjM4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgyOOaXpSDpgLHkuIAg5LiL5Y2INDozOOWvq+mBk++8
mg0KPiA+DQo+ID4gVXNlIGZ1bmN0aW9uIGNhbGwgZm9yIHNldHRpbmcgbW1zeXMgb3ZsIG1vdXQg
cmVnaXN0ZXINCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFu
Zy5uaXVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9t
bXN5cy9tdGstbW1zeXMuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUv
bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIHwgIDMgKysrDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMv
bXRrLW1tc3lzLmMNCj4gPiBpbmRleCBkYWU2NjViLi5lYTM2YTExIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jDQo+ID4gKysrIGIvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXRrLW1tc3lzLmMNCj4gPiBAQCAtNzQsNiArNzQsMTcgQEAg
dm9pZCBtdGtfbW1zeXNfZGRwX2Nvbm5lY3Qoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICAgICAg
ICAgICAgICAgICByZWcgPSByZWFkbF9yZWxheGVkKG1tc3lzLT5yZWdzICsgYWRkcikgfCB2YWx1
ZTsNCj4gPiAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyAr
IGFkZHIpOw0KPiA+ICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGlmICghZnVuY3MtPm92
bF9tb3V0X2VuKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAg
ICAgaWYgKGZ1bmNzLT5vdmxfbW91dF9lbikgew0KPiA+ICsgICAgICAgICAgICAgICB2YWx1ZSA9
IGZ1bmNzLT5vdmxfbW91dF9lbihjdXIsIG5leHQsICZhZGRyKTsNCj4gPiArICAgICAgICAgICAg
ICAgaWYgKHZhbHVlKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gcmVhZGxf
cmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpIHwgdmFsdWU7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyArIGFkZHIpOw0KPiA+ICsg
ICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICB9DQo+IA0KPiBtdGtfbW1zeXNfZGRwX21vdXRf
ZW4oKSBjb3VsZCB3cml0ZSByZWdpc3RlciBpbnNpZGUgaXQgcmF0aGVyIHRoYW4NCj4gcmV0dXJu
IHZhbHVlIGFuZCB3cml0ZSByZWdpc3RlciBpbiBtdGtfbW1zeXNfZGRwX2Nvbm5lY3QoKS4gU28g
eW91DQo+IGNvdWxkIGRvIG92bF9tb3V0X2VuKCkgaW4gbXRrX21tc3lzX2RkcF9tb3V0X2VuKCku
DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KDQppIHdpbGwgYWRkIHRoaXMgbW9kaWZp
Y2F0aW9uIGluIG5leHQgdmVyc2lvbg0KPiANCj4gPiAgfQ0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQ
TChtdGtfbW1zeXNfZGRwX2Nvbm5lY3QpOw0KPiA+DQo+ID4gQEAgLTk5LDYgKzExMCwxNSBAQCB2
b2lkIG10a19tbXN5c19kZHBfZGlzY29ubmVjdChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gICAg
ICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBhZGRyKSAmIH52
YWx1ZTsNCj4gPiAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVn
cyArIGFkZHIpOw0KPiA+ICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGlmICghZnVuY3Mt
Pm92bF9tb3V0X2VuKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsg
ICAgICAgdmFsdWUgPSBmdW5jcy0+b3ZsX21vdXRfZW4oY3VyLCBuZXh0LCAmYWRkcik7DQo+ID4g
KyAgICAgICBpZiAodmFsdWUpIHsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVs
YXhlZChtbXN5cy0+cmVncyArIGFkZHIpICYgfnZhbHVlOw0KPiA+ICsgICAgICAgICAgICAgICB3
cml0ZWxfcmVsYXhlZChyZWcsIG1tc3lzLT5yZWdzICsgYWRkcik7DQo+ID4gKyAgICAgICB9DQo+
ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9kaXNjb25uZWN0KTsN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oDQo+ID4gaW5kZXgg
YWE0ZjYwZS4uMjIwMjAzZCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstbW1zeXMuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1tbXN5cy5oDQo+ID4gQEAgLTQ5LDYgKzQ5LDkgQEAgc3RydWN0IG10a19tbXN5c19jb25uX2Z1
bmNzIHsNCj4gPiAgICAgICAgIHUzMiAoKm1vdXRfZW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1
ciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIG5leHQs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmFkZHIpOw0KPiA+ICsg
ICAgICAgdTMyICgqb3ZsX21vdXRfZW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0LA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqYWRkcik7DQo+ID4gICAg
ICAgICB1MzIgKCpzZWxfaW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgbmV4dCwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50ICphZGRyKTsNCj4gPiAtLQ0KPiA+IDEuOC4xLjEuZGly
dHkNCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
