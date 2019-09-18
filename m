Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9ABB7443
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074816FA0E;
	Thu, 19 Sep 2019 07:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320123.outbound.protection.outlook.com [40.107.132.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2397B6EE5D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:34:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgpWR20cFw7I8bAMYVlC82vr23+t8f5PG8Kw4Ud/P8j/4UEdefuOE4HUKOV2R/6PuMOuifdzfvQnhcRx25fo3qc1mD1oPDfR+6CHjUQoApMwWN2PCCB4gdw1DmHkeYYzi6yl9zjQA7TplywkSEs8x0yj8Wx+O6ppRrLTc2N1hYCHGTdNjcClAw6m3hrpkOAJro5QkjD629gm0hyiRPF6C31YvUEaKg2JbZu6Nxh1ZcwebfQ/5DLW6g97Ycu2AvvsZ1d5qYojAIPv3DEYpFiI3HHSxg5/jmQWhS+CwyUjji9JF+gP89izrNf6jl6L0VAebCnXTISroOCqk2RjfPcJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YUooBcRdihS5xFS/3EQ5gOkc0Ng1eOm7f7IlkZggvg=;
 b=FdIoEB/RKB14HLIRW+xRRmr6xsCyjLkOrdj0jjsowV3obYeiDCb2k7Z2zPDV/nE2H2KQXR7X2I3onxn4PLZ7xauS7+k2ABdBJjdcOpXQIeyT9++xtKE/VA1w2R/VUt5cPQxZILx0n2pvStpRF2mJWKCzqzuq2Ui0uUyMzZtcvvQ7LaUdqpa1SlQNtYId5hcDPOrLMDbcJjDTtwdupzdvwf5YPEgrQc6GEaE9dLhwGskzEjr8M1E9YYBayggfYU1hksiiziOAPEutk0QQ2JFRL3D3mIcbMZXYWDb5GJnqROo77OxAzmh52OMvWzechTk2WQ/ltVx7/PBl67b1b6d5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com (20.177.98.81) by
 TY2PR01MB2810.jpnprd01.prod.outlook.com (20.177.100.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.24; Wed, 18 Sep 2019 14:34:04 +0000
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a]) by TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 14:34:04 +0000
From: Gareth Williams <gareth.williams.jx@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: DRM Driver implementation question
Thread-Topic: DRM Driver implementation question
Thread-Index: AdVslX1ZBzegHzojRVS64lgG04s8jgAenS2AABbmTEAALXtJgAAC+tRg
Date: Wed, 18 Sep 2019 14:34:04 +0000
Message-ID: <TY2PR01MB2924FAE6E54718ED44E0E4ABDF8E0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
References: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
 <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <TY2PR01MB292423C617848A66F61B1027DF8F0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
 <20190918130331.GD6306@pendragon.ideasonboard.com>
In-Reply-To: <20190918130331.GD6306@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 192bd398-f14a-4b5e-93ed-08d73c4541a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:TY2PR01MB2810; 
x-ms-traffictypediagnostic: TY2PR01MB2810:|TY2PR01MB2810:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB28109C96DF28036177A44E07DF8E0@TY2PR01MB2810.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(199004)(51444003)(189003)(7696005)(86362001)(6246003)(6916009)(3846002)(76176011)(99286004)(316002)(25786009)(486006)(6506007)(2906002)(26005)(102836004)(66946007)(6116002)(54906003)(66556008)(66446008)(64756008)(5660300002)(6436002)(476003)(186003)(55016002)(9686003)(71200400001)(4326008)(52536014)(3480700005)(305945005)(74316002)(8936002)(33656002)(256004)(478600001)(71190400001)(81166006)(14454004)(76116006)(81156014)(66476007)(229853002)(7736002)(446003)(66066001)(11346002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY2PR01MB2810;
 H:TY2PR01MB2924.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V4OZMMhzxQgh86xI8uI2/yCEfd4Au5/shb44840SGwbs/3FO2lauSL18d2Npjvok69ekvKqs/7XKO7I6IZuFxh6FDftu6ACDj24kL7TLZ+4kniS1ZdBdSFkjFWzAr92HhcvhvgpUrdFpcidPcbJO6tLJc0kNI0WYWRj84UwYtyfYeEIOHVaG8me3qFuLe/snBp+BDN7JvV34p0Ai14Cl/l7gM4O0wgpDuH8uLXALZ6hA5jsHsi1UBHwVyhj0M9HGm5dJFZ/muEN+SfyAsBt3HHgs9oHu5NqEkg1cmMIXHKwyDUmKtyMPGBplBeIY5/LqCfkPjij0sJSIzAblJ6DzusThaSkodXIhvvo7ZC4ir98VP6Kp+VTbYihJ9JlgsZh7KxKKebsjcdr8e2Ys3FqyGODGN6zFrkjpfFv7bJhcK1A=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192bd398-f14a-4b5e-93ed-08d73c4541a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 14:34:04.5589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HT+0cdxqkahTPYmJcH3H6lCPMONBRI02HruhZe/C77F2Y7GNGGa/JXHnQGURXsqiaq81L1HwFpmJLOreL6w043Tgx9FRTWU33vvvHgVy93I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2810
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YUooBcRdihS5xFS/3EQ5gOkc0Ng1eOm7f7IlkZggvg=;
 b=WIpKRiWPmaGmFYoY0QaIroWqyRbyxnrsdMCGsHlZmj0M8XnN9JNhTwtZ4Y5IY3P99XzOZ1qVc0IhCDG+4Z9TAcpO0U78eDaj8F8Z1q6K1BlkGGQEDvcV9MsxGZKrSTQpET74utWrVAJvNv/VGXcCiz5Bf4ES+sMuCFzMIDewLbo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=gareth.williams.jx@renesas.com; 
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KT24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDQ6MDQ6MzRQTSArMDAwMCwg
TGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gDQo+IEhpIEdhcmV0aCwNCj4gDQo+IFNvcnJ5IGZv
ciB0aGUgZGVsYXllZCByZXNwb25zZSwgSSB3YXMgdHJhdmVsbGluZyBmb3IgdGhlIExpbnV4IA0K
PiBQbHVtYmVycyBDb25mZXJlbmNlIGZvbGxvd2VkIGJ5IGEgY29kZSBjYW1wLg0KPiANCj4gT24g
VHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6Mjc6MzRQTSArMDAwMCwgR2FyZXRoIFdpbGxpYW1zIHdy
b3RlOg0KPiA+IEhpIFlvc2hpaGlybywNCj4gPg0KPiA+IFRoaXMgbG9va3MgbGlrZSBhbiBlbGVn
YW50IHNvbHV0aW9uIHRoYXQgSSBjYW4gaW1wbGVtZW50Lg0KPiA+IE1hbnkgdGhhbmtzIGZvciBw
b2ludGluZyBtZSBpbiBhIGdvb2QgZGlyZWN0aW9uLg0KPiA+DQo+ID4gPiBGcm9tOiBZb3NoaWhp
cm8gU2hpbW9kYSwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDE3LCAyMDE5IDA1OjM5IA0KPiA+
ID4gUE0NCj4gPiA+DQo+ID4gPiBIaSBHYXJldGgsDQo+ID4gPg0KPiA+ID4gPiBGcm9tOiBHYXJl
dGggV2lsbGlhbXMsIFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDE2LCAyMDE5IDEwOjU2IFBNDQo+
ID4gPiA+DQo+ID4gPiA+IEhpIExhdXJlbnQvS2llcmFuLA0KPiA+ID4gPg0KPiA+ID4gPiBJIG5l
ZWQgdG8gdXBzdHJlYW0gYSBkcml2ZXIgZm9yIGEgZGlzcGxheSBjb250cm9sbGVyIHRoYXQgd2l0
aGluIA0KPiA+ID4gPiBpdHMgcmVnaXN0ZXJzIG1lbW9yeSByZWdpb24gY29udGFpbnMgcmVnaXN0
ZXJzIHJlbGF0ZWQgdG8gYSBQV00gDQo+ID4gPiA+IGRldmljZS4gVGhlIFBXTSBkZXZpY2UgaXMg
Zm9yIGNvbnRyb2xsaW5nIHRoZSBiYWNrbGlnaHQgb2YgdGhlIA0KPiA+ID4gPiBkaXNwbGF5Lg0K
PiA+ID4gPg0KPiA+ID4gPiBJZGVhbGx5LCBJIHdvdWxkIGxpa2UgdG8gY3JlYXRlIGEgc2VwYXJh
dGVkIGRyaXZlciBmb3IgdGhlIFBXTSwgDQo+ID4gPiA+IHNvIHRoYXQgSSBjYW4gcmUtdXNlICJw
d20tYmFja2xpZ2h0IiwgYnV0IHNpbmNlIHRoZSByZWdpc3RlcnMgDQo+ID4gPiA+IGZvciB0aGUg
UFdNIGFyZSByaWdodCBpbiB0aGUgbWlkZGxlIG9mIHRoZSByZWdpc3RlcnMgZm9yIHRoZSANCj4g
PiA+ID4gZGlzcGxheSBjb250cm9sbGVyIEkgd291bGQgbmVlZCB0byBpb3JlbWFwIHRoZSBtZW1v
cnkgcmVnaW9uIGZvciANCj4gPiA+ID4gdGhlIFBXTSByZWdpc3RlcnMgcmVnaW9uIHR3aWNlLCBv
bmNlIGZyb20gdGhlIGRpc3BsYXkgY29udHJvbGxlciANCj4gPiA+ID4gZHJpdmVyLCBhbmQgb25j
ZSBmcm9tIHRoZSBQV00gZHJpdmVyLg0KPiA+ID4gPg0KPiA+ID4gPiBEbyB5b3UgdGhpbmsgdGhh
dCB0aGUgZG91YmxlIGlvcmVtYXAgd291bGQgYmUgYWNjZXB0YWJsZSB1cHN0cmVhbT8NCj4gPiA+
DQo+ID4gPiBJIHRoaW5rIHRoYXQgYW4gTUZEIGRyaXZlciBjYW4gc3VwcG9ydCBzdWNoIGhhcmR3
YXJlLiBJIGNoZWNrZWQgDQo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkIHJvdWdobHksIGFuZCB0aGVuIA0KPiA+ID4gYXRtZWwtaGxjZGMudHh0IHNlZW1zIHRvIGhh
dmUgYSBkaXNwbGF5IGNvbnRyb2xsZXIgYW5kIGEgUFdNIGRldmljZS4NCj4gDQo+IFdoaWxlIE1G
RCBzaG91bGQgdGVjaG5pY2FsbHkgd29yaywgSSB0aGluayBpdCdzIHF1aXRlIG92ZXJraWxsLiBZ
b3UgDQo+IGNvdWxkIGluc3RlYWQgYnVuZGxlIGJvdGggdGhlIGRpc3BsYXkgY29udHJvbGxlciBh
bmQgdGhlIFBXTSANCj4gY29udHJvbGxlciBpbiB0aGUgc2FtZSBkcml2ZXIuIFRoZSBkcml2ZXIg
d291bGQgY3JlYXRlIGJvdGggYSBEUk0vS01TIA0KPiBkZXZpY2UgYW5kIGEgUFdNIGRldmljZS4g
VGhlIERUIG5vZGUgZm9yIHlvdXIgZGV2aWNlIHdvdWxkIGNvbnRhaW4gYSANCj4gI3B3bS1jZWxs
cyBwcm9wZXJ0eSBhbmQgY291bGQgdGh1cyBiZSByZWZlcmVuY2VkIGFzIGEgUFdNIGNvbnRyb2xs
ZXIgDQo+IGJ5IHRoZSBiYWNrbGlnaHQgdXNpbmcgdGhlIHB3bXMgcHJvcGVydHkuDQpUaGlzIG1h
a2VzIHNlbnNlLCBtYW55IHRoYW5rcyBmb3IgcG9pbnRpbmcgbWUgaW4gdGhlIGRpcmVjdGlvbi4N
Cg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg0KS2luZCBS
ZWdhcmRzLA0KDQpHYXJldGggV2lsbGlhbXMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
