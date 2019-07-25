Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53340755AA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 19:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF76E7FA;
	Thu, 25 Jul 2019 17:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96FD6E7F5;
 Thu, 25 Jul 2019 17:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cShchDhRDEdYN8TbJNLbMbxV8/XBcqWWXd3JLSGmOUMC6kIAJhRDJpCCayIgNUgNtGPVwoBsxw9NQhPfFzajS/mRIo0oYRbU9Aia9137sIZb4vhbmh8zE1md879TprPdx5L9doEUYR7qpf5sElaGEvQ0Askx3BP3d5WagLv8IZDtubrDpFq+i7VkSdU/c6Lvq2DqLqz1D+EGjUVPjINfA/goXGqLxCWdJqK7E588D5y0XawC+Z3CF3u5U6OyZEP8HWt08MtpSxTRZaIDc8r+njEXT1HoSnzkaf2NrWwYoJCtT5/4zRfnirVwSeNnKJveU2LOWZg62wNf4XdMhc7KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KabUWb1sUMfXSzsx/9LkWUN1AWQw1TsIY2NdEbB7MWM=;
 b=Juagy0/BRwZ/g/jeP3HGkuxcYZ1tg0ceU64xo1x9oJG15aoF77w9jI3X4eMG3dSV+xQy7AaVvYH9hDXw6hIrn9sInVPyXTnKkmNh+li+BKrbBmVruZoExwvte+jL2bsRRUK9FXLRzYY8vCltyeq2N57WI/Fw4R1JRmD+9n5HDlHSxcdEZUcJn4tqIMOHWgfRR8iL97pNBSjLrodU8bTmj/Q+QEnW5PEyLR/f/xH3aahdwpWWjuZHZANEWaMc3To0YeTiLlkQzW2qHEc5lQ7gvx9Fws+viPxj9YBKRdksoBf2o2X1SYTbJh10UkyYp/SlOTy7OpjWs8U2b3dVCHHTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB2824.namprd12.prod.outlook.com (20.177.229.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 17:26:07 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9%6]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 17:26:07 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, Rex Zhu <rex.zhu@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>
Subject: Re: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Thread-Topic: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Thread-Index: AQHVMiy9/HNyhezL/UaoUkOqlvXBhabRXHKAgApDQ4CAAAP/gIAAE/QA
Date: Thu, 25 Jul 2019 17:26:06 +0000
Message-ID: <45f3c59a-2c8f-6053-ab05-919b73240e8a@amd.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-6-natechancellor@gmail.com>
 <20190719031647.GA84028@archlinux-threadripper>
 <5f0e8332-50ae-cc9c-1a12-5a097c51297d@amd.com>
 <18b343ab-8834-ea86-1bca-974f23b60b16@amd.com>
In-Reply-To: <18b343ab-8834-ea86-1bca-974f23b60b16@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 176f41f1-4166-4717-c689-08d711252d3f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2824; 
x-ms-traffictypediagnostic: BYAPR12MB2824:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR12MB2824E0E7D51F13C73372872A82C10@BYAPR12MB2824.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(52116002)(26005)(14444005)(110136005)(316002)(386003)(81156014)(66446008)(53546011)(71190400001)(6246003)(186003)(6506007)(6116002)(3846002)(81166006)(68736007)(66066001)(7736002)(6436002)(305945005)(66946007)(66476007)(6512007)(4326008)(76176011)(64756008)(256004)(486006)(229853002)(31696002)(8676002)(476003)(86362001)(6486002)(71200400001)(8936002)(66556008)(6306002)(14454004)(54906003)(36756003)(102836004)(966005)(25786009)(478600001)(31686004)(53936002)(99286004)(5660300002)(11346002)(6636002)(446003)(2616005)(2906002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2824;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YGjidXH8REvb2bzPVUH+ObMKcwIeQzB8I+chDGUDSn5jiZpAfu6f3q1NT9whq/1llGM+OAouQa1eVvSovgugQtJOCs9ZEDM1fPmE3MW36dpu7fffRiTeuh+B91JZ/iDt6S3fpIrPfD1GQcqJhTEAWYnWBz+ZX8hoJtqFOiFSKQ2yp4cY82j/0BwSxZ5eYSN6nPkGh+UMHB1KBBJYE07BfkR/ph0wnPyHnxfptgAxk8d135It679bNSDMkWSUKknZQ01mW6kf/SW5WyzsJ7cBmwI3HVexlDbYu3lAHOYs/r/bPaR/ZwUfNB6MkL7gslxu1rVYhL7fgf3qYm9rnM1RdoAFiAm45L+3/0qVIjO/LXDKEaXYQLjVdgGTyQHFHeR0QTwY9oYhaKQYftQkCH2QQATRMy98BjNt/LiOs0+yyNQ=
Content-ID: <66F2D06EE05C034E82822CE3237DBD18@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176f41f1-4166-4717-c689-08d711252d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 17:26:06.9729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KabUWb1sUMfXSzsx/9LkWUN1AWQw1TsIY2NdEbB7MWM=;
 b=gibfNXvUBIcTqQSlH+hjri0Iuf1FX10nYKGHhYigVQ4r0QpyEcAlmvwFZ0KGxbFWsOOFaz5bJ8CKRoFjG6nhDf8QDHJxp5yQzZHcHJDG5jzknFEKLW7jGpII9iOjJtSjMWgJPJBPnrT0/u0A0pi8LG9ZeDQlHZ5A8/JZeX7y1cY=
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDctMjUgMTI6MTQgcC5tLiwgS2F6bGF1c2thcywgTmljaG9sYXMgd3JvdGU6
DQo+IE9uIDcvMjUvMTkgMTI6MDAgUE0sIExpLCBTdW4gcGVuZyAoTGVvKSB3cm90ZToNCj4+DQo+
Pg0KPj4gT24gMjAxOS0wNy0xOCAxMToxNiBwLm0uLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToN
Cj4+PiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAxMDo1MjoxNlBNIC0wNzAwLCBOYXRoYW4gQ2hh
bmNlbGxvciB3cm90ZToNCj4+Pj4gY2xhbmcgd2FybnM6DQo+Pj4+DQo+Pj4+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYzoz
MzY6ODoNCj4+Pj4gd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9u
IHR5cGUgJ2VudW0gc211X2Nsa190eXBlJw0KPj4+PiB0byBkaWZmZXJlbnQgZW51bWVyYXRpb24g
dHlwZSAnZW51bSBhbWRfcHBfY2xvY2tfdHlwZScNCj4+Pj4gWy1XZW51bS1jb252ZXJzaW9uXQ0K
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRjX3RvX3NtdV9j
bG9ja190eXBlKGNsa190eXBlKSwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+Pj4+IGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUu
Yzo0MjE6MTQ6DQo+Pj4+IHdhcm5pbmc6IGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSBlbnVtZXJh
dGlvbiB0eXBlICdlbnVtDQo+Pj4+IGFtZF9wcF9jbG9ja190eXBlJyB0byBkaWZmZXJlbnQgZW51
bWVyYXRpb24gdHlwZSAnZW51bSBzbXVfY2xrX3R5cGUnDQo+Pj4+IFstV2VudW0tY29udmVyc2lv
bl0NCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkY190b19w
cF9jbG9ja190eXBlKGNsa190eXBlKSwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+Pj4NCj4+Pj4g
VGhlcmUgYXJlIGZ1bmN0aW9ucyB0byBwcm9wZXJseSBjb252ZXJ0IGJldHdlZW4gYWxsIG9mIHRo
ZXNlIHR5cGVzLCB1c2UNCj4+Pj4gdGhlbSBzbyB0aGVyZSBhcmUgbm8gbG9uZ2VyIGFueSB3YXJu
aW5ncy4NCj4+Pj4NCj4+Pj4gRml4ZXM6IGE0MzkxM2VhNTBhNSAoImRybS9hbWQvcG93ZXJwbGF5
OiBhZGQgZnVuY3Rpb24gZ2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9sYXRlbmN5IGZvciBuYXZpMTAi
KQ0KPj4+PiBGaXhlczogZTVlNGUyMjM5MWMyICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBpbnRl
cmZhY2UgdG8gZ2V0IGNsb2NrIGJ5IHR5cGUgd2l0aCBsYXRlbmN5IGZvciBkaXNwbGF5ICh2Miki
KQ0KPj4+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lz
c3Vlcy81ODYNCj4+Pj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFu
Y2VsbG9yQGdtYWlsLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgfCA0ICsrLS0NCj4+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fcHBfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9wcF9zbXUuYw0KPj4+PiBpbmRleCBlYWMwOWJmZTNiZTIuLjBmNzZjZmZmOWQ5YiAxMDA2
NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fcHBfc211LmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMNCj4+Pj4gQEAgLTMzMyw3ICszMzMsNyBAQCBib29s
IGRtX3BwX2dldF9jbG9ja19sZXZlbHNfYnlfdHlwZSgNCj4+Pj4gICAJCX0NCj4+Pj4gICAJfSBl
bHNlIGlmIChhZGV2LT5zbXUuZnVuY3MgJiYgYWRldi0+c211LmZ1bmNzLT5nZXRfY2xvY2tfYnlf
dHlwZSkgew0KPj4+PiAgIAkJaWYgKHNtdV9nZXRfY2xvY2tfYnlfdHlwZSgmYWRldi0+c211LA0K
Pj4+PiAtCQkJCQkgIGRjX3RvX3NtdV9jbG9ja190eXBlKGNsa190eXBlKSwNCj4+Pj4gKwkJCQkJ
ICBkY190b19wcF9jbG9ja190eXBlKGNsa190eXBlKSwNCj4+DQo+PiBzbXVfZnVuY3MtPmdldF9j
bG9ja19ieV90eXBlIGRvZXNuJ3Qgc2VlbSB0byBiZSBob29rZWQgdXAgYW55d2hlcmUsDQo+PiBz
byB0aGlzIGxvb2tzIHRvIGJlIHRoZSBtb3N0IGNvcnJlY3QuDQo+Pg0KPj4gQWx0aG91Z2ggaXQg
bWFrZXMgbW9yZSBzZW5zZSB0byB1c2Ugc211X2Nsa190eXBlcyBoZXJlIHJhdGhlciB0aGFuDQo+
PiBhbWRfcHBfY2xvY2tfdHlwZSAtIGFueSByZWFzb24gd2h5IHRoaXMgaXNuJ3QgdGhlIGNhc2U/
DQo+Pg0KPj4+PiAgIAkJCQkJICAmcHBfY2xrcykpIHsNCj4+Pj4gICAJCQlnZXRfZGVmYXVsdF9j
bG9ja19sZXZlbHMoY2xrX3R5cGUsIGRjX2Nsa3MpOw0KPj4+PiAgIAkJCXJldHVybiB0cnVlOw0K
Pj4+PiBAQCAtNDE4LDcgKzQxOCw3IEBAIGJvb2wgZG1fcHBfZ2V0X2Nsb2NrX2xldmVsc19ieV90
eXBlX3dpdGhfbGF0ZW5jeSgNCj4+Pj4gICAJCQlyZXR1cm4gZmFsc2U7DQo+Pj4+ICAgCX0gZWxz
ZSBpZiAoYWRldi0+c211LnBwdF9mdW5jcyAmJiBhZGV2LT5zbXUucHB0X2Z1bmNzLT5nZXRfY2xv
Y2tfYnlfdHlwZV93aXRoX2xhdGVuY3kpIHsNCj4+Pj4gICAJCWlmIChzbXVfZ2V0X2Nsb2NrX2J5
X3R5cGVfd2l0aF9sYXRlbmN5KCZhZGV2LT5zbXUsDQo+Pj4+IC0JCQkJCQkgICAgICAgZGNfdG9f
cHBfY2xvY2tfdHlwZShjbGtfdHlwZSksDQo+Pj4+ICsJCQkJCQkgICAgICAgZGNfdG9fc211X2Ns
b2NrX3R5cGUoY2xrX3R5cGUpLA0KPj4NCj4+IFRoaXMgaXMgc2xpZ2h0bHkgY29uY2VybmluZy4g
VGhlIGZ1bmN0aW9ucyBhcmUgZG9pbmcgdGhlIHJpZ2h0IHRoaW5nLA0KPj4gYnV0IGFtZF9wcF9j
bG9ja190eXBlIGRvZXNuJ3QgbWFwIDEtMSB0byBzbXVfY2xrX3R5cGUuLi4gSW4gYW55IGNhc2Us
DQo+PiB0aGlzIGxvb2tzIGdvb2QgdG8gbWUuDQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPg0KPiANCj4gTG9va3MgbW9zdGx5IGxpa2UgdGhlIHRhYmxlIGp1
c3QgbmVlZHMgdG8gYmUgc2l6ZWQgcHJvcGVybHk6DQo+IA0KPiAJc3RhdGljIGludCBkY19jbGtf
dHlwZV9tYXBbXSA9IHsNCj4gLT4NCj4gCXN0YXRpYyBpbnQgZGNfY2xrX3R5cGVfbWFwW0RNX1BQ
X0NMT0NLX1RZUEVfTlVNX1RZUEVTXSA9IHsNCj4gDQo+IHdoZXJlIERNX1BQX0NMT0NLX1RZUEVf
TlVNX1RZUEVTIHdvdWxkIGJlIGFkZGVkIHRvIGVudW0gZG1fcHBfY2xvY2tfdHlwZS4NCj4gDQo+
IE9yIGl0IGNvdWxkIGp1c3QgdXNlIGEgc3dpdGNoIHRhYmxlIGluc3RlYWQsIGxpa2UgdGhlIG90
aGVyIGZ1bmN0aW9uIGRvZXMuDQo+IA0KPiBOaWNob2xhcyBLYXpsYXVza2FzDQoNCkdvb2QgY2F0
Y2gsIEknbGwgc3BpbiB1cCBzb21ldGhpbmcgcXVpY2suDQoNCkxlbw0KDQo+IA0KPiANCj4+DQo+
Pj4+ICAgCQkJCQkJICAgICAgICZwcF9jbGtzKSkNCj4+Pj4gICAJCQlyZXR1cm4gZmFsc2U7DQo+
Pj4+ICAgCX0NCj4+Pj4gLS0gDQo+Pj4+IDIuMjIuMA0KPj4+Pg0KPj4+DQo+Pj4gR2VudGxlIHBp
bmcgZm9yIHJldmlldywgdGhpcyBpcyB0aGUgbGFzdCByZW1haW5pbmcgd2FybmluZyB0aGF0IEkg
c2VlDQo+Pj4gZnJvbSBhbWRncHUgb24gbmV4dC0yMDE5MDcxOC4NCj4+Pg0KPj4+IENoZWVycywN
Cj4+PiBOYXRoYW4NCj4+Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsDQo+Pg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
