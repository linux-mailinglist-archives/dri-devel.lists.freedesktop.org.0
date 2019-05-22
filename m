Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D326232
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 12:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D649F89932;
	Wed, 22 May 2019 10:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720041.outbound.protection.outlook.com [40.107.72.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5AA89113
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:46:49 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2582.namprd12.prod.outlook.com (52.132.141.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Wed, 22 May 2019 10:46:48 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 10:46:48 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "michel@daenzer.net" <michel@daenzer.net>
Subject: Re: [PATCH 1/2] update drm.h
Thread-Topic: [PATCH 1/2] update drm.h
Thread-Index: AQHVEH3q+wOLSClf5kC/en2A/5JTSqZ29kuA
Date: Wed, 22 May 2019 10:46:48 +0000
Message-ID: <17e558ac-bda8-0541-b102-2fd730ce4753@amd.com>
References: <20190522090800.15908-1-david1.zhou@amd.com>
In-Reply-To: <20190522090800.15908-1-david1.zhou@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0202CA0031.eurprd02.prod.outlook.com
 (2603:10a6:208:1::44) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9874b687-4796-4247-ae40-08d6dea2ca19
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2582; 
x-ms-traffictypediagnostic: DM5PR12MB2582:
x-microsoft-antispam-prvs: <DM5PR12MB2582EAEB0696B41741B9B93783000@DM5PR12MB2582.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:81;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(486006)(386003)(31686004)(476003)(86362001)(2616005)(81156014)(11346002)(2201001)(31696002)(102836004)(8676002)(186003)(71200400001)(71190400001)(81166006)(52116002)(64126003)(99286004)(46003)(76176011)(8936002)(6506007)(446003)(68736007)(7736002)(2906002)(256004)(229853002)(6486002)(6512007)(6116002)(6436002)(305945005)(6246003)(2501003)(53936002)(25786009)(4744005)(478600001)(5660300002)(36756003)(65806001)(66946007)(66476007)(66556008)(64756008)(66446008)(73956011)(72206003)(110136005)(65956001)(316002)(58126008)(65826007)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2582;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WOwS2+HUBBWjTh0RE0o4WbSuu0ENGNg8sCzAGI41UKSCmJM6P3RHb2h4Qrq59UGaJvPr78pk/7pBbChMM2VT/OEV9FqEuePgcu/UTHX7PuGs1oWsEuiH6afjq3sQMrl+PtsJ8r5psnclHrXkaES/8K+Cg00iXDcjA/ubgH8f7h2PZp9eesvAiO+t756ut9aSGjBUaz2HuDutvjP2XjPGKoNOaYzl+/TMH6aeRWpfjK/bXuBq2HRw7Vpzy/pQvyBsizRYtSr5D9qBFfw3DDyubooDvJZgPb8BqGpyo2HsNncwCNc4WHxCqb7te7GK8fG78SGE3kucTuuJimtOWOkaPLNENpxhmPOk8XCPsYpUCatDWyDsfSdzBLXsnmpAlWg+znTonok77dPtpXss5ewNvfEN4VDpq5rziWkpvdSrKpw=
Content-ID: <DB492BBC7EFCD04384D3EFB174FF2E0B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9874b687-4796-4247-ae40-08d6dea2ca19
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 10:46:48.1255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2582
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSN3mR58+S7ncHh5Gd5NZhTrGM3sWUpq39/VEm+zDss=;
 b=kBRZ6ZZJNB0hULRtmDn9C2CWdl81tEdak0f+o0ygkVK6KWmEhhtadRWKl4oMBtIVZrJnucRGujXUpWs3SgkfiI0UkwkT9U4js3UHsU8y8LY+tvCEvcWaEdIMTlYDfVBZZL0dOxAefPdyHRp0C0a2epeADEHyjqwWVlrAA7fkFts=
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

QW0gMjIuMDUuMTkgdW0gMTE6MDcgc2NocmllYiBDaHVubWluZyBaaG91Og0KPiAgICAgYSkgZGVs
dGE6IG9ubHkgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FDQo+ICAgICBiKSBHZW5lcmF0ZWQgdXNp
bmcgbWFrZSBoZWFkZXJzX2luc3RhbGwuDQo+ICAgICBjKSBHZW5lcmF0ZWQgZnJvbSBvcmlnaW4v
ZHJtLW1pc2MtbmV4dCBjb21taXQgOTgyYzA1MDBmZDFhODAxMmMzMWQzYzlkZDhkZTI4NTEyOTkw
NDY1NiINCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1k
LmNvbT4NCj4gU3VnZ2VzdGVkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
Pg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KDQo+IC0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybS5oIHwgMiArKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bS5oIGIvaW5jbHVkZS9kcm0vZHJtLmgNCj4gaW5kZXggYzg5M2YzYjQuLjQzOGFiZGUzIDEwMDY0
NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm0uaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm0uaA0K
PiBAQCAtNDQsNiArNDQsNyBAQCB0eXBlZGVmIHVuc2lnbmVkIGludCBkcm1faGFuZGxlX3Q7DQo+
ICAgDQo+ICAgI2Vsc2UgLyogT25lIG9mIHRoZSBCU0RzICovDQo+ICAgDQo+ICsjaW5jbHVkZSA8
c3RkaW50Lmg+DQo+ICAgI2luY2x1ZGUgPHN5cy9pb2Njb20uaD4NCj4gICAjaW5jbHVkZSA8c3lz
L3R5cGVzLmg+DQo+ICAgdHlwZWRlZiBpbnQ4X3QgICBfX3M4Ow0KPiBAQCAtNjQzLDYgKzY0NCw3
IEBAIHN0cnVjdCBkcm1fZ2VtX29wZW4gew0KPiAgICNkZWZpbmUgRFJNX0NBUF9QQUdFX0ZMSVBf
VEFSR0VUCTB4MTENCj4gICAjZGVmaW5lIERSTV9DQVBfQ1JUQ19JTl9WQkxBTktfRVZFTlQJMHgx
Mg0KPiAgICNkZWZpbmUgRFJNX0NBUF9TWU5DT0JKCQkweDEzDQo+ICsjZGVmaW5lIERSTV9DQVBf
U1lOQ09CSl9USU1FTElORQkweDE0DQo+ICAgDQo+ICAgLyoqIERSTV9JT0NUTF9HRVRfQ0FQIGlv
Y3RsIGFyZ3VtZW50IHR5cGUgKi8NCj4gICBzdHJ1Y3QgZHJtX2dldF9jYXAgew0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
