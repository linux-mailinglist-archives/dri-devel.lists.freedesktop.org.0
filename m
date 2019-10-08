Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B50CF5D4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170A26E0D3;
	Tue,  8 Oct 2019 09:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60067.outbound.protection.outlook.com [40.107.6.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755826E0D3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:18:14 +0000 (UTC)
Received: from VI1PR08CA0153.eurprd08.prod.outlook.com (2603:10a6:800:d5::31)
 by VI1PR08MB5357.eurprd08.prod.outlook.com (2603:10a6:803:12e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Tue, 8 Oct
 2019 09:18:10 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0153.outlook.office365.com
 (2603:10a6:800:d5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Tue, 8 Oct 2019 09:18:10 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 09:18:08 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Tue, 08 Oct 2019 09:18:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4a88726849cbcbb
X-CR-MTA-TID: 64aa7808
Received: from faf6d678d58a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47CF5C05-BED8-4367-8CD4-83D474D9F35A.1; 
 Tue, 08 Oct 2019 09:17:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id faf6d678d58a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 08 Oct 2019 09:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FskyOVXmne9iHFQ1X79nCTlHTQYwBz6Fe7Q1fI7KSGdBdIQVSC1e94lY7tm4hh3DW/WGE/LVNqQT+ZA+WeTnYLBI5r7zeFn4Ng4+D3QD/O1BzPhzoyEGtiI4ADOEPZnO9TiBQ0KSX2UqKuZ8PbFkYJuj6k1jjUNEVAlXCi0mslMKavDV6Ze/Y+WvPgCarL6bcuIPmomYSZoqyiIpZqX1inuVnslKY/0l3JyciLtWdrzjoxs1IkY2mFnvnnTVUUIAUstfolzxFRwicyF1zO3SWeQvSGJHSVjIiuGBduIA/mOci8Db/cxb7TiqOIRD/DHUVBw9vGF0u5Ge7zot4gdnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/LPRXia6sgkEMw4kcIUVdxLcgOsgR63Gx1IE1Ts/as=;
 b=SiQ9NB5pnIiJaYNO3IeRF5AMpAhUqT6wmLB9vhA6mAemHApiUbZKL8HhRhea/GLCCZ3sHgsQbuQue03iWszyMbbHjdls54RVn4y1ONcQ/1XWfFn2msPkXC6PVssNGHXZ0tagVXVvMDJFnPOYOEybA4BDOjWbNXJ1DTjZ9NwPUFzxnM/eNgj/0ymtIgAmHUj5AVbjsSRPrxz2ujSLr+CAxhE0SGIuVtnZlQCuf88jsejARtdoZws+9N8XuSagm25bM6ExC7eheBxVXfpbwaad1x5cUMT0Lh6kYdLV9MwTlRPbMp2ZofYE26x0NG9H4xMRJeRyL9mIF/41JcxRrjifpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3294.eurprd08.prod.outlook.com (52.134.31.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 09:17:53 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 09:17:52 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVfblD7I+ubO1huUCp0qQz7Z0Q4Q==
Date: Tue, 8 Oct 2019 09:17:52 +0000
Message-ID: <20191008091734.19509-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::21) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d268a4fd-37ac-4ac5-ef4d-08d74bd06f0a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3294:|VI1PR08MB3294:|VI1PR08MB5357:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5357859502901CA7A03ED8509F9A0@VI1PR08MB5357.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:171;OLM:171;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(71190400001)(50226002)(64756008)(66476007)(66556008)(256004)(14444005)(3846002)(66446008)(8936002)(6436002)(6116002)(25786009)(102836004)(52116002)(4326008)(6512007)(305945005)(14454004)(478600001)(386003)(110136005)(55236004)(8676002)(81166006)(81156014)(66946007)(99286004)(6506007)(54906003)(36756003)(316002)(7736002)(26005)(66066001)(86362001)(186003)(2906002)(6486002)(476003)(71200400001)(2201001)(1076003)(2616005)(2501003)(486006)(6636002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3294;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: A9hxokkjt2wI5fN9hvXVNO7RKBq0HFVdNNHiTwHGz71e9eZLj31Xq6OuyJepAYKE5kKF0yorPwO/2fcx7VP6U9xpsm+OKyFaRMJ0j+kaXibDy2DK8wtjMY9FtZcaCdHq76rpe5/+yNjGMPTDTXb4o1UxqkuDRgK8N+NVAY/VNwlHy8x394PN2kri3UQOPn+DMes3SrXmKKCClS9Tv1kKqmni0V4Cv0mltqE52SIrqtRRCMjOChNjDRW0e2VXTWrpgmFg6kNFqzsdVjEKyrtQ0Ke7BW+048XAnPrKxlacmo/tF+2QaN+2tfhVGxogfKTEy1YSWYrNhjD/cZeWBwk4K+m6nhXVaR9xEKHSDbINv/lRRiYHGqYdJnrgXxHs9zH0dKjTlfcuIqdQdCDsxvg/6tAFwvOd1QAeKEIe8SI7WoQ=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3294
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(199004)(189003)(47776003)(102836004)(1076003)(305945005)(2501003)(50466002)(86362001)(99286004)(2201001)(6636002)(66066001)(7736002)(5660300002)(356004)(126002)(486006)(81156014)(25786009)(8746002)(8936002)(50226002)(81166006)(478600001)(26826003)(8676002)(22756006)(26005)(6506007)(386003)(476003)(2616005)(14444005)(3846002)(63350400001)(336012)(186003)(6116002)(6486002)(6512007)(14454004)(316002)(36756003)(76130400001)(23756003)(2906002)(4326008)(36906005)(54906003)(70586007)(70206006)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5357;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 86a1dbbc-cf2a-4003-cfb4-08d74bd06560
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UAOTGr8C8l6C+Cqc+ISXZVXNfK6pDixMXtDgbggRoJfFVb1S27JGAKaYpB1YMfzDfIOVwPmHV+wrmB1owA20IakMQBmRFukxVSItFkFHtB/byuUYPw9FcKQMd9A0CvakBqsSP1QlwdUi/iWY6LvvXoISkqrCH8RtfyngdFNtaSjkYK8mZmT6Zyvf+nTJHmMQnE/p9BiU46/2oK5mDpbcPlg8Q70L+oRNhxZAC0tJhYvXOOjnjWBW71Xuvav9/CFkLH95kBxD3S7shzmTRvyvQYA+30tOxC5sfih9gWX8DUfM+HkVu4OpuGXJCfjsuJZo/fZHZQ6XX4hGoqv5QO66t7av/4Yf+1tIdb5chvtl6EW+y6I5nppohC4538eQxVW8zgr+N5M7xZAYEW1xY8YfSbq45WMUVuIKCD2raWrDLG0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 09:18:08.3101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d268a4fd-37ac-4ac5-ef4d-08d74bd06f0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5357
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/LPRXia6sgkEMw4kcIUVdxLcgOsgR63Gx1IE1Ts/as=;
 b=sF4cXpAipWlHj2Tj8zMNA3GzOHDCG/hsUUEIfeHZRTQL3MhGS7PO7p9JQqowDTQDZOoTOL+sZ2ow25AqHHAimwaawkSFpwGEQbjL0bYCsrgY91MXulNMq3I4ENmpR1gsNOvUl8jm4Rchinj7mNsxBUtlSMgLOSScxYviy3F8gwE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/LPRXia6sgkEMw4kcIUVdxLcgOsgR63Gx1IE1Ts/as=;
 b=sF4cXpAipWlHj2Tj8zMNA3GzOHDCG/hsUUEIfeHZRTQL3MhGS7PO7p9JQqowDTQDZOoTOL+sZ2ow25AqHHAimwaawkSFpwGEQbjL0bYCsrgY91MXulNMq3I4ENmpR1gsNOvUl8jm4Rchinj7mNsxBUtlSMgLOSScxYviy3F8gwE=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IGNvbG9yX2RlcHRoIGFjY29yZGluZyB0byBjb25uZWN0b3ItPmJwYy4KClNpZ25lZC1vZmYt
Ynk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Ci0t
LQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgIDEgKwog
Li4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjAgKysrKysr
KysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
aCAgIHwgIDIgKysKIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5o
ICB8ICAxICsKIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8
IDE5ICsrKysrKysrKysrKysrKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2Jf
Y29ubmVjdG9yLmMgIHwgIDQgKysrKwogNiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcx
X2NvbXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcx
X2NvbXBvbmVudC5jCmluZGV4IGMzZDI5YzBiMDUxYi4uMjdjZGIwMzU3M2MxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVu
dC5jCkBAIC05NTEsNiArOTUxLDcgQEAgc3RhdGljIHZvaWQgZDcxX2ltcHJvY191cGRhdGUoc3Ry
dWN0IGtvbWVkYV9jb21wb25lbnQgKmMsCiAJCQkgICAgICAgdG9fZDcxX2lucHV0X2lkKHN0YXRl
LCBpbmRleCkpOwogCiAJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfU0laRSwgSFZfU0laRShzdC0+
aHNpemUsIHN0LT52c2l6ZSkpOworCW1hbGlkcF93cml0ZTMyKHJlZywgSVBTX0RFUFRILCBzdC0+
Y29sb3JfZGVwdGgpOwogfQogCiBzdGF0aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtv
bWVkYV9jb21wb25lbnQgKmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKaW5kZXggNzUyNjNkOGNkMGJk
Li5iYWE5ODZiNzA4NzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTE3LDYgKzE3LDI2IEBACiAjaW5jbHVkZSAia29tZWRhX2Rl
di5oIgogI2luY2x1ZGUgImtvbWVkYV9rbXMuaCIKIAordm9pZCBrb21lZGFfY3J0Y19nZXRfY29s
b3JfY29uZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKKwkJCQkgIHUzMiAqY29s
b3JfZGVwdGhzKQoreworCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uOworCXN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpjb25uX3N0OworCWludCBpLCBtaW5fYnBjID0gMzEsIGNvbm5fYnBj
ID0gMDsKKworCWZvcl9lYWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUoY3J0Y19zdC0+c3RhdGUs
IGNvbm4sIGNvbm5fc3QsIGkpIHsKKwkJaWYgKGNvbm5fc3QtPmNydGMgIT0gY3J0Y19zdC0+Y3J0
YykKKwkJCWNvbnRpbnVlOworCisJCWNvbm5fYnBjID0gY29ubi0+ZGlzcGxheV9pbmZvLmJwYyA/
IGNvbm4tPmRpc3BsYXlfaW5mby5icGMgOiA4OworCisJCWlmIChjb25uX2JwYyA8IG1pbl9icGMp
CisJCQltaW5fYnBjID0gY29ubl9icGM7CisJfQorCisJKmNvbG9yX2RlcHRocyA9IEdFTk1BU0so
Y29ubl9icGMsIDApOworfQorCiBzdGF0aWMgdm9pZCBrb21lZGFfY3J0Y191cGRhdGVfY2xvY2tf
cmF0aW8oc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCkKIHsKIAl1NjQgcHhsY2xr
LCBhY2xrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9r
bXMuaAppbmRleCA0NWM0OThlMTVlN2EuLmE0MjUwMzQ1MWI1ZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKQEAgLTE2Niw2ICsxNjYsOCBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2ZsaXBfaCh1MzIgcm90KQogCQlyZXR1cm4gISEocm90
YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1gpOwogfQogCit2b2lkIGtvbWVkYV9jcnRjX2dldF9j
b2xvcl9jb25maWcoc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0LAorCQkJCSAgdTMyICpj
b2xvcl9kZXB0aHMpOwogdW5zaWduZWQgbG9uZyBrb21lZGFfY3J0Y19nZXRfYWNsayhzdHJ1Y3Qg
a29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KTsKIAogaW50IGtvbWVkYV9rbXNfc2V0dXBfY3J0
Y3Moc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZS5oCmluZGV4IGIzMjJmNTJiYThmMi4uNzY1M2YxMzRhOGViIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKQEAgLTMy
Myw2ICszMjMsNyBAQCBzdHJ1Y3Qga29tZWRhX2ltcHJvYyB7CiAKIHN0cnVjdCBrb21lZGFfaW1w
cm9jX3N0YXRlIHsKIAlzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSBiYXNlOworCXU4IGNv
bG9yX2RlcHRoOwogCXUxNiBoc2l6ZSwgdnNpemU7CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwpp
bmRleCAwYmE5YzZhYTM3MDguLmU2OGU4Zjg1YWIyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBA
IC03NDMsNiArNzQzLDcgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2lt
cHJvYyAqaW1wcm9jLAogCQkgICAgICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxv
dykKIHsKIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBrY3J0Y19zdC0+YmFzZS5jcnRjOworCXN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9ICZrY3J0Y19zdC0+YmFzZTsKIAlzdHJ1Y3Qg
a29tZWRhX2NvbXBvbmVudF9zdGF0ZSAqY19zdDsKIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0
ZSAqc3Q7CiAKQEAgLTc1Niw2ICs3NTcsMjQgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1
Y3Qga29tZWRhX2ltcHJvYyAqaW1wcm9jLAogCXN0LT5oc2l6ZSA9IGRmbG93LT5pbl93OwogCXN0
LT52c2l6ZSA9IGRmbG93LT5pbl9oOwogCisJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rl
c2V0KGNydGNfc3QpKSB7CisJCXUzMiBvdXRwdXRfZGVwdGhzOworCQl1MzIgYXZhaWxfZGVwdGhz
OworCisJCWtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoY3J0Y19zdCwKKwkJCQkJICAgICAm
b3V0cHV0X2RlcHRocyk7CisKKwkJYXZhaWxfZGVwdGhzID0gb3V0cHV0X2RlcHRocyAmIGltcHJv
Yy0+c3VwcG9ydGVkX2NvbG9yX2RlcHRoczsKKwkJaWYgKGF2YWlsX2RlcHRocyA9PSAwKSB7CisJ
CQlEUk1fREVCVUdfQVRPTUlDKCJObyBhdmFpbGFibGUgY29sb3IgZGVwdGhzLCBjb25uIGRlcHRo
czogMHgleCAmIGRpc3BsYXk6IDB4JXhcbiIsCisJCQkJCSBvdXRwdXRfZGVwdGhzLAorCQkJCQkg
aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9
CisKKwkJc3QtPmNvbG9yX2RlcHRoID0gX19mbHMoYXZhaWxfZGVwdGhzKTsKKwl9CisKIAlrb21l
ZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+aW5wdXQsIDApOwogCWtv
bWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAmaW1wcm9jLT5iYXNlLCAw
KTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCAyODUxY2FjOTRkODYuLjc0MGE4MTI1MDYzMCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29u
bmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
d2JfY29ubmVjdG9yLmMKQEAgLTE0Miw2ICsxNDIsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9j
b25uZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAogCXN0cnVjdCBrb21lZGFf
ZGV2ICptZGV2ID0ga21zLT5iYXNlLmRldl9wcml2YXRlOwogCXN0cnVjdCBrb21lZGFfd2JfY29u
bmVjdG9yICprd2JfY29ubjsKIAlzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3IgKndiX2Nv
bm47CisJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm87CiAJdTMyICpmb3JtYXRzLCBuX2Zv
cm1hdHMgPSAwOwogCWludCBlcnI7CiAKQEAgLTE3MSw2ICsxNzIsOSBAQCBzdGF0aWMgaW50IGtv
bWVkYV93Yl9jb25uZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAogCiAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yl9jb25uLT5iYXNlLCAma29tZWRhX3diX2Nvbm5faGVs
cGVyX2Z1bmNzKTsKIAorCWluZm8gPSAma3diX2Nvbm4tPmJhc2UuYmFzZS5kaXNwbGF5X2luZm87
CisJaW5mby0+YnBjID0gX19mbHMoa2NydGMtPm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29s
b3JfZGVwdGhzKTsKKwogCWtjcnRjLT53Yl9jb25uID0ga3diX2Nvbm47CiAKIAlyZXR1cm4gMDsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
