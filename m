Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E486C98D33
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFA46EA80;
	Thu, 22 Aug 2019 08:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710132.outbound.protection.outlook.com [40.107.71.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7783F6E3BC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 23:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHDSMZQO1G5dZ4yQA6Sh8/ANo2Lk4SKEDM2GEpmoKth5EnFzJasd6ct5MR2SRxXWXuZNiWa5MKs9rRdiQgvfLSrKYksmJxrMck4LbPk6Ipcj7b3E+W2TYlJZHEV8dM3GxFR1JSlsAbqRzZXHGIux77ugv1hwvv2/L38tbIVjk2wT17jo5OcT7dCoS3zOow+hTfJuC8Cnf4inMOsMwCb0Naf7i0jlA4CalOz7sru56D9sZWyg9gvOfH2YCCHmAwuTY1gtN+7DwzkAQXtfuycT07MW9BcN6SBj5lmonimw8TW0Qk/9Klrmy75GiXPm2zJFVtimacxoGPp8Qog+gBmqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH7nwlM/+hpNx86t26WSXT/zMv7P+jJ+z5xs9EcuC78=;
 b=jeEs4lEyqGWZQ6o/iqH2qp0CI96MVBk0fqf/kkmntHJaoKnI3mHAAYdskSP6xi5t10qQM/GmpYCT7voe3lUR3wYQ/fed/xfWdds8hkvwqQls8qwdXBsbad4Qidf0+nhzFa2vWCoohzEHJoPLrLMkcWfaUs1h/g0ryS7aznqZniXF/dza2Q1Xrq45SJV03oyI4kPFODKrpkPN6HXQMtf+82Pu08daBzaCEtcJN8Nybw/Jg5UF0L87Mvsd+Hae70rfUNpK+f9pz+z3/igniJyANXgSDQeC9Y0mIu0hG99NRI+w4tUNPCGS7zyJr/xEn4/XNMwGlofmsJTwGV8Ubq8YXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from DM5PR21MB0137.namprd21.prod.outlook.com (10.173.173.12) by
 DM5PR21MB0857.namprd21.prod.outlook.com (10.173.172.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.4; Wed, 21 Aug 2019 23:48:42 +0000
Received: from DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::8985:a319:f21:530e]) by DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a%8]) with mapi id 15.20.2220.000; Wed, 21 Aug 2019
 23:48:42 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "b.zolnierkie@samsung.com"
 <b.zolnierkie@samsung.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Dexuan Cui
 <decui@microsoft.com>
Subject: RE: [PATCH v2] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Topic: [PATCH v2] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Index: AQHVWBETUUvEuW2UmUKx6Ya3YUCalKcGQnDw
Date: Wed, 21 Aug 2019 23:48:42 +0000
Message-ID: <DM5PR21MB01370CB55C3011582F6F8C5CD7AA0@DM5PR21MB0137.namprd21.prod.outlook.com>
References: <20190821111007.3490-1-weh@microsoft.com>
In-Reply-To: <20190821111007.3490-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-21T23:48:40.2987691Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=61cf0715-0dfe-4344-9bb2-ea23cdedd11a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 140a388a-59ea-4168-5289-08d726921924
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600158)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR21MB0857; 
x-ms-traffictypediagnostic: DM5PR21MB0857:|DM5PR21MB0857:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR21MB08576ABB6735716E6FA4AEE2D7AA0@DM5PR21MB0857.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(6436002)(8990500004)(6506007)(102836004)(14444005)(256004)(81166006)(8936002)(66476007)(71200400001)(71190400001)(26005)(81156014)(229853002)(11346002)(476003)(446003)(486006)(4326008)(53936002)(55016002)(9686003)(66446008)(64756008)(66556008)(186003)(2201001)(86362001)(305945005)(7736002)(74316002)(8676002)(6116002)(1511001)(66066001)(66946007)(76176011)(478600001)(99286004)(76116006)(52536014)(6636002)(5660300002)(10290500003)(107886003)(25786009)(6246003)(2501003)(10090500001)(22452003)(33656002)(14454004)(7696005)(2906002)(3846002)(110136005)(316002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR21MB0857;
 H:DM5PR21MB0137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Rz6rdSyrXUzkuL1bD4c60pQVzfEnJ+47poN+A1hgSkB+tJ/yNUFqIoaOMFBuLBhWVUUIkkuOxuL10FPrySO4x+MHVWw++NFvgyviRzNhciXiUUHlCFLQFyZQ2NDtU/D+lT2Go5DkEdNvXESqKBbXfItPSOMQVWnB4jQO0o7rn0q6uW4XDhQdCEVGJWW7gigtMl/yx3Pvqv6VSlfBkK6MBi7x6lXmGNHqfbRDGxpUg/8vpWxVELjCWgtVlDWMa771TEq9jiNLCwNkVKTohvAxe8ONK1okbe9bn9syCTADMRoQ0F4lmYUVoVmxKD4CaPYmq642njkOZBXmRnqVWGo4HRYZKmXm7V5EmlJ3QzfM04qP6Z4tr1Ulqx5W4Ezl1kAU5SraDbnUMuPb7DU2Bvw4L6KAZGawrRaTw8hO7IrYLJk=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140a388a-59ea-4168-5289-08d726921924
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 23:48:42.3026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9NNVs01E1tOxkXgy7hZhGyBcQf+gaeaKQlHWAcLw6XPPbZFDAXxqEjdoWQi5bYQ8yMA0uFeJoSTJN2cYzXMf/MLRVRUB0dZRj3YTn46ew7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB0857
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH7nwlM/+hpNx86t26WSXT/zMv7P+jJ+z5xs9EcuC78=;
 b=bkgDiLyxMpTOB6LBmmur1oWF3y24ysCkJ42j8SC4434ww6ugSdMJfpB9Yxr55b6nsRAeIe3zq7HH4GMUnpuz5Lw77ksv9aWfkuoL7Uvzdy7lQLWcokaHBf9wuwhNdAAnnwRmh4tRtYVu8dLrc2XT5yba6NLaS/v+4IoAISnrMwY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
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
Cc: Iouri Tarassov <iourit@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3Qg
MjEsIDIwMTkgNDoxMSBBTQo+IAo+IEJlZ2lubmluZyBmcm9tIFdpbmRvd3MgMTAgUlM1KywgVk0g
c2NyZWVuIHJlc29sdXRpb24gaXMgb2J0YWluZWQgZnJvbSBob3N0Lgo+IFRoZSAidmlkZW89aHlw
ZXJ2X2ZiIiBib290IHRpbWUgb3B0aW9uIGlzIG5vdCBuZWVkZWQsIGJ1dCBzdGlsbCBjYW4gYmUK
PiB1c2VkIHRvIG92ZXJ3cml0ZSB3aGF0IHRoZSBob3N0IHNwZWNpZmllcy4gVGhlIFZNIHJlc29s
dXRpb24gb24gdGhlIGhvc3QKPiBjb3VsZCBiZSBzZXQgYnkgZXhlY3V0aW5nIHRoZSBwb3dlcnNo
ZWxsICJzZXQtdm12aWRlbyIgY29tbWFuZC4KPiAKPiB2MjoKPiAtIEltcGxlbWVudGVkIGZhbGxi
YWNrIHdoZW4gdmVyc2lvbiBuZWdvdGlhdGlvbiBmYWlsZWQuCj4gLSBEZWZpbmVkIGZ1bGwgc2l6
ZSBmb3Igc3VwcG9ydGVkX3Jlc29sdXRpb24gYXJyYXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSW91
cmkgVGFyYXNzb3YgPGlvdXJpdEBtaWNyb3NvZnQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBI
dSA8d2VoQG1pY3Jvc29mdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgS2VsbGV5IDxtaWtl
bGxleUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6IGxpbmVzIHNob3VsZCBub3QgYmUgYWRk
ZWQgdG8gcGF0Y2hlcyB1bnRpbCB0aGUgcmV2aWV3ZXIKaGFzIGFjdHVhbGx5IGdpdmVuIGEgIlJl
dmlld2VkLWJ5OiIgc3RhdGVtZW50LCBhbmQgSSBoYXZlbid0IGRvbmUgdGhhdAp5ZXQuIDotKSAg
U3VjaCBzdGF0ZW1lbnRzIGFyZSB0eXBpY2FsbHkgbm90IGdpdmVuIHVudGlsIHJldmlldwpjb21t
ZW50cyBoYXZlIGJlZW4gYWRkcmVzc2VkIGFuZCByZS1yZXZpZXdlZCBhcyBuZWNlc3NhcnkuCgo+
IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIHwgMTQ1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gKwo+ICtzdHJ1Y3Qgc3ludGh2aWRfc3VwcG9ydGVkX3Jl
c29sdXRpb25fcmVzcCB7Cj4gKwl1OCBlZGlkX2Jsb2NrW1NZTlRIVklEX0VESURfQkxPQ0tfU0la
RV07Cj4gKwl1OCByZXNvbHV0aW9uX2NvdW50Owo+ICsJdTggZGVmYXVsdF9yZXNvbHV0aW9uX2lu
ZGV4Owo+ICsJdTggaXNfc3RhbmRhcmQ7Cj4gKwlzdHJ1Y3QgaHZkX3NjcmVlbl9pbmZvCj4gKwkJ
c3VwcG9ydGVkX3Jlc29sdXRpb25bU1lOVEhWSURfTUFYX1JFU09MVVRJT05fQ09VTlRdOwoKSXMg
dGhlcmUgZXh0cmEgd2hpdGVzcGFjZSBvbiB0aGlzIGxpbmU/ICBKdXN0IHdvbmRlcmluZyB3aHkg
aXQgZG9lc24ndApsaW5lIHVwLgoKPiArfSBfX3BhY2tlZDsKPiArCj4gQEAgLTQ0OCwxMSArNTQy
LDI3IEBAIHN0YXRpYyBpbnQgc3ludGh2aWRfY29ubmVjdF92c3Aoc3RydWN0IGh2X2RldmljZSAq
aGRldikKPiAgCX0KPiAKPiAgCS8qIE5lZ290aWF0ZSB0aGUgcHJvdG9jb2wgdmVyc2lvbiB3aXRo
IGhvc3QgKi8KPiAtCWlmICh2bWJ1c19wcm90b192ZXJzaW9uID09IFZFUlNJT05fV1MyMDA4IHx8
Cj4gLQkgICAgdm1idXNfcHJvdG9fdmVyc2lvbiA9PSBWRVJTSU9OX1dJTjcpCj4gLQkJcmV0ID0g
c3ludGh2aWRfbmVnb3RpYXRlX3ZlcihoZGV2LCBTWU5USFZJRF9WRVJTSU9OX1dJTjcpOwo+IC0J
ZWxzZQo+ICsJc3dpdGNoICh2bWJ1c19wcm90b192ZXJzaW9uKSB7Cj4gKwljYXNlIFZFUlNJT05f
V0lOMTA6Cj4gKwljYXNlIFZFUlNJT05fV0lOMTBfVjU6Cj4gKwkJcmV0ID0gc3ludGh2aWRfbmVn
b3RpYXRlX3ZlcihoZGV2LCBTWU5USFZJRF9WRVJTSU9OX1dJTjEwKTsKPiArCQlpZiAoIXJldCkK
PiArCQkJYnJlYWs7Cj4gKwkJLyogRmFsbHRocm91Z2ggKi8KPiArCWNhc2UgVkVSU0lPTl9XSU44
Ogo+ICsJY2FzZSBWRVJTSU9OX1dJTjhfMToKPiAgCQlyZXQgPSBzeW50aHZpZF9uZWdvdGlhdGVf
dmVyKGhkZXYsIFNZTlRIVklEX1ZFUlNJT05fV0lOOCk7Cj4gKwkJaWYgKCFyZXQpCj4gKwkJCWJy
ZWFrOwo+ICsJCS8qIEZhbGx0aHJvdWdoICovCj4gKwljYXNlIFZFUlNJT05fV1MyMDA4Ogo+ICsJ
Y2FzZSBWRVJTSU9OX1dJTjc6Cj4gKwkJcmV0ID0gc3ludGh2aWRfbmVnb3RpYXRlX3ZlcihoZGV2
LCBTWU5USFZJRF9WRVJTSU9OX1dJTjcpOwo+ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDoKPiArCQly
ZXQgPSBzeW50aHZpZF9uZWdvdGlhdGVfdmVyKGhkZXYsIFNZTlRIVklEX1ZFUlNJT05fV0lOMTAp
Owo+ICsJCWJyZWFrOwoKSSdtIHRlbXB0ZWQgdG8gcHV0ICJkZWZhdWx0OiIgdXAgd2l0aCBWRVJT
SU9OX1dJTjEwIGFuZCBWRVJJU09OX1dJTjEwX1Y1CnNvIHRoYXQgaXQgY2FuIGFsc28gZmFsbGJh
Y2sgdG8gZWFybGllciB2ZXJzaW9ucy4gIFlvdSB3b3VsZCBoYXZlIGEgY291cGxlIG9mIGxlc3MK
bGluZXMgb2YgY29kZS4gIEJ1dCBhcmd1YWJseSBuZXdlciB2ZXJzaW9ucyBzaG91bGQgYWx3YXlz
IGdvIHdpdGgKU1lOVEhWSURfVkVSU0lPTl9XSU4xMCBhbmQgbm90IGZhbGxiYWNrLiAgSSBkb24n
dCBoYXZlIGEgc3Ryb25nIG9waW5pb24KZWl0aGVyIHdheS4KCj4gKwl9Cj4gCj4gIAlpZiAocmV0
KSB7Cj4gIAkJcHJfZXJyKCJTeW50aGV0aWMgdmlkZW8gZGV2aWNlIHZlcnNpb24gbm90IGFjY2Vw
dGVkXG4iKTsKPiBAQCAtNDY0LDYgKzU3NCwxMiBAQCBzdGF0aWMgaW50IHN5bnRodmlkX2Nvbm5l
Y3RfdnNwKHN0cnVjdCBodl9kZXZpY2UgKmhkZXYpCj4gIAllbHNlCj4gIAkJc2NyZWVuX2RlcHRo
ID0gU1lOVEhWSURfREVQVEhfV0lOODsKPiAKPiArCWlmIChwYXItPnN5bnRodmlkX3ZlcnNpb24g
Pj0gU1lOVEhWSURfVkVSU0lPTl9XSU4xMCkgewoKVW5mb3J0dW5hdGVseSwgdGhpcyAiZ3JlYXRl
ciB0aGFuIiBjb21wYXJpc29uIHdvbid0IHdvcmsgY29ycmVjdGx5IGJlY2F1c2UKdGhlIG1pbm9y
IHZlcnNpb24gaXMgc3RvcmVkIGluIHRoZSBoaWdoIG9yZGVyIGJpdHMuICBWZXJzaW9uIDQuMCB3
b3VsZCBjb21wYXJlCmFzIGxlc3MgdGhhbiB2ZXJzaW9uIDMuNSAod2hpY2ggaXMgd2hhdCBTWU5U
SFZJRF9WRVJTSU9OX1dJTjEwIGlzKS4KCj4gKwkJcmV0ID0gc3ludGh2aWRfZ2V0X3N1cHBvcnRl
ZF9yZXNvbHV0aW9uKGhkZXYpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXByX2luZm8oIkZhaWxlZCB0
byBnZXQgc3VwcG9ydGVkIHJlc29sdXRpb24gZnJvbSBob3N0LCB1c2UKPiBkZWZhdWx0XG4iKTsK
PiArCX0KPiArCj4gIAlzY3JlZW5fZmJfc2l6ZSA9IGhkZXYtPmNoYW5uZWwtPm9mZmVybXNnLm9m
ZmVyLgo+ICAJCQkJbW1pb19tZWdhYnl0ZXMgKiAxMDI0ICogMTAyNDsKPiAKPiBAQCAtNjUzLDYg
Kzc2OSw4IEBAIHN0YXRpYyB2b2lkIGh2ZmJfZ2V0X29wdGlvbihzdHJ1Y3QgZmJfaW5mbyAqaW5m
bykKPiAgCX0KPiAKPiAgCWlmICh4IDwgSFZGQl9XSURUSF9NSU4gfHwgeSA8IEhWRkJfSEVJR0hU
X01JTiB8fAo+ICsJICAgIChwYXItPnN5bnRodmlkX3ZlcnNpb24gPj0gU1lOVEhWSURfVkVSU0lP
Tl9XSU4xMCAmJgoKU2FtZSBjb21wYXJpc29uIHByb2JsZW0gaGVyZS4KCj4gKwkgICAgKHggPiBz
Y3JlZW5fd2lkdGhfbWF4IHx8IHkgPiBzY3JlZW5faGVpZ2h0X21heCkpIHx8Cj4gIAkgICAgKHBh
ci0+c3ludGh2aWRfdmVyc2lvbiA9PSBTWU5USFZJRF9WRVJTSU9OX1dJTjggJiYKPiAgCSAgICAg
eCAqIHkgKiBzY3JlZW5fZGVwdGggLyA4ID4gU1lOVEhWSURfRkJfU0laRV9XSU44KSB8fAo+ICAJ
ICAgIChwYXItPnN5bnRodmlkX3ZlcnNpb24gPT0gU1lOVEhWSURfVkVSU0lPTl9XSU43ICYmCj4g
QEAgLTY4OSw4ICs4MDcsMTIgQEAgc3RhdGljIGludCBodmZiX2dldG1lbShzdHJ1Y3QgaHZfZGV2
aWNlICpoZGV2LCBzdHJ1Y3QgZmJfaW5mbwo+ICppbmZvKQo+ICAJCX0KPiAKPiAgCQlpZiAoIShw
Y2lfcmVzb3VyY2VfZmxhZ3MocGRldiwgMCkgJiBJT1JFU09VUkNFX01FTSkgfHwKPiAtCQkgICAg
cGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKSA8IHNjcmVlbl9mYl9zaXplKQo+ICsJCSAgICBwY2lf
cmVzb3VyY2VfbGVuKHBkZXYsIDApIDwgc2NyZWVuX2ZiX3NpemUpIHsKPiArCQkJcHJfZXJyKCJS
ZXNvdXJjZSBub3QgYXZhaWxhYmxlIG9yICgweCVseCA8IDB4JWx4KVxuIiwKPiArCQkJICAgICAg
ICh1bnNpZ25lZCBsb25nKSBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDApLAo+ICsJCQkgICAgICAg
KHVuc2lnbmVkIGxvbmcpIHNjcmVlbl9mYl9zaXplKTsKPiAgCQkJZ290byBlcnIxOwo+ICsJCX0K
Ck1pY2hhZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
