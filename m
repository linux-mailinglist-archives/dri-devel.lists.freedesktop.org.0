Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92A18612
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1457789BAC;
	Thu,  9 May 2019 07:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DE08925F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 10:33:18 +0000 (UTC)
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com (20.176.215.158) by
 AM0PR04MB4962.eurprd04.prod.outlook.com (20.177.41.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 10:33:16 +0000
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be]) by AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 10:33:16 +0000
From: Wen He <wen.he_1@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [v1] gpu: ipu-v3: allow to build with ARCH_LAYERSCAPE
Thread-Topic: [v1] gpu: ipu-v3: allow to build with ARCH_LAYERSCAPE
Thread-Index: AQHVBYI8unZbTlbg6kW+K6MnY/7TA6ZhB9YQ
Date: Wed, 8 May 2019 10:33:16 +0000
Message-ID: <AM0PR04MB48655B0938858A95EE73F457E2320@AM0PR04MB4865.eurprd04.prod.outlook.com>
References: <20190508094318.25849-1-wen.he_1@nxp.com>
In-Reply-To: <20190508094318.25849-1-wen.he_1@nxp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff6bd6bb-e7f4-4199-807d-08d6d3a094a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4962; 
x-ms-traffictypediagnostic: AM0PR04MB4962:
x-microsoft-antispam-prvs: <AM0PR04MB496269EE7A525B18F6F4F5A8E2320@AM0PR04MB4962.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(13464003)(478600001)(14444005)(66946007)(186003)(476003)(53936002)(66556008)(74316002)(99286004)(4326008)(52536014)(66066001)(73956011)(76116006)(66446008)(64756008)(305945005)(316002)(7736002)(33656002)(2501003)(110136005)(76176011)(7696005)(53546011)(6506007)(256004)(2201001)(102836004)(86362001)(446003)(11346002)(66476007)(5660300002)(26005)(6246003)(6116002)(3846002)(14454004)(229853002)(2906002)(8936002)(71190400001)(71200400001)(486006)(6436002)(68736007)(25786009)(9686003)(8676002)(81166006)(81156014)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4962;
 H:AM0PR04MB4865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qTRBNYAW6JLzEkMbgjpk1LNpfpAZ84C4iK76+cvKR9Q+md/ODB+hhRAt/HTrNznDiCnJBbfJDSg8RFjCp/oM4T6miWzIzal3UyKEeE7DNVLd9oyS9Nqa80od9QTYPhu4JPWemqgsVfFfE7dyav0PRgbU/4BOCYBXbR9DntuEYHo6jvqWJuuzlBTSSWbYkAOwf0ZeNTFBg8JBB7n3FJTcZMfA4A0KmcIsa3opT9YEVTxWibLYv9DUd66avD/rJyWgyI7/1tMRUvUnhQTEiFnRfcs2VJ8BQDXvLo/X1zKnt8nJR57CEatSbTS7l2wtlQKxKYyqnlXl0t6x05h8f36J9lUlkikWeNSGJItslyEMKROxwxfPVvtG7hUbsmP4JjIKT5UKG9VXfEQA8JJ7hzvyUyctcuaobWsre7jvDZ4ZKqI=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6bd6bb-e7f4-4199-807d-08d6d3a094a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 10:33:16.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4962
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzncqD+8TlWrlgMtQAN6lGdRwCRFRFCLV05JK8lgXpE=;
 b=FojnD1UrO4mS5JwZQyqa/mXvxN1G7Y5aNwgw2y4xzQ4bF1YV+tjA5jZnofNnQ0kKHQyTcuPYj7w0pxcs4gALTuA9NHKv9MfcapzueBpRLHr10KGfD827GpKlMQmvq67v+ry5DaEauRu5JWjj1J9NzFZvHJx2vPO7wloR5S3+QLE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=wen.he_1@nxp.com; 
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
Cc: Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2VuIEhlDQo+IFNlbnQ6
IDIwMTnlubQ15pyIOOaXpSAxNzo0Mg0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgcC56YWJlbEBwZW5ndXRyb25peC5kZQ0KPiBDYzogTGVvIExpIDxsZW95YW5nLmxpQG54
cC5jb20+OyBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+DQo+IFN1YmplY3Q6IFt2MV0gZ3B1OiBp
cHUtdjM6IGFsbG93IHRvIGJ1aWxkIHdpdGggQVJDSF9MQVlFUlNDQVBFDQo+IA0KPiBUaGUgbmV3
IExTMTAyOEEgRFAgZHJpdmVyIGNvZGUgY2F1c2VzIGEgbGluayBmYWlsdXJlIHdoZW4gRFJNX0lN
WCBidWlsdC1pbiwNCj4gYnV0IHBsYXRmb3JtIGlzIEFSQ0hfTEFZRVJTQ0FQRToNCj4gDQo+IGRy
aXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jOjUxOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBpcHVfcHJnX2VuYWJsZScNCj4gZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmM6NTI6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlwdV9kY19lbmFibGUnDQo+IGRyaXZlcnMvZ3B1L2Ry
bS9pbXgvaXB1djMtY3J0Yy5jOjUzOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvDQo+IGBpcHVfZGNf
ZW5hYmxlX2NoYW5uZWwnDQo+IGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jOjU0OiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpcHVfZGlfZW5hYmxlJw0KPiBkcml2ZXJzL2dwdS9kcm0v
aW14L2lwdXYzLWNydGMubzogSW4gZnVuY3Rpb24gYGlwdV9jcnRjX21vZGVfc2V0X25vZmINCj4g
DQo+IEFkZGluZyBhIEtjb25maWcgZGVwZW5kZW5jeSBhbGxvdyB0byBidWlsZCBpZiBBUkNIX0xB
WUVSU0NBUEUgaXMgZW5hYmxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2VuIEhlIDx3ZW4uaGVf
MUBueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2lwdS12My9LY29uZmlnIHwgMiArLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcgYi9kcml2ZXJzL2dwdS9pcHUt
djMvS2NvbmZpZyBpbmRleA0KPiBmZTZmOGM1YjQ0NDUuLjUxZWE4OGM0NDBkZiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ncHUvaXB1
LXYzL0tjb25maWcNCj4gQEAgLTEsNiArMSw2IEBADQo+ICBjb25maWcgSU1YX0lQVVYzX0NPUkUN
Cj4gIAl0cmlzdGF0ZSAiSVBVdjMgY29yZSBzdXBwb3J0Ig0KPiAtCWRlcGVuZHMgb24gU09DX0lN
WDUgfHwgU09DX0lNWDZRIHx8IEFSQ0hfTVVMVElQTEFURk9STSB8fA0KPiBDT01QSUxFX1RFU1QN
Cj4gKwlkZXBlbmRzIG9uIFNPQ19JTVg1IHx8IFNPQ19JTVg2USB8fCBBUkNIX01VTFRJUExBVEZP
Uk0gfHwNCj4gQ09NUElMRV9URVNUDQo+ICt8fCBBUkNIX0xBWUVSU0NBUEUNCj4gIAlkZXBlbmRz
IG9uIERSTSB8fCAhRFJNICMgaWYgRFJNPW0sIHRoaXMgY2FuJ3QgYmUgJ3knDQo+ICAJc2VsZWN0
IEJJVFJFVkVSU0UNCj4gIAlzZWxlY3QgR0VORVJJQ19BTExPQ0FUT1IgaWYgRFJNDQo+IC0tDQo+
IDIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
