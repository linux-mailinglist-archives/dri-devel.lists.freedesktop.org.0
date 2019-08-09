Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A24879E8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E14B6EDF9;
	Fri,  9 Aug 2019 12:27:26 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710069.outbound.protection.outlook.com [40.107.71.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3937E6EDF9
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 12:27:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjeZ2BcZruKGomSdCTPhT64Kl5UM0XZminFGaV7PuNXuTwLBJ1S3LSM6StpkeViD73rUba4lDtXXjn/1kI+Hm2o7bizUwoxfrTHzeiHunAueERoMoiGK2P9c61dKX+asiR5fiCT6iGx6m4qp3fqOuU00pFv9O5gZ33BXZQo53GzHQpSJFkpGG9r629BO3yItICdd3qXSzFz/TB7gDDqWZCJTXN8JSHTkBql0792odOfzWqEFUqEzrAi3Y5KXFfMFJB3CySnt1yks2x3sSoJ8oDeD5cvKh3n2hdKc7cesBMfUmsIhyq5xAQNil1RbAIookdH51WvLNeVIAVoKsxTItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eohJ2vEY/cp5uBe6h++uHkW9S2MzoaIWVZvMS+LczjA=;
 b=SzeGVFYOeIhmjbQRd/oEC2HGBCFn/XenGVEY3k/pyBG9eRjTyxZvB7KO0Xr2ZltxHT8sjtO2LnUeKjckR/3Fr0aHI+YJgr6YNgfj9LK/GzOKsI73u7dyGAevi8JDrZuFaGFY+RofsvFx3Zb8ntUCZQvgcWnnWLTmoUTrqa3XM4ZWWJWdkRmKOU5ssugXkzT8aOxMYMdtgot2ydB/o+4bfQ7qD8mE9ttkLUjQ/UfVk1DbnzxFvxHyCz6URhx11me0eZ9gQzVQmhhK5IX6HZUFIZogi2ZHlxNVOUmPWNLYOJ4flgJYyV9FOKmiVNUuIcR7zJ6a9tGs9ZSWNSU9EPpuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1547.namprd12.prod.outlook.com (10.172.38.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 9 Aug 2019 12:27:20 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 12:27:20 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, "dri-devel@freedesktop.org"
 <dri-devel@freedesktop.org>
Subject: Re: [PATCH v4 1/1] drm/syncobj: add sideband payload
Thread-Topic: [PATCH v4 1/1] drm/syncobj: add sideband payload
Thread-Index: AQHVTqXcA6QOz++iUE+JCh5jWTOMpqbysi2AgAALzYCAAABGAA==
Date: Fri, 9 Aug 2019 12:27:20 +0000
Message-ID: <cfdbfad3-f8b1-84a2-a9f5-a555e1505bc2@amd.com>
References: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
 <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
 <156535104115.29541.10253048719287893942@skylake-alporthouse-com>
 <ee964f2a-088d-cce7-4040-0eff143d9b8b@intel.com>
In-Reply-To: <ee964f2a-088d-cce7-4040-0eff143d9b8b@intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::33) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c99984a-1977-42b5-7c27-08d71cc4ec76
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1547; 
x-ms-traffictypediagnostic: DM5PR12MB1547:
x-microsoft-antispam-prvs: <DM5PR12MB15471BB889B455A2F070C04383D60@DM5PR12MB1547.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(110136005)(4744005)(58126008)(5660300002)(6116002)(14454004)(486006)(256004)(446003)(46003)(52116002)(76176011)(4326008)(99286004)(6486002)(186003)(65956001)(65806001)(71200400001)(71190400001)(316002)(6436002)(2501003)(64126003)(2906002)(305945005)(66446008)(64756008)(66556008)(66476007)(6512007)(6246003)(81166006)(81156014)(66946007)(86362001)(102836004)(31686004)(65826007)(53936002)(8936002)(11346002)(25786009)(476003)(14444005)(2616005)(31696002)(53546011)(6506007)(386003)(478600001)(7736002)(8676002)(36756003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1547;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ivSH77B7JwEmUFpqSaB2elcyhYfaO2/aYH3G0rXYXvkpx7Vx9H4VOrRZiDoiYqCPk4WKsMl89Z0TPAuqyqODsIu5vsuNBnCrqMrYt8k9dhzJAe668PWqCdmVKD+D6IAW0VUFTgnUfjCJHi3df5+kGyt0YLcFOJIRde0O7V61s40dOrvv5d3OC+2Vif2OW7m8EaAwqNQur4stFFGgr5T8MjEEmqu4FqVXW6Z7T8QmRj+g/IcAVhJPTo2AHjtP2BGiFZzRENbR7I9GurAVp4EW1LPBz97ERo/lnGbpw2u+1zAz+Ic/q8n/ocMZpQfdxPb08ooK8eQq0RdFZGUqIYnTNRoK7vja5+8i/OTANeb511uGLPSdnYWA7AxzxzqRT1eT8KXLHvlMfsnLMQFS3EL0Uu0GuVOnoLHrv/pm7b2yyNw=
x-ms-exchange-transport-forked: True
Content-ID: <F750750BDC54E3428EA3E78116786F48@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c99984a-1977-42b5-7c27-08d71cc4ec76
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 12:27:20.5069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fv87Oxs5zFA91VT+/7/JluUDm+pmhX9UrUJVSJTNobAiouYP9UR+///pE5XLjA90
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1547
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eohJ2vEY/cp5uBe6h++uHkW9S2MzoaIWVZvMS+LczjA=;
 b=ugo+ukjB4Kra+oYARVsyWeCKKfFPhffIxcx63XoW8CGnk2HABzZwqXCTMCkjNqCWaTxi7KTrkhuS9IN9fakFmEWQaHZ9ThuiWtrt2E8qNbMG3jm1EOmMQPdaeq0h9FZYjHWxea7eILblYBWE4+9SR2uG418p0yYaFLojNhfij0o=
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDguMTkgdW0gMTQ6MjYgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoNCj4gT24gMDkv
MDgvMjAxOSAxNDo0NCwgQ2hyaXMgV2lsc29uIHdyb3RlOg0KPj4gUXVvdGluZyBMaW9uZWwgTGFu
ZHdlcmxpbiAoMjAxOS0wOC0wOSAxMjozMDozMCkNCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2RybS9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4+PiBpbmRleCA4YTViMmY4
ZjhlYjkuLjFjZTgzODUzZjk5NyAxMDA2NDQNCj4+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2Ry
bS5oDQo+Pj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaA0KPj4+IEBAIC03ODUsNiArNzg1
LDIyIEBAIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7DQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoCBfX3UzMiBwYWQ7DQo+Pj4gwqAgfTsNCj4+PiDCoCArc3RydWN0IGRybV9zeW5jb2Jq
X2JpbmFyeV9hcnJheSB7DQo+Pj4gK8KgwqDCoMKgwqDCoCAvKiBBIHBvaW50ZXIgdG8gYW4gYXJy
YXkgb2YgdTMyIHN5bmNvYmogaGFuZGxlcy4gKi8NCj4+PiArwqDCoMKgwqDCoMKgIF9fdTY0IGhh
bmRsZXM7DQo+Pj4gK8KgwqDCoMKgwqDCoCAvKiBBIHBvaW50ZXIgdG8gYW4gYXJyYXkgb2YgdTMy
IGFjY2VzcyBmbGFncyBmb3IgZWFjaCANCj4+PiBoYW5kbGUuICovDQo+Pj4gK8KgwqDCoMKgwqDC
oCBfX3U2NCBhY2Nlc3NfZmxhZ3M7DQo+Pj4gK8KgwqDCoMKgwqDCoCAvKiBUaGUgYmluYXJ5IHZh
bHVlIG9mIGEgc3luY29iaiBpcyByZWFkIGJlZm9yZSBpdCBpcyANCj4+PiBpbmNyZW1lbnRlZC4g
Ki8NCj4+PiArI2RlZmluZSBJOTE1X0RSTV9TWU5DT0JKX0JJTkFSWV9JVEVNX1ZBTFVFX1JFQUQg
KDF1IDw8IDApDQo+Pj4gKyNkZWZpbmUgSTkxNV9EUk1fU1lOQ09CSl9CSU5BUllfSVRFTV9WQUxV
RV9JTkPCoCAoMXUgPDwgMSkNCj4+IFlvdSdyZSBub3QgaW4gS2Fuc2FzIGFueW1vcmUgOykNCj4+
IC1DaHJpcw0KPj4NCj4gV2hpY2ggbWVhbnM/IDopDQoNCllvdSBhcmUgaW4gY29tbW9uIERSTSBj
b2RlLCBidXQgdGhlIG5ldyBkZWZpbmVzIHN0YXJ0IHdpdGggSTkxNV8uLi4uDQoNCkNoZWVycywN
CkNocmlzdGlhbi4NCg0KPg0KPg0KPiAtTGlvbmVsDQo+DQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
