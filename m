Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9FB9EA4B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3AC89B49;
	Tue, 27 Aug 2019 14:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760074.outbound.protection.outlook.com [40.107.76.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C583B89B27;
 Tue, 27 Aug 2019 14:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rqrj1iCIL1StmuBOjsl/CN6/mLYvm0qwZmyBgVvWOtmYWVAT7nsFRgDPkGQkTJKpxFgGDeWLTyoChqn+ME/e1j/ngGKnJJHiDTeg9BmHKXa4lS6rfqXjnxWIdoXmDSXV3Ah232M7LO6+r5D/0SivRDCRtcQk64L3t1ObtYn8PelDF+C02778aIS5Rm0qb7+XYit6rJLWEFi5VeGj+bSRUTQiNgX5nqUogMktEohKMIQHKXMVZyWkFiwMTrmCy7sF8k3knz72s43MqMiRoNX5J01hhWAp3con6P9EN25VnkNbaCl/beld/SJrlpZ/fda34Gum0hVysllfgLauJ9GKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FpO9otzaXcT3b8Blfu03PzLDpcrB5CsTj2qQZK3xxI=;
 b=NpUclHXZH5ZaZkgjxGqfAciOnabbLZNygoQnIGd5ImXvck9bpDPoeLhMMTIve5R951KWXUYZR0evX80X+q7H0H31I+WKUfLfrR9UtmiLDUCUns8q/B3JEhCLcbH2kTaXoWnMxGJ6A5PQ7EoCxSv3ZMEmBpTOznrpJXybgYeP3m/eCFyeurto0pr3mvNnqLQNG0ggZ8sPmh0LukxtdiKxbBcjLGwaE8ympaIfkKj6PQwod17XDS7CGo+M7S20+4AfgXDy+gUwspdJxk5d8KgqtzfE4B02Wsv30TM7zBlOa/hUs85ajZ0E5PxIPayV+0ShgG0GvpUnZtNAjnzkQI3Klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2548.namprd12.prod.outlook.com (10.172.120.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 14:01:25 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2199.021; Tue, 27 Aug
 2019 14:01:25 +0000
From: Harry Wentland <hwentlan@amd.com>
To: YueHaibing <yuehaibing@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Koo, Anthony"
 <Anthony.Koo@amd.com>, "Othman, Ahmad" <Ahmad.Othman@amd.com>, "Bernstein,
 Eric" <Eric.Bernstein@amd.com>, "Cyr, Aric" <Aric.Cyr@amd.com>,
 "alvin.lee3@amd.com" <alvin.lee3@amd.com>, "Tatla, Harmanprit"
 <Harmanprit.Tatla@amd.com>
Subject: Re: [PATCH 2/3] drm/amd/display: remove unused function
 setFieldWithMask
Thread-Topic: [PATCH 2/3] drm/amd/display: remove unused function
 setFieldWithMask
Thread-Index: AQHVXKZr8rbdd/0oU0eIgB1sE0Ruk6cPBoMA
Date: Tue, 27 Aug 2019 14:01:24 +0000
Message-ID: <fb49a1d9-8405-4f88-6f9a-af863bd0f657@amd.com>
References: <20190827070925.16080-1-yuehaibing@huawei.com>
In-Reply-To: <20190827070925.16080-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::44) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3fe0bb5-76af-4305-00b8-08d72af70c2c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2548; 
x-ms-traffictypediagnostic: CY4PR1201MB2548:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2548B15632DB2E5127B118C18CA00@CY4PR1201MB2548.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:133;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(199004)(189003)(71190400001)(478600001)(53936002)(65806001)(71200400001)(66066001)(65956001)(31686004)(81156014)(81166006)(8676002)(5660300002)(6512007)(66946007)(6116002)(66556008)(66446008)(36756003)(8936002)(3846002)(6486002)(6506007)(6436002)(64756008)(186003)(52116002)(2501003)(19627235002)(31696002)(2906002)(386003)(6636002)(486006)(66476007)(6246003)(2201001)(2616005)(26005)(25786009)(476003)(110136005)(102836004)(446003)(14454004)(4326008)(99286004)(11346002)(54906003)(305945005)(229853002)(76176011)(256004)(316002)(58126008)(53546011)(7736002)(145543001)(145603002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2548;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4GUjn+sP0zfbw4CUk/Ie6gvpmHBx0WRwtDC+yz5lfvo5lSccWsxfKZsNoKOSNEVgxKhrjw3EZVYlAYHo/Kxea2BG+biJc0AFzEePbNhbm67DEwl6KS5eYgacf1uPlv1/OfQqK9GKgy5VNoJchp3l+BKCe3YjVw1W85651dv83AlzBckiV+AtMD0QtbLgqt0/IgIlP9bXzZKmWj4BShz4CG5dLXC+tGJDa94hzmhO9j3mqTbe9izkzUNNFe7AIG0wAiHjmhoG2fQAXQTnkaHD5WWSXs/eoySbRtYuC+/96smZ5vh4NNk0Jm5cYWER8TEfdtefgv+AsnSGWxSIAhi/RoUsQ8wgKRsmMxPgJIlqdMIknTakp6aZdf1hEofLzGAwT7ddoZ0+XcSfST3wmHO0wlV4MvP7IJ+iE1OIlNDXZJs=
Content-ID: <8B18C0D47B26414C958DE53BABAACDFA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fe0bb5-76af-4305-00b8-08d72af70c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 14:01:24.8432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqcuPiZPCLtQSRO00aqx/bThYpYhOaFeBXcDp0DOKfacJN6Z/vaj7pXhyh+4AIAd+ZuDnxT4mkK+w/GsAd0goQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2548
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FpO9otzaXcT3b8Blfu03PzLDpcrB5CsTj2qQZK3xxI=;
 b=B3p8egJ6AM4XxkT6v9EFtyFkNznyg0HnFNv2lHwqznkIZPb37ammMKOxDtlBde1XoTWLtLpgXgkno1cLUmtrzk2X0fQYc0SaZQVgs7+JxFSWq/GoF0Qn3hB51qQHEnIrSk9N1hycb5X6Vd+/pyzw0SDPuxIS+I7iTteslnDPnvw=
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

T24gMjAxOS0wOC0yNyAzOjA5IGEubS4sIFl1ZUhhaWJpbmcgd3JvdGU6DQo+IEFmdGVyIGNvbW1p
dCBhOWY1NGNlM2M2MDMgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yaW5nIFZURU0iKSwNCj4g
dGhlcmUgaXMgbm8gY2FsbGVyIGluIHRyZWUuDQo+IA0KPiBSZXBvcnRlZC1ieTogSHVsayBSb2Jv
dCA8aHVsa2NpQGh1YXdlaS5jb20+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJp
bmdAaHVhd2VpLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPg0KDQpIYXJyeQ0KDQo+IC0tLQ0KPiAgLi4uL2RybS9hbWQvZGlzcGxheS9t
b2R1bGVzL2luZm9fcGFja2V0L2luZm9fcGFja2V0LmMgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNr
ZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luZm9fcGFja2V0L2lu
Zm9fcGFja2V0LmMNCj4gaW5kZXggNWY0Yjk4ZC4uZDg4NWQ2NCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmZvX3BhY2tl
dC9pbmZvX3BhY2tldC5jDQo+IEBAIC0xMTQsMjUgKzExNCw2IEBAIGVudW0gQ29sb3JpbWV0cnlZ
Q0NEUCB7DQo+ICAJQ29sb3JpbWV0cnlZQ0NfRFBfSVRVMjAyMFlDYkNyICA9IDcsDQo+ICB9Ow0K
PiAgDQo+IC12b2lkIHNldEZpZWxkV2l0aE1hc2sodW5zaWduZWQgY2hhciAqZGVzdCwgdW5zaWdu
ZWQgaW50IG1hc2ssIHVuc2lnbmVkIGludCB2YWx1ZSkNCj4gLXsNCj4gLQl1bnNpZ25lZCBpbnQg
c2hpZnQgPSAwOw0KPiAtDQo+IC0JaWYgKCFtYXNrIHx8ICFkZXN0KQ0KPiAtCQlyZXR1cm47DQo+
IC0NCj4gLQl3aGlsZSAoISgobWFzayA+PiBzaGlmdCkgJiAxKSkNCj4gLQkJc2hpZnQrKzsNCj4g
LQ0KPiAtCS8vcmVzZXQNCj4gLQkqZGVzdCA9ICpkZXN0ICYgfm1hc2s7DQo+IC0JLy9zZXQNCj4g
LQkvL2RvbnQgbGV0IHZhbHVlIHNwYW4gcGFzdCBtYXNrDQo+IC0JdmFsdWUgPSB2YWx1ZSAmICht
YXNrID4+IHNoaWZ0KTsNCj4gLQkvL2luc2VydCB2YWx1ZQ0KPiAtCSpkZXN0ID0gKmRlc3QgfCAo
dmFsdWUgPDwgc2hpZnQpOw0KPiAtfQ0KPiAtDQo+ICB2b2lkIG1vZF9idWlsZF92c2NfaW5mb3Bh
Y2tldChjb25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0sDQo+ICAJCXN0cnVjdCBk
Y19pbmZvX3BhY2tldCAqaW5mb19wYWNrZXQpDQo+ICB7DQo+IA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
