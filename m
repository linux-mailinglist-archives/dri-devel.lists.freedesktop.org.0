Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1387EF0C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DB16ED58;
	Fri,  2 Aug 2019 08:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1185F6E58A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 12:10:22 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x71C9h5V025969; Thu, 1 Aug 2019 08:10:11 -0400
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2054.outbound.protection.outlook.com [104.47.49.54])
 by mx0b-00128a01.pphosted.com with ESMTP id 2u3vjx0p6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Aug 2019 08:10:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCKGCMQE8DWZoi4PMPauYyU4AYz1aKXEhX25KvZG65F5LwSGiHAKwgPkPSk9mf5y9uhKrYDIFKCpfDjUPO8Ea92+bmXU8iGAgOqIadTn+8Ck+2pw7cIrAs+PwcFs2w9CFHcxOMRi1S0KghSjs/GBs0Gl53YtsPUxb5cBFTyJotHGPnDvUs4RnlcMrXf4azGy4zWT7wGqF5lZwSd6bi3TxKBzs7srOtLeSewmaw+aJQYoHSBu2L7j76Fu9z8vKQeu1iD+m0rWqkfSEM0Oy+RbTil/LTDOQ2Gf/Mc8Z+nczUe/xNBfmSQO5W8o28R/Odh2tftRrVeDhRiwWWeQpJqLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2A6Ro0l5Jenf8lGHjfQ14hbQsEKexxO4gpJOy//n9g=;
 b=KRonw6l5s3Y+KvFaPVaSw5Y71wPHaUOKoJuigdNNq0od3EYCNuOOVJ/JlQ+V0VXZsk7ffLjjvhVDomkuswPdQMMn3QM1eQmCHmXOD7JopdsRBJtn93TBMGJaXNvtYPskk43jBPFFsJHnL1PTURV9gDHs3bLDDcbqrXuE2aRhbF55r5PaIjUHM14NB0EwkOFU8Ulstkmlxx8v1knRsgSmSOUyDmISRhPtT5IwC0FNXkqg+3wfWEk1vyAwMFwc6+w8yoABEqlyShPQ8UfZdTyE9l62bhdkSnvkfoN1uV5Iae96hcO59jPAaeSJuBr/uX2AiRVCoDmxONvSgP8KuhiJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=analog.com;dmarc=pass action=none
 header.from=analog.com;dkim=pass header.d=analog.com;arc=none
Received: from BN8PR03MB4770.namprd03.prod.outlook.com (20.179.64.223) by
 BN8PR03MB4723.namprd03.prod.outlook.com (20.178.223.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 1 Aug 2019 12:10:10 +0000
Received: from BN8PR03MB4770.namprd03.prod.outlook.com
 ([fe80::d096:6c2e:91ac:39bb]) by BN8PR03MB4770.namprd03.prod.outlook.com
 ([fe80::d096:6c2e:91ac:39bb%6]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 12:10:10 +0000
From: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Topic: [PATCH 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Index: AQHVRtlIY4jkERMGvEuZA9MbwGut16bkcu0AgAHDfAA=
Date: Thu, 1 Aug 2019 12:10:09 +0000
Message-ID: <ee15ddd9b46b0bee8a9568cb46aaf5cc77b3c1aa.camel@analog.com>
References: <20190730131736.30187-1-bogdan.togorean@analog.com>
 <20190730131736.30187-3-bogdan.togorean@analog.com>
 <20190731091410.GC5080@pendragon.ideasonboard.com>
In-Reply-To: <20190731091410.GC5080@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ad394d7-7eb7-4bfa-4c94-08d71679331c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR03MB4723; 
x-ms-traffictypediagnostic: BN8PR03MB4723:
x-microsoft-antispam-prvs: <BN8PR03MB47233B840E79E72853B442FD9BDE0@BN8PR03MB4723.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(346002)(396003)(366004)(39860400002)(54094003)(199004)(189003)(6916009)(68736007)(71200400001)(71190400001)(2501003)(8936002)(6512007)(99286004)(6486002)(6436002)(14454004)(229853002)(6116002)(54906003)(5640700003)(2906002)(316002)(8676002)(81166006)(81156014)(3846002)(26005)(76176011)(6506007)(305945005)(53936002)(7416002)(486006)(478600001)(11346002)(446003)(476003)(186003)(2616005)(36756003)(66066001)(5660300002)(7736002)(25786009)(256004)(66946007)(118296001)(4326008)(14444005)(86362001)(102836004)(2351001)(6246003)(76116006)(66556008)(91956017)(66476007)(66446008)(64756008)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR03MB4723;
 H:BN8PR03MB4770.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tIDP3yu84UofoDwUFccbaiajYU5L/D8Hbip5u0l1Hq3xJpD8quqS0415ONIKudrRodHW9km+yqKHZW/sTTvYyf7+SjImQXlJK8WxF0IF1qagz69B9VBD/c59vssH9szoAWGFFLQWBa9r9219H5bF5Blqipu+zU1L4hoejEV+q/OX3x9PCF2x8E/5gSt/QRBup4riHydAlJz81vI2ApTafE/leo54B4PuHCVE2WnyJKJI5UYxImIGZWmBuxwIJg4ci3fNZyVM9X4zMDvlJluibi7CO80GyjA9NA7H9EQTgWQCegr5mbFIiZ0HdGPNzUBs9sce6H/sXcjZ5FGTkSNOAsL79PLjf0/AK7m4gsVi3SzrvpwhLkPbfxEVeA2PKX0LZfONol8D5OqdyDc80hszC4SgMiD69y0ikJ+SypPUiJg=
Content-ID: <C5E5DDC55CF71E4C88376F73BC8466F0@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad394d7-7eb7-4bfa-4c94-08d71679331c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 12:10:09.9341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bogdan.Togorean@analog.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908010129
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2A6Ro0l5Jenf8lGHjfQ14hbQsEKexxO4gpJOy//n9g=;
 b=NwCwtYjpKstMOX7ASi9UoXT4i6+lxueHfvANHAcTcaMeUprVZaIXfC5U5BMSJeG5PU+caPI9h93goiR1cSp39rj8M4wcN7h1THIW+RYTvtedxICQw9jo1Ujx1RYd9Zg421XrbbVIn84iPJcb2AOtV98W8WuqGz4V7+KeC0AnX/M=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiBXZWQsIDIwMTkt
MDctMzEgYXQgMTI6MTQgKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+IFtFeHRlcm5h
bF0NCj4gDQo+IEhpIEJvZ2RhbiwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiAN
Cj4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDQ6MTc6MzZQTSArMDMwMCwgQm9nZGFuIFRvZ29y
ZWFuIHdyb3RlOg0KPiA+IEFEVjc1MzUgaXMgYSBEU0kgdG8gSERNSSBicmlkZ2UgY2hpcCBsaWtl
IEFEVjc1MzMgYnV0IGl0IGFsbG93cw0KPiA+IDEwODBwQDYwSHouIHYxcDIgaXMgZml4ZWQgdG8g
MS44ViBvbiBBRFY3NTM1IGJ1dCBvbiBBRFY3NTMzIGNhbiBiZQ0KPiA+IDEuMlYNCj4gPiBvciAx
LjhWIGFuZCBpcyBjb25maWd1cmFibGUgaW4gYSByZWdpc3Rlci4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCb2dkYW4gVG9nb3JlYW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oICAgICB8
ICAyICsrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5j
IHwgMzEgKysrKysrKysrKysrKysrLQ0KPiA+IC0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gaW5kZXggNTJiMmFkZmRjODc3Li43
MDI0MzI2MTVlYzggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MTEuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9h
ZHY3NTExLmgNCj4gPiBAQCAtOTEsNiArOTEsNyBAQA0KPiA+ICAjZGVmaW5lIEFEVjc1MTFfUkVH
X0FSQ19DVFJMCQkJMHhkZg0KPiA+ICAjZGVmaW5lIEFEVjc1MTFfUkVHX0NFQ19JMkNfQUREUgkJ
MHhlMQ0KPiA+ICAjZGVmaW5lIEFEVjc1MTFfUkVHX0NFQ19DVFJMCQkJMHhlMg0KPiA+ICsjZGVm
aW5lIEFEVjc1MTFfUkVHX1NVUFBMWV9TRUxFQ1QJCTB4ZTQNCj4gPiAgI2RlZmluZSBBRFY3NTEx
X1JFR19DSElQX0lEX0hJR0gJCTB4ZjUNCj4gPiAgI2RlZmluZSBBRFY3NTExX1JFR19DSElQX0lE
X0xPVwkJCTB4ZjYNCj4gPiAgDQo+ID4gQEAgLTMyMCw2ICszMjEsNyBAQCBzdHJ1Y3QgYWR2NzUx
MV92aWRlb19jb25maWcgew0KPiA+ICBlbnVtIGFkdjc1MTFfdHlwZSB7DQo+ID4gIAlBRFY3NTEx
LA0KPiA+ICAJQURWNzUzMywNCj4gPiArCUFEVjc1MzUsDQo+ID4gIH07DQo+ID4gIA0KPiA+ICAj
ZGVmaW5lIEFEVjc1MTFfTUFYX0FERFJTIDMNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gaW5kZXggZjZkMjY4MWY2OTI3Li45NDEw
NzJkZWNiNzMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEv
YWR2NzUxMV9kcnYuYw0KPiA+IEBAIC0zNjcsNyArMzY3LDcgQEAgc3RhdGljIHZvaWQgYWR2NzUx
MV9wb3dlcl9vbihzdHJ1Y3QgYWR2NzUxMQ0KPiA+ICphZHY3NTExKQ0KPiA+ICAJICovDQo+ID4g
IAlyZWdjYWNoZV9zeW5jKGFkdjc1MTEtPnJlZ21hcCk7DQo+ID4gIA0KPiA+IC0JaWYgKGFkdjc1
MTEtPnR5cGUgPT0gQURWNzUzMykNCj4gPiArCWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1MzMg
fHwgYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTM1KQ0KPiA+ICAJCWFkdjc1MzNfZHNpX3Bvd2VyX29u
KGFkdjc1MTEpOw0KPiA+ICAJYWR2NzUxMS0+cG93ZXJlZCA9IHRydWU7DQo+ID4gIH0NCj4gPiBA
QCAtMzg3LDcgKzM4Nyw3IEBAIHN0YXRpYyB2b2lkIF9fYWR2NzUxMV9wb3dlcl9vZmYoc3RydWN0
IGFkdjc1MTENCj4gPiAqYWR2NzUxMSkNCj4gPiAgc3RhdGljIHZvaWQgYWR2NzUxMV9wb3dlcl9v
ZmYoc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEpDQo+ID4gIHsNCj4gPiAgCV9fYWR2NzUxMV9wb3dl
cl9vZmYoYWR2NzUxMSk7DQo+ID4gLQlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzKQ0KPiA+
ICsJaWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMyB8fCBhZHY3NTExLT50eXBlID09IEFEVjc1
MzUpDQo+ID4gIAkJYWR2NzUzM19kc2lfcG93ZXJfb2ZmKGFkdjc1MTEpOw0KPiA+ICAJYWR2NzUx
MS0+cG93ZXJlZCA9IGZhbHNlOw0KPiA+ICB9DQo+ID4gQEAgLTc2MSw3ICs3NjEsNyBAQCBzdGF0
aWMgdm9pZCBhZHY3NTExX21vZGVfc2V0KHN0cnVjdCBhZHY3NTExDQo+ID4gKmFkdjc1MTEsDQo+
ID4gIAlyZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVnbWFwLCAweDE3LA0KPiA+ICAJCTB4
NjAsICh2c3luY19wb2xhcml0eSA8PCA2KSB8IChoc3luY19wb2xhcml0eSA8PCA1KSk7DQo+ID4g
IA0KPiA+IC0JaWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMykNCj4gPiArCWlmIChhZHY3NTEx
LT50eXBlID09IEFEVjc1MzMgfHwgYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTM1KQ0KPiA+ICAJCWFk
djc1MzNfbW9kZV9zZXQoYWR2NzUxMSwgYWRqX21vZGUpOw0KPiA+ICANCj4gPiAgCWRybV9tb2Rl
X2NvcHkoJmFkdjc1MTEtPmN1cnJfbW9kZSwgYWRqX21vZGUpOw0KPiA+IEBAIC04NzQsNyArODc0
LDcgQEAgc3RhdGljIGludCBhZHY3NTExX2JyaWRnZV9hdHRhY2goc3RydWN0DQo+ID4gZHJtX2Jy
aWRnZSAqYnJpZGdlKQ0KPiA+ICAJCQkJICZhZHY3NTExX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mp
Ow0KPiA+ICAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcigmYWR2LT5jb25uZWN0b3IsIGJy
aWRnZS0+ZW5jb2Rlcik7DQo+ID4gIA0KPiA+IC0JaWYgKGFkdi0+dHlwZSA9PSBBRFY3NTMzKQ0K
PiA+ICsJaWYgKGFkdi0+dHlwZSA9PSBBRFY3NTMzIHx8IGFkdi0+dHlwZSA9PSBBRFY3NTM1KQ0K
PiA+ICAJCXJldCA9IGFkdjc1MzNfYXR0YWNoX2RzaShhZHYpOw0KPiA+ICANCj4gPiAgCWlmIChh
ZHYtPmkyY19tYWluLT5pcnEpDQo+ID4gQEAgLTk1Miw3ICs5NTIsNyBAQCBzdGF0aWMgYm9vbA0K
PiA+IGFkdjc1MTFfY2VjX3JlZ2lzdGVyX3ZvbGF0aWxlKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5z
aWduZWQgaW50IHJlZykNCj4gPiAgCXN0cnVjdCBpMmNfY2xpZW50ICppMmMgPSB0b19pMmNfY2xp
ZW50KGRldik7DQo+ID4gIAlzdHJ1Y3QgYWR2NzUxMSAqYWR2NzUxMSA9IGkyY19nZXRfY2xpZW50
ZGF0YShpMmMpOw0KPiA+ICANCj4gPiAtCWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1MzMpDQo+
ID4gKwlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzIHx8IGFkdjc1MTEtPnR5cGUgPT0gQURW
NzUzNSkNCj4gPiAgCQlyZWcgLT0gQURWNzUzM19SRUdfQ0VDX09GRlNFVDsNCj4gPiAgDQo+ID4g
IAlzd2l0Y2ggKHJlZykgew0KPiA+IEBAIC05OTQsNyArOTk0LDcgQEAgc3RhdGljIGludCBhZHY3
NTExX2luaXRfY2VjX3JlZ21hcChzdHJ1Y3QNCj4gPiBhZHY3NTExICphZHYpDQo+ID4gIAkJZ290
byBlcnI7DQo+ID4gIAl9DQo+ID4gIA0KPiA+IC0JaWYgKGFkdi0+dHlwZSA9PSBBRFY3NTMzKSB7
DQo+ID4gKwlpZiAoYWR2LT50eXBlID09IEFEVjc1MzMgfHwgYWR2LT50eXBlID09IEFEVjc1MzUp
IHsNCj4gPiAgCQlyZXQgPSBhZHY3NTMzX3BhdGNoX2NlY19yZWdpc3RlcnMoYWR2KTsNCj4gPiAg
CQlpZiAocmV0KQ0KPiA+ICAJCQlnb3RvIGVycjsNCj4gPiBAQCAtMTA5NCw4ICsxMDk0LDkgQEAg
c3RhdGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+ID4gKmkyYywgY29u
c3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQ0KPiA+ICAJc3RydWN0IGFkdjc1MTFfbGlua19j
b25maWcgbGlua19jb25maWc7DQo+ID4gIAlzdHJ1Y3QgYWR2NzUxMSAqYWR2NzUxMTsNCj4gPiAg
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZpMmMtPmRldjsNCj4gPiArCXN0cnVjdCByZWd1bGF0b3Ig
KnJlZ192MXAyOw0KPiA+ICAJdW5zaWduZWQgaW50IHZhbDsNCj4gPiAtCWludCByZXQ7DQo+ID4g
KwlpbnQgcmV0LCByZWdfdjFwMl91VjsNCj4gPiAgDQo+ID4gIAlpZiAoIWRldi0+b2Zfbm9kZSkN
Cj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiBAQCAtMTE2Myw2ICsxMTY0LDE4IEBAIHN0YXRp
YyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICppMmMsIGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkICppZCkNCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJZ290byB1bmlu
aXRfcmVndWxhdG9yczsNCj4gPiAgDQo+ID4gKwlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMz
KSB7DQo+ID4gKwkJcmV0ID0gbWF0Y2hfc3RyaW5nKGFkdjc1MzNfc3VwcGx5X25hbWVzLCBhZHY3
NTExLQ0KPiA+ID5udW1fc3VwcGxpZXMsDQo+IA0KPiBBbHRob3VnaCB0aGV5J3JlIGVxdWl2YWxl
bnQsIEkgd291bGQgdXNlDQo+IEFSUkFZX1NJWkUoYWR2NzUzM19zdXBwbHlfbmFtZXMpIGluc3Rl
YWQgb2YgYWR2NzUxMS0+bnVtX3N1cHBsaWVzIHRvDQo+IG1ha2UgdGhlIGNvZGUgZWFzaWVyIHRv
IHJlYWQgKG90aGVyd2lzZSBvbmUgaGFzIHRvIGNoZWNrIHdoZXJlDQo+IG51bV9zdXBwbGllcyBp
cyBzZXQgdG8gdmFsaWRhdGUgdGhpcyBmdW5jdGlvbiBjYWxsKS4NCj4gDQpBY2suIFdpbGwgbW9k
aWZ5IGl0IGluIFYyDQo+ID4gKwkJCQkJCQkJCQ0KPiA+ICJ2MXAyIik7DQo+IA0KPiBZb3Ugc2hv
dWxkIGFsaWduICJ2MXAyIiBsZWZ0LCB3aXRoIGFkdjc1MzNfc3VwcGx5X25hbWVzLg0KPiANCj4g
SSB3b25kZXIgaWYgeW91IGNvdWxkbid0IHNpbXBseSBoYXJkY29kZSB0aGUgaW5kZXgsIHdpdGgg
YSBjb21tZW50DQo+IGFib3ZlDQo+IHRoZSBhZHY3NTMzX3N1cHBseV9uYW1lcyBhcnJheSB0byBt
ZW50aW9uIHRoYXQgdGhlIG9yZGVyIG9mIHRoZQ0KPiBlbnRyaWVzDQo+IHNoYWxsIG5vdCBiZSBt
b2RpZmllZCB3aXRob3V0IHVwZGF0aW5nIHRoZSBsb2NhdGlvbnMgdGhhdCBoYXJkY29kZQ0KPiBp
bmRpY2VzLg0KT2ssIG15IGludGVudGlvbiB3YXMgdG8gaGF2ZSByb2J1c3QgY29kZSBidXQgYXMg
eW91IHNhaWQgYSBjb21tZW50DQpiZWZvcmUgdGhlIHN1cHBseSBuYW1lcyBhcnJheSBpcyBlbm91
Z2guDQo+IA0KPiA+ICsJCXJlZ192MXAyID0gYWR2NzUxMS0+c3VwcGxpZXNbcmV0XS5jb25zdW1l
cjsNCj4gPiArCQlyZWdfdjFwMl91ViA9IHJlZ3VsYXRvcl9nZXRfdm9sdGFnZShyZWdfdjFwMik7
DQo+ID4gKw0KPiA+ICsJCWlmIChyZWdfdjFwMl91ViA9PSAxMjAwMDAwKSB7DQo+ID4gKwkJCXJl
Z21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsDQo+ID4gKwkJCQlBRFY3NTExX1JFR19T
VVBQTFlfU0VMRUNULCAweDgwLCAweDgwKTsNCj4gPiArCQl9DQo+IA0KPiBTaG91bGRuJ3QgeW91
IGV4cGxpY2l0bHkgY2xlYXIgYml0IDcgd2hlbiByZWdfdjFwMl91ViBpcyBub3QgMTIwMDAwMA0K
PiA/DQo+IE9yIGlzIHRoZXJlIGEgZ3VhcmFudGVlIGl0IGdldHMgcmVzZXQgYWZ0ZXIgYSByZWJv
b3QgPw0KSXQgaXMgZ3VhcmFudGVlZCB0aGF0IGl0IHN0YXJ0cyBjbGVhcmVkIHRvIGJlIHNhZmUg
Zm9yIHRoZSBjaGlwIGlmIHRoZQ0Kdm9sdGFnZSBpcyAxLjhWLg0KPiANCj4gPiArCX0NCj4gPiAr
DQo+ID4gIAlhZHY3NTExX3BhY2tldF9kaXNhYmxlKGFkdjc1MTEsIDB4ZmZmZik7DQo+ID4gIA0K
PiA+ICAJYWR2NzUxMS0+aTJjX2VkaWQgPSBpMmNfbmV3X3NlY29uZGFyeV9kZXZpY2UoaTJjLCAi
ZWRpZCIsDQo+ID4gQEAgLTEyNDIsNyArMTI1NSw3IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9yZW1v
dmUoc3RydWN0IGkyY19jbGllbnQNCj4gPiAqaTJjKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgYWR2
NzUxMSAqYWR2NzUxMSA9IGkyY19nZXRfY2xpZW50ZGF0YShpMmMpOw0KPiA+ICANCj4gPiAtCWlm
IChhZHY3NTExLT50eXBlID09IEFEVjc1MzMpDQo+ID4gKwlpZiAoYWR2NzUxMS0+dHlwZSA9PSBB
RFY3NTMzIHx8IGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzNSkNCj4gPiAgCQlhZHY3NTMzX2RldGFj
aF9kc2koYWR2NzUxMSk7DQo+ID4gIAlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoYWR2NzUxMS0+aTJj
X2NlYyk7DQo+ID4gIAlpZiAoYWR2NzUxMS0+Y2VjX2NsaykNCj4gPiBAQCAtMTI2OCw2ICsxMjgx
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkDQo+ID4gYWR2NzUxMV9pMmNf
aWRzW10gPSB7DQo+ID4gIAl7ICJhZHY3NTEzIiwgQURWNzUxMSB9LA0KPiA+ICAjaWZkZWYgQ09O
RklHX0RSTV9JMkNfQURWNzUzMw0KPiANCj4gQXMgbm90ZWQgYnkgTmVpbCwgSSB0aGluayB0aGlz
IGNvbmZpZyBvcHRpb24gc2hvdWxkIGJlIHJlbmFtZWQNCj4gKHBvc3NpYmx5DQo+IHRvIENPTkZJ
R19EUk1fSTJDX0FEVjc1M1gpIGFuZCBpdHMgZGVzY3JpcHRpb24gdXBkYXRlZC4NCkFjay4gV2ls
bCByZW5hbWUgdG8gQ09ORklHX0RSTV9JMkNfQURWNzUzWCBhbmQgdXBkYXRlIGRlY3JpcHRpb24u
DQo+IA0KPiA+ICAJeyAiYWR2NzUzMyIsIEFEVjc1MzMgfSwNCj4gPiArCXsgImFkdjc1MzUiLCBB
RFY3NTM1IH0sDQo+ID4gICNlbmRpZg0KPiA+ICAJeyB9DQo+ID4gIH07DQo+ID4gQEAgLTEyNzks
NiArMTI5Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gYWR2NzUx
MV9vZl9pZHNbXSA9IHsNCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAiYWRpLGFkdjc1MTMiLCAuZGF0
YSA9ICh2b2lkICopQURWNzUxMSB9LA0KPiA+ICAjaWZkZWYgQ09ORklHX0RSTV9JMkNfQURWNzUz
Mw0KPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJhZGksYWR2NzUzMyIsIC5kYXRhID0gKHZvaWQgKilB
RFY3NTMzIH0sDQo+ID4gKwl7IC5jb21wYXRpYmxlID0gImFkaSxhZHY3NTM1IiwgLmRhdGEgPSAo
dm9pZCAqKUFEVjc1MzUgfSwNCj4gPiAgI2VuZGlmDQo+ID4gIAl7IH0NCj4gPiAgfTsNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
