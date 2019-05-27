Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06D2B501
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3204B899DC;
	Mon, 27 May 2019 12:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7E88830;
 Mon, 27 May 2019 12:25:23 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1194.namprd12.prod.outlook.com (10.168.234.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Mon, 27 May 2019 12:25:21 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 12:25:21 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 13/13] drm: allow render capable master with DRM_AUTH
 ioctls
Thread-Topic: [PATCH 13/13] drm: allow render capable master with DRM_AUTH
 ioctls
Thread-Index: AQHVFIVZyPkf3gvmG06eLvw5U69qRKZ+5XAA
Date: Mon, 27 May 2019 12:25:21 +0000
Message-ID: <b7d59964-dd42-04d9-b2dd-738898d44e42@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-13-emil.l.velikov@gmail.com>
 <fe26eded-51b0-9b8f-47c6-22cff6383c60@gmail.com>
 <20190527121015.GC15067@arch-x1c3>
In-Reply-To: <20190527121015.GC15067@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR05CA0138.eurprd05.prod.outlook.com
 (2603:10a6:207:3::16) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bf71bf1-c99d-4e27-f55f-08d6e29e62d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1194; 
x-ms-traffictypediagnostic: DM5PR12MB1194:
x-microsoft-antispam-prvs: <DM5PR12MB1194BEB22FC2AA417AEC3622831D0@DM5PR12MB1194.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(52116002)(6486002)(6246003)(8936002)(6436002)(4326008)(71190400001)(71200400001)(6916009)(99286004)(65806001)(65956001)(7736002)(66476007)(14444005)(73956011)(66446008)(64756008)(66556008)(256004)(64126003)(229853002)(65826007)(305945005)(25786009)(36756003)(66946007)(6512007)(86362001)(31696002)(54906003)(14454004)(6116002)(186003)(476003)(2616005)(46003)(446003)(11346002)(68736007)(486006)(53936002)(5660300002)(2906002)(66574012)(31686004)(8676002)(316002)(81156014)(81166006)(76176011)(6506007)(386003)(102836004)(58126008)(478600001)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1194;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7G6cR4PlsiWk5YOVsc3SzKbrbYvUCMxyBq7esKpi49QtFoIeBBUwqHbxe24syWzYv1JTmiO2lsOQqnCxZLuhvXqhcHddwtG8SuFOclZKDOKoTR9ICn6RctT9Crs79giwj2eJYJXaoeZmSNsapqkbT5OnvShMqJsYWrvST4Ooe8+hPQzG19yfpmpuus/ffDO2yXxKeEg3xE90dtPYuX6G7tSN+X9hUIUOx3R5ChdHnOJFxnLGJ44ECGW1vi6/1rth+ZNPTH4cawHB31jPd+MgX0peK4tHvN9a+QWCOYx9vsbTvBzDDjtYYY+rkr1DIS5Khe94ziW3uhfoRFctDcrMKwXd1U4SZgBa3ZBFFlce/we9R1yu63+F72IxS8DlbUZajtgg6mUmSmUKPLpwQcqaDvNgJniGe4YpaApmBG4Nj+0=
Content-ID: <A8A03050F8E744478C57E29E8A962402@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf71bf1-c99d-4e27-f55f-08d6e29e62d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 12:25:21.4636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1194
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfZ2t72EFVWgZYY2gCop0Yq0kyA4YUjXNg1FfZUp8q8=;
 b=Q9VtT/T99YJ9aA6Kl7rtEYnjdW54ygv1ovYb+GWvnMLudduEW9VZZqZ9ueapajUb02YCafcXKVacbpnjfzSH/hOg1W5e6beLR/g5BLNEyF6p/VGR0o5/x1CByKdhJnk/6RlkSXOyAH+HseuykHTU/w7NhsqMZvySW4j5EifHl/o=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDUuMTkgdW0gMTQ6MTAgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDUv
MjcsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAyNy4wNS4xOSB1bSAxMDoxNyBzY2hy
aWViIEVtaWwgVmVsaWtvdjoNCj4+PiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPg0KPj4+DQo+Pj4gVGhlcmUgYXJlIGNhc2VzIChpbiBtZXNhIGFuZCBhcHBs
aWNhdGlvbnMpIHdoZXJlIG9uZSB3b3VsZCBvcGVuIHRoZQ0KPj4+IHByaW1hcnkgbm9kZSB3aXRo
b3V0IHByb3Blcmx5IGF1dGhlbnRpY2F0aW5nIHRoZSBjbGllbnQuDQo+Pj4NCj4+PiBTb21ldGlt
ZXMgd2UgZG9uJ3QgY2hlY2sgaWYgdGhlIGF1dGhlbnRpY2F0aW9uIHN1Y2NlZWRzLCBidXQgdGhl
cmUncw0KPj4+IGFsc28gY2FzZXMgd2Ugc2ltcGx5IGZvcmdldCB0byBkbyBpdC4NCj4+Pg0KPj4+
IFRoZSBmb3JtZXIgd2FzIGEgY2FzZSBmb3IgTWVzYSB3aGVyZSBpdCBkaWQgbm90IG5vdCBjaGVj
ayB0aGUgcmV0dXJuDQo+Pj4gdmFsdWUgb2YgZHJtR2V0TWFnaWMoKSBbMV0uIFRoYXQgd2FzIGZp
eGVkIHJlY2VudGx5IGFsdGhvdWdoLCB0aGVyZSdzDQo+Pj4gdGhlIHF1ZXN0aW9uIG9mIG9sZGVy
IGRyaXZlcnMgb3Igb3RoZXIgYXBwcyB0aGF0IGV4YmliaXQgdGhpcyBiZWhhdmlvdXIuDQo+Pj4N
Cj4+PiBXaGlsZSBvbWl0dGluZyB0aGUgY2FsbCByZXN1bHRzIGluIGlzc3VlcyBhcyBzZWVuIGlu
IFsyXSBhbmQgWzNdLg0KPj4+DQo+Pj4gSW4gdGhlIGxpYnZhIGNhc2UsIGxpYnZhIGl0c2VsZiBk
b2Vzbid0IGF1dGhlbnRpY2F0ZSB0aGUgRFJNIGNsaWVudCBhbmQNCj4+PiB0aGUgdmFHZXREaXNw
bGF5RFJNIGRvY3VtZW50YXRpb24gZG9lc24ndCBtZW50aW9uIGlmIHRoZSBhcHAgc2hvdWxkDQo+
Pj4gZWl0aGVyLg0KPj4+DQo+Pj4gQXMgb2YgdG9kYXksIHRoZSBvZmZpY2lhbCB2YWluZm8gdXRp
bGl0eSBkb2Vzbid0IGF1dGhlbnRpY2F0ZS4NCj4+Pg0KPj4+IFRvIHdvcmthcm91bmQgaXNzdWVz
IGxpa2UgdGhlc2UsIHNvbWUgdXNlcnMgcmVzb3J0IHRvIHJ1bm5pbmcgdGhlaXIgYXBwcw0KPj4+
IHVuZGVyIHN1ZG8uIFdoaWNoIGFkbWl0dGVkbHkgaXNuJ3QgYWx3YXlzIGEgZ29vZCBpZGVhLg0K
Pj4+DQo+Pj4gU2luY2UgYW55IERSSVZFUl9SRU5ERVIgZHJpdmVyIGhhcyBzdWZmaWNpZW50IGlz
b2xhdGlvbiBiZXR3ZWVuIGNsaWVudHMsDQo+Pj4gd2UgY2FuIHVzZSB0aGF0LCBmb3IgdW5hdXRo
ZW50aWNhdGVkIFtwcmltYXJ5IG5vZGVdIGlvY3RscyB0aGF0IHJlcXVpcmUNCj4+PiBEUk1fQVVU
SC4gQnV0IG9ubHkgaWYgdGhlIHJlc3BlY3RpdmUgaW9jdGwgaXMgdGFnZ2VkIGFzIERSTV9SRU5E
RVJfQUxMT1cuDQo+Pj4NCj4+PiB2MjoNCj4+PiAtIFJld29yay9zaW1wbGlmeSBpZiBjaGVjayAo
RGFuaWVsIFYpDQo+Pj4gLSBBZGQgZXhhbXBsZXMgdG8gY29tbWl0IG1lc3NhZ2VzLCBlbGFib3Jh
dGUuIChEYW5pZWwgVikNCj4+Pg0KPj4+IHYzOg0KPj4+IC0gVXNlIHNpbmdsZSB1bmxpa2VseSAo
RGFuaWVsIFYpDQo+Pj4NCj4+PiB2NDoNCj4+PiAtIFBhdGNoIHdhcyByZXZlcnRlZCBiZWNhdXNl
IGl0IGJyb2tlIEFNREdQVSwgYXBwbHkgYWdhaW4uIFRoZSBBTURHUFUNCj4+PiBpc3N1ZSBpcyBm
aXhlZCB3aXRoIGVhcmxpZXIgcGF0Y2guDQo+PiBBcyBmYXIgYXMgSSBjYW4gc2VlIHRoaXMgb25s
eSBhZmZlY3RzIHRoZSBmb2xsb3dpbmcgdHdvIElPQ1RMcyBhZnRlcg0KPj4gcmVtb3ZpbmcgRFJN
X0FVVEggZnJvbSB0aGUgRFJNX1JFTkRFUl9BTExPVyBJT0NUTHM6DQo+Pj4gRFJNX0lPQ1RMX0RF
RihEUk1fSU9DVExfUFJJTUVfSEFORExFX1RPX0ZELA0KPj4+IGRybV9wcmltZV9oYW5kbGVfdG9f
ZmRfaW9jdGwsIERSTV9BVVRIfERSTV9VTkxPQ0tFRHxEUk1fUkVOREVSX0FMTE9XKSwNCj4+PiAg
wqDCoMKgwqDCoMKgwqAgRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfUFJJTUVfRkRfVE9fSEFORExF
LA0KPj4+IGRybV9wcmltZV9mZF90b19oYW5kbGVfaW9jdGwsIERSTV9BVVRIfERSTV9VTkxPQ0tF
RHxEUk1fUkVOREVSX0FMTE9XKQ0KPj4gU28gSSB0aGluayBpdCB3b3VsZCBiZSBzaW1wbGVyIHRv
IGp1c3QgcmVtb3ZlIERSTV9BVVRIIGZyb20gdGhvc2UgdHdvDQo+PiBpbnN0ZWFkIG9mIGFsbG93
aW5nIGl0IGZvciBldmVyeWJvZHkuDQo+Pg0KPiBJZiBJIHVuZGVyc3RhbmQgeW91IGNvcnJlY3Rs
eSB0aGlzIHdpbGwgcmVtb3ZlIERSTV9BVVRIIGFsc28gZm9yIGRyaXZlcnMNCj4gd2hpY2ggZXhw
b3NlIG9ubHkgYSBwcmltYXJ5IG5vZGUuIEknbSBub3Qgc3VyZSBpZiB0aGF0IGlzIGEgZ29vZCBp
ZGVhLg0KDQpUaGF0J3MgYSBnb29kIHBvaW50LCBidXQgSSBoYXZlIGRvdWJ0cyB0aGF0IHRob3Nl
IGRyaXZlcnMgaW1wbGVtZW50IHRoZSANCm5lY2Vzc2FyeSBjYWxsYmFja3MgYW5kL29yIHNldCB0
aGUgY29yZSBmZWF0dXJlIGZsYWcgZm9yIHRoZSBJT0NUTHMuDQoNClNvIHRoZSBtYXhpbXVtIHdo
YXQgY291bGQgaGFwcGVuIGlzIHRoYXQgeW91IGNoYW5nZSB0aGUgcmV0dXJuZWQgZXJyb3IgDQpm
cm9tIC1FQUNDRVMgaW50byAtRU9QTk9UU1VQUC8tRU5PU1lTLg0KDQpSZWdhcmRzLA0KQ2hyaXN0
aWFuLg0KDQo+IFRoYXQgc2FpZCwgaWYgb3RoZXJzIGFyZSBPSyB3aXRoIHRoZSBpZGVhIEkgd2ls
bCBwcmVwYXJlIGEgcGF0Y2guDQo+DQo+IFRoYW5rcw0KPiBFbWlsDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
