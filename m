Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E22926D97
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 21:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957C89BEC;
	Wed, 22 May 2019 19:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720044.outbound.protection.outlook.com [40.107.72.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183E089B51;
 Wed, 22 May 2019 19:43:15 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2875.namprd12.prod.outlook.com (20.179.71.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Wed, 22 May 2019 19:43:13 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Wed, 22 May 2019
 19:43:13 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Topic: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Index: AQHVEJ5PVJOlljYSqkWgdeehlfe9hKZ3i/CA
Date: Wed, 22 May 2019 19:43:13 +0000
Message-ID: <48ac98a8-de22-3549-5d63-078a0effab72@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
 <20190522125947.4592-10-christian.koenig@amd.com>
In-Reply-To: <20190522125947.4592-10-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f614e31-b4d4-4f7e-726f-08d6deedba03
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2875; 
x-ms-traffictypediagnostic: DM6PR12MB2875:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB28758FCC5401D5B6E736AC2592000@DM6PR12MB2875.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(58126008)(36756003)(6486002)(3846002)(186003)(256004)(14444005)(26005)(2501003)(305945005)(6512007)(86362001)(6436002)(25786009)(64126003)(478600001)(72206003)(31686004)(966005)(6306002)(7736002)(2201001)(5660300002)(446003)(31696002)(11346002)(229853002)(76176011)(81156014)(66574012)(71190400001)(102836004)(71200400001)(81166006)(66446008)(66066001)(2906002)(52116002)(386003)(65956001)(6246003)(65806001)(476003)(6506007)(316002)(53546011)(64756008)(14454004)(99286004)(8676002)(486006)(8936002)(66946007)(68736007)(2616005)(6116002)(73956011)(66556008)(66476007)(53936002)(65826007)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2875;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Df0DNMi/oen3aB6NukSGqQS4DIesuFAL5rPCuCXYzsioa4QbobjHhhLxMlWp9VjD9uLA4ND3oOZEa0sUkHZ+XRlWekJdYc3I0rZQHgLRWSvKFL+azElT+WMdgK5pJBidE3RK7qKi+nTArGW7amwa/sN3G97icRHTAS8V6tHk5j14VpL+pduA7o+ZJlhllLSmmi/iaq9THw/jelT4FXoNRBxMt8FUSLw0peKfn0NkrPEPt5h/1z+/lBDeuz4oTGJTjZwXPk0c6E7w+VAe8Mue70PJK03VI5brWsr4/U8VU1SNaI1Mvc+3q2PyvAUFC8MU7uI43pQtbagMhZKX+7jKLXcHLsMQW5GRmbUC5cEsrVkf+r9/VJtYgAsf+Rab9qoEsEW+h4BC+h12R17JgtzB9OlCCgSw/T8QHEAFuVTB7Gw=
Content-ID: <1F221FCE7A832441922D623F676B3143@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f614e31-b4d4-4f7e-726f-08d6deedba03
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 19:43:13.1088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2875
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsdmZnBt7Cc65Z8S7HrFlHj6CDndT2lVeI2R0PxyK7Q=;
 b=hi+Vae6NP4Qs0qxfZtTmWZbn+ArGk/jtnENzq8h4GLSfceDho0p7XHkfZB9ubnko3ffyyuiDUiiKEya3fXrt8KYh7+3jpPMxE0ZksYfnqvjUi3ll5746K1rxXL2zKn9TTqZpX17LJ6MsVQgDiZsW1kirULkKFGTmWarFTH81E2I=
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

Q2FuIHlvdSBleHBsYWluIGhvdyB0aGlzIGF2b2lkcyBPT00gc2l0dWF0aW9ucz8gV2hlbiBpcyBp
dCBzYWZlIHRvIGxlYXZlIA0KYSByZXNlcnZlZCBCTyBvbiB0aGUgTFJVIGxpc3Q/IENvdWxkIHdl
IGRvIHRoZSBzYW1lIHRoaW5nIGluIA0KYW1kZ3B1X2FtZGtmZF9ncHV2bS5jPyBBbmQgaWYgd2Ug
ZGlkLCB3aGF0IHdvdWxkIGJlIHRoZSBleHBlY3RlZCBzaWRlIA0KZWZmZWN0cyBvciBjb25zZXF1
ZW5jZXM/DQoNClRoYW5rcywNCiDCoCBGZWxpeA0KDQpPbiAyMDE5LTA1LTIyIDg6NTkgYS5tLiwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPg0K
PiBUaGlzIGF2b2lkcyBPT00gc2l0dWF0aW9ucyB3aGVuIHdlIGhhdmUgbG90cyBvZiB0aHJlYWRz
DQo+IHN1Ym1pdHRpbmcgYXQgdGhlIHNhbWUgdGltZS4NCj4NCj4gdjM6IGFwcGx5IHRoaXMgdG8g
dGhlIHdob2xlIGRyaXZlciwgbm90IGp1c3QgQ1MNCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgfCAyICstDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jICAgIHwgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICB8IDQgKystLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCB8IDIgKy0NCj4gICA0IGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4gaW5kZXggMjBmMjk1NWQyYTU1Li4zZTJkYTI0Y2QxN2Eg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+IEBAIC02NDgs
NyArNjQ4LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2JvcyhzdHJ1Y3QgYW1kZ3B1
X2NzX3BhcnNlciAqcCwNCj4gICAgICAgICAgfQ0KPg0KPiAgICAgICAgICByID0gdHRtX2V1X3Jl
c2VydmVfYnVmZmVycygmcC0+dGlja2V0LCAmcC0+dmFsaWRhdGVkLCB0cnVlLA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkdXBsaWNhdGVzLCB0cnVlKTsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZHVwbGljYXRlcywgZmFsc2UpOw0KPiAgICAg
ICAgICBpZiAodW5saWtlbHkociAhPSAwKSkgew0KPiAgICAgICAgICAgICAgICAgIGlmIChyICE9
IC1FUkVTVEFSVFNZUykNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigidHRt
X2V1X3Jlc2VydmVfYnVmZmVycyBmYWlsZWQuXG4iKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9jc2EuYw0KPiBpbmRleCAwNmY4M2NhYzBkM2EuLmY2NjA2MjhlNmFmOSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYw0KPiBAQCAtNzksNyAr
NzksNyBAQCBpbnQgYW1kZ3B1X21hcF9zdGF0aWNfY3NhKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwNCj4gICAgICAgICAgbGlzdF9hZGQoJmNzYV90di5o
ZWFkLCAmbGlzdCk7DQo+ICAgICAgICAgIGFtZGdwdV92bV9nZXRfcGRfYm8odm0sICZsaXN0LCAm
cGQpOw0KPg0KPiAtICAgICAgIHIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZs
aXN0LCB0cnVlLCBOVUxMLCB0cnVlKTsNCj4gKyAgICAgICByID0gdHRtX2V1X3Jlc2VydmVfYnVm
ZmVycygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgTlVMTCwgZmFsc2UpOw0KPiAgICAgICAgICBpZiAo
cikgew0KPiAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZmFpbGVkIHRvIHJlc2VydmUgQ1NB
LFBEIEJPczogZXJyPSVkXG4iLCByKTsNCj4gICAgICAgICAgICAgICAgICByZXR1cm4gcjsNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPiBpbmRleCBkNTEzYTVhZDAz
ZGQuLmVkMjVhNGUxNDQwNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZW0uYw0KPiBAQCAtMTcxLDcgKzE3MSw3IEBAIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xv
c2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosDQo+DQo+ICAgICAgICAgIGFtZGdwdV92bV9n
ZXRfcGRfYm8odm0sICZsaXN0LCAmdm1fcGQpOw0KPg0KPiAtICAgICAgIHIgPSB0dG1fZXVfcmVz
ZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxzZSwgJmR1cGxpY2F0ZXMsIHRydWUpOw0K
PiArICAgICAgIHIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxz
ZSwgJmR1cGxpY2F0ZXMsIGZhbHNlKTsNCj4gICAgICAgICAgaWYgKHIpIHsNCj4gICAgICAgICAg
ICAgICAgICBkZXZfZXJyKGFkZXYtPmRldiwgImxlYWtpbmcgYm8gdmEgYmVjYXVzZSAiDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAid2UgZmFpbCB0byByZXNlcnZlIGJvICglZClcbiIsIHIp
Ow0KPiBAQCAtNjA4LDcgKzYwOCw3IEBAIGludCBhbWRncHVfZ2VtX3ZhX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+DQo+ICAgICAgICAgIGFtZGdwdV92bV9nZXRf
cGRfYm8oJmZwcml2LT52bSwgJmxpc3QsICZ2bV9wZCk7DQo+DQo+IC0gICAgICAgciA9IHR0bV9l
dV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsICZkdXBsaWNhdGVzLCB0cnVl
KTsNCj4gKyAgICAgICByID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwg
dHJ1ZSwgJmR1cGxpY2F0ZXMsIGZhbHNlKTsNCj4gICAgICAgICAgaWYgKHIpDQo+ICAgICAgICAg
ICAgICAgICAgZ290byBlcnJvcl91bnJlZjsNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuaA0KPiBpbmRleCBjNDMwZTgyNTkwMzguLmQ2MDU5M2NjNDM2ZSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0KPiBA
QCAtMTU1LDcgKzE1NSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9ib19yZXNlcnZlKHN0
cnVjdCBhbWRncHVfYm8gKmJvLCBib29sIG5vX2ludHIpDQo+ICAgICAgICAgIHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldik7DQo+ICAgICAg
ICAgIGludCByOw0KPg0KPiAtICAgICAgIHIgPSB0dG1fYm9fcmVzZXJ2ZSgmYm8tPnRibywgIW5v
X2ludHIsIGZhbHNlLCBOVUxMKTsNCj4gKyAgICAgICByID0gX190dG1fYm9fcmVzZXJ2ZSgmYm8t
PnRibywgIW5vX2ludHIsIGZhbHNlLCBOVUxMKTsNCj4gICAgICAgICAgaWYgKHVubGlrZWx5KHIg
IT0gMCkpIHsNCj4gICAgICAgICAgICAgICAgICBpZiAociAhPSAtRVJFU1RBUlRTWVMpDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGFkZXYtPmRldiwgIiVwIHJlc2VydmUgZmFp
bGVkXG4iLCBibyk7DQo+IC0tDQo+IDIuMTcuMQ0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
