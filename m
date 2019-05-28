Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044BB2CC0A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820D6E245;
	Tue, 28 May 2019 16:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720072.outbound.protection.outlook.com [40.107.72.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D636E245
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:32:12 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2405.namprd12.prod.outlook.com (52.132.141.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 16:32:09 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 16:32:09 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Thomas Hellstrom <thellstrom@vmware.com>, "Lendacky, Thomas"
 <Thomas.Lendacky@amd.com>, "thomas@shipmail.org" <thomas@shipmail.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEghVWyfc42SAm0iQ56wuAPU/AaZ589eAgAAJjQCAAAwvAIAABk4AgAAFh4CAABf0gIAAB2kAgAAsKICABcndAIAAeesAgAAGZ4CAAAHLAIAACT0AgAAKSwCAAAFDgA==
Date: Tue, 28 May 2019 16:32:09 +0000
Message-ID: <4b22c4ed-1d66-0aff-51a2-7a1ddb411878@amd.com>
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
In-Reply-To: <6dac8c560f75cae65e81a0f6466cbfdb270575e8.camel@vmware.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:206:15::34) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36475e21-d9f7-4c4e-0f7a-08d6e38a0780
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2405; 
x-ms-traffictypediagnostic: DM5PR12MB2405:
x-microsoft-antispam-prvs: <DM5PR12MB24053C3268F3393CC3A090C2831E0@DM5PR12MB2405.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(346002)(39860400002)(376002)(189003)(199004)(51914003)(31686004)(71190400001)(71200400001)(64126003)(76176011)(256004)(229853002)(53546011)(6506007)(386003)(478600001)(14444005)(14454004)(86362001)(7736002)(52116002)(99286004)(53936002)(6486002)(2501003)(65826007)(31696002)(102836004)(36756003)(25786009)(446003)(81166006)(4326008)(54906003)(5660300002)(476003)(65956001)(58126008)(68736007)(6512007)(72206003)(305945005)(46003)(2906002)(486006)(66556008)(66446008)(64756008)(6246003)(186003)(66476007)(316002)(2616005)(8676002)(8936002)(81156014)(65806001)(11346002)(6436002)(66946007)(73956011)(6116002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2405;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GW3LmwKZPzybmFw64rRKZ4EhgKf9lQmzrTdfwrdKL62dTq8nBXt/AbPLc3rvig6jyQt6rPZ3k1vMqOVO1JZd9Q5KrQtSu7jsl7me/FQqPp3Dj1oNup/jw7Ke8RyYoWIbeQdoui4PvlkQlpAH/nPf0/FDTWYGqGiiV6hTi/8GHySxbd5Io+siLH2rElQ6ZTH0G4jq7brY5XJKoRRff+T3v73kS1QqmiJ/vbbPegBAq4Hr2wYeU7MmrqOdGYa8bmLnQOxaEemNyu0kOIS4PB7Unbk41mkyQ3BDm5eGi0OHr4DnY8amEjuBavEcBkmhkUro2Nj3J59ro0FG7waexy4Jp10UFKmKUea9GiYwbqbKckV5OJVg1lZtPfBDQOIYCSlE/ooHxPWz1FRWqCro6mnJLDguzA9Xl5c2Gkw5vGwuql4=
Content-ID: <3A6827220EB55943927B0AE3E69AA039@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36475e21-d9f7-4c4e-0f7a-08d6e38a0780
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 16:32:09.6203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvO0sQUtPWY3iO+XPAL8nrcMeProupCfcwad3e3pZZk=;
 b=DLge3T97HQBPWPnsNGV+7xSQV4sDKM2OGuFDwz7EaV2DYygJxMa22Dpyrzz9tSRkEq56rK4tiJIrjo6WSoJe7k2YAu1D8f210H5JTFD2I12W4ssTBlmSYqhTnj5oqjnEZtFn/A39v+bc/1lQY8mBC4MUATWwszLlbgufWD1QReM=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDUuMTkgdW0gMTg6Mjcgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOg0KPiBPbiBUdWUs
IDIwMTktMDUtMjggYXQgMTU6NTAgKzAwMDAsIExlbmRhY2t5LCBUaG9tYXMgd3JvdGU6DQo+PiBP
biA1LzI4LzE5IDEwOjE3IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+PiBIaSBUaG9t
YXMsDQo+Pj4NCj4+PiBBbSAyOC4wNS4xOSB1bSAxNzoxMSBzY2hyaWViIFRob21hcyBIZWxsc3Ry
b206DQo+Pj4+IEhpLCBUb20sDQo+Pj4+DQo+Pj4+IFRoYW5rcyBmb3IgdGhlIHJlcGx5LiBUaGUg
cXVlc3Rpb24gaXMgbm90IGdyYXBoaWNzIHNwZWNpZmljLCBidXQNCj4+Pj4gbGllcw0KPj4+PiBp
biB5b3VyIGFuc3dlciBmdXJ0aGVyIGJlbG93Og0KPj4+Pg0KPj4+PiBPbiA1LzI4LzE5IDQ6NDgg
UE0sIExlbmRhY2t5LCBUaG9tYXMgd3JvdGU6DQo+Pj4+PiBPbiA1LzI4LzE5IDI6MzEgQU0sIFRo
b21hcyBIZWxsc3Ryb20gd3JvdGU6DQo+Pj4+PiBbU05JUF0NCj4+Pj4+IEFzIGZvciBrZXJuZWwg
dm1hcHMgYW5kIHVzZXItbWFwcywgdGhvc2UgcGFnZXMgd2lsbCBiZSBtYXJrZWQNCj4+Pj4+IGVu
Y3J5cHRlZA0KPj4+Pj4gKHVubGVzcyBleHBsaWNpdGx5IG1hZGUgdW4tZW5jcnlwdGVkIGJ5IGNh
bGxpbmcNCj4+Pj4+IHNldF9tZW1vcnlfZGVjcnlwdGVkKCkpLg0KPj4+Pj4gQnV0LCBpZiB5b3Ug
YXJlIGNvcHlpbmcgdG8vZnJvbSB0aG9zZSBhcmVhcyBpbnRvIHRoZSB1bi0NCj4+Pj4+IGVuY3J5
cHRlZCBETUENCj4+Pj4+IGFyZWEgdGhlbiBldmVyeXRoaW5nIHdpbGwgYmUgb2suDQo+Pj4+IFRo
ZSBxdWVzdGlvbiBpcyByZWdhcmRpbmcgdGhlIGFib3ZlIHBhcmFncmFwaC4NCj4+Pj4NCj4+Pj4g
QUZBSUNULCAgc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSBvbmx5IGNoYW5nZXMgdGhlIGZpeGVkIGtl
cm5lbCBtYXANCj4+Pj4gUFRFcy4NCj4+Pj4gQnV0IHdoZW4gc2V0dGluZyB1cCBvdGhlciBhbGlh
c2VkIFBURXMgdG8gdGhlIGV4YWN0IHNhbWUNCj4+Pj4gZGVjcnlwdGVkDQo+Pj4+IHBhZ2VzLCBm
b3IgZXhhbXBsZSB1c2luZyBkbWFfbW1hcF9jb2hlcmVudCgpLA0KPj4+PiBrbWFwX2F0b21pY19w
cm90KCksDQo+Pj4+IHZtYXAoKSBldGMuIFdoYXQgY29kZSBpcyByZXNwb25zaWJsZSBmb3IgY2xl
YXJpbmcgdGhlIGVuY3J5cHRlZA0KPj4+PiBmbGFnDQo+Pj4+IG9uIHRob3NlIFBURXM/IElzIHRo
ZXJlIHNvbWV0aGluZyBpbiB0aGUgeDg2IHBsYXRmb3JtIGNvZGUgZG9pbmcNCj4+Pj4gdGhhdD8N
Cj4+PiBUb20gYWN0dWFsbHkgZXhwbGFpbmVkIHRoaXM6DQo+Pj4+IFRoZSBlbmNyeXB0aW9uIGJp
dCBpcyBiaXQtNDcgb2YgYSBwaHlzaWNhbCBhZGRyZXNzLg0KPj4+IEluIG90aGVyIHdvcmRzIHNl
dF9tZW1vcnlfZGVjcnlwdGVkKCkgY2hhbmdlcyB0aGUgcGh5c2ljYWwgYWRkcmVzcw0KPj4+IGlu
DQo+Pj4gdGhlIFBURXMgb2YgdGhlIGtlcm5lbCBtYXBwaW5nIGFuZCBhbGwgb3RoZXIgdXNlIGNh
c2VzIGp1c3QgY29weQ0KPj4+IHRoYXQNCj4+PiBmcm9tIHRoZXJlLg0KPj4gRXhjZXB0IEkgZG9u
J3QgdGhpbmsgdGhlIFBURSBhdHRyaWJ1dGVzIGFyZSBjb3BpZWQgZnJvbSB0aGUga2VybmVsDQo+
PiBtYXBwaW5nDQo+ICsxIQ0KPg0KPj4gaW4gc29tZSBjYXNlcy4gRm9yIGV4YW1wbGUsIGRtYV9t
bWFwX2NvaGVyZW50KCkgd2lsbCBjcmVhdGUgdGhlIHNhbWUNCj4+IHZtX3BhZ2VfcHJvdCB2YWx1
ZSByZWdhcmRsZXNzIG9mIHdoZXRoZXIgb3Igbm90IHRoZSB1bmRlcmx5aW5nIG1lbW9yeQ0KPj4g
aXMNCj4+IGVuY3J5cHRlZCBvciBub3QuIEJ1dCBrbWFwX2F0b21pY19wcm90KCkgd2lsbCByZXR1
cm4gdGhlIGtlcm5lbA0KPj4gdmlydHVhbA0KPj4gYWRkcmVzcyBvZiB0aGUgcGFnZSwgc28gdGhh
dCB3b3VsZCBiZSBmaW5lLg0KPiBZZXMsIG9uIDY0LWJpdCBzeXN0ZW1zLiBPbiAzMi1iaXQgc3lz
dGVtcyAoZG8gdGhleSBleGlzdCB3aXRoIFNFVj8pLA0KPiB0aGV5IGRvbid0Lg0KDQpJIGRvbid0
IHRoaW5rIHNvLCBidXQgZmVlbCBmcmVlIHRvIHByb3ZlIG1lIHdyb25nIFRvbS4NCg0KPiBBbmQg
c2ltaWxhcmx5IFRUTSB1c2VyLXNwYWNlIG1hcHBpbmdzIGFuZCB2bWFwKCkgZG9lc24ndCBjb3B5
IGZyb20gdGhlDQo+IGtlcm5lbCBtYXAgZWl0aGVyLCAgc28gSSB0aGluayB3ZSBhY3R1YWxseSBk
byBuZWVkIHRvIG1vZGlmeSB0aGUgcGFnZS0NCj4gcHJvdCBsaWtlIGRvbmUgaW4gdGhlIHBhdGNo
Lg0KDQpXZWxsIHRoZSBwcm9ibGVtIGlzIHRoYXQgdGhpcyB3b24ndCBoYXZlIGFueSBlZmZlY3Qu
DQoNCkFzIFRvbSBleHBsYWluZWQgZW5jcnlwdGlvbiBpcyBub3QgaW1wbGVtZW50ZWQgYXMgYSBw
YWdlIHByb3RlY3Rpb24gYml0LCANCmJ1dCByYXRoZXIgYXMgcGFydCBvZiB0aGUgcGh5c2ljYWwg
YWRkcmVzcyBvZiB0aGUgcGFydC4NCg0KSSBoYXZlIG5vIGlkZWEgaG93IHRoYXQgaXMgYWN0dWFs
bHkgaGFuZGxlZCB0aG91Z2h0LA0KQ2hyaXN0aWFuLg0KDQo+DQo+IC9UaG9tYXMNCj4NCj4+IFRo
aXMgaXMgYW4gYXJlYSB0aGF0IG5lZWRzIGxvb2tpbmcgaW50byB0byBiZSBzdXJlIGl0IGlzIHdv
cmtpbmcNCj4+IHByb3Blcmx5DQo+PiB3aXRoIFNNRSBhbmQgU0VWLg0KPj4NCj4+IFRoYW5rcywN
Cj4+IFRvbQ0KPj4NCj4+PiBUaGF0J3MgcmF0aGVyIG5pZnR5LCBiZWNhdXNlIHRoaXMgd2F5IGV2
ZXJ5Ym9keSB3aWxsIGVpdGhlciB1c2Ugb3INCj4+PiBub3QNCj4+PiB1c2UgZW5jcnlwdGlvbiBv
biB0aGUgcGFnZS4NCj4+Pg0KPj4+IENocmlzdGlhbi4NCj4+Pg0KPj4+PiBUaGFua3MsDQo+Pj4+
IFRob21hcw0KPj4+Pg0KPj4+Pg0KPj4+Pj4gVGhpbmdzIGdldCBmdXp6eSBmb3IgbWUgd2hlbiBp
dCBjb21lcyB0byB0aGUgR1BVIGFjY2VzcyBvZiB0aGUNCj4+Pj4+IG1lbW9yeQ0KPj4+Pj4gYW5k
IHdoYXQgYW5kIGhvdyBpdCBpcyBhY2Nlc3NlZC4NCj4+Pj4+DQo+Pj4+PiBUaGFua3MsDQo+Pj4+
PiBUb20NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
