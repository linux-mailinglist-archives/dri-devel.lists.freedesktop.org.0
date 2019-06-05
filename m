Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2093630D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1573893DB;
	Wed,  5 Jun 2019 17:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DB5893DB;
 Wed,  5 Jun 2019 17:59:26 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1370.namprd12.prod.outlook.com (10.168.238.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 17:59:25 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 17:59:25 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Zeng, Oak"
 <Oak.Zeng@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Topic: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Index: AQHVG6Z+4dZwEGGn4kW0HRPA7yef6KaNH/SAgAA5iQA=
Date: Wed, 5 Jun 2019 17:59:25 +0000
Message-ID: <bfaef638-b661-fe39-4679-91d0e03d5d90@amd.com>
References: <20190604152306.1804-1-christian.koenig@amd.com>
 <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
 <BL0PR12MB2580B3E88C17043DE402CF3280150@BL0PR12MB2580.namprd12.prod.outlook.com>
 <5a0f4e09-2614-5bbc-b8a2-53746bbb0b15@gmail.com>
 <1a0e5fdc-5b9d-844c-10cb-2cc880863142@daenzer.net>
 <08323655-c784-3adc-88a6-a9066bdfb4f7@amd.com>
In-Reply-To: <08323655-c784-3adc-88a6-a9066bdfb4f7@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:20b:14::35) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02951567-1b8b-404d-075a-08d6e9df8b61
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1370; 
x-ms-traffictypediagnostic: DM5PR12MB1370:
x-microsoft-antispam-prvs: <DM5PR12MB13703A3C656769E546137A5A83160@DM5PR12MB1370.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(36756003)(71190400001)(71200400001)(66574012)(14454004)(110136005)(58126008)(2906002)(6436002)(68736007)(25786009)(478600001)(73956011)(14444005)(64756008)(31696002)(31686004)(6486002)(6512007)(229853002)(66446008)(305945005)(66476007)(64126003)(256004)(66556008)(5660300002)(72206003)(66946007)(99286004)(2616005)(386003)(2501003)(86362001)(81166006)(102836004)(2201001)(53546011)(52116002)(316002)(65806001)(81156014)(76176011)(486006)(7736002)(186003)(476003)(65956001)(46003)(6246003)(53936002)(8936002)(446003)(65826007)(6116002)(11346002)(8676002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1370;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yCrYVR/HJ1WpZllPon9VwfSahl01zGsSloFoc6YZvhJ57qzyC1j8ptHCVbJlBemwRT+vAijm6hqPz+R9nkX/HX5qAJ5Lw1kxPduyd3Khjyd5T23ff6LGq9JOPgmn3JVmbs4gww3PqmjGPcKMuVXEqu3DmUU1WLlTrOMAX4gategzuAKiH9blV7yiKBQv/10BuMdoQc1e0ZuB6F3FTzUMozU+OtFO9JPbA+M/kasEtLTv/4AlKKDHLELiC5cLhiT+K9T3f4zurzhgPTLNdN7Ldy/diatQBrGBbZGhi4lvkydmi3ws/ggF3XrCqmXXKcs5yhkhhQG4iPckNJRxJGwKmhoknHDb6YhNHI4bfN2bwAGsqOLMuD6ENrJfK4DHV/1BLPnh6DdbjpQC5IGrit4YIzttVBqYXbJ4yy4du7lV5T8=
Content-ID: <985DA2AC0DB3BC4A8D4D7749F1AE302D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02951567-1b8b-404d-075a-08d6e9df8b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 17:59:25.0769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1370
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCH1fwdrOGhBdVv9ZA9vwH2VNTLPUTbVo7vLsx5RcTs=;
 b=MAHGmBwZ5QdqlhBBMomFhcFdGgxeyq8O1fVYj0EjMWSEv52IM/4/8xRQwQ3owo5qthrvKqdIoEgCFPnNbX+j3893QDzwULXrVTM+Nw8c0uXnP9HAixbIG6QzyT4oDIGwEG2grt3pK9ih7rbyqwBM/4NTIjQBS9hiZ1nn/XdM7Kw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDYuMTkgdW0gMTY6MzMgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IE9uIDIwMTkt
MDYtMDUgOTo1NiwgTWljaGVsIETDpG56ZXIgd3JvdGU6DQo+PiBPbiAyMDE5LTA2LTA1IDE6MjQg
cC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+PiBBbSAwNC4wNi4xOSB1bSAyMTowMyBz
Y2hyaWViIFplbmcsIE9hazoNCj4+Pj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4+IEt1ZWhsaW5nLCBGZWxpeA0K
Pj4+PiBPbiAyMDE5LTA2LTA0IDExOjIzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBbc25p
cF0NCj4+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaA0KPj4+PiArKysg
Yi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oDQo+Pj4+IEBAIC03NjcsMTQgKzc2Nywx
MiBAQCBzdGF0aWMgaW5saW5lIGludA0KPj4+PiB0dG1fYm9fcmVzZXJ2ZV9zbG93cGF0aChzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPj4+PiAgIMKgwqDCoCAqLw0KPj4+PiAgIMKgwqAg
c3RhdGljIGlubGluZSB2b2lkIHR0bV9ib191bnJlc2VydmUoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibykNCj4+Pj4gICDCoMKgIHsNCj4+Pj4gLcKgwqDCoCBpZiAoIShiby0+bWVtLnBsYWNl
bWVudCAmIFRUTV9QTF9GTEFHX05PX0VWSUNUKSkgew0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgc3Bp
bl9sb2NrKCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xvY2spOw0KPj4+PiAtwqDCoMKgwqDCoMKgwqAg
aWYgKGxpc3RfZW1wdHkoJmJvLT5scnUpKQ0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
dG1fYm9fYWRkX3RvX2xydShibyk7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBlbHNlDQo+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKGJvLCBOVUxMKTsN
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xv
Y2spOw0KPj4+PiAtwqDCoMKgIH0NCj4+Pj4gK8KgwqDCoCBzcGluX2xvY2soJmJvLT5iZGV2LT5n
bG9iLT5scnVfbG9jayk7DQo+Pj4+ICvCoMKgwqAgaWYgKGxpc3RfZW1wdHkoJmJvLT5scnUpKQ0K
Pj4+PiArwqDCoMKgwqDCoMKgwqAgdHRtX2JvX2FkZF90b19scnUoYm8pOw0KPj4+PiArwqDCoMKg
IGVsc2UNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKGJvLCBO
VUxMKTsNCj4+Pj4gR29pbmcganVzdCBieSB0aGUgZnVuY3Rpb24gbmFtZXMsIHRoaXMgc2VlbXMg
dG8gZG8gdGhlIGV4YWN0IG9wcG9zaXRlDQo+Pj4+IG9mIHdoYXQgdGhlIGNoYW5nZSBkZXNjcmlw
dGlvbiBzYXlzLg0KPj4+Pg0KPj4+PiBbT2FrXSArMSwgd2hlbiBJIHJlYWQgdGhlIGRlc2NyaXB0
aW9uLCBJIGFsc28gZ2V0IGxvc3QuLi5TbyBwbGVhc2UgZG8NCj4+Pj4gYWRkIGEgbW9yZSBhY2N1
cmF0ZSBkZXNjcmlwdGlvbi4NCj4+PiBJJ20gcHV6emxlZCB3aHkgeW91IGFyZSBjb25mdXNlZC4g
V2Ugbm93IGtlZXAgdGhlIEJPcyBvbiB0aGUgTFJVIHdoaWxlDQo+Pj4gdGhleSBhcmUgcmVzZXJ2
ZWQsIHNvIG9uIHVucmVzZXJ2ZSB3ZSBub3cgbmVlZCB0byBleHBsaWNpdGx5IHJlbW92ZSB0aGVt
DQo+Pj4gZnJvbSB0aGUgTFJVIHdoZW4gdGhleSBhcmUgcGlubmVkLg0KPj4gSSBkb24ndCBrbm93
IGFib3V0IEZlbGl4IGFuZCBPYWssIGJ1dCBmb3IgbWUgInJlbW92ZSBmcm9tIHRoZSBMUlUiIGlz
DQo+PiBjb25mdXNpbmcsIGFzIEkgZG9uJ3Qgc2VlIHRoYXQgaW4gdGhlIGNvZGUsIG9ubHkgYWRk
aW5nIHRvIHRoZSBMUlUgb3INCj4+IG1vdmluZyB0byBpdHMgdGFpbC4NCj4gRXhhY3RseS4gVGhl
IG5hbWVzIG9mIHRoZSBmdW5jdGlvbnMgYmVpbmcgY2FsbGVkIGltcGx5IHRoYXQgc29tZXRoaW5n
DQo+IGdldHMgYWRkZWQgb3IgbW92ZWQgb24gdGhlIExSVSBsaXN0LiBZb3UgaGF2ZSB0byBnbyBs
b29rIGF0IHRoZQ0KPiBpbXBsZW1lbnRhdGlvbiBvZiB0aG9zZSBmdW5jdGlvbnMgdG8gZmluZCBv
dXQgdGhhdCB0aGV5IGRvIHNvbWV0aGluZw0KPiBlbHNlIGZvciBwaW5uZWQgQk9zICh0aGF0IGhh
dmUgVFRNX1BMX0ZMQUdfTk9fRVZJQ1Qgc2V0IGluIHRoZWlyDQo+IHBsYWNlbWVudCBmbGFncyku
DQo+DQo+IEZpeGluZyB0aGUgZnVuY3Rpb24gbmFtZXMgd291bGQgcHJvYmFibHkgYmUgb3Zlcmtp
bGw6DQo+IHR0bV9ib19hZGRfbHJ1X3VubGVzc19waW5uZWQgYW5kDQo+IHR0bV9ib19tb3ZlX3Rv
X2xydV90YWlsX29yX3JlbW92ZV9pZl9waW5uZWQuIEJ1dCBtYXliZSBhIGNvbW1lbnQgaW4NCj4g
dHRtX2JvX3VucmVzZXJ2ZSB3b3VsZCBoZWxwLg0KDQpBaCEgWWVzIG9mIGNvdXJzZSwgSSB0aG91
Z2h0IHlvdSBtZWFuIHRoZSB0dG1fYm9fdW5yZXNlcnZlIGZ1bmN0aW9uIG5hbWUuDQoNCkdvaW5n
IHRvIGFkZCBhIGNvbW1lbnQgd2hlbiB3ZSBzdGFydCB0byByZW5hbWUgdGhlIGZ1bmN0aW9ucy4N
Cg0KQ2hyaXN0aWFuLg0KDQo+DQo+IFJlZ2FyZHMsDQo+ICAgwqAgRmVsaXgNCj4NCj4NCj4+DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
