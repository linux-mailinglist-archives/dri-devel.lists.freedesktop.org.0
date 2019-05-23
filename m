Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A8F2762B
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 08:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07C989C37;
	Thu, 23 May 2019 06:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760077.outbound.protection.outlook.com [40.107.76.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DDF89C37
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:47:27 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6384.namprd05.prod.outlook.com (20.178.246.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.10; Thu, 23 May 2019 06:47:19 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.013; Thu, 23 May 2019
 06:47:19 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/5] vmwgfx: drop empty lastclose stub
Thread-Topic: [PATCH 1/5] vmwgfx: drop empty lastclose stub
Thread-Index: AQHVEL1lpQblJuUJdUSQ0+SmzCGhhKZ4RT6A
Date: Thu, 23 May 2019 06:47:18 +0000
Message-ID: <e743af2d82880078b37b52bff7a78b3b49baa624.camel@vmware.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
In-Reply-To: <20190522164119.24139-1-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eec96797-6a92-496a-0085-08d6df4a802a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6384; 
x-ms-traffictypediagnostic: MN2PR05MB6384:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB6384D168833D9D39882736BAA1010@MN2PR05MB6384.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(39860400002)(376002)(396003)(189003)(199004)(68736007)(66066001)(36756003)(99286004)(229853002)(8936002)(81166006)(81156014)(8676002)(256004)(14444005)(76116006)(91956017)(102836004)(66476007)(64756008)(66556008)(86362001)(66446008)(73956011)(66946007)(5660300002)(71190400001)(14454004)(6506007)(76176011)(25786009)(71200400001)(316002)(53936002)(54906003)(110136005)(6246003)(7736002)(186003)(26005)(476003)(478600001)(6486002)(6436002)(4326008)(486006)(6116002)(3846002)(2501003)(6512007)(2616005)(305945005)(11346002)(446003)(107886003)(2906002)(118296001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6384;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pi6sLVpzyKqjdox6ZBVizviaawFf02GxMWGt0qmrN3+w+oix8nJGuVrQ6j9gf3E3DXZa8PnaGSNcxdz1UXGV10QUNamumv79jzrnD8PqPUIjP/yU0J1xBbftPLsgSc8fKI+patoDvh0OmW4dZLJHDoqTkbSsn7q+rzG94tzWieXA0fQiTYbH+JcmvfLMlrSOB8FALMnb1RR3/HbCB4/xqxXGcphXH2RUAZ9Zrx0t2wsEi2y39cYg3ujDVSuQVwE9HUhFSZvEYL1ED5ZBCC748dkEwO2V418p/v1crvIKzGVB8qRbvmwkcfDNHVM75hjMK3lL+8tueNytT8mHDFCtHqNr8/PhDeDl+zHu/XCM5OPXoWIyQWxuio8FXXFjHciZJVetlWbeg70KmlTs+qJfbxcJ76Fq5cOvOWdXgovO9xc=
Content-ID: <DC686EE145B0724A896A8B52A43B106C@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec96797-6a92-496a-0085-08d6df4a802a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 06:47:18.8874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6384
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VokyO6/U9BqE5yZLAg6JcUm1X18Lu+B5jOr/DlDPI3U=;
 b=U0YrasSbXl5Vz2pGt5F/vF6emaFxE8QdA6+6IZwF+irIyDhWWZK+xrQVa3VQZRcgMZVV6Z8kisZJnz7cduQEBhwuxvOYV1IOemQalwXUZ4VHgsF7vXd6J1C3C8inTnQMyj8mfXfGs3pLg9wnG62toUMIk4PfDApM8LlpXXYu09Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA1LTIyIGF0IDE3OjQxICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+IA0KPiBD
b3JlIERSTSBpcyBzYWZlIHdoZW4gdGhlIGNhbGxiYWNrIGlzIE5VTEwuDQo+IA0KPiBDYzogIlZN
d2FyZSBHcmFwaGljcyIgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4NCj4g
Q2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292
IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxs
c3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCA1IC0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9kcnYuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jDQo+IGlu
ZGV4IGJlMjVjZTk0NDBhZC4uYTM4ZjA2OTA5ZmI2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuYw0KPiBAQCAtMTIwMCwxMCArMTIwMCw2IEBAIHN0YXRpYyBsb25nIHZtd19j
b21wYXRfaW9jdGwoc3RydWN0IGZpbGUNCj4gKmZpbHAsIHVuc2lnbmVkIGludCBjbWQsDQo+ICB9
DQo+ICAjZW5kaWYNCj4gIA0KPiAtc3RhdGljIHZvaWQgdm13X2xhc3RjbG9zZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQ0KPiAtew0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgdm9pZCB2bXdfbWFzdGVy
X2luaXQoc3RydWN0IHZtd19tYXN0ZXIgKnZtYXN0ZXIpDQo+ICB7DQo+ICAJdHRtX2xvY2tfaW5p
dCgmdm1hc3Rlci0+bG9jayk7DQo+IEBAIC0xNTY4LDcgKzE1NjQsNiBAQCBzdGF0aWMgc3RydWN0
IGRybV9kcml2ZXIgZHJpdmVyID0gew0KPiAgCURSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX1BSSU1F
IHwgRFJJVkVSX1JFTkRFUiB8IERSSVZFUl9BVE9NSUMsDQo+ICAJLmxvYWQgPSB2bXdfZHJpdmVy
X2xvYWQsDQo+ICAJLnVubG9hZCA9IHZtd19kcml2ZXJfdW5sb2FkLA0KPiAtCS5sYXN0Y2xvc2Ug
PSB2bXdfbGFzdGNsb3NlLA0KPiAgCS5nZXRfdmJsYW5rX2NvdW50ZXIgPSB2bXdfZ2V0X3ZibGFu
a19jb3VudGVyLA0KPiAgCS5lbmFibGVfdmJsYW5rID0gdm13X2VuYWJsZV92YmxhbmssDQo+ICAJ
LmRpc2FibGVfdmJsYW5rID0gdm13X2Rpc2FibGVfdmJsYW5rLA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
