Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F599CBCC1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9FB6EBA3;
	Fri,  4 Oct 2019 14:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20088.outbound.protection.outlook.com [40.107.2.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ACC6EBA3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:12:59 +0000 (UTC)
Received: from DB6PR0802CA0042.eurprd08.prod.outlook.com (2603:10a6:4:a3::28)
 by HE1PR0801MB1788.eurprd08.prod.outlook.com (2603:10a6:3:88::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Fri, 4 Oct
 2019 14:12:55 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by DB6PR0802CA0042.outlook.office365.com
 (2603:10a6:4:a3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Fri, 4 Oct 2019 14:12:55 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 4 Oct 2019 14:12:53 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Fri, 04 Oct 2019 14:12:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d9885e1d27eba37
X-CR-MTA-TID: 64aa7808
Received: from bc5c134baa14.3 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 50670DAA-8737-4981-809C-198C24081F0A.1; 
 Fri, 04 Oct 2019 14:12:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc5c134baa14.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Oct 2019 14:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU/suPgWAuZut1k8r5HYqCwR4Rv98lTcWiPa9eOH/hVXDrRkY39UHtrggoJSVAiYc/kqrs5pm9UCbvlRu+unjOgIry4o8OvC+WlHsZOWiQpfIjyi+LZIK4yBZKeZOz7OBHomujpiiyccpV1GyAa7vFys4GcRl/BrYHk9KzF3E5cphuNm+6hrXOs+B+OCGmAMmfy7Z7xyOyUbm8imcQemIdI+nHZnYYWna7LL9KKouAoxxDq4mUmxHptlRTQVYVdHfhHbnbMY/uIPRT6glywwb/H8D2Nvb/siIMa/KL+AaNM6Ah80twQ71b3BqH6sa9ShZf9sDPFhrrTFUbegnWfOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw7JRZIHKFb5y+T27fqtvJl9RwtTBn8opjA98fHySwM=;
 b=CsfiWscopGUQzBvm8uIC0uAnyCVFFrm5fKJqMtKYptItkT/vdqmsxEn1xi7tJ5lw2+4sIiotIbjVzqvk5jYUR7JrA9UaGQSOb/Cw4dhNUwDjGMNrHb1LGUCf0YglqVNtLnlxmagg/gBwQtNZK7Y2/+yMU/InMqToRtazsf12w/eiZ3bmDl6/FAULmByVPjNw4gEXNpvasBR0HZKTwit7KvAHWTYyzFjwfRQDW1fzyY5VzPlfAjV6NLyaLSXAtcY44JL48PRLbiGNjlXTq0zh5dKc8PbfHvfM1yTqweLLCCJqcMM9qP+J6wAjkhKu9arPV9UJz8tAB6ZMmPA7e8v/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB3905.eurprd08.prod.outlook.com (20.178.82.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:12:39 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::748f:576b:c962:6a46]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::748f:576b:c962:6a46%3]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 14:12:38 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "sean@poorly.run"
 <sean@poorly.run>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH v3] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVer3HxoO2jRYwYkCqyNFFHsjE5g==
Date: Fri, 4 Oct 2019 14:12:38 +0000
Message-ID: <20191004141222.22337-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::15) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5d0ed09a-c1ec-470b-86b2-08d748d4f2a8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM0PR08MB3905:|AM0PR08MB3905:|HE1PR0801MB1788:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB17884C3A1BB14551B167AADAE49E0@HE1PR0801MB1788.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
x-forefront-prvs: 018093A9B5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(189003)(199004)(2501003)(26005)(110136005)(36756003)(54906003)(316002)(25786009)(66066001)(81166006)(6116002)(81156014)(50226002)(8936002)(8676002)(86362001)(6506007)(186003)(99286004)(2201001)(52116002)(14444005)(2906002)(256004)(486006)(305945005)(7736002)(476003)(2616005)(3846002)(6436002)(71190400001)(71200400001)(44832011)(14454004)(5660300002)(386003)(66946007)(64756008)(478600001)(66476007)(66446008)(4326008)(66556008)(102836004)(1076003)(6512007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3905;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cBY6hTaII7jgrmBSkCAoi2M+QBQifZ6kF/f7tFOETPZJpwCbHB7kO9nVkx07owJpe+LyqsZl9CvfyfIdJfS61SkqQLeuPbcVAiPicVWHHUcxEobkltLzaNmwt/f/XGabL/V4G+5HQ7f15lkEjIkcWA2v8jIjMCCM58rVRardXjPb5z4/2WphavFl/COdiO5D5ofr1NqqtvHO6jq9tzNYq29bHXEe/18mPn/HdoHdkYRT/Exirhx1fG9Yxw6I/AhdB6T6ztRTJcSr2ovGwc1jfzFWpmRJNAQLJree/jTQ/8wyPNEuQByu5YzW7vvF1fZC62ZInSg05cimqxkdJYySrlLE5XJtPJq5qZs+sUXWNYv07HTF62k2RHDGtVKr7BISP7Zqtqx/0wTtNpdyfpuUEQyrp8GUTmpO+lHChcVDgrU=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3905
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(6116002)(99286004)(26005)(36756003)(1076003)(25786009)(186003)(2906002)(81156014)(356004)(110136005)(81166006)(54906003)(6486002)(22756006)(50466002)(8676002)(8936002)(386003)(14444005)(8746002)(3846002)(2501003)(316002)(5660300002)(50226002)(4326008)(36906005)(70586007)(102836004)(486006)(478600001)(6506007)(107886003)(86362001)(47776003)(23756003)(63350400001)(2201001)(336012)(14454004)(66066001)(2616005)(6512007)(476003)(305945005)(126002)(7736002)(26826003)(76130400001)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1788;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 123f9216-17a4-4d50-3e28-08d748d4e99b
NoDisclaimer: True
X-Forefront-PRVS: 018093A9B5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0p9YDfr6G4SVpFghdq1ODr8p5VD4cBiaIYPKqvPHUIpNUEsD5CVM9Jf8f1t39ThqE556Xt5r4EB7km1bCvYiU6FPfcCojVFURPTyT8+QPWAEJgP/u5PRHgZd73A4csyRz4ZrPMototiOc9U1fgtHrlDGN3fGx/1R3MXeng0sODvygRV0ABGfB2AgWMTzXdepb3OUgp7q1yF/45aemPgCkjTz3O7fW1bHZJbktuJrVVtdHgbJbEfx/G+vy8OchqooDF2j1hP11ofXArHfLEc6sGRHSVhh4I57Dhh1/HICiQN58bHP1fJ3B6/r4nm9UbVAKxdq9pItxiNCw3XkPB1lduVeHapRDHwltvnKPDjORaRn11VoqO6A9x0Mj/YkRhfN1B/h0TFWqNSx8RuS162MBtwlVgnDH33BQdIls5FhCbo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 14:12:53.6961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0ed09a-c1ec-470b-86b2-08d748d4f2a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1788
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw7JRZIHKFb5y+T27fqtvJl9RwtTBn8opjA98fHySwM=;
 b=oMNPV5tPXJjR2VG7QgY9y6GjB1nEkeUGGx69IJLG686HWjl3qJBXD2p/tmcbEekgQo1TnHk7YvmZGkLl8xncDXTLvGgDXcpJxx0No2/pXVfh3YNiMsn3rLYoI5qNbIYSeeuk5cKinkfKGpHPiScsMuQYkq8EDIjqaeUig2S6U1Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw7JRZIHKFb5y+T27fqtvJl9RwtTBn8opjA98fHySwM=;
 b=oMNPV5tPXJjR2VG7QgY9y6GjB1nEkeUGGx69IJLG686HWjl3qJBXD2p/tmcbEekgQo1TnHk7YvmZGkLl8xncDXTLvGgDXcpJxx0No2/pXVfh3YNiMsn3rLYoI5qNbIYSeeuk5cKinkfKGpHPiScsMuQYkq8EDIjqaeUig2S6U1Y=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, nd <nd@arm.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUmF5bW9uZCBTbWl0aCA8cmF5bW9uZC5zbWl0aEBhcm0uY29tPgoKQWRkIHRoZSBEUk1f
Rk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxFQVZFRCBtb2RpZmllciB0bwpkZW5v
dGUgdGhlIDE2eDE2IGJsb2NrIHUtaW50ZXJsZWF2ZWQgZm9ybWF0IHVzZWQgaW4gQXJtIFV0Z2Fy
ZCBhbmQKTWlkZ2FyZCBHUFVzLgoKQ2hhbmdlcyBmcm9tIHYxOi0KMS4gUmVzZXJ2ZWQgdGhlIHVw
cGVyIGZvdXIgYml0cyAob3V0IG9mIHRoZSA1NiBiaXRzIGFzc2lnbmVkIHRvIGVhY2ggdmVuZG9y
KQp0byBkZW5vdGUgdGhlIGNhdGVnb3J5IG9mIEFybSBzcGVjaWZpYyBtb2RpZmllcnMuIEN1cnJl
bnRseSwgd2UgaGF2ZSB0d28KY2F0ZWdvcmllcyBpZSBBRkJDIGFuZCBNSVNDLgoKQ2hhbmdlcyBm
cm9tIHYyOi0KMS4gUHJlc2VydmVkIFJheSdzIGF1dGhvcnNoaXAKMi4gQ2xlYW51cHMvY2hhbmdl
cyBzdWdnZXN0ZWQgYnkgQnJpYW4KMy4gQWRkZWQgci1icyBvZiBCcmlhbiBhbmQgUWlhbmcKClNp
Z25lZC1vZmYtYnk6IFJheW1vbmQgU21pdGggPHJheW1vbmQuc21pdGhAYXJtLmNvbT4KU2lnbmVk
LW9mZi1ieTogQXlhbiBrdW1hciBoYWxkZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+ClJldmlld2Vk
LWJ5OiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+ClJldmlld2VkLWJ5OiBR
aWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3Vy
Y2MuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9k
cm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKaW5kZXggM2Zl
ZWFhM2Y5ODdhLi4yMzc2ZDM2ZWE1NzMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJt
X2ZvdXJjYy5oCisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCkBAIC02NDgsNyAr
NjQ4LDIxIEBAIGV4dGVybiAiQyIgewogICogRnVydGhlciBpbmZvcm1hdGlvbiBvbiB0aGUgdXNl
IG9mIEFGQkMgbW9kaWZpZXJzIGNhbiBiZSBmb3VuZCBpbgogICogRG9jdW1lbnRhdGlvbi9ncHUv
YWZiYy5yc3QKICAqLwotI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fQUZCQyhfX2FmYmNfbW9k
ZSkJZm91cmNjX21vZF9jb2RlKEFSTSwgX19hZmJjX21vZGUpCisKKy8qCisgKiBUaGUgdG9wIDQg
Yml0cyAob3V0IG9mIHRoZSA1NiBiaXRzIGFsbG90ZWQgZm9yIHNwZWNpZnlpbmcgdmVuZG9yIHNw
ZWNpZmljCisgKiBtb2RpZmllcnMpIGRlbm90ZSB0aGUgY2F0ZWdvcnkgZm9yIG1vZGlmaWVycy4g
Q3VycmVudGx5IHdlIGhhdmUgb25seSB0d28KKyAqIGNhdGVnb3JpZXMgb2YgbW9kaWZpZXJzIGll
IEFGQkMgYW5kIE1JU0MuIFdlIGNhbiBoYXZlIGEgbWF4aW11bSBvZiBzaXh0ZWVuCisgKiBkaWZm
ZXJlbnQgY2F0ZWdvcmllcy4KKyAqLworI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fQ09ERShf
X3R5cGUsIF9fdmFsKSBcCisJZm91cmNjX21vZF9jb2RlKEFSTSwgKChfX3U2NCkoX190eXBlKSA8
PCA1MikgfCAoKF9fdmFsKSAmIDB4MDAwZmZmZmZmZmZmZmZmZlVMTCkpCisKKyNkZWZpbmUgRFJN
X0ZPUk1BVF9NT0RfQVJNX1RZUEVfQUZCQyAweDAwCisjZGVmaW5lIERSTV9GT1JNQVRfTU9EX0FS
TV9UWVBFX01JU0MgMHgwMQorCisjZGVmaW5lIERSTV9GT1JNQVRfTU9EX0FSTV9BRkJDKF9fYWZi
Y19tb2RlKSBcCisJRFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUoRFJNX0ZPUk1BVF9NT0RfQVJNX1RZ
UEVfQUZCQywgX19hZmJjX21vZGUpCiAKIC8qCiAgKiBBRkJDIHN1cGVyYmxvY2sgc2l6ZQpAQCAt
NzQyLDYgKzc1NiwxNiBAQCBleHRlcm4gIkMiIHsKICAqLwogI2RlZmluZSBBRkJDX0ZPUk1BVF9N
T0RfQkNIICAgICAoMVVMTCA8PCAxMSkKIAorLyoKKyAqIEFybSAxNngxNiBCbG9jayBVLUludGVy
bGVhdmVkIG1vZGlmaWVyCisgKgorICogVGhpcyBpcyB1c2VkIGJ5IEFybSBNYWxpIFV0Z2FyZCBh
bmQgTWlkZ2FyZCBHUFVzLiBJdCBkaXZpZGVzIHRoZSBpbWFnZQorICogaW50byAxNngxNiBwaXhl
bCBibG9ja3MuIEJsb2NrcyBhcmUgc3RvcmVkIGxpbmVhcmx5IGluIG9yZGVyLCBidXQgcGl4ZWxz
CisgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KKyAqLworI2RlZmluZSBEUk1fRk9STUFU
X01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxFQVZFRCBcCisJRFJNX0ZPUk1BVF9NT0RfQVJN
X0NPREUoRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfTUlTQywgMVVMTCkKKwogLyoKICAqIEFsbHdp
bm5lciB0aWxlZCBtb2RpZmllcgogICoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
