Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC5E112A91
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E5B6F4D1;
	Wed,  4 Dec 2019 11:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40070.outbound.protection.outlook.com [40.107.4.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B446E8DE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:34 +0000 (UTC)
Received: from VI1PR08CA0174.eurprd08.prod.outlook.com (2603:10a6:800:d1::28)
 by DB6PR08MB2792.eurprd08.prod.outlook.com (2603:10a6:6:24::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:31 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0174.outlook.office365.com
 (2603:10a6:800:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:31 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:31 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Wed, 04 Dec 2019 11:48:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5dc754a238b73100
X-CR-MTA-TID: 64aa7808
Received: from 14edbbfce2ee.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE97C952-65B2-4035-BCAC-6B9C9FB016C8.1; 
 Wed, 04 Dec 2019 11:48:24 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14edbbfce2ee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APbrI4Urj9VExqMHSrIue4bVG/GX7/ns+f2PGDF/bhjZM3FsfI9R3e8PPqvxMb7YjClfG4Ef7G5h4Q79cMLL5FqWDeSS5ixqfNrIb9ZPu0R9uTgVTS4Qo+5Db56Dc5gM8LWnY6i+SYN3kEbSsh1uXiTx2IHtHzBWrT8gJesHftw/TQjbnlOP6ETR6I5dpLfctTBcWNMLBCWYa7OE7eoukn1o1h9J9twIeLi//c4igOqRM8klduvPfXo3nga1oHtuJ+qqWS46qB6YNPojO3RlQ0kTBOBTq23J8L0dLFD0KAHt66ufwwpmJE+hNMepHVaKBY5ML87300jJdaZPJDiI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC07oWCTRqP/8StEgXjpaLEu5lG/XpQZxdcu8dfM6Zo=;
 b=W/7rkHZrQ8z0yhNmT1VSahZkRIrr78RnAxHjHkL/lii3NX2ZzIEPI9EA/tEy2kWt2iCwKl38TOWqzoMcUHM9rt8Samr7hMRrccFdDNFnzbhI+bEigNWm9E810mGRTI6gWzOKXV+Rj4slRJsZ1rN6Ep48xu3G6GBjqUTTE/R/rdxjRbDpHYdS2xEUmwYpr2UHZMmCPWamoaia5ZaaPAbRiAQ9vrvcuDGPc/bGAlvS0gYnINGu6H4KBBuza2esna8JSuBvqr+proBujtP8dbNZF+rPBoHv8St6GxgCbTMge3MO3b3PDv9k39jpEfKzcOlXvnfQ4onCoGrtZW+A6cRJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:22 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:22 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 23/28] drm/mcde: dsi: Use drm_bridge_init()
Thread-Topic: [PATCH v2 23/28] drm/mcde: dsi: Use drm_bridge_init()
Thread-Index: AQHVqpi6sdi//MuIqU22o6K6k+uyEw==
Date: Wed, 4 Dec 2019 11:48:22 +0000
Message-ID: <20191204114732.28514-24-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c77153a-ef16-4400-a732-08d778afe2ca
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|DB6PR08MB2792:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB279240303E032AF60C22214D8F5D0@DB6PR08MB2792.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1360;OLM:1360;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FTFVj+gPip62yXlCKKHms13eg4qBbi4IKGzrINZZtBCQQpz+6vmmx+0ODL+hyeHSicOokn5WbGptrRKz6wfj3D2UnfBbzMV4XRzI0vld2NBZ0q+asrrsWKBnEJE3y3VgT34OuwBzBI97oXuPoNIc2KocY+Mp6xuK4N4iCQyhG3fxqWq1GtgcaCbUabioUeuJpOrJu3VCYCvdtqg4SO8jVzG1BzcMGXgtZ70qLBFUvhg/jhnIa8C5WC3vYogc1rbMVFsYGk7Is/b0bqNFeA9/waVD5L8MZyQdwr+S8l5ee3qhj4QTuJZ6KBdvD5h6NWTuAO8L+apJ2oPrTFULzA8Jo0kWy/KQbZSn4Oz/xgTi0DFeFvem82LUC5gCkaS/ChqWsbWWR9rgj1zirhtBVrzxcz55HXGJA1Nq5VqeqLJpNx+vS8PaPalzH+Zdil7z7cR4
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(189003)(199004)(6506007)(99286004)(7736002)(5660300002)(2906002)(86362001)(102836004)(336012)(305945005)(36756003)(8676002)(81166006)(1076003)(81156014)(2351001)(11346002)(186003)(50226002)(8746002)(8936002)(76176011)(2616005)(26005)(6116002)(6916009)(3846002)(478600001)(14454004)(2501003)(107886003)(26826003)(4326008)(22756006)(70206006)(50466002)(36906005)(54906003)(316002)(25786009)(4744005)(23756003)(5640700003)(6512007)(356004)(76130400001)(6486002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2792;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 179ba75c-0e52-4ff5-0fa1-08d778afdd1b
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhUgU8zknC5ToUaiqrZQVQI9i7wf+KAo/0CBO4j+fLuEyJoS0gTLOnGqSvU2Jsw/IzydN4oK1n24+MsgoBgfDF3ejsnM4F+a7YSUOeog9eTMzXi5JPmPI//irL9WMtLYFM5fO3ZN9ZE1DOCAoxMoTpP8sW5tMPdaV/Y8lwHyNY8GVgZDmRj50fwUO0sLYPt+7wINWMpmVSFAnvHt55W6v6qjxmzopwJBe44KSqd9ttzt8oqhQj8oooYoRJITg1y5v++Wh0t3xYbFJHeT0z6NS0O4XOfbJLvOY2hUk36OZiHCsJH3JuHnaMkYtgkEG8Ka/5bQD4lTNkUgCsDMpCYCMQUMsbZgTf3+FT9WL7UvErg7An02wQWhv4IsKosfsUbOiHM5SRvP30/x97/7GkGGXeS3pWfMvJ1DuLu6F2lRcgaVcHPUfr/t2DvMoLulxRFv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:31.5155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c77153a-ef16-4400-a732-08d778afe2ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2792
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC07oWCTRqP/8StEgXjpaLEu5lG/XpQZxdcu8dfM6Zo=;
 b=lh58ZyPxGfqLQdQxsGZa15/2Daj+nB64KB5JBa8eof++k/xA3WtcqpbM1BqtSyjUBhTPRUkTGdYzEgVZK5UVlKN/vueJkbHDH44NpRK5I1tEbuJ/t86l3GLKfsjcZNxc2Yw6frm6lnjlmh6/2V0qWa2iZQ0sC9vea1Vf2fbkG2o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC07oWCTRqP/8StEgXjpaLEu5lG/XpQZxdcu8dfM6Zo=;
 b=lh58ZyPxGfqLQdQxsGZa15/2Daj+nB64KB5JBa8eof++k/xA3WtcqpbM1BqtSyjUBhTPRUkTGdYzEgVZK5UVlKN/vueJkbHDH44NpRK5I1tEbuJ/t86l3GLKfsjcZNxc2Yw6frm6lnjlmh6/2V0qWa2iZQ0sC9vea1Vf2fbkG2o=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwu
YXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYyB8
IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tY2RlL21jZGVfZHNpLmMKaW5kZXggNDJmZmY4MTE2NTNlLi5kOWI5MjUzYWNjY2YgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kc2kuYwpAQCAtOTU1LDggKzk1NSw3IEBAIHN0YXRpYyBpbnQgbWNk
ZV9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlk
LT5icmlkZ2Vfb3V0ID0gYnJpZGdlOwogCiAJLyogQ3JlYXRlIGEgYnJpZGdlIGZvciB0aGlzIERT
SSBjaGFubmVsICovCi0JZC0+YnJpZGdlLmZ1bmNzID0gJm1jZGVfZHNpX2JyaWRnZV9mdW5jczsK
LQlkLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKKwlkcm1fYnJpZGdlX2luaXQoJmQt
PmJyaWRnZSwgZGV2LCAmbWNkZV9kc2lfYnJpZGdlX2Z1bmNzLCBOVUxMLCBOVUxMKTsKIAlkcm1f
YnJpZGdlX2FkZCgmZC0+YnJpZGdlKTsKIAogCS8qIFRPRE86IGZpcnN0IGNvbWUgZmlyc3Qgc2Vy
dmUsIHVzZSBhIGxpc3QgKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
