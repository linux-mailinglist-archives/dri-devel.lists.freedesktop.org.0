Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5BCA0070
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 13:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9C89AB7;
	Wed, 28 Aug 2019 11:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F31489AB7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 11:04:04 +0000 (UTC)
Received: from DB6PR0802CA0042.eurprd08.prod.outlook.com (2603:10a6:4:a3::28)
 by DB6PR0801MB1846.eurprd08.prod.outlook.com (2603:10a6:4:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Wed, 28 Aug
 2019 11:04:01 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by DB6PR0802CA0042.outlook.office365.com
 (2603:10a6:4:a3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.15 via Frontend
 Transport; Wed, 28 Aug 2019 11:04:01 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 11:03:59 +0000
Received: ("Tessian outbound ea3fc1501f20:v27");
 Wed, 28 Aug 2019 11:03:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95ab108c4cead074
X-CR-MTA-TID: 64aa7808
Received: from ad4a491d3037.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3EF50BF-B9CD-45EF-87E6-9FB4C93671FF.1; 
 Wed, 28 Aug 2019 11:03:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad4a491d3037.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 28 Aug 2019 11:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO7RE4XEx70SkhmVvG2cDcjvc0AVfi1Pb4G4nk/5RrGYX/jxOUsl0athGK+zQ4G1/WcR2E3grR106vkN6q/pywvUOXVzs3U5+J859EbCI1ndaDZxA5zj9b5EA8ESY4s3ALDXTPI/S0jjh09RcXKBt9860XzUu2wGQJO1bGwwfXCoGlBG9aERq6wQ333akBh1TPXJurrNg0GFGMbUvF34vXa+mKi2qWNdICZ5ZT5nfn8GwpwQhZVnDJhq9/vOe3ZDRSa2ksqN7K5VMOZWuGFk9KgouiNzu2S+nPC86kBQjNYvRjcvy6vDaaRNvg+++K2Uvfi3Xcz9rEP3Bm9Q38BqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOlgPkmjzFyevzxrBIfkaXakl8jz5d3ZNjqcOIW4hh8=;
 b=kyypWOianWQ53P++kHj312qHyJjBZosiQpm5fRGKeaVng+GdwvXCgyPfYVAwk8C5gc+8aApLfaQmJJeZOeA8pTv1R3X0cM1QqMuRCgCup8cOYZqq1VMKs4hiGTbD7e+RW90TeuqyMT04s1W3JaWrbj4h/TjOdOFj4tuBtp64u8PatxFUHzYqRiarrGF3bFxqNwEpcPavUW8blme3YHOnBT/Rto356LUXaLrfSG5cvr5jilQrdRBcjJW5Gm6bCOEiW1uNc0lB3JAMCrSePa1SSiIN0Q+YXgzHUYWNlHFGe+KAYo+MZFfg9rrX+ybEaBvZbys/NAFrqbZXrVuRBCZ0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4287.eurprd08.prod.outlook.com (20.179.25.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 11:03:50 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51%3]) with mapi id 15.20.2178.023; Wed, 28 Aug 2019
 11:03:50 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Add ACLK rate to sysfs
Thread-Topic: [PATCH] drm/komeda: Add ACLK rate to sysfs
Thread-Index: AQHVXZBFvBwgvZ1PNEmL4p2YP+CqdQ==
Date: Wed, 28 Aug 2019 11:03:49 +0000
Message-ID: <20190828110342.45936-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::24) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.22.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 66f0e51d-5e59-4ae0-db67-08d72ba76df1
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4287; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB4287:|DB6PR0801MB1846:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1846E93A232C196851C6166F8FA30@DB6PR0801MB1846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:849;OLM:849;
x-forefront-prvs: 014304E855
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(199004)(189003)(102836004)(26005)(2616005)(476003)(25786009)(66476007)(3846002)(2906002)(109986005)(486006)(316002)(386003)(1671002)(256004)(44832011)(4326008)(99286004)(14454004)(305945005)(1076003)(54906003)(478600001)(66946007)(66556008)(8676002)(59246006)(50226002)(71200400001)(66066001)(71190400001)(6512007)(5660300002)(6436002)(81166006)(81156014)(86362001)(53936002)(7736002)(4744005)(52116002)(6506007)(6486002)(8936002)(66446008)(6116002)(36756003)(64756008)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4287;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 0e2/236Ag2xzCModA4uvg2Yxe4pI2KO0BzxV+TwHBTxIluMEtDbOHFcE1LcrvL6q4J9zyN6ZwJGEe2DQeBUecgQXR9aN3rRLQFxZQ9uoVbNgDzl/c6CaxVOF45IDCegn21c0lnp589wMEph+BSU2X0oUYZOcBZSUyKOo4CD/+z+atIg6GLBizV9J/rdjhCiyxPfktMgMKHbfaPWoOdrfLVsKOOuebVMuI/vMqURVJH5UbVcaj/9OsB+/R0Zf+SSCihbbXAsEZLiZiSn253EygRsWs5S5q0mxB7HHpaGhqysDcLEcj2fAnUR+12XMRrzdM3ALVRYQdQqhYsQYVVG3v4xEhqLXGqRGSsbJtw4vm83plooZmWCbQ5Gu8iVy2SZ3pVCdDmdNKsXAhFMqlO+zyA/ob+quKmFOmM4oLCy/UQE=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4287
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(199004)(189003)(99286004)(478600001)(50226002)(486006)(6116002)(6486002)(8746002)(126002)(8676002)(14454004)(3846002)(23756003)(2616005)(2906002)(63370400001)(8936002)(50466002)(81156014)(4744005)(6506007)(22756006)(476003)(26005)(59246006)(305945005)(336012)(186003)(7736002)(102836004)(81166006)(386003)(63350400001)(26826003)(86362001)(5660300002)(356004)(76130400001)(25786009)(4326008)(6512007)(36756003)(1671002)(109986005)(107886003)(316002)(47776003)(54906003)(70586007)(70206006)(1076003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1846;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7c8b5516-8c15-4332-40ff-08d72ba767bf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1846; 
NoDisclaimer: True
X-Forefront-PRVS: 014304E855
X-Microsoft-Antispam-Message-Info: 02MCVQ+o8TNQ4KlVAnj/fsewP41YUvzq7VyFxnMSv8nOYvGaCYfLcrra3AAHhWfJ5PZ4/R67+Ta3l2AhOAWWW+xQErCjAbYzBsvM0InADxWS/A6OebjMgO9OIj+Z7//FvaNcCOhMgvE0W3VmoRUHaA9kL474229zY8uNyGIli2yGeLx+jYECFeJuAHLle+JV1uIB+RDLz6wbVTaoBV3K6QzL1hqZJ8fBvXIKgitdjPakEGtaZGxASGh5Jz3ZvumTxVoQEG4uBI16Wy45WrcPaHCrwZgDEpGCt1pV16Lqxw6cQoL4K3AiawPXvNQkHoV4WU71hclWXJ9ke1CaLgTznimNypJhqzNWBXYXdWV9X7M1m2NpB//PlzEGca1PCv1srWAM9+yLkUpArlNwm4IbCgC7qxYVG/VNJqWSkxobLh0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 11:03:59.9753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f0e51d-5e59-4ae0-db67-08d72ba76df1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOlgPkmjzFyevzxrBIfkaXakl8jz5d3ZNjqcOIW4hh8=;
 b=lY+5BukH3TKTbntpU8ZHhAyMKzc40KPXIqGu1rRPYV512dtgFbazKD60xo0pbsM6FFsC+0UabqGSya2gnNHCePjDJLPgmpoNPYX0T0LoYt0b8hTaqcmQfkwIURD7qswBELvEOwcrhjDJ1ceIM7YIM8GhapMnn/OqF3FlX/9ekv4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOlgPkmjzFyevzxrBIfkaXakl8jz5d3ZNjqcOIW4hh8=;
 b=lY+5BukH3TKTbntpU8ZHhAyMKzc40KPXIqGu1rRPYV512dtgFbazKD60xo0pbsM6FFsC+0UabqGSya2gnNHCePjDJLPgmpoNPYX0T0LoYt0b8hTaqcmQfkwIURD7qswBELvEOwcrhjDJ1ceIM7YIM8GhapMnn/OqF3FlX/9ekv4=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhwb3NlIG5vZGUgd2l0aCB0aGUgbmFtZSAnYWNsa19oeicKClNpZ25lZC1vZmYtYnk6IE1paGFp
bCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwppbmRleCAwMTQyZWU5OTE5NTcuLmU4ZDY3Mzk1YTNi
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmMKQEAgLTkxLDkgKzkxLDE5IEBAIGNvbmZpZ19pZF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKIH0KIHN0YXRpYyBERVZJ
Q0VfQVRUUl9STyhjb25maWdfaWQpOwogCitzdGF0aWMgc3NpemVfdAorYWNsa19oel9zaG93KHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1
ZikKK3sKKwlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRldl90b19tZGV2KGRldik7CisKKwly
ZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlbHVcbiIsIGNsa19nZXRfcmF0ZShtZGV2
LT5hY2xrKSk7Cit9CitzdGF0aWMgREVWSUNFX0FUVFJfUk8oYWNsa19oeik7CisKIHN0YXRpYyBz
dHJ1Y3QgYXR0cmlidXRlICprb21lZGFfc3lzZnNfZW50cmllc1tdID0gewogCSZkZXZfYXR0cl9j
b3JlX2lkLmF0dHIsCiAJJmRldl9hdHRyX2NvbmZpZ19pZC5hdHRyLAorCSZkZXZfYXR0cl9hY2xr
X2h6LmF0dHIsCiAJTlVMTCwKIH07CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
