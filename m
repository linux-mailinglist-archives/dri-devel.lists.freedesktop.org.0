Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C455A271
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 19:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7126E1CF;
	Fri, 28 Jun 2019 17:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16296E1CF;
 Fri, 28 Jun 2019 17:32:22 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2344.namprd12.prod.outlook.com (52.132.140.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Fri, 28 Jun 2019 17:32:21 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 17:32:20 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Topic: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Index: AQHVLP3VMWiF09ciQkWCisybAkUKsaavpWqAgAAXJ4CAAAKTAIAALBUAgACxN4CAABAtgIAAE82AgAAQ0QCAAAv+gIAARySAgAAL2YCAABZDAIAADmQA
Date: Fri, 28 Jun 2019 17:32:20 +0000
Message-ID: <060a49d3-7196-1440-db93-4a19c9170f1b@amd.com>
References: <20190627101813.61430-1-christian.koenig@amd.com>
 <20190627101813.61430-2-christian.koenig@amd.com>
 <CAKMK7uGtdSxVSUor8P_8XH+uf4_A-kRfY6h+XnJoizscWE4AOg@mail.gmail.com>
 <f1a792c2-87e0-9aba-c6f1-0374122d025b@gmail.com>
 <CAKMK7uFoeugD0ASHm4DRLzq6h3aAvNhE1ODh-bxoH7Lucf1m3w@mail.gmail.com>
 <5e182e5d-efcb-00bd-fa31-6e8bc9571ce6@amd.com>
 <20190627171053.GN12905@phenom.ffwll.local>
 <4844af2e-fbff-ceb9-c16e-32bb7012559f@amd.com>
 <CAKMK7uF2Wb_K9MqALs8o_2i+HDhv=JcnHj6t4VAUO80UVpszZQ@mail.gmail.com>
 <6e9b4005-e490-ab27-2051-1eab801dafd3@amd.com>
 <CAKMK7uFMZLemYkWTyOH_0akUbE53X44Xj7jky90G-jWtwSUicw@mail.gmail.com>
 <92ea4ca1-bb9d-e4d7-792a-33b74f25ccf8@gmail.com>
 <CAKMK7uG-5e_V1OmWJKyHLGLXhBbex1LCVV7cdWjAgLSk-kTozA@mail.gmail.com>
 <1031bb44-449a-f18b-d217-2cb5a4f820f7@amd.com>
 <CAKMK7uFDKDhJQ05b6yb8Srz5E=YkzL+PGTZTYZX-b5dmWrwBVQ@mail.gmail.com>
 <af333288-9804-30e4-28ef-fda4c18b4a5d@amd.com>
 <CAKMK7uEQA1CCWLynH3zFK4PtHdzsJ7c=eAyumuhT58Zw455DHg@mail.gmail.com>
In-Reply-To: <CAKMK7uEQA1CCWLynH3zFK4PtHdzsJ7c=eAyumuhT58Zw455DHg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM7PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::15) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 068a9815-bc04-413a-aace-08d6fbee92d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2344; 
x-ms-traffictypediagnostic: DM5PR12MB2344:
x-microsoft-antispam-prvs: <DM5PR12MB2344826DEC4022EDD734AC1C83FC0@DM5PR12MB2344.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(53834002)(199004)(189003)(72206003)(86362001)(31696002)(65826007)(229853002)(81156014)(81166006)(14454004)(52116002)(102836004)(99286004)(76176011)(6246003)(478600001)(6916009)(186003)(64126003)(5660300002)(6512007)(53936002)(386003)(6506007)(53546011)(316002)(66476007)(66556008)(66446008)(58126008)(64756008)(14444005)(54906003)(5024004)(36756003)(66946007)(256004)(2906002)(73956011)(4326008)(305945005)(65806001)(7736002)(65956001)(6486002)(71200400001)(71190400001)(8676002)(68736007)(46003)(6116002)(6436002)(486006)(476003)(8936002)(2616005)(11346002)(25786009)(446003)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2344;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dIwp6GbRgYbO6eeiiTe7XjdlAylm9huzda5NXRn2EmQmQXlglUzwDuaKgBHCqUJFhki2NjztLaAS29vH6K+dHvBAS51OBDtW0+QXrBZwPG+lZi+TichqpQNKOsPj+6mqrsHYlyWJ/gFMnz9gHxOgePNnzu5LO4N5GaZfGzHVA9dd0WlkVrptf3LAaCQJCQVcOw8TG64MQSH8l70oobZSjMKjYqE914o8354GE8PFyNFe+A0ETX54VKr8rpZmVK3RNfPS3XEL08rpCj2pdrdJpBG86DmuSMccZxWwE+h//Tw28QqgJ7VJRRBF81NCE5XrjA5xm9Zl4LrtMOQq6IjzqKw6yFtLBYlkYb1JTpJAquw81GV++atHlmccDNfGniS3Ul1TgAJ24sCDAXfYBSQGO61qwJvae7SpDT9GMgcsO5o=
Content-ID: <99853493128D3A46A4F0B4C3AE86FAD0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068a9815-bc04-413a-aace-08d6fbee92d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 17:32:20.7990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2344
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th5/Gr2KgipVPlRclo3JPJOwze3lPCGXJAJJaKYCwr0=;
 b=tBBzQStzemS1IYlHx5H6Ds1JpiyHQDlkX08nsX6Mb8PxWenNuzPB/b5VI9WtpBqoRcjzT3EwsDRHT9kP/M8UVtxAyD0QoYAnw0dmecX6f4MReL4sjLTZTpP9iDepuY4GCd4yHuN8MQRXN6ytF+RF+KZozDv8mdcG0xKk63nrWv4=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDYuMTkgdW0gMTg6NDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBGcmksIEp1
biAyOCwgMjAxOSBhdCA1OjIxIFBNIEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+IHdyb3RlOg0KPj4gQW0gMjguMDYuMTkgdW0gMTY6Mzggc2NocmllYiBEYW5p
ZWwgVmV0dGVyOg0KPj4gW1NOSVBdDQo+Pj4+Pj4+IC0gd2hlbiB5b3Ugc3VibWl0IGNvbW1hbmQg
YnVmZmVycywgeW91IF9kb250XyBhdHRhY2ggZmVuY2VzIHRvIGFsbA0KPj4+Pj4+PiBpbnZvbHZl
ZCBidWZmZXJzDQo+Pj4+Pj4gVGhhdCdzIG5vdCBnb2luZyB0byB3b3JrIGJlY2F1c2UgdGhlbiB0
aGUgbWVtb3J5IG1hbmFnZW1lbnQgdGhlbiB0aGlua3MNCj4+Pj4+PiB0aGF0IHRoZSBidWZmZXIg
aXMgaW1tZWRpYXRlbHkgbW92YWJsZSwgd2hpY2ggaXQgaXNuJ3QsDQo+Pj4+PiBJIGd1ZXNzIHdl
IG5lZWQgdG8gZml4IHRoYXQgdGhlbi4gSSBwcmV0dHkgbXVjaCBhc3N1bWVkIHRoYXQNCj4+Pj4+
IC0+bm90aWZ5X21vdmUgY291bGQgYWRkIHdoYXRldmVyIGZlbmNlcyB5b3UgbWlnaHQgd2FudCB0
byBhZGQuIFdoaWNoDQo+Pj4+PiB3b3VsZCB2ZXJ5IG5lYXRseSBhbGxvdyB1cyB0byBzb2x2ZSB0
aGlzIHByb2JsZW0gaGVyZSwgaW5zdGVhZCBvZg0KPj4+Pj4gY29taW5nIHVwIHdpdGggZmFrZSBm
ZW5jZXMgYW5kIGZ1biBzdHVmZiBsaWtlIHRoYXQuDQo+Pj4+IEFkZGluZyB0aGUgZmVuY2UgbGF0
ZXIgb24gaXMgbm90IGEgc29sdXRpb24gYmVjYXVzZSB3ZSBuZWVkIHNvbWV0aGluZw0KPj4+PiB3
aGljaCBiZWZvcmVoYW5kIGNhbiBjaGVjayBpZiBhIGJ1ZmZlciBpcyBtb3ZhYmxlIG9yIG5vdC4N
Cj4+Pj4NCj4+Pj4gSW4gdGhlIGNhc2Ugb2YgYSBtb3ZlX25vdGlmeSB0aGUgZGVjaXNpb24gdG8g
bW92ZSBpdCBpcyBhbHJlYWR5IGRvbmUgYW5kDQo+Pj4+IHlvdSBjYW4ndCBzYXkgb2ggc29ycnkg
SSBoYXZlIHRvIGV2aWN0IG15IHByb2Nlc3MgYW5kIHJlcHJvZ3JhbSB0aGUNCj4+Pj4gaGFyZHdh
cmUgb3Igd2hhdGV2ZXIuDQo+Pj4+DQo+Pj4+IEVzcGVjaWFsbHkgd2hlbiB5b3UgZG8gdGhpcyBp
biBhbiBPT00gc2l0dWF0aW9uLg0KPj4+IFdoeT8gSSBtZWFuIHdoZW4gdGhlIGZlbmNlIGZvciBh
IENTIGlzIHRoZXJlIGFscmVhZHksIGl0IG1pZ2h0IGFsc28NCj4+PiBzdGlsbCBoYW5nIG91dCBp
biB0aGUgc2NoZWR1bGVyLCBvciBiZSBibG9ja2VkIG9uIGEgZmVuY2UgZnJvbSBhbm90aGVyDQo+
Pj4gZHJpdmVyLCBvciBhbnl0aGluZyBsaWtlIHRoYXQuIEkgZG9uJ3Qgc2VlIGEgY29uY2VwdHVh
bCBkaWZmZXJlbmNlLg0KPj4+IFBsdXMgd2l0aCBkeW5hbWljIGRtYS1idWYgdGhlIGVudGlyZSBw
b2ludCBpcyB0aGF0IGFuIGF0dGFjaGVkIGZlbmNlcw0KPj4+IGRvZXMgX25vdF8gbWVhbiB0aGUg
YnVmZmVyIGlzIHBlcm1hbmVudGx5IHBpbm5lZCwgYnV0IGNhbiBiZSBtb3ZlZCBpZg0KPj4+IHlv
dSBzeW5jIGNvcnJlY3RseS4gTWlnaHQgbmVlZCBhIGJpdCBvZiB0dW5pbmcgb3IgYSBmbGFnIHRv
IGluZGljYXRlDQo+Pj4gdGhhdCBzb21lIGJ1ZmZlcnMgc2hvdWxkIGFsd2FzeSBjb25zaWRlcmVk
IHRvIGJlIGJ1c3ksIGFuZCB0aGF0IHlvdQ0KPj4+IHNob3VsZG4ndCBzdGFydCBldmljdGluZyB0
aG9zZS4gQnV0IHRoYXQncyBraW5kYSBhIGRldGFpbC4NCj4+Pg0KPj4+ICAgRnJvbSBhIHZlcnkg
aGlnaCBsZXZlbCB0aGVyZSdzIHJlYWxseSBubyBkaWZmZXJlbmNlIGJldHdlbg0KPj4+IC0+bm90
aWZ5X21vdmUgYW5kIHRoZSBldmljdGlvbl9mZW5jZS4gQm90aCBnaXZlIHlvdSBhIGNhbGxiYWNr
IHdoZW4NCj4+PiBzb21lb25lIGVsc2UgbmVlZHMgdG8gbW92ZSB0aGUgYnVmZmVyLCB0aGF0J3Mg
YWxsLiBUaGUgb25seSBkaWZmZXJlbmNlDQo+Pj4gaXMgdGhhdCB0aGUgZXZpY3Rpb25fZmVuY2Ug
dGhpbmcganVtYmxlcyB0aGUgY2FsbGJhY2sgYW5kIHRoZSBmZW5jZQ0KPj4+IGludG8gb25lLCBi
eSBwcmVhdHRhY2hpbmcgYSBmZW5jZSBqdXN0IGluIGNhc2UuIEJ1dCBhZ2FpbiBmcm9tIGENCj4+
PiBjb25jZXB0dWFsIHBvdiBpdCBkb2Vzbid0IG1hdHRlciB3aGV0aGVyIHRoZSBmZW5jZSBpcyBh
bHdheXMgaGFuZ2luZw0KPj4+IGFyb3VuZCwgb3Igd2hldGhlciB5b3UganVzdCBhdHRhY2ggaXQg
d2hlbiAtPm5vdGlmeV9tb3ZlIGlzIGNhbGxlZC4NCj4+IFN1cmUgdGhlcmUgaXMgYSBkaWZmZXJl
bmNlLiBTZWUgd2hlbiB5b3UgYXR0YWNoIHRoZSBmZW5jZSBiZWZvcmVoYW5kIHRoZQ0KPj4gbWVt
b3J5IG1hbmFnZW1lbnQgY2FuIGtub3cgdGhhdCB0aGUgYnVmZmVyIGlzIGJ1c3kuDQo+Pg0KPj4g
SnVzdCBpbWFnaW5lIHRoZSBmb2xsb3dpbmc6IFdlIGFyZSBpbiBhbiBPT00gc2l0dWF0aW9uIGFu
ZCBuZWVkIHRvIHN3YXANCj4+IHRoaW5ncyBvdXQgdG8gZGlzayENCj4+DQo+PiBXaGVuIHRoZSBm
ZW5jZSBpcyBhdHRhY2hlZCBiZWZvcmVoYW5kIHRoZSBoYW5kbGluZyBjYW4gYmUgYXMgZm9sbG93
aW5nOg0KPj4gMS4gTU0gcGlja3MgYSBCTyBmcm9tIHRoZSBMUlUgYW5kIHN0YXJ0cyB0byBldmlj
dCBpdC4NCj4+IDIuIFRoZSBldmljdGlvbiBmZW5jZSBpcyBlbmFibGVkIGFuZCB3ZSBzdG9wIHRo
ZSBwcm9jZXNzIHVzaW5nIHRoaXMgQk8uDQo+PiAzLiBBcyBzb29uIGFzIHRoZSBwcm9jZXNzIGlz
IHN0b3BwZWQgdGhlIGZlbmNlIGlzIHNldCBpbnRvIHRoZSBzaWduYWxlZA0KPj4gc3RhdGUuDQo+
PiA0LiBNTSBuZWVkcyB0byBldmljdCBtb3JlIEJPcyBhbmQgc2luY2UgdGhlIGZlbmNlIGZvciB0
aGlzIHByb2Nlc3MgaXMNCj4+IG5vdyBpbiB0aGUgc2lnbmFsZWQgc3RhdGUgaXQgY2FuIGludGVu
dGlvbmFsbHkgcGljayB0aGUgb25lcyB1cCB3aGljaA0KPj4gYXJlIG5vdyBpZGxlLg0KPj4NCj4+
IFdoZW4gd2UgYXR0YWNoIHRoZSBmZW5jZSBvbmx5IG9uIGV2aWN0aW9uIHRoYXQgY2FuJ3QgaGFw
cGVuIGFuZCB0aGUgTU0NCj4+IHdvdWxkIGp1c3QgcGljayB0aGUgbmV4dCByYW5kb20gQk8gYW5k
IHBvdGVudGlhbGx5IHN0b3AgYW5vdGhlciBwcm9jZXNzLg0KPj4NCj4+IFNvIEkgdGhpbmsgd2Ug
Y2FuIHN1bW1hcml6ZSB0aGF0IHRoZSBtZW1vcnkgbWFuYWdlbWVudCBkZWZpbml0ZWx5IG5lZWRz
DQo+PiB0byBrbm93IGJlZm9yZWhhbmQgaG93IGNvc3RseSBpdCBpcyB0byBldmljdCBhIEJPLg0K
Pj4NCj4+IEFuZCBvZiBjb3Vyc2UgaW1wbGVtZW50IHRoaXMgd2l0aCBmbGFncyBvciB1c2UgY291
bnRlcnMgb3Igd2hhdGV2ZXIsIGJ1dA0KPj4gd2UgYWxyZWFkeSBoYXZlIHRoZSBmZW5jZSBpbmZy
YXN0cnVjdHVyZSBhbmQgSSBkb24ndCBzZWUgYSByZWFzb24gbm90IHRvDQo+PiB1c2UgaXQuDQo+
IE9rLCBmb3IgdGhlIHNha2Ugb2YgdGhlIGFyZ3VtZW50IGxldCdzIGJ1eSB0aGlzLg0KPg0KPiBX
aHkgZG8gd2UgbmVlZCBhIC0+bm90aWZ5X21vdmUgY2FsbGJhY2sgdGhlbj8gV2UgaGF2ZSBpdCBh
bHJlYWR5LCB3aXRoDQo+IHRoZXNlIHNwZWNpYWwgZmVuY2VzLg0KDQpZZWFoLCB0aGF0IHNhbWUg
dGhvdWdodCBjYW1lIHRvIG15IG1pbmQgYXMgd2VsbC4NCg0KT25lIGRpZmZlcmVuY2UgaXMgdGhh
dCBub3RpZnlfbW92ZSBpcyBvbmx5IGNhbGxlZCB3aGVuIHRoZSBCTyBpcyANCmFjdHVhbGx5IG1v
dmVkLCB3aGlsZSB0aGUgZmVuY2UgY2FuIGJlIGNhbGxlZCBmb3Igb3RoZXIgc3luY2hyb25pemF0
aW9uIA0KcmVhc29ucyBhcyB3ZWxsLg0KDQo+IE90aGVyIHNpZGU6IElmIGFsbCB5b3Ugd2FudCB0
byBrbm93IGlzIHdoZXRoZXIgeW91IGNhbiB1bm1hcCBhIGJ1ZmZlcg0KPiBpbW1lZGlhdGVseSwg
Zm9yIHNvbWUgc2hvcnQgZW5vdWdoIHZhbHVlIG9mIGltbWVkaWF0ZWx5IChJIGd1ZXNzIGENCj4g
YnVuY2ggb2YgcGFnZXRhYmxlIHdyaXRlcyBzaG91bGQgYmUgb2spLCB0aGVuIHdoeSBub3QgYWRk
IHRoYXQ/IFRoZSAiSQ0KPiBkb24ndCB3YW50IHRvIHRvdWNoIGFsbCBidWZmZXJzIGZvciBldmVy
eSBDUywgYnV0IGp1c3QgaGF2ZSBhIHBpbm5lZA0KPiB3b3JraW5nIHNldCIgY29tbWFuZCBzdWJt
aXNzaW9uIG1vZGVsIGlzIHF1aXRlIGRpZmZlcmVudCBhZnRlciBhbGwsDQo+IGhhdmluZyBkZWRp
Y2F0ZWQgaW5mcmFzdHJ1Y3R1cmUgdGhhdCBmaXRzIHdlbGwgc291bmRzIGxpa2UgYSBnb29kIGlk
ZWENCj4gdG8gbWUuDQoNCk9rLCB3ZWxsIEkgdGhpbmsgSSBjYW4gYWdyZWUgb24gdGhhdC4NCg0K
T25lIG9mIHRoZSBtYWluIHB1cnBvc2VzIHVzaW5nIHRoZSBmZW5jZSB3YXMgZXNzZW50aWFsbHkg
dG8gYXZvaWQgDQpjcmVhdGluZyBkdXBsaWNhdGVkIGluZnJhc3RydWN0dXJlLiBBbmQgSSBzdGls
bCB0aGluayB0aGF0IHRoaXMgaXMgYSANCmdvb2QgaWRlYS4gU28gSSB0aGluayB3ZSBzaG91bGQg
ZXNzZW50aWFsbHkgYWltIGZvciBzb21ldGhpbmcgd2hpY2ggDQp3b3JrcyBmb3IgYm90aCB1c2Ug
Y2FzZXMuDQoNCk1heWJlIHdlIHNlZSB0aGlzIGZyb20gdGhlIHdyb25nIHNpZGU/IEZlbmNlcyBz
dGFydGVkIG9mIGFzIGV2ZW50IHN5c3RlbSANCnRvIG5vdGUgYWJvdXQgY29tcGxldGlvbiBvZiBv
cGVyYXRpb25zLg0KDQpCdXQgd2hhdCB3ZSBlc3NlbnRpYWxseSBuZWVkIGZvciBtZW1vcnkgbWFu
YWdlbWVudCBpcyBhKSBrbm93IGlmIHRoZSBCTyANCmlzIHVzZWQsIGIpIHNvbWUgZm9ybSBvZiBl
dmVudC9jYWxsYmFjayB0byBzdG9wIHVzaW5nIGl0IGMpIGFuIA0KZXZlbnQvY2FsbGJhY2sgYmFj
ayB0byBsZXQgdGhlIE1NIGtub3cgdGhhdCBpdCBpcyBub3QgdXNlZCBhbnkgbW9yZS4NCg0KU28g
dGFraW5nIGEgc3RlcCBiYWNrIHdoYXQgc2hvdWxkIHRoZSBpZGVhbCBzb2x1dGlvbiBsb29rIGxp
a2U/DQoNCkNocmlzdGlhbi4NCg0KPiAtRGFuaWVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
