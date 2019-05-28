Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96D2CD88
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D1E6E043;
	Tue, 28 May 2019 17:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710063.outbound.protection.outlook.com [40.107.71.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEA76E043
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 17:23:32 +0000 (UTC)
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) by
 DM6PR12MB3052.namprd12.prod.outlook.com (20.178.30.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 17:23:31 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555]) by DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 17:23:31 +0000
From: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
To: Thomas Hellstrom <thomas@shipmail.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEkKKUtJTyHZOak+VJIfcFQoAYqaAKlUAgAAmFwCAAFo8gIAAAdIAgAAJNYCAAApLAIAAAUqAgAAH0ACAAAF8gIAABQsA
Date: Tue, 28 May 2019 17:23:31 +0000
Message-ID: <7124da0b-399a-81a3-dfca-b2ce64d73072@amd.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
 <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
 <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
 <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
 <5b1b3f22-beea-16c4-a98f-9e632b408020@amd.com>
 <6b9b8536-bfea-5817-06e4-23881b86ab31@shipmail.org>
 <cc1d736d-9a8f-03d0-26ab-60a686ad71bd@amd.com>
 <a1bdbae7-009a-85ad-beb1-f938995274db@amd.com>
 <6dac8c560f75cae65e81a0f6466cbfdb270575e8.camel@vmware.com>
 <4b22c4ed-1d66-0aff-51a2-7a1ddb411878@amd.com>
 <1325ba3d-55f6-8b3c-c4b0-b0cc7b1a9d29@amd.com>
 <9da98001-1636-768d-e477-b96611406944@shipmail.org>
In-Reply-To: <9da98001-1636-768d-e477-b96611406944@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN2PR01CA0054.prod.exchangelabs.com (2603:10b6:800::22) To
 DM6PR12MB3163.namprd12.prod.outlook.com
 (2603:10b6:5:182::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9224a33d-ebdc-4ac5-b9e4-08d6e3913428
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3052; 
x-ms-traffictypediagnostic: DM6PR12MB3052:
x-microsoft-antispam-prvs: <DM6PR12MB3052E72D2F97B9919515C65BEC1E0@DM6PR12MB3052.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(51914003)(189003)(110136005)(66476007)(66556008)(66446008)(54906003)(64756008)(2906002)(229853002)(71200400001)(6506007)(66946007)(81166006)(81156014)(52116002)(4326008)(71190400001)(8676002)(102836004)(26005)(68736007)(386003)(99286004)(72206003)(73956011)(31696002)(186003)(478600001)(53936002)(8936002)(31686004)(86362001)(11346002)(3846002)(446003)(486006)(305945005)(76176011)(476003)(14454004)(6246003)(2616005)(36756003)(6116002)(6486002)(5660300002)(256004)(14444005)(7736002)(66066001)(25786009)(6512007)(53546011)(316002)(6436002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3052;
 H:DM6PR12MB3163.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EU4br3+OnTDvhHFvcgGkm5funjy099+2S2+jDhmXYyUxvBeQ7wMEAe6Z377WEjQOHnZsO7+S1jVPqn+VMfYrv0kaWIiUtdcBF+x20qqbyP6p7qz8sYl9YqvXCa+9smKUHpZosSzfpfGvfILUUAbkI30OMDhPyWtJVb1p1gSESSoWkG6yhj27ywz4oNxfBeObVaCSLg2sz2v5hMmEik/t5Tyo7T2APeNfIYLQkZU0/xNL9KCkemK8ootbSPwgrS4iGdSgnor/G5GUw5LCXGsOCTkGxaalgWNVB81lLMxdatSdij6Nft3ZQqRQpc/3gZ6upcceSefTE4Dvb0+mwitvRyqjh819zQbiKaGwI5DI6ZoHl1ZVXpyosyI0N9zQB27n7+FN19j++biWqDBCBEmhS4k2vTrHH4cIDPTBgbVBSg8=
Content-ID: <66958F29BBA3E34EB30EF984598B6CD3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9224a33d-ebdc-4ac5-b9e4-08d6e3913428
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 17:23:31.0637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlendack@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTh06UYtHaQeJmbR5iBpakgfDzyO2C7hHpzg0U7ls0Y=;
 b=HoJZzIZzOZUttQFnQtTvdfI080RXGb0wzKLLVDP5zyRDu7bOMRaYu6UNbExhKDPwHv3Ww57oJz1yYH0rFvvkqQwtR9GvgXxvcZQfnRssPFnNBbI87YV22nXdh6aQgYx445XpMbG3gIawkSSR70UnGIjZY75aJ4P+jFD2vzlGSKc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thomas.Lendacky@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yOC8xOSAxMjowNSBQTSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToNCj4gT24gNS8yOC8x
OSA3OjAwIFBNLCBMZW5kYWNreSwgVGhvbWFzIHdyb3RlOg0KPj4gT24gNS8yOC8xOSAxMTozMiBB
TSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+Pj4gQW0gMjguMDUuMTkgdW0gMTg6Mjcgc2No
cmllYiBUaG9tYXMgSGVsbHN0cm9tOg0KPj4+PiBPbiBUdWUsIDIwMTktMDUtMjggYXQgMTU6NTAg
KzAwMDAsIExlbmRhY2t5LCBUaG9tYXMgd3JvdGU6DQo+Pj4+PiBPbiA1LzI4LzE5IDEwOjE3IEFN
LCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+Pj4+PiBIaSBUaG9tYXMsDQo+Pj4+Pj4NCj4+
Pj4+PiBBbSAyOC4wNS4xOSB1bSAxNzoxMSBzY2hyaWViIFRob21hcyBIZWxsc3Ryb206DQo+Pj4+
Pj4+IEhpLCBUb20sDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoYW5rcyBmb3IgdGhlIHJlcGx5LiBUaGUg
cXVlc3Rpb24gaXMgbm90IGdyYXBoaWNzIHNwZWNpZmljLCBidXQNCj4+Pj4+Pj4gbGllcw0KPj4+
Pj4+PiBpbiB5b3VyIGFuc3dlciBmdXJ0aGVyIGJlbG93Og0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiA1
LzI4LzE5IDQ6NDggUE0sIExlbmRhY2t5LCBUaG9tYXMgd3JvdGU6DQo+Pj4+Pj4+PiBPbiA1LzI4
LzE5IDI6MzEgQU0sIFRob21hcyBIZWxsc3Ryb20gd3JvdGU6DQo+Pj4+Pj4+PiBbU05JUF0NCj4+
Pj4+Pj4+IEFzIGZvciBrZXJuZWwgdm1hcHMgYW5kIHVzZXItbWFwcywgdGhvc2UgcGFnZXMgd2ls
bCBiZSBtYXJrZWQNCj4+Pj4+Pj4+IGVuY3J5cHRlZA0KPj4+Pj4+Pj4gKHVubGVzcyBleHBsaWNp
dGx5IG1hZGUgdW4tZW5jcnlwdGVkIGJ5IGNhbGxpbmcNCj4+Pj4+Pj4+IHNldF9tZW1vcnlfZGVj
cnlwdGVkKCkpLg0KPj4+Pj4+Pj4gQnV0LCBpZiB5b3UgYXJlIGNvcHlpbmcgdG8vZnJvbSB0aG9z
ZSBhcmVhcyBpbnRvIHRoZSB1bi0NCj4+Pj4+Pj4+IGVuY3J5cHRlZCBETUENCj4+Pj4+Pj4+IGFy
ZWEgdGhlbiBldmVyeXRoaW5nIHdpbGwgYmUgb2suDQo+Pj4+Pj4+IFRoZSBxdWVzdGlvbiBpcyBy
ZWdhcmRpbmcgdGhlIGFib3ZlIHBhcmFncmFwaC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQUZBSUNULMKg
IHNldF9tZW1vcnlfZGVjcnlwdGVkKCkgb25seSBjaGFuZ2VzIHRoZSBmaXhlZCBrZXJuZWwgbWFw
DQo+Pj4+Pj4+IFBURXMuDQo+Pj4+Pj4+IEJ1dCB3aGVuIHNldHRpbmcgdXAgb3RoZXIgYWxpYXNl
ZCBQVEVzIHRvIHRoZSBleGFjdCBzYW1lDQo+Pj4+Pj4+IGRlY3J5cHRlZA0KPj4+Pj4+PiBwYWdl
cywgZm9yIGV4YW1wbGUgdXNpbmcgZG1hX21tYXBfY29oZXJlbnQoKSwNCj4+Pj4+Pj4ga21hcF9h
dG9taWNfcHJvdCgpLA0KPj4+Pj4+PiB2bWFwKCkgZXRjLiBXaGF0IGNvZGUgaXMgcmVzcG9uc2li
bGUgZm9yIGNsZWFyaW5nIHRoZSBlbmNyeXB0ZWQNCj4+Pj4+Pj4gZmxhZw0KPj4+Pj4+PiBvbiB0
aG9zZSBQVEVzPyBJcyB0aGVyZSBzb21ldGhpbmcgaW4gdGhlIHg4NiBwbGF0Zm9ybSBjb2RlIGRv
aW5nDQo+Pj4+Pj4+IHRoYXQ/DQo+Pj4+Pj4gVG9tIGFjdHVhbGx5IGV4cGxhaW5lZCB0aGlzOg0K
Pj4+Pj4+PiBUaGUgZW5jcnlwdGlvbiBiaXQgaXMgYml0LTQ3IG9mIGEgcGh5c2ljYWwgYWRkcmVz
cy4NCj4+Pj4+PiBJbiBvdGhlciB3b3JkcyBzZXRfbWVtb3J5X2RlY3J5cHRlZCgpIGNoYW5nZXMg
dGhlIHBoeXNpY2FsIGFkZHJlc3MNCj4+Pj4+PiBpbg0KPj4+Pj4+IHRoZSBQVEVzIG9mIHRoZSBr
ZXJuZWwgbWFwcGluZyBhbmQgYWxsIG90aGVyIHVzZSBjYXNlcyBqdXN0IGNvcHkNCj4+Pj4+PiB0
aGF0DQo+Pj4+Pj4gZnJvbSB0aGVyZS4NCj4+Pj4+IEV4Y2VwdCBJIGRvbid0IHRoaW5rIHRoZSBQ
VEUgYXR0cmlidXRlcyBhcmUgY29waWVkIGZyb20gdGhlIGtlcm5lbA0KPj4+Pj4gbWFwcGluZw0K
Pj4+PiArMSENCj4+Pj4NCj4+Pj4+IGluIHNvbWUgY2FzZXMuIEZvciBleGFtcGxlLCBkbWFfbW1h
cF9jb2hlcmVudCgpIHdpbGwgY3JlYXRlIHRoZSBzYW1lDQo+Pj4+PiB2bV9wYWdlX3Byb3QgdmFs
dWUgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIG9yIG5vdCB0aGUgdW5kZXJseWluZyBtZW1vcnkNCj4+
Pj4+IGlzDQo+Pj4+PiBlbmNyeXB0ZWQgb3Igbm90LiBCdXQga21hcF9hdG9taWNfcHJvdCgpIHdp
bGwgcmV0dXJuIHRoZSBrZXJuZWwNCj4+Pj4+IHZpcnR1YWwNCj4+Pj4+IGFkZHJlc3Mgb2YgdGhl
IHBhZ2UsIHNvIHRoYXQgd291bGQgYmUgZmluZS4NCj4+Pj4gWWVzLCBvbiA2NC1iaXQgc3lzdGVt
cy4gT24gMzItYml0IHN5c3RlbXMgKGRvIHRoZXkgZXhpc3Qgd2l0aCBTRVY/KSwNCj4+Pj4gdGhl
eSBkb24ndC4NCj4+PiBJIGRvbid0IHRoaW5rIHNvLCBidXQgZmVlbCBmcmVlIHRvIHByb3ZlIG1l
IHdyb25nIFRvbS4NCj4+IFNFViBpcyA2NC1iaXQgb25seS4NCj4gDQo+IEFuZCBJIGp1c3Qgbm90
aWNlZCB0aGF0IGttYXBfYXRvbWljX3Byb3QoKSBpbmRlZWQgcmV0dXJucyB0aGUga2VybmVsIG1h
cA0KPiBhbHNvIGZvciAzMi1iaXQgbG93bWVtLg0KPiANCj4+DQo+Pj4+IEFuZCBzaW1pbGFybHkg
VFRNIHVzZXItc3BhY2UgbWFwcGluZ3MgYW5kIHZtYXAoKSBkb2Vzbid0IGNvcHkgZnJvbSB0aGUN
Cj4+Pj4ga2VybmVsIG1hcCBlaXRoZXIswqAgc28gSSB0aGluayB3ZSBhY3R1YWxseSBkbyBuZWVk
IHRvIG1vZGlmeSB0aGUgcGFnZS0NCj4+Pj4gcHJvdCBsaWtlIGRvbmUgaW4gdGhlIHBhdGNoLg0K
Pj4+IFdlbGwgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGlzIHdvbid0IGhhdmUgYW55IGVmZmVjdC4N
Cj4+Pg0KPj4+IEFzIFRvbSBleHBsYWluZWQgZW5jcnlwdGlvbiBpcyBub3QgaW1wbGVtZW50ZWQg
YXMgYSBwYWdlIHByb3RlY3Rpb24gYml0LA0KPj4+IGJ1dCByYXRoZXIgYXMgcGFydCBvZiB0aGUg
cGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgcGFydC4NCj4+IFRoaXMgaXMgd2hlcmUgdGhpbmdzIGdl
dCBpbnRlcmVzdGluZy7CoCBFdmVuIHRob3VnaCB0aGUgZW5jcnlwdGlvbiBiaXQgaXMNCj4+IHBh
cnQgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3MgKGUuZy4gdW5kZXIgU01FIHRoZSBkZXZpY2UgY291
bGQvd291bGQgdXNlIGFuDQo+PiBhZGRyZXNzIHdpdGggdGhlIGVuY3J5cHRpb24gYml0IHNldCks
IGl0IGlzIGltcGxlbWVudGVkIGFzIHBhcnQgb2YgdGhlIFBURQ0KPj4gYXR0cmlidXRlcy4gU28s
IGZvciBleGFtcGxlLCB1c2luZyBfUEFHRV9FTkMgd2hlbiBidWlsZGluZyBhIHBncHJvdCB2YWx1
ZQ0KPj4gd291bGQgcHJvZHVjZSBhbiBlbnRyeSB3aXRoIHRoZSBlbmNyeXB0aW9uIGJpdCBzZXQu
DQo+Pg0KPj4gQW5kIHRoZSB0aGluZyB0byB3YXRjaCBvdXQgZm9yIGlzIHVzaW5nIHR3byB2aXJ0
dWFsIGFkZHJlc3NlcyB0aGF0IHBvaW50DQo+PiB0byB0aGUgc2FtZSBwaHlzaWNhbCBhZGRyZXNz
IChwYWdlKSBpbiBEUkFNIGJ1dCBvbmUgaGFzIHRoZSBlbmNyeXB0aW9uIGJpdA0KPj4gc2V0IGFu
ZCBvbmUgZG9lc24ndC4gVGhlIGhhcmR3YXJlIGRvZXMgbm90IGVuZm9yY2UgY29oZXJlbmN5IGJl
dHdlZW4gYW4NCj4+IGVuY3J5cHRlZCBhbmQgdW4tZW5jcnlwdGVkIG1hcHBpbmcgb2YgdGhlIHNh
bWUgcGh5c2ljYWwgYWRkcmVzcyAocGFnZSkuDQo+PiBTZWUgc2VjdGlvbiA3LjEwLjYgb2YgdGhl
IEFNRDY0IEFyY2hpdGVjdHVyZSBQcm9ncmFtbWVyJ3MgTWFudWFsIFZvbHVtZSAyLg0KPiANCj4g
SW5kZWVkLiBBbmQgSSdtIHByZXR0eSBzdXJlIHRoZSBrZXJuZWwgbWFwIFBURSBhbmQgYSBUVE0g
LyB2bWFwIFBURQ0KPiBwb2ludGluZyB0byB0aGUgc2FtZSBkZWNyeXB0ZWQgcGFnZSBkaWZmZXIg
aW4gdGhlIGVuY3J5cHRpb24gYml0ICg0NykNCj4gc2V0dGluZy4NCj4gDQo+IEJ1dCBvbiB0aGUg
aHlwZXJ2aXNvciB0aGF0IHdvdWxkIHNvcnQgb2Ygd29yaywgYmVjYXVzZSBmcm9tIHdoYXQgSQ0K
PiB1bmRlcnN0YW5kIHdpdGggU0VWIHdlIHNlbGVjdCBiZXR3ZWVuIHRoZSBndWVzdCBrZXkgYW5k
IHRoZSBoeXBlcnZpc29yDQo+IGtleSB3aXRoIHRoYXQgYml0LiBPbiB0aGUgaHlwZXJ2aXNvciBi
b3RoIGtleXMgYXJlIHRoZSBzYW1lPyBPbiBhIGd1ZXN0DQo+IGl0IHdvdWxkIHByb2JhYmx5IGJy
ZWFrLg0KDQpGb3IgU0VWLCBpZiB0aGUgZW5jcnlwdGlvbiBiaXQgaXMgc2V0IHRoZW4gdGhlIGd1
ZXN0IGtleSBpcyB1c2VkLiBJZiB0aGUNCmVuY3J5cHRpb24gYml0IGlzIG5vdCBzZXQsIHRoZW4g
dGhlIGh5cGVydmlzb3Iga2V5IGlzIHVzZWQgSUZGIHRoZQ0KZW5jcnlwdGlvbiBiaXQgaXMgc2V0
IGluIHRoZSBoeXBlcnZpc29yIHBhZ2UgdGFibGVzLiAgWW91IGNhbiBoYXZlIFNFVg0KZ3Vlc3Rz
IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBTTUUgaXMgYWN0aXZlIChub3RlLCB0aGVyZSBpcyBhIGRp
ZmZlcmVuY2UNCmJldHdlZW4gU01FIGJlaW5nIGVuYWJsZWQgdnMuIFNNRSBiZWluZyBhY3RpdmUp
Lg0KDQpGb3IgU01FLCB0aGVyZSBpcyBvbmx5IG9uZSBrZXkuIFRoZSBlbmNyeXB0aW9uIGJpdCBk
ZXRlcm1pbmVzIHdoZXRoZXIgdGhlDQpkYXRhIGlzIHJ1biB0aHJvdWdoIHRoZSBlbmNyeXB0aW9u
IHByb2Nlc3Mgb3Igbm90Lg0KDQpUaGFua3MsDQpUb20NCg0KPiANCj4gL1Rob21hcw0KPiANCj4+
DQo+PiBUaGFua3MsDQo+PiBUb20NCj4+DQo+Pj4gSSBoYXZlIG5vIGlkZWEgaG93IHRoYXQgaXMg
YWN0dWFsbHkgaGFuZGxlZCB0aG91Z2h0LA0KPj4+IENocmlzdGlhbi4NCj4+Pg0KPj4+PiAvVGhv
bWFzDQo+Pj4+DQo+Pj4+PiBUaGlzIGlzIGFuIGFyZWEgdGhhdCBuZWVkcyBsb29raW5nIGludG8g
dG8gYmUgc3VyZSBpdCBpcyB3b3JraW5nDQo+Pj4+PiBwcm9wZXJseQ0KPj4+Pj4gd2l0aCBTTUUg
YW5kIFNFVi4NCj4+Pj4+DQo+Pj4+PiBUaGFua3MsDQo+Pj4+PiBUb20NCj4+Pj4+DQo+Pj4+Pj4g
VGhhdCdzIHJhdGhlciBuaWZ0eSwgYmVjYXVzZSB0aGlzIHdheSBldmVyeWJvZHkgd2lsbCBlaXRo
ZXIgdXNlIG9yDQo+Pj4+Pj4gbm90DQo+Pj4+Pj4gdXNlIGVuY3J5cHRpb24gb24gdGhlIHBhZ2Uu
DQo+Pj4+Pj4NCj4+Pj4+PiBDaHJpc3RpYW4uDQo+Pj4+Pj4NCj4+Pj4+Pj4gVGhhbmtzLA0KPj4+
Pj4+PiBUaG9tYXMNCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoaW5ncyBnZXQgZnV6enkg
Zm9yIG1lIHdoZW4gaXQgY29tZXMgdG8gdGhlIEdQVSBhY2Nlc3Mgb2YgdGhlDQo+Pj4+Pj4+PiBt
ZW1vcnkNCj4+Pj4+Pj4+IGFuZCB3aGF0IGFuZCBob3cgaXQgaXMgYWNjZXNzZWQuDQo+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4gVGhhbmtzLA0KPj4+Pj4+Pj4gVG9tDQo+IA0KPiANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
