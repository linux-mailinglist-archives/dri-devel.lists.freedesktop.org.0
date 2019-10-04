Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B22CCB3B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481D26E3A0;
	Sat,  5 Oct 2019 16:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410093.outbound.protection.outlook.com [40.107.141.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E806EADD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 07:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtS/nTI1L6wQ+j4/r/4dvFNRXe7kXUoNG1SlrftMtp0Djg4TIQ5Vfuza0B2doyeJ9YDPrizDv1U47UBr9zNOIuhTnOrcqZEzcq+lOTzvPYlHEGEVW9HaHa/SaT5UOtWPEOhx22vuGX92gBDvn/ouDs5hKsgSXgtUAeeqsNGZGnvufgsGJNodLEAJEV7fa7F3Xv6KKV6NUsQO6glfelne+eiRvY6y06u2YRl1TN/cPi6NNhsiI9NlqUVW7SzJ8xdbmEfeOI2s5N0lK/kycy9CjrRVUl6zCYPAJhFkazVRr8PF1ag239gdxNkYftdeQzKlrCx9AgSq1zgbcPGWwTu4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sTjR7BFukTDpLrc5v1T2tGY0o7c1vIneBT9cxhZPtQ=;
 b=XoG6La41Bo5LUxt3kkD7RcGgH8KYzu9LZx8SLbpkgQL+F8kUgJNvkVIlOe+A/OiO3RbU5UeCilL3DS8j7UsL5lYOxVY2+l1HQlZyla5SYD7fcroSFBQYKdidLphKjIOPApV3xXAhY7njTJTnjWbEb3muM7f4AqIO3L6ZzeKjYVgCbCjhy/ZNj8/BF61sw4HRe82omKw0h8QMLZhXjSLQQzK6YlvOIDGe1LNC7aZT72ycyrJwjd6joyx4zkt3L008L0rU+BsUEHR6gioRqkAs/WmeqN4+LQeUv7myOjwBW/sgR55cIfsXjYh1z8HhE+qMjmYX/rzXBjXTrCDVkvPa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4520.jpnprd01.prod.outlook.com (20.179.181.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Fri, 4 Oct 2019 07:39:14 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 07:39:14 +0000
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] dt-bindings: display: renesas: Add r8a774b1 support
Thread-Topic: [PATCH] dt-bindings: display: renesas: Add r8a774b1 support
Thread-Index: AQHVd3GHiCqp5fVGEUScV8P7j2ItS6dKFGaAgAAJBtA=
Date: Fri, 4 Oct 2019 07:39:13 +0000
Message-ID: <OSBPR01MB21033EA129C4C8C8301EDCE8B89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569835731-8096-1-git-send-email-biju.das@bp.renesas.com>
 <20191004070211.GA9380@pendragon.ideasonboard.com>
In-Reply-To: <20191004070211.GA9380@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90ff94c9-945d-4e71-8554-08d7489df451
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB4520:|OSBPR01MB4520:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB452021199866A732875E41DAB89E0@OSBPR01MB4520.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(51914003)(199004)(189003)(6916009)(478600001)(256004)(66446008)(66476007)(64756008)(3846002)(8936002)(76116006)(4326008)(99286004)(186003)(8676002)(107886003)(7736002)(2906002)(81156014)(5660300002)(81166006)(66946007)(316002)(6506007)(66556008)(102836004)(6246003)(14454004)(86362001)(52536014)(446003)(305945005)(66066001)(76176011)(71190400001)(71200400001)(7696005)(74316002)(486006)(25786009)(476003)(33656002)(44832011)(9686003)(7416002)(26005)(55016002)(229853002)(6436002)(6116002)(54906003)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB4520;
 H:OSBPR01MB2103.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n1rxs6lBnJBVPFlogZZdrOTb6VhAWyxEae+gUUJuhfr33ukOrHnEbHbXXAt4ajCxGmCvGJtn6oYt+eTR9xERIQOlWyr4SqwEe9O18YqTgJz5GzYDP6ugf1BBoZlduAn1QcEIJ4BpfWg8ilqpmaajwNLIKr3eeDDd5PlTTSbF4HyasprXyCrVjn2vCqbOSQFoX13pIHMUTERfLK5wtINzoGe8dCyi01eOz1y97Ol7yzqWD7d8bAZhu+RaPGfRFqFkQsrguJHiwCrVOPLExkuiCMjlJ6JT9hCNwCOfOmerTEDqHzT3G79NCivq93vTEjdUCvEvPuDlRI5dQOsPI/dAW0NPLjO8WRhL3ccDE7viU4EcSF26rKetCf1LJIjQiL326FRzuFBpnFcBC7UVKk/W2uo1Ud4xzDKTMuiqC7jEVkM=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ff94c9-945d-4e71-8554-08d7489df451
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:39:13.9914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4kS8Fhg/5P+YuZ54wXpiZsFZQkSCtTiTyp3S+i3f9tFk/YBJT2ahsGYzTqUtG9k9YmGnGLTTCqYvO8na7Obug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4520
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sTjR7BFukTDpLrc5v1T2tGY0o7c1vIneBT9cxhZPtQ=;
 b=EgchAq6to0Ivw0dbDg40XaqTmQD5OZo+JptNeW6lk+2CS3pAvDT0AhjL909LvfzZR/UF2UkG0hpgW8mu3YYEINzLJjO//mgqfe/MqJDwZ5WbSnU5ecpPqF/cqyUR4zJ0qH6fS7P0TyQdsL2XDJRDKPPS0QblO6khjBmLf7zRg64=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6IEFkZCByOGE3NzRiMSBzdXBw
b3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0K
PiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAxMDoyODo1MUFNICswMTAwLCBCaWp1IERhcyB3cm90
ZToNCj4gPiBEb2N1bWVudCBSWi9HMk4gKFI4QTc3NEIxKSBTb0MgYmluZGluZ3MuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiBJIHJlYWxseSBsaWtlIGhvdyB5b3VyIFJaIHBhdGNoZXMgYXJlIHNpbXBsZSwgdGhleSdyZSBw
YWlubGVzcyB0byByZXZpZXcsIGl0J3MgYWxsDQo+IHZlcnkgcGxlYXN1cmFibGUgOi0pDQoNClll
cyBJIGFncmVlLCBJdCBpcyBiZWNhdXNlIG9mIHRoZSBnb29kIHdvcmsgZG9uZSBieSB5b3UgYW5k
IHlvdXIgdGVhbS4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gQW5kIGFw
cGxpZWQgdG8gbXkgdHJlZS4NCj4gDQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0DQo+ID4gfCAx
ICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvcmVuZXNhcyxkdy0NCj4gaGRtaS50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3LQ0KPiBoZG1pLnR4dA0KPiA+IGlu
ZGV4IGRiNjgwNDEuLjgxOWYzZTMgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkdy0NCj4gaGRtaS50
eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvcmVuZXNhcyxkdy0NCj4gaGRtaQ0KPiA+ICsrKyAudHh0DQo+ID4gQEAgLTEzLDYgKzEz
LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPg0KPiA+ICAtIGNvbXBhdGlibGUgOiBTaGFs
bCBjb250YWluIG9uZSBvciBtb3JlIG9mDQo+ID4gICAgLSAicmVuZXNhcyxyOGE3NzRhMS1oZG1p
IiBmb3IgUjhBNzc0QTEgKFJaL0cyTSkgY29tcGF0aWJsZSBIRE1JIFRYDQo+ID4gKyAgLSAicmVu
ZXNhcyxyOGE3NzRiMS1oZG1pIiBmb3IgUjhBNzc0QjEgKFJaL0cyTikgY29tcGF0aWJsZSBIRE1J
IFRYDQo+ID4gICAgLSAicmVuZXNhcyxyOGE3Nzk1LWhkbWkiIGZvciBSOEE3Nzk1IChSLUNhciBI
MykgY29tcGF0aWJsZSBIRE1JIFRYDQo+ID4gICAgLSAicmVuZXNhcyxyOGE3Nzk2LWhkbWkiIGZv
ciBSOEE3Nzk2IChSLUNhciBNMy1XKSBjb21wYXRpYmxlIEhETUkgVFgNCj4gPiAgICAtICJyZW5l
c2FzLHI4YTc3OTY1LWhkbWkiIGZvciBSOEE3Nzk2NSAoUi1DYXIgTTMtTikgY29tcGF0aWJsZSBI
RE1JDQo+ID4gVFgNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
