Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4F37D19
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 21:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777778987C;
	Thu,  6 Jun 2019 19:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780044.outbound.protection.outlook.com [40.107.78.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A3889875;
 Thu,  6 Jun 2019 19:16:51 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4027.namprd12.prod.outlook.com (10.255.175.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 19:16:48 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 19:16:48 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 0/2] Two bug-fixes for HMM
Thread-Topic: [PATCH 0/2] Two bug-fixes for HMM
Thread-Index: AQHVB2oFymYy9x0alkiQIwO1y+NKl6aO5X+AgABEcAA=
Date: Thu, 6 Jun 2019 19:16:48 +0000
Message-ID: <c42a620d-ce5f-def3-32e3-1e5482a2540e@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190606151149.GA5506@ziepe.ca>
In-Reply-To: <20190606151149.GA5506@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTXPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::26) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23a128ae-d38f-406b-c7ca-08d6eab385d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4027; 
x-ms-traffictypediagnostic: DM6PR12MB4027:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <DM6PR12MB402768CB7E99D8494D6F8AD692170@DM6PR12MB4027.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(346002)(366004)(39860400002)(199004)(189003)(52116002)(14454004)(64126003)(446003)(2616005)(6486002)(6246003)(186003)(110136005)(11346002)(36756003)(476003)(54906003)(53936002)(8676002)(81166006)(5660300002)(4326008)(81156014)(8936002)(229853002)(58126008)(31686004)(7736002)(316002)(71190400001)(305945005)(25786009)(71200400001)(72206003)(68736007)(966005)(66446008)(99286004)(86362001)(478600001)(2501003)(66556008)(65826007)(66946007)(73956011)(66476007)(2906002)(3846002)(26005)(6306002)(31696002)(65956001)(6116002)(386003)(64756008)(76176011)(6506007)(6436002)(53546011)(14444005)(256004)(102836004)(486006)(65806001)(66066001)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4027;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QpG9T5HUFKMJHNAVDlvCtxmyvRw7IXvZGKHdvxqbq+rM06vbLMjL8xqOb5w8jH4JxE5Pk45hgWn6HNBBdI0ndJDfTuYP/0j3a0LEZ2ZUrk7j2ANjjlcHUJb2Sxj5ZKIAxTWQtkpEindV4lHeK4TiEJ798aNGrb+XOkP8o9oq98/gesXWfsDy2DhSA6LVY7d7BSyjH+mTPMNmmM4a7pREEZGl+mhInvLpEB+5w716/OPPafCwcfq8YC4Ml1YnIrt6NCgOOQGQQakBIUbl7EsrbY6qxTevQJo55PypcawH2MunxKXmX+EB7sM3RRPCu5e0rXCccdEdgbcSy36dZUjDfszKANCvVM5wbceGT+Ta96aW+lmQQ5nyCh4TgEDVcJZl0/MowTZUXCSXtCRUb//3DMn2bUXsJmxlbG5eMpAIKKc=
Content-ID: <79C2832BC9AA964E8E8B7E20866316B4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a128ae-d38f-406b-c7ca-08d6eab385d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 19:16:48.8082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4027
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl28ERR4B1qNKjC3grRteB0hkgU9TBAofV9QLwC2OdQ=;
 b=gFNzdADjQfwCI5ricYHbcY/Q3k29A4JYb+Og3NNhA8+REGr9kNXFJY/Iyd1M94asE58iQBDyaI5eHCGA71GvA2kRIqRD8DuIzCE6mFOThgBtj5PvtNKTjv4Ls6Oe1Vu5VTXGSqqeAQbTmNIq5SaU7R/oV0QCCIcLWHb4JIinLCY=
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W3Jlc2VudCB3aXRoIGNvcnJlY3QgYWRkcmVzcyBmb3IgQWxleF0NCg0KT24gMjAxOS0wNi0wNiAx
MToxMSBhLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQoNCj4gT24gRnJpLCBNYXkgMTAsIDIw
MTkgYXQgMDc6NTM6MjFQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4gVGhlc2Ug
cHJvYmxlbXMgd2VyZSBmb3VuZCBpbiBBTUQtaW50ZXJuYWwgdGVzdGluZyBhcyB3ZSdyZSB3b3Jr
aW5nIG9uDQo+PiBhZG9wdGluZyBITU0uIFRoZXkgYXJlIHJlYmFzZWQgYWdhaW5zdCBnbGlzc2Uv
aG1tLTUuMi12My4gV2UnZCBsaWtlIA0KPj4gdG8gZ2V0DQo+PiB0aGVtIGFwcGxpZWQgdG8gYSBt
YWlubGluZSBMaW51eCBrZXJuZWwgYXMgd2VsbCBhcyBkcm0tbmV4dCBhbmQNCj4+IGFtZC1zdGFn
aW5nLWRybS1uZXh0IHNvb25lciByYXRoZXIgdGhhbiBsYXRlci4NCj4+DQo+PiBDdXJyZW50bHkg
dGhlIEhNTSBpbiBhbWQtc3RhZ2luZy1kcm0tbmV4dCBpcyBxdWl0ZSBmYXIgYmVoaW5kIGhtbS01
LjItdjMsDQo+PiBidXQgdGhlIGRyaXZlciBjaGFuZ2VzIGZvciBITU0gYXJlIGV4cGVjdGVkIHRv
IGxhbmQgaW4gNS4yIGFuZCB3aWxsIA0KPj4gbmVlZCB0bw0KPj4gYmUgcmViYXNlZCBvbiB0aG9z
ZSBITU0gY2hhbmdlcy4NCj4+DQo+PiBJJ2QgbGlrZSB0byB3b3JrIG91dCBhIGZsb3cgYmV0d2Vl
biBKZXJvbWUsIERhdmUsIEFsZXggYW5kIG15c2VsZiB0aGF0DQo+PiBhbGxvd3MgdXMgdG8gdGVz
dCB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgSE1NIG9uIGFtZC1zdGFnaW5nLWRybS1uZXh0IHNvDQo+
PiB0aGF0IGlkZWFsbHkgZXZlcnl0aGluZyBjb21lcyB0b2dldGhlciBpbiBtYXN0ZXIgd2l0aG91
dCBtdWNoIG5lZWQgZm9yDQo+PiByZWJhc2luZyBhbmQgcmV0ZXN0aW5nLg0KPiBJIHRoaW5rIHdl
IGhhdmUgdGhhdCBub3csIEknbSBydW5uaW5nIGEgaG1tLmdpdCB0aGF0IGlzIGNsZWFuIGFuZCBj
YW4NCj4gYmUgdXNlZCBmb3IgbWVyZ2luZyBpbnRvIERSTSByZWxhdGVkIHRyZWVzIChhbmQgUkRN
QSkuIEkndmUgY29tbWl0ZWQNCj4gdG8gc2VuZCB0aGlzIHRyZWUgdG8gTGludXMgYXQgdGhlIHN0
YXJ0IG9mIHRoZSBtZXJnZSB3aW5kb3cuDQo+DQo+IFNlZSBoZXJlOg0KPg0KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMTkwNTI0MTI0NDU1LkdCMTY4NDVAemllcGUuY2EvDQo+DQo+
IFRoZSB0cmVlIGlzIGhlcmU6DQo+DQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3JkbWEvcmRtYS5naXQvbG9nLz9oPWhtbQ0KPg0KPiBIb3dldmVyIHBs
ZWFzZSBjb25zdWx0IHdpdGggbWUgYmVmb3JlIG1ha2luZyBhIG1lcmdlIGNvbW1pdCB0byBiZQ0K
PiBjby1vcmRpbmF0ZWQuIFRoYW5rcw0KPg0KPiBJIHNlZSBpbiB0aGlzIHRocmVhZCB0aGF0IEFN
REdQVSBtaXNzZWQgNS4yIGJlYWNhdXNlIG9mIHRoZQ0KPiBjby1vcmRpbmF0aW9uIHByb2JsZW1z
IHRoaXMgdHJlZSBpcyBpbnRlbmRlZCB0byBzb2x2ZSwgc28gSSdtIHZlcnkNCj4gaG9wZWZ1bCB0
aGlzIHdpbGwgaGVscCB5b3VyIHdvcmsgbW92ZSBpbnRvIDUuMyENCg0KVGhhbmtzIEphc29uLiBP
dXIgdHdvIHBhdGNoZXMgYmVsb3cgd2VyZSBhbHJlYWR5IGluY2x1ZGVkIGluIHRoZSBNTSB0cmVl
IA0KKGh0dHBzOi8vb3psYWJzLm9yZy9+YWtwbS9tbW90cy9icm9rZW4tb3V0LykuIFdpdGggeW91
ciBuZXcgaG1tLmdpdCwgDQpkb2VzIHRoYXQgbWVhbiBITU0gZml4ZXMgYW5kIGNoYW5nZXMgd2ls
bCBubyBsb25nZXIgZ28gdGhyb3VnaCBBbmRyZXcgDQpNb3J0b24gYnV0IGRpcmVjdGx5IHRocm91
Z2ggeW91ciB0cmVlIHRvIExpbnVzPw0KDQpXZSBoYXZlIGFsc28gYXBwbGllZCB0aGUgdHdvIHBh
dGNoZXMgdG8gb3VyIGludGVybmFsIHRyZWUgd2hpY2ggaXMgDQpjdXJyZW50bHkgYmFzZWQgb24g
NS4yLXJjMSBzbyB3ZSBjYW4gbWFrZSBwcm9ncmVzcy4NCg0KQWxleCwgSSB0aGluayBtZXJnaW5n
IGhtbSB3b3VsZCBiZSBhbiBleHRyYSBzdGVwIGV2ZXJ5IHRpbWUgeW91IHJlYmFzZSANCmFtZC1z
dGFnaW5nLWRybS1uZXh0LiBXZSBjb3VsZCBwcm9iYWJseSBhbHNvIG1lcmdlIGhtbSBhdCBvdGhl
ciB0aW1lcyBhcyANCm5lZWRlZC4gRG8geW91IHRoaW5rIHRoaXMgd291bGQgY2F1c2UgdHJvdWJs
ZSBvciBjb25mdXNpb24gZm9yIA0KdXBzdHJlYW1pbmcgdGhyb3VnaCBkcm0tbmV4dD8NCg0KUmVn
YXJkcywNCiDCoCBGZWxpeA0KDQoNCj4NCj4+IE1heWJlIGhhdmluZyBKZXJvbWUncyBsYXRlc3Qg
SE1NIGNoYW5nZXMgaW4gZHJtLW5leHQuIEhvd2V2ZXIsIHRoYXQgbWF5DQo+PiBjcmVhdGUgZGVw
ZW5kZW5jaWVzIHdoZXJlIEplcm9tZSBhbmQgRGF2ZSBuZWVkIHRvIGNvb3JkaW5hdGUgdGhlaXIg
cHVsbC0NCj4+IHJlcXVlc3RzIGZvciBtYXN0ZXIuDQo+Pg0KPj4gRmVsaXggS3VlaGxpbmcgKDEp
Og0KPj4gbW0vaG1tOiBPbmx5IHNldCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIGZvciBub24tYmxv
Y2tpbmcNCj4+DQo+PiBQaGlsaXAgWWFuZyAoMSk6DQo+PiBtbS9obW06IHN1cHBvcnQgYXV0b21h
dGljIE5VTUEgYmFsYW5jaW5nDQo+IEkndmUgYXBwbGllZCBib3RoIG9mIHRoZXNlIHBhdGNoZXMg
d2l0aCBKZXJvbWUncyBSZXZpZXdlZC1ieSB0bw0KPiBobW0uZ2l0IGFuZCBhZGRlZCB0aGUgbWlz
c2VkIFNpZ25lZC1vZmYtYnkNCj4NCj4gSWYgeW91IHRlc3QgYW5kIGNvbmZpcm0gSSB0aGluayB0
aGlzIGJyYW5jaCB3b3VsZCBiZSByZWFkeSBmb3IgbWVyZ2luZw0KPiB0b3dhcmQgdGhlIEFNRCB0
cmVlLg0KPiBSZWdhcmRzLA0KPiBKYXNvbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
