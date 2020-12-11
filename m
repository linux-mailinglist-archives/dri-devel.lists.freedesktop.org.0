Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A62D7172
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497316ECB9;
	Fri, 11 Dec 2020 08:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F76A6E506
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 00:43:46 +0000 (UTC)
X-UUID: 64007bfe9bda4250a66bb62adb9df86a-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=9ay92vJHRsP0Lw8N1DrQDzyGcCnZb1dWhvfOIQHVeYI=; 
 b=IkMqHI2pYD+qPjlbKdtw0d+jEEBW/58ll79jtKQKnv5zO4twN68xQJmHXhLeLliQTec6KO6yVaBFBghyJ+gguEhY4CxcydrBiIgqcHPEpq2699YNMpOwgHs4YN8v0KfKniHNUfWKcrv93nqsfqkczMnd5qHk4FpT4AOXdkqeh+s=;
X-UUID: 64007bfe9bda4250a66bb62adb9df86a-20201211
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1712883575; Fri, 11 Dec 2020 08:43:38 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Dec 2020 08:43:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Dec 2020 08:43:35 +0800
Message-ID: <1607647416.12750.3.camel@mhfsdcap03>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 11 Dec 2020 08:43:36 +0800
In-Reply-To: <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDIzOjQwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMOaXpSDpgLHlm5sg5LiL5Y2INToyMuWvq+mBk++8
mg0KPiA+DQo+ID4gcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUg
U09DLCBhZGQgdGhpcw0KPiA+IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWENCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkaXNwLnR4dCAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNw
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRpc3AudHh0DQo+ID4gaW5kZXggMTIxMjIwNy4uNjRjNjRlZSAxMDA2NDQNCj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0DQo+ID4gQEAgLTY2LDYg
KzY2LDEzIEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOg0KPiA+
ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11
L21lZGlhdGVrLGlvbW11LnR4dA0KPiA+ICAgIGZvciBkZXRhaWxzLg0KPiA+DQo+ID4gK09wdGlv
bmFsIHByb3BlcnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToNCj4gPiArLSBtZWRpYXRlayxy
ZG1hX2ZpZm9fc2l6ZTogcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNh
bWUgU09DLCBhZGQgdGhpcw0KPiA+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJk
bWENCj4gPiArICB0aGUgdmFsdWUgaXMgdGhlIE1heCB2YWx1ZSB3aGljaCBkZWZpbmVkIGluIGhh
cmR3YXJlIGRhdGEgc2hlZXQuDQo+ID4gKyAgcmRtYV9maWZvX3NpemUgb2YgcmRtYTAgaW4gbXQ4
MTgzIGlzIDUxMjANCj4gPiArICByZG1hX2ZpZm9fc2l6ZSBvZiByZG1hMSBpbiBtdDgxODMgaXMg
MjA0OA0KPiA+ICsNCj4gPiAgRXhhbXBsZXM6DQo+ID4NCj4gPiAgbW1zeXM6IGNsb2NrLWNvbnRy
b2xsZXJAMTQwMDAwMDAgew0KPiA+IEBAIC0yMDcsMyArMjE0LDEyIEBAIG9kQDE0MDIzMDAwIHsN
Cj4gPiAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxNzNfUE9XRVJfRE9NQUlO
X01NPjsNCj4gPiAgICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfT0Q+Ow0KPiA+
ICB9Ow0KPiA+ICsNCj4gPiArcmRtYTE6IHJkbWFAMTQwMGMwMDAgew0KPiA+ICsgICAgICAgY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1yZG1hIjsNCj4gPiArICAgICAgIHJlZyA9
IDwwIDB4MTQwMGMwMDAgMCAweDEwMDA+Ow0KPiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDIyOSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICsgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01BSU5fRElTUD47DQo+ID4gKyAgICAgICBjbG9ja3Mg
PSA8Jm1tc3lzIENMS19NTV9ESVNQX1JETUExPjsNCj4gPiArICAgICAgIG1lZGlhdGVrLHJkbWFf
Zmlmb19zaXplID0gPDIwNDg+Ow0KPiA+ICt9Ow0KPiANCj4gSW4gWzFdLCBSb2IgaGFzIHN1Z2dl
c3QgdGhhdCBub3QgYWRkIGV4YW1wbGUgb2YgcmRtYTEsIGl0J3MgYmV0dGVyIHRvDQo+IGFkZCBt
ZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZSBpbiByZG1hMCBmb3IgZXhhbXBsZS4NCj4gDQo+IFsxXSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gv
MTU5Njg1NTIzMS01NzgyLTItZ2l0LXNlbmQtZW1haWwteW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20vDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KDQp0aGUgZGVzY3JpcHRpb24gb2Yg
cmRtYTAgaXMgbXQ4MTczLCBhbmQgbXQ4MTczIHJkbWEgZHJpdmVyIHNldCB0aGUNCmNvcnJlc3Bv
bmQgZmlmbyBzaXplIGFscmVhZHkgb2sgbGlrZSB0aGlzOg0Kc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfZGlzcF9yZG1hX2RhdGEgbXQ4MTczX3JkbWFfZHJpdmVyX2RhdGEgPSB7DQoJLmZpZm9fc2l6
ZSA9IFNaXzhLLA0KfTsgDQoNCnBsZWFzZSBkb3VibGUgY29uZmlybSBzaGFsbCB3ZSBhZGQgdGhp
cyBpbmZvcm1hdGlvbiBpbnRvIHJkbWEwDQpkZXNjcmlwdGlvbi4NCg0KDQo+IA0KPiA+IC0tDQo+
ID4gMS44LjEuMS5kaXJ0eQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
