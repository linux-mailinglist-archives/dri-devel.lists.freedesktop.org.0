Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F9520F8F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 22:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03173897D7;
	Thu, 16 May 2019 20:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750072.outbound.protection.outlook.com [40.107.75.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D024897D4;
 Thu, 16 May 2019 20:21:54 +0000 (UTC)
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB3350.namprd12.prod.outlook.com (20.178.55.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 20:21:52 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::2da9:6db9:100f:54de]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::2da9:6db9:100f:54de%5]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 20:21:52 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: Lyude Paul <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Add DP MST AUX devices
Thread-Topic: [PATCH 0/7] Add DP MST AUX devices
Thread-Index: AQHVC/vN/IJzdkhxikOFXc7kdtIiq6ZuKluAgAAHqIA=
Date: Thu, 16 May 2019 20:21:52 +0000
Message-ID: <52a0a153-692d-b876-dd95-9fd5de451859@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <2248d762446e824def09699f0ef719b9c90d0dbc.camel@redhat.com>
In-Reply-To: <2248d762446e824def09699f0ef719b9c90d0dbc.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::23) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bf2bc9c-d3e7-440a-4c8d-08d6da3c21c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3350; 
x-ms-traffictypediagnostic: BYAPR12MB3350:
x-microsoft-antispam-prvs: <BYAPR12MB33505DA5B6AC2A32CD457C96820A0@BYAPR12MB3350.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(39860400002)(396003)(136003)(199004)(189003)(256004)(229853002)(99286004)(25786009)(316002)(72206003)(14454004)(68736007)(31696002)(6246003)(110136005)(2201001)(81156014)(5660300002)(81166006)(8676002)(186003)(52116002)(478600001)(8936002)(26005)(76176011)(86362001)(305945005)(486006)(7736002)(53936002)(102836004)(11346002)(53546011)(2616005)(476003)(386003)(6506007)(66476007)(73956011)(3846002)(66066001)(6512007)(446003)(31686004)(66946007)(6486002)(64756008)(6116002)(2906002)(36756003)(2501003)(66446008)(66556008)(6436002)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3350;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WxKYVDw6ud74qMucDW4+9tQdislqCiRz9EM7BRgJSQ7a8T/KdOVsZemhpcmpSHAhOUOTYSX3ZEoIopOZrTL89yV4Q9mjYT1vRnZBMvP2ppyShN6zY8bNWBh7tgyN8ud6Mgy5qZcAwQCNvzGva88vM3czWoMQa1jwF9drtn0NiqfpNy+yJOhaqvGMMa2d/Tr4wZUtfKVAJ6DBMyY89PdoMYXvofEFVSDBY8u6zyEvemijYIwDys/tTmrG6F2gceguNjC7+Z4Zo2KJGFJAueO3wr5CNfNHRo6T1ltveXY7PO12PWeoAAoCw0DuKWA8VzXi7Ctm2gdC6hefOcS77MVirM80J28t9oB7Hs5eaBhrKTE1x9LiQCHJb8VDXTanpoPUJb53tdP+jIS4Zkb50AX5tCkDkYhTf8TakDVe6/oTwvA=
Content-ID: <CB268532F353A442B427C15A90E3DA6E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf2bc9c-d3e7-440a-4c8d-08d6da3c21c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 20:21:52.2832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3350
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng5UaajiUHUG7T/yXjwM0WFWM3CWefHrLZsjq3wPs7o=;
 b=qnngRaj/LtatVBzjTaqtcsbZL+A2rmNPv/lnblXD+KitUM00ma0e2x2Dyr97hcAsXcATsJKPKb7KQFK6x6Pn/4NZX4Wxv3vniDwLOFtrGPzTki//LLWY6RyHb97BrQHUNf812s3WzCnQv3FlBEGfTVC/ehJIW7Sln/EhU9PP+RA=
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

DQoNCk9uIDIwMTktMDUtMTYgMzo1NCBwLm0uLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdDQo+IA0KPiBIaSwgY291bGQgd2UgKGFuZCBmb3IgZnV0dXJlIHZl
cnNpb25zIG9mIHRoaXMgc2VyaWVzIGFuZCBvdGhlcnMpIGdldCBhIHJlc3Bpbg0KPiBvZiB0aGlz
IHRoYXQncyBhY3R1YWxseSByZWJhc2VkIGFnYWluc3QgZHJtLXRpcD8gVGhhdCBpcyB0aGUgZGVm
YWN0byBzdGFuZGFyZA0KPiBicmFuY2ggdG8gZG8gZGV2ZWxvcG1lbnQgb24sIGFuZCBvdGhlcndp
c2UgYW55b25lIHRyeWluZyB0byB0ZXN0IHRoZXNlIHBhdGNoZXMNCj4gaGFzIHRvIHJlc29sdmUg
bWVyZ2UgY29uZmxpY3RzIChhbG9uZyB3aXRoIG1haW50YWluZXJzKS4gVGhlIGJyYW5jaCB0aGlz
DQo+IGFwcGVhcnMgdG8gYmUgYmFzZWQgb2ZmIG9mIGRvZXNuJ3QgZXZlbiBoYXZlIHRoZSBuZXcg
a3JlZiBzY2hlbWUgZm9yIGJyYW5jaA0KPiBkZXZpY2VzIGFuZCBwb3J0cy4NCj4gDQoNClNvcnJ5
LCB0aGlzIHdhcyBsYXppbmVzcyBvbiBteSBwYXJ0IDopDQpSZWJhc2luZyB0aGlzIG5vdy4NCg0K
TGVvDQoNCj4gT24gVGh1LCAyMDE5LTA1LTE2IGF0IDExOjE3IC0wNDAwLCBzdW5wZW5nLmxpQGFt
ZC5jb20gd3JvdGU6DQo+PiBGcm9tOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4NCj4+DQo+
PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIE1TVCBBVVggZGV2aWNlcy4NCj4+DQo+PiBB
IG1vcmUgZGVzY3JpcHRpdmUgJ21zdHBhdGgnIGF0dHJpYnV0ZSBpcyBhbHNvIGFkZGVkIHRvIE1T
VCBjb25uZWN0b3INCj4+IGRldmljZXMuIEluIGFkZGl0aW9uLCB0aGUgRFAgYXV4IGRldmljZSBp
cyBtYWRlIHRvIGJlIGEgY2hpbGQgb2YgdGhlDQo+PiBjb3JyZXNwb25kaW5nIGNvbm5lY3Rvcidz
IGRldmljZSB3aGVyZSBwb3NzaWJsZSAoKikuIFRoaXMgYWxsb3dzIHVkZXYNCj4+IHJ1bGVzIHRv
IHByb3ZpZGUgZGVzY3JpcHRpdmUgc3ltbGlua3MgdG8gdGhlIEFVWCBkZXZpY2VzLg0KPj4NCj4+
ICgqKSBUaGlzIGNhbiBvbmx5IGJlIGRvbmUgb24gZHJpdmVycyB0aGF0IHJlZ2lzdGVyIHRoZWly
IGNvbm5lY3RvciBhbmQNCj4+IGF1eCBkZXZpY2VzIHZpYSBkcm1fY29ubmVjdG9yX3JlZ2lzdGVy
KCkgYW5kIGRybV9kcF9hdXhfcmVnaXN0ZXIoKQ0KPj4gcmVzcGVjdGl2ZWx5LiBUaGUgY29ubmVj
dG9yIGFsc28gbmVlZHMgdG8gYmUgcmVnaXN0ZXJlZCBiZWZvcmUgdGhlIGF1eA0KPj4gZGV2aWNl
Lg0KPj4NCj4+IExlbyBMaSAoNik6DQo+PiAgICBkcm0vZHA6IFVzZSBub24tY3ljbGljIGlkcg0K
Pj4gICAgZHJtL2RwLW1zdDogVXNlIGNvbm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50
DQo+PiAgICBkcm0vc3lzZnM6IEFkZCBtc3RwYXRoIGF0dHJpYnV0ZSB0byBjb25uZWN0b3IgZGV2
aWNlcw0KPj4gICAgZHJtL2FtZC9kaXNwbGF5OiBVc2UgY29ubmVjdG9yIGtkZXYgYXMgYXV4IGRl
dmljZSBwYXJlbnQNCj4+ICAgIGRybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eDogVXNlIGNvbm5l
Y3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50DQo+PiAgICBkcm0vbm91dmVhdTogVXNlIGNv
bm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50DQo+Pg0KPj4gVmlsbGUgU3lyasOkbMOk
ICgxKToNCj4+ICAgIGRybS9kcF9tc3Q6IFJlZ2lzdGVyIEFVWCBkZXZpY2VzIGZvciBNU1QgcG9y
dHMNCj4+DQo+PiAgIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBl
cy5jICAgIHwgICAyICstDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54
Nzh4eC5jICAgICAgICAgIHwgIDIyICsrLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
YXV4X2Rldi5jICAgICAgICAgICAgICAgICAgIHwgIDE3ICsrKy0NCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgICAgICAgfCAxMDYNCj4+ICsrKysrKysr
KysrKysrKysrKy0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyMyArKysrKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2Nvbm5lY3Rvci5jICAgICAgICB8ICAgMiArLQ0KPj4gICBpbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArDQo+PiAgIGluY2x1ZGUv
ZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgICAgICAgICAgICAgIHwgICA2ICsrDQo+PiAg
IDggZmlsZXMgY2hhbmdlZCwgMTUyIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KPj4N
Cj4gLS0NCj4gQ2hlZXJzLA0KPiAgICAgICAgICBMeXVkZSBQYXVsDQo+IA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
