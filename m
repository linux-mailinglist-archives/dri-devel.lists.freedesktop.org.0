Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DA58555
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440906E040;
	Thu, 27 Jun 2019 15:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rfout1.hes.trendmicro.com (rfout1.hes.trendmicro.com
 [54.193.4.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185396E040
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:15:00 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.4.116])
 by rfout1.hes.trendmicro.com (Postfix) with ESMTPS id 3290211160B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:14:59 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.0.121])
 by rout1.hes.trendmicro.com (Postfix) with SMTP id C88DEEFC05F;
 Thu, 27 Jun 2019 15:14:57 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [104.47.100.58])
 by relay2.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 3C35FC4801D; Thu, 27 Jun 2019 15:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=qL2XX1QGkqJe/ukKvHb47reeXRMzTyL+SqZTKwwozsrqKUcI/azLiosaUvI3rulAv7puz3vpekl9GvLIbm3MY54OIpXOgtwVGn/VLNa7VuN6yV5Rq6AMZZoQUHTUrity555Tvaem2WU1/6BMY6GzJC00KOMgyhvTLlU+oooibXg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FspvMjk80G1Xx5AVytzmoa4fn5ghmm3rD+z1ROTs/50=;
 b=fOiI2c/mreD2XkAjXfW6icsA69xYMQ45qYGILHe3isG4e+2AOxm4WhqpJM/atiDyLDZ3tOVzc1b6+Z9J+k4BpSG4VtKqVmtEo6vDfs3W/16HsjHxDcKLCsUNMX+Y7666Pcd1T6o5/yv6kG6bEA564oARdUvcFLco8Bnj0/h5jqw=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM (10.174.217.139) by
 BMXPR01MB2502.INDPRD01.PROD.OUTLOOK.COM (20.178.169.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.17; Thu, 27 Jun 2019 15:14:52 +0000
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9bc:4b68:1344:f1ce]) by BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9bc:4b68:1344:f1ce%7]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 15:14:52 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Archit Taneja
 <architt@codeaurora.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Topic: [PATCH] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Index: AQHU+qDOBH/FCPbc60C2cd3c/xdrZKask20AgANtboA=
Date: Thu, 27 Jun 2019 15:14:52 +0000
Message-ID: <b79c6d86-9289-4c37-c04c-4afec173b35b@thinci.com>
References: <CGME20190424132254epcas1p4157791b8ce30297340d7053f59bc7f10@epcas1p4.samsung.com>
 <20190424132233.26435-1-matt.redfearn@thinci.com>
 <3951d606-6bbd-8465-4a02-1e23964a548b@samsung.com>
In-Reply-To: <3951d606-6bbd-8465-4a02-1e23964a548b@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::25) To BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:13::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.242.198.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceda6af3-ddbd-4d78-379a-08d6fb12342d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BMXPR01MB2502; 
x-ms-traffictypediagnostic: BMXPR01MB2502:
x-microsoft-antispam-prvs: <BMXPR01MB250281504643042F21C52F16F1FD0@BMXPR01MB2502.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(199004)(189003)(102836004)(6506007)(66066001)(14444005)(36756003)(110136005)(186003)(54906003)(5024004)(8936002)(256004)(8676002)(81166006)(7736002)(229853002)(14454004)(305945005)(81156014)(99286004)(7416002)(53546011)(6486002)(386003)(3846002)(6512007)(68736007)(486006)(71200400001)(2906002)(6436002)(6246003)(52116002)(66946007)(446003)(6116002)(11346002)(476003)(31686004)(5660300002)(53936002)(71190400001)(66446008)(31696002)(498600001)(4326008)(64756008)(66556008)(66476007)(26005)(25786009)(76176011)(73956011)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BMXPR01MB2502;
 H:BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1HRAJHFQUIukLWWwjTY+VVDDHwqHEkiXujrZLMAKHZ4wtskYPfe076+qx7uNlHtLaNCK8YcGcdNUSQ4IpqfUa+fPZGSdImE9Efujxc+IFogNFkTz2tydzY47zekjd/VWNCVMibPnm2rR+Jiy2BRTfXmFBF+XGBtVYZXvmTycGaSIHJ8ih0UMFLPPO7Fj18l1u+TiXb8wLF3BNzgCO3P8FZ9gS9c2FS/lsefI4A7vS6fairzyIk6tS/DrnSI/hhpAtUggZQMzRzxvryvlrrxke5lUFbM7CSjjEYx4oqeXATIZ9k2UKmD5TqjVlHnPJxEGwyVoSrGs9qiPkXpp4cOB7pyII+EZw/BRmvg+0zc4tbdrx3cqyuq2+AWlvdPDUUKo/YULAN1UDHcxZrF6q8VkRLwBoyVKkN8WIM4JnA9uZoQ=
Content-ID: <2C5AF7D465F2E145844C257F0FFEF4A9@INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceda6af3-ddbd-4d78-379a-08d6fb12342d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 15:14:52.5237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: matthew.redfearn@thinci.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2502
X-TMASE-Version: StarCloud-1.3-8.2.1013-24722.000
X-TMASE-Result: 10--10.967200-4.000000
X-TMASE-MatchedRID: fE0JoqABJp3mLzc6AOD8DfHkpkyUphL9hV0srjoqtx9quuOqohJ0cxoF
 QSnxkQANxbu6y+VVg9wRYoOKI3oBbw77rqkNdkQjJmbrB1j4XwpJaD67iKvY0wMADm5EdqKWJ50
 VrNw9M4nj8R1A96lYCkBAC01iiY6wQEiVuDOpLGwtMfCdg6KRDT/AwgScsQyZB2QWi8BF5ShpRe
 zoWC5XLaA3i+YbNhGP3MkFZ1gae2rx1sgenrSpRCAI8aJmq0jwNV9S7O+u3KbvxSNLwtVQBwMTq
 T+LpjRFdsHCDX3Hk44F86W4ca2PsBdstTYGWwetWBSfJTziFx8x/k92L7R8tkvEK4FMJdoqnSWE
 uKxy4hO27KEJAJlaQiVMnxhl+23+l79sXVrKzZKeAiCmPx4NwC0XqvNLnWxZCnPuno3zF/T5kvm
 j69FXvKEwgORH8p/AjaPj0W1qn0Q7AFczfjr/7IHPIIeuemFk7yuDjjyUyNz1e5ju0w/Sz6/ikN
 m3MnYQTFmPbrKxk0w=
X-TM-Deliver-Signature: F126FA71EB34CBF86833C8EF2F2C33DC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector2-thinciit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FspvMjk80G1Xx5AVytzmoa4fn5ghmm3rD+z1ROTs/50=;
 b=JJXH74fitiE/Bc/YHhonhv+OMQItL3zIPiVz9x1l/nNsf23guSa+YGgc9AcM0xg+s8QGN3KBQ97sun/eweEtTFGlX7WYL4fIWMLB8+UGyfy4ThY8Wta815KXpt3RdKyBGD+qd/kdJYp2pvOIf9o3I26xs9Lz3JWfKIotbHlGLRE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=matthew.redfearn@thinci.com; 
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDI1LzA2LzIwMTkgMTE6NTQsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6DQo+IE9uIDI0LjA0
LjIwMTkgMTU6MjIsIE1hdHQgUmVkZmVhcm4gd3JvdGU6DQo+PiBJbiBjb250cmFzdCB0byBhbGwg
b2YgdGhlIERTSSBwYW5lbCBkcml2ZXJzIGluIGRyaXZlcnMvZ3B1L2RybS9wYW5lbA0KPj4gd2hp
Y2ggYXR0YWNoIHRvIHRoZSBEU0kgaG9zdCB2aWEgbWlwaV9kc2lfYXR0YWNoKCkgYXQgcHJvYmUg
dGltZSwgdGhlDQo+PiBBRFY3NTMzIGJyaWRnZSBkZXZpY2UgZG9lcyBub3QuIEluc3RlYWQgaXQg
ZGVmZXJzIHRoaXMgdG8gdGhlIHBvaW50IHRoYXQNCj4+IHRoZSB1cHN0cmVhbSBkZXZpY2UgY29u
bmVjdHMgdG8gaXRzIGJyaWRnZSB2aWEgZHJtX2JyaWRnZV9hdHRhY2goKS4NCj4+IFRoZSBnZW5l
cmljIFN5bm9wc3lzIE1JUEkgRFNJIGhvc3QgZHJpdmVyIGRvZXMgbm90IHJlZ2lzdGVyIGl0J3Mg
b3duDQo+PiBkcm1fYnJpZGdlIHVudGlsIHRoZSBNSVBJIERTSSBoYXMgYXR0YWNoZWQuIEJ1dCBp
dCBkb2VzIG5vdCBjYWxsDQo+PiBkcm1fYnJpZGdlX2F0dGFjaCgpIG9uIHRoZSBkb3duc3RyZWFt
IGRldmljZSB1bnRpbCB0aGUgdXBzdHJlYW0gZGV2aWNlDQo+PiBoYXMgYXR0YWNoZWQuIFRoaXMg
bGVhZHMgdG8gYSBjaGlja2VuIGFuZCB0aGUgZWdnIGZhaWx1cmUgYW5kIHRoZSBEUk0NCj4+IHBp
cGVsaW5lIGRvZXMgbm90IGNvbXBsZXRlLg0KPj4gU2luY2UgYWxsIG90aGVyIG1pcGlfZHNpX2Rl
dmljZSBkcml2ZXJzIGNhbGwgbWlwaV9kc2lfYXR0YWNoKCkgaW4NCj4+IHByb2JlKCksIG1ha2Ug
dGhlIGFkdjc1MzMgbWlwaV9kc2lfZGV2aWNlIGRvIHRoZSBzYW1lLiBUaGlzIGVuc3VyZXMgdGhh
dA0KPj4gdGhlIFN5bm9wc3lzIE1JUEkgRFNJIGhvc3QgcmVnaXN0ZXJzIGl0J3MgYnJpZGdlIHN1
Y2ggdGhhdCBpdCBpcw0KPj4gYXZhaWxhYmxlIGZvciB0aGUgdXBzdHJlYW0gZGV2aWNlIHRvIGNv
bm5lY3QgdG8uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWF0dCBSZWRmZWFybiA8bWF0dC5yZWRm
ZWFybkB0aGluY2kuY29tPg0KPj4NCj4+IC0tLQ0KPj4NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgfCA5ICsrKysrLS0tLQ0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+PiBpbmRleCBlN2RkZDNlM2Ri
OS4uZWEzNmFjM2EzZGUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUxMV9kcnYuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MTFfZHJ2LmMNCj4+IEBAIC04NzQsOSArODc0LDYgQEAgc3RhdGljIGludCBhZHY3
NTExX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4+ICAgCQkJCSAm
YWR2NzUxMV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsNCj4+ICAgCWRybV9jb25uZWN0b3JfYXR0
YWNoX2VuY29kZXIoJmFkdi0+Y29ubmVjdG9yLCBicmlkZ2UtPmVuY29kZXIpOw0KPj4gICANCj4+
IC0JaWYgKGFkdi0+dHlwZSA9PSBBRFY3NTMzKQ0KPj4gLQkJcmV0ID0gYWR2NzUzM19hdHRhY2hf
ZHNpKGFkdik7DQo+PiAtDQo+PiAgIAlpZiAoYWR2LT5pMmNfbWFpbi0+aXJxKQ0KPj4gICAJCXJl
Z21hcF93cml0ZShhZHYtPnJlZ21hcCwgQURWNzUxMV9SRUdfSU5UX0VOQUJMRSgwKSwNCj4+ICAg
CQkJICAgICBBRFY3NTExX0lOVDBfSFBEKTsNCj4+IEBAIC0xMjIyLDcgKzEyMTksMTEgQEAgc3Rh
dGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMsIGNvbnN0IHN0cnVj
dCBpMmNfZGV2aWNlX2lkICppZCkNCj4+ICAgCWRybV9icmlkZ2VfYWRkKCZhZHY3NTExLT5icmlk
Z2UpOw0KPj4gICANCj4+ICAgCWFkdjc1MTFfYXVkaW9faW5pdChkZXYsIGFkdjc1MTEpOw0KPj4g
LQlyZXR1cm4gMDsNCj4+ICsNCj4+ICsJaWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMykNCj4+
ICsJCXJldHVybiBhZHY3NTMzX2F0dGFjaF9kc2koYWR2NzUxMSk7DQo+PiArCWVsc2UNCj4+ICsJ
CXJldHVybiAwOw0KPiANCj4gDQo+IEl0IHNlZW1zIHRoYXQgb24gZmFpbHVyZSBvZiBhZHY3NTMz
X2F0dGFjaF9kc2kgY2xlYW51cCBpcyBub3QgcGVyZm9ybWVkLg0KDQpIaSBBbmRyemVqLA0KUXVp
dGUgcmlnaHQgLSBJIHdpbGwgZml4IGFuZCByZXNlbmQuDQoNCj4gDQo+IEJlc2lkZSB0aGlzIGNo
YW5nZSBsb29rcyBPSywgYnV0IGl0IHdvdWxkIGJlIGdvb2QgdG8gdGVzdCBpdCBvbg0KPiBwbGF0
Zm9ybXMgd2l0aCBhZHY3NTMzLg0KDQpBcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIEkgbmVlZGVk
IHRoaXMgY2hhbmdlIHRvIGdldCB0aGUgZHJpdmVyIHRvIHdvcmsgDQphdCBhbGwgb24gYSBwbGF0
Zm9ybSB3aXRoIGEgU3lub3BzeXMgTUlQSSBEU0kgaW50ZXJmYWNlLiBIb3dldmVyIEkgd291bGQg
DQpiZSB2ZXJ5IGdyYXRlZnVsIGZvciBmZWVkYmFjayBmcm9tIHBlb3BsZSB1c2luZyB0aGUgQURW
NzUzMyB3aXRoIG90aGVyIA0KTUlQSSBEU0kgaG9zdHMuDQoNClRoYW5rcywNCk1hdHQNCg0KPiAN
Cj4gDQo+IFJlZ2FyZHMNCj4gDQo+IEFuZHJ6ZWoNCj4gDQo+IA0KPj4gICANCj4+ICAgZXJyX3Vu
cmVnaXN0ZXJfY2VjOg0KPj4gICAJaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGFkdjc1MTEtPmkyY19j
ZWMpOw0KPiANCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
