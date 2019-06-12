Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A042DCA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 19:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E46897FF;
	Wed, 12 Jun 2019 17:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06003897FF;
 Wed, 12 Jun 2019 17:54:39 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3049.namprd12.prod.outlook.com (20.178.30.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Wed, 12 Jun 2019 17:54:33 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 17:54:33 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH v2 hmm 00/11] Various revisions from a locking/code review
Thread-Topic: [PATCH v2 hmm 00/11] Various revisions from a locking/code review
Thread-Index: AQHVHJfr1/69N5Ix7UmcwouP0m28vaaW5DsAgAFyWoA=
Date: Wed, 12 Jun 2019 17:54:33 +0000
Message-ID: <5d3b0ae2-3662-cab2-5e6c-82912f32356a@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190611194858.GA27792@ziepe.ca>
In-Reply-To: <20190611194858.GA27792@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.53.123]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f18e1d3-d8ba-4759-24ff-08d6ef5f06af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3049; 
x-ms-traffictypediagnostic: DM6PR12MB3049:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM6PR12MB304912318BE8533C2D0040CC92EC0@DM6PR12MB3049.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(136003)(396003)(366004)(199004)(189003)(58126008)(6116002)(110136005)(3846002)(6486002)(68736007)(53936002)(5660300002)(6246003)(8936002)(6306002)(14454004)(6512007)(81166006)(6436002)(2906002)(53546011)(6506007)(316002)(386003)(99286004)(102836004)(8676002)(6636002)(52116002)(65826007)(31686004)(81156014)(4326008)(76176011)(54906003)(65806001)(229853002)(478600001)(66446008)(64756008)(66556008)(66946007)(65956001)(66066001)(26005)(186003)(72206003)(25786009)(86362001)(66476007)(31696002)(73956011)(71190400001)(7736002)(256004)(446003)(305945005)(2616005)(36756003)(966005)(11346002)(486006)(14444005)(476003)(64126003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3049;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H4QJCFxP6VFSnZxvta9eC2tTmLzHCrdA6KLZgwJlGFRGgzPTPyU6MvV2Fp2+ovYil1Ng3KioxIScK1DgEa+A7VKoL/FZepLhRm5nZTik4IsZlvZCmtV2YINuonplc9ZcI0T7b9myM/6z9ygFKmTo5NIfXSN6OYerHHmiZvUT08uIZiUFwsNR2+bm916ln7avIu8vn4epN6RysadNVVFgY5R0FgKzzfUvkeBUorFKHz3qJFQ8tPB2ZQtSK7Pa1PQrmtP9Nn5dZVDOCrfcDGrNDkS1FbanF1mRuE6ktbwrv+ZeZ0SsAU8wDzfeG7hp12JwpB7fIzxXoR/Hv6khFgmdTDyV8T/G0hTYtd8ujFXUownM7veuVNIXLYMbCloGhXyU914eNYHqnD7/SgrsTszLs3oP8uQogVyWrIRxxM50Pkk=
Content-ID: <D7961056F695C445A1434E7B7D490147@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f18e1d3-d8ba-4759-24ff-08d6ef5f06af
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 17:54:33.5765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsr+DrOReLLHaqJmxCSSxEENrX8ySUtZsI5ISTYzod8=;
 b=GwkF2zed8tO1nmGK9ADP7/FnBwPJF6wleN6lBrJdt2wkjrGTyLosw4z38Xj1cQZY7++Z21SWY/Zy0lWP70GshNxPD7io0yiDMLJ00GglXInt7ajBItDXYL5mayF4qO6znKnkAOATFUDXk4ntjwk/6aam/7HE2QT/uWrA4USInW8=
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WytQaGlsaXBdDQoNCkhpIEphc29uLA0KDQpJJ20gb3V0IG9mIHRoZSBvZmZpY2UgdGhpcyB3ZWVr
Lg0KDQpIaSBQaGlsaXAsIGNhbiB5b3UgZ2l2ZSB0aGlzIGEgZ28/IE5vdCBzdXJlIGhvdyBtdWNo
IHlvdSd2ZSBiZWVuIA0KZm9sbG93aW5nIHRoaXMgcGF0Y2ggc2VyaWVzIHJldmlldy4gTWVzc2Fn
ZSBvciBjYWxsIG1lIG9uIFNreXBlIHRvIA0KZGlzY3VzcyBhbnkgcXVlc3Rpb25zLg0KDQpUaGFu
a3MsDQogwqAgRmVsaXgNCg0KT24gMjAxOS0wNi0xMSAxMjo0OCwgSmFzb24gR3VudGhvcnBlIHdy
b3RlOg0KPiBPbiBUaHUsIEp1biAwNiwgMjAxOSBhdCAwMzo0NDoyN1BNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6DQo+PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5j
b20+DQo+Pg0KPj4gRm9yIGhtbS5naXQ6DQo+Pg0KPj4gVGhpcyBwYXRjaCBzZXJpZXMgYXJpc2Vk
IG91dCBvZiBkaXNjdXNzaW9ucyB3aXRoIEplcm9tZSB3aGVuIGxvb2tpbmcgYXQgdGhlDQo+PiBP
RFAgY2hhbmdlcywgcGFydGljdWxhcmx5IGluZm9ybWVkIGJ5IHVzZSBhZnRlciBmcmVlIHJhY2Vz
IHdlIGhhdmUgYWxyZWFkeQ0KPj4gZm91bmQgYW5kIGZpeGVkIGluIHRoZSBPRFAgY29kZSAodGhh
bmtzIHRvIHN5emthbGxlcikgd29ya2luZyB3aXRoIG1tdQ0KPj4gbm90aWZpZXJzLCBhbmQgdGhl
IGRpc2N1c3Npb24gd2l0aCBSYWxwaCBvbiBob3cgdG8gcmVzb2x2ZSB0aGUgbGlmZXRpbWUgbW9k
ZWwuDQo+Pg0KPj4gT3ZlcmFsbCB0aGlzIGJyaW5ncyBpbiBhIHNpbXBsaWZpZWQgbG9ja2luZyBz
Y2hlbWUgYW5kIGVhc3kgdG8gZXhwbGFpbg0KPj4gbGlmZXRpbWUgbW9kZWw6DQo+Pg0KPj4gICBJ
ZiBhIGhtbV9yYW5nZSBpcyB2YWxpZCwgdGhlbiB0aGUgaG1tIGlzIHZhbGlkLCBpZiBhIGhtbSBp
cyB2YWxpZCB0aGVuIHRoZSBtbQ0KPj4gICBpcyBhbGxvY2F0ZWQgbWVtb3J5Lg0KPj4NCj4+ICAg
SWYgdGhlIG1tIG5lZWRzIHRvIHN0aWxsIGJlIGFsaXZlIChpZSB0byBsb2NrIHRoZSBtbWFwX3Nl
bSwgZmluZCBhIHZtYSwgZXRjKQ0KPj4gICB0aGVuIHRoZSBtbWdldCBtdXN0IGJlIG9idGFpbmVk
IHZpYSBtbWdldF9ub3RfemVybygpLg0KPj4NCj4+IExvY2tpbmcgb2YgbW0tPmhtbSBpcyBzaGlm
dGVkIHRvIHVzZSB0aGUgbW1hcF9zZW0gY29uc2lzdGVudGx5IGZvciBhbGwNCj4+IHJlYWQvd3Jp
dGUgYW5kIHVubG9ja2VkIGFjY2Vzc2VzIGFyZSByZW1vdmVkLg0KPj4NCj4+IFRoZSB1c2UgdW5s
b2NrZWQgcmVhZHMgb24gJ2htbS0+ZGVhZCcgYXJlIGFsc28gZWxpbWluYXRlZCBpbiBmYXZvdXIg
b2YgdXNpbmcNCj4+IHN0YW5kYXJkIG1tZ2V0KCkgbG9ja2luZyB0byBwcmV2ZW50IHRoZSBtbSBm
cm9tIGJlaW5nIHJlbGVhc2VkLiBNYW55IG9mIHRoZQ0KPj4gZGVidWdnaW5nIGNoZWNrcyBvZiAh
cmFuZ2UtPmhtbSBhbmQgIWhtbS0+bW0gYXJlIGRyb3BwZWQgaW4gZmF2b3VyIG9mIHBvaXNvbiAt
DQo+PiB3aGljaCBpcyBtdWNoIGNsZWFyZXIgYXMgdG8gdGhlIGxpZmV0aW1lIGludGVudC4NCj4+
DQo+PiBUaGUgdHJhaWxpbmcgcGF0Y2hlcyBhcmUganVzdCBzb21lIHJhbmRvbSBjbGVhbnVwcyBJ
IG5vdGljZWQgd2hlbiByZXZpZXdpbmcNCj4+IHRoaXMgY29kZS4NCj4+DQo+PiBUaGlzIHYyIGlu
Y29ycG9yYXRlcyBhbG90IG9mIHRoZSBnb29kIG9mZiBsaXN0IGNoYW5nZXMgJiBmZWVkYmFjayBK
ZXJvbWUgaGFkLA0KPj4gYW5kIGFsbCB0aGUgb24tbGlzdCBjb21tZW50cyB0b28uIEhvd2V2ZXIs
IG5vdyB0aGF0IHdlIGhhdmUgdGhlIHNoYXJlZCBnaXQgSQ0KPj4gaGF2ZSBrZXB0IHRoZSBvbmUg
bGluZSBjaGFuZ2UgdG8gbm91dmVhdV9zdm0uYyByYXRoZXIgdGhhbiB0aGUgY29tcGF0DQo+PiBm
dW50aW9ucy4NCj4+DQo+PiBJIGJlbGlldmUgd2UgY2FuIHJlc29sdmUgdGhpcyBtZXJnZSBpbiB0
aGUgRFJNIHRyZWUgbm93IGFuZCBrZWVwIHRoZSBjb3JlDQo+PiBtbS9obW0uYyBjbGVhbi4gRFJN
IG1haW50YWluZXJzLCBwbGVhc2UgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcuDQo+Pg0KPj4gSXQg
aXMgb24gdG9wIG9mIGhtbS5naXQsIGFuZCBJIGhhdmUgYSBnaXQgdHJlZSBvZiB0aGlzIHNlcmll
cyB0byBlYXNlIHRlc3RpbmcNCj4+IGhlcmU6DQo+Pg0KPj4gaHR0cHM6Ly9naXRodWIuY29tL2pn
dW50aG9ycGUvbGludXgvdHJlZS9obW0NCj4+DQo+PiBUaGVyZSBhcmUgc3RpbGwgc29tZSBvcGVu
IGxvY2tpbmcgaXNzdWVzLCBhcyBJIHRoaW5rIHRoaXMgcmVtYWlucyB1bmFkZHJlc3NlZDoNCj4+
DQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDE5MDUyNzE5NTgyOS5HQjE4
MDE5QG1lbGxhbm94LmNvbS8NCj4+DQo+PiBJJ20gbG9va2luZyBmb3Igc29tZSBtb3JlIGFja3Ms
IHJldmlld3MgYW5kIHRlc3RzIHNvIHRoaXMgY2FuIG1vdmUgYWhlYWQgdG8NCj4+IGhtbS5naXQu
DQo+IEFNRCBGb2xrcywgdGhpcyBpcyBsb29raW5nIHByZXR0eSBnb29kIG5vdywgY2FuIHlvdSBw
bGVhc2UgZ2l2ZSBhdA0KPiBsZWFzdCBhIFRlc3RlZC1ieSBmb3IgdGhlIG5ldyBkcml2ZXIgY29k
ZSB1c2luZyB0aGlzIHRoYXQgSSBzZWUgaW4NCj4gbGludXgtbmV4dD8NCj4NCj4gVGhhbmtzLA0K
PiBKYXNvbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
