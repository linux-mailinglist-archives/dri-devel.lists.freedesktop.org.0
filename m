Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0CE7C38A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD0189E0C;
	Wed, 31 Jul 2019 13:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740075.outbound.protection.outlook.com [40.107.74.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D16589DF9;
 Wed, 31 Jul 2019 13:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nncD4pA3F7SG89HlxZw6/tH8ghbaEFQV6Opd1xy+w31bv6k6cLMOSLFFuMHWvn8fJ/HZbPpzuFz6s49RnkQxMbwim5gvvw2N6kEbrG3ukMXAxc7bbopvPC88SMkqAix7Lu1EvRkI++MZggLpcUyoZ2Lr6LI/VKCIxmqTH5yIDxTKluqR8X4LwD2ZkFeQ8SF0CaEb2bbedw59nIZpTPOyUnW0RVCxirZR6Eeav+YEGUQYudN3Wa27Lf84T/IZi1LzZZXmj0XsluiZEEJ83RTikV2ulSS1NtC4e+95UTGOjTytBkIBsnC5/90p6zNMgQOIQEa+Y9r4AtdA2EnGJSKOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXJM3vc0F1Go+EHDv0SqTYUfgl7boH9jDnDNhsLqfGA=;
 b=jRvmWWcGXWxiEoDvctCVR7JveO0wVtnrgIxcrJa7VRNRUbmUnvboX72grPs7+KNQYAjNplRIu67U5sxolbFbXV2gWVXRkAsoOgTvDLpGtIgTRLVEQTKLoYPC39ej1XVXMxCt3zr3dHhyrBC471SgnNfXRhHJY051nIiMMTuj1pytWOvBtbQUfbPSDllZz9tpFA42fryCWhu1B/OwWFQ5yECIQ8cBvlKtSl/Ob5TndO1q46HIa2kqhn/cRWuIQb5qI7SPt4W/vBPc4lDqje9fbuSdevWt/y3S09cRkJu14jNMreyPAsz8ggdJuKkcBNQoTjW8m6/afR+sgHKcZUjtSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3867.namprd12.prod.outlook.com (10.255.173.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 31 Jul 2019 13:31:14 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:31:14 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Christoph Hellwig <hch@lst.de>, =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
Subject: Re: [PATCH 06/13] mm: remove superflous arguments from
 hmm_range_register
Thread-Topic: [PATCH 06/13] mm: remove superflous arguments from
 hmm_range_register
Thread-Index: AQHVRpr+gRQ3eXd3iEy8aM3XPtjaAKbkuzuA
Date: Wed, 31 Jul 2019 13:31:14 +0000
Message-ID: <484ce3bd-767d-b65e-21c2-ed36bea107be@amd.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-7-hch@lst.de>
In-Reply-To: <20190730055203.28467-7-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d7c640d-674b-4fec-3136-08d715bb5c0a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3867; 
x-ms-traffictypediagnostic: DM6PR12MB3867:
x-microsoft-antispam-prvs: <DM6PR12MB38677D806C955B43DFA5C7AA92DF0@DM6PR12MB3867.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(65826007)(8676002)(102836004)(31696002)(6506007)(305945005)(486006)(53936002)(76176011)(446003)(14454004)(256004)(8936002)(26005)(186003)(86362001)(7416002)(81166006)(53546011)(81156014)(476003)(68736007)(2616005)(11346002)(3846002)(2906002)(6116002)(66476007)(66946007)(71200400001)(71190400001)(6486002)(66556008)(316002)(66446008)(64756008)(386003)(229853002)(31686004)(36756003)(6436002)(5660300002)(64126003)(25786009)(58126008)(6512007)(478600001)(99286004)(65806001)(65956001)(7736002)(110136005)(54906003)(66066001)(52116002)(6246003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3867;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Uy7m1COd+4hOBRh5tUMYlKGwIbbel3xVhJwXTnab7pTvYwkAyk0AOSGbg2QvUAprMPrmZn/pQjSXpZgAJ0Xq+nXFrMu6zCduFM9Ikm2eCkrYt19WtPOhYoqQZlNA3FwbHuTZb0C61ZjXnc9oKVJ7luaxJ6mlHHJBpkOju4OK5sSrfXqL1I1r9l5CS+wEJIM0qWEUesvHbzvZPVm7k4SMC/MYR3IuUWItuTndxLCc5ltwW6fSGbUsJWOOuuOFxG55aE45GSdbKmEvTSIDieGdrSrCAs8kGfLqsjKCAPgUm4U/+Afc6HXFSPT6e2LJF+YE7ov1jicMpjGyhPdFOSNZYvgQKXWMtq9oRawgkN5zP4cu9IpE3Me6Cy0pnCwaEJzzI4Hqo6TK23UcXZSxZRNVatBPmWFVjOwZar5lroSJ3Ws=
Content-ID: <51D820BBC285A041B685336D043310D4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7c640d-674b-4fec-3136-08d715bb5c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:31:14.5482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3867
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXJM3vc0F1Go+EHDv0SqTYUfgl7boH9jDnDNhsLqfGA=;
 b=HcCLJvxoKPSyOLr04mqwmvTCg06AWYsp5rB5ulT+8pihoW6YblGbCv/pZ9klk6MTdiOxO487s92jjIFGGnRW4JuiMycL+RHfyB1LmWLPRbImaMwz6xPFIY1GvbkOYQKGaNL3SZtCnNIkhVVXW4+xBEXywiM8RVQpIoS47isL5tw=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0zMCAxOjUxIGEubS4sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiBUaGUg
c3RhcnQsIGVuZCBhbmQgcGFnZV9zaGlmdCB2YWx1ZXMgYXJlIGFsbCBzYXZlZCBpbiB0aGUgcmFu
Z2UNCj4gc3RydWN0dXJlLCBzbyB3ZSBtaWdodCBhcyB3ZWxsIHVzZSB0aGF0IGZvciBhcmd1bWVu
dCBwYXNzaW5nLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4NCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPg0KDQoNCj4gLS0tDQo+ICAgRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0ICAgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
fCAgNyArKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyAg
IHwgIDUgKystLS0NCj4gICBpbmNsdWRlL2xpbnV4L2htbS5oICAgICAgICAgICAgICAgICAgICAg
fCAgNiArLS0tLS0NCj4gICBtbS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAyMCArKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3ZtL2htbS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZtL2htbS5yc3QNCj4gaW5kZXggZGRjYjVjYThi
Mjk2Li5lNjNjMTFmN2UwZTAgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdm0vaG1tLnJz
dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZtL2htbS5yc3QNCj4gQEAgLTIyMiw3ICsyMjIsNyBA
QCBUaGUgdXNhZ2UgcGF0dGVybiBpczo6DQo+ICAgICAgICAgcmFuZ2UuZmxhZ3MgPSAuLi47DQo+
ICAgICAgICAgcmFuZ2UudmFsdWVzID0gLi4uOw0KPiAgICAgICAgIHJhbmdlLnBmbl9zaGlmdCA9
IC4uLjsNCj4gLSAgICAgIGhtbV9yYW5nZV9yZWdpc3RlcigmcmFuZ2UpOw0KPiArICAgICAgaG1t
X3JhbmdlX3JlZ2lzdGVyKCZyYW5nZSwgbWlycm9yKTsNCj4gICANCj4gICAgICAgICAvKg0KPiAg
ICAgICAgICAqIEp1c3Qgd2FpdCBmb3IgcmFuZ2UgdG8gYmUgdmFsaWQsIHNhZmUgdG8gaWdub3Jl
IHJldHVybiB2YWx1ZSBhcyB3ZQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jDQo+IGluZGV4IGYwODIxNjM4YmJjNi4uNzFkNmU3MDg3YjBiIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IEBAIC04MTgsOCArODE4LDExIEBAIGlu
dCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzKQ0KPiAgIAkJCQkwIDogcmFuZ2UtPmZsYWdzW0hNTV9QRk5fV1JJVEVd
Ow0KPiAgIAlyYW5nZS0+cGZuX2ZsYWdzX21hc2sgPSAwOw0KPiAgIAlyYW5nZS0+cGZucyA9IHBm
bnM7DQo+IC0JaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCBtaXJyb3IsIHN0YXJ0LA0KPiAtCQkJ
ICAgc3RhcnQgKyB0dG0tPm51bV9wYWdlcyAqIFBBR0VfU0laRSwgUEFHRV9TSElGVCk7DQo+ICsJ
cmFuZ2UtPnBhZ2Vfc2hpZnQgPSBQQUdFX1NISUZUOw0KPiArCXJhbmdlLT5zdGFydCA9IHN0YXJ0
Ow0KPiArCXJhbmdlLT5lbmQgPSBzdGFydCArIHR0bS0+bnVtX3BhZ2VzICogUEFHRV9TSVpFOw0K
PiArDQo+ICsJaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCBtaXJyb3IpOw0KPiAgIA0KPiAgIAkv
Kg0KPiAgIAkgKiBKdXN0IHdhaXQgZm9yIHJhbmdlIHRvIGJlIHZhbGlkLCBzYWZlIHRvIGlnbm9y
ZSByZXR1cm4gdmFsdWUgYXMgd2UNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5j
DQo+IGluZGV4IGI4ODlkNWVjNGM3ZS4uNDBlNzA2MjM0NTU0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMNCj4gQEAgLTQ5Miw5ICs0OTIsNyBAQCBub3V2ZWF1X3Jh
bmdlX2ZhdWx0KHN0cnVjdCBub3V2ZWF1X3N2bW0gKnN2bW0sIHN0cnVjdCBobW1fcmFuZ2UgKnJh
bmdlKQ0KPiAgIAlyYW5nZS0+ZGVmYXVsdF9mbGFncyA9IDA7DQo+ICAgCXJhbmdlLT5wZm5fZmxh
Z3NfbWFzayA9IC0xVUw7DQo+ICAgDQo+IC0JcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdl
LCAmc3ZtbS0+bWlycm9yLA0KPiAtCQkJCSByYW5nZS0+c3RhcnQsIHJhbmdlLT5lbmQsDQo+IC0J
CQkJIFBBR0VfU0hJRlQpOw0KPiArCXJldCA9IGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgJnN2
bW0tPm1pcnJvcik7DQo+ICAgCWlmIChyZXQpIHsNCj4gICAJCXVwX3JlYWQoJnJhbmdlLT5obW0t
Pm1tLT5tbWFwX3NlbSk7DQo+ICAgCQlyZXR1cm4gKGludClyZXQ7DQo+IEBAIC02ODIsNiArNjgw
LDcgQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpDQo+ICAg
CQkJIGFyZ3MuaS5wLmFkZHIgKyBhcmdzLmkucC5zaXplLCBmbiAtIGZpKTsNCj4gICANCj4gICAJ
CS8qIEhhdmUgSE1NIGZhdWx0IHBhZ2VzIHdpdGhpbiB0aGUgZmF1bHQgd2luZG93IHRvIHRoZSBH
UFUuICovDQo+ICsJCXJhbmdlLnBhZ2Vfc2hpZnQgPSBQQUdFX1NISUZUOw0KPiAgIAkJcmFuZ2Uu
c3RhcnQgPSBhcmdzLmkucC5hZGRyOw0KPiAgIAkJcmFuZ2UuZW5kID0gYXJncy5pLnAuYWRkciAr
IGFyZ3MuaS5wLnNpemU7DQo+ICAgCQlyYW5nZS5wZm5zID0gYXJncy5waHlzOw0KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgNCj4gaW5kZXgg
NTliZTBhYTI0NzZkLi5jNWI1MTM3NmI0NTMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgv
aG1tLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9obW0uaA0KPiBAQCAtNDAwLDExICs0MDAsNyBA
QCB2b2lkIGhtbV9taXJyb3JfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yKTsN
Cj4gICAvKg0KPiAgICAqIFBsZWFzZSBzZWUgRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IGZvciBo
b3cgdG8gdXNlIHRoZSByYW5nZSBBUEkuDQo+ICAgICovDQo+IC1pbnQgaG1tX3JhbmdlX3JlZ2lz
dGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLA0KPiAtCQkgICAgICAgc3RydWN0IGhtbV9taXJy
b3IgKm1pcnJvciwNCj4gLQkJICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsDQo+IC0JCSAgICAg
ICB1bnNpZ25lZCBsb25nIGVuZCwNCj4gLQkJICAgICAgIHVuc2lnbmVkIHBhZ2Vfc2hpZnQpOw0K
PiAraW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgc3RydWN0
IGhtbV9taXJyb3IgKm1pcnJvcik7DQo+ICAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSk7DQo+ICAgDQo+ICAgLyoNCj4gZGlmZiAtLWdpdCBhL21tL2ht
bS5jIGIvbW0vaG1tLmMNCj4gaW5kZXggM2EzODUyNjYwNzU3Li45MjY3MzVhM2FlZjkgMTAwNjQ0
DQo+IC0tLSBhL21tL2htbS5jDQo+ICsrKyBiL21tL2htbS5jDQo+IEBAIC04NDMsMzUgKzg0Mywy
NSBAQCBzdGF0aWMgdm9pZCBobW1fcGZuc19jbGVhcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwN
Cj4gICAgKiBobW1fcmFuZ2VfcmVnaXN0ZXIoKSAtIHN0YXJ0IHRyYWNraW5nIGNoYW5nZSB0byBD
UFUgcGFnZSB0YWJsZSBvdmVyIGEgcmFuZ2UNCj4gICAgKiBAcmFuZ2U6IHJhbmdlDQo+ICAgICog
QG1tOiB0aGUgbW0gc3RydWN0IGZvciB0aGUgcmFuZ2Ugb2YgdmlydHVhbCBhZGRyZXNzDQo+IC0g
KiBAc3RhcnQ6IHN0YXJ0IHZpcnR1YWwgYWRkcmVzcyAoaW5jbHVzaXZlKQ0KPiAtICogQGVuZDog
ZW5kIHZpcnR1YWwgYWRkcmVzcyAoZXhjbHVzaXZlKQ0KPiAtICogQHBhZ2Vfc2hpZnQ6IGV4cGVj
dCBwYWdlIHNoaWZ0IGZvciB0aGUgcmFuZ2UNCj4gKyAqDQo+ICAgICogUmV0dXJuOiAwIG9uIHN1
Y2Nlc3MsIC1FRkFVTFQgaWYgdGhlIGFkZHJlc3Mgc3BhY2UgaXMgbm8gbG9uZ2VyIHZhbGlkDQo+
ICAgICoNCj4gICAgKiBUcmFjayB1cGRhdGVzIHRvIHRoZSBDUFUgcGFnZSB0YWJsZSBzZWUgaW5j
bHVkZS9saW51eC9obW0uaA0KPiAgICAqLw0KPiAtaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSwNCj4gLQkJICAgICAgIHN0cnVjdCBobW1fbWlycm9yICptaXJy
b3IsDQo+IC0JCSAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LA0KPiAtCQkgICAgICAgdW5zaWdu
ZWQgbG9uZyBlbmQsDQo+IC0JCSAgICAgICB1bnNpZ25lZCBwYWdlX3NoaWZ0KQ0KPiAraW50IGht
bV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgc3RydWN0IGhtbV9taXJy
b3IgKm1pcnJvcikNCj4gICB7DQo+IC0JdW5zaWduZWQgbG9uZyBtYXNrID0gKCgxVUwgPDwgcGFn
ZV9zaGlmdCkgLSAxVUwpOw0KPiArCXVuc2lnbmVkIGxvbmcgbWFzayA9ICgoMVVMIDw8IHJhbmdl
LT5wYWdlX3NoaWZ0KSAtIDFVTCk7DQo+ICAgCXN0cnVjdCBobW0gKmhtbSA9IG1pcnJvci0+aG1t
Ow0KPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAgIA0KPiAgIAlyYW5nZS0+dmFsaWQgPSBm
YWxzZTsNCj4gICAJcmFuZ2UtPmhtbSA9IE5VTEw7DQo+ICAgDQo+IC0JaWYgKChzdGFydCAmIG1h
c2spIHx8IChlbmQgJiBtYXNrKSkNCj4gKwlpZiAoKHJhbmdlLT5zdGFydCAmIG1hc2spIHx8IChy
YW5nZS0+ZW5kICYgbWFzaykpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQlpZiAoc3RhcnQg
Pj0gZW5kKQ0KPiArCWlmIChyYW5nZS0+c3RhcnQgPj0gcmFuZ2UtPmVuZCkNCj4gICAJCXJldHVy
biAtRUlOVkFMOw0KPiAgIA0KPiAtCXJhbmdlLT5wYWdlX3NoaWZ0ID0gcGFnZV9zaGlmdDsNCj4g
LQlyYW5nZS0+c3RhcnQgPSBzdGFydDsNCj4gLQlyYW5nZS0+ZW5kID0gZW5kOw0KPiAtDQo+ICAg
CS8qIFByZXZlbnQgaG1tX3JlbGVhc2UoKSBmcm9tIHJ1bm5pbmcgd2hpbGUgdGhlIHJhbmdlIGlz
IHZhbGlkICovDQo+ICAgCWlmICghbW1nZXRfbm90X3plcm8oaG1tLT5tbSkpDQo+ICAgCQlyZXR1
cm4gLUVGQVVMVDsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
