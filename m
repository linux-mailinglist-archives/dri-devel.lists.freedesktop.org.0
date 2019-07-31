Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4046B7CE9B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 22:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C02E6E2EF;
	Wed, 31 Jul 2019 20:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800048.outbound.protection.outlook.com [40.107.80.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643D6E2EF;
 Wed, 31 Jul 2019 20:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYVDriMlQCcaJHaKIBbA4x0bYhK6hKv1ZOPO+UMLO9165mk81JYSzGC9WPPo1Afh565uig0HClU+Rh/aPSXT7A6hHpwOpbRxolEB9RNB+Wjy437ECFVlyqWSxo2tLXR8ts1vwLcTHQx8a2AgYXQvBgcUolA1Tv4t2J/FIlRq9QbILXszdjxlbZ5rMVT3NUsuffEH7JqOgwiLBhYRbPkelLcKQ0b7eEOnAfpb1O4QcyCTIsQcyBQgxD9SSYvUn0ikqkoxq4s6HC4hMF3a8HCN503u/wa+QXr+L2rSj2bdjSM+h6BcDpU2uXUjm4MHwHPH8FepCcotKBa1S4YGyuSxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlFT+6hPeyarrFN6kJCyav24u1shSkUoBkbKmeyh3Hs=;
 b=Iq6/AiaIE11trI5xNK4s1fNzOWQ2Z5KoJtEgDPC1rWSpi3+xf/tGiu6AFpKqfFGikgP1NyH24o95Lh3LnKqEvGAKBehbq0kij96IT0mem5Vpx3hCrrTtgIzqMNqvh7iCdKMYLvY8knD6TPgNWFyp0g+66oqE4D6nEhB7Buer6gpavNDRUkmjHYHgiQbvursgo9yoytyUzer0xU/FNBt/1JZUj5Z/pUx94rzEYYI/7B2kEfg8KbsF97adQ5F+8QfVWqRCBkL1+KFy15JpI6hGYzX9hfpryhV+MPbRYpANBUBVWtz5ahZpubMUF9vLcwaPxHoGzPxg+SWJTcoSH3UTwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3836.namprd12.prod.outlook.com (10.255.173.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 20:31:39 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 20:31:39 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/amdgpu: drop drmP.h in amdgpu_amdkfd_arcturus.c
Thread-Topic: [PATCH 1/8] drm/amdgpu: drop drmP.h in amdgpu_amdkfd_arcturus.c
Thread-Index: AQHVR7gG+R4NdEL1+ESqODzdsOIJXqblLngA
Date: Wed, 31 Jul 2019 20:31:39 +0000
Message-ID: <83b4e62a-ebcf-5e3d-c963-e1817ee7178c@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa3dc4e2-2cfd-44d4-cfee-08d715f61738
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3836; 
x-ms-traffictypediagnostic: DM6PR12MB3836:
x-microsoft-antispam-prvs: <DM6PR12MB3836466EA997CFCDEE7D358B92DF0@DM6PR12MB3836.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:363;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(478600001)(2906002)(66946007)(36756003)(6436002)(11346002)(446003)(81156014)(6506007)(476003)(486006)(71200400001)(31686004)(64756008)(76176011)(53546011)(386003)(71190400001)(102836004)(81166006)(8936002)(2616005)(7736002)(6246003)(186003)(8676002)(6512007)(2201001)(316002)(14444005)(68736007)(65826007)(256004)(65806001)(53936002)(229853002)(5660300002)(25786009)(2501003)(66446008)(6116002)(3846002)(52116002)(305945005)(65956001)(66066001)(4744005)(31696002)(86362001)(64126003)(6486002)(110136005)(14454004)(66556008)(58126008)(66476007)(99286004)(4326008)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3836;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i2cI01DBNGXOl5Qi8VEnZb6CCyPcAg7fwQ70FrnfctZK9X6OIBbQp4O48BpgwEz6olI0kN4gEPYC2bErklo5gpiJ4L88nzAIqywpcXxNtW6YErNFojCjqR5v8JLYZGHMZ1ydW77ZROpMYzqiMVxzrx8dKWyqcLZbIUuzP1t8QKhToQK91JHFfPRlRwNrg5Bzytgb2UbCMxtUAI5fILc1FoS0vTsa1ECWXLr7urOmdtCItFyso0PqKAKcqqKT2gi1lYcEh3K1Fv5EQrHP1299bOdREw+DLuYR6B5DcrDiKEG5L5ZMxEYWU+szjT9ivzfPPM1SnTK0XgSx8ClZ19KMKdPeALH+y0JAlOuKGR/yWVg2w3jwdC/Y7XArkXvPdNRM9azd9/CdFgCK8lGurKQqUmJYSyWMie3gRmHjkW0OMhA=
Content-ID: <357314E85F7A4E47A0A52BC8D99FADD7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3dc4e2-2cfd-44d4-cfee-08d715f61738
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 20:31:39.3680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3836
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlFT+6hPeyarrFN6kJCyav24u1shSkUoBkbKmeyh3Hs=;
 b=sxjd/B2IPU7mGl88DiGf1Tu0eY+KwUxxLwbFIhRG17suS+x9l108LGWCKNUv0jIj9UzksoUcAs7F37Hi/6ynpJahhmrLthXhXsCmPbe0RjIhK1WMEkqWos5AWqyfQNnRUiBQguNWqvGMbOOKwKjsZv+GCIIvsCVal554E0sVpbQ=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0zMSAxMTo1MiBhLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFVudXNlZC4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPg0KVGhlIHNlcmllcyBpcw0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMgfCAxIC0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9hcmN0dXJ1cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9hcmN0dXJ1cy5jDQo+IGluZGV4IDRkOTEwMTgzNGJhNy4uYzc5YWFlYmVl
YWYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2FyY3R1cnVzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9hcmN0dXJ1cy5jDQo+IEBAIC0yOCw3ICsyOCw2IEBADQo+ICAgI2luY2x1ZGUgPGxp
bnV4L3VhY2Nlc3MuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbW11X2NvbnRleHQuaD4NCj4gICAj
aW5jbHVkZSA8bGludXgvZmlybXdhcmUuaD4NCj4gLSNpbmNsdWRlIDxkcm0vZHJtUC5oPg0KPiAg
ICNpbmNsdWRlICJhbWRncHUuaCINCj4gICAjaW5jbHVkZSAiYW1kZ3B1X2FtZGtmZC5oIg0KPiAg
ICNpbmNsdWRlICJzZG1hMC9zZG1hMF80XzJfMl9vZmZzZXQuaCINCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
