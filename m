Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252CDB34D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 19:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C8089FC5;
	Thu, 17 Oct 2019 17:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720068.outbound.protection.outlook.com [40.107.72.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E8889FC5;
 Thu, 17 Oct 2019 17:30:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH8+6M+sYbEZ0TUmn+VyuPbuuth70In2K6PKuiXV3Ctq2DVbtCNALHqdX2h+TKhfU1Y68AaBWQA+LF8Jt9tkn7dH06OU1N4AD1iYvvgJwe+V8zZ2A6pp9CjmnidFH6xcaxfMuysw1QNSV1rO+VS+n8JIGMZe0WOQCkvsuEBr7qiBfaccMJCExM94rSco47AdX6GMCZnmWM3CBVUri8D0BcNDKu4qz1VVjViPTesL/YP11btgJTeo7DO+L8zJZodOpqcllBNR1N+0oFaY7gCa2Mr0tdwwDy3jKex7k0D6TYLivSyKJ5Q2WAw4Qdlvjj02pecAULWVh+ZZPtsIuVKuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EJrloD6vPKhlZk1ojtZnL4MZFTip2P9JOkoQPjliYU=;
 b=YntZKG6KWBu+qEudDt2RtG4pSQvFfNbZ6lutdtwDX48RvdHpTCE//Ky1CoFXGL/i5+mIad97hd4uXXg6JwloJhzOeWtdZT9bG37OZGncQF3PYmHGPteZ+QC+8BDYxJZ3XLJCbHHV0lOs0EVzkowg3eb51toIxt1cp5h5tNdiySgAHoyaE1aP+27IfiAWZHKOFv3TyCxQydker7RMmWCXyLbE+6iYf8dHs/VagrFFvKIYHI6ESD5edplNqBdA5mOc4CU5ZA9x+UJroYGg3VGBaI6s7TUc97nj0EI2l7t+vivjgKfL8gskaiZNqTIQcMvL+wDYs8LDOHwJG9IrDi1QgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2737.namprd12.prod.outlook.com (20.176.178.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 17:30:28 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66%7]) with mapi id 15.20.2347.024; Thu, 17 Oct 2019
 17:30:28 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: Chen Wandun <chenwandun@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu/display: fix compile error
Thread-Topic: [PATCH] drm/amdgpu/display: fix compile error
Thread-Index: AQHVhLH9di/Fe7Wqu0O6Jc++P2KAEqdfF7wA
Date: Thu, 17 Oct 2019 17:30:28 +0000
Message-ID: <8a7cb551-5f1c-c37d-97a6-53c62ebee7ee@amd.com>
References: <1571293172-116998-1-git-send-email-chenwandun@huawei.com>
In-Reply-To: <1571293172-116998-1-git-send-email-chenwandun@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf64009e-62dc-450f-535b-08d75327b401
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN7PR12MB2737:|BN7PR12MB2737:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB2737B89FC29AE3BF5776CC21826D0@BN7PR12MB2737.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(199004)(189003)(7736002)(53546011)(26005)(305945005)(102836004)(4001150100001)(2906002)(86362001)(14454004)(2501003)(6116002)(3846002)(186003)(2201001)(81156014)(81166006)(25786009)(71190400001)(8676002)(110136005)(316002)(8936002)(486006)(256004)(2616005)(476003)(11346002)(31696002)(446003)(71200400001)(478600001)(31686004)(6506007)(66946007)(6306002)(66556008)(64756008)(6246003)(66446008)(229853002)(36756003)(6512007)(6486002)(66476007)(52116002)(966005)(76176011)(5660300002)(99286004)(6436002)(66066001)(386003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2737;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 81V/ELmK3uLJOvWIwuTQMvrCaPbspmG46EC5deatQa2N1YsNE9O3PS4CVtqwRZ42508fzLsozJSbPPFYD3liGue2iTF6T+ySHBR1gvI35XauVSQlrIupgHCKtk+w88yoFc1Ps4RBOau4yRcghwcAFb1qdbo0HzO1G9BrKP+9SduuOtrcPErSD0EzzuINEDFf/uwF15/mPJvLepqgZvukF6OpWsPOv/pLvcafwG1GRdvgPnE9WMD2UF2llIR9sFfemQwGxZSr5rMN5dOuyfpFZT9vhR0X/o0A7l9W1SrjueOX5+59CK2P0v/5KkOt7WOCXHuoNCAXjDTlIwQteOPp8fWtGPlrh6eHxes/xI1dxoOeb39dBCFYzwZLEgDEOaARVg439X8NKjtuixFgdHXTafe48j+Sv0UU6Dg5bdzPwnpHVTYqtTSYELMEccKIrke/waJ5svRQxe1ikUmmDCgDhA==
Content-ID: <EF17B48017FF9A42BFB774A7DBDEFA28@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf64009e-62dc-450f-535b-08d75327b401
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 17:30:28.7309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Qvfk8TAnqR7WqMuDVyv39uacfNE7h1qgojNuWY5wjEnrZdqClxfeIwV6mO1OeDH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2737
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EJrloD6vPKhlZk1ojtZnL4MZFTip2P9JOkoQPjliYU=;
 b=IRf4ihOHy5Mrh0ld9mBodVBkMjqoCt97mNz4olXH/NZsas2CnYGeebwQGoIyRxUd5q0+j3BxHe+cLEmuaPtK7Vg9f6xBxhoOm8cnoluqeDEEFwuvsPiglvOJX5VS9ubtokV/vgXv2lz/SkP2solONJWnqUzbxZ6YiO5YtOmoqRA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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

VGhpcyBoYXMgYWxyZWFkeSBiZWVuIGZpeGVkIGhlcmU6DQpodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvMzM2MTk1Lw0KDQpTaG91bGQgYmUgbWlycm9yZWQgb24gQWxleCdz
IHRyZWUgc29vbi4NCg0KVGhhbmtzLA0KTGVvDQoNCk9uIDIwMTktMTAtMTcgMjoxOSBhLm0uLCBD
aGVuIFdhbmR1biB3cm90ZToNCj4gRnJvbTogQ2hlbndhbmR1biA8Y2hlbndhbmR1bkBodWF3ZWku
Y29tPg0KPiANCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jOjE5MTM6NDg6IGVycm9yOiBzdHJ1Y3QgZGNfY3J0Y190aW1pbmdf
ZmxhZ3MgaGFzIG5vIG1lbWJlciBuYW1lZCBEU0MNCj4gICAgaWYgKHJlc19jdHgtPnBpcGVfY3R4
W2ldLnN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQykNCj4gCQkJCQkJXg0KPiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmM6MTkxNDo3
MzogZXJyb3I6IHN0cnVjdCBkY19jcnRjX3RpbWluZyBoYXMgbm8gbWVtYmVyIG5hbWVkIGRzY19j
ZmcNCj4gICAgcGlwZXNbcGlwZV9jbnRdLmRvdXQub3V0cHV0X2JwcCA9IHJlc19jdHgtPnBpcGVf
Y3R4W2ldLnN0cmVhbS0+dGltaW5nLmRzY19jZmcuYml0c19wZXJfcGl4ZWwgLyAxNi4wOw0KPiAJ
CQkJCQkJCQleDQo+IFNpZ25lZC1vZmYtYnk6IENoZW53YW5kdW4gPGNoZW53YW5kdW5AaHVhd2Vp
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfcmVzb3VyY2UuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jDQo+IGluZGV4IDkxNGUzNzguLjRmMDMzMTggMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5jDQo+IEBAIC0xOTEwLDggKzE5MTAsMTAgQEAgaW50IGRjbjIwX3BvcHVsYXRlX2RtbF9waXBl
c19mcm9tX2NvbnRleHQoDQo+ICAJCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBwID0g
b3V0cHV0X2JwYyAqIDM7DQo+ICAJCX0NCj4gIA0KPiArI2lmZGVmIENPTkZJR19EUk1fQU1EX0RD
X0RTQ19TVVBQT1JUDQo+ICAJCWlmIChyZXNfY3R4LT5waXBlX2N0eFtpXS5zdHJlYW0tPnRpbWlu
Zy5mbGFncy5EU0MpDQo+ICAJCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBwID0gcmVz
X2N0eC0+cGlwZV9jdHhbaV0uc3RyZWFtLT50aW1pbmcuZHNjX2NmZy5iaXRzX3Blcl9waXhlbCAv
IDE2LjA7DQo+ICsjZW5kaWYNCj4gIA0KPiAgCQkvKiB0b2RvOiBkZWZhdWx0IG1heCBmb3Igbm93
LCB1bnRpbCB0aGVyZSBpcyBsb2dpYyByZWZsZWN0aW5nIHRoaXMgaW4gZGMqLw0KPiAgCQlwaXBl
c1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBjID0gMTI7DQo+IA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
