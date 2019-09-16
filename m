Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A384B3598
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E626E857;
	Mon, 16 Sep 2019 07:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E8E6E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfLDBST+9AF/1m9GhuFeywGKbiVOsCNH6jgoFcuCyPl9E+TeNm4QOE+Ru7nKXPWcAWJ+w/iZnoGUvnBinv+M6oCTMuzcrEZGRmMmm+/wMH/pmpTlw3DeOa0GupVSPlhM9HAkqrzqrsPJEYYcPxJEDUFvkY2zCB21gvILaRtBC4uR1FLQck/1cdzitC7wRUgGVuWo+kGHpep5cQHwJ5SZzOoiec5jJqu9EOkPhgWIlxrKUpCH3lsQ7c+rVTiM7p5P3U/1vWoK9UiMWhaDh08qpMUBgTIjISYPG1aVs9hyNEd9YLdZnXSYWfksFm9qUV2RdTFou6eTRVKF57M4LiWNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9QTdctj6QSxau7FfYBQ/bIS5lKMpJvChnZlLP9ivAQ=;
 b=cHzHWVOz6GsULk8VHSbmCoYeVwToEqOXRmgvtJUmUXx8/aQKareAO+P5QOvoiTspWUDZNqGHcPjSk64tNcHsT/yIbpUhY/F8YR0fvbwlgJU6NsgYMEuDJVSsr+8hVo6PZs8fRp5YZCAduhAjZ9S/IGX4gQtPAg2xfdPkvwpOBwW2NmvnV2Ygv70Kgaj56gxU5SIXt/eJcNpz0G1UPTbnsRHxyn0AYJ018PU1IWSRdXBN/pydqNg/US/yGDKTK+v0NQMCOzW/O520FJPgtSTfxuVVHSvZGRCoVHJsE8PLW0NB6M5Xn8Kot1J538FylmQkFkmSm6YXbkfw1inq/mC8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com (20.176.236.27) by
 DB7PR04MB5065.eurprd04.prod.outlook.com (20.176.234.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Mon, 16 Sep 2019 02:12:51 +0000
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::5cca:4549:eda4:7baf]) by DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::5cca:4549:eda4:7baf%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 02:12:51 +0000
From: Wen He <wen.he_1@nxp.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: RE: [EXT] Re: [v5 2/2] drm/arm/mali-dp: Add display QoS interface
 configuration for Mali DP500
Thread-Topic: [EXT] Re: [v5 2/2] drm/arm/mali-dp: Add display QoS interface
 configuration for Mali DP500
Thread-Index: AQHVZ68iixTsjI60DEa0d2X+l6ydlKcoIoWAgAV2b9A=
Date: Mon, 16 Sep 2019 02:12:50 +0000
Message-ID: <DB7PR04MB5195E253B39B539B2AC60BEAE28C0@DB7PR04MB5195.eurprd04.prod.outlook.com>
References: <20190910075913.17650-1-wen.he_1@nxp.com>
 <20190910075913.17650-2-wen.he_1@nxp.com>
 <20190912144705.h2qmyobpayxmu2zd@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190912144705.h2qmyobpayxmu2zd@e110455-lin.cambridge.arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d240606-bdaf-4756-a545-08d73a4b606c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR04MB5065; 
x-ms-traffictypediagnostic: DB7PR04MB5065:|DB7PR04MB5065:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB50653ED2176456273E915621E28C0@DB7PR04MB5065.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(13464003)(189003)(199004)(51914003)(476003)(11346002)(52536014)(76176011)(7696005)(446003)(6506007)(102836004)(5660300002)(53546011)(486006)(54906003)(186003)(316002)(26005)(66066001)(256004)(14444005)(8936002)(6436002)(9686003)(305945005)(7736002)(25786009)(55016002)(6246003)(81156014)(8676002)(14454004)(4326008)(478600001)(81166006)(76116006)(6116002)(229853002)(6916009)(3846002)(71190400001)(71200400001)(66946007)(64756008)(66446008)(66476007)(66556008)(86362001)(99286004)(53936002)(74316002)(2906002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5065;
 H:DB7PR04MB5195.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +WnUBzGd+ax/zpStTFkl9NThxyNY1xFX6+mnM3wVgy2OIIaBqtBINp+/faKYY4eEt8m6pkZeWl/wG9DD6w5+C1Pqk1VccCydg+vSvQzxEHfhZxt1Y4rzWKSz6Rcg/ArjK44HojBE0EPzAeYCplkf5FE6xuZalKhasE13t1EhjcEP3f9XyP3G+yhXkYda23wU00I9qrK8xFrOnh56YjSqXxeXbDO4mWMxxIQiCkqjjmS5wcYV2U0psbFEsNV4nR5dzO+RFsSwf07rEdYIuhUvQMMuoHOE9IG5LJxb2HbAy1WU1MtXGtXg/1pdvLAds6cGVzFl756WjRVWgOnxtotXANCigObbCpxu1oXHLh+KjHWuoToFKdmUSOp1cd/T79lXrKHFnMfGkh3M+bhl6SOupPZh2Rjp9/WFMzyKn+fqw1E=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d240606-bdaf-4756-a545-08d73a4b606c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 02:12:50.9506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +AQBqbkU/vCuCwMSqDS2JziOTk26N03XLiKb+NfXbiAiD3jEPi/5+XIwbD7lpvt0q2rhhWX10R4epoN33K3x4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5065
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9QTdctj6QSxau7FfYBQ/bIS5lKMpJvChnZlLP9ivAQ=;
 b=Oc3rbNUigyZF5QXGB+1qRIcTpydkH3H7zZ7BNrZj3tczfhRit5n7HuqDG8IRAkGEBztLpRHhfQ0GxTNl4aUS6JPtaAac8+2L0r6BKxED7KHRJmrze8ZedW6/yFBCHd8y6S+2YU9qZy5G4U9RhXRyrBbVId3HFddmq4wm/UyRPg4=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Leo Li <leoyang.li@nxp.com>,
 "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl2aXUgRHVkYXUgPGxp
dml1LmR1ZGF1QGFybS5jb20+DQo+IFNlbnQ6IDIwMTnlubQ55pyIMTLml6UgMjI6NDcNCj4gVG86
IFdlbiBIZSA8d2VuLmhlXzFAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LWRldmVsQGxpbnV4Lm54ZGku
bnhwLmNvbTsgQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPjsNCj4gRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PjsgUm9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IE1hcmsgUnV0bGFuZCA8bWFy
ay5ydXRsYW5kQGFybS5jb20+Ow0KPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbdjUg
Mi8yXSBkcm0vYXJtL21hbGktZHA6IEFkZCBkaXNwbGF5IFFvUyBpbnRlcmZhY2UNCj4gY29uZmln
dXJhdGlvbiBmb3IgTWFsaSBEUDUwMA0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBP
biBUdWUsIFNlcCAxMCwgMjAxOSBhdCAwMzo1OToxM1BNICswODAwLCBXZW4gSGUgd3JvdGU6DQo+
ID4gQ29uZmlndXJlIHRoZSBkaXNwbGF5IFF1YWxpdHkgb2Ygc2VydmljZSAoUW9TKSBsZXZlbHMg
cHJpb3JpdHkgaWYgdGhlDQo+ID4gb3B0aW9uYWwgcHJvcGVydHkgbm9kZSAiYXJtLG1hbGlkcC1h
cXJvcy12YWx1ZSIgaXMgZGVmaW5lZCBpbiBEVFMgZmlsZS4NCj4gPg0KPiA+IFFvUyBzaWduYWxp
bmcgdXNpbmcgQVFST1MgYW5kIEFXUU9TIEFYSSBpbnRlcmZhY2Ugc2lnbmFscywgdGhlIEFRUk9T
DQo+ID4gaXMgZHJpdmVuIGZyb20gdGhlICJSUU9TIiByZWdpc3Rlciwgc28gbmVlZGVkIHRvIHBy
b2dyYW0gdGhlIFJRT1MNCj4gPiByZWdpc3RlciB0byBhdm9pZCB0aGUgaGlnaCByZXNvbHV0aW9u
cyBmbGlja2VyIGlzc3VlIG9uIHRoZSBMUzEwMjhBIHBsYXRmb3JtLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPg0KPiANCj4gQWNrZWQtYnk6IExpdml1
IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2gh
IEkgd2lsbCBwdWxsIHRoaXMgaW50byB0aGUgbWFsaWRwIGNvZGUgYW5kIHB1c2ggaXQgdG8NCj4g
ZHJtLW1pc2MtbmV4dCBpbiB0aGUgZm9sbG93aW5nIGRheXMuDQoNClRoYW5rIHlvdSwgTGl2aXUu
DQoNCkJlc3QgUmVnYXJkcywNCldlbg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBMaXZpdQ0KPiAN
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgIHwgIDYgKysr
KysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMgICB8ICA5ICsrKysrKysr
Kw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5oICAgfCAgMyArKysNCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcmVncy5oIHwgMTAgKysrKysrKysrKw0KPiA+ICA0
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfZHJ2LmMNCj4gPiBpbmRleCAzMzNiODhhNWVmYjAuLjhhNzYzMTVhYWEwZiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jDQo+ID4gQEAgLTgxNyw2ICs4MTcsMTIg
QEAgc3RhdGljIGludCBtYWxpZHBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4NCj4gPiAg
ICAgICBtYWxpZHAtPmNvcmVfaWQgPSB2ZXJzaW9uOw0KPiA+DQo+ID4gKyAgICAgcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgImFybSxtYWxpZHAtYXJxb3MtdmFsdWUiLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmh3ZGV2LT5hcnFvc192YWx1ZSk7DQo+ID4g
KyAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAgIGh3ZGV2LT5hcnFvc192YWx1ZSA9IDB4
MDsNCj4gPiArDQo+ID4gICAgICAgLyogc2V0IHRoZSBudW1iZXIgb2YgbGluZXMgdXNlZCBmb3Ig
b3V0cHV0IG9mIFJHQiBkYXRhICovDQo+ID4gICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91
OF9hcnJheShkZXYtPm9mX25vZGUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiYXJtLG1hbGlkcC1vdXRwdXQtcG9ydC1saW5lcyIsDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2h3LmMgaW5kZXggYmQ4MjY1ZjAyZTBiLi5jYTU3MGIxMzU0NzgNCj4gPiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYw0KPiA+IEBAIC0zNzksNiArMzc5LDE1IEBA
IHN0YXRpYyB2b2lkIG1hbGlkcDUwMF9tb2Rlc2V0KHN0cnVjdA0KPiBtYWxpZHBfaHdfZGV2aWNl
ICpod2Rldiwgc3RydWN0IHZpZGVvbW9kZSAqDQo+ID4gICAgICAgICAgICAgICBtYWxpZHBfaHdf
c2V0Yml0cyhod2RldiwgTUFMSURQX0RJU1BfRlVOQ19JTEFDRUQsDQo+IE1BTElEUF9ERV9ESVNQ
TEFZX0ZVTkMpOw0KPiA+ICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAgIG1hbGlkcF9od19j
bGVhcmJpdHMoaHdkZXYsIE1BTElEUF9ESVNQX0ZVTkNfSUxBQ0VELA0KPiA+IE1BTElEUF9ERV9E
SVNQTEFZX0ZVTkMpOw0KPiA+ICsNCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIFByb2dyYW0g
dGhlIFJRb1MgcmVnaXN0ZXIgdG8gYXZvaWQgaGlnaCByZXNvbHV0aW9ucyBmbGlja2VyDQo+ID4g
KyAgICAgICogaXNzdWUgb24gdGhlIExTMTAyOEEuDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAg
aWYgKGh3ZGV2LT5hcnFvc192YWx1ZSkgew0KPiA+ICsgICAgICAgICAgICAgdmFsID0gaHdkZXYt
PmFycW9zX3ZhbHVlOw0KPiA+ICsgICAgICAgICAgICAgbWFsaWRwX2h3X3NldGJpdHMoaHdkZXYs
IHZhbCwNCj4gTUFMSURQNTAwX1JRT1NfUVVBTElUWSk7DQo+ID4gKyAgICAgfQ0KPiA+ICB9DQo+
ID4NCj4gPiAgaW50IG1hbGlkcF9mb3JtYXRfZ2V0X2JwcCh1MzIgZm10KQ0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5oDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9ody5oIGluZGV4IDk2OGE2NWVlZDM3MS4uZTRjMzZiYzkwYmRhDQo+ID4g
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuaA0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmgNCj4gPiBAQCAtMjUxLDYgKzI1MSw5
IEBAIHN0cnVjdCBtYWxpZHBfaHdfZGV2aWNlIHsNCj4gPg0KPiA+ICAgICAgIC8qIHNpemUgb2Yg
bWVtb3J5IHVzZWQgZm9yIHJvdGF0aW5nIGxheWVycywgdXAgdG8gdHdvIGJhbmtzIGF2YWlsYWJs
ZQ0KPiAqLw0KPiA+ICAgICAgIHUzMiByb3RhdGlvbl9tZW1vcnlbMl07DQo+ID4gKw0KPiA+ICsg
ICAgIC8qIHByaW9yaXR5IGxldmVsIG9mIFJRT1MgcmVnaXN0ZXIgdXNlZCBmb3IgZHJpdmVuIHRo
ZSBBUlFPUyBzaWduYWwgKi8NCj4gPiArICAgICB1MzIgYXJxb3NfdmFsdWU7DQo+ID4gIH07DQo+
ID4NCj4gPiAgc3RhdGljIGlubGluZSB1MzIgbWFsaWRwX2h3X3JlYWQoc3RydWN0IG1hbGlkcF9o
d19kZXZpY2UgKmh3ZGV2LCB1MzINCj4gPiByZWcpIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9yZWdzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3Jl
Z3MuaA0KPiA+IGluZGV4IDk5MzAzMTU0MmZhMS4uNTE0YzUwZGNiNzRkIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3JlZ3MuaA0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vbWFsaWRwX3JlZ3MuaA0KPiA+IEBAIC0yMTAsNiArMjEwLDE2IEBADQo+ID4g
ICNkZWZpbmUgTUFMSURQNTAwX0NPTkZJR19WQUxJRCAgICAgICAgICAgICAgIDB4MDBmMDANCj4g
PiAgI2RlZmluZSBNQUxJRFA1MDBfQ09ORklHX0lEICAgICAgICAgIDB4MDBmZDQNCj4gPg0KPiA+
ICsvKg0KPiA+ICsgKiBUaGUgcXVhbGl0eSBvZiBzZXJ2aWNlIChRb1MpIHJlZ2lzdGVyIG9uIHRo
ZSBEUDUwMC4gUlFPUyByZWdpc3Rlcg0KPiA+ICt2YWx1ZXMNCj4gPiArICogYXJlIGRyaXZlbiBi
eSB0aGUgQVJRT1Mgc2lnbmFsLCB1c2luZyBBWEkgdHJhbnNhY2F0aW9ucywgZGVwZW5kZW50DQo+
ID4gK29uIHRoZQ0KPiA+ICsgKiBGSUZPIGlucHV0IGxldmVsLg0KPiA+ICsgKiBUaGUgUlFPUyBy
ZWdpc3RlciBjYW4gYWxzbyBzZXQgUW9TIGxldmVscyBmb3I6DQo+ID4gKyAqICAgIC0gUkVEX0FS
UU9TICAgQCBBIDQtYml0IHNpZ25hbCB2YWx1ZSBmb3IgY2xvc2UgdG8gdW5kZXJmbG93DQo+IGNv
bmRpdGlvbnMNCj4gPiArICogICAgLSBHUkVFTl9BUlFPUyBAIEEgNC1iaXQgc2lnbmFsIHZhbHVl
IGZvciBub3JtYWwgY29uZGl0aW9ucw0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBNQUxJRFA1MDBf
UlFPU19RVUFMSVRZICAgICAgICAgIDB4MDA1MDANCj4gPiArDQo+ID4gIC8qIHJlZ2lzdGVyIG9m
ZnNldHMgYW5kIGJpdHMgc3BlY2lmaWMgdG8gRFA1NTAvRFA2NTAgKi8NCj4gPiAgI2RlZmluZSBN
QUxJRFA1NTBfQUREUl9TUEFDRV9TSVpFICAgIDB4MTAwMDANCj4gPiAgI2RlZmluZSBNQUxJRFA1
NTBfREVfQ09OVFJPTCAgICAgICAgIDB4MDAwMTANCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo+
IA0KPiAtLQ0KPiA9PT09PT09PT09PT09PT09PT09PQ0KPiB8IEkgd291bGQgbGlrZSB0byB8DQo+
IHwgZml4IHRoZSB3b3JsZCwgIHwNCj4gfCBidXQgdGhleSdyZSBub3QgfA0KPiB8IGdpdmluZyBt
ZSB0aGUgICB8DQo+ICBcIHNvdXJjZSBjb2RlISAgLw0KPiAgIC0tLS0tLS0tLS0tLS0tLQ0KPiAg
ICAgwq9cXyjjg4QpXy/Crw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
