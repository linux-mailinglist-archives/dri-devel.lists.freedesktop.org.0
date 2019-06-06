Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489413762A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 16:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090CB89745;
	Thu,  6 Jun 2019 14:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820047.outbound.protection.outlook.com [40.107.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8978989736
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:14:00 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3694.namprd12.prod.outlook.com (10.255.86.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Thu, 6 Jun 2019 14:13:59 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964%6]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 14:13:58 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH 1/2] update drm.h
Thread-Topic: [PATCH 1/2] update drm.h
Thread-Index: AQHVEH3qaP7OZo1BOUO49Lbo6KzKP6Z29lMAgANOUwCAFD1JgIAAh7aA//97eACAADyxgIAAAIRg
Date: Thu, 6 Jun 2019 14:13:58 +0000
Message-ID: <MN2PR12MB2910673265256EED839A8846B4170@MN2PR12MB2910.namprd12.prod.outlook.com>
References: <20190522090800.15908-1-david1.zhou@amd.com>
 <17e558ac-bda8-0541-b102-2fd730ce4753@amd.com>
 <f95b85cd-80ee-576a-248a-409f512e8d38@amd.com>
 <96dea97c-dfa8-1e89-1b83-9a425b93e36e@daenzer.net>
 <ce5f40ff-7685-35e5-ef33-e5e7fac63818@amd.com>
 <13d6026e-2ca5-83bf-3f1c-1d9fbbe199a8@daenzer.net>
 <799dce05-4785-f77b-6647-1c8ed78e9af1@daenzer.net>
In-Reply-To: <799dce05-4785-f77b-6647-1c8ed78e9af1@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2446360f-1bda-4076-9e23-08d6ea8937d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3694; 
x-ms-traffictypediagnostic: MN2PR12MB3694:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR12MB3694AB2CB2355801826493C4B4170@MN2PR12MB3694.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(366004)(376002)(13464003)(189003)(199004)(55016002)(2906002)(229853002)(5660300002)(7736002)(99286004)(6436002)(6306002)(86362001)(6636002)(6116002)(9686003)(52536014)(316002)(64756008)(102836004)(68736007)(66446008)(76116006)(73956011)(66946007)(66476007)(66556008)(305945005)(110136005)(3846002)(53546011)(6506007)(53936002)(7696005)(81156014)(6246003)(14454004)(25786009)(8676002)(446003)(186003)(4326008)(486006)(966005)(66066001)(33656002)(11346002)(74316002)(15650500001)(8936002)(81166006)(256004)(14444005)(66574012)(76176011)(72206003)(476003)(478600001)(71200400001)(26005)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3694;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: guOLKn4Pdu5sudOQCKqTfUERFQS+LgdAXFoz32Ason5eXOztwTzT6vffWIK0U2f1vWGOalZ4Zjqa/MJIXferxO15slHchV9PdbKlUfaGJZUKXLL4yDMmeiT9oebw0vLPVEkcLoKTI3S0cAIKv6IUBAU3OwEpYgZrjQaqPcUfwmEx6gisRqYWlmTwlf4ixWGMbZDQAxcrYs/lycDf4xH4EwgElpVvZScCu3PKLOb9YEIRpj9/K2ngIWSfm3LYnJ3QabPAQBytEPRVa2gy0JT+LQww9g/554uTigbIITvF8sKtHpXibmUJ1cucCfqtxuZ6Vn6wDWWq8p90Ea2frxsHdOdfajPWe/WrSuNbHSkS2l7c0QzmzjSS6NgtBNeywzv14k+y8qpQqJRNQBRAV0IKhJWZE8Lge0WlHra2g3qFUrs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2446360f-1bda-4076-9e23-08d6ea8937d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 14:13:58.5538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ey1kuaV8Rj+ryUX88ehpdFvMFQwyt/l/ghu89AZT7o=;
 b=0domqm2v7xMiwbMywQk5T4v2mL0+Io5TyOVB4NmJfDSwTRBq1PxtRJLd84bL06EYFDC8PieFWv93BBfURikX8OHAydy+xFTB6j2QTvJQH9z07l7hvn2AprXNVdw1FJvZg0dWcn9u/GFJjALicQHxvJWoVstxOCAU3LRAh0tWSFA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWljaGVsIETDpG56ZXIg
PG1pY2hlbEBkYWVuemVyLm5ldD4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMDYsIDIwMTkgMTA6
MDkgUE0NCj4gVG86IFpob3UsIERhdmlkKENodW5NaW5nKSA8RGF2aWQxLlpob3VAYW1kLmNvbT47
IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBE
YXZpZChDaHVuTWluZykNCj4gPERhdmlkMS5aaG91QGFtZC5jb20+DQo+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSB1cGRhdGUg
ZHJtLmgNCj4gDQo+IE9uIDIwMTktMDYtMDYgMTI6MzEgcC5tLiwgTWljaGVsIETDpG56ZXIgd3Jv
dGU6DQo+ID4gT24gMjAxOS0wNi0wNiAxMjoyNiBwLm0uLCB6aG91Y20xIHdyb3RlOg0KPiA+PiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9kcm0sIFdoZXJlIHRoZSBtZXJnZSBy
ZXF1ZXN0DQo+IGJ1dHRvbj8NCj4gPg0KPiA+IElmIHlvdSBwdXNoIHRvIGEgYnJhbmNoIGluIHlv
dXIgcGVyc29uYWwgcmVwb3NpdG9yeSwgdGhlIG91dHB1dCBvZiBnaXQNCj4gPiBwdXNoIGNvbnRh
aW5zIGFuIFVSTCBmb3IgY3JlYXRpbmcgYSBtZXJnZSByZXF1ZXN0Lg0KPiANCj4gRGFuaWVsIFZl
dHRlciBwb2ludGVkIG91dCBvbiBJUkMgdGhhdCBjdXJyZW50bHkgbWVyZ2UgcmVxdWVzdHMgYXJl
bid0DQo+IGVuYWJsZWQgeWV0IGZvciBsaWJkcm0sIHdoaWNoIHByb2JhYmx5IGV4cGxhaW5zIHdo
eSB5b3UgY291bGRuJ3QgZmluZCBhIHdheQ0KPiB0byBjcmVhdGUgb25lLiBTb3JyeSwgSSBkaWRu
J3QgcmVhbGl6ZSB0aGlzLg0KPiANCj4gTWVhbndoaWxlLCBjYW4geW91IGp1c3QgcHVzaCB0byBh
IGJyYW5jaCBpbiB5b3VyIHBlcnNvbmFsIHJlcG8sIGFuZCBtYWtlDQo+IHN1cmUgdGhlIENJIHBp
cGVsaW5lIHBhc3Nlcz8NCg0KU29ycnksIHdoaWNoIHBlcnNvbmFsIHJlcG8/IE15IHByb2JsZW0g
dG8gY29ubmVjdCB0byBnaXRsYWIuZnJlZWRlc2t0b3AgaXNuJ3Qgc29sdmVkIHlldCBieSBvdXIg
SVQsIEknbSBwdXNoaW5nIHRoZW0sIGJ1dCBubyByZXNwb25zZSB5ZXQuDQoNCi1EYXZpZA0KDQo+
IA0KPiANCj4gLS0NCj4gRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQ0KPiBMaWJyZSBzb2Z0d2FyZSBlbnRodXNp
YXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXINCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
