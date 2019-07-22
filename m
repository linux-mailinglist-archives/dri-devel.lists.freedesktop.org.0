Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D441F707C9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1436C89D83;
	Mon, 22 Jul 2019 17:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B03889D83;
 Mon, 22 Jul 2019 17:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnPEaQUcJc7gT6Xtcrk3LB7gyrfoCXIqtoQ4Fcg5xtC3E2/kA7iUXgOd0e+e/7pFRRt4OAPDiOpta+LUOUP/DRdO/ac/E2Z39FeV9WIVM137xuUwm1RQRNGsCafOS3vZazsBFH+90OG9jxM21HmaCk5ZZ4eVIcdGID+QdJCc1HBTR/Uw8eaSXcN4FEyox1iQco3n2CXP3IZ5cWAHGgzDvzPzCQDaAgFbVjzrV8/BzZNsMeh1YWkGHzmQF4tTFSc3sQp4eXn8A6CqRs4FrprRxLzcnj1GhX0LPHNWh1qXC5+19DmZe/10nS2jO+/nwb8HYQ/0w1a2i8yVF224EkUXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wz9Oq3jHYUDrU+vzUuNEx/znkkzRCOVFQVbyvG59/U=;
 b=RsGbEnZoJJXlephHHcTU7pe5lXv6DoDNcOj7YbwK1sEoruHnHR2Nv8Rx4hvdZKtHeJfilx3GvT0LZzgut9bILeZ0aAh6zq0h/ggLXQNpGVe2wSJSxhky1z2YlXJrQEiqYUV/lXcqjUYT01GfyK2Qvixyxe3Q27+V9W5GLvWtu3vaNToyvRzFPIogQx100QaLbFXBZwmGsijrf/Ry6NbUfVoG696I4di9QOI/Nwzw1gNSWNZal5OZjz3hnd5uKlrJJmyQ9Ei7YtFPI0dO3P9rYZoPY1OC1uTo/2z4j4h1r1HCapdRV2HIMT3FmQ2/Rkbhb3cLs6p4EZlpz0KgQtfjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 17:43:56 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::2532:fffd:e1e1:3bdc]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::2532:fffd:e1e1:3bdc%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 17:43:56 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Cox, Philip" <Philip.Cox@amd.com>, Oded Gabbay
 <oded.gabbay@gmail.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in
 switch statement
Thread-Topic: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in
 switch statement
Thread-Index: AQHVQFzD0k60V1DuYEWlKWHlkB78W6bWfGgAgABPVwCAAARmgIAAGTAA
Date: Mon, 22 Jul 2019 17:43:56 +0000
Message-ID: <fd20d447-dde0-a24d-8d63-d846accb5cc9@amd.com>
References: <20190721225920.GA18099@embeddedor>
 <c735a1cc-a545-50fb-44e7-c0ad93ee8ee7@amd.com>
 <BN6PR12MB18098741A081711936563597F7C40@BN6PR12MB1809.namprd12.prod.outlook.com>
 <b1feb7e5-bd52-ef1b-b72e-b98b2c954b89@embeddedor.com>
In-Reply-To: <b1feb7e5-bd52-ef1b-b72e-b98b2c954b89@embeddedor.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45840885-27a7-461e-89e2-08d70ecc2bc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3466; 
x-ms-traffictypediagnostic: DM6PR12MB3466:
x-microsoft-antispam-prvs: <DM6PR12MB3466EB37A2A9080FD6CD3B83F4C40@DM6PR12MB3466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:305;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(199004)(189003)(8936002)(102836004)(186003)(14444005)(66066001)(65956001)(256004)(65806001)(2616005)(476003)(66556008)(11346002)(446003)(66446008)(66946007)(64756008)(66476007)(26005)(5660300002)(2906002)(36756003)(229853002)(71190400001)(71200400001)(53546011)(386003)(6506007)(76176011)(31686004)(52116002)(4326008)(486006)(68736007)(86362001)(6436002)(6512007)(3846002)(6116002)(6486002)(53936002)(110136005)(81166006)(81156014)(64126003)(65826007)(14454004)(25786009)(6246003)(305945005)(99286004)(7736002)(478600001)(31696002)(316002)(54906003)(8676002)(58126008)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3466;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lv54kfGQJ/1EQ2o3x5vOG39u4qKSaSB9PhiipbRZbUPEJ1H0ZBYqxAu3GtmNY9zOIUMqc/tvR8HyzsYtTQp4TKyfFAFMqKEXnvW/OHCoKECDKs3KLPXQ/BP3Uf3Isug7jS5OTkSA3KPcxbHZxfbJEPiqi9XNtwrrfZe2VLlZgYhZReiQ6fOKNceyx6kw9ZnZobL44nDe36zrdO5Ky5VQYqSAsssok0nucQZxHIdrOPNKfCB9uHLCeBPQhn7oPNCRzMGai79gSFY9O6gRawARmfSMLpOB6EuqSSCjkZ7jOhO5jwV3gYosByJBxUujIC/iSv8dYsqgApeP1EFwdHH/YJNmM6m2NwpWgqNI6oBpQ7fy/FFKpzvY0V6ml7aotjdBlLcGWtnMwNBCkL3LgfmSi0XOr0vE/H5NGkpkCv/L/DQ=
Content-ID: <988882E2B639C74B889D4B8FD45F7B31@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45840885-27a7-461e-89e2-08d70ecc2bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 17:43:56.9419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShaoyunL@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wz9Oq3jHYUDrU+vzUuNEx/znkkzRCOVFQVbyvG59/U=;
 b=11RgK0Fb3W7Pk0wzsO1BbzrUFLjeN7iMA/PtsTKX48hEXPEaHWNOXr1FL9U0mAx5ezaZoUhlpUCSOYvNQKM/g1oepbEO1fx0t3vF5IXjXk4oNiGs6f2btBEMdCHYqnk7S8yfU2rIe8Urv5tjaMq0yqnYrUxEo7VYYWoaqZ26Ja8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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

VGhhdCBzb3VuZHMgZ29vZCB0byBtZSAuCgpSZWdhcmRzCgpzaGFveXVuLmxpdQoKT24gMjAxOS0w
Ny0yMiAxMjoxMyBwLm0uLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+Cj4gT24gNy8yMi8x
OSAxMDo1OCBBTSwgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3RlOgo+PiBXZSBuZWVkIHRvIGFkZCBh
IC8qZmFsbCB0aHJvdWdoICovIGNvbW1lbnQgdGhlbi4KPj4KPiBJdCBtaWdodCBiZSBiZXR0ZXIg
dG8gcmVtb3ZlIHRoZSBjYWxsIHRvIHByX2RlYnVnKCkgaW4gS0ZEX01RRF9UWVBFX0NQOgo+Cj4g
CWNhc2UgS0ZEX01RRF9UWVBFX0NQOgo+ICAgICAgICAgCWNhc2UgS0ZEX01RRF9UWVBFX0NPTVBV
VEU6Cj4gCQlwcl9kZWJ1ZygiJXNAJWlcbiIsIF9fZnVuY19fLCBfX0xJTkVfXyk7Cj4gCQltcWQt
PmFsbG9jYXRlX21xZCA9IGFsbG9jYXRlX21xZDsKPgo+IFRoYW5rcwo+IC0tCj4gR3VzdGF2bwo+
Cj4KPj4gQWxleAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBGcm9tOiBM
aXUsIFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+Cj4+IFNlbnQ6IE1vbmRheSwgSnVseSAy
MiwgMjAxOSAxMToxNCBBTQo+PiBUbzogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJl
ZGRlZG9yLmNvbT47IENveCwgUGhpbGlwIDxQaGlsaXAuQ294QGFtZC5jb20+OyBPZGVkIEdhYmJh
eSA8b2RlZC5nYWJiYXlAZ21haWwuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1k
LmNvbT47IFpob3UsIERhdmlkKENodW5NaW5nKSA8RGF2aWQxLlpob3VAYW1kLmNvbT47IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0v
YW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTA6IEZpeCBtaXNzaW5nIGJyZWFrIGluIHN3aXRjaCBz
dGF0ZW1lbnQKPj4KPj4gVGhpcyBvbmUgcHJvcGVybHkgaW4gcHVycG9zZSAsIFRoZSBtcWQgaW5p
dCBmb3IgQ1AgYW5kICBDT01QVVRFIHdpbGwKPj4gaGF2ZSB0aGUgc2FtZSAgcm91dGluZSAuCj4+
Cj4+IFJlZ2FyZAo+Pgo+PiBzc2hhb3l1bi5saXUKPj4KPj4gT24gMjAxOS0wNy0yMSA2OjU5IHAu
bS4sIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4+PiBBZGQgbWlzc2luZyBicmVhayBzdGF0
ZW1lbnQgaW4gb3JkZXIgdG8gcHJldmVudCB0aGUgY29kZSBmcm9tIGZhbGxpbmcKPj4+IHRocm91
Z2ggdG8gY2FzZSBLRkRfTVFEX1RZUEVfQ09NUFVURS4KPj4+Cj4+PiBUaGlzIGJ1ZyB3YXMgZm91
bmQgdGhhbmtzIHRvIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4+PiAtV2ltcGxpY2l0
LWZhbGx0aHJvdWdoLgo+Pj4KPj4+IEZpeGVzOiAxNDMyOGFhNThjZTUgKCJkcm0vYW1ka2ZkOiBB
ZGQgbmF2aTEwIHN1cHBvcnQgdG8gYW1ka2ZkLiAodjMpIikKPj4+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZv
QGVtYmVkZGVkb3IuY29tPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgfCAxICsKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
bXFkX21hbmFnZXJfdjEwLmMKPj4+IGluZGV4IDRmOGE2ZmZjNTc3NS4uMWQ4YjEzYWQ0NmY5IDEw
MDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2Vy
X3YxMC5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFn
ZXJfdjEwLmMKPj4+IEBAIC00MzAsNiArNDMwLDcgQEAgc3RydWN0IG1xZF9tYW5hZ2VyICptcWRf
bWFuYWdlcl9pbml0X3YxMChlbnVtIEtGRF9NUURfVFlQRSB0eXBlLAo+Pj4gICAgICAgICBzd2l0
Y2ggKHR5cGUpIHsKPj4+ICAgICAgICAgY2FzZSBLRkRfTVFEX1RZUEVfQ1A6Cj4+PiAgICAgICAg
ICAgICAgICAgcHJfZGVidWcoIiVzQCVpXG4iLCBfX2Z1bmNfXywgX19MSU5FX18pOwo+Pj4gKyAg
ICAgICAgICAgICBicmVhazsKPj4+ICAgICAgICAgY2FzZSBLRkRfTVFEX1RZUEVfQ09NUFVURToK
Pj4+ICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXNAJWlcbiIsIF9fZnVuY19fLCBfX0xJTkVf
Xyk7Cj4+PiAgICAgICAgICAgICAgICAgbXFkLT5hbGxvY2F0ZV9tcWQgPSBhbGxvY2F0ZV9tcWQ7
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
