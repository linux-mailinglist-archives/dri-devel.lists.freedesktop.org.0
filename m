Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A022DAD35A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691C896E5;
	Mon,  9 Sep 2019 07:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2B8896E5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 07:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXAmwDnly/Fkw3vqkgbreggXduaGd0CHg5UQwdWAMT3aVgUtkuo+L5tK6jAhtmhjpu23JdWUoRdm1IvU8uZVAN1io4x6AFLvDz28B25RaLGIbGv9cNtA4E5j4xOZqeSaJY43HMeP+c7vhFlFMJ1T57J0Yux9GolGfzrXxJlkSCEci1rFHMaeNzv46yfZwnkQ/srKWALfRe2ui7Ge03+aTN6uP2qVbghxdJos8ehjBI5oPAgeL2Kex2Hqg2Bq1GJ86kbdgSN3MF45s8CXcFOgZeGjTPwgWxtHktQV0Sjpwq5z6bhI7pD1WbR9/OhB4kn4yxQlw1yGutN0FwriCDi9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8Es7HS5guxNK4+EPog1EfXg2m2RYw/UahN3eC/izzg=;
 b=g+/1UtQYpvP8EL9fICDkFmKuy8+vv6DZReJudmk+AXWeVgxKoxhNibuY0e4tul/bayD3jL1hyuD1OrGD53ja0IGF0yUpCSYPtyC2sQcLPJggpodoiA7A3rKxTQd3Z8wwcvs63bPdcm2i98xjxMyhIrJybGgRBvtZmkOiHXBf7gMH8ahYWFkDdQgcEeM5mXiVUyhQ0bz0Y+cP6R84XyAosJDFOHP863TyqzT/41THNF/aMvTY8VYsNC5sXfNqbzZSPk6OriEuMQC2IxzqD1VBia4/bGk8FT4OS5XWIai/8cEXAGIp71HtK3WiR6RS/0b0UtUmRmRK18hB/bfVPLKEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1867.namprd12.prod.outlook.com (10.175.88.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 07:02:33 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 07:02:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/ttm: remove embedded vma_offset_manager
Thread-Topic: [PATCH 8/8] drm/ttm: remove embedded vma_offset_manager
Thread-Index: AQHVY7hH7UW6yTc8ukC7LpOkOjAu7Kci8aIA
Date: Mon, 9 Sep 2019 07:02:33 +0000
Message-ID: <d276f21e-fa03-aa68-4bf7-b154a7dc3e2e@amd.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
 <20190905070509.22407-9-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-9-kraxel@redhat.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::15) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a487d5ae-65be-4da3-a0e6-08d734f3b01b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1867; 
x-ms-traffictypediagnostic: DM5PR12MB1867:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1867EC49D48141EE02D1C38483B70@DM5PR12MB1867.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(256004)(7736002)(14444005)(229853002)(36756003)(305945005)(6506007)(76176011)(102836004)(31686004)(386003)(66946007)(2906002)(66476007)(64756008)(66446008)(66556008)(6116002)(2501003)(14454004)(8936002)(86362001)(81156014)(81166006)(8676002)(31696002)(65956001)(65806001)(478600001)(6512007)(6436002)(25786009)(6246003)(486006)(99286004)(110136005)(54906003)(186003)(71190400001)(58126008)(71200400001)(6486002)(66574012)(316002)(5660300002)(11346002)(53936002)(476003)(446003)(52116002)(46003)(4326008)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1867;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ALUxI0mHrMp9aknTbVgWMieYRVYkiVRvMwXmfstc3+DkErRX+G+fiGvPgvIEOWIRuNmZGRcUJ6cHnahqbiLtgPGBuK3ZqZoYCylrTVpDrRVIdFXAo5FoXTAlbychNoK8/l6zrbsZai9NuEAnl+w2qtBoR40MWN3a1syuWnF5fk0JmygLySyAEKPsiwR6CtikYPKt30CBtZxrwnY0lXMji4O/7GvUFd3IgE/mXzuCArI0Wb0kYl/I6sJvB63rBqn6Fl1m8LuxFAlN6CrHyOkibgiUnXgb1qT7WLozDLk4QQUWfiLv49mktwPCWCf5NONrLTJDUqAZjaEXOjaeRde793//Z5/JYq/x9/q2pZK+cuh1jWoBL4rKopB7GU3rusmPF1qoJ2or/T/mlJfNdMCpe3uMqi2RNA3z3Y4EZ4nn5wA=
Content-ID: <D2DE1219726E2D48A35767D0DBD8B217@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a487d5ae-65be-4da3-a0e6-08d734f3b01b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 07:02:33.5811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CziMbXGbyMgOQj8pcHCWh3+2/Q0h8lizUmy8uChPb5jtHHhPqqFRSJ+V8g+YGQRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1867
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8Es7HS5guxNK4+EPog1EfXg2m2RYw/UahN3eC/izzg=;
 b=MQBNNQyWMhYUA7XEV7P57KUCCFs6RxZnk14ftR3nDqPo+pIP30uEv9Azs9WeBXhOSUvwjUD6j7ZuvkbDbAIpFoxt4owe7m9ORhtCKli1OJFilv8d0QnKoCsMFpuL3c8Vb46TsK1KH+zmAZxSyUBrluju5e51O2HiC+QucemjCvk=
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
Cc: David Airlie <airlied@linux.ie>, "Huang, Ray" <Ray.Huang@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDkuMTkgdW0gMDk6MDUgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPiBObyB1c2VycyBs
ZWZ0LiAgRHJpdmVycyBlaXRoZXIgc2V0dXAgdm1hX29mZnNldF9tYW5hZ2VyIHRoZW1zZWxmDQo+
ICh2bXdnZngpIG9yIHBhc3MgdGhlIGdlbSB2bWFfb2Zmc2V0X21hbmFnZXIgdG8gdHRtX2JvX2Rl
dmljZV9pbml0DQo+IChhbGwgb3RoZXIgZHJpdmVycykuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPg0KDQpQYXRjaGVzICM0LCAjNSBhbmQgIzgg
aW4gdGhpcyBzZXJpZXMgYXJlIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIA0KPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KSSBjYW4ndCBzZWUgdGhlIHJlc3QgaW4gbXkgaW5ib3gg
YW55d2hlcmUuIEhhdmUgeW91IHNlbmQgYWxsIG9mIHRoZW0gdG8gDQpkcmktZGV2ZWw/DQoNCkNo
cmlzdGlhbi4NCg0KPiAtLS0NCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwg
NCArLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8IDkgKystLS0tLS0t
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4gaW5kZXggZTM2NTQzNGY5MmIzLi40ZTMwN2Y2
NWY0OTcgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4g
KysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaA0KPiBAQCAtNDQyLDcgKzQ0Miw2
IEBAIGV4dGVybiBzdHJ1Y3QgdHRtX2JvX2dsb2JhbCB7DQo+ICAgICogQGRyaXZlcjogUG9pbnRl
ciB0byBhIHN0cnVjdCB0dG1fYm9fZHJpdmVyIHN0cnVjdCBzZXR1cCBieSB0aGUgZHJpdmVyLg0K
PiAgICAqIEBtYW46IEFuIGFycmF5IG9mIG1lbV90eXBlX21hbmFnZXJzLg0KPiAgICAqIEB2bWFf
bWFuYWdlcjogQWRkcmVzcyBzcGFjZSBtYW5hZ2VyIChwb2ludGVyKQ0KPiAtICogQF92bWFfbWFu
YWdlcjogQWRkcmVzcyBzcGFjZSBtYW5hZ2VyIChlbmJlZGRlZCkNCj4gICAgKiBscnVfbG9jazog
U3BpbmxvY2sgdGhhdCBwcm90ZWN0cyB0aGUgYnVmZmVyK2RldmljZSBscnUgbGlzdHMgYW5kDQo+
ICAgICogZGRlc3Ryb3kgbGlzdHMuDQo+ICAgICogQGRldl9tYXBwaW5nOiBBIHBvaW50ZXIgdG8g
dGhlIHN0cnVjdCBhZGRyZXNzX3NwYWNlIHJlcHJlc2VudGluZyB0aGUNCj4gQEAgLTQ2Niw3ICs0
NjUsNiBAQCBzdHJ1Y3QgdHRtX2JvX2RldmljZSB7DQo+ICAgCSAqIFByb3RlY3RlZCBieSBpbnRl
cm5hbCBsb2Nrcy4NCj4gICAJICovDQo+ICAgCXN0cnVjdCBkcm1fdm1hX29mZnNldF9tYW5hZ2Vy
ICp2bWFfbWFuYWdlcjsNCj4gLQlzdHJ1Y3QgZHJtX3ZtYV9vZmZzZXRfbWFuYWdlciBfdm1hX21h
bmFnZXI7DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIFByb3RlY3RlZCBieSB0aGUgZ2xvYmFsOmxy
dSBsb2NrLg0KPiBAQCAtNTg3LDcgKzU4NSw3IEBAIGludCB0dG1fYm9fZGV2aWNlX3JlbGVhc2Uo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpOw0KPiAgICAqIEBnbG9iOiBBIHBvaW50ZXIgdG8g
YW4gaW5pdGlhbGl6ZWQgc3RydWN0IHR0bV9ib19nbG9iYWwuDQo+ICAgICogQGRyaXZlcjogQSBw
b2ludGVyIHRvIGEgc3RydWN0IHR0bV9ib19kcml2ZXIgc2V0IHVwIGJ5IHRoZSBjYWxsZXIuDQo+
ICAgICogQG1hcHBpbmc6IFRoZSBhZGRyZXNzIHNwYWNlIHRvIHVzZSBmb3IgdGhpcyBiby4NCj4g
LSAqIEB2bWFfbWFuYWdlcjogQSBwb2ludGVyIHRvIGEgdm1hIG1hbmFnZXIgb3IgTlVMTC4NCj4g
KyAqIEB2bWFfbWFuYWdlcjogQSBwb2ludGVyIHRvIGEgdm1hIG1hbmFnZXIuDQo+ICAgICogQGZp
bGVfcGFnZV9vZmZzZXQ6IE9mZnNldCBpbnRvIHRoZSBkZXZpY2UgYWRkcmVzcyBzcGFjZSB0aGF0
IGlzIGF2YWlsYWJsZQ0KPiAgICAqIGZvciBidWZmZXIgZGF0YS4gVGhpcyBlbnN1cmVzIGNvbXBh
dGliaWxpdHkgd2l0aCBvdGhlciB1c2VycyBvZiB0aGUNCj4gICAgKiBhZGRyZXNzIHNwYWNlLg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMNCj4gaW5kZXggOGRjMjZiYWJjNWNiLi44ODFjZjI2ZDY5OGUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiBAQCAtMTcwNCw4ICsxNzA0LDYgQEAgaW50IHR0bV9i
b19kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikNCj4gICAJCQlwcl9k
ZWJ1ZygiU3dhcCBsaXN0ICVkIHdhcyBjbGVhblxuIiwgaSk7DQo+ICAgCXNwaW5fdW5sb2NrKCZn
bG9iLT5scnVfbG9jayk7DQo+ICAgDQo+IC0JZHJtX3ZtYV9vZmZzZXRfbWFuYWdlcl9kZXN0cm95
KCZiZGV2LT5fdm1hX21hbmFnZXIpOw0KPiAtDQo+ICAgCWlmICghcmV0KQ0KPiAgIAkJdHRtX2Jv
X2dsb2JhbF9yZWxlYXNlKCk7DQo+ICAgDQo+IEBAIC0xNzIyLDggKzE3MjAsOCBAQCBpbnQgdHRt
X2JvX2RldmljZV9pbml0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LA0KPiAgIAlzdHJ1Y3Qg
dHRtX2JvX2dsb2JhbCAqZ2xvYiA9ICZ0dG1fYm9fZ2xvYjsNCj4gICAJaW50IHJldDsNCj4gICAN
Cj4gLQlpZiAoIXZtYV9tYW5hZ2VyKQ0KPiAtCQl2bWFfbWFuYWdlciA9ICZiZGV2LT5fdm1hX21h
bmFnZXI7DQo+ICsJaWYgKFdBUk5fT04odm1hX21hbmFnZXIgPT0gTlVMTCkpDQo+ICsJCXJldHVy
biAtRUlOVkFMOw0KPiAgIA0KPiAgIAlyZXQgPSB0dG1fYm9fZ2xvYmFsX2luaXQoKTsNCj4gICAJ
aWYgKHJldCkNCj4gQEAgLTE3NDIsOSArMTc0MCw2IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsDQo+ICAgCQlnb3RvIG91dF9ub19zeXM7DQo+ICAg
DQo+ICAgCWJkZXYtPnZtYV9tYW5hZ2VyID0gdm1hX21hbmFnZXI7DQo+IC0JZHJtX3ZtYV9vZmZz
ZXRfbWFuYWdlcl9pbml0KCZiZGV2LT5fdm1hX21hbmFnZXIsDQo+IC0JCQkJICAgIERSTV9GSUxF
X1BBR0VfT0ZGU0VUX1NUQVJULA0KPiAtCQkJCSAgICBEUk1fRklMRV9QQUdFX09GRlNFVF9TSVpF
KTsNCj4gICAJSU5JVF9ERUxBWUVEX1dPUksoJmJkZXYtPndxLCB0dG1fYm9fZGVsYXllZF93b3Jr
cXVldWUpOw0KPiAgIAlJTklUX0xJU1RfSEVBRCgmYmRldi0+ZGRlc3Ryb3kpOw0KPiAgIAliZGV2
LT5kZXZfbWFwcGluZyA9IG1hcHBpbmc7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
