Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AED2A06F
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 23:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413A06E0C2;
	Fri, 24 May 2019 21:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680087.outbound.protection.outlook.com [40.107.68.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860246E0B3;
 Fri, 24 May 2019 21:34:20 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3658.namprd12.prod.outlook.com (10.255.76.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 24 May 2019 21:34:18 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Fri, 24 May 2019
 21:34:18 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Olsak, Marek"
 <Marek.Olsak@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Liang, 
 Prike" <Prike.Liang@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Topic: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Index: AQHVEJ5PVJOlljYSqkWgdeehlfe9hKZ3i/CAgADgjgCAAmMlAA==
Date: Fri, 24 May 2019 21:34:18 +0000
Message-ID: <776d29df-428f-ad98-8e38-4b191b602abb@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
 <20190522125947.4592-10-christian.koenig@amd.com>
 <48ac98a8-de22-3549-5d63-078a0effab72@amd.com>
 <eea6245e-616d-eb16-8521-2f21ce5d6d25@gmail.com>
In-Reply-To: <eea6245e-616d-eb16-8521-2f21ce5d6d25@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::17) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c552301-5446-4f14-cbce-08d6e08f93a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3658; 
x-ms-traffictypediagnostic: DM6PR12MB3658:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3658E6D3E385B60FA54B887292020@DM6PR12MB3658.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39860400002)(136003)(346002)(396003)(189003)(199004)(36756003)(316002)(31696002)(229853002)(6436002)(86362001)(68736007)(66066001)(65806001)(65956001)(6486002)(305945005)(6512007)(6306002)(486006)(81166006)(81156014)(64126003)(31686004)(25786009)(8936002)(71200400001)(71190400001)(14444005)(256004)(476003)(26005)(446003)(11346002)(186003)(102836004)(2616005)(386003)(53936002)(450100002)(64756008)(66446008)(66574012)(66946007)(66556008)(73956011)(6246003)(66476007)(2906002)(3846002)(6116002)(65826007)(110136005)(58126008)(2201001)(2501003)(99286004)(14454004)(72206003)(966005)(5660300002)(478600001)(6506007)(53546011)(7736002)(52116002)(76176011)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3658;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t1kMXIVStyddn/SH+If5EfyCDjbrI0m8qnDl9aEnksM9OmYbw88TpdhObSzPfJTQ1QRyD22BBRSQukkSXFkYcFP+wWN/RXCC8zDsmD3uFmnS8D/0gZn3RFXew6UkB6ISPs90+i2i9Pnaxg3b7vAK1Qku4kPtajgvt04/B0m0v8KJD0PjsO9K59HQjXWXVo1Nm+gW8emuZKdNSjn6rLhbigt1tKvTJZjHNclPHMEJ4j8moK0sVb+g+2OmQK1/f/AIhcKbb2Ho00Clxz85YHYH3iN+dtzVm84qonSI1IWXkSYR6hrqVq1pggEXwA5DysRWtd51ZgQM0MLbY4SUfZ0wm40OFuvo6mQspjb01EzxASfRlLZTbXnruQQOuXISmGge/rYHR/4N9TGSXHvRQ2PeX+CWrzKc7Ndv5nM7VozUMtw=
Content-ID: <4E76F965DB614F4484BFD71AF672CC6A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c552301-5446-4f14-cbce-08d6e08f93a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 21:34:18.4690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3658
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmYYcdiNPcVUobSJUHzGpPAi7N6TORqwYz3pl7c12kk=;
 b=LqxxNVK1dbiP2AmWY+16ko2RsPLw3wAuJwOaZ7BiiJpou2890U+mHhywdctpMpylioUHMZPwwLLOU35olQ85MfXfKX9ztXZ6rthJL1NOON4I1NP/2ChcGdcizqTISBEAA7ygWkUxHvcZRXRatbnWAdYCk6SKnVsQGL2IBMnMx18=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMyA1OjA2IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IFtDQVVU
SU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4NCj4gTGVhdmluZyBCT3Mgb24gdGhlIExSVSBpcyBoYXJt
bGVzcy4gV2UgYWx3YXlzIGRpZCB0aGlzIGZvciBWTSBwYWdlIHRhYmxlDQo+IGFuZCBwZXIgVk0g
Qk9zLg0KPg0KPiBUaGUga2V5IHBvaW50IGlzIHRoYXQgQk9zIHdoaWNoIGNvdWxkbid0IGJlIHJl
c2VydmVkIGNhbid0IGJlIGV2aWN0ZWQuDQo+IFNvIHdoYXQgaGFwcGVuZWQgaXMgdGhhdCBhbiBh
cHBsaWNhdGlvbiB1c2VkIGJhc2ljYWxseSBhbGwgb2YgVlJBTQ0KPiBkdXJpbmcgQ1MgYW5kIGJl
Y2F1c2Ugb2YgdGhpcyBYIHNlcnZlciBjb3VsZG4ndCBwaW4gYSBCTyBmb3Igc2Nhbm91dC4NCj4N
Cj4gTm93IHdlIGtlZXAgdGhlIEJPcyBvbiB0aGUgTFJVIGFuZCBtb2RpZnkgVFRNIHRvIGJsb2Nr
IGZvciB0aGUgQ1MgdG8NCj4gY29tcGxldGUsIHdoaWNoIGluIHR1cm4gYWxsb3dzIHRoZSBYIHNl
cnZlciB0byBwaW4gaXRzIEJPIGZvciBzY2Fub3V0Lg0KDQoNCk9LLCBsZXQgbWUgcmVwaHJhc2Ug
dGhhdCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3RseS4gSSB0aGluayANCnRo
ZSBwb2ludCBpcyB0aGF0IGV2aWN0aW9uIGNhbmRpZGF0ZXMgY29tZSBmcm9tIGFuIExSVSBsaXN0
LCBzbyBsZWF2aW5nIA0KdGhpbmdzIG9uIHRoZSBMUlUgbWFrZXMgbW9yZSBCT3MgYXZhaWxhYmxl
IGZvciBldmljdGlvbiBhbmQgYXZvaWRzIE9PTSANCnNpdHVhdGlvbnMuIFRvIHRha2UgYWR2YW50
YWdlIG9mIHRoYXQsIHBhdGNoIDYgYWRkcyB0aGUgYWJpbGl0eSB0byB3YWl0IA0KZm9yIHJlc2Vy
dmVkIEJPcyB3aGVuIHRoZXJlIGlzIG5vdGhpbmcgZWFzaWVyIHRvIGV2aWN0Lg0KDQpST0NtIGFw
cGxpY2F0aW9ucyBsaWtlIHRvIHVzZSBsb3RzIG9mIG1lbW9yeS4gU28gaXQgcHJvYmFibHkgbWFr
ZXMgc2Vuc2UgDQpmb3IgdXMgdG8gc3RvcCByZW1vdmluZyBvdXIgQk9zIGZyb20gdGhlIExSVSBh
cyB3ZWxsIHdoaWxlIHdlIA0KbWFzcy12YWxpZGF0ZSBvdXIgQk9zIGluIGFtZGdwdV9hbWRrZmRf
Z3B1dm1fcmVzdG9yZV9wcm9jZXNzX2Jvcy4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4N
Cj4gQ2hyaXN0aWFuLg0KPg0KPiBBbSAyMi4wNS4xOSB1bSAyMTo0MyBzY2hyaWViIEt1ZWhsaW5n
LCBGZWxpeDoNCj4+IENhbiB5b3UgZXhwbGFpbiBob3cgdGhpcyBhdm9pZHMgT09NIHNpdHVhdGlv
bnM/IFdoZW4gaXMgaXQgc2FmZSB0byBsZWF2ZQ0KPj4gYSByZXNlcnZlZCBCTyBvbiB0aGUgTFJV
IGxpc3Q/IENvdWxkIHdlIGRvIHRoZSBzYW1lIHRoaW5nIGluDQo+PiBhbWRncHVfYW1ka2ZkX2dw
dXZtLmM/IEFuZCBpZiB3ZSBkaWQsIHdoYXQgd291bGQgYmUgdGhlIGV4cGVjdGVkIHNpZGUNCj4+
IGVmZmVjdHMgb3IgY29uc2VxdWVuY2VzPw0KPj4NCj4+IFRoYW5rcywNCj4+IMKgwqDCoCBGZWxp
eA0KPj4NCj4+IE9uIDIwMTktMDUtMjIgODo1OSBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4+Pg0KPj4+IFRoaXMgYXZvaWRzIE9P
TSBzaXR1YXRpb25zIHdoZW4gd2UgaGF2ZSBsb3RzIG9mIHRocmVhZHMNCj4+PiBzdWJtaXR0aW5n
IGF0IHRoZSBzYW1lIHRpbWUuDQo+Pj4NCj4+PiB2MzogYXBwbHkgdGhpcyB0byB0aGUgd2hvbGUg
ZHJpdmVyLCBub3QganVzdCBDUw0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4+IC0tLQ0KPj4+IMKgwqAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmPCoMKgwqDCoCB8IDIgKy0NCj4+PiDCoMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuY8KgwqDCoCB8IDIgKy0NCj4+
PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uY8KgwqDCoCB8IDQg
KystLQ0KPj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5o
IHwgMiArLQ0KPj4+IMKgwqAgNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2NzLmMgDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYw0KPj4+IGluZGV4IDIwZjI5NTVkMmE1NS4uM2UyZGEyNGNkMTdhIDEwMDY0NA0KPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4+PiBAQCAtNjQ4LDcgKzY0OCw3
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNlcl9ib3Moc3RydWN0IA0KPj4+IGFtZGdwdV9j
c19wYXJzZXIgKnAsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+Pg0KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmcC0+dGlja2V0LCAmcC0+dmFs
aWRhdGVkLCB0cnVlLA0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmR1cGxpY2F0ZXMsIHRydWUpOw0KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJmR1cGxpY2F0ZXMsIGZhbHNlKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHVubGlrZWx5KHIgIT0gMCkpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChyICE9IC1FUkVTVEFSVFNZUykNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoInR0bV9ldV9yZXNlcnZlX2J1ZmZl
cnMgDQo+Pj4gZmFpbGVkLlxuIik7DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jc2EuYyANCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jc2EuYw0KPj4+IGluZGV4IDA2ZjgzY2FjMGQzYS4uZjY2MDYyOGU2YWY5IDEwMDY0
NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYw0KPj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYw0KPj4+IEBAIC03
OSw3ICs3OSw3IEBAIGludCBhbWRncHVfbWFwX3N0YXRpY19jc2Eoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgDQo+Pj4gKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLA0KPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBsaXN0X2FkZCgmY3NhX3R2LmhlYWQsICZsaXN0KTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgYW1kZ3B1X3ZtX2dldF9wZF9ibyh2bSwgJmxpc3QsICZwZCk7DQo+Pj4NCj4+PiAtwqDCoMKg
wqDCoMKgIHIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCB0cnVlLCBO
VUxMLCB0cnVlKTsNCj4+PiArwqDCoMKgwqDCoMKgIHIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJz
KCZ0aWNrZXQsICZsaXN0LCB0cnVlLCBOVUxMLCBmYWxzZSk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChyKSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1f
RVJST1IoImZhaWxlZCB0byByZXNlcnZlIENTQSxQRCBCT3M6IA0KPj4+IGVycj0lZFxuIiwgcik7
DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsNCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIA0KPj4+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jDQo+Pj4gaW5kZXggZDUx
M2E1YWQwM2RkLi5lZDI1YTRlMTQ0MDQgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dlbS5jDQo+Pj4gQEAgLTE3MSw3ICsxNzEsNyBAQCB2b2lkIGFtZGdwdV9n
ZW1fb2JqZWN0X2Nsb3NlKHN0cnVjdCANCj4+PiBkcm1fZ2VtX29iamVjdCAqb2JqLA0KPj4+DQo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV92bV9nZXRfcGRfYm8odm0sICZsaXN0LCAmdm1f
cGQpOw0KPj4+DQo+Pj4gLcKgwqDCoMKgwqDCoCByID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygm
dGlja2V0LCAmbGlzdCwgZmFsc2UsIA0KPj4+ICZkdXBsaWNhdGVzLCB0cnVlKTsNCj4+PiArwqDC
oMKgwqDCoMKgIHIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxz
ZSwgDQo+Pj4gJmR1cGxpY2F0ZXMsIGZhbHNlKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHIpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoYWRl
di0+ZGV2LCAibGVha2luZyBibyB2YSBiZWNhdXNlICINCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAid2UgZmFpbCB0byByZXNlcnZlIGJvICgl
ZClcbiIsIHIpOw0KPj4+IEBAIC02MDgsNyArNjA4LDcgQEAgaW50IGFtZGdwdV9nZW1fdmFfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgDQo+Pj4gdm9pZCAqZGF0YSwNCj4+Pg0KPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfdm1fZ2V0X3BkX2JvKCZmcHJpdi0+dm0sICZsaXN0LCAm
dm1fcGQpOw0KPj4+DQo+Pj4gLcKgwqDCoMKgwqDCoCByID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVy
cygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgDQo+Pj4gJmR1cGxpY2F0ZXMsIHRydWUpOw0KPj4+ICvC
oMKgwqDCoMKgwqAgciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRy
dWUsIA0KPj4+ICZkdXBsaWNhdGVzLCBmYWxzZSk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChyKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl91
bnJlZjsNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfb2JqZWN0LmggDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmgNCj4+PiBpbmRleCBjNDMwZTgyNTkwMzguLmQ2MDU5M2NjNDM2ZSAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4+PiBAQCAt
MTU1LDcgKzE1NSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9ib19yZXNlcnZlKHN0cnVj
dCANCj4+PiBhbWRncHVfYm8gKmJvLCBib29sIG5vX2ludHIpDQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8u
YmRldik7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGludCByOw0KPj4+DQo+Pj4gLcKgwqDCoMKg
wqDCoCByID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sICFub19pbnRyLCBmYWxzZSwgTlVMTCk7
DQo+Pj4gK8KgwqDCoMKgwqDCoCByID0gX190dG1fYm9fcmVzZXJ2ZSgmYm8tPnRibywgIW5vX2lu
dHIsIGZhbHNlLCBOVUxMKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KHIg
IT0gMCkpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyICE9
IC1FUkVTVEFSVFNZUykNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKGFkZXYtPmRldiwgIiVwIHJlc2VydmUgZmFpbGVkXG4iLCAN
Cj4+PiBibyk7DQo+Pj4gLS0gDQo+Pj4gMi4xNy4xDQo+Pj4NCj4+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+IGFtZC1nZnggbWFpbGluZyBsaXN0
DQo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCj4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
