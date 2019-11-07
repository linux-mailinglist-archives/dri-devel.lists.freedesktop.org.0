Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6075FF2A7E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 10:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450EC6F3C7;
	Thu,  7 Nov 2019 09:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733CC6F3C5;
 Thu,  7 Nov 2019 09:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJvFdTW70HNU45Nbg86kkvmA9H37sGgPvufZr/7tUyvFXuJWQi1fF6vgALPHP9OalqWYph7ikbKh/B1dDSQs9wjjorpM7EhjB9lFp5K0X5CLBsM+POXMB0UTUwGj8pdS9N3OEt43tdSTOb4YOuyDkzHTdeQygvpRHzuPU66c6EbH1rKfYH5RPcvpNsPBOx1/R56u5TW4wcRS2qvpBLtCuErjitLdjYh9Fwwxh44wcNgEruiOw8m0OTNJsbj1xEdtCOLiJhb3PDMpWti136eFaV79zPRIULBC3h7mmxVI+DdNCh/FUPWR/J+AwqcEkbrkLwfeLw6PItTZJvNwOUmPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgUlpsnV77qQgNN4dj8wt7N9+mojCgflftDzSmOXtvM=;
 b=DZnYuqZ1eixCVunCS7Pn8IvbXx/j8gj+RbouIaj86+vK/raD59uhEuBp3ztdxNQ3vWoU3AChEP6wfWX5qDSRvkmQjOxBZi39PiLfDso5mVaIFfQZGduh5vuPi1GP+gMwsmLuG2ZkvMFxrSjOpQ9BbsU5b5LbyF2NdDMr3EmnZB+KReRhjNIg6KAZ3a9NFranyQSc6WsrTqE7/Igo8rb2EsZmvv4rLVl5dLzJMCAQkkdRF2cqIS/TXvTHptE5nDKOT3Y9LtIM/qEo4/0El9zC3rDeNIXg17KGFSecnxslRcoSCN5Vl7BaL0X6z+fUHVREnY5N1JOB/EydMRXiaed8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1707.namprd12.prod.outlook.com (10.175.86.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Thu, 7 Nov 2019 09:24:26 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 09:24:25 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH 1/4] Revert "drm/amdgpu: dont schedule jobs while in reset"
Thread-Topic: [PATCH 1/4] Revert "drm/amdgpu: dont schedule jobs while in
 reset"
Thread-Index: AQHVlMrOykUK6HDuYkilm6euiTO/16d/cK8A
Date: Thu, 7 Nov 2019 09:24:25 +0000
Message-ID: <f04113d4-03af-bdfa-3c2c-6021a74df1f3@amd.com>
References: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0031.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::44) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e0a09166-4ef5-45d7-232b-08d763644827
x-ms-traffictypediagnostic: DM5PR12MB1707:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB17073C40F22869AAB62C1BE483780@DM5PR12MB1707.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(6636002)(14454004)(71190400001)(71200400001)(99286004)(2616005)(6246003)(476003)(4326008)(52116002)(450100002)(6436002)(478600001)(76176011)(11346002)(6512007)(446003)(316002)(486006)(86362001)(58126008)(37006003)(386003)(6506007)(305945005)(66946007)(66476007)(66446008)(64756008)(66556008)(54906003)(31696002)(7736002)(2906002)(186003)(25786009)(5660300002)(6486002)(14444005)(256004)(31686004)(66574012)(8936002)(8676002)(36756003)(229853002)(6116002)(6862004)(102836004)(81156014)(46003)(65806001)(65956001)(81166006)(192303002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1707;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OjMgjo7CS6z7Er6QipunQvyVqYD/2vOjLxEbi/TuiiJuSHiT/Kr/mwHzK2uLsFv2bWxsOqh1K650JTgy/H0HeaO/7q+4UL5Lse0SaH2kd96xQsUlXbVyZow2Mas1do/95x9jbQ3L7i+ZLke2+NWVGJ8dvW01Fxr/niWyIzt5TZ93uoXM+to3WAnAm4HvpMnDXEyOjJ3U/1SxDeL++xDARfnae/kFeYavGyw21mz2sPKYNh1yRokcQuOfqOSTPdTkdMQgzkcr8hAdimLn9roE8mnfa7+mJNbCifAlhG2lAKUPonGKPsEBtBtT/P8RrShel3EFoKVwSSQmQ5xozySJxXDZBbLZc28VfgmQZjCc0fq14+N9mLqKvinZ0lqIEAfDbo2CZ7BhtNcxZzJDxpeFZvOl90HnkEg7/svkoVRx1Kf6zvC0wyaiLlwf2gDE5Eok
Content-ID: <C03DD884F18EFD4A8B29FE911B1A7764@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a09166-4ef5-45d7-232b-08d763644827
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 09:24:25.6897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8QS9yC6H07fyY9fpUHuhs1mBedgWjo93I3F8TzOPg5tGVRCot4wawegT8kVhi8M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgUlpsnV77qQgNN4dj8wt7N9+mojCgflftDzSmOXtvM=;
 b=aulE9ybBROFCrnIWQaSZKypzK3zXiu35FPr98JUkyNpQQ/QmhivLQ/bcgxslH2hZgyrEZtBbrYXTITdrSHpfWHAr65kZKVTITzuw88ijHN7V3nS1u6PiA1tQr/8CpK1skkYIuU7qwAID29mC4bteKyFdHL0WCNodql6R7RPF42s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMTEuMTkgdW0gMTg6NTEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToNCj4gVGhpcyBy
ZXZlcnRzIGNvbW1pdCAzY2RmOWJkMDA4OTcyM2M0NjhkNWY2MjQwZTU0ZDFhZmE1MmU5YTA0Lg0K
Pg0KPiBXZSB3aWxsIGRvIGEgcHJvcGVyIGZpeCBpbiBuZXh0IHBhdGNoLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCg0K
VGhlIG9yZGVyIG9mIHRoaXMgb25lIGFuZCBwYXRjaCAjMiBuZWVkcyB0byBiZSBzd2FwcGVkLCBv
ciBvdGhlcndpc2Ugd2UgDQpoYXZlIHRoZSBidWcgaW4gYmV0d2VlbiB0aG9zZSB0d28gY29tbWl0
cyBhZ2Fpbi4NCg0KQXBhcnQgZnJvbSB0aGF0IHRoZSBzZXJpZXMgaXMgUmV2aWV3ZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgDQo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4NCg0KVGhhbmtzLA0K
Q2hyaXN0aWFuLg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jdHguYyB8IDUgKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQg
ZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMN
Cj4gaW5kZXggMmNkYWYzYi4uNjYxNGQ4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9jdHguYw0KPiBAQCAtNjA0LDExICs2MDQsOCBAQCB2b2lkIGFtZGdwdV9jdHhf
bWdyX2VudGl0eV9maW5pKHN0cnVjdCBhbWRncHVfY3R4X21nciAqbWdyKQ0KPiAgIAkJCWNvbnRp
bnVlOw0KPiAgIAkJfQ0KPiAgIA0KPiAtCQlmb3IgKGkgPSAwOyBpIDwgbnVtX2VudGl0aWVzOyBp
KyspIHsNCj4gLQkJCW11dGV4X2xvY2soJmN0eC0+YWRldi0+bG9ja19yZXNldCk7DQo+ICsJCWZv
ciAoaSA9IDA7IGkgPCBudW1fZW50aXRpZXM7IGkrKykNCj4gICAJCQlkcm1fc2NoZWRfZW50aXR5
X2ZpbmkoJmN0eC0+ZW50aXRpZXNbMF1baV0uZW50aXR5KTsNCj4gLQkJCW11dGV4X3VubG9jaygm
Y3R4LT5hZGV2LT5sb2NrX3Jlc2V0KTsNCj4gLQkJfQ0KPiAgIAl9DQo+ICAgfQ0KPiAgIA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
