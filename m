Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5A34FF8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 20:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B9889BA5;
	Tue,  4 Jun 2019 18:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710049.outbound.protection.outlook.com [40.107.71.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E5989B8E;
 Tue,  4 Jun 2019 18:46:44 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3017.namprd12.prod.outlook.com (20.178.30.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 18:46:43 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 4 Jun 2019
 18:46:43 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Topic: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Index: AQHVGulumcQO4MHYPEKs04RBKBQsGKaL1d4A
Date: Tue, 4 Jun 2019 18:46:43 +0000
Message-ID: <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
References: <20190604152306.1804-1-christian.koenig@amd.com>
In-Reply-To: <20190604152306.1804-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81f8df1d-51dc-47bb-4d4b-08d6e91cfc94
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3017; 
x-ms-traffictypediagnostic: DM6PR12MB3017:
x-microsoft-antispam-prvs: <DM6PR12MB3017947DFCDB8CDEA29D8DB392150@DM6PR12MB3017.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(396003)(136003)(376002)(39860400002)(189003)(199004)(68736007)(478600001)(110136005)(8676002)(58126008)(316002)(2906002)(7736002)(305945005)(86362001)(102836004)(2201001)(76176011)(31696002)(386003)(6506007)(99286004)(25786009)(52116002)(81166006)(66574012)(53546011)(81156014)(6246003)(26005)(8936002)(3846002)(65826007)(53936002)(6116002)(73956011)(36756003)(66946007)(14444005)(6486002)(229853002)(256004)(14454004)(66446008)(66556008)(66476007)(6436002)(64756008)(71190400001)(6512007)(71200400001)(72206003)(476003)(2616005)(31686004)(64126003)(65806001)(486006)(2501003)(186003)(446003)(66066001)(65956001)(5660300002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3017;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y67AlZq5C0JtzCG5l90af2DNoe/PIEe8oLPADyE0MMSdueNWFM6+h13rHw5nwskl69JvBTxzLWZ2oaSyB2K8entJmUePUudNTVxYGHWh3itcwelMo7pmHAQoftj0HhTFHhJgnOKGJMLfzNvxPe71JdNCW/QUGG+/uok5sOpubL6pezrAkcB09U+3pE21Fc5cAfTfCedQA/AXjznj8pcaQgXydpGVeTzttVx05/vbfCsGL+btDegEAX0FxfHp1+Gq9SaoE9hiQqWcFco7w5o4vwfvZfRVTtrswbFML6weDZZiacr/a20ypfmCjLXaT25LDzn9nlyZZ1efhfAA2yXYauLN18wUqENiT887a11y5tAfhbNGejOYNWNGx7oWuCUDyJ5omoELy4zUoZM7Y6SM9FXr6catmsMgQXNgrhUM80w=
Content-ID: <6355E0FB739F33489B1F9413557F2C1F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f8df1d-51dc-47bb-4d4b-08d6e91cfc94
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 18:46:43.0154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3017
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN09KJx7oEEIFKBvhrB2Ss3x/oXSLmdqkIr7BpHnTl0=;
 b=P0QpPgCw715tP/lz0N5jIhHog+7u523AVN8HNgS+BD2FRJEyMTt7Wt1gHPeeMyUO4BuyBIkiMXFiVErf3BCRKhVhh6JTYlFsqLL8/qU6xBRlevzF707l4aPehU19taA9BJ+eUbC0NkqpkVK6V2Kvj0XDRJ7g3nRq/CnMvzl34kg=
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

T24gMjAxOS0wNi0wNCAxMToyMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCg0KPiBTaW5jZSB3
ZSBub3cga2VlcCBCT3Mgb24gdGhlIExSVSB3ZSBuZWVkIHRvIG1ha2Ugc3VyZQ0KPiB0aGF0IHRo
ZXkgYXJlIHJlbW92ZWQgd2hlbiB0aGV5IGFyZSBwaW5uZWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0tDQo+ICAg
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDE0ICsrKysrKy0tLS0tLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oDQo+IGluZGV4IDlmNTRjZjljNjBkZi4uYzliOGJhNDkyZjI0IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oDQo+ICsrKyBiL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4gQEAgLTc2NywxNCArNzY3LDEyIEBAIHN0
YXRpYyBpbmxpbmUgaW50IHR0bV9ib19yZXNlcnZlX3Nsb3dwYXRoKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sDQo+ICAgICovDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib191bnJl
c2VydmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykNCj4gICB7DQo+IC0JaWYgKCEoYm8t
Pm1lbS5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkpIHsNCj4gLQkJc3Bpbl9sb2Nr
KCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xvY2spOw0KPiAtCQlpZiAobGlzdF9lbXB0eSgmYm8tPmxy
dSkpDQo+IC0JCQl0dG1fYm9fYWRkX3RvX2xydShibyk7DQo+IC0JCWVsc2UNCj4gLQkJCXR0bV9i
b19tb3ZlX3RvX2xydV90YWlsKGJvLCBOVUxMKTsNCj4gLQkJc3Bpbl91bmxvY2soJmJvLT5iZGV2
LT5nbG9iLT5scnVfbG9jayk7DQo+IC0JfQ0KPiArCXNwaW5fbG9jaygmYm8tPmJkZXYtPmdsb2It
PmxydV9sb2NrKTsNCj4gKwlpZiAobGlzdF9lbXB0eSgmYm8tPmxydSkpDQo+ICsJCXR0bV9ib19h
ZGRfdG9fbHJ1KGJvKTsNCj4gKwllbHNlDQo+ICsJCXR0bV9ib19tb3ZlX3RvX2xydV90YWlsKGJv
LCBOVUxMKTsNCg0KR29pbmcganVzdCBieSB0aGUgZnVuY3Rpb24gbmFtZXMsIHRoaXMgc2VlbXMg
dG8gZG8gdGhlIGV4YWN0IG9wcG9zaXRlIG9mIA0Kd2hhdCB0aGUgY2hhbmdlIGRlc2NyaXB0aW9u
IHNheXMuDQoNCkFud2F5LCB0aGlzIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KQlRXLCB0aGlzIGZpeCBpcyBuZWVkZWQgZm9y
IEtGRC4gSXQgZml4ZXMgb3VyIGV2aWN0aW9uIHRlc3QgdGhhdCB3YXMgDQpicm9rZW4gYnkgeW91
ciBwcmV2aW91cyBwYXRjaCBzZXJpZXMuIFRoaXMgdGVzdCBzcGVjaWZpY2FsbHkgdHJpZ2dlcnMg
DQppbnRlcmFjdGlvbnMgYmV0d2VlbiBLRkQgYW5kIGdyYXBoaWNzIHVuZGVyIG1lbW9yeSBwcmVz
c3VyZS4gSXQncyANCnNvbWV0aGluZyB3ZSByYXJlbHkgc2VlIGluIHJlYWwgd29ybGQgY29tcHV0
ZSBhcHBsaWNhdGlvbiB0ZXN0aW5nIA0Kd2l0aG91dCBhIHRhcmdldGVkIHRlc3QuIEJ1dCB3aGVu
IGl0IGJyZWFrcyBpdCBsZWFkcyB0byBzb21lIHBhaW5mdWwgDQppbnRlcm1pdHRlbnQgZmFpbHVy
ZXMgdGhhdCBhcmUgaGFyZCB0byByZWdyZXNzIGFuZCBkZWJ1Zy4NCg0KRG8geW91IGhhdmUgYW55
IHRhcmdldGVkIHRlc3RzIHRvIHRyaWdnZXIgZXZpY3Rpb25zIHdoZW4geW91IHdvcmsgb24gVFRN
IA0KaW50ZXJuYWxzPw0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiArCXNwaW5fdW5sb2Nr
KCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xvY2spOw0KPiAgIAlyZXNlcnZhdGlvbl9vYmplY3RfdW5s
b2NrKGJvLT5yZXN2KTsNCj4gICB9DQo+ICAgDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
