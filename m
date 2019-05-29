Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD6B2DEA6
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 15:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EEC6E329;
	Wed, 29 May 2019 13:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63086E321;
 Wed, 29 May 2019 13:40:20 +0000 (UTC)
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (10.174.109.137) by
 DM5PR1201MB0105.namprd12.prod.outlook.com (10.174.106.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Wed, 29 May 2019 13:40:19 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::9de6:fc43:53c8:29b3]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::9de6:fc43:53c8:29b3%8]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 13:40:19 +0000
From: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Topic: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Index: AQHVFhnj0Z+9LF+MjEauvYIQGca1JaaCG+iA
Date: Wed, 29 May 2019 13:40:18 +0000
Message-ID: <9aa2a005-ac99-ab26-b857-1f051e018bd0@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
 <20190529122702.13035-10-christian.koenig@amd.com>
In-Reply-To: <20190529122702.13035-10-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::33) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.190.135.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1aaa048a-b37a-4f81-1340-08d6e43b3054
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0105; 
x-ms-traffictypediagnostic: DM5PR1201MB0105:
x-microsoft-antispam-prvs: <DM5PR1201MB0105A52DB569A0DC07D1B5058D1F0@DM5PR1201MB0105.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(366004)(376002)(199004)(189003)(6486002)(66446008)(3846002)(53936002)(72206003)(14454004)(446003)(76176011)(64756008)(66556008)(66476007)(73956011)(52116002)(305945005)(229853002)(2906002)(66574012)(7736002)(66946007)(99286004)(86362001)(2201001)(25786009)(478600001)(6116002)(31696002)(81156014)(8936002)(36756003)(11346002)(6246003)(486006)(476003)(2616005)(102836004)(71190400001)(71200400001)(186003)(55236004)(2501003)(316002)(66066001)(110136005)(53546011)(256004)(6512007)(26005)(5660300002)(31686004)(14444005)(6506007)(386003)(68736007)(6436002)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0105;
 H:DM5PR1201MB0187.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HX0PyI5Y+mDrPqWmOF6RZjX8voOKloUxWjGL5jDczPBbIytUKshPW9U/fDj8H/JfoLhfyzHNkjQraAcKlFaWsT6ZcqmPXIh3Bl/ltDarTOUFwpCjYmKKrj/B3LYKCdfgflavgGnXb6as9PvV1q3p/zmqjBtJHvceayLuQolnvUBeLWr230cGhu+Et/FI2t3g3/8Q/ECsqeVVa6Yukle8tP++NSQFZH3Rs88HPEuSuKW+NN7MePT9ga7qci0j+OgWG7hRWwCqBW3jZ/8EQ4yPk9aTPMDevIIIUsBeUvCZ+nBtfi8Zjx2u6duuXIpQsV0/DoOfQhkzDe+Fef/aeD/QIncOe90K0R1cSdsOYhTMqTbIgKmR968SuzoplouzZBaTrJEc7FhWs5ho4QHExv6sluIVeuuWFyG5a7QBFulMZN4=
Content-ID: <005835E63CA4EA4FAC0AA7BDDA190BE3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aaa048a-b37a-4f81-1340-08d6e43b3054
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 13:40:18.9228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppelloux@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTu2Yx8/MGiEPXKQRUaR/rGSqvj1+CFVvmiSxFHu+Xg=;
 b=iWLqqK9SKtJOL4ukzXe6T/oavzY0xSITMOI/KeZxVpPkeR8913HVaQpZazUlFLXDrh+UBHRlKO39rjLvnLCopX7zWGogRxTPf6ognLUi80++aZc/zioiAmyYviX3sdQEBAR8ZWW/1rAC0XNhGC43YU+tbv2JrM8uJsXTlGKx5Bw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
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

SGkgQ2hyaXN0aWFuLA0KDQpUaGUgc2VyaWVzIGlzOg0KDQpUZXN0ZWQtYnk6IFBpZXJyZS1Fcmlj
IFBlbGxvdXgtUHJheWVyIDxwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29tPg0KDQoN
ClBpZXJyZS1FcmljDQoNCg0KDQpPbiAyOS8wNS8yMDE5IDE0OjI3LCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOg0KPiBUaGlzIGF2b2lkcyBPT00gc2l0dWF0aW9ucyB3aGVuIHdlIGhhdmUgbG90cyBv
ZiB0aHJlYWRzDQo+IHN1Ym1pdHRpbmcgYXQgdGhlIHNhbWUgdGltZS4NCj4gDQo+IHYzOiBhcHBs
eSB0aGlzIHRvIHRoZSB3aG9sZSBkcml2ZXIsIG5vdCBqdXN0IENTDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgICAgIHwgMiArLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jICAgIHwgMiArLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgIHwgNCArKy0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAyICstDQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+IGluZGV4IDIwZjI5NTVkMmE1NS4uM2UyZGEy
NGNkMTdhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPiBA
QCAtNjQ4LDcgKzY0OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNlcl9ib3Moc3RydWN0
IGFtZGdwdV9jc19wYXJzZXIgKnAsDQo+ICAJfQ0KPiAgDQo+ICAJciA9IHR0bV9ldV9yZXNlcnZl
X2J1ZmZlcnMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgdHJ1ZSwNCj4gLQkJCQkgICAmZHVw
bGljYXRlcywgdHJ1ZSk7DQo+ICsJCQkJICAgJmR1cGxpY2F0ZXMsIGZhbHNlKTsNCj4gIAlpZiAo
dW5saWtlbHkociAhPSAwKSkgew0KPiAgCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpDQo+ICAJCQlE
Uk1fRVJST1IoInR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMgZmFpbGVkLlxuIik7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMNCj4gaW5kZXggMDZmODNjYWMwZDNhLi5mNjYw
NjI4ZTZhZjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jc2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMN
Cj4gQEAgLTc5LDcgKzc5LDcgQEAgaW50IGFtZGdwdV9tYXBfc3RhdGljX2NzYShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sDQo+ICAJbGlzdF9hZGQoJmNz
YV90di5oZWFkLCAmbGlzdCk7DQo+ICAJYW1kZ3B1X3ZtX2dldF9wZF9ibyh2bSwgJmxpc3QsICZw
ZCk7DQo+ICANCj4gLQlyID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwg
dHJ1ZSwgTlVMTCwgdHJ1ZSk7DQo+ICsJciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tl
dCwgJmxpc3QsIHRydWUsIE5VTEwsIGZhbHNlKTsNCj4gIAlpZiAocikgew0KPiAgCQlEUk1fRVJS
T1IoImZhaWxlZCB0byByZXNlcnZlIENTQSxQRCBCT3M6IGVycj0lZFxuIiwgcik7DQo+ICAJCXJl
dHVybiByOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jDQo+IGluZGV4
IGQ1MTNhNWFkMDNkZC4uZWQyNWE0ZTE0NDA0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dlbS5jDQo+IEBAIC0xNzEsNyArMTcxLDcgQEAgdm9pZCBhbWRncHVfZ2Vt
X29iamVjdF9jbG9zZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwNCj4gIA0KPiAgCWFtZGdw
dV92bV9nZXRfcGRfYm8odm0sICZsaXN0LCAmdm1fcGQpOw0KPiAgDQo+IC0JciA9IHR0bV9ldV9y
ZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCAmZHVwbGljYXRlcywgdHJ1ZSk7
DQo+ICsJciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCAm
ZHVwbGljYXRlcywgZmFsc2UpOw0KPiAgCWlmIChyKSB7DQo+ICAJCWRldl9lcnIoYWRldi0+ZGV2
LCAibGVha2luZyBibyB2YSBiZWNhdXNlICINCj4gIAkJCSJ3ZSBmYWlsIHRvIHJlc2VydmUgYm8g
KCVkKVxuIiwgcik7DQo+IEBAIC02MDgsNyArNjA4LDcgQEAgaW50IGFtZGdwdV9nZW1fdmFfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gIA0KPiAgCWFtZGdwdV92
bV9nZXRfcGRfYm8oJmZwcml2LT52bSwgJmxpc3QsICZ2bV9wZCk7DQo+ICANCj4gLQlyID0gdHRt
X2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgJmR1cGxpY2F0ZXMsIHRy
dWUpOw0KPiArCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCB0cnVl
LCAmZHVwbGljYXRlcywgZmFsc2UpOw0KPiAgCWlmIChyKQ0KPiAgCQlnb3RvIGVycm9yX3VucmVm
Ow0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4g
aW5kZXggYzQzMGU4MjU5MDM4Li5kNjA1OTNjYzQzNmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4gQEAgLTE1NSw3ICsxNTUsNyBAQCBzdGF0
aWMgaW5saW5lIGludCBhbWRncHVfYm9fcmVzZXJ2ZShzdHJ1Y3QgYW1kZ3B1X2JvICpibywgYm9v
bCBub19pbnRyKQ0KPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9h
ZGV2KGJvLT50Ym8uYmRldik7DQo+ICAJaW50IHI7DQo+ICANCj4gLQlyID0gdHRtX2JvX3Jlc2Vy
dmUoJmJvLT50Ym8sICFub19pbnRyLCBmYWxzZSwgTlVMTCk7DQo+ICsJciA9IF9fdHRtX2JvX3Jl
c2VydmUoJmJvLT50Ym8sICFub19pbnRyLCBmYWxzZSwgTlVMTCk7DQo+ICAJaWYgKHVubGlrZWx5
KHIgIT0gMCkpIHsNCj4gIAkJaWYgKHIgIT0gLUVSRVNUQVJUU1lTKQ0KPiAgCQkJZGV2X2Vycihh
ZGV2LT5kZXYsICIlcCByZXNlcnZlIGZhaWxlZFxuIiwgYm8pOw0KPiANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
