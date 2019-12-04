Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85683112A9E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855D86F4FD;
	Wed,  4 Dec 2019 11:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30078.outbound.protection.outlook.com [40.107.3.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902C46F4B1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:36 +0000 (UTC)
Received: from VI1PR08CA0220.eurprd08.prod.outlook.com (2603:10a6:802:15::29)
 by HE1SPR00MB241.eurprd08.prod.outlook.com (2603:10a6:3:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:33 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR08CA0220.outlook.office365.com
 (2603:10a6:802:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:32 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:32 +0000
Received: ("Tessian outbound 92d30e517f5d:v37");
 Wed, 04 Dec 2019 11:48:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e55bdf3c9c4a2513
X-CR-MTA-TID: 64aa7808
Received: from de4fd4e6043b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD27ABFD-5B0F-4F83-9D8D-9704A1EADBA1.1; 
 Wed, 04 Dec 2019 11:48:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de4fd4e6043b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCID9YAp7sq+xcCIJcHDaGvxyj6opTivrGZ8fSiY5CWEOAiugCP84agLYo56txSufgfHk4YAGxQa08nZ7BFAweqy/oGjJjIt6Hlgm32OytZQP8HlLi0hBx2R0YhREPCieuLj7xF1yQ11EpkP9+KMPQVJg48zLb/mDwHC5rkNZU96+42tVjUtbECM4ACfzqYjvxAl+1plrnyRAEmws6EQdFygWEU6m3Ynr0k8LWKFGj4A4HCuvG+KDl5GgX177Ep5Tj1TKhAjEmsGqErKdmI/LHK4r+KV3WOclj+s9S8AD0iI2/iE666IpArpQir/tK+P6AOnh00sEXJV+FzmLHGukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=H8U48vnk8uMOrcs/2njVm6TYQmOFQ+MZQD1H9zD8LH6Rvlbdk7uNxq1W6bjZg6tbgx9bmH37UdKpYUff+uVpQSyiLH9OxNcNhrT4tQB7AUBE7dDcCG4rKM3P5XZdbxXQ0t4xOL7sfz1bMit7hlBL5Pw6AlmYQwtSHmXiFf421vDzph3PlDBtdc9yArADKlNg/vUnbc6Ll7ylN9JlEYTvWMPqnBGHexqy+9N8OYbCBwelxYAW6FunSSkHE4XQllrDFOTK3QEo76qlebktA0nIutY6WXOFfuWpMSVf4nkK+B/x5NvkJHQPEipadIkkiWNmfjc5iucZF48vCFqxUzZ4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4624.eurprd08.prod.outlook.com (20.178.13.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 4 Dec 2019 11:48:24 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:24 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 25/28] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Topic: [PATCH v2 25/28] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Index: AQHVqpi792P4gVb94Ee5mVAYsOXvbA==
Date: Wed, 4 Dec 2019 11:48:23 +0000
Message-ID: <20191204114732.28514-26-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7578c0ae-9cc9-4819-a27c-08d778afe390
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|HE1SPR00MB241:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1SPR00MB24104F97DDEF6B47697CB388F5D0@HE1SPR00MB241.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
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
X-Microsoft-Antispam-Message-Info-Original: rBFTgSalywc0B4nnqzU7j4HgyujuZwGRyjKtQdDntZ2rMjQfYy3YjkMGqbUY0dYqVrsyWDuRNUglWGW20mbmGFqMcGIWIo7Qip+zHS9wpqpc5V8V13C2nbP9PqC6X1ndmhtemJj95UVojB38zUxw7JvuuXlRlrFvC1UuGrICtC1LpVcmDm+mkBcY8CDsYxxCCWIF6bOd+htAsIeO1+/1WiWXLw4sEXrul/xTair4+LVgCi3IThYzQlfgLGyfjbfzmiLXIaXJwmqYYjXPM4dR5P9ySjnwYnpzPwLko9UMebTVICYdI8VTNZRDw7nRew5w6mQpmK1rkW0grA9spBFCHsx7eBLReeGUxXp6vac8KEVurr0IHpXYb9G5x2c0q91RhsXR+APSdx+lesipBThZsbExrYaoj7Z4K/Hl2BqVmM0d0QY3KzeCKG2aGUMoTbf/
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(50466002)(4326008)(1076003)(316002)(86362001)(36906005)(2501003)(36756003)(6512007)(3846002)(76130400001)(6116002)(2906002)(356004)(54906003)(50226002)(81166006)(22756006)(6916009)(2351001)(70586007)(25786009)(11346002)(70206006)(107886003)(76176011)(6486002)(5660300002)(6506007)(81156014)(478600001)(336012)(99286004)(186003)(14454004)(8676002)(26005)(7736002)(102836004)(23756003)(305945005)(5640700003)(26826003)(4744005)(8746002)(2616005)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1SPR00MB241;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b326ecac-c72b-420e-e445-08d778afde10
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+NZ/bCD7FX0J7FIIFUzY19mga++Z10CPAEg/yB3JLNTvTbNXMkIsN4E91FNLa7Oe+cM++k3GAb+0+qp2n+2fb3qudKq3KiEY+94dQVmm8SjPFVpBix9k9ZVJhooTp55MvtLJIFNAEwm6LfwvCO86C63CUDSDT4aswEPb3p789dHnuvUvtJ9+lkoXikuTQvcWn++pQ9sfAgDejIzHxBgLaS65g0xitrADI1WQZCkuyFub7ZL/9DiDlXT01TVSKx1NwKBp1KsRqXAAAxH6shgq0p2Fo1cqesLa9YVP2k4CTrNY6HtTMBj/bdULmHu5bRQTMb6BxuUcwqOUdYre8X6KNra7/daMBJm0rwfiE3BJ98/WR+2DMiCdmcJFpUKlU2E91b74JRA9ckP7ckU4CVdGIG7r+1RrVa1uMM7aU6uggJbVpLuQHsQn5vQk9PBgoaY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:32.8160 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7578c0ae-9cc9-4819-a27c-08d778afe390
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1SPR00MB241
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=A3pXRVFo714LkNf9Wyl4I+BTgk9tdncSLCKardW/g8mRV67lVgwjEc2l2rWZqeTlkD7l5+ZQdhf9OmNL1yKbxyCRNoLLji06a51UXl802A/EHxcecb06Yx2LtykpkcOqj/7i6gvEp5fHLhpAcD8QCNw7vHNTyG6tgcWCJJ2oeBU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=A3pXRVFo714LkNf9Wyl4I+BTgk9tdncSLCKardW/g8mRV67lVgwjEc2l2rWZqeTlkD7l5+ZQdhf9OmNL1yKbxyCRNoLLji06a51UXl802A/EHxcecb06Yx2LtykpkcOqj/7i6gvEp5fHLhpAcD8QCNw7vHNTyG6tgcWCJJ2oeBU=
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
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKaW5kZXggOGM2YzE3MmJi
ZjJlLi5hYzFmMjliYWNmY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCkBAIC04
ODEsOSArODgxLDggQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAotCWx2ZHMtPmJy
aWRnZS5kcml2ZXJfcHJpdmF0ZSA9IGx2ZHM7Ci0JbHZkcy0+YnJpZGdlLmZ1bmNzID0gJnJjYXJf
bHZkc19icmlkZ2Vfb3BzOwotCWx2ZHMtPmJyaWRnZS5vZl9ub2RlID0gcGRldi0+ZGV2Lm9mX25v
ZGU7CisJZHJtX2JyaWRnZV9pbml0KCZsdmRzLT5icmlkZ2UsICZwZGV2LT5kZXYsICZyY2FyX2x2
ZHNfYnJpZGdlX29wcywKKwkJCU5VTEwsIGx2ZHMpOwogCiAJbWVtID0gcGxhdGZvcm1fZ2V0X3Jl
c291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKIAlsdmRzLT5tbWlvID0gZGV2bV9pb3Jl
bWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIG1lbSk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
