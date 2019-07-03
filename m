Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6FA5EE10
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 23:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700D66E1E2;
	Wed,  3 Jul 2019 21:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610436E1E8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 21:03:34 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4043.namprd12.prod.outlook.com (10.141.185.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 3 Jul 2019 21:03:32 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 21:03:32 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yAgABzhwA=
Date: Wed, 3 Jul 2019 21:03:32 +0000
Message-ID: <a9764210-9401-471b-96a7-b93606008d07@amd.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
In-Reply-To: <20190703141001.GH18688@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::23) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 844d0a74-3248-4a15-4456-08d6fff9e7c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4043; 
x-ms-traffictypediagnostic: DM6PR12MB4043:
x-microsoft-antispam-prvs: <DM6PR12MB4043BB0F7CCBCCD0F6125EEB92FB0@DM6PR12MB4043.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(256004)(25786009)(53936002)(14444005)(66066001)(65956001)(65806001)(6512007)(64126003)(3846002)(6116002)(6436002)(4326008)(14454004)(86362001)(65826007)(6916009)(6246003)(36756003)(6486002)(6506007)(386003)(58126008)(31696002)(2906002)(102836004)(316002)(68736007)(486006)(31686004)(73956011)(26005)(66556008)(186003)(66946007)(66446008)(53546011)(72206003)(478600001)(54906003)(76176011)(64756008)(66476007)(52116002)(229853002)(99286004)(71200400001)(71190400001)(7736002)(305945005)(2616005)(476003)(5660300002)(446003)(8936002)(81166006)(81156014)(11346002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4043;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dP0ttaLr0dIjvmtJPj24LWE8GDtdGEm15pwABWYTr49IJyS5F0L9z6++C3VQ6NyUAPrsyvO5Nuv6PjIAvphKDJYxDT6JZ8rNArLR+Wkhw2Y6iSLw4hCbOf6aIJptnzK1v60ToAkyDBqIVhbqx5QSmj9y3SsX8iPjhaxuPu7+Ocrnwg6dh6CmUBkjxyT1zr6nWHusWpXeQy7bCpA/7jbWYBD1xXcYHbcnpQcdVKELuuBGMSKvv06Ef9OD1+IroSA46jBB3Ynjt0L4UfrXZXXQlGkk7PmeXSH/h1d5Ixk4ZALQqT6iZNRtMUAmpnOl8JFDRGJC8FrtreL+d4jxAURD2QBHTO4JcQMKKO1DgmsPkGXNDhy6miadMEHiNSNv0ysO5wCPPSDPaAiuP/cWrsWZaq8uvVB1rlV0yErnRfS7WG4=
Content-ID: <0E65351505BF7E408334A64F225F3BC0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844d0a74-3248-4a15-4456-08d6fff9e7c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 21:03:32.2927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cou+QGq/6QrzCUvbcpEGYduHx74lUtRh7TlfmoWpawY=;
 b=Tlcu+sifDmaGQkyxYU6hivHpR6AUrjNRxnFQrbt4UGPmZQDRlpefqkhs8HnSiii4P6t6+qWNlBGgoUOTPC0OWXnT3I236sjZopqu0w98YXblwwm2KyExKvCIXEFLzW/jT2tf+LlZs74Xvvj7CyP/vWCdZYNVbFB+H3Jj4LEpYXE=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Yang,
 Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wMyAxMDoxMCBhLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+IE9uIFdl
ZCwgSnVsIDAzLCAyMDE5IGF0IDAxOjU1OjA4QU0gKzAwMDAsIEt1ZWhsaW5nLCBGZWxpeCB3cm90
ZToNCj4+IEZyb206IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KPj4NCj4+IElu
IG9yZGVyIHRvIHBhc3MgbWlycm9yIGluc3RlYWQgb2YgbW0gdG8gaG1tX3JhbmdlX3JlZ2lzdGVy
LCB3ZSBuZWVkDQo+PiBwYXNzIGJvIGluc3RlYWQgb2YgdHRtIHRvIGFtZGdwdV90dG1fdHRfZ2V0
X3VzZXJfcGFnZXMgYmVjYXVzZSBtaXJyb3INCj4+IGlzIHBhcnQgb2YgYW1kZ3B1X21uIHN0cnVj
dHVyZSwgd2hpY2ggaXMgYWNjZXNzaWJsZSBmcm9tIGJvLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEZlbGl4
IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogRmVs
aXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+PiBDQzogU3RlcGhlbiBSb3Ro
d2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+PiBDQzogSmFzb24gR3VudGhvcnBlIDxqZ2dA
bWVsbGFub3guY29tPg0KPj4gQ0M6IERhdmUgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPj4g
Q0M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4+IC0tLQ0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAt
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8
ICA1ICsrLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAg
ICAgICAgICB8ICAyICstDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYyAgICAgICAgICB8ICAzICstLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfbW4uYyAgICAgICAgICAgfCAgOCArKysrKysrKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfbW4uaCAgICAgICAgICAgfCAgNSArKysrKw0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgICAgICAgfCAxMiArKysrKysrKysr
LS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oICAgICAgICAg
IHwgIDUgKysrLS0NCj4+ICAgOCBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkNCj4gVGhpcyBpcyB0b28gYmlnIHRvIHVzZSBhcyBhIGNvbmZsaWN0IHJlc29s
dXRpb24sIHdoYXQgeW91IGNvdWxkIGRvIGlzDQo+IGFwcGx5IHRoZSBtYWpvcml0eSBvZiB0aGUg
cGF0Y2ggb24gdG9wIG9mIHlvdXIgdHJlZSBhcy1pcyAoaWUga2VlcA0KPiB1c2luZyB0aGUgb2xk
IGhtbV9yYW5nZV9yZWdpc3RlciksIHRoZW4gdGhlIGNvbmZsaWN0IHJlc29sdXRpb24gZm9yDQo+
IHRoZSB1cGRhdGVkIEFNRCBHUFUgdHJlZSBjYW4gYmUgYSBzaW1wbGUgb25lIGxpbmUgY2hhbmdl
Og0KPg0KPiAgIC0JaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCBtbSwgc3RhcnQsDQo+ICAgKwlo
bW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1pcnJvciwgc3RhcnQsDQo+ICAgIAkJCSAgIHN0YXJ0
ICsgdHRtLT5udW1fcGFnZXMgKiBQQUdFX1NJWkUsIFBBR0VfU0hJRlQpOw0KPg0KPiBXaGljaCBp
cyB0cml2aWFsIGZvciBldmVyb25lIHRvIGRlYWwgd2l0aCwgYW5kIHNvbHZlcyB0aGUgcHJvYmxl
bS4NCg0KR29vZCBpZGVhLg0KDQoNCj4NCj4gVGhpcyBpcyBwcm9iYWJseSBhIG11Y2ggYmV0dGVy
IG9wdGlvbiB0aGFuIHJlYmFzaW5nIHRoZSBBTUQgZ3B1IHRyZWUuDQoNCkkgdGhpbmsgQWxleCBp
cyBwbGFubmluZyB0byBtZXJnZSBobW0uZ2l0IGludG8gYW4gdXBkYXRlZCBkcm0tbmV4dCBhbmQg
DQp0aGVuIHJlYmFzZSBhbWQtc3RhZ2luZy1kcm0tbmV4dCBvbiB0b3Agb2YgdGhhdC4gUmViYXNp
bmcgb3VyIA0KYW1kLXN0YWdpbmctZHJtLW5leHQgaXMgc29tZXRoaW5nIHdlIGRvIGV2ZXJ5IG1v
bnRoIG9yIHR3byBhbnl3YXkuDQoNCg0KPg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X21uLmMNCj4+IGluZGV4IDYyM2Y1NmExNDg1Zi4uODBlNDA4OThhNTA3IDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMNCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQo+PiBAQCAtMzk4LDYgKzM5OCwx
NCBAQCBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5fZ2V0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LA0KPj4gICAJcmV0dXJuIEVSUl9QVFIocik7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3Ry
dWN0IGhtbV9taXJyb3IgKmFtZGdwdV9tbl9nZXRfbWlycm9yKHN0cnVjdCBhbWRncHVfbW4gKmFt
bikNCj4+ICt7DQo+PiArCWlmICghYW1uKQ0KPj4gKwkJcmV0dXJuIE5VTEw7DQo+PiArDQo+PiAr
CXJldHVybiAmYW1uLT5taXJyb3I7DQo+PiArfQ0KPiBJIHRoaW5rIGl0IGlzIGJldHRlciBtYWtl
IHRoZSBzdHJ1Y3QgYW1kZ3B1X21uIHB1YmxpYyByYXRoZXIgdGhhbiBhZGQNCj4gdGhpcyB3cmFw
cGVyLg0KDQpTdXJlLiBJIGNhbiBkbyB0aGF0LiBJdCB3b24ndCBtYWtlIHRoZSBwYXRjaCBzbWFs
bGVyLCB0aG91Z2gsIGlmIHRoYXQgDQp3YXMgeW91ciBpbnRlbnRpb24uDQoNCkl0IGxvb2tzIGxp
a2UgU3RlcGhlbiBhbHJlYWR5IGFwcGxpZWQgbXkgcGF0Y2ggYXMgYSBjb25mbGljdCByZXNvbHV0
aW9uIA0Kb24gbGludXgtbmV4dCwgdGhvdWdoLiBJIHNlZSBsaW51eC1uZXh0L21hc3RlciBpcyBn
ZXR0aW5nIHVwZGF0ZWQgDQpub24tZmFzdC1mb3J3YXJkLiBTbyBpcyB0aGUgaWRlYSB0aGF0IGl0
cyBoaXN0b3J5IHdpbGwgdXBkYXRlZCBhZ2FpbiANCndpdGggdGhlIGZpbmFsIHJlc29sdXRpb24g
b24gZHJtLW5leHQgb3IgZHJtLWZpeGVzPw0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCj4NCj4g
SmFzb24NCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
