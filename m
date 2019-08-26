Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA49D5F7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1C96E29D;
	Mon, 26 Aug 2019 18:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A376E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4aGW5z2X8AaXQw7ciYcbwvZGToYQwVncYKfFJtTrBra1F2PfTMOL7vrfA4w2SOrnYBoOwy2YDAxUMLHmpOCqPtA8BxVRuQzbJzK9P80OiEoOcHpv7QBOi/p+aZSJYNrKl6obrVnzwQDdruir5go3dN6PPvEyFG9cnGQSzcmviNmpYRhM5iN9R864QEwgrmpegQqiSbktm3qR0l66p+zZwhjewhlRSsYYr3rxH7uitryFvFl3e2JJ9V0lqDQroBEBTu9BfmsKx/sKlB7jqBQFIpadmzxIy6VxVrbtntXgCReQOSrD+C95Uo20qlaLFQidmm+svRxSiy2V+I6Q/okjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFUXrZyedZnczmKpl5ruX4q2zuZoRbHwgwo4VzkiOA8=;
 b=Z24iuTQMrhMnZEDYv1UpFrCK6D07KVXRGGPLyOKq+mlWjQl6oT00B5oakRccyKpHo/BIPW5WpE8OOmHrlaz9oncHAuUdv1vLP0lHpuEONiyVKy9PpaRTw2vKMJMseifBDiGzSQ+RdyBnGrwIGDYOJQ1EXMuV7VAqCj5UrOneTNlkuxFMxniI/bmu70r/e0UcLemm1gCKDL7DQ+gmAVbOiKKgj5rXgIqQCjz01wdiEsCsg8HqdEZMqU3bp509bhzsUFbS2f8iM/bj6nsFFQTCzdGJR1Od0yqBqlkkffdEIfnP1CFjFGfbudH502dNeovYlme9Gy4CYDkSpFbEec121Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0214.namprd12.prod.outlook.com (10.174.54.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Mon, 26 Aug 2019 18:44:10 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 18:44:10 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/6] drm/dp_mst: Fill branch->num_ports
Thread-Topic: [PATCH v8 4/6] drm/dp_mst: Fill branch->num_ports
Thread-Index: AQHVXDjZqWNkHbtz406z3AQ24QeNVqcNxAoA
Date: Mon, 26 Aug 2019 18:44:10 +0000
Message-ID: <620679cc-5e70-3384-f0ed-a7c9b2065ab1@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
 <20190826180507.17802-5-David.Francis@amd.com>
In-Reply-To: <20190826180507.17802-5-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::14) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae832801-7a4f-4644-e539-08d72a556221
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0214; 
x-ms-traffictypediagnostic: CY4PR1201MB0214:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0214C5E8B5DEC50B377759DD8CA10@CY4PR1201MB0214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(189003)(199004)(53546011)(386003)(2906002)(186003)(25786009)(8936002)(446003)(26005)(2616005)(53936002)(76176011)(102836004)(229853002)(305945005)(6512007)(11346002)(6506007)(14454004)(66066001)(65956001)(65806001)(6246003)(66446008)(110136005)(99286004)(7736002)(6486002)(81156014)(31696002)(52116002)(6436002)(81166006)(66556008)(486006)(5660300002)(64756008)(476003)(31686004)(256004)(14444005)(3846002)(6116002)(36756003)(2501003)(8676002)(66946007)(71190400001)(71200400001)(66476007)(316002)(58126008)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0214;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SZoTTBC+CMbFKuIL3arOorhpI9XutmZbyQc2BiVzyAlM3Y9AUesivSDWP2Hxan7Eicncnq/AtcVJRaxDjt+PBWARqe6jgtnAz+dE3ByKhBDxiBaD9615rNLRZ8aZ7/heXB7/pSygNzMFhtpldkWEH2s5Atfm9ds+Wz7tRWf86j+s6hR0kcR6uSCqY5HgIpIlfPvQt0rmfmxlW7apb0mwyNtYjOQoXSKcNibNvxqgdF29xZlKtRRjXxN4Gob+1R358XLWDTBNCWdpjegOxqmOtp7E7UvI6YrIbuq8XEKoqm7rAm1qlAWDhBqS9NP4z/XQFoKfEkga1+95sOIvEPVe95KNgNGdAs6/ljPCDVdou7iAZr+tU0qgqH8Zd4pTr0M97ojfB3uxWoVX3yF0l754Xqh/Sa4RNWNEzz2aWWVW0XM=
Content-ID: <738347335EAC254A8F60FD1A89A1EB02@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae832801-7a4f-4644-e539-08d72a556221
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 18:44:10.5398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u4/1mu/HgK+AVnrgp8OR93mCSzOZQVTe1Q/o8QqATteT79YdrBdzXibEHDzC5XVLsZyJYziSOuz72cY7eqopow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFUXrZyedZnczmKpl5ruX4q2zuZoRbHwgwo4VzkiOA8=;
 b=pJENXHAQDDBXxUry0nJveUKqrkDr0CrR3swvlumHXZMznzrP3muGygqWlRfeECA8yNd8goiWLUw6Wnv3SUcXTO7t9M7qbriqBKEjOaZYi04eqV7HEXDkZxqUDvzXGUROSeSMQsnih5I65beaSQDLt/JKIR/ceP7UT4K1vxoswmk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

T24gMjAxOS0wOC0yNiAyOjA1IHAubS4sIERhdmlkIEZyYW5jaXMgd3JvdGU6DQo+IFRoaXMgZmll
bGQgb24gZHJtX2RwX21zdF9icmFuY2ggd2FzIG5ldmVyIGZpbGxlZA0KPiANCj4gSXQgaXMgaW5p
dGlhbGl6ZWQgdG8gemVybyB3aGVuIHRoZSBwb3J0IGlzIGt6YWxsb2NjZWQuDQo+IFdoZW4gYSBw
b3J0IGlzIGFkZGVkIHRvIHRoZSBsaXN0LCBpbmNyZW1lbnQgbnVtX3BvcnRzLA0KPiBhbmQgd2hl
biBhIHBvcnQgaXMgcmVtb3ZlZCBmcm9tIHRoZSBsaXN0LCBkZWNyZW1lbnQgbnVtX3BvcnRzLg0K
PiANCj4gdjI6IHJlbWVtYmVyIHRvIGRlY3JlbWVudCBvbiBwb3J0IHJlbW92YWwNCj4gdjM6IGRv
bid0IGV4cGxpY2l0bHkgaW5pdCB0byAwDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFu
Y2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+DQoNCkhhcnJ5DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jDQo+IGluZGV4IDlm
MzYwNDM1NTcwNS4uNTAyOTIzYzI0NDUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMNCj4gQEAgLTE2NjksNiArMTY2OSw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9h
ZGRfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsDQo+ICAJCW11dGV4X2xvY2so
Jm1zdGItPm1nci0+bG9jayk7DQo+ICAJCWRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnQocG9y
dCk7DQo+ICAJCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAmbXN0Yi0+cG9ydHMpOw0KPiArCQltc3Ri
LT5udW1fcG9ydHMrKzsNCj4gIAkJbXV0ZXhfdW5sb2NrKCZtc3RiLT5tZ3ItPmxvY2spOw0KPiAg
CX0NCj4gIA0KPiBAQCAtMTcwMyw2ICsxNzA0LDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9w
b3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwNCj4gIAkJCS8qIHJlbW92ZSBpdCBm
cm9tIHRoZSBwb3J0IGxpc3QgKi8NCj4gIAkJCW11dGV4X2xvY2soJm1zdGItPm1nci0+bG9jayk7
DQo+ICAJCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7DQo+ICsJCQltc3RiLT5udW1fcG9ydHMtLTsN
Cj4gIAkJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsNCj4gIAkJCS8qIGRyb3AgcG9y
dCBsaXN0IHJlZmVyZW5jZSAqLw0KPiAgCQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChw
b3J0KTsNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
