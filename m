Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFC9EBE23
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 07:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513576F70E;
	Fri,  1 Nov 2019 06:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF7D6F70E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 06:54:08 +0000 (UTC)
Received: from DB6PR0802CA0041.eurprd08.prod.outlook.com (2603:10a6:4:a3::27)
 by DB6PR0801MB1863.eurprd08.prod.outlook.com (2603:10a6:4:76::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Fri, 1 Nov
 2019 06:54:05 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by DB6PR0802CA0041.outlook.office365.com
 (2603:10a6:4:a3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.17 via Frontend
 Transport; Fri, 1 Nov 2019 06:54:05 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 06:54:04 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 01 Nov 2019 06:54:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 929eb414ead90db0
X-CR-MTA-TID: 64aa7808
Received: from a5a1095d5c28.2 (cr-mta-lb-1.cr-mta-net [104.47.12.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B309B24-EFC7-451E-BBDB-CD2C8B6C9A38.1; 
 Fri, 01 Nov 2019 06:53:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5a1095d5c28.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Nov 2019 06:53:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4K73owtHgtucvqFEUkoGVkrG0Z9vrQpINDNhylo5DUsXMeuH65pqzYxeTJsnA/P2HnzpMPR0O2qBiHLss4P2vIjB7jnFI7Oz2Vw/WHAYtXo9BYi0I18kwRJ1d8MmzbDBlEgOss9LXy9y/ItNWQQgfVjAYPhzltBkWtvc0DG5/tTI7N0LzhtGvgaR8Iws78XFwAYL4y3bMM+588PhtFXBqyzBeBcon1uyFdzSHf4HEf2k3KpfD9mO1MY3UbNCSOs2UN/eO/0gi0etocLc5xxArxLt/r5+xuPrG9vHjkryTMOXmFQpOvxzI20IUS1iH8knmugpJTuH93CKqyraWAJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=WQzAB7dSJx1S3J9sLVMloLHtn2+Cyg+gKsGHlSNBnambCNbJ7HfTxVsUiJFLwiFp0iHKWwG/FfL/m87dP27Z+94XGDWB/U2cfwG7FqYbyp7AnF6XK2SHvG/vBjO2u4Mi9xWc14ia/j3y1unnmHY8wFEjpsKqukW8JTAVl4LibvCgnpHxDxJ9lbnrClShLUb852vvWSj8KZSmh1dsZ9mKHWdtd/2h/6p5ppW7KbkIc3UTqvfFUYez5equbfvpUT/WvClfBhDn8xHSTRXtpyCGoLDz7q66m+QpM/l73w/+QrXYdG8eJHXyVAva9SskrJUrtyvqYKyPMxnEk0jtL2IvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1SPR01MB0002.eurprd08.prod.outlook.com (20.179.193.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 06:53:55 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2387.030; Fri, 1 Nov 2019
 06:53:55 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v8 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v8 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVkIEgVFu/k1utEUml4A+vyEm+iQ==
Date: Fri, 1 Nov 2019 06:53:55 +0000
Message-ID: <20191101065319.29251-3-james.qian.wang@arm.com>
References: <20191101065319.29251-1-james.qian.wang@arm.com>
In-Reply-To: <20191101065319.29251-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9797aadd-1af3-4e5a-629e-08d75e984911
X-MS-TrafficTypeDiagnostic: VE1SPR01MB0002:|VE1SPR01MB0002:|DB6PR0801MB1863:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1863119AA4F0AEBB432A0C2BB3620@DB6PR0801MB1863.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 020877E0CB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(66066001)(446003)(11346002)(2616005)(486006)(36756003)(8676002)(14454004)(5660300002)(476003)(103116003)(2501003)(2171002)(86362001)(3846002)(6116002)(305945005)(2201001)(25786009)(1076003)(6512007)(66476007)(52116002)(71200400001)(71190400001)(386003)(55236004)(6506007)(6436002)(102836004)(6486002)(7736002)(14444005)(186003)(99286004)(8936002)(110136005)(4326008)(54906003)(50226002)(478600001)(64756008)(2906002)(66446008)(81156014)(66556008)(316002)(66946007)(81166006)(76176011)(256004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1SPR01MB0002;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qZDG91QD8O+FoDU/18w1oR5vlENb4mdrhD6VlYHDQ+PoUMSGhGWABd5h8e9Dd6kpesqmxrji4Slb9dJzDcOZ5xsPvtAB6HLtwX0lc5jNPnKAcCo0Z2MwzQHe+WM2jb9ghP9BihkGhgb2n1czjlSIYGdueyPT75bqycGgYOjm/smWIQCsJ3h8iD7e7kye8KD9QBdO2DT1gjaVvdaX9Hk0X7+88fC2KnAMTC1kX7yLxzP6BBrZQj96LKk0Ml4J+I/La4uqUbBpVw4EBflGPYSpQuliReg49pFue14FQrrscrYjVKc9pNEgmidPQvEn4NonPx3uOfdgrOvQo8WXUlG/wHwKMdOxhnJlZ3ynQw2Fg1w17EUB+vp34uqok/RwE4lKEViCUJHX/8Z87PEEAH25B8YLrOvPWb6hHJLfT5uOutTSqzOgwauCAqoD3KoXFb6u
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1SPR01MB0002
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(1110001)(339900001)(199004)(189003)(76130400001)(336012)(2171002)(446003)(11346002)(386003)(6506007)(36756003)(356004)(186003)(76176011)(86362001)(2616005)(102836004)(26005)(2201001)(22756006)(70206006)(23756003)(70586007)(6486002)(2501003)(6512007)(5660300002)(6116002)(3846002)(1076003)(486006)(126002)(476003)(2906002)(305945005)(50226002)(26826003)(478600001)(47776003)(7736002)(316002)(25786009)(50466002)(105606002)(81166006)(8746002)(81156014)(99286004)(4326008)(8676002)(8936002)(14444005)(66066001)(14454004)(54906003)(110136005)(103116003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1863;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6063315d-7c59-40e9-bf82-08d75e984354
NoDisclaimer: True
X-Forefront-PRVS: 020877E0CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EDxq3cnIWdCSF/4ULmI/WNSthfaeJCX305Vir5TUoKj+MERp1TNPcANDeCJjxuxRFGEPGTEG4p9KyTAYzfU2DuVnwhwCHU2yrHfQrPfgrpVHRIN1x/NMCf5VSup16bKa7VCMtmZy5WiFPSKU0FBrku+s7KYTVDRjdoZMs0+wB5W+7TLSDmPY70dtPsDp7MpNNaNGD5PDo4TWM5yhG1F46TFJvKTtFDupchoadTCRzBeehzHNmXZm4Ys9A9OdfZGXrnawZNHI4GB1O82/aiVDBey82I/yaZH39wfrmflNjsgIRkefUx6L2wWapitbsoQdeSYKUg+Fn/TSIPp4FdR1hoPlJ8P8MwUe8xGt7KvNt3JfpsSXYuUa9OIgUcZpknQcHXxobeXsylI1RAkg8Jb4PP52TjlkjwX8ldqdru60CudeQNhUOeM/5RaR4s/miwS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 06:54:04.9610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9797aadd-1af3-4e5a-629e-08d75e984911
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=2KivfaICzHYyUYef9HaUhEchtFV+Fvz/v3Dy7uOo9M37KlIU5zIWTmRioirZC5aRRqTwSmVVMNH3QniYAhm1qxo6EUEc/rjyGqWwCSjY0tYTKbsMGCZFcyO2znhNVSMvjcOn81E1Bp9VlttaxPlmJEEvW59tPPcw70owbKMFct4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=2KivfaICzHYyUYef9HaUhEchtFV+Fvz/v3Dy7uOo9M37KlIU5zIWTmRioirZC5aRRqTwSmVVMNH3QniYAhm1qxo6EUEc/rjyGqWwCSjY0tYTKbsMGCZFcyO2znhNVSMvjcOn81E1Bp9VlttaxPlmJEEvW59tPPcw70owbKMFct4=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNvbnZlcnQgZHJtIGNvbG9yIGx1dCB0byBrb21lZGEg
SFcgcmVxdWlyZWQgY3VydmUKY29lZmZzIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IGphbWVzIHFp
YW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
UmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
LS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCA1MiAr
KysrKysrKysrKysrKysrKysrCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9t
Z210LmggICAgfCAgOSArKystCiAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggOWQxNGE5MmRiYjE3Li5jMTgwY2U3MGMyNmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Nv
bG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMKQEAgLTY1LDMgKzY1LDU1IEBAIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVj
dF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSkKIAog
CXJldHVybiBjb2VmZnM7CiB9CisKK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3IgeworCXUzMiBi
b3VuZGFyeV9zdGFydDsKKwl1MzIgbnVtX29mX3NlZ21lbnRzOworCXUzMiBzZWdtZW50X3dpZHRo
OworfTsKKworc3RydWN0IGdhbW1hX2N1cnZlX3NlZ21lbnQgeworCXUzMiBzdGFydDsKKwl1MzIg
ZW5kOworfTsKKworc3RhdGljIHN0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3Igc2VjdG9yX3RibFtd
ID0geworCXsgMCwgICAgNCwgIDQgICB9LAorCXsgMTYsICAgNCwgIDQgICB9LAorCXsgMzIsICAg
NCwgIDggICB9LAorCXsgNjQsICAgNCwgIDE2ICB9LAorCXsgMTI4LCAgNCwgIDMyICB9LAorCXsg
MjU2LCAgNCwgIDY0ICB9LAorCXsgNTEyLCAgMTYsIDMyICB9LAorCXsgMTAyNCwgMjQsIDEyOCB9
LAorfTsKKworc3RhdGljIHZvaWQKK2RybV9sdXRfdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzLAorCQkgIHN0cnVjdCBnYW1tYV9jdXJ2ZV9z
ZWN0b3IgKnNlY3Rvcl90YmwsIHUzMiBudW1fc2VjdG9ycykKK3sKKwlzdHJ1Y3QgZHJtX2NvbG9y
X2x1dCAqbHV0OworCXUzMiBpLCBqLCBpbiwgbnVtID0gMDsKKworCWlmICghbHV0X2Jsb2IpCisJ
CXJldHVybjsKKworCWx1dCA9IGx1dF9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IG51
bV9zZWN0b3JzOyBpKyspIHsKKwkJZm9yIChqID0gMDsgaiA8IHNlY3Rvcl90YmxbaV0ubnVtX29m
X3NlZ21lbnRzOyBqKyspIHsKKwkJCWluID0gc2VjdG9yX3RibFtpXS5ib3VuZGFyeV9zdGFydCAr
CisJCQkgICAgIGogKiBzZWN0b3JfdGJsW2ldLnNlZ21lbnRfd2lkdGg7CisKKwkJCWNvZWZmc1tu
dW0rK10gPSBkcm1fY29sb3JfbHV0X2V4dHJhY3QobHV0W2luXS5yZWQsCisJCQkJCQlLT01FREFf
Q09MT1JfUFJFQ0lTSU9OKTsKKwkJfQorCX0KKworCWNvZWZmc1tudW1dID0gQklUKEtPTUVEQV9D
T0xPUl9QUkVDSVNJT04pOworfQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcykKK3sKKwlkcm1fbHV0
X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZzLCBzZWN0b3JfdGJsLCBBUlJBWV9TSVpFKHNlY3Rv
cl90YmwpKTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaAppbmRleCBhMmRmMjE4ZjU4ZTcuLjA4YWI2OTI4MTY0OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuaApAQCAtMTEsNyArMTEsMTQgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9y
X21nbXQuaD4KIAogI2RlZmluZSBLT01FREFfTl9ZVVYyUkdCX0NPRUZGUwkJMTIKKyNkZWZpbmUg
S09NRURBX05fUkdCMllVVl9DT0VGRlMJCTEyCisjZGVmaW5lIEtPTUVEQV9DT0xPUl9QUkVDSVNJ
T04JCTEyCisjZGVmaW5lIEtPTUVEQV9OX0dBTU1BX0NPRUZGUwkJNjUKKyNkZWZpbmUgS09NRURB
X0NPTE9SX0xVVF9TSVpFCQlCSVQoS09NRURBX0NPTE9SX1BSRUNJU0lPTikKKyNkZWZpbmUgS09N
RURBX05fQ1RNX0NPRUZGUwkJOQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMz
MiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBj
b2xvcl9yYW5nZSk7CiAKLSNlbmRpZgorI2VuZGlmIC8qX0tPTUVEQV9DT0xPUl9NR01UX0hfKi8K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
