Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CAADA2D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 15:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4489932;
	Mon,  9 Sep 2019 13:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EE289932
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 13:43:17 +0000 (UTC)
Received: from DB7PR08CA0057.eurprd08.prod.outlook.com (2603:10a6:10:26::34)
 by AM0PR08MB3378.eurprd08.prod.outlook.com (2603:10a6:208:dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Mon, 9 Sep
 2019 13:43:14 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by DB7PR08CA0057.outlook.office365.com
 (2603:10a6:10:26::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Mon, 9 Sep 2019 13:43:14 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 13:43:12 +0000
Received: ("Tessian outbound d0dc33d5ba29:v28");
 Mon, 09 Sep 2019 13:43:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ebc2e788f7d56d6
X-CR-MTA-TID: 64aa7808
Received: from 35bc2df2515b.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79C46C8D-D20C-467E-9052-5127A5B0F7EE.1; 
 Mon, 09 Sep 2019 13:42:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35bc2df2515b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Sep 2019 13:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMhR4WD3Bsuo0rqWNNSfl0RiBOcdulWtO77SxzFwv9fqoqozGUDebevEw/fb2XsbfZZ5P17FYHrqFtptquD38ASK5UCL8q8JCekg6UAiSYPvSMjXx3rhUrkla0xpiVE2+dCeeFUxfseKCuHN1WgdDs5TMRdpZH0/T5P9n4EXZ1VjXSKh1ugoN7Imrq7jY6rscPVCvVCRGVxjP9/gZd0Osjk3QX22S4sE5C67aPkzm3TCMOx/80YrgdN87t8CfV4QJS2WgfHvWSEMvYrdyIEuHpe11ZZX6SSlo72Hlo+pDU5OAunUNymgZb1Lbav2lWt1/eEn9QQjWFt7D8oj2ATYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U+Kp7j0Vten/8eIthI/ESn+K0b85q2UTsQo503LFUM=;
 b=HxCRcQ8j/51GUsMnniTiIpD2F7HmzPYY/gkSITAIy0cd0CkVH+g3B3KMgvVnVtIueBbTj5ZfTzrtdarNGBwxeAqwYDrtjOp3wvg3jk+9jCuMbhMIrjBLhIa1KMBtQskpGHBk1cTw9oGbWGgXA6CqTf4m64Hu6dOzay4d2FiAu7omymqw1sBDo1PuPrr2gpe/wkfLn/lgQ18kJOVOMhwNgsfIokC+euLKAcOWy9nqCPbKoQqyAK1W42wDoSJo3t7T4gszbsSMSNqjgpJquRA0WYNXz7Mjmcf31AQIAT3Kf+vjCn7FoXcY+yoV49k7Yde/nGdprzAUvKRyVXByEYqUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB3793.eurprd08.prod.outlook.com (20.178.21.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 13:42:53 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::a820:853d:e981:a76c]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::a820:853d:e981:a76c%2]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 13:42:53 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "maxime.ripard@bootlin.com"
 <maxime.ripard@bootlin.com>, "sean@poorly.run" <sean@poorly.run>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
Thread-Topic: [RFC PATCH] drm:- Add a modifier to denote 'protected'
 framebuffer
Thread-Index: AQHVZxR6T7KOwVbC3kmqPMMH1PUhIA==
Date: Mon, 9 Sep 2019 13:42:53 +0000
Message-ID: <20190909134241.23297-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0150.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::18) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 21b230d3-cda4-4af9-8de7-08d7352ba8de
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3793; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB3793:|AM0PR08MB3793:|AM0PR08MB3378:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB337824595E8DD55714B81689E4B70@AM0PR08MB3378.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01559F388D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(189003)(476003)(81166006)(5024004)(256004)(316002)(186003)(6512007)(64756008)(66446008)(6436002)(66476007)(86362001)(66946007)(26005)(66556008)(2201001)(14444005)(52116002)(2906002)(6486002)(36756003)(71190400001)(71200400001)(99286004)(53936002)(3846002)(6116002)(386003)(102836004)(6506007)(7736002)(1076003)(2616005)(486006)(305945005)(14454004)(4326008)(5660300002)(25786009)(478600001)(81156014)(50226002)(8936002)(8676002)(66066001)(44832011)(110136005)(2501003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3793;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: MREsJVijiAVzR0+bFfjpfF6OqIM4gL1C5OyJr8ob1iLOFbn9B5QBW1wgSexwVtyC2h/TMIAtwv5dDsvJ5/vqLsiGH5yX0AafDkfnJVqT3e47YrKnbdqO6j7zh84tJAeV/wGOgB5WAlRygCtXflzHKMucbAAagIQuGcTdfNa1nSmurF5b+fa33aZccyyOTa4dPXKM6rUr8Azll++lFJirh28V8rKouxhgX23fTn5wxklasLChbvcI99/S2wzxlNJm2rWZ9fWd38j2ofzfxp7XwU7M7rsmHAMMqvDxAJqhoPAt9IxP6vy9Ax01cLqEQ4AKxXASi1zWoWuoXYrqGMogdbQQ0IymuLOIAeD/1wOhXllofX+G2rencAEo1qJcgPdTCYkGEt2WQ3VJdIrjzQj0t2PbId545aaiovqrUbh52+Q=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3793
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(199004)(189003)(99286004)(2906002)(126002)(476003)(2616005)(110136005)(22756006)(316002)(5024004)(14444005)(305945005)(63350400001)(4326008)(63370400001)(36906005)(6486002)(336012)(486006)(1076003)(14454004)(7736002)(186003)(356004)(47776003)(26005)(2201001)(23756003)(81156014)(6506007)(50226002)(2501003)(36756003)(386003)(8676002)(76130400001)(86362001)(8936002)(8746002)(70206006)(6512007)(6116002)(3846002)(5660300002)(70586007)(25786009)(66066001)(81166006)(102836004)(26826003)(478600001)(50466002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3378;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ff8026c-0ddf-48d9-2a8b-08d7352b9cf5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3378; 
NoDisclaimer: True
X-Forefront-PRVS: 01559F388D
X-Microsoft-Antispam-Message-Info: RHEl3B/8TQdd212N1Dc+mktd0n5Thgn28Pgjk76KVQ/5qysymH1uzzyfiqQGhSyuQ7rkrGxhFG59BrmKX2t8UVJX08dGEe/WXTahIzKMmjj/0NlruEoktAlBw1oQmsdoy/tYXQqmrYFOSLuol96pbCfCsLs6oK5PnjBGvz+XDnn75ll+XJ3IvQp1qO2L/UwZCmijU54Etw5QGKA0oY95tLtR7Jp4PDW4nJ7SUdiiI5+7YbYLSAVx4ak2yQ6Ra3OWQmDdOyM0gvWEUSffd2AJP8du/BnukR2J7DQTR5OpZ6UiXeR28pzQ/pNJyriGAF1XWDmdhLNlGjGuaN1DiVzkJRgKd9gJtwCQZ3xHxywRNuTezotoBc5S05Bb6nkvxMp53zxnyqWKvTLiRjcjcPZlY2RofW1TTprElT5Q1oILeCs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2019 13:43:12.7606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b230d3-cda4-4af9-8de7-08d7352ba8de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3378
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U+Kp7j0Vten/8eIthI/ESn+K0b85q2UTsQo503LFUM=;
 b=4j9gSV1r+V7XlAhd/kOyysYAOdDg+D8LpxAxOllG593gPRs9iCrWJMNuAfSzeLOMFart36o7gDIy9eURxTUTTehLwTgrbQhLO54rLsMYsUN9o0FyScsCcHgp0eU+ely1qEAA4Q0ZUd2kX9sz0sLWG8eqsIFsgrZjDpFQG+ZCNuo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U+Kp7j0Vten/8eIthI/ESn+K0b85q2UTsQo503LFUM=;
 b=4j9gSV1r+V7XlAhd/kOyysYAOdDg+D8LpxAxOllG593gPRs9iCrWJMNuAfSzeLOMFart36o7gDIy9eURxTUTTehLwTgrbQhLO54rLsMYsUN9o0FyScsCcHgp0eU+ely1qEAA4Q0ZUd2kX9sz0sLWG8eqsIFsgrZjDpFQG+ZCNuo=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbW9kaWZpZXIgJ0RSTV9GT1JNQVRfTU9EX0FSTV9QUk9URUNURUQnIHdoaWNoIGRlbm90
ZXMgdGhhdCB0aGUgZnJhbWVidWZmZXIKaXMgYWxsb2NhdGVkIGluIGEgcHJvdGVjdGVkIHN5c3Rl
bSBtZW1vcnkuCkVzc2VudGlhbGx5LCB3ZSB3YW50IHRvIHN1cHBvcnQgRUdMX0VYVF9wcm90ZWN0
ZWRfY29udGVudCBpbiBvdXIga29tZWRhIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEF5YW4gS3Vt
YXIgSGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgoKLy0tIE5vdGUgdG8gcmV2aWV3ZXIKS29t
ZWRhIGRyaXZlciBpcyBjYXBhYmxlIG9mIHJlbmRlcmluZyBEUk0gKERpZ2l0YWwgUmlnaHRzIE1h
bmFnZW1lbnQpIHByb3RlY3RlZApjb250ZW50LiBUaGUgRFJNIGNvbnRlbnQgaXMgc3RvcmVkIGlu
IGEgZnJhbWVidWZmZXIgYWxsb2NhdGVkIGluIHN5c3RlbSBtZW1vcnkKKHdoaWNoIG5lZWRzIHNv
bWUgc3BlY2lhbCBoYXJkd2FyZSBzaWduYWxzIGZvciBhY2Nlc3MpLgoKTGV0IHVzIGlnbm9yZSBo
b3cgdGhlIHByb3RlY3RlZCBzeXN0ZW0gbWVtb3J5IGlzIGFsbG9jYXRlZCBhbmQgZm9yIHRoZSBz
Y29wZSBvZgp0aGlzIGRpc2N1c3Npb24sIHdlIHdhbnQgdG8gZmlndXJlIG91dCB0aGUgYmVzdCB3
YXkgcG9zc2libGUgZm9yIHRoZSB1c2Vyc3BhY2UKdG8gY29tbXVuaWNhdGUgdG8gdGhlIGRybSBk
cml2ZXIgdG8gdHVybiB0aGUgcHJvdGVjdGVkIG1vZGUgb24gKGZvciBhY2Nlc3NpbmcgdGhlCmZy
YW1lYnVmZmVyIHdpdGggdGhlIERSTSBjb250ZW50KSBvciBvZmYuCgpUaGUgcG9zc2libGUgd2F5
cyBieSB3aGljaCB0aGUgdXNlcnNwYWNlIGNvdWxkIGFjaGlldmUgdGhpcyBpcyB2aWE6LQoKMS4g
TW9kaWZpZXJzIDotIFRoaXMgbG9va3MgdG8gbWUgdGhlIGJlc3Qgd2F5IGJ5IHdoaWNoIHRoZSB1
c2Vyc3BhY2UgY2FuCmNvbW11bmljYXRlIHRvIHRoZSBrZXJuZWwgdG8gdHVybiB0aGUgcHJvdGVj
dGVkIG1vZGUgb24gZm9yIHRoZSBrb21lZGEgZHJpdmVyCmFzIGl0IGlzIGdvaW5nIHRvIGFjY2Vz
cyBvbmUgb2YgdGhlIHByb3RlY3RlZCBmcmFtZWJ1ZmZlcnMuIFRoZSBvbmx5IHByb2JsZW0gaXMK
dGhhdCB0aGUgY3VycmVudCBtb2RpZmllcnMgZGVzY3JpYmUgdGhlIHRpbGluZy9jb21wcmVzc2lv
biBmb3JtYXQuIEhvd2V2ZXIsIGl0CmRvZXMgbm90IGh1cnQgdG8gZXh0ZW5kIHRoZSBtZWFuaW5n
IG9mIG1vZGlmaWVycyB0byBkZW5vdGUgb3RoZXIgYXR0cmlidXRlcyBvZgp0aGUgZnJhbWVidWZm
ZXIgYXMgd2VsbC4KClRoZSBvdGhlciByZWFzb24gaXMgdGhhdCBvbiBBbmRyb2lkLCB3ZSBnZXQg
YW4gaW5mbyBmcm9tIEdyYWxsb2MKKEdSQUxMT0NfVVNBR0VfUFJPVEVDVEVEKSB3aGljaCB0ZWxs
cyB1cyB0aGF0IHRoZSBidWZmZXIgaXMgcHJvdGVjdGVkLiBUaGlzIGNhbgpiZSB1c2VkIHRvIHNl
dCB1cCB0aGUgbW9kaWZpZXIvcyAoQWRkRkIyKSBkdXJpbmcgZnJhbWVidWZmZXIgY3JlYXRpb24u
CgoyLiBGcmFtZWJ1ZmZlciBmbGFncyA6LSBBcyBvZiB0b2RheSwgdGhpcyBjYW4gYmUgb25lIG9m
IHRoZSB0d28gdmFsdWVzCmllIChEUk1fTU9ERV9GQl9JTlRFUkxBQ0VEL0RSTV9NT0RFX0ZCX01P
RElGSUVSUykuIFVubGlrZSBtb2RpZmllcnMsIHRoZSBkcm0KZnJhbWVidWZmZXIgZmxhZ3MgYXJl
IGdlbmVyaWMgdG8gdGhlIGRybSBzdWJzeXN0ZW0gYW5kIGlkZWFsbHkgd2Ugc2hvdWxkIG5vdApp
bnRyb2R1Y2UgYW55IGRyaXZlciBzcGVjaWZpYyBjb25zdHJhaW50L2ZlYXR1cmUuCgozLiBDb25u
ZWN0b3IgcHJvcGVydHk6LSBJIGNvdWxkIHNlZSB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXMgdXNl
ZCBmb3IgRFJNCnByb3RlY3RlZCBjb250ZW50Oi0KRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9O
X0RFU0lSRUQgLyBFTkFCTEVEIDotICJUaGlzIHByb3BlcnR5IGlzIHVzZWQgYnkKdXNlcnNwYWNl
IHRvIHJlcXVlc3QgdGhlIGtlcm5lbCBwcm90ZWN0IGZ1dHVyZSBjb250ZW50IGNvbW11bmljYXRl
ZCBvdmVyCnRoZSBsaW5rIi4gQ2xlYXJseSwgd2UgYXJlIG5vdCBjb25jZXJuZWQgd2l0aCB0aGUg
cHJvdGVjdGlvbiBhdHRyaWJ1dGVzIG9mIHRoZQp0cmFuc21pdHRlci4gU28sIHdlIGNhbm5vdCB1
c2UgdGhpcyBwcm9wZXJ0eSBmb3Igb3VyIGNhc2UuCgo0LiBEUk0gcGxhbmUgcHJvcGVydHk6LSBB
Z2Fpbiwgd2Ugd2FudCB0byBjb21tdW5pY2F0ZSB0aGF0IHRoZSBmcmFtZWJ1ZmZlcih3aGljaApj
YW4gYmUgYXR0YWNoZWQgdG8gYW55IHBsYW5lKSBpcyBwcm90ZWN0ZWQuIFNvIGludHJvZHVjaW5n
IGEgbmV3IHBsYW5lIHByb3BlcnR5CmRvZXMgbm90IGhlbHAuCgo1LiBEUk0gY3J0YyBwcm9wZXJ0
eTotIEZvciB0aGUgc2FtZSByZWFzb24gYXMgYWJvdmUsIGludHJvZHVjaW5nIGEgbmV3IGNydGMK
cHJvcGVydHkgZG9lcyBub3QgaGVscC4KCi0tLwoKLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9m
b3VyY2MuaCB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkv
ZHJtL2RybV9mb3VyY2MuaAppbmRleCAzZmVlYWEzZjk4N2EuLjM4ZTVlODFkMTFmZSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKKysrIGIvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fZm91cmNjLmgKQEAgLTc0Miw2ICs3NDIsMTUgQEAgZXh0ZXJuICJDIiB7CiAgKi8KICNk
ZWZpbmUgQUZCQ19GT1JNQVRfTU9EX0JDSCAgICAgKDFVTEwgPDwgMTEpCiAKKy8qCisgKiBQcm90
ZWN0ZWQgZnJhbWVidWZmZXIKKyAqCisgKiBUaGUgZnJhbWVidWZmZXIgaXMgYWxsb2NhdGVkIGlu
IGEgcHJvdGVjdGVkIHN5c3RlbSBtZW1vcnkgd2hpY2ggY2FuIGJlIGFjY2Vzc2VkCisgKiB2aWEg
c29tZSBzcGVjaWFsIGhhcmR3YXJlIHNpZ25hbHMgZnJvbSB0aGUgZHB1LiBUaGlzIGlzIHVzZWQg
dG8gc3VwcG9ydAorICogJ0dSQUxMT0NfVVNBR0VfUFJPVEVDVEVEJyBpbiBvdXIgZnJhbWVidWZm
ZXIgZm9yIEVHTF9FWFRfcHJvdGVjdGVkX2NvbnRlbnQuCisgKi8KKyNkZWZpbmUgRFJNX0ZPUk1B
VF9NT0RfQVJNX1BST1RFQ1RFRAlmb3VyY2NfbW9kX2NvZGUoQVJNLCAoMVVMTCA8PCA1NSkpCisK
IC8qCiAgKiBBbGx3aW5uZXIgdGlsZWQgbW9kaWZpZXIKICAqCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
