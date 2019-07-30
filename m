Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739597BA6B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780838914E;
	Wed, 31 Jul 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::70d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8596E5ED
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbuxwj7j4adzdv0fmBNfnqhx24c+eYYEuUVqbkE6hJvCDq7LoV0Zl+W7KkbSFqux8s2YY5k3hPZ8az0RxquzZGeLSLGDQJxuwrqd7vqlDlG1pITkCt8ZA9Ge40XEh7mufk3eOYHjYkbL/9iz8I3bYOgN/L0N8q1EWfZ+hINbk73sD5KzjRkGEA/4AUhJ1dYQCgmHst+KYTWNE58UuG9zd0oYsOZ5NkCIxmcBOiCUwucg32N97xnJDGWUteBOHb1hTBCM8HZFuw7xdRJBXyfIKIIezjguUo80dd2uItxrOSodtvseWr5V1al5F+u0Gs6VqW9x9zZV915wT+jKzotBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BX4SU6PwwnhbvyGfv3M6c92ze2YzMLnLwmrICGdzqg=;
 b=ZKsPTX/Fryl9JUC/Tdq/8FJ6jQRq1/JtwW89+fcrOtJOzaqQ4N/MtX6SfEkvC/TYOfWmvnbra+DB7IQICGr+MqeKaienfS+wPA27REAu8UZ6KKPbYvxAQkkxGFZEl6vrQ8lKOkk5rtb8AGYF1bMekFHXiuy/Fj4wQCm7/Km45RL9FbNpl88aMeQ56YoVu5nMkGSX5Pml/09hBQrTZhZyUII3m3iNv2DPAiogUPBLeHr2p6VqnoffvF5BXzAwYzU5dTVf7Vs9ce/ADifT/BWNlmW8bjd3jNrvnt/QwnyvTLO/iLFISvVsJ8yfvhvsHqHia8csSGM+2ZSg/XQUGBQN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 17:43:51 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:51 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/11] ASoC: jz4740: Drop lb60 board code
Thread-Topic: [PATCH 04/11] ASoC: jz4740: Drop lb60 board code
Thread-Index: AQHVRv5Z3HRPuXglA0CFShYL1aERyQ==
Date: Tue, 30 Jul 2019 17:43:51 +0000
Message-ID: <MWHPR2201MB12774249834C09DBDE719902C1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-5-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-5-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6250fd5d-84dd-4f26-1f29-08d715157bc2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1088; 
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-microsoft-antispam-prvs: <MWHPR2201MB1088EF45D9223799A65AAB40C1DC0@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(7736002)(6436002)(52536014)(386003)(486006)(74316002)(6116002)(446003)(9686003)(11346002)(305945005)(5660300002)(55016002)(99286004)(66446008)(66946007)(53936002)(64756008)(66556008)(66476007)(4326008)(6246003)(25786009)(3846002)(71200400001)(66066001)(71190400001)(7416002)(8676002)(6916009)(76176011)(81156014)(52116002)(54906003)(186003)(44832011)(229853002)(476003)(4744005)(8936002)(81166006)(68736007)(102836004)(7696005)(2906002)(6506007)(256004)(33656002)(316002)(478600001)(42882007)(26005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1088;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lhq3rr5NngLy/qSzzewAQ7EPGtEV8okVD8OhyyTbH+SjEe+8hGmbbKBx9ItUYQadHktlIVbR10tYRV8nCAQNsecG+lLBr7HGXXNTBemSXc8UC6LOS5Nzsa8uIfhV/IK7kbg+gXy+j1wai8B1gCmriXrYVJqI4hXPdsAYfz/A8FvvuaoTrLX/EQo3zZAkY84UnGbxRJHhKaW9jCKQ0zgwCqJcgOZTiFhRoytI07CSnozo86y8q/gOSLfzmW0M+qsPJ8QbVR5XqVOUxWJ5LoGXoohxTwIjfPzqZbK5ONE/IVf+7buufQ3FHpgfMQTcU2tG2RjErn9QBYz6uX2uBcOa+R9BMo3e4fWnGr6AFdnRrclZ/BGjxuLsBtoG/I24n92NPNjtbi3I+6WcBZUyf2DRbCyINsen1vVdfr1ubN02ADY=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6250fd5d-84dd-4f26-1f29-08d715157bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:51.4012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavecomp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BX4SU6PwwnhbvyGfv3M6c92ze2YzMLnLwmrICGdzqg=;
 b=ITnpH7wKokCT6qpAxKCxOTrURLPinYmauj6s0majVYCRV1xr4u/A3dahC9UMgosTrPipIG67IgeVu7lsEn1ZlJdBFctnTK5YaTYu57td3R/OxKQDmwWmTzBOLRxuLvSaMlowDf3NroMRD3XZUTgn4jQ17Bmn+BoqMWsx04RATZA=
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

SGVsbG8sCgpQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IFRoZSBib2FyZCBub3cgdXNlcyB0aGUgc2lt
cGxlLWF1ZGlvLWNhcmQgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwg
PHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IFRlc3RlZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RA
YXJ0dXItcm9qZWsuZXU+Cj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz4KCkFwcGxpZWQgdG8gbWlwcy1uZXh0LgoKVGhhbmtzLAogICAgUGF1bAoKWyBUaGlzIG1lc3Nh
Z2Ugd2FzIGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJl
Y3QKICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQu
IF0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
