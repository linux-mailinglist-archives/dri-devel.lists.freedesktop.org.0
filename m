Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26B43183
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 23:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A489242;
	Wed, 12 Jun 2019 21:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162A89242;
 Wed, 12 Jun 2019 21:49:15 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB0140.namprd12.prod.outlook.com (10.174.107.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 12 Jun 2019 21:49:12 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1987.012; Wed, 12 Jun 2019
 21:49:12 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2 hmm 00/11] Various revisions from a locking/code review
Thread-Topic: [PATCH v2 hmm 00/11] Various revisions from a locking/code review
Thread-Index: AQHVHJhnoBo+dcGjQ0eHiBQsANsbXKaW5DoAgAFyXYCAAEGMgA==
Date: Wed, 12 Jun 2019 21:49:12 +0000
Message-ID: <69bb7fe9-98e7-8a49-3e0b-f639010b8991@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190611194858.GA27792@ziepe.ca>
 <5d3b0ae2-3662-cab2-5e6c-82912f32356a@amd.com>
In-Reply-To: <5d3b0ae2-3662-cab2-5e6c-82912f32356a@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6044b4c4-96cb-471f-f64a-08d6ef7fce0a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0140; 
x-ms-traffictypediagnostic: DM5PR1201MB0140:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <DM5PR1201MB0140B5851F4C13CA53079959E6EC0@DM5PR1201MB0140.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(366004)(189003)(199004)(51234002)(72206003)(305945005)(5660300002)(7736002)(81166006)(229853002)(6512007)(6486002)(6436002)(6306002)(81156014)(6636002)(6246003)(8676002)(66066001)(53936002)(478600001)(71190400001)(110136005)(966005)(14454004)(54906003)(316002)(25786009)(3846002)(6116002)(71200400001)(486006)(2906002)(14444005)(256004)(2616005)(446003)(11346002)(386003)(6506007)(4326008)(476003)(186003)(36756003)(8936002)(52116002)(76176011)(99286004)(26005)(53546011)(102836004)(66476007)(64756008)(66946007)(66556008)(68736007)(86362001)(73956011)(66446008)(31696002)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0140;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IR0CRx6ijWuUWmJPgW0SPeZ04IpMitOZQyqH6v0f9E350bSO6WRG2zMYRBzL8dzAtRqZB6xiX9s3R841gziOuQ7nXs5GJdcNoq8wROi0KWlQmANcstZzezFyUPdCI5JdANKa6z4iTBC6RWOmaim563Lh+DHiT0lgMHsE4o7THMOBfb7l1GXbeAujOkGgYX+/Dyodi6D7rw3zGhkA0CKupzRpwfhwydCQHoqKAYGN0Qe4X+BDxC2mFqnDbfW+fkXVPAC74Rb/GfegR3vGo8XEEkFG8VydqHqGmWb0S32vUx2saWVdz0lCQ120MRespQmKzoYGXMqiY8Rtf/moHWU5LwsjQ2iD4nA9tIzJqK5S7P+B6IWVYofEETB9mQ5dZ0Fen+VMp8oJk+hz+wsxwVI38u7OQqfXugS5ic5xIKKaXYE=
Content-ID: <B9FCFC9950F7E245B5942E8C6AA7BC38@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6044b4c4-96cb-471f-f64a-08d6ef7fce0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 21:49:12.0437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tCn0nvCVs/qqgrD1PWzL2pqpLnRbATQzNKLTgDiuKQ=;
 b=GKDA3anPVYKIYh30ev4dwwlguXq5UxRHpKCVWwI4C6DosSRbYjwt1GUXNzWO1MdVZ25Ge1ArL0wllLLSp4v0ATwzyX8utbOv3TnjHtfkc63b/8A+PArJcaAuqFyAbrjw/iemrJBwfqOqe0Yq8QV+GJR7m+uPcYs8QgRZdUK5L5Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

UmViYXNlIHRvIGh0dHBzOi8vZ2l0aHViLmNvbS9qZ3VudGhvcnBlL2xpbnV4LmdpdCBobW0gYnJh
bmNoLCBuZWVkIHNvbWUgDQpjaGFuZ2VzIGJlY2F1c2Ugb2YgaW50ZXJmYWNlIGhtbV9yYW5nZV9y
ZWdpc3RlciBjaGFuZ2UuIFRoZW4gcnVuIGEgcXVpY2sgDQphbWRncHVfdGVzdC4gVGVzdCBpcyBm
aW5pc2hlZCwgcmVzdWx0IGlzIG9rLiBCdXQgdGhlcmUgaXMgYmVsb3cga2VybmVsIA0KQlVHIG1l
c3NhZ2UsIHNlZW1zIGhtbV9mcmVlX3JjdSBjYWxscyBkb3duX3dyaXRlLi4uLi4NCg0KWyAxMTcx
LjkxOTkyMV0gQlVHOiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBpbnZhbGlkIGNvbnRl
eHQgYXQgDQovaG9tZS95YW5ncC9naXQvY29tcHV0ZV9zdGFnaW5nL2tlcm5lbC9rZXJuZWwvbG9j
a2luZy9yd3NlbS5jOjY1DQpbIDExNzEuOTE5OTMzXSBpbl9hdG9taWMoKTogMSwgaXJxc19kaXNh
YmxlZCgpOiAwLCBwaWQ6IDUzLCBuYW1lOiANCmt3b3JrZXIvMToxDQpbIDExNzEuOTE5OTM4XSAy
IGxvY2tzIGhlbGQgYnkga3dvcmtlci8xOjEvNTM6DQpbIDExNzEuOTE5OTQwXSAgIzA6IDAwMDAw
MDAwMWM3YzE5ZDQgKCh3cV9jb21wbGV0aW9uKXJjdV9ncCl7Ky4rLn0sIGF0OiANCnByb2Nlc3Nf
b25lX3dvcmsrMHgyMGUvMHg2MzANClsgMTE3MS45MTk5NTFdICAjMTogMDAwMDAwMDA5MjNmMmNm
YSANCigod29ya19jb21wbGV0aW9uKSgmc2RwLT53b3JrKSl7Ky4rLn0sIGF0OiBwcm9jZXNzX29u
ZV93b3JrKzB4MjBlLzB4NjMwDQpbIDExNzEuOTE5OTU5XSBDUFU6IDEgUElEOiA1MyBDb21tOiBr
d29ya2VyLzE6MSBUYWludGVkOiBHICAgICAgICBXIA0KICAgIDUuMi4wLXJjMS1rZmQteWFuZ3Ag
IzE5Ng0KWyAxMTcxLjkxOTk2MV0gSGFyZHdhcmUgbmFtZTogQVNVUyBBbGwgU2VyaWVzL1o5Ny1Q
Uk8oV2ktRmkgYWMpL1VTQiAzLjEsIA0KQklPUyA5MDAxIDAzLzA3LzIwMTYNClsgMTE3MS45MTk5
NjVdIFdvcmtxdWV1ZTogcmN1X2dwIHNyY3VfaW52b2tlX2NhbGxiYWNrcw0KWyAxMTcxLjkxOTk2
OF0gQ2FsbCBUcmFjZToNClsgMTE3MS45MTk5NzRdICBkdW1wX3N0YWNrKzB4NjcvMHg5Yg0KWyAx
MTcxLjkxOTk4MF0gIF9fX21pZ2h0X3NsZWVwKzB4MTQ5LzB4MjMwDQpbIDExNzEuOTE5OTg1XSAg
ZG93bl93cml0ZSsweDFjLzB4NzANClsgMTE3MS45MTk5ODldICBobW1fZnJlZV9yY3UrMHgyNC8w
eDgwDQpbIDExNzEuOTE5OTkzXSAgc3JjdV9pbnZva2VfY2FsbGJhY2tzKzB4YzkvMHgxNTANClsg
MTE3MS45MjAwMDBdICBwcm9jZXNzX29uZV93b3JrKzB4MjhlLzB4NjMwDQpbIDExNzEuOTIwMDA4
XSAgd29ya2VyX3RocmVhZCsweDM5LzB4M2YwDQpbIDExNzEuOTIwMDE0XSAgPyBwcm9jZXNzX29u
ZV93b3JrKzB4NjMwLzB4NjMwDQpbIDExNzEuOTIwMDE3XSAga3RocmVhZCsweDExYy8weDE0MA0K
WyAxMTcxLjkyMDAyMV0gID8ga3RocmVhZF9wYXJrKzB4OTAvMHg5MA0KWyAxMTcxLjkyMDAyNl0g
IHJldF9mcm9tX2ZvcmsrMHgyNC8weDMwDQoNClBoaWxpcA0KDQpPbiAyMDE5LTA2LTEyIDE6NTQg
cC5tLiwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPiBbK1BoaWxpcF0NCj4gDQo+IEhpIEphc29u
LA0KPiANCj4gSSdtIG91dCBvZiB0aGUgb2ZmaWNlIHRoaXMgd2Vlay4NCj4gDQo+IEhpIFBoaWxp
cCwgY2FuIHlvdSBnaXZlIHRoaXMgYSBnbz8gTm90IHN1cmUgaG93IG11Y2ggeW91J3ZlIGJlZW4N
Cj4gZm9sbG93aW5nIHRoaXMgcGF0Y2ggc2VyaWVzIHJldmlldy4gTWVzc2FnZSBvciBjYWxsIG1l
IG9uIFNreXBlIHRvDQo+IGRpc2N1c3MgYW55IHF1ZXN0aW9ucy4NCj4gDQo+IFRoYW5rcywNCj4g
ICDCoCBGZWxpeA0KPiANCj4gT24gMjAxOS0wNi0xMSAxMjo0OCwgSmFzb24gR3VudGhvcnBlIHdy
b3RlOg0KPj4gT24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDM6NDQ6MjdQTSAtMDMwMCwgSmFzb24g
R3VudGhvcnBlIHdyb3RlOg0KPj4+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94
LmNvbT4NCj4+Pg0KPj4+IEZvciBobW0uZ2l0Og0KPj4+DQo+Pj4gVGhpcyBwYXRjaCBzZXJpZXMg
YXJpc2VkIG91dCBvZiBkaXNjdXNzaW9ucyB3aXRoIEplcm9tZSB3aGVuIGxvb2tpbmcgYXQgdGhl
DQo+Pj4gT0RQIGNoYW5nZXMsIHBhcnRpY3VsYXJseSBpbmZvcm1lZCBieSB1c2UgYWZ0ZXIgZnJl
ZSByYWNlcyB3ZSBoYXZlIGFscmVhZHkNCj4+PiBmb3VuZCBhbmQgZml4ZWQgaW4gdGhlIE9EUCBj
b2RlICh0aGFua3MgdG8gc3l6a2FsbGVyKSB3b3JraW5nIHdpdGggbW11DQo+Pj4gbm90aWZpZXJz
LCBhbmQgdGhlIGRpc2N1c3Npb24gd2l0aCBSYWxwaCBvbiBob3cgdG8gcmVzb2x2ZSB0aGUgbGlm
ZXRpbWUgbW9kZWwuDQo+Pj4NCj4+PiBPdmVyYWxsIHRoaXMgYnJpbmdzIGluIGEgc2ltcGxpZmll
ZCBsb2NraW5nIHNjaGVtZSBhbmQgZWFzeSB0byBleHBsYWluDQo+Pj4gbGlmZXRpbWUgbW9kZWw6
DQo+Pj4NCj4+PiAgICBJZiBhIGhtbV9yYW5nZSBpcyB2YWxpZCwgdGhlbiB0aGUgaG1tIGlzIHZh
bGlkLCBpZiBhIGhtbSBpcyB2YWxpZCB0aGVuIHRoZSBtbQ0KPj4+ICAgIGlzIGFsbG9jYXRlZCBt
ZW1vcnkuDQo+Pj4NCj4+PiAgICBJZiB0aGUgbW0gbmVlZHMgdG8gc3RpbGwgYmUgYWxpdmUgKGll
IHRvIGxvY2sgdGhlIG1tYXBfc2VtLCBmaW5kIGEgdm1hLCBldGMpDQo+Pj4gICAgdGhlbiB0aGUg
bW1nZXQgbXVzdCBiZSBvYnRhaW5lZCB2aWEgbW1nZXRfbm90X3plcm8oKS4NCj4+Pg0KPj4+IExv
Y2tpbmcgb2YgbW0tPmhtbSBpcyBzaGlmdGVkIHRvIHVzZSB0aGUgbW1hcF9zZW0gY29uc2lzdGVu
dGx5IGZvciBhbGwNCj4+PiByZWFkL3dyaXRlIGFuZCB1bmxvY2tlZCBhY2Nlc3NlcyBhcmUgcmVt
b3ZlZC4NCj4+Pg0KPj4+IFRoZSB1c2UgdW5sb2NrZWQgcmVhZHMgb24gJ2htbS0+ZGVhZCcgYXJl
IGFsc28gZWxpbWluYXRlZCBpbiBmYXZvdXIgb2YgdXNpbmcNCj4+PiBzdGFuZGFyZCBtbWdldCgp
IGxvY2tpbmcgdG8gcHJldmVudCB0aGUgbW0gZnJvbSBiZWluZyByZWxlYXNlZC4gTWFueSBvZiB0
aGUNCj4+PiBkZWJ1Z2dpbmcgY2hlY2tzIG9mICFyYW5nZS0+aG1tIGFuZCAhaG1tLT5tbSBhcmUg
ZHJvcHBlZCBpbiBmYXZvdXIgb2YgcG9pc29uIC0NCj4+PiB3aGljaCBpcyBtdWNoIGNsZWFyZXIg
YXMgdG8gdGhlIGxpZmV0aW1lIGludGVudC4NCj4+Pg0KPj4+IFRoZSB0cmFpbGluZyBwYXRjaGVz
IGFyZSBqdXN0IHNvbWUgcmFuZG9tIGNsZWFudXBzIEkgbm90aWNlZCB3aGVuIHJldmlld2luZw0K
Pj4+IHRoaXMgY29kZS4NCj4+Pg0KPj4+IFRoaXMgdjIgaW5jb3Jwb3JhdGVzIGFsb3Qgb2YgdGhl
IGdvb2Qgb2ZmIGxpc3QgY2hhbmdlcyAmIGZlZWRiYWNrIEplcm9tZSBoYWQsDQo+Pj4gYW5kIGFs
bCB0aGUgb24tbGlzdCBjb21tZW50cyB0b28uIEhvd2V2ZXIsIG5vdyB0aGF0IHdlIGhhdmUgdGhl
IHNoYXJlZCBnaXQgSQ0KPj4+IGhhdmUga2VwdCB0aGUgb25lIGxpbmUgY2hhbmdlIHRvIG5vdXZl
YXVfc3ZtLmMgcmF0aGVyIHRoYW4gdGhlIGNvbXBhdA0KPj4+IGZ1bnRpb25zLg0KPj4+DQo+Pj4g
SSBiZWxpZXZlIHdlIGNhbiByZXNvbHZlIHRoaXMgbWVyZ2UgaW4gdGhlIERSTSB0cmVlIG5vdyBh
bmQga2VlcCB0aGUgY29yZQ0KPj4+IG1tL2htbS5jIGNsZWFuLiBEUk0gbWFpbnRhaW5lcnMsIHBs
ZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZy4NCj4+Pg0KPj4+IEl0IGlzIG9uIHRvcCBvZiBo
bW0uZ2l0LCBhbmQgSSBoYXZlIGEgZ2l0IHRyZWUgb2YgdGhpcyBzZXJpZXMgdG8gZWFzZSB0ZXN0
aW5nDQo+Pj4gaGVyZToNCj4+Pg0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9qZ3VudGhvcnBlL2xp
bnV4L3RyZWUvaG1tDQo+Pj4NCj4+PiBUaGVyZSBhcmUgc3RpbGwgc29tZSBvcGVuIGxvY2tpbmcg
aXNzdWVzLCBhcyBJIHRoaW5rIHRoaXMgcmVtYWlucyB1bmFkZHJlc3NlZDoNCj4+Pg0KPj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMTkwNTI3MTk1ODI5LkdCMTgwMTlAbWVs
bGFub3guY29tLw0KPj4+DQo+Pj4gSSdtIGxvb2tpbmcgZm9yIHNvbWUgbW9yZSBhY2tzLCByZXZp
ZXdzIGFuZCB0ZXN0cyBzbyB0aGlzIGNhbiBtb3ZlIGFoZWFkIHRvDQo+Pj4gaG1tLmdpdC4NCj4+
IEFNRCBGb2xrcywgdGhpcyBpcyBsb29raW5nIHByZXR0eSBnb29kIG5vdywgY2FuIHlvdSBwbGVh
c2UgZ2l2ZSBhdA0KPj4gbGVhc3QgYSBUZXN0ZWQtYnkgZm9yIHRoZSBuZXcgZHJpdmVyIGNvZGUg
dXNpbmcgdGhpcyB0aGF0IEkgc2VlIGluDQo+PiBsaW51eC1uZXh0Pw0KPj4NCj4+IFRoYW5rcywN
Cj4+IEphc29uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
