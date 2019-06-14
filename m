Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA15466E7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 20:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED9989B05;
	Fri, 14 Jun 2019 18:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680059.outbound.protection.outlook.com [40.107.68.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C9E89B00;
 Fri, 14 Jun 2019 18:02:43 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1180.namprd12.prod.outlook.com (10.168.237.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 18:02:41 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.013; Fri, 14 Jun 2019
 18:02:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: extend AMDGPU_CTX_PRIORITY_NORMAL comment
Thread-Topic: [PATCH] drm/amdgpu: extend AMDGPU_CTX_PRIORITY_NORMAL comment
Thread-Index: AQHVIteaRtiRppBnTUixAIRYZZPX7KabcQGA
Date: Fri, 14 Jun 2019 18:02:41 +0000
Message-ID: <b3b4b6d8-1b64-7860-88e5-ec91b9d2f711@amd.com>
References: <20190614173335.30907-1-emil.l.velikov@gmail.com>
In-Reply-To: <20190614173335.30907-1-emil.l.velikov@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::31) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12ce57d4-d492-4d70-0d22-08d6f0f27e68
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1180; 
x-ms-traffictypediagnostic: DM5PR12MB1180:
x-microsoft-antispam-prvs: <DM5PR12MB1180D09C2E2BDE98D324B89483EE0@DM5PR12MB1180.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(376002)(366004)(346002)(189003)(199004)(6506007)(386003)(102836004)(2501003)(31686004)(46003)(186003)(99286004)(110136005)(58126008)(54906003)(76176011)(52116002)(68736007)(36756003)(53936002)(65826007)(25786009)(4326008)(6246003)(478600001)(72206003)(65956001)(65806001)(6116002)(8936002)(8676002)(64126003)(2906002)(81166006)(305945005)(316002)(7736002)(6486002)(81156014)(6436002)(229853002)(14454004)(6512007)(11346002)(66574012)(66476007)(66556008)(64756008)(2616005)(5660300002)(256004)(486006)(14444005)(446003)(73956011)(71200400001)(71190400001)(66946007)(476003)(66446008)(86362001)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1180;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MwBrLWWhwXtdxCaGa+BnUzlTNI82rilU1o2qpMfmpFwmgNHSL3AhSYb+gdssUnTfr4CFQ0O26BwPNObZMNx6RSLSU+vZLiaq4hf6Kr+lJbbxnwTM7ZBZ1d5wkT0FgwLkxUMO5+pZsTTuZ9/NsezKRv3xu+1yYtahGA2//FwfCixeTsEpren7geVR5/x94UMmSsLYx7mr/fdLEwL4XvSKcgcgUA+JyJLdCxiQyK6FdgEcxcEcktqIB8rPzwr/56xXxAd8JkhGMysg/VqH7ZOWoyuZ4BDmzbz+zIFNx+Ds3CfBXY8HWsINtlvcUye4BHwsHiwXgtfzez1y2kAfELpipGyQo5wACw0VKXyt2PnNi0+NRUzv+f8RYcNiZvQrB4bwl4UduPzMDkW/gOvaeR/1/g95YB2dnldg/6A4LywaBrs=
Content-ID: <541675C2058DC04B9FD0819D1A7EC181@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ce57d4-d492-4d70-0d22-08d6f0f27e68
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 18:02:41.6386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FglvIUP8ccuZmMdh3QGbG7eo4k9woe/P/joBNB1PZqU=;
 b=XxiU/BzJ/1+MRirFrjDYT1hnECB8QPTzsqQGX1PCr553q9b6yca4sSgiZwg7lQAY6O3yJlWtlcr+ZpMcpl+0yC/boAknfWjBznx6XYgy6bZkH9R/RuP4ccFSqsfPu5hpGDM+bqQnkN2UjcDn0XEzyMHhhcIqc5zRUa6oyuo+CJE=
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

QW0gMTQuMDYuMTkgdW0gMTk6MzMgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IEZyb206IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+DQo+IEN1cnJlbnRseSB0aGUg
QU1ER1BVX0NUWF9QUklPUklUWV8qIGRlZmluZXMgYXJlIHVzZWQgaW4gYm90aA0KPiBkcm1fYW1k
Z3B1X2N0eF9pbjo6cHJpb3JpdHkgYW5kIGRybV9hbWRncHVfc2NoZWRfaW46OnByaW9yaXR5Lg0K
Pg0KPiBFeHRlbmQgdGhlIGNvbW1lbnQgdG8gbWVudGlvbiB0aGUgQ0FQX1NZU19OSUNFIG9yIERS
TV9NQVNURVIgcmVxdWlyZW1lbnQNCj4gaXMgb25seSBhcHBsaWNhYmxlIHdpdGggdGhlIGZvcm1l
ci4NCj4NCj4gQ2M6IEJhcyBOaWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4N
Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+IE1p
bGRseSBjdXJpb3VzOiB3aHkgZGlkbid0IG9uZSBleHRlbmQgY3R4X2FtZGdwdV9jdHggaW5zdGVh
ZCBvZiBhZGRpbmcNCj4gZHJtX2FtZGdwdV9zY2hlZD8gTmV3IGZsYWcgKyBfdTMyIGZkIGF0IHRo
ZSBlbmQgKGZvciB0aGUgZm9ybWVyKSB3b3VsZA0KPiBoYXZlIGJlZW4gZW5vdWdoIChhbmQgdHdl
YWtpbmcgdGhlIGlvY3RsIHBlcm1pc3Npb24gdGhpbmd5KS4NCg0KVGhlIGRybV9hbWRncHVfc2No
ZWQgaXMgb25seSBhbGxvd2VkIGZvciBEUk1fTUFTVEVSLg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4g
U3BlYWtpbmcgb2YgZmxhZ3MsIGRybV9hbWRncHVfc2NoZWRfaW4gbG9zdCBpdHMgc28gZXh0ZW5k
aW5nIGl0IHdpbGwNCj4gYmUgImZ1biINCj4gLS0tDQo+ICAgaW5jbHVkZS91YXBpL2RybS9hbWRn
cHVfZHJtLmggfCA3ICsrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdw
dV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQo+IGluZGV4IDQ3ODg3MzBk
YmU3OC4uZGZiMTBmYmEyZmU4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdw
dV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaA0KPiBAQCAtMjE5
LDcgKzIxOSwxMCBAQCB1bmlvbiBkcm1fYW1kZ3B1X2JvX2xpc3Qgew0KPiAgICNkZWZpbmUgQU1E
R1BVX0NUWF9QUklPUklUWV9WRVJZX0xPVyAgICAtMTAyMw0KPiAgICNkZWZpbmUgQU1ER1BVX0NU
WF9QUklPUklUWV9MT1cgICAgICAgICAtNTEyDQo+ICAgI2RlZmluZSBBTURHUFVfQ1RYX1BSSU9S
SVRZX05PUk1BTCAgICAgIDANCj4gLS8qIFNlbGVjdGluZyBhIHByaW9yaXR5IGFib3ZlIE5PUk1B
TCByZXF1aXJlcyBDQVBfU1lTX05JQ0Ugb3IgRFJNX01BU1RFUiAqLw0KPiArLyoNCj4gKyAqIFdo
ZW4gdXNlZCBpbiBzdHJ1Y3QgZHJtX2FtZGdwdV9jdHhfaW4sIGEgcHJpb3JpdHkgYWJvdmUgTk9S
TUFMIHJlcXVpcmVzDQo+ICsgKiBDQVBfU1lTX05JQ0Ugb3IgRFJNX01BU1RFUg0KPiArKi8NCj4g
ICAjZGVmaW5lIEFNREdQVV9DVFhfUFJJT1JJVFlfSElHSCAgICAgICAgNTEyDQo+ICAgI2RlZmlu
ZSBBTURHUFVfQ1RYX1BSSU9SSVRZX1ZFUllfSElHSCAgIDEwMjMNCj4gICANCj4gQEAgLTIyOSw2
ICsyMzIsNyBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9jdHhfaW4gew0KPiAgIAkvKiogRm9yIGZ1dHVy
ZSB1c2UsIG5vIGZsYWdzIGRlZmluZWQgc28gZmFyICovDQo+ICAgCV9fdTMyCWZsYWdzOw0KPiAg
IAlfX3UzMgljdHhfaWQ7DQo+ICsJLyoqIEFNREdQVV9DVFhfUFJJT1JJVFlfKiAqLw0KPiAgIAlf
X3MzMglwcmlvcml0eTsNCj4gICB9Ow0KPiAgIA0KPiBAQCAtMjgxLDYgKzI4NSw3IEBAIHN0cnVj
dCBkcm1fYW1kZ3B1X3NjaGVkX2luIHsNCj4gICAJLyogQU1ER1BVX1NDSEVEX09QXyogKi8NCj4g
ICAJX191MzIJb3A7DQo+ICAgCV9fdTMyCWZkOw0KPiArCS8qKiBBTURHUFVfQ1RYX1BSSU9SSVRZ
XyogKi8NCj4gICAJX19zMzIJcHJpb3JpdHk7DQo+ICAgCV9fdTMyICAgY3R4X2lkOw0KPiAgIH07
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
