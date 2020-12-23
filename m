Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEB82E1B39
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE236E921;
	Wed, 23 Dec 2020 10:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52F0C8982F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 01:19:50 +0000 (UTC)
X-UUID: b7472a1bfd444d6092d3d6ff641decd3-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=CTTiUQ0OgzISxmTNGbo4qKF1FUv27uRYg9CNv2nwUSQ=; 
 b=T+YCnhzL3oG+yoTg2EpLwrRyx6IpXAhR9B+4BsjKzsXnUD/ePiNfGRUHHKfRIw9qXw4vpcudUiI5gCc67sFrPabT/Gpb0c8u3RQAh1jYrVjVxZya6ncq9Dznr2eSCofIbsfmCBF0TfGzolJ1g/JpB1Nu6QBjxfB8jEYKO44SqcM=;
X-UUID: b7472a1bfd444d6092d3d6ff641decd3-20201223
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2114669264; Wed, 23 Dec 2020 09:19:48 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:19:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:19:40 +0800
Message-ID: <1608686383.18252.6.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 02/17] dt-bindings: mediatek: add CLK_MM_DISP_CONFIG
 control description for mt8192 display
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:19:43 +0800
In-Reply-To: <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-3-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
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

T24gV2VkLCAyMDIwLTEyLTE2IGF0IDIzOjE3ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTLlr6vpgZPv
vJoNCj4gPg0KPiA+IGFkZCBDTEtfTU1fRElTUF9DT05GSUcgY29udHJvbCBkZXNjcmlwdGlvbiBm
b3IgbXQ4MTkyIGRpc3BsYQ0KPiANCj4gZGlzcGxheQ0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dCB8IDMgKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0DQo+
ID4gaW5kZXggMTk3MmZhNy4uZGZiZWM3NiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRpc3AudHh0DQo+ID4gQEAgLTU0LDYgKzU0LDkgQEAgUmVxdWlyZWQgcHJv
cGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6DQo+ID4gICAgRFBJIGNvbnRyb2xsZXIgbm9k
ZXMgaGF2ZSBtdWx0aXBsZSBjbG9jayBpbnB1dHMuIFRoZXNlIGFyZSBkb2N1bWVudGVkIGluDQo+
ID4gICAgbWVkaWF0ZWssZHNpLnR4dCBhbmQgbWVkaWF0ZWssZHBpLnR4dCwgcmVzcGVjdGl2ZWx5
Lg0KPiA+ICAgIEFuIGV4Y2VwdGlvbiBpcyB0aGF0IHRoZSBtdDgxODMgbXV0ZXggaXMgYWx3YXlz
IGZyZWUgcnVubmluZyB3aXRoIG5vIGNsb2NrcyBwcm9wZXJ0eS4NCj4gPiArICBBbiBleGNlcHRp
b24gaXMgdGhhdCB0aGUgbXQ4MTkyIGRpc3BsYXkgYWRkIDIgbW9yZSBjbG9ja3MoQ0xLX01NX0RJ
U1BfQ09ORklHLCBDTEtfTU1fMjZNSFopLA0KPiA+ICsgIGFuZCB0aGVzZSAyIGNsb2NrcyBuZWVk
IGVuYWJsZWQgYmVmb3JlIGRpc3BsYXkgbW9kdWxlIHdvcmsgbGlrZSBtdXRleCBjbG9jaywgc28g
d2UgYWRkIHRoZXNlDQo+ID4gKyAgMiBjbG9ja3MgY29udHJvbGVkIHNhbWUgd2l0aCBtdXRleCBj
bG9jay4NCj4gDQo+IElmIGV2ZXJ5IGRpc3BsYXkgbW9kdWxlIG5lZWRzIHRoZXNlIHR3byBjbG9j
aywgYWRkIHRoZXNlIHR3byBjbG9jayB0bw0KPiBhbGwgdGhlIGRpc3BsYXkgbW9kdWxlIHdoaWNo
IG5lZWQgdGhlbS4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQoNCmFsbCBkaXNwbGF5
IG1vZHVsZSB3b3JrIG5lZWQgbXV0ZXggY2xvY2sgd29yayBvbiwgYnV0IG5vdCBhZGQgbXV0ZXgN
CmNsb2NrIGludG8gYWxsIGRpc3BsYXkgbW9kdWxlDQo+IA0KPiA+DQo+ID4gIFJlcXVpcmVkIHBy
b3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOg0KPiA+ICAtIGNvbXBhdGlibGU6IFNob3Vs
ZCBiZSBvbmUgb2YNCj4gPiAtLQ0KPiA+IDEuOC4xLjEuZGlydHkNCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
