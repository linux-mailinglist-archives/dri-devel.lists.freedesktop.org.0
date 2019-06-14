Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6509474EB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D29891C0;
	Sun, 16 Jun 2019 14:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE68898BF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:50:14 +0000 (UTC)
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (20.178.123.141) by
 VI1PR04MB4478.eurprd04.prod.outlook.com (20.177.53.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 14 Jun 2019 13:50:12 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3dd4:5031:dc06:1fd7]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3dd4:5031:dc06:1fd7%7]) with mapi id 15.20.1965.018; Fri, 14 Jun 2019
 13:50:12 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [EXT] Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191
 panel driver
Thread-Topic: [EXT] Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191
 panel driver
Thread-Index: AQHVIqdzFTZPTbEojEKDO3NY8aRErKabE9mAgAARJ4CAAAL7gIAAAuGA
Date: Fri, 14 Jun 2019 13:50:12 +0000
Message-ID: <1560520211.9328.41.camel@nxp.com>
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
 <1560513063-24995-3-git-send-email-robert.chiras@nxp.com>
 <CAOMZO5BAborMvk=4cgreWKX6rJjK-237me98dM1dDV53oUnExQ@mail.gmail.com>
 <1560518953.9328.31.camel@nxp.com>
 <CAOMZO5DcvKQPDhP468VSCfQkFy-7roKBkw7uqXxTMn9PTTgS+A@mail.gmail.com>
In-Reply-To: <CAOMZO5DcvKQPDhP468VSCfQkFy-7roKBkw7uqXxTMn9PTTgS+A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31f6b76c-8377-44a4-9406-08d6f0cf38dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4478; 
x-ms-traffictypediagnostic: VI1PR04MB4478:
x-microsoft-antispam-prvs: <VI1PR04MB4478306BC725240DFDF5358FE3EE0@VI1PR04MB4478.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(189003)(229853002)(36756003)(6916009)(86362001)(25786009)(6486002)(54906003)(1411001)(68736007)(2351001)(14444005)(6246003)(316002)(103116003)(2906002)(186003)(305945005)(7416002)(7736002)(256004)(66066001)(1361003)(4326008)(6436002)(3846002)(476003)(66946007)(8936002)(73956011)(71200400001)(11346002)(64756008)(2616005)(66556008)(66476007)(66446008)(486006)(6512007)(53546011)(6506007)(76116006)(102836004)(76176011)(8676002)(44832011)(6116002)(478600001)(1730700003)(81166006)(446003)(71190400001)(26005)(53936002)(4744005)(5660300002)(50226002)(5640700003)(14454004)(2501003)(99286004)(81156014)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4478;
 H:VI1PR04MB5967.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ccZTdIHeTAVSoEfMTGscJhkjNGi6NdFIppIr89Q4c3u2CO+pRPoaPJcP6IDTO7cWJ1IxH8o7v+NruyQdGE8U0YVlstSVm3YiH0gUTocXK0UJLJXIHPnzwWlrenQTw79lqzHnGr8k5QaeHIPh0sWW8HBgjW1phAAUR4+jd101KwcN4R/Lu8rdIk6s5MV/iD2f2oWFWfUJXYwkv0WbZSdBNOzHjnxrTOYELC3b1v3BE4uPftkTuW1J1OWVv/dBZFQmKGiuv4MVBgyhbe1FWNPnHFkwcYJLYvpVmPHYlf9aGOlhq6ompDJ6bvF5MbgkSAmi9fQwnSTgB8fbQE+rAxSZn7g0Yudv58AObLhAhJyz2K/2QSvJ1cFXjmpMPBsZIQIDjRWkj60Sf9nKe7xzDUZu/Nx4laLz458WfCyK3xR0wus=
Content-ID: <AFE0FA3EDFCE8F479938F2D5F10DD015@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f6b76c-8377-44a4-9406-08d6f0cf38dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 13:50:12.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robert.chiras@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4478
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBIioesIuLp0QB7Oka03l4Du5E/SXG5X+2PTItoXJxg=;
 b=jGcbkePR59rX5MNWj2qmnehJ57rqk3boIVX5TYXFQIz8Y9aDM5du4Xcu5gwZfLM2yOgshJV8ubsFGkDKWTMUdj/FLi/lWenhSqRgkjYCQiMI5rI4iibY05IauE1mI6aJ9S2hueNE+MG4VNGqYp6aAMmceQAZgoFT7NJbWwESFEg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=robert.chiras@nxp.com; 
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVmksIDIwMTktMDYtMTQgYXQgMTA6MzkgLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+
IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6Mjkg
QU0gUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tDQo+ID4gd3JvdGU6DQo+IA0K
PiA+IA0KPiA+IFRoZSBHUElPIGlzIGFjdGl2ZSBoaWdoLCBhbmQgdGhlIGFib3ZlIHNlcXVlbmNl
IHdhcyByZWNlaXZlZCBmcm9tDQo+ID4gdGhlDQo+ID4gcGFuZWwgdmVuZG9yIGluIHRoZSBmb2xs
b3dpbmcgZm9ybToNCj4gPiDCoMKgwqDCoMKgwqDCoMKgU0VUX1JFU0VUX1BJTigxKTsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgTURFTEFZKDEwKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgU0VUX1JFU0VU
X1BJTigwKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgTURFTEFZKDUpOw0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBTRVRfUkVTRVRfUElOKDEpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBNREVMQVkoMjApOw0K
PiA+IEkgZ290IHJpZCBvZiB0aGUgZmlyc3QgdHJhbnNpdGlvbiB0byBoaWdoIHNpbmNlIHNlZW1l
ZCByZWR1bmRhbnQuDQo+ID4gQWxzbywgYWNjb3JkaW5nIHRvIHRoZSBtYW51YWwgcmVmZXJlbmNl
LCB0aGUgUlNUQiBwaW4gbmVlZHMgdG8gYmUNCj4gPiBhY3RpdmUgaGlnaCB3aGlsZSBvcGVyYXRp
bmcgdGhlIGRpc3BsYXkuDQo+IFRoYXQncyBleGFjdGx5IG15IHBvaW50IDotKQ0KPiANCj4gSW4g
bm9ybWFsIG9wZXJhdGlvbiB0aGUgR1BJTyByZXNldCBuZWVkcyB0byBiZSBoaWdoLg0KPiANCj4g
RHVyaW5nIHJlc2V0IHRoZSBHUElPIHJlc2V0IG5lZWRzIHRvIGJlIGxvdy4sIHdoaWNoIG1lYW5z
IHRoYXQgdGhlDQo+IEdQSU8gcmVzZXQgaXMgImFjdGl2ZSBsb3ciLg0KPiANCj4gU28geW91IHNo
b3VsZCBpbnZlcnQgYm90aCB0aGUgZHRzIGFuZCB0aGUgZHJpdmVyIHRvIGJlaGF2ZSBjb3JyZWN0
bHkuDQpOb3cgSSBnZXQgaXQuIFRoYW5rcyEgSSB3aWxsIHVwZGF0ZSB0aGUgZHRzIGFuZCBkcml2
ZXIgZm9yIHRoZSBncGlvLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
