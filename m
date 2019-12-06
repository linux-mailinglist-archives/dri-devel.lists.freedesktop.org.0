Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA9A1169F3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EAE6E34B;
	Mon,  9 Dec 2019 09:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410100.outbound.protection.outlook.com [40.107.141.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174916FA57
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 15:38:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgE0GqCpWZ45Y1R+WztLrHAcuBj4MVD8AMXGChMQdYzrPS2EMd6/GvUx9jgZNJ7XvHdJXpla2+mB9JfFHZjcDKNDenTUSM43isSzMOhPQ5RlgBmX5dqEt3z/P6Y556PKCWWEh4UDkMjEAAVwGcxuqQcVbmKXliYkwIruCgFqJqHcnvhWI5g1NBfIqn7Z2MfvomUUWMBRwVxI0jlM5/2UoJYS3LZLtkKmN/CjlMjv/N/8LKnTtuwINeIgvsZWmiVYiilh233wioyVvOnf3bZRCpbQK2baQW5khHlY3jm72mFLMKWW9N5Guz1rHermhacIewy6uBcR6oR1/+Fhb4bd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o9iD+R5SHLKVgPVvOLV385UnFzf+xwHwwFKyT8Gkv8=;
 b=JJFku6WpHhYFQ1OSjtZAzd+fGzMA4tl2aX4uQr8JJw/2NhKXVVkQ9fgrmSQ4mD8MjUsok04TBK5DTqd0yUyVFNZTUUjoqOp/XUnrOdE9zttnmJL86KGk4yVuJCIb2U3p9yhV/QV7V3ieZUNRmQ938ZeTrbNDN1YMwXxnD740eH4FwbT1SiRi6+KleMBZ3MZ/PPNyPKSwMMfSu3JestsKmR9VAL6OtoWbYaD0RvjK50raA6CNC9V/oL1Y1GxUiXwQmmooOv8tVrP/LmjkLXRqlj9U9LvRLY86L1hK/I464Sqh7bUh/LZWsBCsxWq785wmhYHzPXIOLA8BN7MTe63sXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1804.jpnprd01.prod.outlook.com (52.133.162.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Fri, 6 Dec 2019 15:38:24 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2495.014; Fri, 6 Dec 2019
 15:38:24 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 5/8] drm: bridge: thc63: Do not report input bus mode
 through bridge timings
Thread-Topic: [PATCH v3 5/8] drm: bridge: thc63: Do not report input bus mode
 through bridge timings
Thread-Index: AQHVXc+dtAa7L9ebnUqFQMvbLFMepaeAjhWAgC1L5RA=
Date: Fri, 6 Dec 2019 15:38:24 +0000
Message-ID: <TY1PR01MB177084C7006801D3D03D7CF7C05F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107195215.GJ24983@pendragon.ideasonboard.com>
In-Reply-To: <20191107195215.GJ24983@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d3a54001-2464-4a02-5502-08d77a6254db
x-ms-traffictypediagnostic: TY1PR01MB1804:|TY1PR01MB1804:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1804A0D7C348393E871A0FE0C05F0@TY1PR01MB1804.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(199004)(189003)(52536014)(6916009)(305945005)(74316002)(53546011)(44832011)(7416002)(86362001)(8936002)(99286004)(81156014)(55016002)(76176011)(102836004)(6506007)(81166006)(8676002)(9686003)(4326008)(33656002)(26005)(316002)(186003)(229853002)(71200400001)(54906003)(5660300002)(7696005)(64756008)(66476007)(76116006)(66446008)(66556008)(66946007)(478600001)(2906002)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1804;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EAkZ0MNs08fVZ82Mi2sJAqCj29z8x1TtLFSHpMtY7uqbb3eOW/lMt8cFn6W1koLuz3CvpWfx6VeqIEIj0kmWa9B5tnJhMVXPyWd+FET3gSI+s3a+UQ+8DhzFawRRrEhOsKguoAJZCfdUXr9oDRceDNvakBodiT18gvrfjNXhbO8q/wWPNOZ/6uTriwxVE2lkGjTQGDw0qXxd9TTT5YThZhfh6Bcr/aB5/MeIpMyCdnGwDp0S5ju8hA6/Rsu6rB4/YmM2bPEuXK1pkz0ErnYFzeDqwIFVC7ICn5xTmQShnAXNDvVZ2txsaQTAtga/r9QNmcm/q6AR9EzqzXrhtE8LN0jVUFOvzR9WKvYojtrVxHKIr/N9d0bdCqTffrIoxxUVC1wS7KnD1cgTuxNLasX1wSLEabgHMNQ4EENTbp7fuAJ47BLqdpR0ildAC0RTZixX
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a54001-2464-4a02-5502-08d77a6254db
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 15:38:24.3739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwL3lBqQDtCBJADs6CQtzXvHB3fpV1+r8Vrb2dJQwjN+1W3pVXOBK6Ikxdj1IdZPHEywoW4C7kUIcn3K3hyIDHWZ9KoXpuF7i6LTqJSr8oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1804
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o9iD+R5SHLKVgPVvOLV385UnFzf+xwHwwFKyT8Gkv8=;
 b=DORDxZ4f5nL4RYQDINvPBiT2mHbkVM0XVM+toFZaMYV5o5qfBS/CMGOL1VaP3TQk6ug4230UIH+DNSax3KzfW5K7kFu/lzXPojg1/wwWMdLAnuAAiZT0UCpeAXW/emorQi0MBz54jY6twFTYMp/sMro5q0D1Kj8l9oJdn5MtLzU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGxp
bnV4LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbC1vd25lckB2Z2Vy
Lmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBMYXVyZW50IFBpbmNoYXJ0DQo+IFNlbnQ6IDA3IE5v
dmVtYmVyIDIwMTkgMTk6NTINCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1LzhdIGRybTogYnJp
ZGdlOiB0aGM2MzogRG8gbm90IHJlcG9ydCBpbnB1dCBidXMgbW9kZSB0aHJvdWdoIGJyaWRnZSB0
aW1pbmdzDQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNo
Lg0KPiANCj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDc6MzY6MzlQTSArMDEwMCwgRmFicml6
aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IE5vIG5lZWQgdG8gcmVwb3J0IHRoZSBpbnB1dCBidXMgbW9k
ZSB0aHJvdWdoIGJyaWRnZSB0aW1pbmdzDQo+ID4gYW55bW9yZSwgdGhhdCdzIG5vdyBkb25lIHRo
cm91Z2ggdGhlIERULCBhcyBzcGVjaWZpZWQgYnkgdGhlDQo+ID4gZHQtYmluZGluZ3MuDQo+IA0K
PiBEb2Vzbid0IHRoaXMgYnJlYWsgYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIERU
LCBhcyBtZW50aW9uZWQgaW4NCj4gdGhlIHJldmlldyBvZiA0LzggPw0KPiANCg0KSSdsbCBkcm9w
IHRoaXMgcGF0Y2ggaW4gdjQNCg0KVGhhbmtzLA0KRmFiDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAqIG5ldyBwYXRjaA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jIHwgOSArKysrLS0tLS0NCj4gPiAgaW5jbHVk
ZS9kcm0vZHJtX2JyaWRnZS5oICAgICAgICAgICAgICB8IDggLS0tLS0tLS0NCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jDQo+ID4gaW5kZXggM2Q3NDEyOWIuLjczMGY2
ODIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMNCj4gPiBA
QCAtMzQsNyArMzQsNyBAQCBzdHJ1Y3QgdGhjNjNfZGV2IHsNCj4gPiAgCXN0cnVjdCBkcm1fYnJp
ZGdlIGJyaWRnZTsNCj4gPiAgCXN0cnVjdCBkcm1fYnJpZGdlICpuZXh0Ow0KPiA+DQo+ID4gLQlz
dHJ1Y3QgZHJtX2JyaWRnZV90aW1pbmdzIHRpbWluZ3M7DQo+ID4gKwlib29sIGR1YWxfbGluazsN
Cj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCB0aGM2M19kZXYgKnRvX3Ro
YzYzKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpDQo+ID4gQEAgLTYyLDcgKzYyLDcgQEAgc3Rh
dGljIGVudW0gZHJtX21vZGVfc3RhdHVzIHRoYzYzX21vZGVfdmFsaWQoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwNCj4gPiAgCSAqIGlzbid0IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyIHlldCwg
c2ltcGx5IGRlcml2ZSB0aGUgbGltaXRzIGZyb20gdGhlDQo+ID4gIAkgKiBpbnB1dCBtb2RlLg0K
PiA+ICAJICovDQo+ID4gLQlpZiAodGhjNjMtPnRpbWluZ3MuZHVhbF9saW5rKSB7DQo+ID4gKwlp
ZiAodGhjNjMtPmR1YWxfbGluaykgew0KPiA+ICAJCW1pbl9mcmVxID0gNDAwMDA7DQo+ID4gIAkJ
bWF4X2ZyZXEgPSAxNTAwMDA7DQo+ID4gIAl9IGVsc2Ugew0KPiA+IEBAIC0xNTcsMTMgKzE1Nywx
MyBAQCBzdGF0aWMgaW50IHRoYzYzX3BhcnNlX2R0KHN0cnVjdCB0aGM2M19kZXYgKnRoYzYzKQ0K
PiA+DQo+ID4gIAkJaWYgKHJlbW90ZSkgew0KPiA+ICAJCQlpZiAob2ZfZGV2aWNlX2lzX2F2YWls
YWJsZShyZW1vdGUpKQ0KPiA+IC0JCQkJdGhjNjMtPnRpbWluZ3MuZHVhbF9saW5rID0gdHJ1ZTsN
Cj4gPiArCQkJCXRoYzYzLT5kdWFsX2xpbmsgPSB0cnVlOw0KPiA+ICAJCQlvZl9ub2RlX3B1dChy
ZW1vdGUpOw0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPg0KPiA+ICAJZGV2X2RiZyh0aGM2My0+ZGV2
LCAib3BlcmF0aW5nIGluICVzLWxpbmsgbW9kZVxuIiwNCj4gPiAtCQl0aGM2My0+dGltaW5ncy5k
dWFsX2xpbmsgPyAiZHVhbCIgOiAic2luZ2xlIik7DQo+ID4gKwkJdGhjNjMtPmR1YWxfbGluayA/
ICJkdWFsIiA6ICJzaW5nbGUiKTsNCj4gPg0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiBA
QCAtMjIxLDcgKzIyMSw2IEBAIHN0YXRpYyBpbnQgdGhjNjNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgCXRoYzYzLT5icmlkZ2UuZHJpdmVyX3ByaXZhdGUgPSB0aGM2
MzsNCj4gPiAgCXRoYzYzLT5icmlkZ2Uub2Zfbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPiA+
ICAJdGhjNjMtPmJyaWRnZS5mdW5jcyA9ICZ0aGM2M19icmlkZ2VfZnVuYzsNCj4gPiAtCXRoYzYz
LT5icmlkZ2UudGltaW5ncyA9ICZ0aGM2My0+dGltaW5nczsNCj4gPg0KPiA+ICAJZHJtX2JyaWRn
ZV9hZGQoJnRoYzYzLT5icmlkZ2UpOw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaA0KPiA+IGluZGV4IDc2MTZm
NjUuLjMyMjgwMTggMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oDQo+
ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oDQo+ID4gQEAgLTM2MiwxNCArMzYyLDYg
QEAgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyB7DQo+ID4gIAkgKiBpbnB1dCBzaWduYWwgYWZ0
ZXIgdGhlIGNsb2NrIGVkZ2UuDQo+ID4gIAkgKi8NCj4gPiAgCXUzMiBob2xkX3RpbWVfcHM7DQo+
ID4gLQkvKioNCj4gPiAtCSAqIEBkdWFsX2xpbms6DQo+ID4gLQkgKg0KPiA+IC0JICogVHJ1ZSBp
ZiB0aGUgYnVzIG9wZXJhdGVzIGluIGR1YWwtbGluayBtb2RlLiBUaGUgZXhhY3QgbWVhbmluZyBp
cw0KPiA+IC0JICogZGVwZW5kZW50IG9uIHRoZSBidXMgdHlwZS4gRm9yIExWRFMgYnVzZXMsIHRo
aXMgaW5kaWNhdGVzIHRoYXQgZXZlbi0NCj4gPiAtCSAqIGFuZCBvZGQtbnVtYmVyZWQgcGl4ZWxz
IGFyZSByZWNlaXZlZCBvbiBzZXBhcmF0ZSBsaW5rcy4NCj4gPiAtCSAqLw0KPiA+IC0JYm9vbCBk
dWFsX2xpbms7DQo+ID4gIH07DQo+ID4NCj4gPiAgLyoqDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0K
PiANCj4gTGF1cmVudCBQaW5jaGFydA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
