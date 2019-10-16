Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DFAD85BB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 04:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ED86E3EE;
	Wed, 16 Oct 2019 02:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690069.outbound.protection.outlook.com [40.107.69.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93AA6E3EE;
 Wed, 16 Oct 2019 02:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/tIarZe4iW5tw2pyjp8wwqMaRfjl3Vv9itMDOStDn1JRtqRFsOHcdnguJ9YNVbgcFvzM9Ix3PzFlrtyn29CcSO5xBK0SggNCakHH8vtq6FYhcgFxM4nUF91FERyTVVC4ifmYvde8CIkgjrazDT4GpwkZBhxAJQ+XfdPjagHDjyZyXivtq0ZyaYHij/mZm7wkASRAqrE8Zv/X8r2C31tMxvIOHa1Yn2tVorvQ6R2cFv5Y1lHyVynGtwNpTHtP03oTF2GYaLyeianTTdKLsa1iwS8qQKXFrpECJuw2hfLbBAtqbKTc3g728TNPKg2GeWd3xt9I1+PkeuHzC/17XpzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Clb5JF38O4Mh0pVZ4ZarlU8ZzV2rSW5bgimxbMYagIc=;
 b=QP/6iC5JoDDGWaS8c4BDosJ0F/ncd3GxQSgPCyz+fSjZBb6B6C2SCBVVi9qLQ1NI3ywLlSpPssKKIxIjvNWq5ih/H5FfGQQz1jrhDJANkwsSMEoKc0Ncv6kA4D2wKv8AuuRQNtPnhrS/GGdSeFdKlEybryMP1k0+oZScj+ZrL5zFqt08SmnyIqoYoBQUHLOLsBiy6CJJblqmHyJ6AiebLsSt4zaBv08KmzaGBdLxUJJ7T+lXB3bgItGcVudKavDgxhGg8py5oxYTosTxyyrAXtqqXgDXsqyqo/2s6i1fvV/q1ZYQ7cF7gn1w68EEoQN+ck0TYSviNv9f2sKDcajbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3072.namprd12.prod.outlook.com (20.178.241.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 02:09:46 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3%5]) with mapi id 15.20.2347.021; Wed, 16 Oct 2019
 02:09:46 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/display: fix build error casused by
 CONFIG_DRM_AMD_DC_DCN2_1
Thread-Topic: [PATCH] drm/amdgpu/display: fix build error casused by
 CONFIG_DRM_AMD_DC_DCN2_1
Thread-Index: AQHVg3jKI+w30Gjdmki7O6NcTOrmLqdchA6w
Date: Wed, 16 Oct 2019 02:09:45 +0000
Message-ID: <MN2PR12MB35363383B88BD0927B087642FB920@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20191015165117.31195-1-hersenxs.wu@amd.com>
In-Reply-To: <20191015165117.31195-1-hersenxs.wu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ced6d7e-8976-4350-3e21-08d751ddea84
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3072:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3072421D6F064AB43A5C3BEDFB920@MN2PR12MB3072.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(189003)(199004)(13464003)(9686003)(99286004)(6306002)(26005)(7736002)(450100002)(54906003)(33656002)(25786009)(8936002)(7696005)(6506007)(53546011)(229853002)(76176011)(2501003)(2906002)(55016002)(186003)(71190400001)(446003)(6436002)(102836004)(4326008)(81156014)(256004)(11346002)(14444005)(8676002)(86362001)(478600001)(71200400001)(52536014)(110136005)(74316002)(66556008)(66066001)(66446008)(966005)(6246003)(76116006)(316002)(66476007)(6116002)(66946007)(5660300002)(14454004)(486006)(2201001)(3846002)(476003)(305945005)(64756008)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3072;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDHQUi1GLSbfAU+vXNCW5v2Bv4paSJ6wJcC0HS5XU0uT6GxDHAyRbNYIzleW7KzThV0YxuNGs4nXvqBu5MMCaBzbZ50ZZaNi0QieV+YBix3Ug10Pked78R2SfxCbvhQw5Wo1H6zkZ40HbZGO4dYdBdcOQxwxfB3K08n6JTXhCUflQcL2sP6OalF0yLYjIWjMHTARFrVbhIIBYD0PLnXg6QHFUkZJiIF9wFJ5M8j2wwDGNvbkuiCRF1qEcHV0/7D0s9ihE4rMFzagdcg8l6Vm54i9QrqtS3WggffLtrdS7bf7G6X3hd7BQ0WsHkabPpB2JtdxTxHsWWYeX7YNIAPyYQP4D+jlTO8KVOAgu4M/vGOwCiED4k8sUwugaGE5fjLXJdyW07gKLB+qiSCDcxXo9Sp2ZW9+vTKYXLdnZDdS79MpaZvVAPx9XDcyir6sgDq5D8fHxI5oOJYOZQXNLQ/PwA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ced6d7e-8976-4350-3e21-08d751ddea84
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 02:09:45.9282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Z/kj1/USxw7pGS2+FE3iZt1/8HHZyoEICv17/XnXIlNlSUIhBDORoizX/wDU2gx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Clb5JF38O4Mh0pVZ4ZarlU8ZzV2rSW5bgimxbMYagIc=;
 b=bp0G0MM6qYkPakzwFcrh61IydJbe2BQCY4wqzuH+phVsVYS9+qvNujsfBR6plOcYE1HJB5C2rvaA+Z02nyksAxgCQLtFBVQInjo/u9rt7X7SSIa69pkI2GxKtD+2DbbgHwL6AKuANRI+olDaYgKmb8slYqMlFokI5K1e7ItDp8s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Wu, 
 Hersen" <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KDQpCVFcsIHdv
dWxkIHlvdSBoZWxwIGNsYXJpZnkgd2h5IFBQX1NNVV9OVU1fRENGQ0xLX0RQTV9MRVZFTFMgaXMg
ZGlmZmVyZW50IGZyb20gdGhlIHNtdTEyX2RyaXZlcl9pZi5oIGRlZmluZSANCk5VTV9EQ0ZDTEtf
RFBNX0xFVkVMUyBpbiB5b3Ugb3RoZXIgcGF0Y2ggYWJvdXQgZHJtL2FtZGdwdS9wb3dlcnBsYXk6
IGFkZCByZW5vaXIgZnVuY3MgdG8gc3VwcG9ydCBkYy4NCg0KSXMgdGhlcmUgY2FuIHRyYWNrIHRo
ZSBtYWNybyBkZWZpbml0aW9uIHVwZGF0ZSA/DQoNClRoYW5rcywNClByaWtlDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0
cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBIZXJzZW4gV3UNCj4gU2VudDogV2Vk
bmVzZGF5LCBPY3RvYmVyIDE2LCAyMDE5IDEyOjUxIEFNDQo+IFRvOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTGks
IFN1biBwZW5nIChMZW8pIDxTdW5wZW5nLkxpQGFtZC5jb20+OyBMYWtoYSwgQmhhd2FucHJlZXQN
Cj4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+OyBXZW50bGFuZCwgSGFycnkNCj4gPEhhcnJ5
LldlbnRsYW5kQGFtZC5jb20+OyBXdSwgSGVyc2VuIDxoZXJzZW54cy53dUBhbWQuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvZGlzcGxheTogZml4IGJ1aWxkIGVycm9yIGNhc3Vz
ZWQgYnkNCj4gQ09ORklHX0RSTV9BTURfRENfRENOMl8xDQo+IA0KPiB3aGVuIENPTkZJR19EUk1f
QU1EX0RDX0RDTjJfMSBpcyBub3QgZW5hYmxlIGluIC5jb25maWcsIHRoZXJlIGlzIGJ1aWxkDQo+
IGVycm9yLiBzdHJ1Y3QgZHBtX2Nsb2NrcyBzaG91ZCBub3QgYmUgZ3VhcmRlZC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEhlcnNlbiBXdSA8aGVyc2VueHMud3VAYW1kLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1fcHBfc211LmggfCAzIC0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oDQo+IGluZGV4IDI0ZDY1ZGJiZDc0OS4uZWY3ZGY5ZWY2
ZDdlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1fcHBf
c211LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5o
DQo+IEBAIC0yNDksOCArMjQ5LDYgQEAgc3RydWN0IHBwX3NtdV9mdW5jc19udiB7ICB9OyAgI2Vu
ZGlmDQo+IA0KPiAtI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8xKQ0KPiAtDQo+
ICAjZGVmaW5lIFBQX1NNVV9OVU1fU09DQ0xLX0RQTV9MRVZFTFMgIDggICNkZWZpbmUNCj4gUFBf
U01VX05VTV9EQ0ZDTEtfRFBNX0xFVkVMUyAgOA0KPiAgI2RlZmluZSBQUF9TTVVfTlVNX0ZDTEtf
RFBNX0xFVkVMUyAgICA0DQo+IEBAIC0yODgsNyArMjg2LDYgQEAgc3RydWN0IHBwX3NtdV9mdW5j
c19ybiB7DQo+ICAJZW51bSBwcF9zbXVfc3RhdHVzICgqZ2V0X2RwbV9jbG9ja190YWJsZSkgKHN0
cnVjdCBwcF9zbXUgKnBwLA0KPiAgCQkJc3RydWN0IGRwbV9jbG9ja3MgKmNsb2NrX3RhYmxlKTsN
Cj4gIH07DQo+IC0jZW5kaWYNCj4gDQo+ICBzdHJ1Y3QgcHBfc211X2Z1bmNzIHsNCj4gIAlzdHJ1
Y3QgcHBfc211IGN0eDsNCj4gLS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
