Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97D75363
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 18:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C796E780;
	Thu, 25 Jul 2019 16:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07F86E780;
 Thu, 25 Jul 2019 16:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPAPTLW3KsxCML8bJ/61+NI4uSolhxSEwoTb/+GQUZSicHBUcGia1DFGDGN4O9HZVmLBDI9ebhD5ASGs4aPzscbxSGjLF/ZNGi6HqBvjLVCRXQXjpGvFfr3hCBOYe3M40Cv86qCcdWvFEicSrCNNErvqmcvG0fz3e2XqV+RtSMYDzf2owma3K0LvFWNMD0FQwPUqTrap8J0QzgHAw3NeisKddC90sLCh02sh8Dmgn2Uf+s/h3YK2MXKY5BMzcYRv1QCT7CVCk+Rb9HyDtWYu9+643sJ6etNNBElGM7coJci47C9b5Lb2MPjRCvJI8nybEbQPD9aJpKklOFj5eeJ6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRUWLM56PlUrnuq+fb7CL2nxlt0rTOFxee7IjUxeNb8=;
 b=hgmB+K+lDG3v1QW3fE87b9pFsLHRHksBA+Ia6coG8TarsSCxdhTnRFdQQUfxwLhwDeuiQBehyyEybJfqawwqzaUWte4HZ5L7/5ylegRGlnSMj5nXu1YHA6W+45l1NDPVAJbTWoA0VQSlm+t6GF6Dl9JeFzjL1AeISIJhUBy2jJecR8oClf+ocE/LpAPs6wYowFSukjK2qq2qi4dSKpsTtkqXuGi1fetH+YEnyQ9IEYiiuCviDIRWF1xE09qpjLov2/Ta2bSs9IIrzPDq6+4lfQUe+RYnraeEHw1n2wS6tX6//LQ+iIG6kYcuI0xTfUbOS76oahUHv53A4And6Z9/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB2790.namprd12.prod.outlook.com (20.177.126.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 16:00:10 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9%6]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 16:00:10 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, Rex Zhu <rex.zhu@amd.com>, "Quan, 
 Evan" <Evan.Quan@amd.com>
Subject: Re: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Thread-Topic: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Thread-Index: AQHVMiy9/HNyhezL/UaoUkOqlvXBhabRXHKAgApDQ4A=
Date: Thu, 25 Jul 2019 16:00:10 +0000
Message-ID: <5f0e8332-50ae-cc9c-1a12-5a097c51297d@amd.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-6-natechancellor@gmail.com>
 <20190719031647.GA84028@archlinux-threadripper>
In-Reply-To: <20190719031647.GA84028@archlinux-threadripper>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 784c5283-70bb-4892-f97b-08d711192be3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2790; 
x-ms-traffictypediagnostic: BYAPR12MB2790:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB279071942B712369CC870DA682C10@BYAPR12MB2790.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(189003)(199004)(25786009)(6246003)(6512007)(2906002)(316002)(36756003)(6306002)(53936002)(71190400001)(52116002)(71200400001)(229853002)(4326008)(6486002)(31686004)(66946007)(66476007)(66556008)(64756008)(66446008)(6636002)(81156014)(81166006)(305945005)(6116002)(8676002)(76176011)(66066001)(7736002)(31696002)(53546011)(102836004)(8936002)(3846002)(99286004)(86362001)(6506007)(386003)(14444005)(68736007)(478600001)(54906003)(476003)(486006)(11346002)(446003)(5660300002)(14454004)(6436002)(966005)(186003)(110136005)(26005)(256004)(2616005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2790;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yRYj4CcKsZufXiKSZHSAI9XpmE+MXkJiVNm9eR1ySmR7zZQB8ObG1gRLtnBq9w9Zkt2PJcm6qH/ESue6sSkUr964Wj739yfP26CgxOsfsdTLuq6tWNuLq8BZkyga283E4fA2OQnC2/cyEwl6f0R5To+2G2kRbqwvbu3aqIOBL88giYB2npilHgSJH/F9zZ6+eM73rwjtbzSeOfZACfDjCB5B9XunGIvo77ykkmrZZl1t6MMkzWeEVOytgNNaQNKODqF4hKg9+x/vliyjetghlnn2F8PsefR0SkNsuFJTr0pXs002gNX8Pj5lX8n1XpjVplh+wXtYiU+3yrbQzLqTkcJN7JtF0rAWg1pK6EgA8AxO3Rod2s3Z3lXoDhYl5DKjmL9p6yzSI1myNEZ2u20mDd6bZ1pTzDp8tqZaaHELGSk=
Content-ID: <3C344A9FB9ABC84D8EE0493DC20FF21F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784c5283-70bb-4892-f97b-08d711192be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 16:00:10.7158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2790
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRUWLM56PlUrnuq+fb7CL2nxlt0rTOFxee7IjUxeNb8=;
 b=Q4wed7ljdc6VBGfe134bdgbvreLG4z0znox3JtFNbjw7xccg2GmHKCohTZN9J4YfJ1UgOIosW9hWPjwI2SRX5TA23ujZIZ6XPWbmJwfijHSxABK+e1kAOjWY7oOdyHyZt5yAazVeLLOQgJwDJh4+xwfJ01PFf8pNbOHeQG6Sko4=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDctMTggMTE6MTYgcC5tLiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6DQo+
IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDEwOjUyOjE2UE0gLTA3MDAsIE5hdGhhbiBDaGFuY2Vs
bG9yIHdyb3RlOg0KPj4gY2xhbmcgd2FybnM6DQo+Pg0KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjMzNjo4Og0KPj4g
d2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5cGUgJ2VudW0g
c211X2Nsa190eXBlJw0KPj4gdG8gZGlmZmVyZW50IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0gYW1k
X3BwX2Nsb2NrX3R5cGUnDQo+PiBbLVdlbnVtLWNvbnZlcnNpb25dDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGNfdG9fc211X2Nsb2NrX3R5cGUoY2xrX3R5cGUp
LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYzo0MjE6MTQ6DQo+PiB3YXJuaW5nOiBp
bXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnZW51bQ0KPj4gYW1kX3Bw
X2Nsb2NrX3R5cGUnIHRvIGRpZmZlcmVudCBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtf
dHlwZScNCj4+IFstV2VudW0tY29udmVyc2lvbl0NCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkY190b19wcF9jbG9ja190eXBlKGNsa190eXBlKSwNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4NCj4+DQo+PiBUaGVyZSBhcmUgZnVuY3Rpb25zIHRvIHByb3Blcmx5IGNvbnZlcnQg
YmV0d2VlbiBhbGwgb2YgdGhlc2UgdHlwZXMsIHVzZQ0KPj4gdGhlbSBzbyB0aGVyZSBhcmUgbm8g
bG9uZ2VyIGFueSB3YXJuaW5ncy4NCj4+DQo+PiBGaXhlczogYTQzOTEzZWE1MGE1ICgiZHJtL2Ft
ZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBnZXRfY2xvY2tfYnlfdHlwZV93aXRoX2xhdGVuY3kg
Zm9yIG5hdmkxMCIpDQo+PiBGaXhlczogZTVlNGUyMjM5MWMyICgiZHJtL2FtZC9wb3dlcnBsYXk6
IGFkZCBpbnRlcmZhY2UgdG8gZ2V0IGNsb2NrIGJ5IHR5cGUgd2l0aCBsYXRlbmN5IGZvciBkaXNw
bGF5ICh2MikiKQ0KPj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9s
aW51eC9pc3N1ZXMvNTg2DQo+PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
ZWNoYW5jZWxsb3JAZ21haWwuY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgfCA0ICsrLS0NCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9z
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3Bw
X3NtdS5jDQo+PiBpbmRleCBlYWMwOWJmZTNiZTIuLjBmNzZjZmZmOWQ5YiAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3Nt
dS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9wcF9zbXUuYw0KPj4gQEAgLTMzMyw3ICszMzMsNyBAQCBib29sIGRtX3BwX2dldF9jbG9j
a19sZXZlbHNfYnlfdHlwZSgNCj4+ICAJCX0NCj4+ICAJfSBlbHNlIGlmIChhZGV2LT5zbXUuZnVu
Y3MgJiYgYWRldi0+c211LmZ1bmNzLT5nZXRfY2xvY2tfYnlfdHlwZSkgew0KPj4gIAkJaWYgKHNt
dV9nZXRfY2xvY2tfYnlfdHlwZSgmYWRldi0+c211LA0KPj4gLQkJCQkJICBkY190b19zbXVfY2xv
Y2tfdHlwZShjbGtfdHlwZSksDQo+PiArCQkJCQkgIGRjX3RvX3BwX2Nsb2NrX3R5cGUoY2xrX3R5
cGUpLA0KDQpzbXVfZnVuY3MtPmdldF9jbG9ja19ieV90eXBlIGRvZXNuJ3Qgc2VlbSB0byBiZSBo
b29rZWQgdXAgYW55d2hlcmUsDQpzbyB0aGlzIGxvb2tzIHRvIGJlIHRoZSBtb3N0IGNvcnJlY3Qu
DQoNCkFsdGhvdWdoIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gdXNlIHNtdV9jbGtfdHlwZXMgaGVy
ZSByYXRoZXIgdGhhbg0KYW1kX3BwX2Nsb2NrX3R5cGUgLSBhbnkgcmVhc29uIHdoeSB0aGlzIGlz
bid0IHRoZSBjYXNlPw0KDQo+PiAgCQkJCQkgICZwcF9jbGtzKSkgew0KPj4gIAkJCWdldF9kZWZh
dWx0X2Nsb2NrX2xldmVscyhjbGtfdHlwZSwgZGNfY2xrcyk7DQo+PiAgCQkJcmV0dXJuIHRydWU7
DQo+PiBAQCAtNDE4LDcgKzQxOCw3IEBAIGJvb2wgZG1fcHBfZ2V0X2Nsb2NrX2xldmVsc19ieV90
eXBlX3dpdGhfbGF0ZW5jeSgNCj4+ICAJCQlyZXR1cm4gZmFsc2U7DQo+PiAgCX0gZWxzZSBpZiAo
YWRldi0+c211LnBwdF9mdW5jcyAmJiBhZGV2LT5zbXUucHB0X2Z1bmNzLT5nZXRfY2xvY2tfYnlf
dHlwZV93aXRoX2xhdGVuY3kpIHsNCj4+ICAJCWlmIChzbXVfZ2V0X2Nsb2NrX2J5X3R5cGVfd2l0
aF9sYXRlbmN5KCZhZGV2LT5zbXUsDQo+PiAtCQkJCQkJICAgICAgIGRjX3RvX3BwX2Nsb2NrX3R5
cGUoY2xrX3R5cGUpLA0KPj4gKwkJCQkJCSAgICAgICBkY190b19zbXVfY2xvY2tfdHlwZShjbGtf
dHlwZSksDQoNClRoaXMgaXMgc2xpZ2h0bHkgY29uY2VybmluZy4gVGhlIGZ1bmN0aW9ucyBhcmUg
ZG9pbmcgdGhlIHJpZ2h0IHRoaW5nLA0KYnV0IGFtZF9wcF9jbG9ja190eXBlIGRvZXNuJ3QgbWFw
IDEtMSB0byBzbXVfY2xrX3R5cGUuLi4gSW4gYW55IGNhc2UsDQp0aGlzIGxvb2tzIGdvb2QgdG8g
bWUuDQoNClJldmlld2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4NCg0KPj4gIAkJ
CQkJCSAgICAgICAmcHBfY2xrcykpDQo+PiAgCQkJcmV0dXJuIGZhbHNlOw0KPj4gIAl9DQo+PiAt
LSANCj4+IDIuMjIuMA0KPj4NCj4gDQo+IEdlbnRsZSBwaW5nIGZvciByZXZpZXcsIHRoaXMgaXMg
dGhlIGxhc3QgcmVtYWluaW5nIHdhcm5pbmcgdGhhdCBJIHNlZQ0KPiBmcm9tIGFtZGdwdSBvbiBu
ZXh0LTIwMTkwNzE4Lg0KPiANCj4gQ2hlZXJzLA0KPiBOYXRoYW4NCj4gDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
