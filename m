Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA762EA670
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A826E086;
	Tue,  5 Jan 2021 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9752689FA6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 06:36:27 +0000 (UTC)
X-UUID: c90ba1b80b924e7bb4a62c880fbfec90-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=uOuUrNyJqVyw+bf7rxjNIRMo6y7sN/EKdL9L1mBNcBM=; 
 b=aJsTy3qY9NtFIXiQXyTYFS8BX5x8xKLOXnMr8iMLFuMp4EHtPwk2gZXjNBMLYjMegvUWfbPVImx3xNBzEs08NV9EfQmYQIeKIKXNR7y+P1TYzSqHZA5ikfcR4q5hRUvU8JyUq9PqDdeNdXCBfRSU+P/HmWLmsuDEA3rhVNV2QNw=;
X-UUID: c90ba1b80b924e7bb4a62c880fbfec90-20210105
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 71353384; Tue, 05 Jan 2021 14:36:20 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Jan 2021 14:36:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 14:36:17 +0800
Message-ID: <1609828577.1574.5.camel@mhfsdcap03>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 Jan 2021 14:36:17 +0800
In-Reply-To: <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
 <1607647514.12750.5.camel@mhfsdcap03>
 <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDIyOjU0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMeaXpSDpgLHkupQg5LiK5Y2IODo0NeWvq+mBk++8
mg0KPiA+DQo+ID4gT24gVGh1LCAyMDIwLTEyLTEwIGF0IDIzOjUwICswODAwLCBDaHVuLUt1YW5n
IEh1IHdyb3RlOg0KPiA+ID4gSGksIFlvbmdxaWFuZzoNCj4gPiA+DQo+ID4gPiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQxMuaciDEw5pelIOmA
seWbmyDkuIvljYg1OjA45a+r6YGT77yaDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRk
IFJETUEgZmlmbyBzaXplIGVycm9yIGhhbmRsZQ0KPiA+ID4gPiByZG1hIGZpZm8gc2l6ZSB3aWxs
IG5vdCBhbHdheXMgYmlnZ2VyIHRoYW4gdGhlIGNhbGN1bGF0ZWQgdGhyZXNob2xkDQo+ID4gPiA+
IGlmIHRoYXQgY2FzZSBoYXBwZW5lZCwgd2UgbmVlZCBzZXQgZmlmbyBzaXplIGFzIHRoZSB0aHJl
c2hvbGQNCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyB8IDQgKysrKw0KPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gPiA+ID4gaW5kZXggNzk0YWNjNS4uMDUwODM5
MiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X3JkbWEuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
cmRtYS5jDQo+ID4gPiA+IEBAIC0xNTEsNiArMTUxLDEwIEBAIHN0YXRpYyB2b2lkIG10a19yZG1h
X2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgd2lkdGgsDQo+
ID4gPiA+ICAgICAgICAgICogYWNjb3VudCBmb3IgYmxhbmtpbmcsIGFuZCB3aXRoIGEgcGl4ZWwg
ZGVwdGggb2YgNCBieXRlczoNCj4gPiA+ID4gICAgICAgICAgKi8NCj4gPiA+ID4gICAgICAgICB0
aHJlc2hvbGQgPSB3aWR0aCAqIGhlaWdodCAqIHZyZWZyZXNoICogNCAqIDcgLyAxMDAwMDAwOw0K
PiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgaWYgKHRocmVzaG9sZCA+IHJkbWFfZmlmb19zaXpl
KQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgdGhyZXNob2xkID0gcmRtYV9maWZvX3NpemU7DQo+
ID4gPg0KPiA+ID4gSWYgdGhlIGZvcm11bGEgaXMgbm90IGNvcnJlY3QsIHlvdSBzaG91bGQgZml4
IHRoZSBmb3JtdWxhIG5vdCB3b3JrIGFyb3VuZC4NCj4gPiA+DQo+ID4gPiBSZWdhcmRzLA0KPiA+
ID4gQ2h1bi1LdWFuZy4NCj4gPg0KPiA+IGhvdyBhYm91dCB0aGlzOg0KPiA+IHRocmVzaG9sZCA9
IG1heCh3aWR0aCAqIGhlaWdodCAqIHZyZWZyZXNoICogNCAqIDcgLyAxMDAwMDAwLA0KPiA+IHJk
bWFfZmlmb19zaXplKTsNCj4gDQo+IFdoZW4gSSB1c2Ugd2lkdGggPSAxOTIwLCBoZWlnaHQgPSAx
MDgwLCB2cmVmcmVzaCA9IDYwIHRvIGNhbGN1bGF0ZSwgSQ0KPiBnZXQgdGhyZXNob2xkID0gMjk4
NS4NCj4gU28gSSB0aGluayBzZXQgdGhyZXNob2xkIHRvIGhhbGYgb2YgZmlmbyBzaXplIGlzIE9L
IGZvciBNQVhfV0lEVEgsDQo+IE1BWF9IRUlHSFQsIE1BWF9WUkVGUkVTSCAodGhlc2UgdGhyZWUg
bWF5IGJlIGRpZmZlcmVudCBpbiBlYWNoIFNvQykNCj4gDQo+IHRocmVzaG9sZCA9IFJETUFfRklG
T19QU0VVRE9fU0laRShyZG1hX2ZpZm9fc2l6ZSkgLyAyOw0KPiANCj4gQnV0IEkgd29ycnkgaGFs
ZiBmaWZvIHNpemUgaXMgdG9vIGJpZyBmb3Igc21hbGwgcmVzb2x1dGlvbiBhbmQgbGV0DQo+IHNt
YWxsIHJlc29sdXRpb24gdG9vIGVhc3kgdG8gdHJpZ2dlciBidXJzdCByZWFkIERSQU0uIFNvIGxl
dCB0aGUNCj4gZm9ybXVsYSB0byBiZSB0aGlzOg0KPiANCj4gdGhyZXNob2xkID0gUkRNQV9GSUZP
X1BTRVVET19TSVpFKHJkbWFfZmlmb19zaXplKSAqIHdpZHRoICogaGVpZ2h0ICoNCj4gdnJlZnJl
c2ggLyAyIC8gTUFYX1dJRFRIIC8gTUFYX0hFSUdIVCAvIE1BWF9WUkVGUkVTSDsNCj4gDQo+IEhv
dyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcz8NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3Vhbmcu
DQoNCmhvdyBhYm91dCByZW1vdmUgdGhpcyBmb3JtdWxhLCBhbmQgc2V0IHRocmVzaG9sZCA9IHJk
bWFfZmlmb19zaXplDQo+IA0KPiA+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiAgICAgICAgIHJlZyA9
IFJETUFfRklGT19VTkRFUkZMT1dfRU4gfA0KPiA+ID4gPiAgICAgICAgICAgICAgIFJETUFfRklG
T19QU0VVRE9fU0laRShyZG1hX2ZpZm9fc2l6ZSkgfA0KPiA+ID4gPiAgICAgICAgICAgICAgIFJE
TUFfT1VUUFVUX1ZBTElEX0ZJRk9fVEhSRVNIT0xEKHRocmVzaG9sZCk7DQo+ID4gPiA+IC0tDQo+
ID4gPiA+IDEuOC4xLjEuZGlydHkNCj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiA+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
DQo+ID4gPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiA+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0K
PiA+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
