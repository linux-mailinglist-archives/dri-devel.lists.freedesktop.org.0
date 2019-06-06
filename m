Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2009636F7C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B5C892EE;
	Thu,  6 Jun 2019 09:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140070.outbound.protection.outlook.com [40.107.14.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54D892EE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:07:13 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5229.eurprd08.prod.outlook.com (10.255.27.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 09:07:10 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 09:07:10 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] arm/komeda: Convert dp_wait_cond() to return an error
 code.
Thread-Topic: [PATCH] arm/komeda: Convert dp_wait_cond() to return an error
 code.
Thread-Index: AQHVHEc4g1JuyfDG4E2fR+nWN/sgNA==
Date: Thu, 6 Jun 2019 09:07:10 +0000
Message-ID: <20190606090703.GA5719@james-ThinkStation-P300>
References: <20190605111929.18478-1-Liviu.Dudau@arm.com>
In-Reply-To: <20190605111929.18478-1-Liviu.Dudau@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33d9bff2-13ab-47e2-2d5c-08d6ea5e5b3a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5229; 
x-ms-traffictypediagnostic: VE1PR08MB5229:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB52299CE6CAD2723739E22941B3170@VE1PR08MB5229.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(346002)(39860400002)(136003)(396003)(376002)(366004)(189003)(199004)(6506007)(4326008)(52116002)(2906002)(71200400001)(478600001)(76176011)(3846002)(14454004)(102836004)(66066001)(386003)(1076003)(99286004)(7736002)(229853002)(66476007)(64756008)(6436002)(5660300002)(66446008)(68736007)(33716001)(6246003)(66946007)(73956011)(66556008)(81166006)(11346002)(33656002)(71190400001)(55236004)(25786009)(446003)(8936002)(81156014)(6512007)(8676002)(26005)(58126008)(6116002)(9686003)(54906003)(316002)(86362001)(256004)(6862004)(6486002)(6636002)(476003)(186003)(305945005)(53936002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5229;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vVaZo1YLetG7dwnN6sSjLfbA/dVDz99N365CfkKLHAFCOwPTiO/FA+K+DDW+b09tof18WdrBy3nnRgD041ajpHEJ05Doxya+yWsuGsuREb9ZMGtZKAItdEF144DkPfzADrACzpS66+sZQktzk7r59AjMO8BWpacMi8rS3yOpLRWA2hkIcX7eZ2djj6MxGboVltIHQdsWcutOspWOhh5ShPBQDLd01FVC8dMEbOtmbfBj0fveDLtOzBCp5e2h+KXbUZygVFXEk2syJ9Dc3eku2RyHw4TjachrLYf67Y5Iq5VueoV3Eu9wtcFrZzNxhORLCE4/gHHD1vox6T6O36SQafOSO1yoGUERZpNfUUv+xyk87kKR0JEvxzBvsU/ApwulbQubaBdsfUhWgTPs3FKftv02BpYeFnUXgQnTTxER0j4=
Content-ID: <5EBAEC58C5CBDD42A90A81F63A4DA7BF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d9bff2-13ab-47e2-2d5c-08d6ea5e5b3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 09:07:10.0627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sykk4YULeYtV8pa3tDaxcKIWpJooZG3A3Egq7wfr6Lk=;
 b=6hE30CdU0TjwflaVUDL+Wu3wzpE1WSJgl75HvPuvMlp3JEFtdhCOweO0hQhFkEQoQz0cyi3iZ0VbLamys7BoUrwVHcqmi0iHx/V7KmYA/sDC33TM8aebKSMQSoM48ws1AJ8zUPeVJnZq9atYKuzm28LFN+zGlaKH4VlzXMeJesw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Mali DP developers <malidp@foss.arm.com>,
 DRI devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMTI6MTk6MjlQTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gZHBfd2FpdF9jb25kKCkgY3VycmVudGx5IHJldHVybnMgdGhlIG51bWJlciBvZiByZXRy
aWVzIGxlZnQgb3ZlciB3aGljaAo+IGlzIGhhcmRseSBhbiB1c2VmdWwgaW5mb3JtYXRpb24uIENv
bnZlcnQgdG8gcmV0dXJuaW5nIC1FVElNRURPVVQgd2hlbgo+IHRoZSB3YWl0IHRpbWVzIG91dCwg
b3IgMCAoemVybykgd2hlbiBjb25kaXRpb24gaXMgbWV0IGJlZm9yZSBkZWFkbGluZS4KPiAKPiBB
bHNvIGNvbnZlcnQgdGhlIHVzZXJzIG9mIHRoZSBmdW5jdGlvbiB0byByZXR1cm4gdGhlIGVycm9y
IHZhbHVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0u
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBf
dXRpbHMuaCB8IDUgKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9k
NzEvZDcxX2Rldi5jICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9pbmNsdWRlL21hbGlkcF91dGlscy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2luY2x1ZGUvbWFsaWRwX3V0aWxzLmgKPiBpbmRleCA4Y2ZkOTExOTZlMTUuLjNiYzM4M2Q1
YmY3MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9t
YWxpZHBfdXRpbHMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRl
L21hbGlkcF91dGlscy5oCj4gQEAgLTgsNiArOCw3IEBACj4gICNkZWZpbmUgX01BTElEUF9VVElM
U18KPiAgCj4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZXJy
bm8uaD4KPiAgCj4gICNkZWZpbmUgaGFzX2JpdChuciwgbWFzaykJKEJJVChucikgJiAobWFzaykp
Cj4gICNkZWZpbmUgaGFzX2JpdHMoYml0cywgbWFzaykJKCgoYml0cykgJiAobWFzaykpID09IChi
aXRzKSkKPiBAQCAtMjAsMTEgKzIxLDkgQEAKPiAgCWludCBudW1fdHJpZXMgPSBfX3RyaWVzOwkJ
CVwKPiAgCXdoaWxlICghX19jb25kICYmIChudW1fdHJpZXMgPiAwKSkgewkJXAo+ICAJCXVzbGVl
cF9yYW5nZShfX21pbl9yYW5nZSwgX19tYXhfcmFuZ2UpOwlcCj4gLQkJaWYgKF9fY29uZCkJCQkJ
XAo+IC0JCQlicmVhazsJCQkJXAo+ICAJCW51bV90cmllcy0tOwkJCQlcCj4gIAl9CQkJCQkJXAo+
IC0JbnVtX3RyaWVzOwkJCQkJXAo+ICsJKF9fY29uZCkgPyAwIDogLUVUSU1FRE9VVDsJCQlcCj4g
IH0pCj4gIAo+ICAvKiB0aGUgcmVzdHJpY3Rpb24gb2YgcmFuZ2UgaXMgW3N0YXJ0LCBlbmRdICov
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYu
Ywo+IGluZGV4IDFjOTE0ZjhjYTAxNi4uNjhmMjdjNWNmZmNkIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwo+IEBAIC0yODAsNyAr
MjgwLDcgQEAgc3RhdGljIGludCBkNzFfY2hhbmdlX29wbW9kZShzdHJ1Y3Qga29tZWRhX2RldiAq
bWRldiwgaW50IG5ld19tb2RlKQo+ICAJcmV0ID0gZHBfd2FpdF9jb25kKCgobWFsaWRwX3JlYWQz
MihkNzEtPmdjdV9hZGRyLCBCTEtfQ09OVFJPTCkgJiAweDcpID09IG9wbW9kZSksCj4gIAkJCSAg
IDEwMCwgMTAwMCwgMTAwMDApOwo+ICAKPiAtCXJldHVybiByZXQgPiAwID8gMCA6IC1FVElNRURP
VVQ7Cj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBkNzFfZmx1c2goc3Ry
dWN0IGtvbWVkYV9kZXYgKm1kZXYsCj4gQEAgLTMwNCw3ICszMDQsNyBAQCBzdGF0aWMgaW50IGQ3
MV9yZXNldChzdHJ1Y3QgZDcxX2RldiAqZDcxKQo+ICAJcmV0ID0gZHBfd2FpdF9jb25kKCEobWFs
aWRwX3JlYWQzMihnY3UsIEJMS19DT05UUk9MKSAmIEdDVV9DT05UUk9MX1NSU1QpLAo+ICAJCQkg
ICAxMDAsIDEwMDAsIDEwMDAwKTsKPiAgCj4gLQlyZXR1cm4gcmV0ID4gMCA/IDAgOiAtRVRJTUVE
T1VUOwo+ICsJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAgdm9pZCBkNzFfcmVhZF9ibG9ja19oZWFk
ZXIodTMyIF9faW9tZW0gKnJlZywgc3RydWN0IGJsb2NrX2hlYWRlciAqYmxrKQo+IC0tIAo+IDIu
MjEuMAoKTG9vayBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
