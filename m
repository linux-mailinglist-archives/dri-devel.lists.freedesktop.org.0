Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A77BA73
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE886E6B7;
	Wed, 31 Jul 2019 07:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740099.outbound.protection.outlook.com [40.107.74.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0266E5ED
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeUL83uY2cKjOl3NkYrN6RbVuJte5rO5Gjr885SqQPtPNI8PY47LdWCCHk5HWcT1t7v2NoC361Z4p+ge9w4Qw0VdwMxJrxykjUKkMVPQPlkhYwVOsMrPoqoLMjfPhxy72OAFyaxsk9plu4Ns3XCWrrmq88lAkUfSaSE9alirZWeajT2ISRupKU1uLI9ulehfkICsu51W4bG8icAwi8ki263R/ejByLSlnEyrVVcIJ7qQ+UUwwvoyUhfj0IArMcAT33tPZDlGI6rdaLmYAEsvuEC3AH2EfBkSqaYLVS9y33IaHKT/4heJZlcxY4OLMCNuFYBtCy2/wt+aMM6H/7/w3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKtMZLiX61rsSPR3a8n3h7CKnUDNrvbJhgxgvfxNi8M=;
 b=fMD2zw+DFnvR2CjPoCC4FKoVhpHWy/ZYpipEf9NImuLs9pAAN5XIOBzjIDUa1YjP0O9J6Q0bq8c3rnVRg+NZwjluvYgk2Dj11kLzrS5H0VYKoVp+QYBjgZ2aT/k1hbqTIXPkSHev3Xt8WD+fOBOre9CJ+Z/5QViPAVcgyygpQrIX1zWw6/n4zf2vZhnLGVKuClVC71ZnEltwytYiVdJ3wNXnCJp+g+0z+qYRN2UdskdS7Als//u95jJRgBuboumBvKY3d5XFji9YWP16dbogI5yIkONBrL3s3QMcDZWBQOOSSt65K1K5y+NpmbWmLvsuLFyM0cEuuIL8GQKMdiJTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1023.namprd22.prod.outlook.com (10.174.167.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 17:44:05 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:44:05 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 07/11] mtd: rawnand: Drop obsolete JZ4740 NAND driver
Thread-Topic: [PATCH 07/11] mtd: rawnand: Drop obsolete JZ4740 NAND driver
Thread-Index: AQHVRv5h9r3wj70EEkOB7DWOPs35Gw==
Date: Tue, 30 Jul 2019 17:44:04 +0000
Message-ID: <MWHPR2201MB1277E2D645C30C7CEA5A846EC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-8-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-8-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:a03:117::26) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f625bf2-d073-4d75-d470-08d7151583d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1023; 
x-ms-traffictypediagnostic: MWHPR2201MB1023:
x-microsoft-antispam-prvs: <MWHPR2201MB10237907F05B87D88A688A23C1DC0@MWHPR2201MB1023.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(6116002)(53936002)(66556008)(52536014)(8936002)(74316002)(71190400001)(6246003)(76176011)(71200400001)(446003)(81156014)(81166006)(476003)(64756008)(6436002)(14454004)(66946007)(66446008)(26005)(33656002)(256004)(7736002)(305945005)(52116002)(186003)(386003)(7696005)(55016002)(6506007)(486006)(66476007)(99286004)(102836004)(2906002)(229853002)(44832011)(11346002)(66066001)(7416002)(316002)(5660300002)(9686003)(4744005)(6916009)(8676002)(478600001)(42882007)(68736007)(25786009)(54906003)(4326008)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1023;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6XrNosekRRzGfoVax4ENM4vUlnQL+fJzqeKYNGrJrM1pn0uon/Ej9thTf2TBroyVFRR24B3V52alrPfgRUkBK8FqIxrHql1wGgQp2htiagIjA0aA4LYdSM9ZCPC6SPkKGLhtQBZp7dTbX1sFLHJoNodQ3k4DAVnHMHg273jKP45EV1UcZFmnMv5FFCOWDx8HjPaGv6xmYyC7VMHuUFSK+EDbtrbqTSV4PIOHNviQWx3ix8ZG0aMptzN9/w4nJzCkC5KZ/uDorkAKnC3/DoMsNHCenjJEu1s1S1qk60BYGcdfRok8CqGNoVrYVzwi3bW7v8exaslEeYqDqBMSTFa2ho37kZjOoHR/r1xmpGcjoqq7GjxjsKnHvftHZ90yVE/4bYQEy01z4ijDytPJaiViLblqYq/dnDeZZqUuGDvI64c=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f625bf2-d073-4d75-d470-08d7151583d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:44:04.9091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1023
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavecomp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKtMZLiX61rsSPR3a8n3h7CKnUDNrvbJhgxgvfxNi8M=;
 b=gSfqZmzrT6+5LwAARtAScFkUO0T2AVjUQAID3T/TwPeI7oRx+cVdJAQPS8eyLrmidYTOPhITY9X5TYzfk9cbV2r4jKJWh8DyDGbsDwDxb/003D0JGs6I3YniMdKaQstH4qpzTJT6QPX667TTjJvedIeUmMBxjbXDT3xR7Iadca0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Burton <pburton@wavecomp.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 "od@zcrc.me" <od@zcrc.me>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IEl0IGhhcyBiZWVuIHJlcGxhY2VkIHdpdGgg
dGhlIG5ld2VyIEluZ2VuaWMgTkFORCBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBD
ZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gVGVzdGVkLWJ5OiBBcnR1ciBSb2playA8
Y29udGFjdEBhcnR1ci1yb2play5ldT4KPiBBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gbWlwcy1uZXh0LgoKVGhhbmtzLAogICAg
UGF1bAoKWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBh
bnl0aGluZyBpcyBpbmNvcnJlY3QKICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBz
LmNvbSB0byByZXBvcnQgaXQuIF0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
