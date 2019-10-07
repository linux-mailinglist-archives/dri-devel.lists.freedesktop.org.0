Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84139CEC0C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 20:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE74E6E157;
	Mon,  7 Oct 2019 18:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810089.outbound.protection.outlook.com [40.107.81.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232C26E14D;
 Mon,  7 Oct 2019 18:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjIyEl4vAvPenrV8uVSPOssSFWqJWxLVdm+iX37Ii7c6HlLsSMRHvnu000Mhrek/Mr+26zGJ1or4rGhPLWksCaOeU04J7eTFKAF+8CkPeT2GCKdgWCRiVT2gE4RWtz/mw/3AtWDaf3gayJkJ1YbbHqIcK8gLsoKErh59oIvCiXff7Lf79x+lUA5q6D5jIC3JWA3ObUX0rYPvvTmkv7t+8j6jPlMlf/46O8pzOHKr7Z5K1Ulw5GssXAfYnzddiuaui7Z3HidP0fDiR9J1/P2WHGT1UE2iYQ51NdemrQ/sZNUBYaBLIvD5JptmcAjmVOPrRNJuDBxyuaGsK1+p96x7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvOoufkNTZTMl59dNEqRUMUULZ5QAQ7Hunl22Nf2VfM=;
 b=bHaSJV1/bqUAy3u/cTrGltlEkrs8IkNjl1jgVc2JUw+HcWfvv8Jtim3vQ1xg9l7TK3DhJf7Ak9oh1wKQOa49pe9x1RK6oC4sKM14UpyHcC4WQwtprjL2hrMSTwwusk3iCL20nXAh9KwfydymTv8q2Y5xrHgJ9d6cIxl/uDmmmIvB5Fe/OkODFKhd1WOBJxVc/G9M0TRSaFSAbn+II2mD27JJswA1HXU8ukkOH/YQMafWd/PskJZGP8v2+3DmKM+TJ9yqqnHl08lIGAoHXvmfGmZ38WX9JAyTHNuHGmrI6OZAeSmjQ4pBIXYaMuZE4Lg/Pwf0nwrUrI9P2Hou7Gqtpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3339.namprd12.prod.outlook.com (20.178.31.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 18:39:29 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 18:39:29 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/amdkfd: add missing void argument to function
 kgd2kfd_init
Thread-Topic: [PATCH] drm/amdkfd: add missing void argument to function
 kgd2kfd_init
Thread-Index: AQHVe6Z1JzTC4LKO3024jKtCTzfwUadPW4+AgAAqPIA=
Date: Mon, 7 Oct 2019 18:39:29 +0000
Message-ID: <1359556b-3d82-9d51-1e49-ba0f9ae205b9@amd.com>
References: <20191005175808.32018-1-colin.king@canonical.com>
 <CADnq5_PkTbzqNfesJt29SaB7=R0x4BdoNmHiNDXrHwqj02JUGg@mail.gmail.com>
In-Reply-To: <CADnq5_PkTbzqNfesJt29SaB7=R0x4BdoNmHiNDXrHwqj02JUGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::46)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa8af876-9c07-4a30-cf2a-08d74b55afc3
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3339:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3339756751CB23857B20BA1D929B0@DM6PR12MB3339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(6306002)(476003)(2616005)(486006)(14454004)(446003)(11346002)(966005)(58126008)(316002)(54906003)(305945005)(81156014)(81166006)(7736002)(8936002)(229853002)(8676002)(6512007)(110136005)(65806001)(6486002)(65956001)(66066001)(6436002)(36756003)(31696002)(86362001)(66446008)(53546011)(102836004)(26005)(186003)(478600001)(6506007)(386003)(52116002)(76176011)(25786009)(6246003)(4326008)(66476007)(99286004)(64756008)(14444005)(256004)(66946007)(66556008)(5660300002)(71190400001)(71200400001)(3846002)(6116002)(2906002)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3339;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OHLlRND1mfOtMaaZI1TL6ikjqrBzglEZm4ToVppiumng66cXKkiwZR576wuddkuYEeCY/8f9Lr2AfWb4xgbK7qG9vUKjGxf1+tDpRWfXghOjB0ingp+zmdqHK5UF8a256t+WEt5/Vr9E5e2EkdM8Xp8KxMeedK3Xg8mNA0iXrkQFSb734NmCKJzWFOZNnuXRhVP7ODrNc+K+jBmLTfUHUrxphcTrPzcyYSVWHzKTDTE+mkTEyL4caqbAJKNmTf2chOS/6q2OX9mxhk88c9A01DUnWuHF6cvNIuMnYzuwNACZY1epsYF74wFMXvKXyXe3nB+8cT/7ngHZYXwapxFUN9wYcm8pVqaBy1WOMiQFFox+ViD/gxG5OSqDamtDM0HuhEZdrvWBudJkk6cYnHbcbjN7luzxthu5ms9WCQjmnVPJjPtmuF32g5ieHdAS8u0y1pXSA/OzObvBUhWfBzpdBQ==
Content-ID: <2C5671FF8E63474187A7560A00C39F57@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8af876-9c07-4a30-cf2a-08d74b55afc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 18:39:29.1282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEGl95SEQbNNxXW/OPyKC6C7Ay7tdvIGQLdzjIcyqwXbVsSdWoi2wknExvdyTwbaicg0lW7yZZGY4U8thFUldw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvOoufkNTZTMl59dNEqRUMUULZ5QAQ7Hunl22Nf2VfM=;
 b=Vo1Z1FpS5g1mvhwZCgxrLx4QnDc1WfH3tTOAs8PWhU+UwG/tVpu87uuSyhWwzuMnYd4Vn9vzNZXwMhzaNyvO743McVKYZnhwfAx/Qau8NkLR4pi4jd0ruLgJg7Zj1tpZcBXcJ4c75Al/3UPMJ+bBT6rbwCgbJmDYGHmlucCxgZ4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wNyAxMjowOCBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IE9uIFNhdCwg
T2N0IDUsIDIwMTkgYXQgMTo1OCBQTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5j
b20+IHdyb3RlOg0KPj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4NCj4+DQo+PiBGdW5jdGlvbiBrZ2Qya2ZkX2luaXQgaXMgbWlzc2luZyBhIHZvaWQgYXJn
dW1lbnQsIGFkZCBpdA0KPj4gdG8gY2xlYW4gdXAgdGhlIG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xh
cmF0aW9uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+DQo+IEFwcGxpZWQuICB0aGFua3MhDQoNClRoYW5rIHlvdSENCg0KDQo+
DQo+IEFsZXgNCj4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
bW9kdWxlLmMgfCAyICstDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfbW9kdWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbW9kdWxlLmMN
Cj4+IGluZGV4IDk4NmZmNTJkNTc1MC4uZjRiN2Y3ZTZjNDBlIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21vZHVsZS5jDQo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfbW9kdWxlLmMNCj4+IEBAIC04Miw3ICs4Miw3IEBAIHN0YXRp
YyB2b2lkIGtmZF9leGl0KHZvaWQpDQo+PiAgICAgICAgICBrZmRfY2hhcmRldl9leGl0KCk7DQo+
PiAgIH0NCj4+DQo+PiAtaW50IGtnZDJrZmRfaW5pdCgpDQo+PiAraW50IGtnZDJrZmRfaW5pdCh2
b2lkKQ0KPj4gICB7DQo+PiAgICAgICAgICByZXR1cm4ga2ZkX2luaXQoKTsNCj4+ICAgfQ0KPj4g
LS0NCj4+IDIuMjAuMQ0KPj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+PiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
