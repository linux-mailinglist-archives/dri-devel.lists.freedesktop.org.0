Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2117096A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C8B89E01;
	Mon, 22 Jul 2019 19:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116D89DFC;
 Mon, 22 Jul 2019 19:13:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoP9BtxVeotvNENRU/umHHtxPPW9AD+mUKMPURgyq+TbR6KaZvWXwavhmyg0ewM5q5RROAMyT73QV3BbIrvoCNwpRceP3CPVSz5NBjF16lVewhXL7GPkOc2UqddqYsJQs50IbxxCIAmHRhZjNdWgF07yAOfRCRZgkywzlRDHUuU3k7fQSsvokv73k78IgQMBzXWSe/iiZ37TEf2bqVzVvt3MssrGMAY/Cm3aYuXINw/XAkxYVjbeVT2wefSV/+U3q6DgwGfW2XqBFX5/xpQ9eeWMqnj7z80a4CbX/Kxs2lthsLeZ8vHwBQ1KTC7wS3Miq5Co7kTDPLHpOO51FUEC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5IjnT0GhMGi2rR5a4iHltxUT/5oG/VG4IOwkykkwzM=;
 b=E3q8C1GVs+J80W8c7fXY8CMi6mZN3AXDUez7g9QQWGmp94Q5ll8lBrvofVC9OV7dg6naPfLOwK73YvBUAmclrjSbu4eSnexa3J7MWNXQRGIKjz0aY8+freM7WRz3woGrZLkI4MsMX2JQZg25NMnR8uFj2sBmVA8lLuHdzEru4zrJ7BSPlV8L8OVU+ZMizETzWzgqfhpzslBvJq6yIAeSD2/fkXXgAI/IGbUSxXtLVowzspC5WrmGB8MgIIHLma4Qps9WPf837/3Lp6eCLkCFbXOb94A3UF4cGo8rG5yIKZOBIm0rxmd++9vlTTYhP/q0j9PZ1G9kPCBQLszveRDBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2485.namprd12.prod.outlook.com (52.132.141.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 22 Jul 2019 19:13:17 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Mon, 22 Jul
 2019 19:13:17 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Thread-Topic: [PATCH 3/3] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Thread-Index: AQHVQLSZ6/1zgMist0qPcqz6f8NJMqbXAZiA
Date: Mon, 22 Jul 2019 19:13:17 +0000
Message-ID: <c190b41d-2967-5cbf-58ac-d08b35a85ed0@amd.com>
References: <20190722174025.9830-1-emil.l.velikov@gmail.com>
 <20190722174025.9830-3-emil.l.velikov@gmail.com>
In-Reply-To: <20190722174025.9830-3-emil.l.velikov@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR10CA0076.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::17) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f402c1e-7a6e-4c66-2b1c-08d70ed8a6e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2485; 
x-ms-traffictypediagnostic: DM5PR12MB2485:
x-microsoft-antispam-prvs: <DM5PR12MB24851C0478F3E37AE56D51E983C40@DM5PR12MB2485.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(189003)(199004)(229853002)(6486002)(86362001)(66946007)(81166006)(66446008)(5660300002)(66556008)(316002)(14454004)(256004)(386003)(8936002)(4326008)(6436002)(110136005)(58126008)(6512007)(54906003)(81156014)(8676002)(66476007)(25786009)(64756008)(305945005)(7736002)(31696002)(31686004)(64126003)(6506007)(486006)(68736007)(66574012)(446003)(65826007)(6246003)(65956001)(476003)(2501003)(36756003)(186003)(2616005)(478600001)(99286004)(11346002)(65806001)(46003)(76176011)(102836004)(71200400001)(71190400001)(6116002)(2906002)(53936002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2485;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PtyXbJpH9gtNpr9P84upLxCZ0P754FkhDYzxBcuzLqQ3l52n/2wR7VBNFypv+y7kEeBenEoy06nqTW7hhq6G3a7w6MZRrjWNPZIlFon1nH1K2nuqPlfAoN15WMBDJ5v6jfVjHgPr2KNPRVsw6VOroVGh9IM/IPcQCv0MRRCdzlV3jSOJOlNsM4rPlZxoXhZNxBaUZnNhfnC1zybDn1CsAiAydVfD6pUvSZ/+OtuZ4kh1gIahzNhNa7D7wnFJlHLO9zHQfMBkDkHSXXceZoxTkujtV3uVwzDNPdK/Of2aoF9TorG1Riw+AUG7Kjp/MsxHNSQZrWtHAvcTU1hJnIdg205afeen1C8eIYnnM0hydscSphllLmA95vrb3U3LkyacD6AmDzBLr+pm2+YLPWIaz3UBRUePQ/Ychlh4p6IKL+c=
Content-ID: <B9AEFC5EBFD74B4FA4C74643A03C8403@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f402c1e-7a6e-4c66-2b1c-08d70ed8a6e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 19:13:17.6109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2485
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5IjnT0GhMGi2rR5a4iHltxUT/5oG/VG4IOwkykkwzM=;
 b=RNp79ntJqU0HoYKEzsxAru3rxq2dR96nXWcnKivvV+8u0QkfH/EOm8r0Ha3seIKLVrl31m/PcjPlrSQhJ04lHhhHN+2sk/8Ejq42KfSvjt8TtZ2Fk6U/dCB86W23IZofgalAxxR8FWJcyZR3nuSTMGswDvkMaQdkoDxQc+wRW/M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMTkgdW0gMTk6NDAgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IEZyb206IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+DQo+IEFzIG1lbnRpb25lZCBi
eSBDaHJpc3RpYW4sIGZvciBkcml2ZXJzIHdoaWNoIHN1cHBvcnQgb25seSBwcmltYXJ5IG5vZGVz
DQo+IHRoaXMgY2hhbmdlcyB0aGUgcmV0dXJuZWQgZXJyb3IgZnJvbSAtRUFDQ0VTIGludG8gLUVP
UE5PVFNVUFAvLUVOT1NZUy4NCj4NCj4gRm9yIG90aGVycywgdGhpcyBjaGVjayBpbiBwYXJ0aWN1
bGFyIHdpbGwgYmUgYSBub29wLiBTbyBsZXQncyByZW1vdmUgaXQNCj4gYXMgc3VnZ2VzdGVkIGJ5
IENocmlzdGlhbi4NCj4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+DQo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52
ZWxpa292QGNvbGxhYm9yYS5jb20+DQoNCkxvb2tzIGxpa2UgSSBjYW4ndCBjb252aW5jZSB5b3Ug
dGhhdCBvcGVuaW5nIHVwIHRoZSBwcmltYXJ5IG5vZGUgbGlrZSANCnRoaXMgaXMgYSBiYWQgaWRl
YS4NCg0KV2VsbCBhdCBsZWFzdCB3ZSBkb24ndCBuZWVkIHRvIGFkZCBhbnkgbmV3IGZsYWdzLCBz
byBmZWVsIGZyZWUgdG8gYWRkIG15IA0KQWNrZWQtYnkuDQoNCkNocmlzdGlhbi4NCg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5j
DQo+IGluZGV4IDA5ZjdmOGUzM2ZhMy4uYTM5NzE3N2FmMzY5IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0
bC5jDQo+IEBAIC02NDcsOCArNjQ3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxf
ZGVzYyBkcm1faW9jdGxzW10gPSB7DQo+ICAgDQo+ICAgCURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RM
X01PREVfR0VUUkVTT1VSQ0VTLCBkcm1fbW9kZV9nZXRyZXNvdXJjZXMsIDApLA0KPiAgIA0KPiAt
CURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RMX1BSSU1FX0hBTkRMRV9UT19GRCwgZHJtX3ByaW1lX2hh
bmRsZV90b19mZF9pb2N0bCwgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksDQo+IC0JRFJNX0lP
Q1RMX0RFRihEUk1fSU9DVExfUFJJTUVfRkRfVE9fSEFORExFLCBkcm1fcHJpbWVfZmRfdG9faGFu
ZGxlX2lvY3RsLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwNCj4gKwlEUk1fSU9DVExfREVG
KERSTV9JT0NUTF9QUklNRV9IQU5ETEVfVE9fRkQsIGRybV9wcmltZV9oYW5kbGVfdG9fZmRfaW9j
dGwsIERSTV9SRU5ERVJfQUxMT1cpLA0KPiArCURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RMX1BSSU1F
X0ZEX1RPX0hBTkRMRSwgZHJtX3ByaW1lX2ZkX3RvX2hhbmRsZV9pb2N0bCwgRFJNX1JFTkRFUl9B
TExPVyksDQo+ICAgDQo+ICAgCURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RMX01PREVfR0VUUExBTkVS
RVNPVVJDRVMsIGRybV9tb2RlX2dldHBsYW5lX3JlcywgMCksDQo+ICAgCURSTV9JT0NUTF9ERUYo
RFJNX0lPQ1RMX01PREVfR0VUQ1JUQywgZHJtX21vZGVfZ2V0Y3J0YywgMCksDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
