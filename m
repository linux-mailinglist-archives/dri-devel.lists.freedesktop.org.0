Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92D4E125
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754526E833;
	Fri, 21 Jun 2019 07:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FAE6E52A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 08:34:28 +0000 (UTC)
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (20.178.123.141) by
 VI1PR04MB5903.eurprd04.prod.outlook.com (20.178.205.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 20 Jun 2019 08:34:25 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3dd4:5031:dc06:1fd7]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3dd4:5031:dc06:1fd7%7]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 08:34:25 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
Thread-Topic: [EXT] Re: [PATCH v2 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
Thread-Index: AQHVJdoL5NWVS2lKwkmkyRwSLkxJKqai+fKAgAFASIA=
Date: Thu, 20 Jun 2019 08:34:25 +0000
Message-ID: <1561019665.9328.70.camel@nxp.com>
References: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
 <1560864646-1468-3-git-send-email-robert.chiras@nxp.com>
 <CAOMZO5C_4QxioSx4JEAV+1dDxYJgdTCzmBLZyUCB4dWeRqLFng@mail.gmail.com>
In-Reply-To: <CAOMZO5C_4QxioSx4JEAV+1dDxYJgdTCzmBLZyUCB4dWeRqLFng@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88737637-fb7b-4e3c-0122-08d6f55a1a78
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5903; 
x-ms-traffictypediagnostic: VI1PR04MB5903:
x-microsoft-antispam-prvs: <VI1PR04MB5903F49DF83C161C44E3A9F0E3E40@VI1PR04MB5903.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(39860400002)(376002)(346002)(199004)(189003)(6506007)(6246003)(478600001)(8676002)(53546011)(81166006)(14454004)(316002)(446003)(1361003)(54906003)(8936002)(2351001)(66946007)(76116006)(305945005)(11346002)(2616005)(103116003)(81156014)(6512007)(4744005)(73956011)(2501003)(186003)(66476007)(68736007)(50226002)(5640700003)(486006)(66556008)(26005)(5660300002)(66446008)(476003)(4326008)(229853002)(2906002)(25786009)(1730700003)(44832011)(71190400001)(99286004)(66066001)(1411001)(102836004)(7416002)(3846002)(86362001)(7736002)(76176011)(6116002)(64756008)(36756003)(6486002)(6436002)(53936002)(71200400001)(6916009)(256004)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5903;
 H:VI1PR04MB5967.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WvaXgHpNnTPJVVGQ/o3X7f1hOBVXxgfe5w4WgV3XfkaxfWsmov77rXm2E4jfw5krDFDn/3cHTqd1pZLstetJOGR9vjIgW0+j7YNsQdg9HCI4W/0hzfQjWQHihyYYfT0gaumZd7PYZkNoq7DmATDvwhATQh4QanbCgHunEUhqyQD8qsfXjhMoqhlDgRt3hyv56GwPgc3DJgGIDYRZezk6DwKjsJf67yFew8s3ec9CSr/lzXcVXX0Ta880HuD46RRFwoWiTw+7aPbXCnZH2+f81ZgTVEKWFef96h1edgFuYHViX1pZYaTs3CuzR/MTBhxEv1ScePYhV2MRTjlvSSRL0GfFPOScKDgoOuQ+MegCyfyCh0Iagu5FuF0yONyrr8xerehZ9HqlitG8yzH+iQNeZSHcIvjgn2ATBlgEneckp40=
Content-ID: <05405759A854DF42A2419EF7FC3AB3FB@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88737637-fb7b-4e3c-0122-08d6f55a1a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 08:34:25.8428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robert.chiras@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVHCfvCNgm0CvSgJauck05tn04UUn6Xi3GShW/o2BJk=;
 b=AQ0HqaCyYEte9cuq1jTB473TB7fs2IdZcm9ln23JxMRHfpucWit1931oYBO6f8z6VtE3nDEKCRMSjj18lTyXNUPZSeiVTda3PYvtZnFlC4exp+LxfqimF2lpvcbgRte5ii7aJN4TCyjs6KBe5ASiE1rduBWddAzfHydTIh6uvH8=
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

T24gTWksIDIwMTktMDYtMTkgYXQgMTA6MjggLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+
IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gSGkgUm9iZXJ0LA0KPiANCj4gT24gVHVlLCBKdW4g
MTgsIDIwMTkgYXQgMTA6MzEgQU0gUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29t
DQo+ID4gd3JvdGU6DQo+IA0KPiA+IA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRpc3BsYXlf
dGltaW5nIHJhZF9kZWZhdWx0X3RpbWluZyA9IHsNCj4gPiArwqDCoMKgwqDCoMKgwqAucGl4ZWxj
bG9jayA9IHsgNjYwMDAwMDAsIDEzMjAwMDAwMCwgMTMyMDAwMDAwIH0sDQo+ID4gK8KgwqDCoMKg
wqDCoMKgLmhhY3RpdmUgPSB7IDEwODAsIDEwODAsIDEwODAgfSwNCj4gPiArwqDCoMKgwqDCoMKg
wqAuaGZyb250X3BvcmNoID0geyAyMCwgMjAsIDIwIH0sDQo+ID4gK8KgwqDCoMKgwqDCoMKgLmhz
eW5jX2xlbiA9IHsgMiwgMiwgMiB9LA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5oYmFja19wb3JjaCA9
IHsgMzQsIDM0LCAzNCB9LA0KPiA+ICvCoMKgwqDCoMKgwqDCoC52YWN0aXZlID0geyAxOTIwLCAx
OTIwLCAxOTIwIH0sDQo+ID4gK8KgwqDCoMKgwqDCoMKgLnZmcm9udF9wb3JjaCA9IHsgMTAsIDEw
LCAxMCB9LA0KPiA+ICvCoMKgwqDCoMKgwqDCoC52c3luY19sZW4gPSB7IDIsIDIsIDIgfSwNCj4g
PiArwqDCoMKgwqDCoMKgwqAudmJhY2tfcG9yY2ggPSB7IDQsIDQsIDQgfSwNCj4gQXJlIHlvdSBz
dXJlIHRoYXQgdGhlIHN5bmNfbGVuIGFuZCBwb3JjaCBwYXJhbWV0ZXJzIGFyZSB0aGUgc2FtZSBm
b3INCj4gYm90aCA2Nk1IeiBhbmQgMTMyTUh6Pw0KUHJvYmFibHkgdGhleSBhcmUgbm90LCBzaW5j
ZSBJIGRpZG4ndCBnZXQgdGhpcyBwYW5lbCB0byB3b3JrIHdlbGwgd2l0aA0KNjZIei4gU28gSSB3
aWxsIGp1c3Qga2VlcCAxMzJNSHosIHNpbmNlIHRoZXNlIGFyZSB0aGUgb25seSB0aW1pbmluZ3Mg
d2UNCnJlY2VpdmVkIGZyb20gdmVuZG9yLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
