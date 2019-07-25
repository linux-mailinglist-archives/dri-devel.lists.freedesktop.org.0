Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69976753A7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 18:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770F46E78A;
	Thu, 25 Jul 2019 16:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450386E789;
 Thu, 25 Jul 2019 16:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9d8YQLc9UIALoYX8xzvM5TFDq4BP5wP7Rmv8rcntAFdZ1M5NUFs/sS3Sgk8GXZ12CVQdMLSrGeIhhl+HiONuUI/Uo0ytz3VpqgkgTzavBeFp/wtt0H4LhBPglFgyVZHA4Crqgm2CKGCx0FpDZpcs50+BTFOAhSFitYM1eKOGNLU/vAlES4iTh0s/lIITEhFmDK/HBnEiXdDcHK89DSUZCrg4RcYyLtvIxBTSXuWSVP4gwTAkOgURGT9oSGEratlOSS/WHYi8lHyIT3VQquRLqCrFyuD/ti7flxf4Pdt1cDBkrS9Kkiww6roolSpgr6GdOkS4aC3K+VUE16SsMnMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/hasSJXrSl4WPd8vYfEjO2Oa8pS5LzLaSVVc7ykuFk=;
 b=DZBPnNfKd3ERKkQ5bYwG3smS41bl0segDnqBozHL78e8/fOWBrg/PdstKisHJ/orgk88eZP1oPitaOgXs4HEcOiAaDJ2KIgYzY7K+JjwQru9zG8VfOLGd2huCollCvHcycFBVY2JsuQcyGP/8Wxa1XNWGWJ0usvzjQq15Sh4FDMMsO22WdrJ56QpSpopGLhIuFWcmVDI6MF2LyVdU1kM4ksvkHG/g3GVynhP32F+OC3nX6GcMZ+LygYOL8uyR0atiEGDGFf/RT5+nsuBA2mm6ErOgaS7cszlnZ2fbJ6TWYN8kchHaJvdCcvZqPq9EVM8kZsUHeCcvaLK4jtT2TVWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3207.namprd12.prod.outlook.com (20.179.92.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 16:14:26 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 16:14:26 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, Rex Zhu <rex.zhu@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>
Subject: Re: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Thread-Topic: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Thread-Index: AQHVMjm3BBZjBABNkkubYh2hnztXdKbRXFiAgApDRgCAAAP4AA==
Date: Thu, 25 Jul 2019 16:14:25 +0000
Message-ID: <18b343ab-8834-ea86-1bca-974f23b60b16@amd.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-6-natechancellor@gmail.com>
 <20190719031647.GA84028@archlinux-threadripper>
 <5f0e8332-50ae-cc9c-1a12-5a097c51297d@amd.com>
In-Reply-To: <5f0e8332-50ae-cc9c-1a12-5a097c51297d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::37) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eaec22b3-ad22-4fb7-9457-08d7111b299a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3207; 
x-ms-traffictypediagnostic: BYAPR12MB3207:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR12MB3207442691525AC17D550051ECC10@BYAPR12MB3207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(199004)(189003)(36756003)(486006)(99286004)(6436002)(6512007)(6306002)(71200400001)(71190400001)(256004)(305945005)(31696002)(110136005)(54906003)(2906002)(316002)(14454004)(86362001)(7736002)(3846002)(6116002)(66066001)(6486002)(53936002)(6246003)(31686004)(14444005)(4326008)(66476007)(25786009)(66946007)(66556008)(26005)(68736007)(66446008)(64756008)(186003)(966005)(229853002)(478600001)(81156014)(81166006)(8676002)(8936002)(5660300002)(2616005)(11346002)(446003)(386003)(6506007)(52116002)(102836004)(53546011)(476003)(6636002)(76176011)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3207;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KIMkqZy5eM/n5rgoJcDmcDfOE8R0U3EKd+gyoWmWbpQxr81vaT+6rOc8ri1YG6XVgPtLyz0bWb2eOAwVk5TuXFK2hgQ3qprKd7TD0oFScRIVaH4e5MoqjAttN5S1I/4PN6GILEOI0kQS4sKz3A3zqok/CIPt/R6/2uNktt+6l6rxvY13fKuyHBjrqblY7cQyesuG9KuAxKiHOLmnAxvcNcCdbvkLkuHRsAqO13GDi9ep1sXwK+aeP2G6YxmCIk9dOnKzXb2ZcaHS4Etqn4O3CqzZC2F6sfljzL2zW1HWxeTcuvtt0uiMEcC2+niGcOUzGTRaRNd/exhbbG4bzvJ2X1crjodzUEtCepSC9EFmexOi9TACm0Cgq63kHfBy9EpKdCk+1AYn/ljyDGoLxs56PYH/gOsVNv/DUK/dfscjczg=
Content-ID: <ACB2C3C9055D6F4C88F9A0B2C09CF89F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaec22b3-ad22-4fb7-9457-08d7111b299a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 16:14:25.9168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3207
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/hasSJXrSl4WPd8vYfEjO2Oa8pS5LzLaSVVc7ykuFk=;
 b=ZZmLSdpqR1Aeu5A4MTFDpb9Yujyx6ujFlqB0JDvualjWw5QwlTI0+Nz+eH+jXH4pCFMpFuI4ez74EskCivWBE3BE4FM6X8Ue9QXcEhX/UJfpMM9Sew1JA0tre3WOCSnjBW0t7XL3Na3ZVt5SfxtINhVIZPE0Y8QJjVlN3a0ZFsQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNy8yNS8xOSAxMjowMCBQTSwgTGksIFN1biBwZW5nIChMZW8pIHdyb3RlOg0KPiANCj4gDQo+
IE9uIDIwMTktMDctMTggMTE6MTYgcC5tLiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6DQo+PiBP
biBXZWQsIEp1bCAwMywgMjAxOSBhdCAxMDo1MjoxNlBNIC0wNzAwLCBOYXRoYW4gQ2hhbmNlbGxv
ciB3cm90ZToNCj4+PiBjbGFuZyB3YXJuczoNCj4+Pg0KPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYzozMzY6ODoNCj4+
PiB3YXJuaW5nOiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnZW51
bSBzbXVfY2xrX3R5cGUnDQo+Pj4gdG8gZGlmZmVyZW50IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0g
YW1kX3BwX2Nsb2NrX3R5cGUnDQo+Pj4gWy1XZW51bS1jb252ZXJzaW9uXQ0KPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGNfdG9fc211X2Nsb2NrX3R5cGUoY2xr
X3R5cGUpLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYzo0MjE6MTQ6DQo+Pj4g
d2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5cGUgJ2VudW0N
Cj4+PiBhbWRfcHBfY2xvY2tfdHlwZScgdG8gZGlmZmVyZW50IGVudW1lcmF0aW9uIHR5cGUgJ2Vu
dW0gc211X2Nsa190eXBlJw0KPj4+IFstV2VudW0tY29udmVyc2lvbl0NCj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRjX3RvX3BwX2Nsb2NrX3R5cGUoY2xrX3R5
cGUpLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+Pj4NCj4+PiBUaGVyZSBhcmUgZnVuY3Rpb25zIHRv
IHByb3Blcmx5IGNvbnZlcnQgYmV0d2VlbiBhbGwgb2YgdGhlc2UgdHlwZXMsIHVzZQ0KPj4+IHRo
ZW0gc28gdGhlcmUgYXJlIG5vIGxvbmdlciBhbnkgd2FybmluZ3MuDQo+Pj4NCj4+PiBGaXhlczog
YTQzOTEzZWE1MGE1ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBnZXRfY2xvY2tf
YnlfdHlwZV93aXRoX2xhdGVuY3kgZm9yIG5hdmkxMCIpDQo+Pj4gRml4ZXM6IGU1ZTRlMjIzOTFj
MiAoImRybS9hbWQvcG93ZXJwbGF5OiBhZGQgaW50ZXJmYWNlIHRvIGdldCBjbG9jayBieSB0eXBl
IHdpdGggbGF0ZW5jeSBmb3IgZGlzcGxheSAodjIpIikNCj4+PiBMaW5rOiBodHRwczovL2dpdGh1
Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy81ODYNCj4+PiBTaWduZWQtb2ZmLWJ5
OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPg0KPj4+IC0tLQ0K
Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBf
c211LmMgfCA0ICsrLS0NCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYw0KPj4+IGluZGV4IGVhYzA5YmZl
M2JlMi4uMGY3NmNmZmY5ZDliIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jDQo+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMNCj4+PiBAQCAt
MzMzLDcgKzMzMyw3IEBAIGJvb2wgZG1fcHBfZ2V0X2Nsb2NrX2xldmVsc19ieV90eXBlKA0KPj4+
ICAgCQl9DQo+Pj4gICAJfSBlbHNlIGlmIChhZGV2LT5zbXUuZnVuY3MgJiYgYWRldi0+c211LmZ1
bmNzLT5nZXRfY2xvY2tfYnlfdHlwZSkgew0KPj4+ICAgCQlpZiAoc211X2dldF9jbG9ja19ieV90
eXBlKCZhZGV2LT5zbXUsDQo+Pj4gLQkJCQkJICBkY190b19zbXVfY2xvY2tfdHlwZShjbGtfdHlw
ZSksDQo+Pj4gKwkJCQkJICBkY190b19wcF9jbG9ja190eXBlKGNsa190eXBlKSwNCj4gDQo+IHNt
dV9mdW5jcy0+Z2V0X2Nsb2NrX2J5X3R5cGUgZG9lc24ndCBzZWVtIHRvIGJlIGhvb2tlZCB1cCBh
bnl3aGVyZSwNCj4gc28gdGhpcyBsb29rcyB0byBiZSB0aGUgbW9zdCBjb3JyZWN0Lg0KPiANCj4g
QWx0aG91Z2ggaXQgbWFrZXMgbW9yZSBzZW5zZSB0byB1c2Ugc211X2Nsa190eXBlcyBoZXJlIHJh
dGhlciB0aGFuDQo+IGFtZF9wcF9jbG9ja190eXBlIC0gYW55IHJlYXNvbiB3aHkgdGhpcyBpc24n
dCB0aGUgY2FzZT8NCj4gDQo+Pj4gICAJCQkJCSAgJnBwX2Nsa3MpKSB7DQo+Pj4gICAJCQlnZXRf
ZGVmYXVsdF9jbG9ja19sZXZlbHMoY2xrX3R5cGUsIGRjX2Nsa3MpOw0KPj4+ICAgCQkJcmV0dXJu
IHRydWU7DQo+Pj4gQEAgLTQxOCw3ICs0MTgsNyBAQCBib29sIGRtX3BwX2dldF9jbG9ja19sZXZl
bHNfYnlfdHlwZV93aXRoX2xhdGVuY3koDQo+Pj4gICAJCQlyZXR1cm4gZmFsc2U7DQo+Pj4gICAJ
fSBlbHNlIGlmIChhZGV2LT5zbXUucHB0X2Z1bmNzICYmIGFkZXYtPnNtdS5wcHRfZnVuY3MtPmdl
dF9jbG9ja19ieV90eXBlX3dpdGhfbGF0ZW5jeSkgew0KPj4+ICAgCQlpZiAoc211X2dldF9jbG9j
a19ieV90eXBlX3dpdGhfbGF0ZW5jeSgmYWRldi0+c211LA0KPj4+IC0JCQkJCQkgICAgICAgZGNf
dG9fcHBfY2xvY2tfdHlwZShjbGtfdHlwZSksDQo+Pj4gKwkJCQkJCSAgICAgICBkY190b19zbXVf
Y2xvY2tfdHlwZShjbGtfdHlwZSksDQo+IA0KPiBUaGlzIGlzIHNsaWdodGx5IGNvbmNlcm5pbmcu
IFRoZSBmdW5jdGlvbnMgYXJlIGRvaW5nIHRoZSByaWdodCB0aGluZywNCj4gYnV0IGFtZF9wcF9j
bG9ja190eXBlIGRvZXNuJ3QgbWFwIDEtMSB0byBzbXVfY2xrX3R5cGUuLi4gSW4gYW55IGNhc2Us
DQo+IHRoaXMgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4NCg0KTG9va3MgbW9zdGx5IGxpa2UgdGhlIHRhYmxlIGp1c3QgbmVl
ZHMgdG8gYmUgc2l6ZWQgcHJvcGVybHk6DQoNCglzdGF0aWMgaW50IGRjX2Nsa190eXBlX21hcFtd
ID0gew0KLT4NCglzdGF0aWMgaW50IGRjX2Nsa190eXBlX21hcFtETV9QUF9DTE9DS19UWVBFX05V
TV9UWVBFU10gPSB7DQoNCndoZXJlIERNX1BQX0NMT0NLX1RZUEVfTlVNX1RZUEVTIHdvdWxkIGJl
IGFkZGVkIHRvIGVudW0gZG1fcHBfY2xvY2tfdHlwZS4NCg0KT3IgaXQgY291bGQganVzdCB1c2Ug
YSBzd2l0Y2ggdGFibGUgaW5zdGVhZCwgbGlrZSB0aGUgb3RoZXIgZnVuY3Rpb24gZG9lcy4NCg0K
TmljaG9sYXMgS2F6bGF1c2thcw0KDQoNCj4gDQo+Pj4gICAJCQkJCQkgICAgICAgJnBwX2Nsa3Mp
KQ0KPj4+ICAgCQkJcmV0dXJuIGZhbHNlOw0KPj4+ICAgCX0NCj4+PiAtLSANCj4+PiAyLjIyLjAN
Cj4+Pg0KPj4NCj4+IEdlbnRsZSBwaW5nIGZvciByZXZpZXcsIHRoaXMgaXMgdGhlIGxhc3QgcmVt
YWluaW5nIHdhcm5pbmcgdGhhdCBJIHNlZQ0KPj4gZnJvbSBhbWRncHUgb24gbmV4dC0yMDE5MDcx
OC4NCj4+DQo+PiBDaGVlcnMsDQo+PiBOYXRoYW4NCj4+DQo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPiANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
