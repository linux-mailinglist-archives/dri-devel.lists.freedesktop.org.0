Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2053501B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 21:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A5989BBD;
	Tue,  4 Jun 2019 19:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BEF89BB2;
 Tue,  4 Jun 2019 19:03:12 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2515.namprd12.prod.outlook.com (52.132.11.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 19:03:10 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 19:03:10 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Topic: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Index: AQHVGulu9ZQ941Np90exnDVnWHTczaaL1eGAgAAD1oA=
Date: Tue, 4 Jun 2019 19:03:10 +0000
Message-ID: <BL0PR12MB2580B3E88C17043DE402CF3280150@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190604152306.1804-1-christian.koenig@amd.com>
 <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
In-Reply-To: <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba82c6c6-7ae9-4d2f-e445-08d6e91f495c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2515; 
x-ms-traffictypediagnostic: BL0PR12MB2515:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB251553CB009271DB747C956B80150@BL0PR12MB2515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(346002)(376002)(39860400002)(13464003)(189003)(199004)(25786009)(6306002)(9686003)(6436002)(14454004)(55016002)(966005)(2201001)(316002)(68736007)(14444005)(229853002)(256004)(66556008)(53936002)(6246003)(478600001)(66066001)(2906002)(3846002)(102836004)(72206003)(53546011)(6116002)(26005)(6506007)(66946007)(76176011)(7696005)(64756008)(74316002)(110136005)(71200400001)(86362001)(186003)(305945005)(66446008)(7736002)(99286004)(73956011)(5660300002)(71190400001)(8936002)(81156014)(81166006)(66574012)(486006)(11346002)(2501003)(8676002)(476003)(446003)(33656002)(52536014)(76116006)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2515;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1rZKCyKwTcHrsrqSs5If9lEDsn9UC2+9fTzjB7Fxk8L7eWsLqG29NZ8nzZsiTTyRotF/vns29DyLez7fmKzHgAluYUCwpiMJvHkXRllyGN3BgQOm+G0G1H3a8wg4IG0Cc9vH4sf4lNK6ZeyJEc6FIJOWwH6ihMLfuu2j07ZGhP1D8UV2gsTBH0kEQdpqRUHfYVSMaYucjmpMCwtfKNFeCrnIYQuRY4o2GPOFXKDkVFBdR0CAnj/F2B6nAStOGfnb/BJQHGT/lpaBq69tZFZrn8sQsc4P9+3CXtuaZ+X2y7S949EIynuH2TzIH3sTIbWRTDe1/JN00gu5MCSlo3M5TPNbGdoCCQxUBYe0ff2j4wU0v2XI3KKN8f3Yq4Ps3tk9vBVVwzqmthezB8uyGK0RYDtmHjvZg/5OOcdyIYnVoEY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba82c6c6-7ae9-4d2f-e445-08d6e91f495c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 19:03:10.1857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6RanFj66f3EkvaybXIcLsjmIWIXk5uLI7YyanPw75Y=;
 b=XqqWN45DjI4L2gmJNzOj/60jrL/owySWebYxHWiMBzGs+6w5FdtOtAwUbIyxfRbZvpHY6ICbqcuijdbohqweolgNb2zAQf6OM+aObP68YqKBHgJnYZfnHOvwgrvxt+9quaC5wjm4EqmO3Eu/k2Z6u8XEMlV0V/ojU3661KqrAHI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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

DQoNClJlZ2FyZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFt
ZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBLdWVobGluZywgRmVsaXgNClNlbnQ6IFR1ZXNkYXksIEp1bmUgNCwgMjAxOSAyOjQ3IFBNDQpU
bzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+OyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3R0bTogZml4IHR0bV9ib191bnJlc2VydmUN
Cg0KT24gMjAxOS0wNi0wNCAxMToyMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCg0KPiBTaW5j
ZSB3ZSBub3cga2VlcCBCT3Mgb24gdGhlIExSVSB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRo
ZXkgYXJlIA0KPiByZW1vdmVkIHdoZW4gdGhleSBhcmUgcGlubmVkLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IC0tLQ0K
PiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAxNCArKysrKystLS0tLS0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIA0KPiBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggaW5kZXggOWY1NGNmOWM2MGRmLi5jOWI4YmE0OTJm
MjQgDQo+IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oDQo+
ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4gQEAgLTc2NywxNCArNzY3
LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IHR0bV9ib19yZXNlcnZlX3Nsb3dwYXRoKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+ICAgICovDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIHR0
bV9ib191bnJlc2VydmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykNCj4gICB7DQo+IC0J
aWYgKCEoYm8tPm1lbS5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkpIHsNCj4gLQkJ
c3Bpbl9sb2NrKCZiby0+YmRldi0+Z2xvYi0+bHJ1X2xvY2spOw0KPiAtCQlpZiAobGlzdF9lbXB0
eSgmYm8tPmxydSkpDQo+IC0JCQl0dG1fYm9fYWRkX3RvX2xydShibyk7DQo+IC0JCWVsc2UNCj4g
LQkJCXR0bV9ib19tb3ZlX3RvX2xydV90YWlsKGJvLCBOVUxMKTsNCj4gLQkJc3Bpbl91bmxvY2so
JmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7DQo+IC0JfQ0KPiArCXNwaW5fbG9jaygmYm8tPmJk
ZXYtPmdsb2ItPmxydV9sb2NrKTsNCj4gKwlpZiAobGlzdF9lbXB0eSgmYm8tPmxydSkpDQo+ICsJ
CXR0bV9ib19hZGRfdG9fbHJ1KGJvKTsNCj4gKwllbHNlDQo+ICsJCXR0bV9ib19tb3ZlX3RvX2xy
dV90YWlsKGJvLCBOVUxMKTsNCg0KR29pbmcganVzdCBieSB0aGUgZnVuY3Rpb24gbmFtZXMsIHRo
aXMgc2VlbXMgdG8gZG8gdGhlIGV4YWN0IG9wcG9zaXRlIG9mIHdoYXQgdGhlIGNoYW5nZSBkZXNj
cmlwdGlvbiBzYXlzLg0KDQpbT2FrXSArMSwgd2hlbiBJIHJlYWQgdGhlIGRlc2NyaXB0aW9uLCBJ
IGFsc28gZ2V0IGxvc3QuLi5TbyBwbGVhc2UgZG8gYWRkIGEgbW9yZSBhY2N1cmF0ZSBkZXNjcmlw
dGlvbi4NCg0KQW53YXksIHRoaXMgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQpCVFcsIHRoaXMgZml4IGlzIG5lZWRlZCBmb3Ig
S0ZELiBJdCBmaXhlcyBvdXIgZXZpY3Rpb24gdGVzdCB0aGF0IHdhcyBicm9rZW4gYnkgeW91ciBw
cmV2aW91cyBwYXRjaCBzZXJpZXMuIFRoaXMgdGVzdCBzcGVjaWZpY2FsbHkgdHJpZ2dlcnMgaW50
ZXJhY3Rpb25zIGJldHdlZW4gS0ZEIGFuZCBncmFwaGljcyB1bmRlciBtZW1vcnkgcHJlc3N1cmUu
IEl0J3Mgc29tZXRoaW5nIHdlIHJhcmVseSBzZWUgaW4gcmVhbCB3b3JsZCBjb21wdXRlIGFwcGxp
Y2F0aW9uIHRlc3Rpbmcgd2l0aG91dCBhIHRhcmdldGVkIHRlc3QuIEJ1dCB3aGVuIGl0IGJyZWFr
cyBpdCBsZWFkcyB0byBzb21lIHBhaW5mdWwgaW50ZXJtaXR0ZW50IGZhaWx1cmVzIHRoYXQgYXJl
IGhhcmQgdG8gcmVncmVzcyBhbmQgZGVidWcuDQoNCkRvIHlvdSBoYXZlIGFueSB0YXJnZXRlZCB0
ZXN0cyB0byB0cmlnZ2VyIGV2aWN0aW9ucyB3aGVuIHlvdSB3b3JrIG9uIFRUTSBpbnRlcm5hbHM/
DQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+ICsJc3Bpbl91bmxvY2soJmJvLT5iZGV2LT5n
bG9iLT5scnVfbG9jayk7DQo+ICAgCXJlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3Yp
Ow0KPiAgIH0NCj4gICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
