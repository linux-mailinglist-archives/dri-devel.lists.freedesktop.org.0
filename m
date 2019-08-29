Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1610A3253
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3406E10D;
	Fri, 30 Aug 2019 08:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400134.outbound.protection.outlook.com [40.107.140.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D2389885
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 09:14:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX89OOR25YTJb0YfOezgd9EF4nQTPuHIVM1w9GZ/+HSqGUVvM1b44ZK4kYRD3h5T3OAmtjR4Z8ydW46NAc1w2hJzla+6G4pJ5tAHcnPFwN0h4XgLjHB7+FrUiD2djcV23qguGG6Hugsm4L11VOOUMUsnyMvQDQdBCfFHjLRyAwIVz6GmM4VgJTAKB1anRUZim6O35FWZKJ5e9OkSC974a+oMVUaVgSmn3/tsZhUGUMCMqIAeR9+kTeq7ShKvKqiSyoqRJm+wOlj1iCd5hsko+I96H5UBj8sun9CNgCm7K74cEFbR7dbWdK4XM0/AIajqPAU8hyTswnibzbgKY5MowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU+IBAgL63ETEHONRM6ycS5duIzneuOh/CXVlRegt9k=;
 b=iC/pudAWv6kdUFBdgKPHvADPQNSPon2Pp+HCdjweB+iSxDhNtQsXt725IaSjx82LTZMvPJIaokFBOGrVuTcY1d6YakoIFPPWZBJ2gQYY17itVeCZkPofk3wwk/ne/TDDk3wfPZkxGR4bRsEpe6LE8an84qXpG0YmjZXSGaFLZr3i19ZK7qkUDzT8faS0b8LJRwUR1sM/jVYkxOwU44bp6FV14w8N+qvYFWNVIHKmhOdFxrOwKdxajqy0gXmFD0zINwCrXZ+HRqznbvAIyQspXv3cdIJpLQhTzOJNsPhH88xxREXGAig16pMrpiMMFbOfKL9PmSCZJ89ZRixz0WzzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from OSBPR01MB1766.jpnprd01.prod.outlook.com (52.134.225.140) by
 OSBPR01MB1720.jpnprd01.prod.outlook.com (52.134.227.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 29 Aug 2019 09:14:37 +0000
Received: from OSBPR01MB1766.jpnprd01.prod.outlook.com
 ([fe80::a526:6289:fda9:289d]) by OSBPR01MB1766.jpnprd01.prod.outlook.com
 ([fe80::a526:6289:fda9:289d%4]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 09:14:37 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Topic: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Index: AQHVXc+S57mj9oC72Eeu0P6rCOw/zacRwzeAgAAQB1A=
Date: Thu, 29 Aug 2019 09:14:37 +0000
Message-ID: <OSBPR01MB176683A6508892FBF1159FEDC0A20@OSBPR01MB1766.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVPsT=1R7DAnmui+iaWcnoy52Xrr47zLWbgmUumBZ2sdw@mail.gmail.com>
In-Reply-To: <CAMuHMdVPsT=1R7DAnmui+iaWcnoy52Xrr47zLWbgmUumBZ2sdw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0015f1b1-8cb6-40df-94da-08d72c6150ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:OSBPR01MB1720; 
x-ms-traffictypediagnostic: OSBPR01MB1720:|OSBPR01MB1720:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1720290655693FDDF2FD2B98C0A20@OSBPR01MB1720.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(199004)(189003)(14454004)(305945005)(86362001)(99286004)(476003)(76116006)(6116002)(3846002)(4326008)(64756008)(66556008)(44832011)(74316002)(71200400001)(71190400001)(6916009)(316002)(54906003)(478600001)(66476007)(66446008)(26005)(66946007)(7696005)(186003)(7416002)(102836004)(8936002)(5660300002)(2906002)(33656002)(81156014)(6246003)(8676002)(53376002)(25786009)(256004)(52536014)(81166006)(76176011)(7736002)(966005)(229853002)(486006)(6436002)(53936002)(53546011)(6506007)(55016002)(6306002)(11346002)(446003)(9686003)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB1720;
 H:OSBPR01MB1766.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SENtI4rhanYzHV/J6HFjRullhPYBZMxkKQ+aUvxYDk6X9ctTnuiiNeAZW67v88dWxGiNvqEtTc77XYMGhHV+GV6pb1tFdAQrDKjLWImETNhdPPTyUDE8RcYu7CbhutkJ6Om6bdz96/QJw7krHFdvEk5gryDv2rNkzAnN9YkT5opKbv5EEuEXtBsYGHfTGdF5y5FkcDIb2vGk5N3mNllgxegkMe0oFAs/rHAilHwSQXHDXNxnyuiW5c45QQWhLRUSerMwla3r5M2IEoSP50hPBVZW//dHP4mHj9Y9Fi2/NpLEUBZUCeqej5yDmQmCMSsgrMB42qNKo4+aZJUX/PVuuV+w6akZQPz1Qw/DkECre2+rf6HmtK//bEdp4PoEE+12YTPBYrpTMEc+dmtxZs595As/TDC85vY6YeYjBrcyCsI=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0015f1b1-8cb6-40df-94da-08d72c6150ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 09:14:37.5268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8CXXuYLj2hLOWO1vjNGRFX4VLfajjNAO8dAUesniOozQx2ZPdv0IYXkqIDfecU1+2d8Un6i60aAgirhcT0OlR5QclfkNGXOKTaZzTc0ejc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1720
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU+IBAgL63ETEHONRM6ycS5duIzneuOh/CXVlRegt9k=;
 b=blHcpdg2Hudf1wb5dSurush0gRQ9TyKIUw1ViQLjoA4t34l2WrEtTXc/8c52g6CR9PxClfTcQcDhXfFasJSIC7Sx7aAXY4jjJkGJWYK9aqbGC3f8e0pqqBCJEbxStXx7CT5CnF68aX8U6u3MREna3bpD558I6ZZEdD2OWv91Bms=
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBsaW51
eC1rZXJuZWwtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJuZWwtb3duZXJAdmdlci5r
ZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDI5IEF1
Z3VzdCAyMDE5IDA4OjU4DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS84XSBkdC1iaW5kaW5n
czogZGlzcGxheTogQWRkIGJpbmRpbmdzIGZvciBMVkRTIGJ1cy10aW1pbmdzDQo+IA0KPiBIaSBG
YWJyaXppbywNCj4gDQo+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDg6MzYgUE0gRmFicml6aW8g
Q2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IER1
YWwtTFZEUyBjb25uZWN0aW9ucyBuZWVkIG1hcmtlcnMgaW4gdGhlIERULCB0aGlzIHBhdGNoIGFk
ZHMNCj4gPiBzb21lIGNvbW1vbiBkb2N1bWVudGF0aW9uIHRvIGJlIHJlZmVyZW5jZWQgYnkgYm90
aCBwYW5lbHMgYW5kDQo+ID4gYnJpZGdlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
emlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZkcy55YW1s
DQo+ID4gQEAgLTAsMCArMSwzOCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCMNCj4gPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4g
Kw0KPiA+ICt0aXRsZTogQ29tbW9uIFByb3BlcnRpZXMgZm9yIGJ1cyB0aW1pbmdzIG9mIExWRFMg
aW50ZXJmYWNlcw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBUaGllcnJ5IFJl
ZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPg0KPiA+ICsgIC0gRmFicml6aW8gQ2FzdHJv
IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlv
bjogfA0KPiA+ICsgIFRoaXMgZG9jdW1lbnQgZGVmaW5lcyBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVz
IGNvbW1vbiB0byBMVkRTIGFuZCBkdWFsLUxWRFMNCj4gPiArICBpbnRlcmZhY2VzLCB3aGVyZSBh
IGR1YWwtTFZEUyBpbnRlcmZhY2UgaXMgYSBkdWFsLWxpbmsgY29ubmVjdGlvbiB3aXRoIGV2ZW4N
Cj4gPiArICBwaXhlbHMgdHJhdmVsaW5nIG9uIG9uZSBjb25uZWN0aW9uLCBhbmQgd2l0aCBvZGQg
cGl4ZWxzIHRyYXZlbGluZyBvbiB0aGUgb3RoZXINCj4gPiArICBjb25uZWN0aW9uLg0KPiA+ICsg
IFRoaXMgZG9jdW1lbnQgZG9lc24ndCBjb25zdGl0dWUgYSBkZXZpY2UgdHJlZSBiaW5kaW5nIHNw
ZWNpZmljYXRpb24gYnkgaXRzZWxmDQo+ID4gKyAgYnV0IGlzIG1lYW50IHRvIGJlIHJlZmVyZW5j
ZWQgYnkgZGV2aWNlIHRyZWUgYmluZGluZ3MuDQo+ID4gKyAgV2hlbiByZWZlcmVuY2VkIGZyb20g
cGFuZWwgb3IgYnJpZGdlIGRldmljZSB0cmVlIGJpbmRpbmdzLCB0aGUgcHJvcGVydGllcw0KPiA+
ICsgIGRlZmluZWQgaW4gdGhpcyBkb2N1bWVudCBhcmUgZGVmaW5lZCBhcyBmb2xsb3dzLiBUaGUg
cGFuZWwgYW5kIGJyaWRnZSBkZXZpY2UNCj4gPiArICB0cmVlIGJpbmRpbmdzIGFyZSByZXNwb25z
aWJsZSBmb3IgZGVmaW5pbmcgd2hldGhlciBlYWNoIHByb3BlcnR5IGlzIHJlcXVpcmVkDQo+ID4g
KyAgb3Igb3B0aW9uYWwuDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGR1YWwtbHZk
cy1ldmVuLXBpeGVsczoNCj4gPiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPiArICAgIGRlc2NyaXB0
aW9uOg0KPiA+ICsgICAgICBUaGlzIHByb3BlcnR5IGlzIHNwZWNpZmljIHRvIGFuIGlucHV0IHBv
cnQgb2YgYSBzaW5rIGRldmljZS4gV2hlbg0KPiA+ICsgICAgICBzcGVjaWZpZWQsIGl0IG1hcmtz
IHRoZSBwb3J0IGFzIHJlY2lwaWVudCBvZiBldmVuLXBpeGVscy4NCj4gPiArDQo+ID4gKyAgZHVh
bC1sdmRzLW9kZC1waXhlbHM6DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBkZXNj
cmlwdGlvbjoNCj4gPiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZpYyB0byBhbiBpbnB1
dCBwb3J0IG9mIGEgc2luayBkZXZpY2UuIFdoZW4NCj4gPiArICAgICAgc3BlY2lmaWVkLCBpdCBt
YXJrcyB0aGUgcG9ydCBhcyByZWNpcGllbnQgb2Ygb2RkLXBpeGVscy4NCj4gDQo+IERvIHlvdSBu
ZWVkIHRoZSAiZHVhbC0iIHByZWZpeD8gSXNuJ3QgdGhhdCBpbXBsaWVkIGJ5IGV2ZW4vb2RkPw0K
PiBPciBpcyBpdCBiZXR0ZXIgdG8ga2VlcCBpdCwgZm9yIHJlYWRhYmlsaXR5Pw0KDQpJIGRlY2lk
ZWQgdG8gZ28gd2l0aCAiZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzIiBhbmQgImR1YWwtbHZkcy1vZGQt
cGl4ZWxzIg0KYmVjYXVzZSB0aGUgImR1YWwtbHZkcyIgcHJlZml4IHVuaXF1ZWx5IGlkZW50aWZp
ZXMgdGhlIHR5cGUgb2YgYnVzLCBhbmQgSQ0KZGVjaWRlZCB0byBnbyB3aXRoIHRoZSAicGl4ZWxz
IiBzdWZmaXggYmVjYXVzZSAiZHVhbC1sdmRzLW9kZCIganVzdCBkb2Vzbid0DQpzb3VuZCByaWdo
dC4gSSBndWVzcyAiZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzIiBhbmQgImR1YWwtbHZkcy1vZGQtcGl4
ZWxzIg0KYXJlIHRoZSBtb3N0IHJlYWRhYmxlIGFuZCBmdXR1cmUgcHJvb2YgbGFiZWxzIEkgY291
bGQgdGhpbmsgb2YsIGJ1dCBtYXliZQ0KdGhlcmUgaXMgc29tZXRoaW5nIGJldHRlciB3ZSBjYW4g
ZG8/IExhdXJlbnQ/DQoNCj4gDQo+IEknbSBhbHNvIHRoaW5raW5nIGFib3V0IGEgcG9zc2libGUg
ZnV0dXJlIGV4dGVuc2lvbiB0byB0cmlwbGUgb3IgcXVhZCBMVkRTLg0KPiBBcyBJJ20gbm90IGF3
YXJlIG9mIEVuZ2xpc2ggd29yZCBlcXVpdmFsZW50cyBvZiBldmVuL29kZCBmb3IgdHJpcGxlL3F1
YWQsDQo+IHBlcmhhcHMgdGhpcyBzaG91bGQgYmUgc3BlY2lmaWVkIHVzaW5nIGEgbnVtZXJpY2Fs
IHZhbHVlIGluc3RlYWQ/DQoNCkkgd291bGQgaGF2ZSB0byBzZWUgYSB1c2UgY2FzZSBmb3Igb3Ro
ZXIgTFZEUyBjb25maWd1cmF0aW9ucyBmb3IgcHJvdmlkaW5nDQphIHByb3BlciBhbnN3ZXIgdG8g
dGhpcyBxdWVzdGlvbiwgYnV0IHBlcmhhcHMgd2UgY291bGQgYWNjZXB0IHRoYXQgb3RoZXINCmNv
bmZpZ3VyYXRpb25zIGZvciBMVkRTIGNvbm5lY3Rpb25zIG1heSBjb21lIHdpdGggbGFiZWxzIHRo
YXQgYXJlIHRhaWxvcmVkDQp0byBoZWxwIHVuaXF1ZWx5IGlkZW50aWZ5aW5nIHRoZSBwb3J0cyB3
aGlsZSBiZWluZyByZWFkYWJsZT8gUGVyaGFwcyBudW1lcmljYWwNCnZhbHVlcyB3b3VsZCB3b3Jr
IGJldHRlciBpbiBvdGhlciBjYXNlcz8gTGF1cmVudD8NCg0KPiANCj4gSWYgSSBnbyB0b28gZmFy
LCBwbGVhc2UganVzdCBzYXkgc28gOy0pDQoNCkRlZmluaXRlbHkgd29ydGggZGlzY3Vzc2luZyEN
Cg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
