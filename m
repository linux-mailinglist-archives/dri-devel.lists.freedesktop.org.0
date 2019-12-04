Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13629112A8B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F326E8D3;
	Wed,  4 Dec 2019 11:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF326E8CA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:24 +0000 (UTC)
Received: from VI1PR0801CA0081.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::25) by DB8PR08MB4955.eurprd08.prod.outlook.com
 (2603:10a6:10:38::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:22 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR0801CA0081.outlook.office365.com
 (2603:10a6:800:7d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:22 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:22 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Wed, 04 Dec 2019 11:48:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afd437b83f5afa12
X-CR-MTA-TID: 64aa7808
Received: from c7e01adb9f43.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0047982A-6A09-424F-ABFC-C8B126E00B8E.1; 
 Wed, 04 Dec 2019 11:48:13 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7e01adb9f43.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FenAjWvI3+20XAuOXg9Ocgh+8owCdvy8p3SBl8mXF1RFDyDrdN+G/qOq7KEsQPD0z8aGWJ/EGGlvL2NcxwI4imcrroc4tY5Y33E0UWzCMVlQyIdX24QRGPpRAWhbcdzU6/gKX3Sm52P1770d94iae5V3cnZu6dv1k7+bXo8/GKnRT5cgrGdBVL4jcO0dms6msw8aXCcW82SrVS0Vco0VGeTGkUrcm3150yF8ljnOwsT02DqZG+x64MkrlqW3ULEQsKwM8VwNJ9JjwK+jxFYUQV5Hbp8NxGyvcxW6kuhENUmRQltO6BOB8tzJE6g3tGzrryWqSgFzI7/wIZAbgbCzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG65isiFDLr+qbpV61uGylAb5rk13yS4rBT9XdjMRJo=;
 b=hZGFo038AmeKK2hvQawHhmT63HmFhuLvzDnCXdw64NK1apFF6zAHkg7fjWlw+0lLcSUeuSvV+d+m8HOe2+6PHOo1ScR8GRlQLsAB7z15h5cl6gjPpRflJH1UnrPWXux0e23+x9Daj61lz/UVvwJ8SheE6UhSx1oAbLNch/chqxbqKV5ZBG6Z80l6dpi801LRay8tL7vsLvu3cURRcx71pCm5eQV6haSSwqAh98mIDtz3km2CX8L2kz/0TG4Swy/OfuWSfm3qi+vZmiE/gZ2V/ZqMnWOKJ86fap8H6RtI5ImKqZoFvZlMyge5AheLPj9zuinytwUHhh+woN7V2MKdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:11 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:11 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 11/28] drm/bridge: sii902x: Use drm_bridge_init()
Thread-Topic: [PATCH v2 11/28] drm/bridge: sii902x: Use drm_bridge_init()
Thread-Index: AQHVqpi060ZTiZ8Q+E27VJLEZbFhxQ==
Date: Wed, 4 Dec 2019 11:48:11 +0000
Message-ID: <20191204114732.28514-12-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: e7b8f430-b7db-4c41-85eb-08d778afdd64
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|DB8PR08MB4955:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4955EA9D0726D68DBA065E2A8F5D0@DB8PR08MB4955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
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
X-Microsoft-Antispam-Message-Info-Original: NF75NZAigPFc2OTrlEMXxMLnu+dG52roI9bkFzD4OFE5KAqWCe6+94RkSaJvCVaXcaSZp72mqyUTf1j/1KU83KT66yxHO5F0064n4osTUVfKxby/OsriyRJYudk1TQeDGlikDONTGIUgthjb7y1UM9hRsJPp9er+/jqDfN86LCwV+gmlbAIMpIDEZ1WFIownXD2k+Le6iTxT6YYBFOM27dkwqMSnkx/Y+tV89U2CEJlcAkwZLhNjGWU/VqIjVVX0xPhf7qz6VLU20wDMAIf52WLQcR81IfSEk0kTvOw4rcR2db9PJ7WoYQhlFMqmB0VQxaWFf7LWxooV91rGMlEhp2wcPipe9MDP5BHw76R5W15izLXJCIBbkjQFubUoSfkSPKh6lju/XjAvuRiSe32MHudO+W8kVut/5Rw1w9epOuhOZMhHFMRSU+T/3PkCuaaL
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(189003)(199004)(54906003)(2906002)(76176011)(11346002)(2616005)(99286004)(4326008)(6486002)(70586007)(305945005)(5640700003)(70206006)(6506007)(36756003)(50466002)(316002)(26005)(336012)(36906005)(6512007)(107886003)(8676002)(81156014)(7736002)(102836004)(186003)(76130400001)(81166006)(25786009)(3846002)(6116002)(8746002)(356004)(8936002)(1076003)(23756003)(4744005)(50226002)(22756006)(2351001)(5660300002)(26826003)(86362001)(14454004)(6916009)(2501003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4955;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d3ed424d-5a77-47f3-2f5a-08d778afd6c9
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfR8Sl33sbmz3t8I007bzNbI6kgC7ILtVL9aXkYXKUWq0ILGHzP1B0PE9dMkNasRigKttYJrtPUUPfA/YzAE1b/lfS+lePuH/od2zEuvxrF9Wj4NfUdKjkUheWx/UcuASTdV7h8hvICpwdHnavnC/UjTTVoxsfRbsF1ulO/IDvggdD/XbrAgerNji1kJFc66F01YeqXbE+vhDodj+oAMswCSHAVheNQckxgZn7yZ8wDN8OBlMOFCOr6/KXSOhzb2oPXgo3JQqEDfaaCfwlkdSDcDPDkENXgT6oZ5evXZ6BQW/L1GjmXi1t8PW+zUW0DvUhezih0MCNqzqGcXBLb2N8O7vWYoSe0aEiDjYq9xjcfvN+yv+ZSJqDn7hiPBtMReNYvdJWDb8ziIW7p24rGAGcttaDYkNdB2tsjZa9kUUk5qOWuu9BLxtNF0Y4ix8x1+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:22.4396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b8f430-b7db-4c41-85eb-08d778afdd64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4955
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG65isiFDLr+qbpV61uGylAb5rk13yS4rBT9XdjMRJo=;
 b=AWoRiu4vUlnxXR/XRpkfe/S7rlznzgt0NZttkwwk5xYoM5MLEHNUU1YFXFa7mOt+joGLFd60MKD9VWsTSc7WSHDpSfYi8YTXEKDf9qkbYBGmIUlds+22HBXMnNhTCzotWaQdupdYix/DiRcmvTcmWVO2Eh3aY/cR/GwjfPE3syU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG65isiFDLr+qbpV61uGylAb5rk13yS4rBT9XdjMRJo=;
 b=AWoRiu4vUlnxXR/XRpkfe/S7rlznzgt0NZttkwwk5xYoM5MLEHNUU1YFXFa7mOt+joGLFd60MKD9VWsTSc7WSHDpSfYi8YTXEKDf9qkbYBGmIUlds+22HBXMnNhTCzotWaQdupdYix/DiRcmvTcmWVO2Eh3aY/cR/GwjfPE3syU=
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
MDJ4LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKaW5kZXggYjcwZThjNWNmMmUxLi4yYTlk
YjYyMTQ4NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCkBAIC0xMDE3LDkgKzEwMTcsOCBA
QCBzdGF0aWMgaW50IHNpaTkwMnhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAkJ
CXJldHVybiByZXQ7CiAJfQogCi0Jc2lpOTAyeC0+YnJpZGdlLmZ1bmNzID0gJnNpaTkwMnhfYnJp
ZGdlX2Z1bmNzOwotCXNpaTkwMngtPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwotCXNp
aTkwMngtPmJyaWRnZS50aW1pbmdzID0gJmRlZmF1bHRfc2lpOTAyeF90aW1pbmdzOworCWRybV9i
cmlkZ2VfaW5pdCgmc2lpOTAyeC0+YnJpZGdlLCBkZXYsICZzaWk5MDJ4X2JyaWRnZV9mdW5jcywK
KwkJCSZkZWZhdWx0X3NpaTkwMnhfdGltaW5ncywgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJnNp
aTkwMngtPmJyaWRnZSk7CiAKIAlzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc2lpOTAyeCwgZGV2
KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
