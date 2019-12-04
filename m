Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD06112A8F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0419D6E8D5;
	Wed,  4 Dec 2019 11:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0BC6E8D7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:28 +0000 (UTC)
Received: from VI1PR0801CA0090.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::34) by AM0PR08MB3795.eurprd08.prod.outlook.com
 (2603:10a6:208:105::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:26 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR0801CA0090.outlook.office365.com
 (2603:10a6:800:7d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:25 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:25 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Wed, 04 Dec 2019 11:48:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59c96d7852f471fc
X-CR-MTA-TID: 64aa7808
Received: from c7e01adb9f43.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D48E4D9-3BC3-41A5-BAAA-9061C9E30BEF.1; 
 Wed, 04 Dec 2019 11:48:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7e01adb9f43.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIFXnTjKWQLsH0BJcJOktvXQUjheEWFeUoBH7eN3xjvv8OMvDfIVSMm1Iw0f3MxMTlhMkZAjp/wb/r425OUlrn7sv3lRFYhxt7nDaqxyFgsRgrXglHHiaWh7EvBGHRPF1TdH67XkhFEFiRWvx8Bv7liS51LFZbznoPgVa4g0ieRb7lchqkQCpPzmahq2c+MqV6Y6yLFSUcx87SxOHlLSQNKavVE9B5TWowfBNW2Gj2tqlC+gE4f0Z8KOyo1VlJzReGoVbvCS7S1/+pDk81oHkq1dpR5B/khbXKkhQF8Xefx46gFNZ4UnTJHzTpqeBHKou6xB6KwXzOWOc6KgRqmLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pok0SSk5Bh8w7qG9tzg8paAi0CtuxpzJ5qzAThY9f2U=;
 b=G535EVc/j2HQhiJielD7IBiiBuJcE6stNczH8MXmvBNMIalGSxFgzVwsnBpCM/V2ALh1skal10OlRVFRUBza8BaMeuihyP3cyy0cvqzzhVAGq3hWfMB59Te54EoI2RLCqfxD9yRfmP5iLnP8Oft9NiIxX0+TWiEdTnyW0k1RO8bjdathgkkyqHM9LCpWiDDbnlkF/BbIAZx+vqSj39+uRHVIXcgT6/RldngO2tEWa/xMb7WEm3E7f1ab2NAo4XFIaYcX/4bLYDH1pJ3Q66g6BqIMzXRqjxIJliALn6C1/W9q32jla4KR6AN9eclpHP6IjO4NoUSVIiPniZcmyXdXlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:12 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:12 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 12/28] gpu: drm: bridge: sii9234: Use drm_bridge_init()
Thread-Topic: [PATCH v2 12/28] gpu: drm: bridge: sii9234: Use drm_bridge_init()
Thread-Index: AQHVqpi1nuxUXRNmNkWRvMMZxB0aZQ==
Date: Wed, 4 Dec 2019 11:48:12 +0000
Message-ID: <20191204114732.28514-13-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 61189814-00ae-409d-6ad8-08d778afdf26
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM0PR08MB3795:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB379529F9AADCD8701C5230C38F5D0@AM0PR08MB3795.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:949;OLM:949;
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
X-Microsoft-Antispam-Message-Info-Original: 7fP5YXDXUh3a+y67F8ckezTnsjy4i//b/OcxVdH9S5K+cwz4brcpKYcrdN0Rj2FR2XNcvKcMM9iBmPtx+1vOhNdBOZFjKEO+dj3euFJPu2jPJjr9cHs63Y+yl0IRw0raFA8WPv+Tj/VKL1Jz5n6vEDAUNMAGU7afR6kEbWqGE8jbuY72+lAOlvW8plJNz1wqt71tSTDdNl/aqReYL4E+72YPmJ3oqY19abWTUcG9bN3/nR9VophGAmULUadSd9U4pE1j++3HhDd/Rk2HQAUSQlFO3lXMoSDnfmAstb8OmJ9W4AL3va7n1cnkRRy/j9/eLRYQPd7m9Y+3gtu/WZfxEZQzmbH4nBhBvJdlUfyP/6hSP6iez9j8DyRQ+hHZbKId3zCJYtVYq6uwKCA3lPE7rPrBznDimRW0iu//fBSYTMhOC/SDyOZcwPu/V7OCF3It
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(11346002)(6916009)(2616005)(7736002)(102836004)(186003)(6486002)(336012)(26005)(76176011)(305945005)(6506007)(70206006)(81156014)(2351001)(70586007)(8746002)(8676002)(81166006)(8936002)(50226002)(2906002)(5660300002)(86362001)(76130400001)(6512007)(3846002)(6116002)(54906003)(99286004)(5640700003)(1076003)(4326008)(316002)(36906005)(4744005)(356004)(107886003)(25786009)(22756006)(26826003)(36756003)(2501003)(14454004)(23756003)(478600001)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3795;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3aba484f-67f7-45d6-bcdc-08d778afd75b
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HoQ+Uw9PGyVsb5T4IasJkrUBsp1MlhTAyuKChX7agljABhAvIGTXSfpu8mUkvNqvU9i1mQNwhuK+4uzbnNhwOy+bb2qGV7JvSy9X0GVLOsMQk+IRr+tBtALrKa4ljEMd2RoIqBRgZkF6Mm35mhymFnvBMo2p8k35TsVL0Qat90lnK/eT4mUb4/Zd57M6r/xYJLwv94LjjyZjQbw/+k/OQjbKRF35z5TTQUd5Zv9dXsT/jua70OoEigChf1BGHNKmBsRyoaVNXHD6LfvNEkJeMVHW8t1sOb5LqXwqn3JPJE+GAhFod2rv79XrKkcJJHLmTIjkoPzB0U+nKCtMavUDP5Fyx490R1LI1UFKmRqOLORd6Zq6+Ysc8CQ42CkpGdt53oieio0sz9qbCo6FUB7CHZ7qm1Ly4+vsjTw6YCcE5ivq/rFxBnPB1xG21gxoeeh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:25.4070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61189814-00ae-409d-6ad8-08d778afdf26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pok0SSk5Bh8w7qG9tzg8paAi0CtuxpzJ5qzAThY9f2U=;
 b=BFOVFa+RmEEICPsBCDlSSQqRbWaZhg1hEKmlKXAVfczokPPPCq2YeI7ea6JK5MUtdAyC08QdTV6uvf+VzlSL8FlETpwKm0IjrxRA6mg7ATFcWtvdVbpYzgU8hjR9FKW711Ma3qoT9JCydXcG0Y/lMc6o4RU/dy1VfTAkSqbgXJ8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pok0SSk5Bh8w7qG9tzg8paAi0CtuxpzJ5qzAThY9f2U=;
 b=BFOVFa+RmEEICPsBCDlSSQqRbWaZhg1hEKmlKXAVfczokPPPCq2YeI7ea6JK5MUtdAyC08QdTV6uvf+VzlSL8FlETpwKm0IjrxRA6mg7ATFcWtvdVbpYzgU8hjR9FKW711Ma3qoT9JCydXcG0Y/lMc6o4RU/dy1VfTAkSqbgXJ8=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5
MjM0LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKaW5kZXggZjgxZjgxYjcwNTFmLi5iZmQzODMy
YmFhMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCkBAIC05MjUsOCArOTI1LDcgQEAgc3Rh
dGljIGludCBzaWk5MjM0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAKIAlpMmNf
c2V0X2NsaWVudGRhdGEoY2xpZW50LCBjdHgpOwogCi0JY3R4LT5icmlkZ2UuZnVuY3MgPSAmc2lp
OTIzNF9icmlkZ2VfZnVuY3M7Ci0JY3R4LT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsK
Kwlkcm1fYnJpZGdlX2luaXQoJmN0eC0+YnJpZGdlLCBkZXYsICZzaWk5MjM0X2JyaWRnZV9mdW5j
cywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJmN0eC0+YnJpZGdlKTsKIAogCXNpaTky
MzRfY2FibGVfaW4oY3R4KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
