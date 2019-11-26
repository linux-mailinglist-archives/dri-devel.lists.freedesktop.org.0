Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECF109EF3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3706E3B2;
	Tue, 26 Nov 2019 13:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D676E358
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:32 +0000 (UTC)
Received: from AM4PR08CA0049.eurprd08.prod.outlook.com (2603:10a6:205:2::20)
 by AM6PR08MB3237.eurprd08.prod.outlook.com (2603:10a6:209:4c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Tue, 26 Nov
 2019 13:16:29 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by AM4PR08CA0049.outlook.office365.com
 (2603:10a6:205:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:29 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:29 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 13:16:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e28e9e5fee13d3ba
X-CR-MTA-TID: 64aa7808
Received: from 223e0bbf9727.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 636165A2-C54B-402C-8EC5-9B0BB4C9163C.1; 
 Tue, 26 Nov 2019 13:16:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 223e0bbf9727.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDQe9v0/w2uX3ZHhUu+UICIcaDS0/jntibpXvW9lY5/YlPX2XyMWVa3q0IHK5P+zD/lczMbgDqNOYi29n4tHdiUpe5RR1b9aUE+TZlwgjZDpLxVchkUVspbslqUqdhlkgSgwRxDLxcOs4GmfUf3yWtFz5IEMemlmTZSx3bi2JBvMrh+V3u6O+hNvvCZgqieVjD3cnqGoKQTcEO4rrw4YVGetxqFcIG83pRbkt+kv8Gdot29gPfmioMRqu4XAgFeGNW8YCcDjTlLrO0tm2hQmgu9tPc6BKgyta3ZxergGDmHtleOjaD4MZ2a/fFYUOtXilGXAjc+gma3KGN2HlEaQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DpZqtyyKVj6Kcjcgie43kZcxVAkBsJ624+DdPaI1+U=;
 b=Hbyq1QI2XeKHujzGC9KWc8zKbnIGsunVQfzRF+mTgpn4AJhC2iy5m6xtuOraxT0WAuq9cXDrr/h8wD9WB/aAiBwOlEQqmYM211W9i9HIiKNTnoh7pSLLtBd2h9CJ6O5xYPFl9OGGTJo+m79AVhic1Kez5trrd4gIcQxkAZCx21h+bX4aGKCc0MxZQLSVxMtlsVlqDFR9JQBJpWOWMrhgJbVq75IhCBSZ2R7SRU8+22PshDlC+QyZatGKFHLlhUD1s2rJtlzFFDMG0XjtyMNnVy7aakMX33Z0Y2EiKHHdMrthK4dHIJ+AXmy7WAlQAjSSdntNZ08q92amelvLK4pOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:21 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:21 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/30] drm/i2c: tda998x: Use drm_bridge_init()
Thread-Topic: [PATCH 23/30] drm/i2c: tda998x: Use drm_bridge_init()
Thread-Index: AQHVpFuytOzD+HDrhUWMxCyybPn/Ag==
Date: Tue, 26 Nov 2019 13:16:21 +0000
Message-ID: <20191126131541.47393-24-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc70e8d5-afd2-4088-c041-08d77272d95b
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM6PR08MB3237:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3237CEEFEE93E7DCF333E8F58F450@AM6PR08MB3237.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: itY43bm3CXp2OL9QAjnj7+0ohgrj6ZStZVkPUfL3ITn+0ylAQj3POqvzIyV05/SujjeZhfSTrIr5WnEnRKd6TM2t3fUeJkePhQiLSqHQTOaHwQX45GEISLraWtzpg27UHnDV7zsNFqtmuYB+7weHr5p0Ar9VYggxnjdf3CFey/bhF0u3OSAscmnZcb7sNQOZTTpSAbRG3G8oBoLGe5HDik8mgdun5GY3kWSja1pQxujQ7wP6xMXUtr+357+sBy1mCx9kbN4c44JJ+Wzo4Z6woaEAqrVA31K3UWmTaF2OZPI4035djolbfT0JaXi514vmJkkYHoamTX1xDto11nOyoGtqAVOBvovmocbmKWXBnK2S3cPCT+whxuJhgbzXqxSCyqVqm1jFntQhvrvjY3z+i03gc1KOEr/tc9AMwFQCyOVb5bP7iQvmkdK1hYyiEZ+1
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(26826003)(76176011)(2616005)(8936002)(106002)(316002)(14454004)(446003)(11346002)(6916009)(478600001)(102836004)(70206006)(4744005)(86362001)(305945005)(6512007)(22756006)(50466002)(1076003)(7736002)(4326008)(36756003)(70586007)(50226002)(5640700003)(76130400001)(8746002)(2351001)(99286004)(386003)(6506007)(2906002)(23756003)(356004)(2501003)(25786009)(54906003)(8676002)(5660300002)(26005)(6486002)(47776003)(3846002)(6116002)(186003)(81166006)(81156014)(336012)(36906005)(66066001)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3237;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8c16d75b-a447-43af-b585-08d77272d48b
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7q6ZPVbsYyZkbcJieEVz3QFR8l0pL6hCc8Ozk1rKDAjOYavxdDDFow4uTa/TvSWQXl2v9o4v59Iz9RUmYnxOh2ZHEJF7O/gdvSXAlM40qjp/5mHbtzZ4qKnHe/wE1DYvCx3U5dcDT50k24Nh53pZnXhYe66ZHofk1BF1dfI53D9m2kEiFeicSVdQMVO8IdbeLw+n9eAqH2blljNCgOjFAMF6DkUM4INa0hgjTbsJDhaOky/4doUGaAOEHCc16LoyCcdQ76YJ+9VM0zZxTntNW5jEimitHz9UzjSwvxYvhMfxCQgFIZ5zmv+ApViTdS+MeNdeilQOMh1mdxPs+iqtseCqG6gDPD3yp8oqzYooDpGD0egNSn7zjhRUDIJGi7mLqoGJalTowLbr8sPlz3Wui4ngRy1Sch3yPnpMQvqVd0LErMHXuv9WhD4tIFT5hLSO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:29.3940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc70e8d5-afd2-4088-c041-08d77272d95b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3237
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DpZqtyyKVj6Kcjcgie43kZcxVAkBsJ624+DdPaI1+U=;
 b=Uf+LCmypiVOATtAtYZBxWOwk5Q5N8mEWy83Pc22UotkN9beM3Ri7Wq+5G8GQ3u9cWq28QwLhpLm61IrHYzIhPVQmXjXDaABBdVPowzjCMASzmSX2vyag2/UFSSkTn7oVyYmnnggu5e1ZuzTXxAOBTfjoH9LpZELbD4CIQViq7AA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DpZqtyyKVj6Kcjcgie43kZcxVAkBsJ624+DdPaI1+U=;
 b=Uf+LCmypiVOATtAtYZBxWOwk5Q5N8mEWy83Pc22UotkN9beM3Ri7Wq+5G8GQ3u9cWq28QwLhpLm61IrHYzIhPVQmXjXDaABBdVPowzjCMASzmSX2vyag2/UFSSkTn7oVyYmnnggu5e1ZuzTXxAOBTfjoH9LpZELbD4CIQViq7AA=
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
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4
X2Rydi5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKaW5kZXggYTYzNzkwZDMyZDc1Li5m
N2RmYTY5NGFmZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKQEAgLTE5NzQsMTEgKzE5
NzQsNyBAQCBzdGF0aWMgaW50IHRkYTk5OHhfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJ
CWdvdG8gZmFpbDsKIAl9CiAKLQlwcml2LT5icmlkZ2UuZnVuY3MgPSAmdGRhOTk4eF9icmlkZ2Vf
ZnVuY3M7Ci0jaWZkZWYgQ09ORklHX09GCi0JcHJpdi0+YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9m
X25vZGU7Ci0jZW5kaWYKLQorCWRybV9icmlkZ2VfaW5pdCgmcHJpdi0+YnJpZGdlLCBkZXYsICZ0
ZGE5OTh4X2JyaWRnZV9mdW5jcywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJnByaXYt
PmJyaWRnZSk7CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
