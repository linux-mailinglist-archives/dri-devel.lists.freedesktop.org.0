Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F95283C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 11:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74C189DA5;
	Tue, 25 Jun 2019 09:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rfout1.hes.trendmicro.com (rfout1.hes.trendmicro.com
 [54.193.4.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2803D89DA5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:39:27 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.14.197])
 by rfout1.hes.trendmicro.com (Postfix) with ESMTPS id BF21D110B837
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:39:26 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.10.113])
 by rout1.hes.trendmicro.com (Postfix) with SMTP id 1BAD3EFC02A;
 Tue, 25 Jun 2019 09:39:26 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [104.47.100.55])
 by relay1.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 42411AFA01B; Tue, 25 Jun 2019 09:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=equqGUviJN4vF7MxpAp1XSSnZaAd4GOltp1stikFfLhZL7jzq36L2c0NRlyBhM2UyBhUxyK9j/0CiN1Ja3DgFkTA3CC60OESVz1a7i0DinBuMeGwhkSkdbLGOzcwZ1OjSiHAy8nVeYVpe/SMBGRY4lUd3MPRobE02BU0GAuezC0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj2R/eLx3Vv0l6fQwNhjAc7oz/OG0J9+TJ6C/vDPsIg=;
 b=WXawVfqAwjt+xZ/wDWKV8Ds3F2qmpSeei8GJ/H/4GqGRTxugYZtI5pO/xAX1ruYebitmajbWDnRNNmcay6sO8R+Nu7W6T2SFfZrFLHMdF4GFuoAYssHzXlz+xJvfve9EqP2eLStxXkXi0QiqDFjZzNu9yJq5s97YmxY3kZ69FP8=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM (10.174.217.139) by
 BMXPR01MB2696.INDPRD01.PROD.OUTLOOK.COM (20.178.169.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 09:39:20 +0000
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9a2:6d6:3674:cfe4]) by BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9a2:6d6:3674:cfe4%2]) with mapi id 15.20.1987.014; Tue, 25 Jun 2019
 09:39:20 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Matthew Redfearn <matthew.redfearn@thinci.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Topic: [PATCH] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Index: AQHU+qDOBH/FCPbc60C2cd3c/xdrZKasfnEA
Date: Tue, 25 Jun 2019 09:39:20 +0000
Message-ID: <0335921a-e752-b842-6a4b-bbc189fe061f@thinci.com>
References: <20190424132233.26435-1-matt.redfearn@thinci.com>
In-Reply-To: <20190424132233.26435-1-matt.redfearn@thinci.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::33) To BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:13::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.242.198.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2602fbd-baa1-48ae-008c-08d6f950ff85
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BMXPR01MB2696; 
x-ms-traffictypediagnostic: BMXPR01MB2696:
x-microsoft-antispam-prvs: <BMXPR01MB26963D7E73CA05A9AEB76472F1E30@BMXPR01MB2696.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(39830400003)(376002)(396003)(189003)(199004)(8936002)(5660300002)(6116002)(110136005)(316002)(256004)(54906003)(5024004)(31686004)(64756008)(2906002)(476003)(446003)(66946007)(66446008)(478600001)(66556008)(4326008)(486006)(66476007)(73956011)(14444005)(25786009)(2616005)(36756003)(11346002)(81166006)(81156014)(6436002)(14454004)(99286004)(53936002)(6486002)(66066001)(31696002)(8676002)(229853002)(6246003)(71190400001)(71200400001)(186003)(7416002)(7736002)(305945005)(76176011)(52116002)(386003)(53546011)(6512007)(6506007)(3846002)(68736007)(102836004)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BMXPR01MB2696;
 H:BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Eqqk4hJ1OjuXKHuTFT5p6agVW/z+oaTiqLFoWt3vGHsO/aqUNuMZ/bXvTQzBIQkRTQgK5BDa0nLq95pAO2/wslAAe/VRxUFSDXKEsjm3vIt4FEtupP4XtW8iH3jkNPYOIdrFOPTH67eAmoYD1Mmr1B71CE+F3cclNEQsTwpNmZnuKslwfXwf0Fb7uCeOIv/SMuHiM23Aok8ORw2/GJHaJDUtDO/8oZtpFhHAWKfjCfH6Ra1DIJXtF1U0bIth9hM0ndeTn/PYP376D+ROJg3Z72n3BwfT7AlvQP29BBiYVIyjDacyIllsVL0a2vn55yS7sTb20usl9Zng0wYmxV8VfCsbVkSFFbPQ6/iX88JYJ0v7MeDkbpM6QDVJWm2l9k+37D+HCMeT6jAyvvGDY6polfvUGn6QbQoek1JC9nAC0ko=
Content-ID: <9D51843700B1D841AD150527F9EF3E16@INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2602fbd-baa1-48ae-008c-08d6f950ff85
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 09:39:20.3133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: matthew.redfearn@thinci.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2696
X-TMASE-Version: StarCloud-1.3-8.2.1013-24712.002
X-TMASE-Result: 10--10.031800-4.000000
X-TMASE-MatchedRID: 6otD/cJAac2+moGtOG/rU34neC0h7SAD/ikB/mpWD6drRM6wvXgDaSGU
 b2JNxi1q+BY5Eio9E4/GVaDBoTrnxtMd/xz9OgvcCWlWR223da4vV5f7P0HVDBbozYDXkvVAFk+
 aYIozLXC3pAcaMyxl3G/FajuaeQTifDDFL+oKuV4o19GoN4WoGEYj0zDHPzJpoGbg2YK6wvOwWO
 ZlCXPpnTf8DC0XHQxTTC9ILRJvULpiWV0DQ85LUho8wYJxWb0OIYV+/kPiWELhWjjGhpcHL8crc
 ME/wqinK594lhSHcru6BAfcCFjYq5H0YXYnbGozGFT0qj0zi72Zso5Sxds3ZKU8D0b0qFy9suf7
 RWbvUtyrusVRy4an8SAHAopEd76v8fg6kztTrifNhwEfr4qAVYelEHq6FtOw91r+G4j1129i8Gt
 RK1zKTg==
X-TM-Deliver-Signature: EB12DBFE3DD6760A8DE4F6B64F8581E2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector2-thinciit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj2R/eLx3Vv0l6fQwNhjAc7oz/OG0J9+TJ6C/vDPsIg=;
 b=JYEew7Q+x2xrqfhGGV9Jxj6kU0NiRr/i+P3vXw0HZ4jkbDQk4Y+1Cxy8gyd6/xaXRmRJ8n7Wzk+BRWkvMeSRyaMnmL7K0dsrF7UlJUl0pSqTr4wR8ANZJrThAjQxr7NxoaVYhJSyleHjmVCjddI554vd+aUpw2KuWd2OVYKH1z0=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCkFueSBmZWVkYmFjayBvbiB0aGlzIHBhdGNoPw0KDQpUaGFua3MsDQpNYXR0DQoNCk9u
IDI0LzA0LzIwMTkgMTQ6MjIsIE1hdHRoZXcgUmVkZmVhcm4gd3JvdGU6DQo+IEluIGNvbnRyYXN0
IHRvIGFsbCBvZiB0aGUgRFNJIHBhbmVsIGRyaXZlcnMgaW4gZHJpdmVycy9ncHUvZHJtL3BhbmVs
DQo+IHdoaWNoIGF0dGFjaCB0byB0aGUgRFNJIGhvc3QgdmlhIG1pcGlfZHNpX2F0dGFjaCgpIGF0
IHByb2JlIHRpbWUsIHRoZQ0KPiBBRFY3NTMzIGJyaWRnZSBkZXZpY2UgZG9lcyBub3QuIEluc3Rl
YWQgaXQgZGVmZXJzIHRoaXMgdG8gdGhlIHBvaW50IHRoYXQNCj4gdGhlIHVwc3RyZWFtIGRldmlj
ZSBjb25uZWN0cyB0byBpdHMgYnJpZGdlIHZpYSBkcm1fYnJpZGdlX2F0dGFjaCgpLg0KPiBUaGUg
Z2VuZXJpYyBTeW5vcHN5cyBNSVBJIERTSSBob3N0IGRyaXZlciBkb2VzIG5vdCByZWdpc3RlciBp
dCdzIG93bg0KPiBkcm1fYnJpZGdlIHVudGlsIHRoZSBNSVBJIERTSSBoYXMgYXR0YWNoZWQuIEJ1
dCBpdCBkb2VzIG5vdCBjYWxsDQo+IGRybV9icmlkZ2VfYXR0YWNoKCkgb24gdGhlIGRvd25zdHJl
YW0gZGV2aWNlIHVudGlsIHRoZSB1cHN0cmVhbSBkZXZpY2UNCj4gaGFzIGF0dGFjaGVkLiBUaGlz
IGxlYWRzIHRvIGEgY2hpY2tlbiBhbmQgdGhlIGVnZyBmYWlsdXJlIGFuZCB0aGUgRFJNDQo+IHBp
cGVsaW5lIGRvZXMgbm90IGNvbXBsZXRlLg0KPiBTaW5jZSBhbGwgb3RoZXIgbWlwaV9kc2lfZGV2
aWNlIGRyaXZlcnMgY2FsbCBtaXBpX2RzaV9hdHRhY2goKSBpbg0KPiBwcm9iZSgpLCBtYWtlIHRo
ZSBhZHY3NTMzIG1pcGlfZHNpX2RldmljZSBkbyB0aGUgc2FtZS4gVGhpcyBlbnN1cmVzIHRoYXQN
Cj4gdGhlIFN5bm9wc3lzIE1JUEkgRFNJIGhvc3QgcmVnaXN0ZXJzIGl0J3MgYnJpZGdlIHN1Y2gg
dGhhdCBpdCBpcw0KPiBhdmFpbGFibGUgZm9yIHRoZSB1cHN0cmVhbSBkZXZpY2UgdG8gY29ubmVj
dCB0by4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUmVkZmVhcm4gPG1hdHQucmVkZmVhcm5A
dGhpbmNpLmNvbT4NCj4gDQo+IC0tLQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUxMV9kcnYuYyB8IDkgKysrKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+IGluZGV4IGU3ZGRkM2UzZGI5Li5lYTM2YWMz
YTNkZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MTFfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFf
ZHJ2LmMNCj4gQEAgLTg3NCw5ICs4NzQsNiBAQCBzdGF0aWMgaW50IGFkdjc1MTFfYnJpZGdlX2F0
dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPiAgIAkJCQkgJmFkdjc1MTFfY29ubmVj
dG9yX2hlbHBlcl9mdW5jcyk7DQo+ICAgCWRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoJmFk
di0+Y29ubmVjdG9yLCBicmlkZ2UtPmVuY29kZXIpOw0KPiAgIA0KPiAtCWlmIChhZHYtPnR5cGUg
PT0gQURWNzUzMykNCj4gLQkJcmV0ID0gYWR2NzUzM19hdHRhY2hfZHNpKGFkdik7DQo+IC0NCj4g
ICAJaWYgKGFkdi0+aTJjX21haW4tPmlycSkNCj4gICAJCXJlZ21hcF93cml0ZShhZHYtPnJlZ21h
cCwgQURWNzUxMV9SRUdfSU5UX0VOQUJMRSgwKSwNCj4gICAJCQkgICAgIEFEVjc1MTFfSU5UMF9I
UEQpOw0KPiBAQCAtMTIyMiw3ICsxMjE5LDExIEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudCAqaTJjLCBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQpDQo+
ICAgCWRybV9icmlkZ2VfYWRkKCZhZHY3NTExLT5icmlkZ2UpOw0KPiAgIA0KPiAgIAlhZHY3NTEx
X2F1ZGlvX2luaXQoZGV2LCBhZHY3NTExKTsNCj4gLQlyZXR1cm4gMDsNCj4gKw0KPiArCWlmIChh
ZHY3NTExLT50eXBlID09IEFEVjc1MzMpDQo+ICsJCXJldHVybiBhZHY3NTMzX2F0dGFjaF9kc2ko
YWR2NzUxMSk7DQo+ICsJZWxzZQ0KPiArCQlyZXR1cm4gMDsNCj4gICANCj4gICBlcnJfdW5yZWdp
c3Rlcl9jZWM6DQo+ICAgCWkyY191bnJlZ2lzdGVyX2RldmljZShhZHY3NTExLT5pMmNfY2VjKTsN
Cj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
