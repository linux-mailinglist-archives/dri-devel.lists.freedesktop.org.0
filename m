Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD7E112AA3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EC66F50F;
	Wed,  4 Dec 2019 11:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367886F50F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:49:09 +0000 (UTC)
Received: from VI1PR08CA0124.eurprd08.prod.outlook.com (2603:10a6:800:d4::26)
 by DB6PR0801MB1958.eurprd08.prod.outlook.com (2603:10a6:4:73::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Wed, 4 Dec
 2019 11:48:34 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR08CA0124.outlook.office365.com
 (2603:10a6:800:d4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:34 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:33 +0000
Received: ("Tessian outbound 15590139dbb5:v37");
 Wed, 04 Dec 2019 11:48:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1593aa137f188207
X-CR-MTA-TID: 64aa7808
Received: from 27b0b5ea6d36.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C2DDF3E-45F2-4B29-920E-BD34AED50448.1; 
 Wed, 04 Dec 2019 11:48:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27b0b5ea6d36.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVxzEScDcWcNWXchJPU9fDRBCTskhoWv4+JEHSusRiEP2E0bGEzDCc0Sbm2qsq8JgyNXwiylJostSO/4qyMeFaF2E9vxHk6fUt23xfhj37u1dLcDNTLLATJueYTaBxevjDrXKX9Zebx8LeWbi25ayB+ACsq/AXG0+NfnW3CgqsI9H89MtmqehR8IWgL+0rb0PZmKSLRH6PBH28r8B0biL/gwk9FsR2edU/KQe2PqwVSy4j0hDdZg+q4u0hOYPWGU5SxUBbBuF4219Ml2uUwy+roY2sXU6/J/k98Kf6e0UklkGq7f8xYu8GzI5QEnTrH+m3iqP2yTCI3bZRuSgdUaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MOaSsR5jY0wtwz+PiDW06AIZcsZxDj0v9S4kmIV+VA=;
 b=F7e9Va60308TA9zXKwYBwOZrFcEl2MaXKt22lPxNnSO0Y0Au9FW72wuSnVZT4d1CqJIKZwooW/+7lLw6AquD4FSPiqQIYYvGs/VZsRpAWWTc1yR1KKQevWeNCpykqng0vjlsxR6/Ib6Qsex7cIRnPP+i472jFmUVrdjqI+lBUPbGJfNEpThlCKAaQjbxdeXodE5itigr5O3LnQbBRSidtylBWYaJKC7ICWraicRHAQLkT2F3BcCik4f6AsKR9u2WUkZKyHaa20sFJ39QkdpBynHVv/y9iZtroS8v/jzBQfC/t3gqZ02DuxQQeUcWhbFeYdy3vo8MB7nhDIUpemaF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4624.eurprd08.prod.outlook.com (20.178.13.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 4 Dec 2019 11:48:23 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:23 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 24/28] drm/mediatek: hdmi: Use drm_bridge_init()
Thread-Topic: [PATCH v2 24/28] drm/mediatek: hdmi: Use drm_bridge_init()
Thread-Index: AQHVqpi7pYXgRFSlykS2PKmc/BjiSw==
Date: Wed, 4 Dec 2019 11:48:23 +0000
Message-ID: <20191204114732.28514-25-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 971b8233-5024-4411-3c13-08d778afe43b
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|DB6PR0801MB1958:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1958E56777C71BE2B981F24B8F5D0@DB6PR0801MB1958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(2351001)(305945005)(316002)(6436002)(81166006)(7736002)(6916009)(4326008)(186003)(99286004)(6486002)(66446008)(5640700003)(4744005)(66476007)(1076003)(66556008)(54906003)(2501003)(5660300002)(66946007)(64756008)(6512007)(86362001)(11346002)(2906002)(44832011)(2616005)(14454004)(50226002)(6506007)(36756003)(25786009)(81156014)(8676002)(3846002)(71190400001)(52116002)(26005)(478600001)(71200400001)(8936002)(102836004)(6116002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4624;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Y2CFPPGxqO1fAvAD1HLdv1CyHaI8+Nz2Vc//xhcEkqXsz+FygNZK3wryNGtGFFdRqNLoZ6yz6h4I1vzI+pdcgAhm2sG8JM6uiZK5KG+W12cHzxQAgAP9HIpM0EUIJHJgX4fWfaBZHXb/zTcruF2VVaehsLQrRMU6Un1qftKnqSoZdNkd1isaPVEZ5JC/EXdM1SJNy08qI9+lYrHGfkXMcLF0wFSURZ90jzDbFy+lp4pSW7tG4Z3dbT1uDrSKF3YxEkfL8YQ9U7VdBdLrAuKpJ4WWCDGWH7sBtQwlDpExIx0Z4i8v3JlFVwVIr8kWICSkGBBxP/BdZe/J7UGjWaKvvj0mVLYvlu00LiP/FvWlkglPsL8cBWZr9xbjGkjQp0ZMZgTheY8LFW5xmhRbLv2C5yLjYoGtr6i/2jc+w3i/7um4dG7UAEuY6HtZKTYp8gTx
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(3846002)(6916009)(76176011)(6506007)(5640700003)(316002)(8676002)(6512007)(2906002)(7736002)(8936002)(6486002)(81156014)(86362001)(356004)(54906003)(81166006)(25786009)(50226002)(99286004)(336012)(2501003)(2351001)(6116002)(8746002)(36756003)(305945005)(14454004)(11346002)(26826003)(478600001)(4744005)(50466002)(23756003)(2616005)(107886003)(1076003)(186003)(22756006)(4326008)(26005)(5660300002)(70586007)(76130400001)(70206006)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1958;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4a18ad8e-9d7b-4f27-905c-08d778afddaa
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMgpBYrJDmN2fMKLLLvoiI4zvgvd7vtK2wg5YXoupKDymF5oDJKGhVjz7GH5xz5U8dNCUsbgfYIYHlMhQ3IaIvc/ZVEX0yhoWERi6TlSK+kyq/wFfvk01/AA6U4IjUYFZ16nXJ2DxQJEYovpNOzd9UK+kUDY1ZZ1GHoAopA5buPBb86U8JhFG786gvMdxoeTANygOuC/A5yS5VrBYDjaCy4aDBtNg008fGzrIsJpQiqzkLY2gfKtoGuHIvlsEEvbvzWdlV1lanXZaH8sYacFA2relMrbYPv07VXvFFDehe3zXx8ULTjFT9HumP8hkVyTdLOJyrSXVYfvn6OSp7fjVRvy0iC/JidfwWyenS9qkm55MrI8ATTGL/YZeYHchn23GCazuH7jVzfYRYvnd3pZrkSaKJ3SYJlR5Yim0iWOHHZQAhSc71N5JDBPgan03Qmd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:33.9381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 971b8233-5024-4411-3c13-08d778afe43b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MOaSsR5jY0wtwz+PiDW06AIZcsZxDj0v9S4kmIV+VA=;
 b=VXpLXIOwxbrLMCWztCBz0TFzJaZ2wxbL+CDvNfwM8Kc1UGXjbAWwAbmDtiS1V2BiSPBZCwwoUKaaJUFXRVe/NsugxZJRCpMDGj3Yf08urWwM8/5kkRtVgQn2IXWliAYw+f1YIHwqFUX2UDjh8tNJ/O9RnukMB+Ttnw3qRjLPA8M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MOaSsR5jY0wtwz+PiDW06AIZcsZxDj0v9S4kmIV+VA=;
 b=VXpLXIOwxbrLMCWztCBz0TFzJaZ2wxbL+CDvNfwM8Kc1UGXjbAWwAbmDtiS1V2BiSPBZCwwoUKaaJUFXRVe/NsugxZJRCpMDGj3Yf08urWwM8/5kkRtVgQn2IXWliAYw+f1YIHwqFUX2UDjh8tNJ/O9RnukMB+Ttnw3qRjLPA8M=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwppbmRleCBmNjg0OTQ3YzUy
NDMuLjk3NjFhODA2NzRkOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKQEAgLTE3
MDgsOCArMTcwOCw4IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9oZG1pX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAltdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoZGV2
KTsKIAotCWhkbWktPmJyaWRnZS5mdW5jcyA9ICZtdGtfaGRtaV9icmlkZ2VfZnVuY3M7Ci0JaGRt
aS0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKKwlkcm1fYnJpZGdlX2luaXQo
JmhkbWktPmJyaWRnZSwgJnBkZXYtPmRldiwgJm10a19oZG1pX2JyaWRnZV9mdW5jcywKKwkJCU5V
TEwsIE5VTEwpOwogCWRybV9icmlkZ2VfYWRkKCZoZG1pLT5icmlkZ2UpOwogCiAJcmV0ID0gbXRr
X2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
