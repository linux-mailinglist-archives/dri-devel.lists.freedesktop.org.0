Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C22C936
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878A789B49;
	Tue, 28 May 2019 14:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEDC89B49
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 14:48:22 +0000 (UTC)
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) by
 DM6PR12MB2921.namprd12.prod.outlook.com (20.179.104.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Tue, 28 May 2019 14:48:18 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555]) by DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 14:48:18 +0000
From: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
To: Thomas Hellstrom <thomas@shipmail.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEkKKUtJTyHZOak+VJIfcFQoAYqaAKlUAgAB56QA=
Date: Tue, 28 May 2019 14:48:18 +0000
Message-ID: <5b1b3f22-beea-16c4-a98f-9e632b408020@amd.com>
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
In-Reply-To: <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0089.namprd05.prod.outlook.com
 (2603:10b6:803:22::27) To DM6PR12MB3163.namprd12.prod.outlook.com
 (2603:10b6:5:182::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89884f77-3d3b-4382-49a3-08d6e37b8558
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2921; 
x-ms-traffictypediagnostic: DM6PR12MB2921:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM6PR12MB292159AABE4706AB270BC0C0EC1E0@DM6PR12MB2921.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(366004)(39860400002)(396003)(189003)(199004)(3846002)(316002)(6116002)(72206003)(6916009)(478600001)(14454004)(26005)(2616005)(446003)(6246003)(4326008)(6436002)(486006)(11346002)(5660300002)(6486002)(68736007)(476003)(53936002)(6306002)(66066001)(966005)(186003)(66574012)(71200400001)(71190400001)(6512007)(229853002)(99286004)(102836004)(31696002)(52116002)(8676002)(305945005)(7736002)(256004)(73956011)(25786009)(66556008)(66476007)(14444005)(66946007)(66446008)(64756008)(8936002)(2906002)(36756003)(76176011)(386003)(53546011)(6506007)(54906003)(31686004)(81166006)(86362001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2921;
 H:DM6PR12MB3163.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F9njxxekrEfQ7uJ6vJjcF+uRQy3elPUhURV0pmjssr31K3MJSj6AHjoss8sk2loyrrbUDKQ0cgfIFun8OShsrvR0D+NbFrUtw3ZFieaRN4TaygLstvysigToh6e+kw0h30Y0QgnKhFz10hJ8lBn/zd+cehJTnrLN+jaJAUsStPrL9uyLg52OhNL0G3GVwuhNLUzukk1jG5P7O8/w3HemZQ99rh9ebEmjRBzqAOlTBcANehcDuJEz2NBvciBzag5cC14EEL4mvIdbOUHqG7RsQjAo/H7K37pYbgLbvKotah2eAEv5i05wFaNrZla3ul1nFJ7iKTub3GOJuwquchSOeFcVWmfpOiFHxCDYB5mrRnhAQ0dKKY5o7eqxDejcCoOi2Fq1oCuQrd7CJk94p8ksvIFccoX+pdFHCniZP2c1JRQ=
Content-ID: <2BFD0687C40B53489225078FC2E97BAB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89884f77-3d3b-4382-49a3-08d6e37b8558
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 14:48:18.0710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlendack@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc+w73CwYERnNiHGWlApVfdjY9iJalYpZg9lXLU4jVQ=;
 b=IOZQuSWFJJEqlR8wjsJdojLEE/NC868kDMsOg1m0fhWazxuIicb1T73lXyj7XcHJbrLo0Jb1bx64Bzta9ewlg1lU+MdEBxO8NWsXQBdzYf0VWcgAcS9BhBr3BNjKnOk+Mcbpq4xaCY4zViVz55hTNt0UfzbHVu8rTuoRlnAcGzk=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yOC8xOSAyOjMxIEFNLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOg0KPiBIaSwgVG9tLA0K
PiANCj4gQ291bGQgeW91IHNoZWQgc29tZSBsaWdodCBvbiB0aGlzPw0KDQpJIGRvbid0IGhhdmUg
YSBsb3Qgb2YgR1BVIGtub3dsZWRnZSwgc28gbGV0IG1lIHN0YXJ0IHdpdGggYW4gb3ZlcnZpZXcg
b2YNCmhvdyBldmVyeXRoaW5nIHNob3VsZCB3b3JrIGFuZCBzZWUgaWYgdGhhdCBhbnN3ZXJzIHRo
ZSBxdWVzdGlvbnMgYmVpbmcNCmFza2VkLg0KDQpGaXJzdCwgU01FOg0KVGhlIGVuY3J5cHRpb24g
Yml0IGlzIGJpdC00NyBvZiBhIHBoeXNpY2FsIGFkZHJlc3MuIFNvLCBpZiBhIGRldmljZSBkb2Vz
DQpub3Qgc3VwcG9ydCBhdCBsZWFzdCA0OC1iaXQgRE1BLCBpdCB3aWxsIGhhdmUgdG8gdXNlIHRo
ZSBTV0lPVExCIGFuZA0KYm91bmNlIGJ1ZmZlciB0aGUgZGF0YS4gVGhpcyBpcyBoYW5kbGVkIGF1
dG9tYXRpY2FsbHkgaWYgdGhlIGRyaXZlciBpcw0KdXNpbmcgdGhlIExpbnV4IERNQS1hcGkgYXMg
YWxsIG9mIFNXSU9UTEIgaGFzIGJlZW4gbWFya2VkIHVuLWVuY3J5cHRlZC4NCkRhdGEgaXMgYm91
bmNlZCBiZXR3ZWVuIHRoZSB1bi1lbmNyeXB0ZWQgU1dJT1RMQiBhbmQgdGhlIChwcmVzdW1hYmx5
KQ0KZW5jcnlwdGVkIGFyZWEgb2YgdGhlIGRyaXZlci4NCg0KRm9yIFNFVjoNClRoZSBlbmNyeXB0
aW9uIGJpdCBwb3NpdGlvbiBpcyB0aGUgc2FtZSBhcyBTTUUuIEhvd2V2ZXIsIHdpdGggU0VWIGFs
bA0KRE1BIG11c3QgdXNlIGFuIHVuLWVuY3J5cHRlZCBhcmVhIHNvIGFsbCBETUEgZ29lcyB0aHJv
dWdoIFNXSU9UTEIuIEp1c3QNCmxpa2UgU01FLCB0aGlzIGlzIGhhbmRsZWQgYXV0b21hdGljYWxs
eSBpZiB0aGUgZHJpdmVyIGlzIHVzaW5nIHRoZSBMaW51eA0KRE1BLWFwaSBhcyBhbGwgb2YgU1dJ
T1RMQiBoYXMgYmVlbiBtYXJrZWQgdW4tZW5jcnlwdGVkLiBBbmQganVzdCBsaWtlIFNNRSwNCmRh
dGEgaXMgYm91bmNlZCBiZXR3ZWVuIHRoZSB1bi1lbmNyeXB0ZWQgU1dJT1RMQiBhbmQgdGhlIChw
cmVzdW1hYmx5KQ0KZW5jcnlwdGVkIGFyZWEgb2YgdGhlIGRyaXZlci4NCg0KVGhlcmUgaXMgYW4g
b3B0aW1pemF0aW9uIGZvciBkbWFfYWxsb2NfY29oZXJlbnQoKSB3aGVyZSB0aGUgcGFnZXMgYXJl
DQphbGxvY2F0ZWQgYW5kIG1hcmtlZCB1bi1lbmNyeXB0ZWQsIHRodXMgYXZvaWRpbmcgdGhlIGJv
dW5jaW5nIChzZWUgZmlsZQ0Ka2VybmVsL2RtYS9kaXJlY3QuYywgZG1hX2RpcmVjdF9hbGxvY19w
YWdlcygpKS4NCg0KQXMgZm9yIGtlcm5lbCB2bWFwcyBhbmQgdXNlci1tYXBzLCB0aG9zZSBwYWdl
cyB3aWxsIGJlIG1hcmtlZCBlbmNyeXB0ZWQNCih1bmxlc3MgZXhwbGljaXRseSBtYWRlIHVuLWVu
Y3J5cHRlZCBieSBjYWxsaW5nIHNldF9tZW1vcnlfZGVjcnlwdGVkKCkpLg0KQnV0LCBpZiB5b3Ug
YXJlIGNvcHlpbmcgdG8vZnJvbSB0aG9zZSBhcmVhcyBpbnRvIHRoZSB1bi1lbmNyeXB0ZWQgRE1B
DQphcmVhIHRoZW4gZXZlcnl0aGluZyB3aWxsIGJlIG9rLg0KDQpUaGluZ3MgZ2V0IGZ1enp5IGZv
ciBtZSB3aGVuIGl0IGNvbWVzIHRvIHRoZSBHUFUgYWNjZXNzIG9mIHRoZSBtZW1vcnkNCmFuZCB3
aGF0IGFuZCBob3cgaXQgaXMgYWNjZXNzZWQuDQoNClRoYW5rcywNClRvbQ0KDQo+IA0KPiBUaGFu
a3MsDQo+IFRob21hcw0KPiANCj4gDQo+IE9uIDUvMjQvMTkgNTowOCBQTSwgQWxleCBEZXVjaGVy
IHdyb3RlOg0KPj4gKyBUb20NCj4+DQo+PiBIZSdzIGJlZW4gbG9va2luZyBpbnRvIFNFViBhcyB3
ZWxsLg0KPj4NCj4+IE9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDg6MzAgQU0gVGhvbWFzIEhlbGxz
dHJvbSA8dGhvbWFzQHNoaXBtYWlsLm9yZz4NCj4+IHdyb3RlOg0KPj4+IE9uIDUvMjQvMTkgMjow
MyBQTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+Pj4+IEFtIDI0LjA1LjE5IHVtIDEyOjM3
IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHJvbToNCj4+Pj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFp
bF0NCj4+Pj4+DQo+Pj4+PiBPbiA1LzI0LzE5IDEyOjE4IFBNLCBLb2VuaWcsIENocmlzdGlhbiB3
cm90ZToNCj4+Pj4+PiBBbSAyNC4wNS4xOSB1bSAxMTo1NSBzY2hyaWViIFRob21hcyBIZWxsc3Ry
b206DQo+Pj4+Pj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4+Pj4+Pj4NCj4+Pj4+Pj4g
T24gNS8yNC8xOSAxMToxMSBBTSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToNCj4+Pj4+Pj4+IEhp
LCBDaHJpc3RpYW4sDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gT24gNS8yNC8xOSAxMDozNyBBTSwgS29l
bmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+Pj4+Pj4+Pj4gQW0gMjQuMDUuMTkgdW0gMTA6MTEgc2No
cmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToNCj4+Pj4+Pj4+Pj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBGcm9tOiBUaG9tYXMgSGVsbHN0
cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFdpdGgg
U0VWIGVuY3J5cHRpb24sIGFsbCBETUEgbWVtb3J5IG11c3QgYmUgbWFya2VkIGRlY3J5cHRlZA0K
Pj4+Pj4+Pj4+PiAoQUtBICJzaGFyZWQiKSBmb3IgZGV2aWNlcyB0byBiZSBhYmxlIHRvIHJlYWQg
aXQuIEluIHRoZSBmdXR1cmUgd2UNCj4+Pj4+Pj4+Pj4gbWlnaHQNCj4+Pj4+Pj4+Pj4gd2FudCB0
byBiZSBhYmxlIHRvIHN3aXRjaCBub3JtYWwgKGVuY3J5cHRlZCkgbWVtb3J5IHRvIGRlY3J5cHRl
ZCBpbg0KPj4+Pj4+Pj4+PiBleGFjdGx5DQo+Pj4+Pj4+Pj4+IHRoZSBzYW1lIHdheSBhcyB3ZSBo
YW5kbGUgY2FjaGluZyBzdGF0ZXMsIGFuZCB0aGF0IHdvdWxkIHJlcXVpcmUNCj4+Pj4+Pj4+Pj4g
YWRkaXRpb25hbA0KPj4+Pj4+Pj4+PiBtZW1vcnkgcG9vbHMuIEJ1dCBmb3Igbm93LCByZWx5IG9u
IG1lbW9yeSBhbGxvY2F0ZWQgd2l0aA0KPj4+Pj4+Pj4+PiBkbWFfYWxsb2NfY29oZXJlbnQoKSB3
aGljaCBpcyBhbHJlYWR5IGRlY3J5cHRlZCB3aXRoIFNFViBlbmFibGVkLg0KPj4+Pj4+Pj4+PiBT
ZXQgdXANCj4+Pj4+Pj4+Pj4gdGhlIHBhZ2UgcHJvdGVjdGlvbiBhY2NvcmRpbmdseS4gRHJpdmVy
cyBtdXN0IGRldGVjdCBTRVYgZW5hYmxlZA0KPj4+Pj4+Pj4+PiBhbmQNCj4+Pj4+Pj4+Pj4gc3dp
dGNoDQo+Pj4+Pj4+Pj4+IHRvIHRoZSBkbWEgcGFnZSBwb29sLg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4+PiBUaGlzIHBhdGNoIGhhcyBub3QgeWV0IGJlZW4gdGVzdGVkLiBBcyBhIGZvbGxvdy11cCwg
d2UgbWlnaHQNCj4+Pj4+Pj4+Pj4gd2FudCB0bw0KPj4+Pj4+Pj4+PiBjYWNoZSBkZWNyeXB0ZWQg
cGFnZXMgaW4gdGhlIGRtYSBwYWdlIHBvb2wgcmVnYXJkbGVzcyBvZiB0aGVpcg0KPj4+Pj4+Pj4+
PiBjYWNoaW5nDQo+Pj4+Pj4+Pj4+IHN0YXRlLg0KPj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggaXMgdW5u
ZWNlc3NhcnksIFNFViBzdXBwb3J0IGFscmVhZHkgd29ya3MgZmluZSB3aXRoIGF0DQo+Pj4+Pj4+
Pj4gbGVhc3QNCj4+Pj4+Pj4+PiBhbWRncHUgYW5kIEkgd291bGQgZXhwZWN0IHRoYXQgaXQgYWxz
byB3b3JrcyB3aXRoIG90aGVyIGRyaXZlcnMgYXMNCj4+Pj4+Pj4+PiB3ZWxsLg0KPj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4gQWxzbyBzZWUgdGhpcyBwYXRjaDoNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IGNv
bW1pdCA2NGUxZjgzMGVhNWIzNTE2YTQyNTZlZDFjNTA0YTI2NWQ3ZjJhNjVjDQo+Pj4+Pj4+Pj4g
QXV0aG9yOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pj4+
Pj4+Pj4gRGF0ZTrCoMKgIFdlZCBNYXIgMTMgMTA6MTE6MTkgMjAxOSArMDEwMA0KPj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBkcm06IGZhbGxiYWNrIHRvIGRtYV9hbGxvY19j
b2hlcmVudCB3aGVuIG1lbW9yeQ0KPj4+Pj4+Pj4+IGVuY3J5cHRpb24gaXMNCj4+Pj4+Pj4+PiBh
Y3RpdmUNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgV2UgY2FuJ3QganVz
dCBtYXAgYW55IHJhbmRvbWUgcGFnZSB3ZSBnZXQgd2hlbiBtZW1vcnkNCj4+Pj4+Pj4+PiBlbmNy
eXB0aW9uIGlzDQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBhY3RpdmUuDQo+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBMaW5rOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzEwODUwODMzLw0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gUmVnYXJkcywNCj4+Pj4+Pj4+
PiBDaHJpc3RpYW4uDQo+Pj4+Pj4+PiBZZXMsIEkgbm90aWNlZCB0aGF0LiBBbHRob3VnaCBJIGZh
aWwgdG8gc2VlIHdoZXJlIHdlIGF1dG9tYWdpY2FsbHkNCj4+Pj4+Pj4+IGNsZWFyIHRoZSBQVEUg
ZW5jcnlwdGVkIGJpdCB3aGVuIG1hcHBpbmcgY29oZXJlbnQgbWVtb3J5PyBGb3IgdGhlDQo+Pj4+
Pj4+PiBsaW5lYXIga2VybmVsIG1hcCwgdGhhdCdzIGRvbmUgd2l0aGluIGRtYV9hbGxvY19jb2hl
cmVudCgpIGJ1dCBmb3INCj4+Pj4+Pj4+IGtlcm5lbCB2bWFwcyBhbmQgYW5kIHVzZXItc3BhY2Ug
bWFwcz8gSXMgdGhhdCBkb25lIGF1dG9tYXRpY2FsbHkgYnkNCj4+Pj4+Pj4+IHRoZSB4ODYgcGxh
dGZvcm0gbGF5ZXI/DQo+Pj4+Pj4gWWVzLCBJIHRoaW5rIHNvLiBIYXZlbid0IGxvb2tlZCB0byBj
bG9zZWx5IGF0IHRoaXMgZWl0aGVyLg0KPj4+Pj4gVGhpcyBzb3VuZHMgYSBiaXQgb2RkLiBJZiB0
aGF0IHdlcmUgdGhlIGNhc2UsIHRoZSBuYXR1cmFsIHBsYWNlIHdvdWxkIGJlDQo+Pj4+PiB0aGUg
UEFUIHRyYWNraW5nIGNvZGUsIGJ1dCBpdCBvbmx5IGhhbmRsZXMgY2FjaGluZyBmbGFncyBBRkFJ
Q1QuIE5vdA0KPj4+Pj4gZW5jcnlwdGlvbiBmbGFncy4NCj4+Pj4+DQo+Pj4+PiBCdXQgd2hlbiB5
b3UgdGVzdGVkIEFNRCB3aXRoIFNFViwgd2FzIHRoYXQgcnVubmluZyBhcyBoeXBlcnZpc29yIHJh
dGhlcg0KPj4+Pj4gdGhhbiBhIGd1ZXN0LCBvciBkaWQgeW91IHJ1biBhbiBTRVYgZ3Vlc3Qgd2l0
aCBQQ0kgcGFzc3Rocm91Z2ggdG8gdGhlDQo+Pj4+PiBBTUQgZGV2aWNlPw0KPj4+PiBZZWFoLCB3
ZWxsIHRoZSBwcm9ibGVtIGlzIHdlIG5ldmVyIHRlc3RlZCB0aGlzIG91cnNlbGYgOikNCj4+Pj4N
Cj4+Pj4+Pj4+IC9UaG9tYXMNCj4+Pj4+Pj4+DQo+Pj4+Pj4+IEFuZCwgYXMgYSBmb2xsb3cgdXAg
cXVlc3Rpb24sIHdoeSBkbyB3ZSBuZWVkIGRtYV9hbGxvY19jb2hlcmVudCgpIHdoZW4NCj4+Pj4+
Pj4gdXNpbmcgU01FPyBJIHRob3VnaHQgdGhlIGhhcmR3YXJlIHBlcmZvcm1zIHRoZSBkZWNyeXB0
aW9uIHdoZW4gRE1BLWluZw0KPj4+Pj4+PiB0byAvIGZyb20gYW4gZW5jcnlwdGVkIHBhZ2Ugd2l0
aCBTTUUsIGJ1dCBub3Qgd2l0aCBTRVY/DQo+Pj4+Pj4gSSB0aGluayB0aGUgaXNzdWUgd2FzIHRo
YXQgdGhlIERNQSBBUEkgd291bGQgdHJ5IHRvIHVzZSBhIGJvdW5jZSBidWZmZXINCj4+Pj4+PiBp
biB0aGlzIGNhc2UuDQo+Pj4+PiBTRVYgZm9yY2VzIFNXSU9UTEIgYm91bmNpbmcgb24sIGJ1dCBu
b3QgU01FLiBTbyBpdCBzaG91bGQgcHJvYmFibHkgYmUNCj4+Pj4+IHBvc3NpYmxlIHRvIGF2b2lk
IGRtYV9hbGxvY19jb2hlcmVudCgpIGluIHRoZSBTTUUgY2FzZS4NCj4+Pj4gSW4gdGhpcyBjYXNl
IEkgZG9uJ3QgaGF2ZSBhbiBleHBsYW5hdGlvbiBmb3IgdGhpcy4NCj4+Pj4NCj4+Pj4gRm9yIHRo
ZSBiYWNrZ3JvdW5kIHdoYXQgaGFwcGVuZWQgaXMgdGhhdCB3ZSBnb3QgcmVwb3J0cyB0aGF0IFNW
RS9TTUUNCj4+Pj4gZG9lc24ndCB3b3JrIHdpdGggYW1kZ3B1LiBTbyB3ZSB0b2xkIHRoZSBwZW9w
bGUgdG8gdHJ5IHVzaW5nIHRoZQ0KPj4+PiBkbWFfYWxsb2NfY29oZXJlbnQoKSBwYXRoIGFuZCB0
aGF0IHdvcmtlZCBmaW5lLiBCZWNhdXNlIG9mIHRoaXMgd2UgY2FtZQ0KPj4+PiB1cCB3aXRoIHRo
ZSBwYXRjaCBJIG5vdGVkIGVhcmxpZXIuDQo+Pj4+DQo+Pj4+IEkgY2FuIGNvbmZpcm0gdGhhdCBp
dCBpbmRlZWQgd29ya3Mgbm93IGZvciBhIGNvdXBsZSBvZiB1c2VycywgYnV0IHdlDQo+Pj4+IHN0
aWxsIGRvbid0IGhhdmUgYSB0ZXN0IHN5c3RlbSBmb3IgdGhpcyBpbiBvdXIgdGVhbS4NCj4+Pj4N
Cj4+Pj4gQ2hyaXN0aWFuLg0KPj4+IE9LLCB1bmRlc3Rvb2QsDQo+Pj4NCj4+PiBCdXQgdW5sZXNz
IHRoZXJlIGlzIHNvbWUgc3RyYW5nZSBtYWdpYyBnb2luZyBvbiwgKHdoaWNoIHRoZXJlIG1pZ2h0
IGJlDQo+Pj4gb2YgY291cnNlKSxJIGRvIHRoaW5rIHRoZSBwYXRjaCBJIHNlbnQgaXMgY29ycmVj
dCwgYW5kIHRoZSByZWFzb24gdGhhdA0KPj4+IFNFViB3b3JrcyBpcyB0aGF0IHRoZSBBTUQgY2Fy
ZCBpcyB1c2VkIGJ5IHRoZSBoeXBlcnZpc29yIGFuZCBub3QgdGhlDQo+Pj4gZ3Vlc3QsIGFuZCBU
VE0gaXMgYWN0dWFsbHkgaW5jb3JyZWN0bHkgY3JlYXRpbmcgY29uZmxpY3RpbmcgbWFwcyBhbmQN
Cj4+PiB0cmVhdGluZyB0aGUgY29oZXJlbnQgbWVtb3J5IGFzIGVuY3J5cHRlZC4gQnV0IHNpbmNl
IHRoZSBtZW1vcnkgaXMgb25seQ0KPj4+IGFjY2Vzc2VkIHRocm91Z2ggZW5jcnlwdGVkIFBURXMs
IHRoZSBoYXJkd2FyZSBkb2VzIHRoZSByaWdodCB0aGluZywNCj4+PiB1c2luZyB0aGUgaHlwZXJ2
aXNvciBrZXkgZm9yIGRlY3J5cHRpb24uLi4uDQo+Pj4NCj4+PiBCdXQgdGhhdCdzIG9ubHkgYSBn
dWVzcywgYW5kIHRoaXMgaXMgbm90IHN1cGVyLXVyZ2VudC4gSSB3aWxsIGJlIGFibGUgdG8NCj4+
PiBmb2xsb3cgdXAgaWYgLyB3aGVuIHdlIGJyaW5nIHZtd2dmeCB1cCBmb3IgU0VWLg0KPj4+DQo+
Pj4gL1Rob21hcw0KPj4+DQo+Pj4+PiAvVGhvbWFzDQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+PiBDaHJp
c3RpYW4uDQo+Pj4+Pj4NCj4+Pj4+Pj4gVGhhbmtzLCBUaG9tYXMNCj4+Pj4+Pj4NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4NCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwNCj4gDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
