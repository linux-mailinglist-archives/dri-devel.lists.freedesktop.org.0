Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABDDCB4FC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526386EAAE;
	Fri,  4 Oct 2019 07:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D3C6EAAE;
 Fri,  4 Oct 2019 07:29:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J12CrsvLQTqX42tkc20ASR0o2SB1OjpUVPKV5L3YIZYhZpWDzEC5RDzIMb7+KLJMaPyuAp4BPJPlibDXFdn9NjFwmu0Dihe/nkxm37UQ8xBZ5UFl/3+FIkRFrRwTQKD0TsyGJcy7YpbyFVAJgrhptr7S42U7y4TqNyBzeO5MuInS0dxGx59k/4vIOfBRtsqyGe5rKLIR2V9s5gaKVzSLtD24usWWL1aHxuHz+e7koFDVJ0Hm+Yj2SXLaF3Cw+8V7EOrlIpkW/Oh6udWVZ9qqKHU6bJ6MdMqFTMJJCT9mXSknT/cN8ey8/u0ERywb2Qux8IsQCQQRsQPUxVnj/NapXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A15QNR97MmetXU4C2f9OI2Dxse0h2tNQ0iHqEtUsaw0=;
 b=X6FNyT4DcwmNwQchnCu2Ld1dXmFxgVAkIH0c2zw/62wKT6LvWX4kXucN/R8/r4PgFziZCKpPMhB+VHEUH2mv8ga6vBhwujml7a9CmY/Iwe6hKQcxoCr/BL+6D29DavIq+0yMNqlfIdc5SmKuZPYigRQj8pvL8r/OIAhn0U5qmRriW4GsLvvKwfem07s1g6RUkB/xNu0QJN+cur9FEtRO4vjzcdbQhRVxYzhwFuRmkeO7V7Q858kqLSpojYbGlrDjOQxLlKcw+uY6UFFz/FSNB7A713gkG/I9tcMFIvZE1RvqzP6UyxTGNmPjIVYWZxjEFgd9Wj3aL5hf24v4MWAk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1524.namprd12.prod.outlook.com (10.172.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 07:29:51 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92%3]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 07:29:50 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Colin King <colin.king@canonical.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][next] drm/amdgpu: remove redundant variable r and
 redundant return statement
Thread-Topic: [PATCH][next] drm/amdgpu: remove redundant variable r and
 redundant return statement
Thread-Index: AQHVejM9uzuDyOCXREyBhz0+GUtm1adKFpUA
Date: Fri, 4 Oct 2019 07:29:50 +0000
Message-ID: <70c50fec-7ab7-3ac9-3f49-d5f2651554e4@amd.com>
References: <20191003214049.23067-1-colin.king@canonical.com>
In-Reply-To: <20191003214049.23067-1-colin.king@canonical.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR06CA0010.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::23) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75b5225e-c7a4-48d0-67fb-08d7489ca479
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1524:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB152423D0297739CF41E8581D839E0@BN6PR12MB1524.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(189003)(199004)(66446008)(81166006)(6486002)(6436002)(31686004)(316002)(65956001)(6116002)(256004)(2501003)(229853002)(54906003)(2906002)(65806001)(4326008)(478600001)(110136005)(8936002)(36756003)(81156014)(7736002)(305945005)(8676002)(71200400001)(71190400001)(6512007)(25786009)(64756008)(14454004)(66476007)(66556008)(66946007)(5660300002)(46003)(186003)(31696002)(86362001)(446003)(76176011)(486006)(476003)(11346002)(2616005)(6246003)(99286004)(102836004)(386003)(6506007)(52116002)(2201001)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1524;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rb8wDtXCh2Jrsq9pValUEvhwRJ6vKTZAA0WdvrOIOYvnDen5hjmOo6Z4cYu+W9jkVoK+kDKUnZRdLY56AImZ+p3S6NbcKaRvRV9g36rbhceD68xJ1gFf4H736ldVWbmibfjWpPzbutcgBZBvJAB7MCAj1Yp8ekKcNk8bZ+YrudBu4rJ2TSTKSFhZfpMu4xE/bYEv6r1PMpOn0OYi0hHEZOu8AAPYLixpskgV1dZd/uP/vqJ/PyBN5Sz32S3pSzTMIgPnIO0nXLbFW3L/fG7e7GjONYisk28374XyeFOWazaPw16byusn/XO0AfEPTng+qo/5mc11B9gW9zdRv+0UKsrWmCOpNhudUqalTExelmruaV/9sGKLiJgBHXNN3gFJTCVrJguu9KsjXcV8IhPNFXA6MdSwmPLlWPcyqd3d1d0=
Content-ID: <4C72520FA053004BB3A0D863783982FD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b5225e-c7a4-48d0-67fb-08d7489ca479
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:29:50.9101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zLh0l4seoVJYa/ph9DbzEFYe+Q+k95+Kh06KuXQpVQfkVdEjfqxABjzpdUtg7g7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1524
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A15QNR97MmetXU4C2f9OI2Dxse0h2tNQ0iHqEtUsaw0=;
 b=cZHnZiqf73wzHX674u79t6iWOw9m6vq5fv5zNtdPAWgwt3SYpKhkkRCM8cX66rvNK7q9wJMOruFDZJtGl08NLvwufK/jmHOmrwjDToKVVL8mu4uulLqBIDwyQJK+YHfZ5HH/6XE+Qoj8jiw6bhu3+2sXSY9uhJ3BknssaSzrZks=
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMTAuMTkgdW0gMjM6NDAgc2NocmllYiBDb2xpbiBLaW5nOg0KPiBGcm9tOiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPg0KPiBUaGVyZSBpcyBhIHJldHVy
biBzdGF0ZW1lbnQgdGhhdCBpcyBub3QgcmVhY2hhYmxlIGFuZCBhIHZhcmlhYmxlIHRoYXQNCj4g
aXMgbm90IHVzZWQuICBSZW1vdmUgdGhlbS4NCj4NCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlN0
cnVjdHVyYWxseSBkZWFkIGNvZGUiKQ0KPiBGaXhlczogZGU3YjQ1YmFiZDliICgiZHJtL2FtZGdw
dTogY2xlYW51cCBjcmVhdGluZyBCT3MgYXQgZml4ZWQgbG9jYXRpb24gKHYyKSIpDQo+IFNpZ25l
ZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQoNClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMiAt
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IGluZGV4IDQ4MWU0YzM4MTA4My4uODE0MTU5ZjE1
NjMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IEBA
IC0xNjM2LDcgKzE2MzYsNiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdHRtX2Z3X3Jlc2VydmVfdnJh
bV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIHN0YXRpYyBpbnQgYW1kZ3B1
X3R0bV9md19yZXNlcnZlX3ZyYW1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4g
ICB7DQo+ICAgCXVpbnQ2NF90IHZyYW1fc2l6ZSA9IGFkZXYtPmdtYy52aXNpYmxlX3ZyYW1fc2l6
ZTsNCj4gLQlpbnQgcjsNCj4gICANCj4gICAJYWRldi0+ZndfdnJhbV91c2FnZS52YSA9IE5VTEw7
DQo+ICAgCWFkZXYtPmZ3X3ZyYW1fdXNhZ2UucmVzZXJ2ZWRfYm8gPSBOVUxMOw0KPiBAQCAtMTY1
MSw3ICsxNjUwLDYgQEAgc3RhdGljIGludCBhbWRncHVfdHRtX2Z3X3Jlc2VydmVfdnJhbV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAkJCQkJICBBTURHUFVfR0VNX0RPTUFJ
Tl9WUkFNLA0KPiAgIAkJCQkJICAmYWRldi0+ZndfdnJhbV91c2FnZS5yZXNlcnZlZF9ibywNCj4g
ICAJCQkJCSAgJmFkZXYtPmZ3X3ZyYW1fdXNhZ2UudmEpOw0KPiAtCXJldHVybiByOw0KPiAgIH0N
Cj4gICANCj4gICAvKioNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
