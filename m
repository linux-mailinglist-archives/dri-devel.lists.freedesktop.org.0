Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D27EAA1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 05:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A706E88D;
	Fri,  2 Aug 2019 03:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730087.outbound.protection.outlook.com [40.107.73.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04916E88D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 03:19:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaBcD2mxCSw2jd+aj1UdB7kt3oLJrnBqh7Y2P8DzW9GMa3QiIgQwEIabxW7X1TwxZF1TYvfx+pirufP7P6hvMWzehYmTiRLWPo05nVxP0dkls0Ay+A9D0s22JKep6OrKAVq/Cl2xYMuL2eu2wiSU74Dud470MetUqfAPALH/+d+IBgljJfyMwExy/phqdWhd0GQcRkx1jJflp2yk032Bf/zqwpufFA94CdTqO1GAC6fqH1p1+PyAiP0rrJg9JMpPoSw7ZQEqYuqiyCuCp3IUyJgNb7EdpkYoQ4Kc14QDd5uEthjCCQCsfDJPxRaU4Gad69pLvQGvLhH9hK62pY9PdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0vzn3cGlMWM7yPb5T6B20qLGSow4XOcTFxmUilbT9o=;
 b=HlNbQp1TdhsTsrs86hyy9Zsdd+L1rMZtxQP5qi4mYCvMo1rltV2nnh9HYrBXh0qOONW9FBEKnLteSHRDfTOza6GWmTL6VsWuLr/g+dAwqAmWcq1V0e14Em891t8khT57ymZqatv6dCBAb34J02IpfrUPcpPVMQKzGhULE+C4CzvUt+4tY6K4GOXpYPnaBiAILCc7inMbZ/AK3PQoZOBGgTGWAG9FkuDCJSDHfxx+3CQvOt3LX3NvjOY6ddmFYATaKJiELisCjUhGJ882FUKTvY0Tkuq+PfNioY8kC1bfsyEpkvO11nxhz3v3BILHvQmuiSdT+UoIuWhxlpi7etEejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3839.namprd12.prod.outlook.com (10.255.237.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Fri, 2 Aug 2019 03:18:59 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::889b:34f1:1aaa:1e67]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::889b:34f1:1aaa:1e67%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 03:18:59 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: RE: Threaded submission & semaphore sharing
Thread-Topic: Threaded submission & semaphore sharing
Thread-Index: AQHVSKsItBD23/yNuUCwQwovFKuxFabnLvvA
Date: Fri, 2 Aug 2019 03:18:59 +0000
Message-ID: <MN2PR12MB29103E4B1ABDD9A9A40EF8F6B4D90@MN2PR12MB2910.namprd12.prod.outlook.com>
References: <e8063826-a38b-e1d3-fe8b-63202b8bd264@intel.com>
In-Reply-To: <e8063826-a38b-e1d3-fe8b-63202b8bd264@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81cd4cd7-7096-4253-d226-08d716f8296d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3839; 
x-ms-traffictypediagnostic: MN2PR12MB3839:
x-microsoft-antispam-prvs: <MN2PR12MB383967D26591ED3EE280EA21B4D90@MN2PR12MB3839.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(189003)(199004)(13464003)(110136005)(26005)(66446008)(66476007)(66556008)(64756008)(66946007)(316002)(7696005)(186003)(53546011)(8676002)(2906002)(14454004)(66066001)(6506007)(76116006)(55016002)(102836004)(486006)(68736007)(99286004)(81156014)(6436002)(446003)(7736002)(11346002)(8936002)(305945005)(476003)(81166006)(25786009)(76176011)(74316002)(478600001)(53936002)(6116002)(5660300002)(3846002)(6246003)(71190400001)(229853002)(256004)(33656002)(86362001)(9686003)(52536014)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3839;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iph6AKwxK/KURy+HQC2eFfk2IiU52/0MKr8YLo6irzcYLUAqjYP/7LUR0oz9R98uQChdPFCVDEVeZ+ekDAnOcdekHo3uU+xGG8mtkCTVwntXPrruZz1E1FxicDoFt/hQ+H48oI9YNO6ilQdB1FsAJHfeN+36fNIpCXegBn5qAmhwYtL2w1jFFZYDbFmZMaRdl9/0jHk7Wv0tSU8De38u7AtiF6fJ3gfnyfy0I+4MK+jPikNb0mj8fRg1Xm2yTEs4rzyGJlGgwbOf8TRnn+PBAPWHwq3pzYGVr0AG2YKZ/my50idnJmyrbvVQyK3B3b/yS+aKMddgGfCU1pG7brSBB+60EN7EAYRVWyKfW/Mw2O/UB6XOEXnwvubDlWnwc+XUqNrFNM8Gk4GYQiGZGpwuu+eTNrSjGxISPgHSGD+WnK0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cd4cd7-7096-4253-d226-08d716f8296d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 03:18:59.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0vzn3cGlMWM7yPb5T6B20qLGSow4XOcTFxmUilbT9o=;
 b=y6otYKrAiieSJsfFpYriSNfSCIStIkSjUrdXmTbWHxi8TuE7BrBMMgaYe3MTMOTpDfghcoN9E3LMe+fFqH3wsAUrbW6QGJ9EKokdjqTfNFzyu0aOV0bUTiOawIxMFytB7/sXfGcfBRQLT6F2b/DOni/ywsUifEFdJWdFe6m8gXs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

SGkgTGlvbmVsLA0KDQpCeSB0aGUgUXVldWUgdGhyZWFkIGlzIGEgaGVhdnkgdGhyZWFkLCB3aGlj
aCBpcyBhbHdheXMgcmVzaWRlbnQgaW4gZHJpdmVyIGR1cmluZyBhcHBsaWNhdGlvbiBydW5uaW5n
LCBvdXIgZ3V5cyBkb24ndCBsaWtlIHRoYXQuIFNvIHdlIHN3aXRjaCB0byBTZW1hcGhvcmUgVGhy
ZWFkLCBvbmx5IHdoZW4gd2FpdEJlZm9yZVNpZ25hbCBvZiB0aW1lbGluZSBoYXBwZW5zLCB3ZSBz
cGF3biBhIHRocmVhZCB0byBoYW5kbGUgdGhhdCB3YWl0LiBTbyB3ZSBkb24ndCBoYXZlIHlvdXIg
dGhpcyBpc3N1ZS4NCkJ5IHRoZSB3YXksIEkgYWxyZWFkeSBwYXNzIGFsbCB5b3VyIENUUyBjYXNl
cyBmb3Igbm93LiBJIHN1Z2dlc3QgeW91IHRvIHN3aXRjaCB0byBTZW1hcGhvcmUgVGhyZWFkIGlu
c3RlYWQgb2YgUXVldWUgVGhyZWFkIGFzIHdlbGwuIEl0IHdvcmtzIHZlcnkgd2VsbC4NCg0KLURh
dmlkDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMaW9uZWwgTGFuZHdlcmxp
biA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+IA0KU2VudDogRnJpZGF5LCBBdWd1c3Qg
MiwgMjAxOSA0OjUyIEFNDQpUbzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFpo
b3UsIERhdmlkKENodW5NaW5nKSA8RGF2aWQxLlpob3VAYW1kLmNvbT47IEphc29uIEVrc3RyYW5k
IDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4NClN1YmplY3Q6IFRocmVhZGVkIHN1Ym1pc3Npb24gJiBz
ZW1hcGhvcmUgc2hhcmluZw0KDQpIaSBDaHJpc3RpYW4sIERhdmlkLA0KDQpTb3JyeSB0byByZXBv
cnQgdGhpcyBzbyBsYXRlIGluIHRoZSBwcm9jZXNzLCBidXQgSSB0aGluayB3ZSBmb3VuZCBhbiBp
c3N1ZSBub3QgZGlyZWN0bHkgcmVsYXRlZCB0byBzeW5jb2JqIHRpbWVsaW5lcyB0aGVtc2VsdmVz
IGJ1dCB3aXRoIGEgc2lkZSBlZmZlY3Qgb2YgdGhlIHRocmVhZGVkIHN1Ym1pc3Npb25zLg0KDQpF
c3NlbnRpYWxseSB3ZSdyZSBmYWlsaW5nIGEgdGVzdCBpbiBjcnVjaWJsZSA6IA0KZnVuYy5zeW5j
LnNlbWFwaG9yZS1mZC5vcGFxdWUtZmQNClRoaXMgdGVzdCBjcmVhdGUgYSBzaW5nbGUgYmluYXJ5
IHNlbWFwaG9yZSwgc2hhcmVzIGl0IGJldHdlZW4gMiBWa0RldmljZS9Wa1F1ZXVlLg0KVGhlbiBp
biBhIGxvb3AgaXQgcHJvY2VlZHMgdG8gc3VibWl0IHdvcmtsb2FkIGFsdGVybmF0aW5nIGJldHdl
ZW4gdGhlIDIgVmtRdWV1ZSB3aXRoIG9uZSBzdWJtaXQgZGVwZW5kaW5nIG9uIHRoZSBvdGhlci4N
Ckl0IGRvZXMgc28gYnkgd2FpdGluZyBvbiB0aGUgVmtTZW1hcGhvcmUgc2lnbmFsZWQgaW4gdGhl
IHByZXZpb3VzIGl0ZXJhdGlvbiBhbmQgcmVzaWduYWxpbmcgaXQuDQoNClRoZSBwcm9ibGVtIGZv
ciB1cyBpcyB0aGF0IG9uY2UgdGhpbmdzIGFyZSBkaXNwYXRjaGVkIHRvIHRoZSBzdWJtaXNzaW9u
IHRocmVhZCwgdGhlIG9yZGVyaW5nIG9mIHRoZSBzdWJtaXNzaW9uIGlzIGxvc3QuDQpCZWNhdXNl
IHdlIGhhdmUgMiBkZXZpY2VzIGFuZCB0aGV5IGJvdGggaGF2ZSB0aGVpciBvd24gc3VibWlzc2lv
biB0aHJlYWQuDQoNCkphc29uIHN1Z2dlc3RlZCB0aGF0IHdlIHJlZXN0YWJsaXNoIHRoZSBvcmRl
cmluZyBieSBoYXZpbmcgc2VtYXBob3Jlcy9zeW5jb2JqcyBjYXJyeSBhbiBhZGRpdGlvbmFsIHVp
bnQ2NF90IHBheWxvYWQuDQpUaGlzIDY0Yml0IGludGVnZXIgd291bGQgcmVwcmVzZW50IGJlIGFu
IGlkZW50aWZpZXIgdGhhdCBzdWJtaXNzaW9uIHRocmVhZHMgd2lsbCBXQUlUX0ZPUl9BVkFJTEFC
TEUgb24uDQoNClRoZSBzY2VuYXJpbyB3b3VsZCBsb29rIGxpa2UgdGhpcyA6DQogwqDCoMKgIC0g
dmtRdWV1ZVN1Ym1pdChxdWV1ZUEsIHNpZ25hbCBvbiBzZW1BKTsNCiDCoMKgwqAgwqDCoMKgIC0g
aW4gdGhlIGNhbGxlciB0aHJlYWQsIHRoaXMgd291bGQgaW5jcmVtZW50IHRoZSBzeW5jb2JqIGFk
ZGl0aW9uYWwgdTY0IHBheWxvYWQgYW5kIHJldHVybiBpdCB0byB1c2Vyc3BhY2UuDQogwqDCoMKg
IMKgwqDCoCAtIGF0IHNvbWUgcG9pbnQgdGhlIHN1Ym1pc3Npb24gdGhyZWFkIG9mIHF1ZXVlQSBz
dWJtaXRzIHRoZSB3b3JrbG9hZCBhbmQgc2lnbmFsIHRoZSBzeW5jb2JqIG9mIHNlbUEgd2l0aCB2
YWx1ZSByZXR1cm5lZCBpbiB0aGUgY2FsbGVyIHRocmVhZCBvZiB2a1F1ZXVlU3VibWl0KCkuDQog
wqDCoMKgIC0gdmtRdWV1ZVN1Ym1pdChxdWV1ZUIsIHdhaXQgb24gc2VtQSk7DQogwqDCoMKgIMKg
wqDCoCAtIGluIHRoZSBjYWxsZXIgdGhyZWFkLCB0aGlzIHdvdWxkIHJlYWQgdGhlIHN5bmNvYmog
YWRkaXRpb25hbA0KdTY0IHBheWxvYWQNCiDCoMKgwqAgwqDCoMKgIC0gYXQgc29tZSBwb2ludCB0
aGUgc3VibWlzc2lvbiB0aHJlYWQgb2YgcXVldWVCIHdpbGwgdHJ5IHRvIHN1Ym1pdCB0aGUgd29y
aywgYnV0IGZpcnN0IGl0IHdpbGwgV0FJVF9GT1JfQVZBSUxBQkxFIHRoZSB1NjQgdmFsdWUgcmV0
dXJuZWQgaW4gdGhlIHN0ZXAgYWJvdmUNCg0KQmVjYXVzZSB3ZSB3YW50IHRoZSBiaW5hcnkgc2Vt
YXBob3JlcyB0byBiZSBzaGFyZWQgYWNyb3NzIHByb2Nlc3NlcyBhbmQgd291bGQgbGlrZSB0aGlz
IHRvIHJlbWFpbiBhIHNpbmdsZSBGRCwgdGhlIHNpbXBsZXN0IGxvY2F0aW9uIHRvIHN0b3JlIHRo
aXMgYWRkaXRpb25hbCB1NjQgcGF5bG9hZCB3b3VsZCBiZSB0aGUgRFJNIHN5bmNvYmouDQpJdCB3
b3VsZCBuZWVkIGFuIGFkZGl0aW9uYWwgaW9jdGwgdG8gcmVhZCAmIGluY3JlbWVudCB0aGUgdmFs
dWUuDQoNCldoYXQgZG8geW91IHRoaW5rPw0KDQotTGlvbmVsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
