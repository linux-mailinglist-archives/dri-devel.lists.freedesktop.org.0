Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C635F57
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D4289BF4;
	Wed,  5 Jun 2019 14:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F4289BF3;
 Wed,  5 Jun 2019 14:33:26 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3948.namprd12.prod.outlook.com (10.255.174.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 14:33:23 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 14:33:23 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Topic: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Index: AQHVGulumcQO4MHYPEKs04RBKBQsGKaL1d4AgAAEnACAARI6AIAAKmoAgAAKToA=
Date: Wed, 5 Jun 2019 14:33:23 +0000
Message-ID: <08323655-c784-3adc-88a6-a9066bdfb4f7@amd.com>
References: <20190604152306.1804-1-christian.koenig@amd.com>
 <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
 <BL0PR12MB2580B3E88C17043DE402CF3280150@BL0PR12MB2580.namprd12.prod.outlook.com>
 <5a0f4e09-2614-5bbc-b8a2-53746bbb0b15@gmail.com>
 <1a0e5fdc-5b9d-844c-10cb-2cc880863142@daenzer.net>
In-Reply-To: <1a0e5fdc-5b9d-844c-10cb-2cc880863142@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7eadd85d-1b87-4a40-c287-08d6e9c2c391
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3948; 
x-ms-traffictypediagnostic: DM6PR12MB3948:
x-microsoft-antispam-prvs: <DM6PR12MB39486F830F995D460194D26192160@DM6PR12MB3948.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(366004)(376002)(346002)(189003)(199004)(8676002)(64126003)(31696002)(58126008)(6246003)(14454004)(110136005)(66476007)(66946007)(6512007)(36756003)(66574012)(73956011)(66556008)(64756008)(66446008)(2201001)(229853002)(86362001)(305945005)(25786009)(2906002)(446003)(256004)(476003)(2616005)(6436002)(486006)(81166006)(81156014)(316002)(478600001)(14444005)(8936002)(71190400001)(71200400001)(5660300002)(11346002)(6116002)(53936002)(99286004)(7736002)(65826007)(6486002)(52116002)(72206003)(186003)(66066001)(68736007)(76176011)(2501003)(53546011)(6506007)(386003)(102836004)(3846002)(65956001)(31686004)(65806001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3948;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sSS4ZUSvZzrwkNAWLk2CGUuHfrPFBz1/qNVokJt/6UjWSPiXPOHojO44VzFxSqBVp8oRKcrhL8e7oZcacLKuKoN7FzrbGV8DUttChiCALgyEAFiMfhcNGaTb8MC0Zd3BTpxsMJddqksr8uUtNF3fztoEzJWFLKCKrfOxrDt2n8woqIxY2bJjUQW6+62Vor1VXk8HNiTacj1/+B2Ba0dg2MXJMof3J/aDJ0m0Pd+VTk2QvhGug0z6W1j3GxFWmtWCs8DraMwAC/hQo2EXq+R2jRPgMcy/tA0exATVX9WdsHLbOPDtYm/ckOb9goWAM4VfKq8siHFaovbJKjd0M46dp6wuLf/awdLrUhzcZYHUPVPYmkY+Phe8OQMePzY93IQeRsD9tRl++ObVjpLPLiiCYpk84XCVFizAEzPPUsCJPBM=
Content-ID: <8A862C6C08EBA843867622D7CF9A97C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eadd85d-1b87-4a40-c287-08d6e9c2c391
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 14:33:23.7018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3948
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZ6bGljHOUOXJQFIprrdYmliYtH4Azisbrbb75heoNo=;
 b=UDvLXTyY23BMKzFpzBKt8iweIqPkpodQ5rbUPsjBbJCNdqV70KOI6nFSx+jJ3A7BvNyo2FBiEB9G70GCNLFQrB3ndgJCRxrdESk6o6Wwq7WFBHaviXl/hsYhmASupawaYvi6FZ8Zp5M0QtCjS/Urstn72E1yt9g+zhksp2wvdOo=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0wNSA5OjU2LCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gT24gMjAxOS0wNi0w
NSAxOjI0IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAwNC4wNi4xOSB1bSAy
MTowMyBzY2hyaWViIFplbmcsIE9hazoNCj4+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4+PiBLdWVobGluZywgRmVs
aXgNCj4+PiBPbiAyMDE5LTA2LTA0IDExOjIzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KW3Nu
aXBdDQo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaA0KPj4+ICsrKyBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4+PiBAQCAtNzY3LDE0ICs3NjcsMTIg
QEAgc3RhdGljIGlubGluZSBpbnQNCj4+PiB0dG1fYm9fcmVzZXJ2ZV9zbG93cGF0aChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPj4+ICDCoMKgwqAgKi8NCj4+PiAgwqDCoCBzdGF0aWMg
aW5saW5lIHZvaWQgdHRtX2JvX3VucmVzZXJ2ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
KQ0KPj4+ICDCoMKgIHsNCj4+PiAtwqDCoMKgIGlmICghKGJvLT5tZW0ucGxhY2VtZW50ICYgVFRN
X1BMX0ZMQUdfTk9fRVZJQ1QpKSB7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmYm8t
PmJkZXYtPmdsb2ItPmxydV9sb2NrKTsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGxpc3RfZW1w
dHkoJmJvLT5scnUpKQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9ib19hZGRfdG9f
bHJ1KGJvKTsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgZWxzZQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKGJvLCBOVUxMKTsNCj4+PiAtwqDCoMKgwqDC
oMKgwqAgc3Bpbl91bmxvY2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7DQo+Pj4gLcKgwqDC
oCB9DQo+Pj4gK8KgwqDCoCBzcGluX2xvY2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7DQo+
Pj4gK8KgwqDCoCBpZiAobGlzdF9lbXB0eSgmYm8tPmxydSkpDQo+Pj4gK8KgwqDCoMKgwqDCoMKg
IHR0bV9ib19hZGRfdG9fbHJ1KGJvKTsNCj4+PiArwqDCoMKgIGVsc2UNCj4+PiArwqDCoMKgwqDC
oMKgwqAgdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoYm8sIE5VTEwpOw0KPj4+IEdvaW5nIGp1c3Qg
YnkgdGhlIGZ1bmN0aW9uIG5hbWVzLCB0aGlzIHNlZW1zIHRvIGRvIHRoZSBleGFjdCBvcHBvc2l0
ZQ0KPj4+IG9mIHdoYXQgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbiBzYXlzLg0KPj4+DQo+Pj4gW09h
a10gKzEsIHdoZW4gSSByZWFkIHRoZSBkZXNjcmlwdGlvbiwgSSBhbHNvIGdldCBsb3N0Li4uU28g
cGxlYXNlIGRvDQo+Pj4gYWRkIGEgbW9yZSBhY2N1cmF0ZSBkZXNjcmlwdGlvbi4NCj4+IEknbSBw
dXp6bGVkIHdoeSB5b3UgYXJlIGNvbmZ1c2VkLiBXZSBub3cga2VlcCB0aGUgQk9zIG9uIHRoZSBM
UlUgd2hpbGUNCj4+IHRoZXkgYXJlIHJlc2VydmVkLCBzbyBvbiB1bnJlc2VydmUgd2Ugbm93IG5l
ZWQgdG8gZXhwbGljaXRseSByZW1vdmUgdGhlbQ0KPj4gZnJvbSB0aGUgTFJVIHdoZW4gdGhleSBh
cmUgcGlubmVkLg0KPiBJIGRvbid0IGtub3cgYWJvdXQgRmVsaXggYW5kIE9haywgYnV0IGZvciBt
ZSAicmVtb3ZlIGZyb20gdGhlIExSVSIgaXMNCj4gY29uZnVzaW5nLCBhcyBJIGRvbid0IHNlZSB0
aGF0IGluIHRoZSBjb2RlLCBvbmx5IGFkZGluZyB0byB0aGUgTFJVIG9yDQo+IG1vdmluZyB0byBp
dHMgdGFpbC4NCg0KRXhhY3RseS4gVGhlIG5hbWVzIG9mIHRoZSBmdW5jdGlvbnMgYmVpbmcgY2Fs
bGVkIGltcGx5IHRoYXQgc29tZXRoaW5nIA0KZ2V0cyBhZGRlZCBvciBtb3ZlZCBvbiB0aGUgTFJV
IGxpc3QuIFlvdSBoYXZlIHRvIGdvIGxvb2sgYXQgdGhlIA0KaW1wbGVtZW50YXRpb24gb2YgdGhv
c2UgZnVuY3Rpb25zIHRvIGZpbmQgb3V0IHRoYXQgdGhleSBkbyBzb21ldGhpbmcgDQplbHNlIGZv
ciBwaW5uZWQgQk9zICh0aGF0IGhhdmUgVFRNX1BMX0ZMQUdfTk9fRVZJQ1Qgc2V0IGluIHRoZWly
IA0KcGxhY2VtZW50IGZsYWdzKS4NCg0KRml4aW5nIHRoZSBmdW5jdGlvbiBuYW1lcyB3b3VsZCBw
cm9iYWJseSBiZSBvdmVya2lsbDogDQp0dG1fYm9fYWRkX2xydV91bmxlc3NfcGlubmVkIGFuZCAN
CnR0bV9ib19tb3ZlX3RvX2xydV90YWlsX29yX3JlbW92ZV9pZl9waW5uZWQuIEJ1dCBtYXliZSBh
IGNvbW1lbnQgaW4gDQp0dG1fYm9fdW5yZXNlcnZlIHdvdWxkIGhlbHAuDQoNClJlZ2FyZHMsDQog
wqAgRmVsaXgNCg0KDQo+DQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
