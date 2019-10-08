Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117FBCFC3A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4554C6E7D2;
	Tue,  8 Oct 2019 14:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810088.outbound.protection.outlook.com [40.107.81.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EB66E7D2;
 Tue,  8 Oct 2019 14:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9qgNtn1UXpb7wqMPbwSeTGD788TSwDTrWsYKekwgTnbMZMPxbRIvOdpDZaMOTneqrd4p+glEGkHCgftsIXaWLPd/29sgld9nRdJ15Kn8VmugAUO2xvNbDFcUgBAvtYyUFdIIicYX62ekM1KPo4TeLcwFNf39lX7jrUWjJBgybLUDYi23vix3gH5tiJJVZvxfb+eo3Md6mH/8HcqzPr5v3odTvg8d4sHLhtUFNhbsJ6rBMCXDUDHF0tkyl6+8vm5y0TF8ZA1iUGt43XRdBw3CuPTdA9ba4YtLRvTNlbuv50IqAOt/3o2oC1URSghGEl4uWKVwNSrLwHRXcbrmaqiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv5jqfljkOrEZnwzYe0DvzctcO3O5bfpu7WYT4IIimg=;
 b=I2iUlMvzpRWDFWKINNt3RPspzqxvnEXG0x1p2R/PW2YWdbtPf0DonwG4fIEUDpSLknQsQF/EfWC0yP+uau/og6oOjUCNsfAXfw/O4vxqz2wIbcZvbhIq2eNH673hCJ0loa0/NouKxUIexzhaLq6ofy0Fb9EDYk0zujfynzrD7HZYvxN4gfumiISnjUZJqu9Af0MOzysZafqWfqRVsHYCAnh7bdHQTHLt4A2MQQuFB+CYGFrCTD4ePmMbL+LqSWTX2x2rJjnoT7G877Sq8t8fUzG+EOVjv3l8vaRv7SqKJO/mUGHaIGMvxrUL0hNcC6cUkKiqJhaGLeGCgNfj/fMkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0149.namprd12.prod.outlook.com (10.172.78.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 14:20:28 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 14:20:28 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Joe Perches <joe@perches.com>, Colin King <colin.king@canonical.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: make various arrays static, makes
 object smaller
Thread-Topic: [PATCH] drm/amdgpu/display: make various arrays static, makes
 object smaller
Thread-Index: AQHVfVpui/Yh/EJ0Nk64F3CjP4dHw6dQxXKAgAABQYCAAAWkAA==
Date: Tue, 8 Oct 2019 14:20:27 +0000
Message-ID: <128afe86-e426-3596-4d91-a8cc19e19a21@amd.com>
References: <20191007215857.14720-1-colin.king@canonical.com>
 <9579bfae-1db5-d282-79ea-df1966f4c123@amd.com>
 <05e9cf0254790321433fd7d2c19129ec952bb3ac.camel@perches.com>
In-Reply-To: <05e9cf0254790321433fd7d2c19129ec952bb3ac.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72e497da-731b-498b-7eb9-08d74bfaaae0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0149:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01492CBD7EB689CCCAA6EF2C8C9A0@CY4PR1201MB0149.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(189003)(199004)(66476007)(64756008)(66556008)(3846002)(36756003)(66446008)(65806001)(65956001)(66066001)(99286004)(256004)(4326008)(6116002)(2906002)(66946007)(81166006)(31696002)(81156014)(2201001)(8676002)(8936002)(71200400001)(5660300002)(71190400001)(4744005)(53546011)(26005)(6506007)(6246003)(386003)(305945005)(2616005)(476003)(446003)(186003)(2501003)(11346002)(110136005)(54906003)(486006)(102836004)(31686004)(76176011)(316002)(25786009)(58126008)(6486002)(14454004)(478600001)(7736002)(6436002)(229853002)(52116002)(6512007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0149;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yGCte9BQbJ1iGUzGn9r+r7gpro2ZD0JVDyf+GbMXtcBvNDBp+/zDEkVwGSZGiXjB7HVgFNCW7wlAwklyHpjgwMoS6hVwea2C7jxj5etZnD39qp+mVdhPZNJO5/XH/kzmSn+mhfGB4Y7sHIWtYntyC8ZQIWadziIAdjNqjYdgLQGFwif8sxMhad33BwZNV/LuRp6K6oDIVd3moGz/+p6i+rhyYpaENTckXknT1wucmAhbIOuRwk++Z2Wz5B97oPQCJXO0KWFk2PZVFJi1kqMPhgZTYMdTlTlOOPCBlxPXgit3dHauOt7b/guDPiV6YN11exk+1aisNpG5g/+2Ozg/2AZ/K1XHcGd/51Z2fevck7+5gRNYY4RZ81KGR28X+smyl+eCPp5/O0zgfTwTxnCNKJlKv9lf0YSiqiT8L66njDc=
Content-ID: <1FBFE8A44A4EEE4DB8DB9AA2D5F6FA62@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e497da-731b-498b-7eb9-08d74bfaaae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 14:20:27.9779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCBV/Ru0cLldujp/3FXhP0bvawWvFwrG/1cXE6Q0/Ii4mYqa8ax3hxosH6PZ3Drs/l0HMLTYL9egKe+bOiqUdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv5jqfljkOrEZnwzYe0DvzctcO3O5bfpu7WYT4IIimg=;
 b=nWXnxTUofWdLvuRJFzcpjLttf6VD7w707P2aqs7aRY4Ze7PcekpULYGFhInHAyf34tUSIyP8ig5aGzKRtB3IO3fKtv5FypZVdGtEXwvdfOAbHRgAN6grhy1TsFjki7Vwl6Rl4W2e81aAFGH/uweITp7ZKJsAWRBBvrb7MLMovXE=
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wOCAxMDowMCBhLm0uLCBKb2UgUGVyY2hlcyB3cm90ZToNCj4gT24gVHVlLCAy
MDE5LTEwLTA4IGF0IDEzOjU2ICswMDAwLCBIYXJyeSBXZW50bGFuZCB3cm90ZToNCj4gW10NCj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19w
YXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2Vy
LmMNCj4+IFtdDQo+Pj4gQEAgLTI3NDUsNyArMjc0NSw3IEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3Vs
dCBiaW9zX2dldF9ib2FyZF9sYXlvdXRfaW5mbygNCj4+PiAgCXN0cnVjdCBiaW9zX3BhcnNlciAq
YnA7DQo+Pj4gIAllbnVtIGJwX3Jlc3VsdCByZWNvcmRfcmVzdWx0Ow0KPj4+ICANCj4+PiAtCWNv
bnN0IHVuc2lnbmVkIGludCBzbG90X2luZGV4X3RvX3ZiaW9zX2lkW01BWF9CT0FSRF9TTE9UU10g
PSB7DQo+Pj4gKwlzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHNsb3RfaW5kZXhfdG9fdmJpb3Nf
aWRbTUFYX0JPQVJEX1NMT1RTXSA9IHsNCj4+DQo+PiBXb24ndCB0aGlzIGJyZWFrIHRoZSBtdWx0
aS1HUFUgY2FzZSB3aGVyZSB5b3UnbGwgaGF2ZSBtdWx0aXBsZSBkcml2ZXINCj4+IGluc3RhbmNl
cyB3aXRoIGRpZmZlcmVudCBsYXlvdXQ/DQo+IA0KPiBBcyB0aGUgYXJyYXkgaXMgcmVhZC1vbmx5
LCBob3cgY291bGQgdGhhdCBoYXBwZW4/DQo+IA0KDQpZb3UncmUgcmlnaHQuDQoNClBhdGNoIGlz
DQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQoN
CkhhcnJ5DQoNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
