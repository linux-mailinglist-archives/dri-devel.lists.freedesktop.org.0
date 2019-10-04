Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB6CBF43
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 17:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62A96EBA4;
	Fri,  4 Oct 2019 15:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730043.outbound.protection.outlook.com [40.107.73.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF686EBA4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 15:34:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcwWY//Jvi1mWb6V2PkHG4LT/fDvNfJJy+AnqA6KcrLtSFwFNieJSMrypKjqk7OfddZ7+NVvhBoddXjWAR6a54NbvBUKYzCrYBau7ynFce/OK4uKw3lrLqdPqDdQ9I19d0nmyWnRP35vPlmXQkZi8/fs94NZpZMzuAWBMFCxLN4vW3C2faGFsDU6rLQAu7cp08vDrQF6kT7pvhPdfXvkiEoM4uL0F3OwMkmHDsSRVqNLdRiiIb3MPJc8CHzlnXbTvq+8b5rycrx68uWM1WnG4qolDR1B9ZqxbgyszqibJdi6W2NOMtXjaB/tgCtcVVpd8woIwTLpxxtxpFFPAn/Gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB54fCZmDiqv35/DGvQqQcvEwQn15Sa1yylodvv4KzY=;
 b=V8q8fJXbica2t8tTmyOry4HW+BLqddsa9plXGSHAnE/DWa2QosaL4u3baEZt4cKjCopBqGr5fjg6VuXEz/bicpvtMbnAncTNPA3q4wqxdojsqy7AHTkzcT25G5E0Lb+GXaTIUxoRon24ecoah+Dl3zqkASe41dAn7qn/hBB5Va4+hNJRTJwNB0SQNp/4vP8NoqmNmBDVf9ESnyrJ+6w/yFjC6OYgEHcFdXs/kunFdAkM5j2W7hMZoePgThm0HPQGR5jqTmbd9AML8N6G+JHArKzAXb9E0MC7EKEEvL8T4ubAqru3jfSvILV0YvyxafiVoPaGGkGJwSrjfvIMrvbM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1417.namprd12.prod.outlook.com (10.168.236.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Fri, 4 Oct 2019 15:34:32 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 15:34:32 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Neil Armstrong
 <narmstrong@baylibre.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Hillf Danton <hdanton@sina.com>
Subject: Re: drm_sched with panfrost crash on T820
Thread-Topic: drm_sched with panfrost crash on T820
Thread-Index: AQHVdQtdT+cvX6z0BU2uuLMAUcNYy6dAAdKAgARRcgCAAyE+gIABLBmAgAH8SICAAAK4gIAABtAAgAAB5gA=
Date: Fri, 4 Oct 2019 15:34:32 +0000
Message-ID: <590a1c78-5c86-92e2-01a1-92bd31397be5@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <20190930145228.14000-1-hdanton@sina.com>
 <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
 <7339b7a1-2d1c-4379-89a0-daf8b28d81c8@baylibre.com>
 <94096e4e-0f60-79d1-69b5-c7c3e59a4d78@amd.com>
 <f44204b4-ce5c-b26e-580d-5bb21314be1f@baylibre.com>
 <8c4ecad8-c2e2-eec1-9132-48e126577baa@arm.com>
In-Reply-To: <8c4ecad8-c2e2-eec1-9132-48e126577baa@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:208:1::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1507c009-dde0-41c1-2730-08d748e05a79
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1417:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB14178C3BE5090B31490FEE4E839E0@DM5PR12MB1417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(199004)(189003)(478600001)(71190400001)(14444005)(6486002)(71200400001)(256004)(6306002)(966005)(6512007)(6436002)(486006)(14454004)(6246003)(4326008)(5660300002)(316002)(476003)(31696002)(52116002)(25786009)(31686004)(102836004)(66446008)(2616005)(65956001)(86362001)(65806001)(186003)(66574012)(46003)(446003)(58126008)(81156014)(81166006)(8676002)(99286004)(54906003)(53546011)(6506007)(110136005)(386003)(229853002)(66476007)(66946007)(66556008)(36756003)(64756008)(7736002)(305945005)(2906002)(76176011)(6116002)(8936002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1417;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5J7u/u5zncP0DCJ/NI6prUUN0V8YA21fDQm8itGrmjD+7SJ3eAQx5FBhZvwNg7HdR1QLJoGLigAIZdlJt5ijeaYr8VVsDsgGjAysk8zq+Pnjo93bSzAmVDyTpo6VASAo0ovhvKkXKsIs6tXMr7IePzVHqTFljHjm0L0yWC/FEyyOWw8AfO2k3/gVVAF587Z+IrY/rJgwWhSbGskKFFQEJnaxbjbiHgbpYbDEnKF/TZpC7x9Dcxs9bx7Kz8TsMcbjGrr2Vnp3qiRnAGdoiYz8M7PwYcxfCJyqvdHDd7jcpQjpYrO9gSQqUAtTibvbPj5GmvSgQogYMUjT8Fc4bL6ep2KlzKUPcZ58RVYO5PiK91NdVT/BBkOjJIEuCRt5Z4GhQ6rqs9ZKMaYVrrCY0gRD5SYChsEzbkV96ACmSPht/Xvq7dWIxb3vlBW1tfbCuS0iHHYAMTyoknE7z92Tl/n1EQ==
Content-ID: <36295166D2A84445BAAB4E049E109B5A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1507c009-dde0-41c1-2730-08d748e05a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 15:34:32.5337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIduJ6IH5pzMQm89lY6TEKhs2ynpngZgsuw8hbXj8SCOzzjsVZ0tlMM0yQKy5eCr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB54fCZmDiqv35/DGvQqQcvEwQn15Sa1yylodvv4KzY=;
 b=GYcgnH9vmGNIm4qKAfCQGhd7MLZ+/1og85/ttlHDk7ejUT4LnUH9rnEZRRcTjkfbJQXV5Css85YXU7kZ54hEwBicCx5Cc0ADEyH7/biGCHGFfPrX3X3l5fVuhBUQQgS783Yit6fXECQTFziHvsT+ubK15x5dsmeOfGBBFeCDXfY=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMTAuMTkgdW0gMTc6Mjcgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IE9uIDA0LzEwLzIw
MTkgMTY6MDMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPj4gT24gMDQvMTAvMjAxOSAxNjo1Mywg
R3JvZHpvdnNreSwgQW5kcmV5IHdyb3RlOg0KPj4+IE9uIDEwLzMvMTkgNDozNCBBTSwgTmVpbCBB
cm1zdHJvbmcgd3JvdGU6DQo+Pj4+IEhpIEFuZHJleSwNCj4+Pj4NCj4+Pj4gTGUgMDIvMTAvMjAx
OSDDoCAxNjo0MCwgR3JvZHpvdnNreSwgQW5kcmV5IGEgw6ljcml0IDoNCj4+Pj4+IE9uIDkvMzAv
MTkgMTA6NTIgQU0sIEhpbGxmIERhbnRvbiB3cm90ZToNCj4+Pj4+PiBPbiBNb24sIDMwIFNlcCAy
MDE5IDExOjE3OjQ1ICswMjAwIE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPj4+Pj4+PiBEaWQgYSBu
ZXcgcnVuIGZyb20gNS4zOg0KPj4+Pj4+Pg0KPj4+Pj4+PiBbICAgMzUuOTcxOTcyXSBDYWxsIHRy
YWNlOg0KPj4+Pj4+PiBbICAgMzUuOTc0MzkxXSAgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4
NWMvMHhmMA0KPj4+Pj4+PiAJCQlmZmZmMDAwMDEwNjY3ZjM4CUZGRkYwMDAwMTA2NjdGOTQNCj4+
Pj4+Pj4gCQkJZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmM6MzM1DQo+Pj4+
Pj4+DQo+Pj4+Pj4+IFRoZSBjcmFzaGluZyBsaW5lIGlzIDoNCj4+Pj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmFkLT5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4
dCA9PQ0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRp
dHktPmZlbmNlX2NvbnRleHQpIHsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gRG9lc24ndCBzZWVtIHJlbGF0
ZWQgdG8gZ3VpbHR5IGpvYi4NCj4+Pj4+PiBCYWlsIG91dCBpZiBzX2ZlbmNlIGlzIG5vIGxvbmdl
ciBmcmVzaC4NCj4+Pj4+Pg0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jDQo+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMNCj4+Pj4+PiBAQCAtMzMzLDYgKzMzMywxMCBAQCB2b2lkIGRybV9zY2hlZF9pbmNy
ZWFzZV9rYXJtYShzdHJ1Y3QgZHJtDQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICAgICAJCQlzcGluX2xv
Y2soJnJxLT5sb2NrKTsNCj4+Pj4+PiAgICAgCQkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGVu
dGl0eSwgdG1wLCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7DQo+Pj4+Pj4gKwkJCQlpZiAoIXNtcF9s
b2FkX2FjcXVpcmUoJmJhZC0+c19mZW5jZSkpIHsNCj4+Pj4+PiArCQkJCQlzcGluX3VubG9jaygm
cnEtPmxvY2spOw0KPj4+Pj4+ICsJCQkJCXJldHVybjsNCj4+Pj4+PiArCQkJCX0NCj4+Pj4+PiAg
ICAgCQkJCWlmIChiYWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09DQo+Pj4+Pj4gICAg
IAkJCQkgICAgZW50aXR5LT5mZW5jZV9jb250ZXh0KSB7DQo+Pj4+Pj4gICAgIAkJCQkJaWYgKGF0
b21pY19yZWFkKCZiYWQtPmthcm1hKSA+DQo+Pj4+Pj4gQEAgLTU0Myw3ICs1NDcsNyBAQCBFWFBP
UlRfU1lNQk9MKGRybV9zY2hlZF9qb2JfaW5pdCk7DQo+Pj4+Pj4gICAgIHZvaWQgZHJtX3NjaGVk
X2pvYl9jbGVhbnVwKHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IpDQo+Pj4+Pj4gICAgIHsNCj4+
Pj4+PiAgICAgCWRtYV9mZW5jZV9wdXQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpOw0KPj4+Pj4+
IC0Jam9iLT5zX2ZlbmNlID0gTlVMTDsNCj4+Pj4+PiArCXNtcF9zdG9yZV9yZWxlYXNlKCZqb2It
PnNfZmVuY2UsIDApOw0KPj4+Pj4+ICAgICB9DQo+Pj4+Pj4gICAgIEVYUE9SVF9TWU1CT0woZHJt
X3NjaGVkX2pvYl9jbGVhbnVwKTsNCj4+Pj4gVGhpcyBmaXhlZCB0aGUgcHJvYmxlbSBvbiB0aGUg
MTAgQ0kgcnVucy4NCj4+Pj4NCj4+Pj4gTmVpbA0KPj4+DQo+Pj4gVGhlc2UgYXJlIGdvb2QgbmV3
cyBidXQgSSBzdGlsbCBmYWlsIHRvIHNlZSBob3cgdGhpcyBmaXhlcyB0aGUgcHJvYmxlbSAtDQo+
Pj4gSGlsbGYsIGRvIHlvdSBtaW5kIGV4cGxhaW5pbmcgaG93IHlvdSBjYW1lIHVwIHdpdGggdGhp
cyBwYXJ0aWN1bGFyIGZpeCAtDQo+Pj4gd2hhdCB3YXMgdGhlIGJ1ZyB5b3Ugc2F3ID8NCj4+IEFz
IFN0ZXZlbiBleHBsYWluZWQsIHNlZW1zIHRoZSBzYW1lIGpvYiB3YXMgc3VibWl0dGVkIG9uIGJv
dGggSFcgc2xvdHMsDQo+PiBhbmQgdGhlbiB3aGVuIHRpbWVvdXQgb2NjdXJzIGVhY2ggdGhyZWFk
IGNhbGxzIHBhbmZyb3N0X2pvYl90aW1lZG91dA0KPj4gd2hpY2ggbGVhZHMgdG8gZHJtX3NjaGVk
X3N0b3AoKSBvbiB0aGUgZmlyc3QgY2FsbCBhbmQgb24gdGhlDQo+PiBzZWNvbmQgY2FsbCB0aGUg
am9iIHdhcyBhbHJlYWR5IGZyZWVkLg0KPj4NCj4+IFN0ZXZlbiBwcm9wb3NlZCBhIHdvcmtpbmcg
Zml4LCBhbmQgdGhpcyBvbmUgZG9lcyB0aGUgc2FtZSBidXQgb24NCj4+IHRoZSBkcm1fc2NoZWQg
c2lkZS4gVGhpcyBvbmUgbG9va3MgY2xlYW5lciwgYnV0IHBhbmZyb3N0IHNob3VsZA0KPj4gbm90
IGNhbGwgZHJtX3NjaGVkX3N0b3AoKSB0d2ljZSBmb3IgdGhlIHNhbWUgam9iLg0KPiBJJ20gbm90
IHN1cmUgdGhhdCBIaWxsZidzIGZpeCBpcyBzdWZmaWNpZW50LiBJbiBwYXJ0aWN1bGFyIGluDQo+
IGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSgpIEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhlIHNt
cF9sb2FkX2FjcXVpcmUoKQ0KPiBjYWxsIHByZXZlbnRzIGJhZC0+c19mZW5jZSBiZWNvbWluZyBO
VUxMIGltbWVkaWF0ZWx5IGFmdGVyd2FyZHMgKGJ1dA0KPiBhZG1pdHRlZGx5IHRoZSB3aW5kb3cg
aXMgbXVjaCBzbWFsbGVyKS4gQnV0IHJlYWxseSB0aGlzIGlzIGp1c3QgYQ0KPiBQYW5mcm9zdCBi
dWcgKGNhbGxpbmcgZHJtX3NjaGVkX3N0b3AoKSB0d2ljZSBvbiB0aGUgc2FtZSBqb2IpLg0KPg0K
PiBUaGUgcGFydCBvZiBteSBjaGFuZ2UgdGhhdCBJJ2Qgd2VsY29tZSBmZWVkYmFjayBvbiBpcyBj
aGFuZ2luZw0KPiBjYW5jZWxfZGVsYXllZF93b3JrKCkgdG8gY2FuY2VsX2RlbGF5ZWRfd29ya19z
eW5jKCkgaW4gZHJtX3NjaGVkX3N0b3AoKQ0KPiB3aGVuIGNhbGxlZCBvbiBkaWZmZXJlbnQgc2No
ZWR1bGVyIHRvIHRoZSBiYWQgam9iLiBJdCdzIG5vdCBjbGVhciB0byBtZQ0KPiBleGFjdGx5IHdo
YXQgdGhlIHNlbWFudGljcyBvZiB0aGUgZnVuY3Rpb24gc2hvdWxkIGJlLCBhbmQgSSBoYXZlbid0
DQo+IHRlc3RlZCB0aGUgZWZmZWN0IG9mIHRoZSBjaGFuZ2Ugb24gZHJpdmVycyBvdGhlciB0aGFu
IFBhbmZyb3N0Lg0KDQpZZWFoLCBhdCBsZWFzdCBvZiBoYW5kIHRoYXQgY2hhbmdlIGRvZXNuJ3Qg
c2VlbSB0byBtYWtlIHNlbnNlIHRvIG1lLg0KDQpNdWx0aXBsZSB0aW1lb3V0IHdvcmtlcnMgY2Fu
IHBlcmZlY3RseSBydW4gaW4gcGFyYWxsZWwsIFBhbmZyb3N0IG5lZWRzIA0KdG8gbWFrZSBzdXJl
IHRoYXQgdGhleSBkb24ndCBhZmZlY3QgZWFjaCBvdGhlci4NCg0KVGhlIHNpbXBsZXN0IHdheSBv
ZiBkb2luZyB0aGlzIGlzIHRvIGhhdmUgYSBtdXRleCB5b3UgdHJ5bG9jayB3aGVuIA0Kc3RhcnRp
bmcgdGhlIHJlc2V0Lg0KDQpUaGUgZmlyc3Qgb25lIGdyYWJiaW5nIGl0IHdpbnMsIGFsbCBvdGhl
ciBqdXN0IHNpbGVudGx5IHJldHVybi4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBT
dGV2ZQ0KPg0KPj4gTmVpbA0KPj4NCj4+PiBBbmRyZXkNCj4+Pg0KPj4+Pj4gRG9lcyB0aGlzIGNo
YW5nZSBoZWxwIHRoZSBwcm9ibGVtID8gTm90ZSB0aGF0IGRybV9zY2hlZF9qb2JfY2xlYW51cCBp
cw0KPj4+Pj4gY2FsbGVkIGZyb20gc2NoZWR1bGVyIHRocmVhZCB3aGljaCBpcyBzdG9wcGVkIGF0
IGFsbCB0aW1lcyB3aGVuIHdvcmtfdGRyDQo+Pj4+PiB0aHJlYWQgaXMgcnVubmluZyBhbmQgYW55
d2F5IHRoZSAnYmFkJyBqb2IgaXMgc3RpbGwgaW4gdGhlDQo+Pj4+PiByaW5nX21pcnJvcl9saXN0
IHdoaWxlIGl0J3MgYmVpbmcgYWNjZXNzZWQgZnJvbQ0KPj4+Pj4gZHJtX3NjaGVkX2luY3JlYXNl
X2thcm1hIHNvIEkgZG9uJ3QgdGhpbmsgZHJtX3NjaGVkX2pvYl9jbGVhbnVwIGNhbiBiZQ0KPj4+
Pj4gY2FsbGVkIGZvciBpdCBCRUZPUkUgb3Igd2hpbGUgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1h
IGlzIGV4ZWN1dGVkLg0KPj4+Pj4NCj4+Pj4+IEFuZHJleQ0KPj4+Pj4NCj4+Pj4+DQo+Pj4+Pj4g
ICAgIA0KPj4+Pj4+IC0tDQo+Pj4+Pj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+PiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPj4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
