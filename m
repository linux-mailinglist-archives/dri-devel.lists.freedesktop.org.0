Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C352CCCE
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3546E26F;
	Tue, 28 May 2019 17:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB256E26F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 17:00:10 +0000 (UTC)
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) by
 DM6PR12MB3065.namprd12.prod.outlook.com (20.178.30.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 17:00:08 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555]) by DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 17:00:08 +0000
From: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Thomas Hellstrom
 <thellstrom@vmware.com>, "thomas@shipmail.org" <thomas@shipmail.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEkKKUtJTyHZOak+VJIfcFQoAYqaAKlUAgAAmFwCAAFo8gIAAAdIAgAAJNYCAAApLAIAAAUqAgAAH0AA=
Date: Tue, 28 May 2019 17:00:08 +0000
Message-ID: <1325ba3d-55f6-8b3c-c4b0-b0cc7b1a9d29@amd.com>
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
In-Reply-To: <4b22c4ed-1d66-0aff-51a2-7a1ddb411878@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To DM6PR12MB3163.namprd12.prod.outlook.com
 (2603:10b6:5:182::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b63240d6-f175-4982-1ea1-08d6e38df01e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3065; 
x-ms-traffictypediagnostic: DM6PR12MB3065:
x-microsoft-antispam-prvs: <DM6PR12MB3065BED4C97B214A31975EA9EC1E0@DM6PR12MB3065.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(346002)(136003)(396003)(189003)(51914003)(199004)(68736007)(36756003)(25786009)(6116002)(2501003)(5660300002)(81166006)(8676002)(81156014)(8936002)(66476007)(72206003)(305945005)(66556008)(14454004)(64756008)(66446008)(66066001)(478600001)(3846002)(6436002)(66946007)(73956011)(31696002)(6512007)(86362001)(6486002)(229853002)(52116002)(99286004)(53936002)(6246003)(71190400001)(53546011)(386003)(6506007)(102836004)(4326008)(2906002)(14444005)(256004)(7736002)(486006)(71200400001)(186003)(76176011)(26005)(54906003)(110136005)(11346002)(2616005)(476003)(316002)(446003)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3065;
 H:DM6PR12MB3163.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5qkBC/2XGb/vsojBmVHtqfEOLizDS6lEZCHGvSwSSzGqTBqXP3KuCbx7q8RwVJdwx8xLgjimEM6A/PQQ9BW0V6K9vK5tLdVJJGY6pgCgtUpl7yqer73rxtFYRaA5XYb1Uyful1omRS/EXx32RYNQYziLEFRo8ZzjTs4x5+hYnNOZbBYgXG3XPm3I8oYoB9pDRujWil1oTPRUI9czazyhCua4kHUs49j4LKcZX2isvH9PYdqF6l5vyG1FFrjnYIAYqS23B8TcNEmvKLGfr16pmRNVLT1qEYZYcESmp6LSDKiT6jrbWySBl97zmJCrgsFb4HLsqZQEnqmlz42gJiUIr10f4n4qMIIy9S8AJJUX9iDpP5HJ2lgMIytkU/220QPyPt7Wzx8mpsbiPSVZBqi+8jlIqR28m07gEI0HnNhsx1U=
Content-ID: <4C0DF9275FE84C47B78176C1C3095584@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63240d6-f175-4982-1ea1-08d6e38df01e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 17:00:08.2101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlendack@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3065
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVoraLeIVhMysWNQHk7Sx7tLK7O5/U6A+EUOBUkaYEU=;
 b=VhC74VX76tO8iKrVnSHTpLbgMRwlj1I9T1CHpUICVI7+VYHITbd+7p9xUZXdWOutrLD8VEqHJXjQeeqAWYRstbiGkf9VnO9USK5pBL0v2dIrGrhvqoxY+3TpgW+0fYWczXbS7c1VSr9a/yfnvzkRm0VPnCOKc8HDwKnFmEsyieU=
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

T24gNS8yOC8xOSAxMTozMiBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+IEFtIDI4LjA1
LjE5IHVtIDE4OjI3IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHJvbToNCj4+IE9uIFR1ZSwgMjAxOS0w
NS0yOCBhdCAxNTo1MCArMDAwMCwgTGVuZGFja3ksIFRob21hcyB3cm90ZToNCj4+PiBPbiA1LzI4
LzE5IDEwOjE3IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+Pj4gSGkgVGhvbWFzLA0K
Pj4+Pg0KPj4+PiBBbSAyOC4wNS4xOSB1bSAxNzoxMSBzY2hyaWViIFRob21hcyBIZWxsc3Ryb206
DQo+Pj4+PiBIaSwgVG9tLA0KPj4+Pj4NCj4+Pj4+IFRoYW5rcyBmb3IgdGhlIHJlcGx5LiBUaGUg
cXVlc3Rpb24gaXMgbm90IGdyYXBoaWNzIHNwZWNpZmljLCBidXQNCj4+Pj4+IGxpZXMNCj4+Pj4+
IGluIHlvdXIgYW5zd2VyIGZ1cnRoZXIgYmVsb3c6DQo+Pj4+Pg0KPj4+Pj4gT24gNS8yOC8xOSA0
OjQ4IFBNLCBMZW5kYWNreSwgVGhvbWFzIHdyb3RlOg0KPj4+Pj4+IE9uIDUvMjgvMTkgMjozMSBB
TSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToNCj4+Pj4+PiBbU05JUF0NCj4+Pj4+PiBBcyBmb3Ig
a2VybmVsIHZtYXBzIGFuZCB1c2VyLW1hcHMsIHRob3NlIHBhZ2VzIHdpbGwgYmUgbWFya2VkDQo+
Pj4+Pj4gZW5jcnlwdGVkDQo+Pj4+Pj4gKHVubGVzcyBleHBsaWNpdGx5IG1hZGUgdW4tZW5jcnlw
dGVkIGJ5IGNhbGxpbmcNCj4+Pj4+PiBzZXRfbWVtb3J5X2RlY3J5cHRlZCgpKS4NCj4+Pj4+PiBC
dXQsIGlmIHlvdSBhcmUgY29weWluZyB0by9mcm9tIHRob3NlIGFyZWFzIGludG8gdGhlIHVuLQ0K
Pj4+Pj4+IGVuY3J5cHRlZCBETUENCj4+Pj4+PiBhcmVhIHRoZW4gZXZlcnl0aGluZyB3aWxsIGJl
IG9rLg0KPj4+Pj4gVGhlIHF1ZXN0aW9uIGlzIHJlZ2FyZGluZyB0aGUgYWJvdmUgcGFyYWdyYXBo
Lg0KPj4+Pj4NCj4+Pj4+IEFGQUlDVCwgIHNldF9tZW1vcnlfZGVjcnlwdGVkKCkgb25seSBjaGFu
Z2VzIHRoZSBmaXhlZCBrZXJuZWwgbWFwDQo+Pj4+PiBQVEVzLg0KPj4+Pj4gQnV0IHdoZW4gc2V0
dGluZyB1cCBvdGhlciBhbGlhc2VkIFBURXMgdG8gdGhlIGV4YWN0IHNhbWUNCj4+Pj4+IGRlY3J5
cHRlZA0KPj4+Pj4gcGFnZXMsIGZvciBleGFtcGxlIHVzaW5nIGRtYV9tbWFwX2NvaGVyZW50KCks
DQo+Pj4+PiBrbWFwX2F0b21pY19wcm90KCksDQo+Pj4+PiB2bWFwKCkgZXRjLiBXaGF0IGNvZGUg
aXMgcmVzcG9uc2libGUgZm9yIGNsZWFyaW5nIHRoZSBlbmNyeXB0ZWQNCj4+Pj4+IGZsYWcNCj4+
Pj4+IG9uIHRob3NlIFBURXM/IElzIHRoZXJlIHNvbWV0aGluZyBpbiB0aGUgeDg2IHBsYXRmb3Jt
IGNvZGUgZG9pbmcNCj4+Pj4+IHRoYXQ/DQo+Pj4+IFRvbSBhY3R1YWxseSBleHBsYWluZWQgdGhp
czoNCj4+Pj4+IFRoZSBlbmNyeXB0aW9uIGJpdCBpcyBiaXQtNDcgb2YgYSBwaHlzaWNhbCBhZGRy
ZXNzLg0KPj4+PiBJbiBvdGhlciB3b3JkcyBzZXRfbWVtb3J5X2RlY3J5cHRlZCgpIGNoYW5nZXMg
dGhlIHBoeXNpY2FsIGFkZHJlc3MNCj4+Pj4gaW4NCj4+Pj4gdGhlIFBURXMgb2YgdGhlIGtlcm5l
bCBtYXBwaW5nIGFuZCBhbGwgb3RoZXIgdXNlIGNhc2VzIGp1c3QgY29weQ0KPj4+PiB0aGF0DQo+
Pj4+IGZyb20gdGhlcmUuDQo+Pj4gRXhjZXB0IEkgZG9uJ3QgdGhpbmsgdGhlIFBURSBhdHRyaWJ1
dGVzIGFyZSBjb3BpZWQgZnJvbSB0aGUga2VybmVsDQo+Pj4gbWFwcGluZw0KPj4gKzEhDQo+Pg0K
Pj4+IGluIHNvbWUgY2FzZXMuIEZvciBleGFtcGxlLCBkbWFfbW1hcF9jb2hlcmVudCgpIHdpbGwg
Y3JlYXRlIHRoZSBzYW1lDQo+Pj4gdm1fcGFnZV9wcm90IHZhbHVlIHJlZ2FyZGxlc3Mgb2Ygd2hl
dGhlciBvciBub3QgdGhlIHVuZGVybHlpbmcgbWVtb3J5DQo+Pj4gaXMNCj4+PiBlbmNyeXB0ZWQg
b3Igbm90LiBCdXQga21hcF9hdG9taWNfcHJvdCgpIHdpbGwgcmV0dXJuIHRoZSBrZXJuZWwNCj4+
PiB2aXJ0dWFsDQo+Pj4gYWRkcmVzcyBvZiB0aGUgcGFnZSwgc28gdGhhdCB3b3VsZCBiZSBmaW5l
Lg0KPj4gWWVzLCBvbiA2NC1iaXQgc3lzdGVtcy4gT24gMzItYml0IHN5c3RlbXMgKGRvIHRoZXkg
ZXhpc3Qgd2l0aCBTRVY/KSwNCj4+IHRoZXkgZG9uJ3QuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHNv
LCBidXQgZmVlbCBmcmVlIHRvIHByb3ZlIG1lIHdyb25nIFRvbS4NCg0KU0VWIGlzIDY0LWJpdCBv
bmx5Lg0KDQo+IA0KPj4gQW5kIHNpbWlsYXJseSBUVE0gdXNlci1zcGFjZSBtYXBwaW5ncyBhbmQg
dm1hcCgpIGRvZXNuJ3QgY29weSBmcm9tIHRoZQ0KPj4ga2VybmVsIG1hcCBlaXRoZXIsICBzbyBJ
IHRoaW5rIHdlIGFjdHVhbGx5IGRvIG5lZWQgdG8gbW9kaWZ5IHRoZSBwYWdlLQ0KPj4gcHJvdCBs
aWtlIGRvbmUgaW4gdGhlIHBhdGNoLg0KPiANCj4gV2VsbCB0aGUgcHJvYmxlbSBpcyB0aGF0IHRo
aXMgd29uJ3QgaGF2ZSBhbnkgZWZmZWN0Lg0KPiANCj4gQXMgVG9tIGV4cGxhaW5lZCBlbmNyeXB0
aW9uIGlzIG5vdCBpbXBsZW1lbnRlZCBhcyBhIHBhZ2UgcHJvdGVjdGlvbiBiaXQsIA0KPiBidXQg
cmF0aGVyIGFzIHBhcnQgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIHBhcnQuDQoNClRo
aXMgaXMgd2hlcmUgdGhpbmdzIGdldCBpbnRlcmVzdGluZy4gIEV2ZW4gdGhvdWdoIHRoZSBlbmNy
eXB0aW9uIGJpdCBpcw0KcGFydCBvZiB0aGUgcGh5c2ljYWwgYWRkcmVzcyAoZS5nLiB1bmRlciBT
TUUgdGhlIGRldmljZSBjb3VsZC93b3VsZCB1c2UgYW4NCmFkZHJlc3Mgd2l0aCB0aGUgZW5jcnlw
dGlvbiBiaXQgc2V0KSwgaXQgaXMgaW1wbGVtZW50ZWQgYXMgcGFydCBvZiB0aGUgUFRFDQphdHRy
aWJ1dGVzLiBTbywgZm9yIGV4YW1wbGUsIHVzaW5nIF9QQUdFX0VOQyB3aGVuIGJ1aWxkaW5nIGEg
cGdwcm90IHZhbHVlDQp3b3VsZCBwcm9kdWNlIGFuIGVudHJ5IHdpdGggdGhlIGVuY3J5cHRpb24g
Yml0IHNldC4NCg0KQW5kIHRoZSB0aGluZyB0byB3YXRjaCBvdXQgZm9yIGlzIHVzaW5nIHR3byB2
aXJ0dWFsIGFkZHJlc3NlcyB0aGF0IHBvaW50DQp0byB0aGUgc2FtZSBwaHlzaWNhbCBhZGRyZXNz
IChwYWdlKSBpbiBEUkFNIGJ1dCBvbmUgaGFzIHRoZSBlbmNyeXB0aW9uIGJpdA0Kc2V0IGFuZCBv
bmUgZG9lc24ndC4gVGhlIGhhcmR3YXJlIGRvZXMgbm90IGVuZm9yY2UgY29oZXJlbmN5IGJldHdl
ZW4gYW4NCmVuY3J5cHRlZCBhbmQgdW4tZW5jcnlwdGVkIG1hcHBpbmcgb2YgdGhlIHNhbWUgcGh5
c2ljYWwgYWRkcmVzcyAocGFnZSkuDQpTZWUgc2VjdGlvbiA3LjEwLjYgb2YgdGhlIEFNRDY0IEFy
Y2hpdGVjdHVyZSBQcm9ncmFtbWVyJ3MgTWFudWFsIFZvbHVtZSAyLg0KDQpUaGFua3MsDQpUb20N
Cg0KPiANCj4gSSBoYXZlIG5vIGlkZWEgaG93IHRoYXQgaXMgYWN0dWFsbHkgaGFuZGxlZCB0aG91
Z2h0LA0KPiBDaHJpc3RpYW4uDQo+IA0KPj4NCj4+IC9UaG9tYXMNCj4+DQo+Pj4gVGhpcyBpcyBh
biBhcmVhIHRoYXQgbmVlZHMgbG9va2luZyBpbnRvIHRvIGJlIHN1cmUgaXQgaXMgd29ya2luZw0K
Pj4+IHByb3Blcmx5DQo+Pj4gd2l0aCBTTUUgYW5kIFNFVi4NCj4+Pg0KPj4+IFRoYW5rcywNCj4+
PiBUb20NCj4+Pg0KPj4+PiBUaGF0J3MgcmF0aGVyIG5pZnR5LCBiZWNhdXNlIHRoaXMgd2F5IGV2
ZXJ5Ym9keSB3aWxsIGVpdGhlciB1c2Ugb3INCj4+Pj4gbm90DQo+Pj4+IHVzZSBlbmNyeXB0aW9u
IG9uIHRoZSBwYWdlLg0KPj4+Pg0KPj4+PiBDaHJpc3RpYW4uDQo+Pj4+DQo+Pj4+PiBUaGFua3Ms
DQo+Pj4+PiBUaG9tYXMNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4+IFRoaW5ncyBnZXQgZnV6enkgZm9y
IG1lIHdoZW4gaXQgY29tZXMgdG8gdGhlIEdQVSBhY2Nlc3Mgb2YgdGhlDQo+Pj4+Pj4gbWVtb3J5
DQo+Pj4+Pj4gYW5kIHdoYXQgYW5kIGhvdyBpdCBpcyBhY2Nlc3NlZC4NCj4+Pj4+Pg0KPj4+Pj4+
IFRoYW5rcywNCj4+Pj4+PiBUb20NCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
