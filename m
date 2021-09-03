Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77893FF905
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 05:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992E76E07D;
	Fri,  3 Sep 2021 03:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AFE6E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 03:08:23 +0000 (UTC)
X-UUID: bd5b64a7326e450b843e6845123182e6-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=I7eErvKCjKSoZMUT8uEkUsYqIR3doV0E2tnrfW34Oyc=; 
 b=t1/A0CMwFK6DR/affEE0ye5ClSnjIKHGU3OBDCvCPOyO6Od+E/xqbUNw/ziy6jRhv6U3JgQdb6P3rlYIqukW4kA2N3h101qXVVMfKpmIbk+LHu9cZJdrA4nBgIjLrZ5XPD4s0ZJzd5KdzZMwvE0+EcR13iNfDv0IZ8eCkAtNAB4=;
X-UUID: bd5b64a7326e450b843e6845123182e6-20210903
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1779183396; Fri, 03 Sep 2021 11:08:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 11:08:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 3 Sep 2021 11:08:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 11:08:14 +0800
Message-ID: <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 3 Sep 2021 11:08:13 +0800
In-Reply-To: <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
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

SGkgRXplcXVpZWwsDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KT24gVGh1LCAyMDIx
LTA5LTAyIGF0IDEzOjMwIC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6DQo+IE9uIFdlZCwg
MSBTZXB0IDIwMjEgYXQgMDU6MzIsIFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5j
b20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgbXVs
dGkgaGFyZHdhcmUgZGVjb2RlIGludG8gbXRrLXZjb2RlYywgDQo+ID4gYnkgZmlyc3QNCj4gPiBh
ZGRpbmcgY29tcG9uZW50IGZyYW1ld29yayB0byBtYW5hZ2UgZWFjaCBoYXJkd2FyZSBpbmZvcm1h
dGlvbjoNCj4gPiBpbnRlcnJ1cHQsDQo+ID4gY2xvY2ssIHJlZ2lzdGVyIGJhc2VzIGFuZCBwb3dl
ci4gU2Vjb25kbHkgYWRkIGNvcmUgdGhyZWFkIHRvIGRlYWwNCj4gPiB3aXRoIGNvcmUNCj4gPiBo
YXJkd2FyZSBtZXNzYWdlLCBhdCB0aGUgc2FtZSB0aW1lLCBhZGQgbXNnIHF1ZXVlIGZvciBkaWZm
ZXJlbnQNCj4gPiBoYXJkd2FyZQ0KPiA+IHNoYXJlIG1lc3NhZ2VzLiBMYXN0bHksIHRoZSBhcmNo
aXRlY3R1cmUgb2YgZGlmZmVyZW50IHNwZWNzIGFyZSBub3QNCj4gPiB0aGUgc2FtZSwNCj4gPiB1
c2luZyBzcGVjcyB0eXBlIHRvIHNlcGFyYXRlIHRoZW0uDQo+ID4gDQo+ID4gVGhpcyBzZXJpZXMg
aGFzIGJlZW4gdGVzdGVkIHdpdGggYm90aCBNVDgxODMgYW5kIE1UODE3My4gRGVjb2RpbmcNCj4g
PiB3YXMgd29ya2luZw0KPiA+IGZvciBib3RoIGNoaXBzLg0KPiA+IA0KPiA+IFBhdGNoZXMgMX4z
IHJld3JpdGUgZ2V0IHJlZ2lzdGVyIGJhc2VzIGFuZCBwb3dlciBvbi9vZmYgaW50ZXJmYWNlLg0K
PiA+IA0KPiA+IFBhdGNoIDQgYWRkIGNvbXBvbmVudCBmcmFtZXdvcmsgdG8gc3VwcG9ydCBtdWx0
aSBoYXJkd2FyZS4NCj4gPiANCj4gPiBQYXRjaCA1IHNlcGFyYXRlIHZpZGVvIGVuY29kZXIgYW5k
IGRlY29kZXIgZG9jdW1lbnQNCj4gPiANCj4gPiBQYXRjaGVzIDYtMTUgYWRkIGludGVyZmFjZXMg
dG8gc3VwcG9ydCBjb3JlIGhhcmR3YXJlLg0KPiA+IC0tLS0NCj4gPiBUaGlzIHBhdGNoIGRlcGVu
ZGVudHMgb24gOiAibWVkaWE6IG10ay12Y29kZWM6IHN1cHBvcnQgZm9yIE1UODE4Mw0KPiA+IGRl
Y29kZXIiWzFdIGFuZA0KPiA+ICJNZWRpYXRlayBNVDgxOTIgY2xvY2sgc3VwcG9ydCJbMl0uDQo+
ID4gDQo+ID4gMTogTXVsdGkgaGFyZHdhcmUgZGVjb2RlIGlzIGJhc2VkIG9uIHN0YXRlbGVzcyBk
ZWNvZGVyLCBNVDgxODMgaXMNCj4gPiB0aGUgZmlyc3QgdGltZQ0KPiA+IHRvIGFkZCBzdGF0ZWxl
c3MgZGVjb2Rlci4gT3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgY29uZmxpY3QuIFRoaXMNCj4gPiBw
YXRjaCB3aWxsIGJlDQo+ID4gYWNjZXB0ZWQgaW4gNS4xNVsxXS4NCj4gPiANCj4gPiAyOiBUaGUg
ZGVmaW5pdGlvbiBvZiBkZWNvZGVyIGNsb2NrcyBhcmUgaW4gbXQ4MTkyLWNsay5oLCB0aGlzIHBh
dGNoDQo+ID4gYWxyZWFkeSBpbiBjbGsgdHJlZVsyXS4NCj4gPiANCj4gPiBbMV0NCj4gPiBodHRw
czovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2xpc3QvP3Nlcmll
cz01ODI2DQo+ID4gWzJdDQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvY2xrL2xpbnV4LmdpdC9jb21taXQvP2g9Y2xrLW5leHQmaWQ9ZjM1ZjFhMjNl
MGUxMmUzMTczZTllOWRlZGJjMTUwZDEzOTAyNzE4OQ0KPiA+IC0tLS0NCj4gPiBDaGFuZ2VzIGNv
bXBhcmVkIHdpdGggdjU6DQo+ID4gLUFkZCBkZWNvZGVyIGhhcmR3YXJlIGJsb2NrIGRpYWdyYW0g
Zm9yIHBhdGNoIDEzLzE1DQo+ID4gDQo+IA0KPiANCj4gVGhlIGRpc2N1c3Npb24gb24gdjUgd2Fz
IHN0aWxsIG9uLWdvaW5nLCBzbyBzZW5kaW5nIHRoaXMgdjYNCj4gaXMgbm90IGhlbHBmdWwuIFRo
ZSBjb250ZXh0IGZvciB2NSdzIGRpc2N1c3Npb24gaXMgbm93IGhhcmRlciB0bw0KPiBmaW5kLg0K
PiANCg0KPiBQbGVhc2UgYXZvaWQgc2VuZGluZyBhIG5ldyB2ZXJzaW9uIHdpdGhvdXQgcHJvcGVy
bHkNCj4gZGlzY3Vzc2luZyBhbGwgdGhlIGZlZWRiYWNrLCBhbmQgd2l0aG91dCByZWFjaGluZyBj
b25zZW5zdXMuDQo+IFRoaXMgaXMgdmVyeSBpbXBvcnRhbnQsIHBsZWFzZSBrZWVwIGl0IGluIG1p
bmQuDQo+IA0KVGhhbmtzIGZvciB5b3VyIHJlbWluZCwgSSB3aWxsIGtlZXAgdGhpcyBwYXRjaCB1
bnRpbCBnZXQgdGhlIHNvbHV0aW9uLg0KDQo+IFNwZWNpZmljYWxseSwgdGhlIGZlZWRiYWNrIG9u
IHY1IHdhcyBOQUssIHdpdGggdGhlIHJlcXVlc3QgdG8gYXZvaWQNCj4gdXNpbmcgYW55IGFzeW5j
IGZyYW1ld29yaywgYW5kIGluc3RlYWQgdHJ5IHRvIGZpbmQgYSBzaW1wbGVyDQo+IHNvbHV0aW9u
Lg0KPiANCj4gRm9yIGluc3RhbmNlLCB5b3UgY2FuIG1vZGVsIHRoaW5ncyB3aXRoIGEgYnVzLWxp
a2UgcGF0dGVybiwNCj4gd2hpY2ggdGllcyBhbGwgdGhlIGRldmljZXMgdG9nZXRoZXIsIHVuZGVy
IGEgcGFyZW50IG5vZGUuDQo+IFRoaXMgcGF0dGVybiBpcyBjb21tb24gaW4gdGhlIGtlcm5lbCwg
dGhlIHBhcmVudA0KPiBub2RlIGNhbiB1c2Ugb2ZfcGxhdGZvcm1fcG9wdWxhdGUgb3Igc2ltaWxh
cg0KPiAoZ2l0IGdyZXAgb2ZfcGxhdGZvcm1fcG9wdWxhdGUsIHlvdSB3aWxsIHNlZSBwbGVudHkg
b2YgZXhhbXBsZXMpLg0KPiANCj4gWW91IHdpbGwgc3RpbGwgaGF2ZSB0byBkbyBzb21lIHdvcmsg
dG8gaGF2ZSB0aGUgcHJvcGVyDQo+IHJlZ3MgcmVzb3VyY2VzLCBidXQgdGhpcyBpcyBkb2FibGUu
IEVhY2ggY2hpbGQgaXMgYSBkZXZpY2UsDQo+IHNvIGl0IGNhbiBoYXZlIGl0cyBvd24gcmVzb3Vy
Y2VzIChjbG9ja3MsIGludGVycnVwdHMsIGlvbW11cykuDQo+IA0KPiBZb3UgZG9uJ3QgbmVlZCBh
bnkgYXN5bmMgZnJhbWV3b3JrLg0KPiANCklmIHB1dCB0aGUgbGF0IGFuZCBjb3JlIG5vZGUgaW4g
dGhlIHBhcmVudCBub2RlLCBuZWVkIHRvIGNoZWNrIHRoZQ0KYmVsb3cgdGhpbmdzIGFmdGVyIGRp
c2N1c3NlZCB3aXRoIGlvbW11IG93bmVyLg0KDQpJZiBwdXR0aW5nIHRoZSBpb21tdXMgcHJvcGVy
dHkgaW4gdGhlIGNoaWxkIG5vZGUsIHRoZW4gaXMgdGhlIGNoaWxkDQpkZXZpY2UgYSBzdGFuZGFy
ZCBwbGF0Zm9ybSBkZXZpY2U/DQoNClRoZSBpb21tdSByZWdpc3RlIGxpa2UgdGhpczogIA0KcmV0
ID0gYnVzX3NldF9pb21tdSgmcGxhdGZvcm1fYnVzX3R5cGUsICZtdGtfaW9tbXVfb3BzKTsgDQpJ
dCBleHBlY3QgdGhlIGNvbnN1bWVyIGlzIGEgc3RhbmRhcmQgcGxhdGZvcm0gZGV2aWNlLiBvdGhl
cndpc2UgaXQNCmNvdWxkIG5vdCBlbnRlciB0byB0aGUgaW9tbXUgb2ZfeGxhdGUuKQ0KDQpUaGFu
a3MNCll1bmZlaSBEb25nDQo+ICAgICB2Y29kZWNfZGVjOiB2Y29kZWNfZGVjQDE2MDAwMDAwIHsN
Cj4gICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi12Y29kZWMtZGVjIjsNCj4g
ICAgICAgICByZWcgPSA8c29tZXRoaW5nPjsNCj4gICAgICAgICBtZWRpYXRlayxzY3AgPSA8JnNj
cD47DQo+ICAgICAgICAgaW9tbXVzID0gPCZpb21tdTAgTTRVX1BPUlRfTDRfVkRFQ19NQ19FWFQ+
Ow0KPiAgICAgICAgIGRtYS1yYW5nZXMgPSA8MHgxIDB4MCAweDAgMHg0MDAwMDAwMCAweDAgMHhm
ZmYwMDAwMD47DQo+IA0KPiAgICAgICAgIHZjb2RlY19sYXRAMHgxMDAwMCB7DQo+ICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXRrLXZjb2RlYy1sYXQiOw0KPiAgICAgICAgICAg
ICByZWcgPSA8MHgxMDAwMCAweDgwMD47ICAgICAgLyogVkRFQ19NSVNDICovDQo+ICAgICAgICAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA0MjYgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCj4g
ICAgICAgICAgICAgLy8gZXRjDQo+ICAgICAgICAgfTsNCj4gDQo+ICAgICAgICAgdmNvZGVjX2Nv
cmVAMHgyNTAwMCB7DQo+ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdGstdmNv
ZGVjLWNvcmUiOw0KPiAgICAgICAgICAgIHJlZyA9IDwweDI1MDAwIDB4MTAwMD47ICAgICAgLyog
VkRFQ19DT1JFX01JU0MgKi8NCj4gICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDI1
IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQo+ICAgICAgICAgICAgLy8gZXRjDQo+ICAgICAgICAg
fTsNCj4gICAgIH07DQo+IA0KPiBUaGFua3MsDQo+IEV6ZXF1aWVsDQo=

