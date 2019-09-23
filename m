Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA6BB207
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 12:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F996E838;
	Mon, 23 Sep 2019 10:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150082.outbound.protection.outlook.com [40.107.15.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4A26E838
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 10:14:14 +0000 (UTC)
Received: from VI1PR08CA0181.eurprd08.prod.outlook.com (2603:10a6:800:d2::11)
 by VI1PR08MB5423.eurprd08.prod.outlook.com (2603:10a6:803:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Mon, 23 Sep
 2019 10:14:09 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VI1PR08CA0181.outlook.office365.com
 (2603:10a6:800:d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Mon, 23 Sep 2019 10:14:09 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 10:14:07 +0000
Received: ("Tessian outbound 96594883d423:v31");
 Mon, 23 Sep 2019 10:14:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28f9ddc391ad51a0
X-CR-MTA-TID: 64aa7808
Received: from a6c42b9a4ed7.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B60AD72-FA0C-40B9-8969-202C1731ED53.1; 
 Mon, 23 Sep 2019 10:10:29 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6c42b9a4ed7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 23 Sep 2019 10:10:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2sGn3HRZo2qq5GNROI7k2zR+7R8P80Pka6hZtsE7fbm79ai+wA3XMQXHqZrpNm3D77k25UOsWcy1J3TnLogcvI2Xaw9CysAoZT0N71xWlcV0vDp0joHPxWkdXvknsPoG5bPdEf8m0rYxMVVcce9DniC9p/YuqTjK/w4DzX0lRf/kPXcOVGZC5m2sxB+PUBj2kiaBMTDsCxIvKkVgRXB/XWfubMiZVUow/77HkYxldp+eH8wpDv5kgr3H9HlNkULws2oPMdDhgVczsXR9so7FKTrKYxa9lHh8+j/xwMXln0o10IUzt8sJYCwSXgIECFpDxBSs/hxMeLjd4XflRzL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xo9XvHS0OLKJefPvnTrivtFQ7Xk1F+bXmjZCpLiLxuM=;
 b=DZGkBDUIEjRwIU/HmcoTkToqJogn2/9iUafbQy+Thr/BrZhDlE1V3ahmM8v2XHI/alT20cxQBelhjPL7XLc4bETCJFLLWpLuIq7IsHgIxb5PThTSObgkseKPhTfuWdE8KCiX1kKtv57m2wAcqdhMw+U29xscQYQba48sYHwMjAGFK9vOguslQz23HNHms1123rmuJPZ3/JewxYMyrR3312gk6rm5wd/zDBDH57uJM1xiOnPi7yH5DXoNHXs6j/PPgxXmZC42f/mJ4UprWS7WcB5Nt+8JEwx3cfmlRyLOCDZfXFaKhXDB1mQWOL15fLS4gantWf98vvrvwZRXFAKgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5503.eurprd08.prod.outlook.com (52.133.246.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 10:10:26 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 10:10:26 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/komeda: Workaround for broken FLIP_COMPLETE timestamps
Thread-Topic: [PATCH v2] drm/komeda: Workaround for broken FLIP_COMPLETE
 timestamps
Thread-Index: AQHVcfceR0CHSFhcZEiwMH6z8RYyLQ==
Date: Mon, 23 Sep 2019 10:10:26 +0000
Message-ID: <20190923101017.35114-1-mihail.atanassov@arm.com>
References: <20190919132759.18358-1-mihail.atanassov@arm.com>
In-Reply-To: <20190919132759.18358-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: AM0PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:208:55::38) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 017f6320-8421-4e51-8f54-08d7400ec550
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5503; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB5503:|VI1PR08MB5503:|VI1PR08MB5423:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5423519B7F7960C7FACBB1A28F850@VI1PR08MB5423.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(54906003)(50226002)(6512007)(446003)(6306002)(476003)(316002)(66066001)(66556008)(99286004)(71200400001)(8936002)(2616005)(4326008)(71190400001)(11346002)(36756003)(6436002)(26005)(8676002)(486006)(6916009)(102836004)(2351001)(6486002)(76176011)(44832011)(2501003)(52116002)(5640700003)(6506007)(386003)(186003)(81166006)(81156014)(6116002)(3846002)(64756008)(66446008)(86362001)(305945005)(7736002)(66476007)(2906002)(25786009)(5660300002)(66946007)(256004)(14444005)(14454004)(478600001)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5503;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: WRIR6Tf9SUBt14lle3mYAIfwKaMdd6oBgFILXQd5gwitn8FOcMP4lIJUJ01b9n+1UiK86YxbvcFzqwfgqaNEntQiSVrw5mGSfPhCm1RvbXxMyEn1n03W669sLXSAbw2IiFud3J+3pxlzo8Ky9qA7lGZxO2fYrIlp7rRUXEV+igtsyYSu2/EAZKa7WWrNLom6JieBBz/sHy3sOTvzl3S8Xup0z8wF5xtMUyi9ab0GBpnDJQFPigEbF06+lB48wOVX+M5st7SHTsly6KeBU58bQnR6gvsrn1xFkopxkhTtWj63lKal754Db1X1ryzQKxFsCXeDTMiS1WFusB8dgNZav0Ec3UuUNPnb9ZNQaUnq3zJ9rpzP4KsEidDewNbSiPjJKiRmotwIzWGO3aKCbz2S/USwIHPw9abVKuhW/0hHxZY=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(6506007)(70206006)(386003)(14444005)(305945005)(5660300002)(8676002)(4326008)(3846002)(86362001)(6512007)(6306002)(26826003)(6116002)(7736002)(1076003)(2351001)(2906002)(478600001)(5640700003)(316002)(11346002)(2616005)(336012)(186003)(47776003)(54906003)(26005)(25786009)(2501003)(50226002)(22756006)(486006)(14454004)(356004)(99286004)(66066001)(63350400001)(476003)(126002)(6916009)(76176011)(23756003)(102836004)(6486002)(50466002)(446003)(81166006)(76130400001)(8746002)(81156014)(36756003)(107886003)(70586007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5423;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 08f56c00-e7f2-4cd9-d976-08d7400e411c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5423; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: I6LbJdrC5qB3qgVpkzl8y5ICtsrWEk+NwMNQa11c/ZBscnkFzjkVmqS+4r08WN++HZGoQw7mXTf4+fBtO91QH0s9hjc9MoD91VGVUBldZio0gwGehy9NhxOB4PA6FA2WMksmx8jfcBJp9e3EvrVXFZG7mnvtvBw5PoegTdbFHFDMAZ6INBHoE5TMWlZdlnTblcc/z/742TGGD0CumueV0V3GFUxgJ02WRR5A0Uhqsn9qmsfcyam7SnCV0F4SKLU6y08uhufTMZimLspM6sNHHiYrH1lTaafUGbteF3M5nu4VODMHNORhEzSct3xMlxjaUz5XuaaU3ObwiGZqi99bZbeSMiAfo63DlgcdEBC8Vr7Ya0WYKHwm0KfViQ3QAF670mKMo14HIxDqFFbhzPCm0d79q1StU43biYGYJbl3YV4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 10:14:07.9835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017f6320-8421-4e51-8f54-08d7400ec550
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xo9XvHS0OLKJefPvnTrivtFQ7Xk1F+bXmjZCpLiLxuM=;
 b=AHecwFxjhGbL1Q1AHniLVbkfKQ3XeuA2tQPFaqmcggL6Ujlibda/cahoftmomCOOvLJ9FztfaBt0KvQy+buKGz6LKBc3UNTQDuehXmzxoHdWsE9mDILZiGbYvyUHQWckz6H/Bi2vyxIFRTn5ZnukxMw3ky47Or3J7VqRrgWkfvo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xo9XvHS0OLKJefPvnTrivtFQ7Xk1F+bXmjZCpLiLxuM=;
 b=AHecwFxjhGbL1Q1AHniLVbkfKQ3XeuA2tQPFaqmcggL6Ujlibda/cahoftmomCOOvLJ9FztfaBt0KvQy+buKGz6LKBc3UNTQDuehXmzxoHdWsE9mDILZiGbYvyUHQWckz6H/Bi2vyxIFRTn5ZnukxMw3ky47Or3J7VqRrgWkfvo=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBpbml0aWFsbHkgdHVybmluZyBhIGNydGMgb24sIGRybV9yZXNldF92YmxhbmtfdGltZXN0
YW1wIHdpbGwKc2V0IHRoZSB2YmxhbmsgdGltZXN0YW1wIHRvIDAgZm9yIGFueSBkcml2ZXIgdGhh
dCBkb2Vzbid0IHByb3ZpZGUKYSAtPmdldF92YmxhbmtfdGltZXN0YW1wKCkgaG9vay4KClVuZm9y
dHVuYXRlbHksIHRoZSBGTElQX0NPTVBMRVRFIGV2ZW50IGRlcGVuZHMgb24gdGhhdCB0aW1lc3Rh
bXAsCmFuZCB0aGUgb25seSB3YXkgdG8gcmVnZW5lcmF0ZSBhIHZhbGlkIG9uZSBpcyB0byBoYXZl
IHZibGFuawppbnRlcnJ1cHRzIGVuYWJsZWQgYW5kIGhhdmUgYSB2YWxpZCBpbi1JU1IgY2FsbCB0
bwpkcm1fY3J0Y19oYW5kbGVfdmJsYW5rLgoKQWRkaXRpb25hbGx5LCBpZiB0aGUgdXNlciBkb2Vz
bid0IHJlcXVlc3QgdmJsYW5rcyBidXQgX2RvZXNfIHJlcXVlc3QKRkxJUF9DT01QTEVURSBldmVu
dHMsIHdlIHN0aWxsIGRvbid0IGhhdmUgYSBnb29kIHRpbWVzdGFtcDogaXQnbGwgYmUgdGhlCnNh
bWUgc3RhbXAgYXMgdGhlIGxhc3QgdmJsYW5rIG9uZS4KCldvcmsgYXJvdW5kIHRoZSBpc3N1ZSBi
eSBhbHdheXMgZW5hYmxpbmcgdmJsYW5rcyB3aGVuIHRoZSBDUlRDIGlzIG9uLgpSZWR1Y2luZyB0
aGUgYW1vdW50IG9mIHRpbWUgdGhhdCBQTDAgaGFzIHRvIGJlIHVubWFza2VkIHdvdWxkIGJlIG5p
Y2UgdG8KZml4IGF0IGEgbGF0ZXIgdGltZS4KCkNoYW5nZXMgc2luY2UgdjEgW2h0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMzE3MjcvXToKIC0gbW92ZWQgZHJtX2NydGNf
dmJsYW5rX3B1dCBjYWxsIHRvIHRoZSAtPmF0b21pY19kaXNhYmxlKCkgaG9vawoKQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBh
cm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292
QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y3J0Yy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwppbmRleCAzNGJj
NzNjYTE4YmMuLmQwNjY3OWFmYjIyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtNDg5LDYgKzQ4OSw3IEBAIGtvbWVkYV9jcnRj
X2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXBtX3J1bnRpbWVfZ2V0X3N5
bmMoY3J0Yy0+ZGV2LT5kZXYpOwogCWtvbWVkYV9jcnRjX3ByZXBhcmUodG9fa2NydGMoY3J0Yykp
OwogCWRybV9jcnRjX3ZibGFua19vbihjcnRjKTsKKwlXQVJOX09OKGRybV9jcnRjX3ZibGFua19n
ZXQoY3J0YykpOwogCWtvbWVkYV9jcnRjX2RvX2ZsdXNoKGNydGMsIG9sZCk7CiB9CiAKQEAgLTU4
MSw2ICs1ODIsNyBAQCBrb21lZGFfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiAJCWtvbWVkYV9jcnRjX2ZsdXNoX2FuZF93YWl0X2Zvcl9mbGlwX2RvbmUoa2NydGMs
IGRpc2FibGVfZG9uZSk7CiAJfQogCisJZHJtX2NydGNfdmJsYW5rX3B1dChjcnRjKTsKIAlkcm1f
Y3J0Y192Ymxhbmtfb2ZmKGNydGMpOwogCWtvbWVkYV9jcnRjX3VucHJlcGFyZShrY3J0Yyk7CiAJ
cG1fcnVudGltZV9wdXQoY3J0Yy0+ZGV2LT5kZXYpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
