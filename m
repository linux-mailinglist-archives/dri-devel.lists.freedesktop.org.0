Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19416AAB19
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 20:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287FD6E121;
	Thu,  5 Sep 2019 18:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740042.outbound.protection.outlook.com [40.107.74.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044906E121;
 Thu,  5 Sep 2019 18:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWhj6iW8uuwBdo/bdlFUwoPPqG+E2dna3EXpkb3PKVujneYhWLtZKrskwdzby813Tfcd8RtYacjmezTiFwY5C7i50HxpFc2FcgoaMf0JW24fYOef+5G6pb2EtCOZfJ3g8LOoiAvjtssyEfpnygQgrMx08Fc6oM+OzKajR2IKVIYpm3G3mnSB7zRjMNviOsLtZ6XPLYUFw/QlmoUsuneA3BgqBWTascq6mjt6+wBKOfQM5cBVc77Frw9Q1IE08yaBZXUqLgdmJsqH179wSgc77hefTfZPqJxggDXY2OLi2BhbGoH6X4p2PfpPT9IA8qqhllKL5ebjWL0nHo5UfjDCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=404TyObtbWVQSe9L2a1jKzpPw8N4sP9wkVhbyZoei8c=;
 b=X/3EZwFpx+HHX7FAITYdMSPKQwtxoHLGR30EUQmNUjLXeV7mydEsMLTbKtrtDadaUk1ivHJNGwbUQ4VvRWmOkqFiXKpq23bJ5jhcmHwlcAn8T/KwAR1ZYSfIOcA7CumuJd9tUd8brSI4I8cYuxz+N0kQPxpmh0v8HSK3LqCRtcPEWm16Hj1v6olSZsyyAcLl38qDa93UU3s6Iuj4psezvKT67iyxE/TGpzs7flN8jPiji+5+ayWunNwhrlLkeJOYhyuFtzLwQ69nrdqsG1upLUfrCS1Szi8DuqCY2i17ICCzA9NN10X9Ntu5i0jwPq+b7veenOOTkB+bgFRiunkAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2532.namprd12.prod.outlook.com (10.172.120.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 18:34:01 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 18:34:01 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Krzysztof Wilczynski <kw@linux.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amd/display: Move static keyword to the front of
 declaration
Thread-Topic: [PATCH] drm/amd/display: Move static keyword to the front of
 declaration
Thread-Index: AQHVZBhi2L6qhsoPZ0yUYciUFg8GBqcdaMOA
Date: Thu, 5 Sep 2019 18:34:01 +0000
Message-ID: <8b5de881-2109-6f75-68e3-9c8c743b483e@amd.com>
References: <20190905183306.32670-1-kw@linux.com>
In-Reply-To: <20190905183306.32670-1-kw@linux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:925f:916c::2]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::16) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd899465-f807-41d4-94b6-08d7322f9f02
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2532; 
x-ms-traffictypediagnostic: CY4PR1201MB2532:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB253203333A951592DAB3033E8CBB0@CY4PR1201MB2532.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(189003)(199004)(229853002)(4326008)(6116002)(305945005)(76176011)(2906002)(66446008)(64756008)(66556008)(66476007)(25786009)(6486002)(486006)(52116002)(81156014)(8676002)(2616005)(11346002)(446003)(7736002)(54906003)(476003)(81166006)(46003)(102836004)(99286004)(110136005)(58126008)(386003)(6506007)(53546011)(8936002)(316002)(186003)(65956001)(71190400001)(71200400001)(66946007)(31686004)(65806001)(6246003)(31696002)(53936002)(6436002)(478600001)(966005)(14454004)(256004)(36756003)(6306002)(6512007)(14444005)(5660300002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2532;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M/HvTlzfGEvVWR1QchDsz7bfeY6yO+MCgo0r5N/mFuLoK0B7XVFmVTdeAuLJSiGGIRGpXyXefrlbWbJQYiIokmbIGcdhf5Ukec8PV505rXbTJhaDFxw2JrEtQE6SFwu7rD5WdEJ1FT4V0Hrwcqruj+9jBLqHK+WK/c+faPw3Fef4Xdedu86M2dsviQzlBUHq0wBHYQPKvzW3koilnUlcRb6GnhAshFT+cZpYz6bBylcfHirzgnp3f3r3YGa2T02S2q7HKSrajv/bNbky7hLUGszGj6uK5komjNOUk8WI3s6X6INBSjdVe7nNCOlFPeCyv2N1r4wU3YYhN74BT32wjP9D60m0/Twyc7AIBwkrPzqfw/+CVF+JeyXAxer3LT0c8E2+PCqNH1gF9eIsSNns0flUw5eyNfFyj+VrKftgcFg=
Content-ID: <5BA5A1659CF21F4D800F07B7DDEDD308@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd899465-f807-41d4-94b6-08d7322f9f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 18:34:01.2631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqlAEHYIYUlTwcsWWaXmkeTQPNLf9Ge1T9JwEcR92LHTvXVY1/GIPuNwyc2l8sBGbEDyF9colEow45stQOwnKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=404TyObtbWVQSe9L2a1jKzpPw8N4sP9wkVhbyZoei8c=;
 b=sy+s6pB5S8vOh9Vh5UNjSdS56Vu5nuSCUqU++EyKYQ5qfZnmk9Eh2N0EW5lv0nmQGLYSpzW8NTSJ0ruDYIb27i0em+nxadxD14nRFRj8eDqRqWbs756hELupTk9/zAV3NpGZu1DHaxnBt1e3+x4Jo9MO1gcGPsCZGpYwkDtQv+Y=
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
Cc: "Park, Chris" <Chris.Park@amd.com>, "Yang, Eric" <Eric.Yang2@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Francis, 
 David" <David.Francis@amd.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, Aidan Wood <Aidan.Wood@amd.com>,
 "Laktyushkin, Dmytro" <Dmytro.Laktyushkin@amd.com>, "Cheng,
 Tony" <Tony.Cheng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lei, Jun" <Jun.Lei@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Koo, 
 Anthony" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wNSAyOjMzIHAubS4sIEtyenlzenRvZiBXaWxjenluc2tpIHdyb3RlOg0KPiBN
b3ZlIHRoZSBzdGF0aWMga2V5d29yZCB0byB0aGUgZnJvbnQgb2YgZGVjbGFyYXRpb24gb2YgRENf
QlVJTERfSUQsDQo+IGFuZCByZXNvbHZlIHRoZSBmb2xsb3dpbmcgY29tcGlsZXIgd2FybmluZyB0
aGF0IGNhbiBiZSBzZWVuIHdoZW4NCj4gYnVpbGRpbmcgd2l0aCB3YXJuaW5ncyBlbmFibGVkIChX
PTEpOg0KPiANCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3Jl
L2RjLmM6NzU6MTogd2FybmluZzoNCj4gICDigJhzdGF0aWPigJkgaXMgbm90IGF0IGJlZ2lubmlu
ZyBvZiBkZWNsYXJhdGlvbiBbLVdvbGQtc3R5bGUtZGVjbGFyYXRpb25dDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgV2lsY3p5bnNraSA8a3dAbGludXguY29tPg0KDQpSZXZpZXdlZC1i
eTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQoNCkhhcnJ5DQoNCj4g
LS0tDQo+IFJlbGF0ZWQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA4MjcyMzMwMTcu
R0s5OTg3QGdvb2dsZS5jb20NCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMN
Cj4gaW5kZXggODdjYTVhMjkwZDEyLi5hNWE4OWJjMGUxZDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYw0KPiBAQCAtNzIsNyArNzIsNyBAQA0KPiAgI2Rl
ZmluZSBEQ19MT0dHRVIgXA0KPiAgCWRjLT5jdHgtPmxvZ2dlcg0KPiAgDQo+IC1jb25zdCBzdGF0
aWMgY2hhciBEQ19CVUlMRF9JRFtdID0gInByb2R1Y3Rpb24tYnVpbGQiOw0KPiArc3RhdGljIGNv
bnN0IGNoYXIgRENfQlVJTERfSURbXSA9ICJwcm9kdWN0aW9uLWJ1aWxkIjsNCj4gIA0KPiAgLyoq
DQo+ICAgKiBET0M6IE92ZXJ2aWV3DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
