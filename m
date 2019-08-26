Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 123039D040
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 15:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108176E111;
	Mon, 26 Aug 2019 13:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146126E111;
 Mon, 26 Aug 2019 13:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMLQICC2IsZHBtB73Zoa4ZrNGH3UeXB4O6XJFpBydeltOxch8HiV9L42nsXhKT6TXcFtPkRmREdz3o+Bb78xv4seLbxmWS4kzOkz3mIunEoDcydaKvyPhiY6ZV1NjZcoC29/rTIL1m8WCpee0Akg74m9q83i3cAmOx2+04ZqgAlck2SKj0YPz2aqVLmLIwMlKrlu1SN5+aJYuIK/9iAVnA3CG1vFNYkv9OeDmnqeJ88/zqvy7ieP7M2Ain8/Y+sqhluexSz/Cyf5z39fPSsD6eeWzuo+PfgQcugN62FL3n+4pn0aayTY1XebTVG8c+nqHvF9BLeMa6wo3r/MFnceIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OW+hppeN4TOEPdCDc+/373AtM3UmEJ0/Xci/6MlGCZ4=;
 b=RHQNhan0CitXhPDEVk15qk3vFV8YAUnJjLKq6XGEDHyqYXRkPBHXFQJwOPnqUeXS6AvdfimaLQHai1J+7tXdIKYaZWMciMg/l+DAN5jI9JdMUUepqLPtZF5p6SBZtZrgVHAvKMTYGUuqBNP58o5xg80aJstfMnXTOzPWGokMJC+MIs+mto6LXV+W0v79ooxzl9FQLGuLttJcNYOYkB7CroXVEdSNIdXwjX2q22AWD451ATl0QLAfte1gkV54Iac7bSaU2X9LzRYcixus1yuhC3vaiNsZvIiBIrbGuEEfFDuSTeuWK2zeySeBxQci5L/cEwx3rP37gNTyyULZpxSxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2535.namprd12.prod.outlook.com (10.172.121.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 13:22:09 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 13:22:08 +0000
From: Harry Wentland <hwentlan@amd.com>
To: YueHaibing <yuehaibing@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Lei, Jun" <Jun.Lei@amd.com>, "Laktyushkin, Dmytro"
 <Dmytro.Laktyushkin@amd.com>, "Lakha, Bhawanpreet"
 <Bhawanpreet.Lakha@amd.com>, "Aberback, Joshua" <Joshua.Aberback@amd.com>,
 "Liu, Wenjing" <Wenjing.Liu@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>, 
 "Leung, Martin" <Martin.Leung@amd.com>
Subject: Re: [PATCH -next] drm/amdgpu/display: fix build error without
 CONFIG_DRM_AMD_DC_DSC_SUPPORT
Thread-Topic: [PATCH -next] drm/amdgpu/display: fix build error without
 CONFIG_DRM_AMD_DC_DSC_SUPPORT
Thread-Index: AQHVW+xuznY/rti1OkK4HAc915o+JqcNaqoA
Date: Mon, 26 Aug 2019 13:22:08 +0000
Message-ID: <c324866d-855a-b259-4511-c69491a82c88@amd.com>
References: <20190826085707.12504-1-yuehaibing@huawei.com>
In-Reply-To: <20190826085707.12504-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdd061e2-8f00-4564-2bea-08d72a286557
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2535; 
x-ms-traffictypediagnostic: CY4PR1201MB2535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB25358136B50F21FDF46465798CA10@CY4PR1201MB2535.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(189003)(199004)(66446008)(66476007)(64756008)(6436002)(65956001)(65806001)(66946007)(66066001)(31696002)(2201001)(66556008)(31686004)(36756003)(14454004)(305945005)(7736002)(8936002)(8676002)(81156014)(81166006)(2501003)(386003)(6506007)(53546011)(26005)(446003)(6486002)(76176011)(102836004)(6636002)(52116002)(99286004)(11346002)(478600001)(186003)(476003)(2616005)(486006)(3846002)(6116002)(2906002)(53936002)(6512007)(256004)(5660300002)(54906003)(110136005)(71200400001)(316002)(4326008)(71190400001)(6246003)(25786009)(58126008)(229853002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2535;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MZ/8O0v9P7rZJ1n4IXRu5oDTNZ3ILKUUIwPuZ3pQfZxIxGtYRtgsvwMk2v0fVwRm/MXP7lhztVF+JmFJYhs4dFn9n4OxPR327XFBGUZRP/t68wV179VSpG5MN1YrmwyQi3onTCR4LlGh1uq/Y7iORQXDNVVvF97EraV5UbqW8CtMnXnky8/GXO/bF2p3t1gLRUKTHU8tayS3hO6/oTgZAgKJX4qA94J3j5LbJNLmFL0cxPKFSesbXB/NIIjYI4bgAKUnK3cSvO2A8LMr1jTmyM221OfIVdaz/ZXm5FvV57BYoAAUDXbLK9RY1JwUFJWTIthnnLSjMJkZJVr0c18pga8AzkGcT36B5kKQR3uq72sozdNpvuhpFid/YhriFJjjWJYUdIYddo/amPekWHYiqt30N7C07y0qw1hI4Q7UHro=
Content-ID: <6A5CA012EB161B4E94AFA974BBD924A7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd061e2-8f00-4564-2bea-08d72a286557
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 13:22:08.7792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUK/8rH14KwRTcyhskqKGeuTjksXswyM/emoGdUe82LeQ7bFrmw/7LFypwB+ODuswm5prpPm9/4SY7priJmEcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OW+hppeN4TOEPdCDc+/373AtM3UmEJ0/Xci/6MlGCZ4=;
 b=XGweLESflDxOZK27HuH+0gYie230KrIZEep6gJmdZ53dM6vXyLNL/0znODuhpTRFJdrs/MC0lWzczNKw1oHwPUqjf3dgTFxV5AFBT4nKNmvvmIoGGj9FouUuY5/BLrB84pi53YL4ihiZjMYl1bwcoHlDWxGMmRlAE4w4KoGvP8o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDgtMjYgNDo1NyBhLm0uLCBZdWVIYWliaW5nIHdyb3RlOg0KPiBJZiBDT05G
SUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVCBpcyBub3Qgc2V0LCBidWlsZCBmYWlsczoNCj4gDQo+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdz
ZXEuYzogSW4gZnVuY3Rpb24gZGNuMjBfaHdfc2VxdWVuY2VyX2NvbnN0cnVjdDoNCj4gZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jOjIw
OTk6Mjg6DQo+ICBlcnJvcjogZGNuMjBfZHNjX3BnX2NvbnRyb2wgdW5kZWNsYXJlZCAoZmlyc3Qg
dXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gZGNuMjBfZHBwX3BnX2NvbnRyb2w/
DQo+ICAgZGMtPmh3c3MuZHNjX3BnX2NvbnRyb2wgPSBkY24yMF9kc2NfcGdfY29udHJvbDsNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkY24yMF9kcHBfcGdfY29udHJvbA0KPiANCj4gVXNlIENP
TkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUIHRvIGd1YXJkIHRoaXMuDQo+IA0KPiBSZXBvcnRl
ZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+DQo+IEZpeGVzOiA4YTMxODIwYjEy
MTggKCJkcm0vYW1kL2Rpc3BsYXk6IE1ha2UgaW5pdF9odyBhbmQgaW5pdF9waXBlcyBnZW5lcmlj
IGZvciBzZWFtbGVzcyBib290IikNCj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPg0KDQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+DQoNCkhhcnJ5DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMNCj4gaW5kZXggZTE0NmQxZC4uNTRkNjdmNiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX2h3c2VxLmMNCj4gQEAgLTIwOTIsNyArMjA5MiwxMSBAQCB2b2lkIGRjbjIwX2h3X3NlcXVl
bmNlcl9jb25zdHJ1Y3Qoc3RydWN0IGRjICpkYykNCj4gIAlkYy0+aHdzcy5lbmFibGVfcG93ZXJf
Z2F0aW5nX3BsYW5lID0gZGNuMjBfZW5hYmxlX3Bvd2VyX2dhdGluZ19wbGFuZTsNCj4gIAlkYy0+
aHdzcy5kcHBfcGdfY29udHJvbCA9IGRjbjIwX2RwcF9wZ19jb250cm9sOw0KPiAgCWRjLT5od3Nz
Lmh1YnBfcGdfY29udHJvbCA9IGRjbjIwX2h1YnBfcGdfY29udHJvbDsNCj4gKyNpZmRlZiBDT05G
SUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVA0KPiAgCWRjLT5od3NzLmRzY19wZ19jb250cm9sID0g
ZGNuMjBfZHNjX3BnX2NvbnRyb2w7DQo+ICsjZWxzZQ0KPiArCWRjLT5od3NzLmRzY19wZ19jb250
cm9sID0gTlVMTDsNCj4gKyNlbmRpZg0KPiAgCWRjLT5od3NzLmRpc2FibGVfdmdhID0gZGNuMjBf
ZGlzYWJsZV92Z2E7DQo+ICANCj4gIAlpZiAoSVNfRlBHQV9NQVhJTVVTX0RDKGRjLT5jdHgtPmRj
ZV9lbnZpcm9ubWVudCkpIHsNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
