Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B8FBBA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 16:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91BF891F2;
	Tue, 30 Apr 2019 14:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710057.outbound.protection.outlook.com [40.107.71.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D14D891F2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 14:41:29 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1210.namprd12.prod.outlook.com (10.168.237.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 14:41:28 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1835.018; Tue, 30 Apr
 2019 14:41:28 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/12] dma-buf: add explicit buffer pinning v2
Thread-Topic: [PATCH 02/12] dma-buf: add explicit buffer pinning v2
Thread-Index: AQHU/1z5TlRY9DvCzE+7Xf5Gr688BqZUwrAAgAACNwCAAAHsgA==
Date: Tue, 30 Apr 2019 14:41:27 +0000
Message-ID: <e1dcf9bc-0fec-4698-9422-5dcf5ce5338f@amd.com>
References: <20190426123638.40221-1-christian.koenig@amd.com>
 <20190426123638.40221-2-christian.koenig@amd.com>
 <20190429084048.GL3271@phenom.ffwll.local>
 <edefefff-de3b-4c46-c920-613bb412216f@gmail.com>
 <20190430135937.GS3271@phenom.ffwll.local>
 <a30d0d85-e8c7-4765-9fbb-27712e9e48ae@gmail.com>
 <20190430143428.GW3271@phenom.ffwll.local>
In-Reply-To: <20190430143428.GW3271@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::17) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbdf490f-3959-4949-8b79-08d6cd79ed56
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1210; 
x-ms-traffictypediagnostic: DM5PR12MB1210:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1210EAC636C4267D66CD696E833A0@DM5PR12MB1210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(136003)(346002)(396003)(39860400002)(189003)(199004)(11346002)(229853002)(93886005)(446003)(256004)(76176011)(5024004)(31686004)(14444005)(6246003)(6486002)(46003)(5660300002)(66476007)(66556008)(64756008)(66446008)(486006)(8936002)(6436002)(476003)(4326008)(53936002)(66946007)(81166006)(73956011)(2616005)(6306002)(68736007)(81156014)(6512007)(8676002)(36756003)(52116002)(2906002)(6506007)(99286004)(86362001)(31696002)(58126008)(966005)(65826007)(6916009)(102836004)(97736004)(66574012)(64126003)(7736002)(305945005)(71200400001)(25786009)(71190400001)(316002)(65956001)(186003)(478600001)(65806001)(386003)(6116002)(14454004)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1210;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6rkiOSbSyl0W1jlWTThO+xpZu5Sj8XyEIJv2r56SR5QSD1sSSPWx4kW6nJxiXntpQXxzt6de6OSEH04QBDMAJA3cjcx2MHdJCWpoiatm6vQCTM91EJDsqE5W8Vb3pNBCzUP9vRmqxlDpkK7g8Rt4M5gQhuKRcpw78ylAxf/08N5SQL/JlZ38U9e8q1IU7vbuxN3nB8IX07qYsLRoEOjXnZoH3acypDeMvd5zZdAkXhjSPnjhiUsyc6ov+kFWrU6mDpBeOfc8mT+XVpMS689KTQNcCqNSMKS2DTrbv8gnhw65kfiE0AGRpTE/5c4urftaBHny8oIbWGwOlwipkCK5FiZ6AGIbaJUlz2OcPI4QeQcoEsY7ZBgFI6ZclSOwlVPgxvrHyGp3y27+gAUFDPOi990rCIu58KGU6afaO2YG8OM=
Content-ID: <8D475E50D004F749892BFC3E21631F80@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdf490f-3959-4949-8b79-08d6cd79ed56
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 14:41:28.0186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1210
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w68rhYtCKO40l4ij3utGJvzjbJapLOT624dwFIVz7wE=;
 b=jQungXUzDv6tYybP8QfUc7KIHys9Ku1O51EgYMSSt87bD/8/iJla4AWV0DyifaHQmlaUWYjhcI87spoSAwSMPDWCpq0YZ05dwEYJ6iWQLJFWcOkZ6obDR6Z84Xc4tW7icIJqVmbgZaF2L1d6AVFzTbRFVP44GTubz9WnVqPcRxA=
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

QW0gMzAuMDQuMTkgdW0gMTY6MzQgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbQ0FVVElPTjog
RXh0ZXJuYWwgRW1haWxdDQo+DQo+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDA0OjI2OjMyUE0g
KzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAzMC4wNC4xOSB1bSAxNTo1OSBz
Y2hyaWViIERhbmllbCBWZXR0ZXI6DQo+Pj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6NDI6
MjJQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+Pj4gQW0gMjkuMDQuMTkgdW0g
MTA6NDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+Pj4gT24gRnJpLCBBcHIgMjYsIDIwMTkg
YXQgMDI6MzY6MjhQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+Pj4+PiBbU05J
UF0NCj4+Pj4+PiArLyoqDQo+Pj4+Pj4gKyAqIGRtYV9idWZfcGluIC0gTG9jayBkb3duIHRoZSBE
TUEtYnVmDQo+Pj4+Pj4gKyAqDQo+Pj4+Pj4gKyAqIEBkbWFidWY6ICBbaW5dICAgIERNQS1idWYg
dG8gbG9jayBkb3duLg0KPj4+Pj4+ICsgKg0KPj4+Pj4+ICsgKiBSZXR1cm5zOg0KPj4+Pj4+ICsg
KiAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4NCj4+Pj4+PiAr
ICovDQo+Pj4+Pj4gK2ludCBkbWFfYnVmX3BpbihzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQ0KPj4+
Pj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBvbiB0aGUgYXR0YWNobWVudCwgbm90IG9uIHRoZSBi
dWZmZXIuIE9yIGlzIHRoZQ0KPj4+Pj4gaWRlYSB0aGF0IGEgcGluIGlzIGZvciB0aGUgZW50aXJl
IGJ1ZmZlciwgYW5kIGFsbCBzdWJzZXF1ZW50DQo+Pj4+PiBkbWFfYnVmX21hcF9hdHRhY2htZW50
IG11c3Qgd29yayBmb3IgYWxsIGF0dGFjaG1lbnRzPyBJIHRoaW5rIHRoaXMgbWF0dGVycw0KPj4+
Pj4gZm9yIHN1ZmZpY2llbnRseSBjb250cml2ZWQgcDJwIHNjZW5hcmlvcy4NCj4+Pj4gVGhpcyBp
cyBpbmRlZWQgZm9yIHRoZSBETUEtYnVmLCBjYXVzZSB3ZSBhcmUgcGlubmluZyB0aGUgdW5kZXJs
eWluZyBiYWNraW5nDQo+Pj4+IHN0b3JlIGFuZCBub3QganVzdCBvbmUgYXR0YWNobWVudC4NCj4+
PiBZb3UgY2FuJ3QgbW92ZSB0aGUgYnVmZmVyIGVpdGhlciB3YXksIHNvIGZyb20gdGhhdCBwb2lu
dCB0aGVyZSdzIG5vDQo+Pj4gZGlmZmVyZW5jZS4gSSBtb3JlIG1lYW50IGZyb20gYW4gYWNjb3Vu
dC9hcGkgcG9pbnQgb2YgdmlldyBvZiB3aGV0aGVyIGl0J3MNCj4+PiBvayB0byBwaW4gYSBidWZm
ZXIgeW91IGhhdmVuJ3QgZXZlbiBhdHRhY2hlZCB0byB5ZXQuIEZyb20gdGhlIGNvZGUgaXQNCj4+
PiBzZWVtcyBsaWtlIGZpcnN0IHlvdSBhbHdheXMgd2FudCB0byBhdHRhY2gsIGhlbmNlIGl0IHdv
dWxkIG1ha2Ugc2Vuc2UgdG8NCj4+PiBwdXQgdGhlIHBpbi91bnBpbiBvbnRvIHRoZSBhdHRhY2ht
ZW50LiBUaGF0IG1pZ2h0IGFsc28gaGVscCB3aXRoDQo+Pj4gZGVidWdnaW5nLCB3ZSBjb3VsZCBj
aGVjayB3aGV0aGVyIGV2ZXJ5b25lIGJhbGFuY2VzIHRoZWlyIHBpbi91bnBpbg0KPj4+IGNvcnJl
Y3RseSAoaW5zdGVhZCBvZiBqdXN0IGNvdW50aW5nIGZvciB0aGUgb3ZlcmFsbCBkbWEtYnVmKS4N
Cj4+Pg0KPj4+IFRoZXJlJ3MgYWxzbyBhIHNsaWdodCBzZW1hbnRpYyBkaWZmZXJlbmNlIGJldHdl
ZW4gYSBwaW4gb24gYW4gYXR0YWNobWVudA0KPj4+ICh3aGljaCB3b3VsZCBtZWFuIHRoaXMgYXR0
YWNobWVudCBpcyBhbHdheXMgZ29pbmcgdG8gYmUgbWFwcGFibGUgYW5kIHdvbnQNCj4+PiBtb3Zl
IGFyb3VuZCksIHdoZXJlYXMgYSBwaW4gb24gdGhlIGVudGlyZSBkbWEtYnVmIG1lYW5zIHRoZSBl
bnRpcmUgZG1hLWJ1Zg0KPj4+IGFuZCBhbGwgaXQncyBhdHRhY2htZW50IG11c3QgYWx3YXlzIGJl
IG1hcHBhYmxlLiBPdG9oLCBnbG9iYWwgcGluIGlzDQo+Pj4gcHJvYmFibHkgZWFzaWVyLCB5b3Ug
anVzdCBuZWVkIHRvIGNoZWNrIGFsbCBjdXJyZW50IGF0dGFjaG1lbnRzIGFnYWluDQo+Pj4gd2hl
dGhlciB0aGV5IHN0aWxsIHdvcmsgb3Igd2hldGhlciB5b3UgbWlnaHQgbmVlZCB0byBtb3ZlIHRo
ZSBidWZmZXINCj4+PiBhcm91bmQgdG8gYSBtb3JlIHN1aXRhYmxlIHBsYWNlIChlLmcuIGlmIHlv
dSBub3QgYWxsIGNhbiBkbyBwMnAgaXQgbmVlZHMNCj4+PiB0byBnbyBpbnRvIHN5c3RlbSByYW0g
YmVmb3JlIGl0J3MgcGlubmVkKS4NCj4+Pg0KPj4+IEZvciB0aGUgYmFja2luZyBzdG9yYWdlIHlv
dSBvbmx5IHdhbnQgb25lIHBlci1ibyAtPnBpbm5lZF9jb3VudCwgdGhhdCdzDQo+Pj4gY2xlYXIs
IG15IHN1Z2dlc3Rpb24gd2FzIG1vcmUgYWJvdXQgd2hldGhlciBoYXZpbmcgbW9yZSBpbmZvcm1h
dGlvbiBhYm91dA0KPj4+IHdobydzIHBpbm5pbmcgaXMgdXNlZnVsLiBFeHBvcnRlcnMgY2FuIGFs
d2F5cyBqdXN0IGlnbm9yZSB0aGF0IGFkZGVkDQo+Pj4gaW5mb3JtYXRpb24uDQo+Pj4NCj4+Pj4g
S2V5IHBvaW50IGlzIEkgd2FudCB0byBjYWxsIHRoaXMgaW4gdGhlIGV4cG9ydGVyIGl0c2VsZiBp
biB0aGUgbG9uZyBydW4uDQo+Pj4+IEUuZy4gdGhhdCB0aGUgZXhwb3J0ZXIgc3RvcHMgd29ya2lu
ZyB3aXRoIGl0cyBpbnRlcm5hbCBzcGVjaWFsIGhhbmRsaW5nDQo+Pj4+IGZ1bmN0aW9ucyBhbmQg
dXNlcyB0aGlzIG9uZSBpbnN0ZWFkLg0KPj4+IEhtLCBub3QgZXhhY3RseSBmb2xsb3dpbmcgd2h5
IHRoZSBleHBvcnRlciBuZWVkcyB0byBjYWxsDQo+Pj4gZG1hX2J1Zl9waW4vdW5waW4sIGluc3Rl
YWQgb2Ygd2hhdGV2ZXIgaXMgdXNlZCB0byBpbXBsZW1lbnQgdGhhdC4gT3IgZG8NCj4+PiB5b3Ug
bWVhbiB0aGF0IHlvdSB3YW50IGEgLT5waW5uZWRfY291bnQgaW4gZG1hX2J1ZiBpdHNlbGYsIHNv
IHRoYXQgdGhlcmUncw0KPj4+IG9ubHkgb25lIGJvb2sta2VlcGluZyBmb3IgdGhpcz8NCj4+IFll
cywgZXhhY3RseSB0aGF0IGlzIG9uZSBvZiB0aGUgZmluYWwgZ29hbHMgb2YgdGhpcy4NCj4+DQo+
PiBXZSBjb3VsZCBvZiBjb3Vyc2UgdXNlIHRoZSBhdHRhY2htZW50IGhlcmUsIGJ1dCB0aGF0IHdv
dWxkIGRpc3F1YWxpZnkgdGhlDQo+PiBleHBvcnRlciBjYWxsaW5nIHRoaXMgZGlyZWN0bHkgd2l0
aG91dCBhbiBhdHRhY2htZW50Lg0KPiBIbSBleHBvcnRlciBjYWxsaW5nIGRtYV9idWZfcGluL3Vu
cGluIHNvdW5kcyBsaWtlIG9uZSBzZXJpb3VzbHkgaW52ZXJ0ZWQNCj4gbGFzYWduYSA6LSkNCj4N
Cj4gSSBkbyB1bmRlcnN0YW5kIHRoZSBnb2FsLCBhbGwgdGhlc2UgaW1wb3J0ZWQvZXhwb3J0ZXIg
c3BlY2lhbCBjYXNlcyBpbg0KPiBjb2RlIGFyZSBhIGJpdCBzaWxseSwgYnV0IEkgdGhpbmsgdGhl
IHByb3BlciBmaXggd291bGQgYmUgaWYgeW91IGp1c3QNCj4gYWx3YXlzIGltcG9ydCBhIGJ1ZmZl
ciwgZXZlbiB0aGUgcHJpdmF0ZSBvbmVzLCBhbGxvY2F0ZWQgYWdhaW5zdCBzb21lDQo+IGV4cG9y
dGVyLW9ubHkgdGhpbmcuIFRoZW4gaXQncyBhbHdheXMgdGhlIHNhbWUgZnVuY3Rpb24gdG8gY2Fs
bC4NCj4NCj4gQnV0IEknbSBub3Qgc3VyZSB0aGlzIGlzIGEgZ29vZCByZWFzb25zIHRvIGd1aWRl
IHRoZSBkbWEtYnVmIGludGVyZmFjZXMNCj4gZm9yIGV2ZXJ5b25lIGVsc2UuIE1vdmluZyBwaW4g
dG8gdGhlIGF0dGFjaG1lbnQgc291bmRzIGxpa2UgYSBiZXR0ZXIgaWRlYQ0KPiAoaWYgdGhlIGFi
b3ZlIGlzIHRoZSBvbmx5IHJlYXNvbiB0byBrZWVwIGl0IG9uIHRoZSBkbWEtYnVmKS4NCg0KWWVh
aCwgdGhhdCdzIG9uIG15IG1pbmQgYXMgd2VsbC4gQnV0IEknbSBydW5uaW5nIGludG8gYSBjaGlj
a2VuIGFuZCBlZ2cgDQpwcm9ibGVtIGhlcmUgYWdhaW4uDQoNCkJhc2ljYWxseSB3ZSBuZWVkIHRv
IGNvbnZlcnQgdGhlIGRyaXZlcnMgdG8gZG8gdGhlaXIgaW50ZXJuYWwgb3BlcmF0aW9uIA0KdXNp
bmcgdGhlIERNQS1idWYgYXMgdG9wIGxldmVsIG9iamVjdCBmaXJzdCBhbmQgdGhlbiB3ZSBjYW4g
c3dpdGNoIGFsbCANCmludGVybmFsIG9wZXJhdGlvbiB0byB1c2luZyBhICJub3JtYWwiIGF0dGFj
aG1lbnQuDQoNCkFkZGl0aW9uYWwgdG8gdGhhdCBpdCBzaW1wbHkgZG9lc24ndCBsb29rcyBsaWtl
IHRoZSByaWdodCBpZGVhIHRvIHVzZSANCnRoZSBhdHRhY2htZW50IGFzIHBhcmFtZXRlciBoZXJl
LiBBZnRlciBhbGwgd2UgcGluIHRoZSB1bmRlcmx5aW5nIA0KRE1BLWJ1ZiBhbmQgTk9UIHRoZSBh
dHRhY2htZW50Lg0KDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KPiAtLQ0KPiBEYW5pZWwgVmV0
dGVyDQo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiBodHRwOi8vYmxv
Zy5mZndsbC5jaA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
