Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B805AFC2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 14:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7759389C53;
	Sun, 30 Jun 2019 12:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750074.outbound.protection.outlook.com [40.107.75.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F18989C53
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 12:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=CLhz9dVNSwGznPMJ00tWpK/84BoUCldRahP3VNfo5wTuG5XumtDntKicuRqit1ehOkNg+unIC8DVvgi9ZlaYiw0rwBAV0SiJCQnHvEfO6BXZ0nxelRAJQyh5WJpCcg9LqaLKhUgQ5c1OyH7S2gKHPpOCA9Pkca68p+K5nHbyNsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ankGE5VT4Viu/ftEl2w6ZW5p5PVSB1lktacucZQ2sQM=;
 b=bx9scBV+b5tbMnX0VJB214Ce6ORn7CLNga0gFpFiX5sS1zPB+yJCgEo2KFSXs7LTUIRNuHJHIvzGsywQhBswQrLANO2ju3JlyW7QHVD3SpsLyhyVUGp0SRh5cvZ1DnsJcUQRfUNr3D5M6DKmZVYMqphlR6KxESzPYU1GQBYTIKg=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1945.namprd12.prod.outlook.com (10.175.89.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Sun, 30 Jun 2019 12:08:26 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.020; Sun, 30 Jun 2019
 12:08:26 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Sam Ravnborg <sam@ravnborg.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v1 25/33] drm/scheduler: drop use of drmP.h
Thread-Topic: [PATCH v1 25/33] drm/scheduler: drop use of drmP.h
Thread-Index: AQHVLwvXgfCkpVb4e06uSyN/LSFkB6a0GukA
Date: Sun, 30 Jun 2019 12:08:26 +0000
Message-ID: <c06db8d8-66b8-4738-804f-2dd54f80f426@amd.com>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-26-sam@ravnborg.org>
In-Reply-To: <20190630061922.7254-26-sam@ravnborg.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0151.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::19) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52fd2c15-62ae-4283-2655-08d6fd53a7b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1945; 
x-ms-traffictypediagnostic: DM5PR12MB1945:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1945D740A76FB0750CD359F783FE0@DM5PR12MB1945.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 008421A8FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(102836004)(7736002)(11346002)(486006)(6246003)(5660300002)(446003)(2501003)(305945005)(6486002)(53936002)(2616005)(64756008)(66556008)(4326008)(966005)(65956001)(65806001)(68736007)(6116002)(72206003)(66476007)(14454004)(66446008)(86362001)(73956011)(31696002)(66946007)(229853002)(186003)(65826007)(6436002)(8936002)(76176011)(54906003)(31686004)(256004)(36756003)(8676002)(81156014)(81166006)(52116002)(316002)(386003)(6506007)(478600001)(71200400001)(71190400001)(46003)(25786009)(6306002)(476003)(110136005)(99286004)(58126008)(64126003)(6512007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1945;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0CXt2zZllfgeS8bc5xhkUiqRvIePaNdHuzrxmT6nGhBrCcwLuwqZDqI0XfSWlrIHqMfPl5iIXdHAFWOZfza2N7mELRL/EeAmGOlgqzW+9OObTdOyTIBM37ChDMPhvsA5bEa2oS8MGggllt21BRsDA+5plJs/Zqh87KbEIC12UKrdRG/kdO+me+eBPTv0g2pyinl0WiNnlUS+f5rOVKk23a3DFnaOPP5HMy4XBZPuregINxlTycdH6V2drQPlH+fHTiyqMMIySUUKZsSvyasSRbAvKYMyf7AqdjmdyM0eZjjaLbfQdS3ki3NahrNXz34CGiAYVjRLunpXv3GDrF6skEJTwX8+ZMK7C0Zvc8gkLCH6pXyb9OW5GGdLYHKx+2A83IoYwVOGsz5VZyqknIYmyYKE//NzJtyYZn7WtHsAqBQ=
Content-ID: <0E0C18FAC8DEE949BFD5DA38A8D750BF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fd2c15-62ae-4283-2655-08d6fd53a7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2019 12:08:26.2398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1945
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ankGE5VT4Viu/ftEl2w6ZW5p5PVSB1lktacucZQ2sQM=;
 b=z2qdD2ZSNWoE9+MVhGGfAsUHm4YozDsuYi7RGZQVCXpso8OojyJso7F3QJ8WhaEzT4CBh21cclKVgR+ChnBpeHPR0qzEQE0EgoipuCFYSGwzyfbWPsnC4BuYnUJHHUwNv7EJoTHKiRhOJGavlauRc7wbL+qz9sXOeOb6fFpFLh4=
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
Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDYuMTkgdW0gMDg6MTkgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IERyb3AgdXNlIG9m
IHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4NCj4gRml4IGZhbGxvdXQuDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4NCj4gQ2M6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0K
PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IENj
OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNA
YW5ob2x0Lm5ldD4NCj4gQ2M6IEJhcyBOaWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXpl
bi5ubD4NCj4gQ2M6IFNoYXJhdCBNYXNldHR5IDxzbWFzZXR0eUBjb2RlYXVyb3JhLm9yZz4NCj4g
Q2M6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+DQo+IENjOiBO
YXlhbiBEZXNobXVraCA8bmF5YW4yNmRlc2htdWtoQGdtYWlsLmNvbT4NCj4gQ2M6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAtLS0NCj4gVGhlIGxpc3Qgb2YgY2M6IHdh
cyB0b28gbGFyZ2UgdG8gYWRkIGFsbCByZWNpcGllbnRzIHRvIHRoZSBjb3ZlciBsZXR0ZXIuDQo+
IFBsZWFzZSBmaW5kIGNvdmVyIGxldHRlciBoZXJlOg0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lL3RocmVhZC5odG1sDQo+IFNlYXJj
aCBmb3IgImRybTogZHJvcCB1c2Ugb2YgZHJtcC5oIGluIGRybS1taXNjIg0KPg0KPiAgICAgICAg
ICBTYW0NCj4NCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL2dwdV9zY2hlZHVsZXJfdHJh
Y2UuaCB8IDIgLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5j
ICAgICAgICB8IDMgKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5j
ZS5jICAgICAgICAgfCA2ICsrKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jICAgICAgICAgIHwgMyArKy0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvZ3B1X3NjaGVkdWxlcl90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9ncHVfc2NoZWR1bGVyX3RyYWNlLmgNCj4gaW5kZXggMTYyNmYzOTY3MTMwLi5kNzkwODY0
OThhZmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvZ3B1X3NjaGVk
dWxlcl90cmFjZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvZ3B1X3NjaGVk
dWxlcl90cmFjZS5oDQo+IEBAIC0yOCw4ICsyOCw2IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3RyYWNlcG9pbnQuaD4NCj4gICANCj4gLSNpbmNs
dWRlIDxkcm0vZHJtUC5oPg0KPiAtDQo+ICAgI3VuZGVmIFRSQUNFX1NZU1RFTQ0KPiAgICNkZWZp
bmUgVFJBQ0VfU1lTVEVNIGdwdV9zY2hlZHVsZXINCj4gICAjZGVmaW5lIFRSQUNFX0lOQ0xVREVf
RklMRSBncHVfc2NoZWR1bGVyX3RyYWNlDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9lbnRpdHkuYw0KPiBpbmRleCAzNWRkYmVjMTM3NWEuLmQ1YTZhOTQ2ZjQ4NiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jDQo+IEBAIC0yMiw2ICsyMiw5
IEBADQo+ICAgICovDQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4NCj4gKyNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICsNCj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+
DQo+ICAgI2luY2x1ZGUgPGRybS9ncHVfc2NoZWR1bGVyLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUg
ImdwdV9zY2hlZHVsZXJfdHJhY2UuaCINCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZmVuY2UuYw0KPiBpbmRleCBkOGQyZGZmOWVhMmYuLjU0OTc3NDA4ZjU3NCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5jZS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYw0KPiBAQCAtMjIsOSArMjIsMTEgQEAN
Cj4gICAgKi8NCj4gICANCj4gICAjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPg0KPiAtI2luY2x1
ZGUgPGxpbnV4L3dhaXQuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICAjaW5j
bHVkZSA8bGludXgvc2NoZWQuaD4NCj4gLSNpbmNsdWRlIDxkcm0vZHJtUC5oPg0KPiArI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC93YWl0Lmg+DQo+ICsNCj4gICAj
aW5jbHVkZSA8ZHJtL2dwdV9zY2hlZHVsZXIuaD4NCj4gICANCj4gICBzdGF0aWMgc3RydWN0IGtt
ZW1fY2FjaGUgKnNjaGVkX2ZlbmNlX3NsYWI7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jDQo+IGluZGV4IGMxMDU4ZWVjZTE2Yi4uOWEwZWU3NGQ4MmRjIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiBAQCAtNDgsNyArNDgsOCBAQA0K
PiAgICNpbmNsdWRlIDxsaW51eC93YWl0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+
DQo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvc2NoZWQvdHlwZXMuaD4NCj4gLSNpbmNsdWRlIDxk
cm0vZHJtUC5oPg0KPiArDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiAgICNpbmNs
dWRlIDxkcm0vZ3B1X3NjaGVkdWxlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vc3BzY19xdWV1ZS5o
Pg0KPiAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
