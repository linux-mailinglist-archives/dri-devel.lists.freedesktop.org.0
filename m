Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80672109CAC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7746E2EC;
	Tue, 26 Nov 2019 10:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE416E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:54:59 +0000 (UTC)
Received: from VI1PR08CA0145.eurprd08.prod.outlook.com (2603:10a6:800:d5::23)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 10:54:56 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0145.outlook.office365.com
 (2603:10a6:800:d5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 10:54:56 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 10:54:56 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 10:54:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 107a7d95670af9cd
X-CR-MTA-TID: 64aa7808
Received: from 6f39bf02dbf5.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD497D39-2940-4F20-82A6-34243C90BC0E.1; 
 Tue, 26 Nov 2019 10:54:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f39bf02dbf5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 10:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvCHzNVZyflxNII8fqkDsWLhbbO9tpv6XvFr3kX+EgJBQnFTUePfyA/Gj5E1KETtf2vEJ9Z9Nx5Y0RfMBKwe17579YTUeY5MapoZ5N2wFuWj9LPVRz7YqtARaOSSgL2s/rCm5bFuyuzolOxa7kW/auyudoQIaStJD5nZyFyCri3KaXF0PO/s0QtMQ4Xco7Or4JsFwL6x29dbDlWJEM7zwr60wOpI7pl9Hvzc5KLu6qQcpd6XIsv9tWLDOmrTBIz77aqFlipeyTukbK72hE85YWQap1Ouh0TDvPi79YNYVMril/+vwfQzuzVayHeltYuBE9mH6KMTbE9NaaXuPs1VYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuPORfjEkbFbDMZqgxVIbmFO6TGaVWP1axYlY287T+I=;
 b=odrB3FLFJDsKFO849L55xANpJS6CbUNqPXIai+FBg6zXOZq42f+TsPe8Mx7jqb6gAhTrO+gEYjArsG1lyw/O9m5VOtnWhdauI9G6d+t/SzFgcsqPJncGfhwpa5G8hjYiSlzNw6n1rQJXlPeh1PEiUqU+jeqBrWNe0eux3exzBZUm1jV8CPI1Q9JvyeExJQ3Rv6T3eGEoSFKGz7OqVCly09yx3c9izMjCseZHfC0FXp1nXQ10QL1V5adPVG1A16IbJZKLo3A2n2vr7w6x37Cgiqq+zK3bFgyh2yzizXadtaRVLxWVi9o/SiX9QlPwAsr+b63qfWiVnEVj2QzRcuqqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4703.eurprd08.prod.outlook.com (10.255.27.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 10:54:47 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 10:54:47 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v1 2/2] drm/komeda: Refactor sysfs node "config_id"
Thread-Topic: [PATCH v1 2/2] drm/komeda: Refactor sysfs node "config_id"
Thread-Index: AQHVpEfreeFjBGX9KE2GMbcm5nukJA==
Date: Tue, 26 Nov 2019 10:54:47 +0000
Message-ID: <20191126105412.5978-3-james.qian.wang@arm.com>
References: <20191126105412.5978-1-james.qian.wang@arm.com>
In-Reply-To: <20191126105412.5978-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:202::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7a7b234-d101-4468-cac5-08d7725f130c
X-MS-TrafficTypeDiagnostic: VE1PR08MB4703:|VE1PR08MB4703:|AM6PR08MB5080:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50806C426D1C8B9958DB0215B3450@AM6PR08MB5080.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2331;OLM:2331;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(2616005)(6436002)(71190400001)(71200400001)(50226002)(446003)(6486002)(11346002)(3846002)(6116002)(103116003)(36756003)(5660300002)(7736002)(6512007)(1076003)(305945005)(66476007)(66946007)(99286004)(66446008)(64756008)(66556008)(102836004)(8676002)(66066001)(86362001)(76176011)(54906003)(81166006)(81156014)(52116002)(110136005)(316002)(2501003)(14454004)(478600001)(186003)(26005)(25786009)(4326008)(386003)(6506007)(6636002)(8936002)(55236004)(2906002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4703;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HAzNkrM44Bv1RZf0geZEys74+wfn7BRQ0fhZMLy3sK0CkmqZSBx+BiAW0hv9E33X0ua2yrEMjWS9nuGUjo1TgUgyx89QdCeWFAOlsLzc2paq79dSDuC7NQuskNKIK/Y/SKWCLQpLfI9tPsWhSoipUScYY8V7oLhPTNv1g9pa+IWNbUxSn+cP9ejOwpg8hiHXmFtKw+VlL28lX5uCuqc8nK8rA38qqgzcKk2RyI8rl80G/NJEV4xS2tdP4We9P1jopQOVCnKqXulhGDRg//wcMu4FVsYwdKJ2tKGwaBOKvJomx66GpvI8UPpQ6WYrxFNPzW7OY37j1WJTbvCjgw5rISuWtu9pLgEbZPzc+5/mOOSkvMmM/Dy1yKKzODkI4R6R8lYt05tJT2sGmKRnggLgQD6gV8rQX2qvOHLw2NAOrLC2MMyx52wZsvzFX0Z9YLFb
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(189003)(199004)(1076003)(102836004)(14454004)(186003)(305945005)(6506007)(7736002)(2906002)(81156014)(99286004)(81166006)(36906005)(106002)(70206006)(23756003)(103116003)(2501003)(36756003)(316002)(386003)(70586007)(8936002)(26005)(50226002)(446003)(336012)(66066001)(22756006)(47776003)(50466002)(25786009)(2616005)(11346002)(54906003)(6512007)(3846002)(478600001)(110136005)(6486002)(8746002)(356004)(86362001)(4326008)(5660300002)(6636002)(26826003)(76130400001)(76176011)(6116002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5080;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0bbacef3-e02d-45c5-bfac-08d7725f0d89
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JAkOaDkoYN+XsDFmqENLko4nYa7GLjuGoF+kyrt5hMpIOO3seaS5/t5QV/fI0v6VLwoc1GQDQfuk3lWWGlGjZqj2aavdj3J2mGMdnnVsCnHzimuk64kJF9JkpYJs2G0CXmmTwlYPfIFnb288eSltkDa5Nai/ruvupLVI8W2UDD4FaDLTc5ItBPldcc8SaQ6819HOD7l/dY3PNdUJKaUbcweppadpzXj7StaVuorHLxqVyFOsKbST8CJP4YDucQcsO7na6J10XRA/KlsAQMjoDRlO69Y+ww0t13sbogBy2cSWd5uUSvUxOPAB4cNLcHu5RuDTrmnZ3pueEYd0p4LiqNJ/NCe8ZVTcDjvEuL4rb/KdyAwRC+9wjQiqkoa7l2Yf2Z3OHGocVg30/wq5vNmJ51Nfk3z2xGLp75lgRHkJim5DAqmVk1a7WhwA9ogDUaY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 10:54:56.2689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a7b234-d101-4468-cac5-08d7725f130c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuPORfjEkbFbDMZqgxVIbmFO6TGaVWP1axYlY287T+I=;
 b=GhsYqEDTQ5bB4BfL0hVYkz97wY91oLt/oiCdQKIIgP2VEqGDGv35QCP6iM8Uag8rysgvtj8U6mYRdj/WMdco2CDqYEWknAZV10hEOz+tT5biIf74G8f2ju//GamrZfxKGRzME49qF2V+o77KT+nt3N7JE00yXaKikKkJ6iPlRGQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuPORfjEkbFbDMZqgxVIbmFO6TGaVWP1axYlY287T+I=;
 b=GhsYqEDTQ5bB4BfL0hVYkz97wY91oLt/oiCdQKIIgP2VEqGDGv35QCP6iM8Uag8rysgvtj8U6mYRdj/WMdco2CDqYEWknAZV10hEOz+tT5biIf74G8f2ju//GamrZfxKGRzME49qF2V+o77KT+nt3N7JE00yXaKikKkJ6iPlRGQ=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIiA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+CgpTcGxpdCBzeXNmcyBjb25maWdfaWQgYml0ZmlsZXMgdG8gbXVsdGlw
bGUgc2VwYXJhdGVkIHN5c2ZzIGZpbGVzLgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgUWlhbiBXYW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgotLS0KIC4u
Li9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oICB8IDEzIC0tLQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9zeXNmcy5jIHwgODAgKysrKysrKysr
KysrKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9t
YWxpZHBfcHJvZHVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFs
aWRwX3Byb2R1Y3QuaAppbmRleCBkYmQzZDQ3NjUwNjUuLmIyMWY0YWExNWM5NSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5o
CkBAIC0yMSwxNyArMjEsNCBAQAogI2RlZmluZSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQJMHgwMDcx
CiAjZGVmaW5lIE1BTElEUF9EMzJfUFJPRFVDVF9JRAkweDAwMzIKIAotdW5pb24ga29tZWRhX2Nv
bmZpZ19pZCB7Ci0Jc3RydWN0IHsKLQkJX191MzIJbWF4X2xpbmVfc3o6MTYsCi0JCQluX3BpcGVs
aW5lczoyLAotCQkJbl9zY2FsZXJzOjIsIC8qIG51bWJlciBvZiBzY2FsZXJzIHBlciBwaXBlbGlu
ZSAqLwotCQkJbl9sYXllcnM6MywgLyogbnVtYmVyIG9mIGxheWVycyBwZXIgcGlwZWxpbmUgKi8K
LQkJCW5fcmljaHM6MywgLyogbnVtYmVyIG9mIHJpY2ggbGF5ZXJzIHBlciBwaXBlbGluZSAqLwot
CQkJc2lkZV9ieV9zaWRlOjEsIC8qIGlmIEhXIHdvcmtzIG9uIHNpZGVfYnlfc2lkZSBtb2RlICov
Ci0JCQlyZXNlcnZlZF9iaXRzOjU7Ci0JfTsKLQlfX3UzMiB2YWx1ZTsKLX07Ci0KICNlbmRpZiAv
KiBfTUFMSURQX1BST0RVQ1RfSF8gKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9zeXNmcy5jCmluZGV4IDc0MGYwOTViNGNhNS4uNWVmZmFiNzk1ZGMx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9z
eXNmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3N5
c2ZzLmMKQEAgLTE4LDI4ICsxOCw2NyBAQCBjb3JlX2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQogc3RhdGljIERFVklD
RV9BVFRSX1JPKGNvcmVfaWQpOwogCiBzdGF0aWMgc3NpemVfdAotY29uZmlnX2lkX3Nob3coc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVm
KQorbGluZV9zaXplX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJp
YnV0ZSAqYXR0ciwgY2hhciAqYnVmKQogewogCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2
X3RvX21kZXYoZGV2KTsKIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlID0gbWRldi0+cGlw
ZWxpbmVzWzBdOwotCXVuaW9uIGtvbWVkYV9jb25maWdfaWQgY29uZmlnX2lkOwotCWludCBpOwot
Ci0JbWVtc2V0KCZjb25maWdfaWQsIDAsIHNpemVvZihjb25maWdfaWQpKTsKLQotCWNvbmZpZ19p
ZC5tYXhfbGluZV9zeiA9IHBpcGUtPmxheWVyc1swXS0+aHNpemVfaW4uZW5kOwotCWNvbmZpZ19p
ZC5zaWRlX2J5X3NpZGUgPSBtZGV2LT5zaWRlX2J5X3NpZGU7Ci0JY29uZmlnX2lkLm5fcGlwZWxp
bmVzID0gbWRldi0+bl9waXBlbGluZXM7Ci0JY29uZmlnX2lkLm5fc2NhbGVycyA9IHBpcGUtPm5f
c2NhbGVyczsKLQljb25maWdfaWQubl9sYXllcnMgPSBwaXBlLT5uX2xheWVyczsKLQljb25maWdf
aWQubl9yaWNocyA9IDA7Ci0JZm9yIChpID0gMDsgaSA8IHBpcGUtPm5fbGF5ZXJzOyBpKyspIHsK
KworCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVkXG4iLCBwaXBlLT5sYXllcnNb
MF0tPmhzaXplX2luLmVuZCk7Cit9CitzdGF0aWMgREVWSUNFX0FUVFJfUk8obGluZV9zaXplKTsK
Kworc3RhdGljIHNzaXplX3QKK25fcGlwZWxpbmVzX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQoreworCXN0cnVjdCBrb21l
ZGFfZGV2ICptZGV2ID0gZGV2X3RvX21kZXYoZGV2KTsKKworCXJldHVybiBzbnByaW50ZihidWYs
IFBBR0VfU0laRSwgIiVkXG4iLCBtZGV2LT5uX3BpcGVsaW5lcyk7Cit9CitzdGF0aWMgREVWSUNF
X0FUVFJfUk8obl9waXBlbGluZXMpOworCitzdGF0aWMgc3NpemVfdAorbl9sYXllcnNfc2hvdyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpi
dWYpCit7CisJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBkZXZfdG9fbWRldihkZXYpOworCXN0
cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGUgPSBtZGV2LT5waXBlbGluZXNbMF07CisKKwlyZXR1
cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlZFxuIiwgcGlwZS0+bl9sYXllcnMpOworfQor
c3RhdGljIERFVklDRV9BVFRSX1JPKG5fbGF5ZXJzKTsKKworc3RhdGljIHNzaXplX3QKK25fcmlj
aF9sYXllcnNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRl
ICphdHRyLCBjaGFyICpidWYpCit7CisJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBkZXZfdG9f
bWRldihkZXYpOworCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGUgPSBtZGV2LT5waXBlbGlu
ZXNbMF07CisJaW50IGksIG5fcmljaHMgPSAwOworCisJZm9yIChpID0gMDsgaSA8IHBpcGUtPm5f
bGF5ZXJzOyBpKyspCiAJCWlmIChwaXBlLT5sYXllcnNbaV0tPmxheWVyX3R5cGUgPT0gS09NRURB
X0ZNVF9SSUNIX0xBWUVSKQotCQkJY29uZmlnX2lkLm5fcmljaHMrKzsKLQl9Ci0JcmV0dXJuIHNu
cHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiMHglMDh4XG4iLCBjb25maWdfaWQudmFsdWUpOworCQkJ
bl9yaWNocysrOworCisJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWRcbiIsIG5f
cmljaHMpOworfQorc3RhdGljIERFVklDRV9BVFRSX1JPKG5fcmljaF9sYXllcnMpOworCitzdGF0
aWMgc3NpemVfdAorbl9zY2FsZXJzX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2
aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQoreworCXN0cnVjdCBrb21lZGFfZGV2ICpt
ZGV2ID0gZGV2X3RvX21kZXYoZGV2KTsKKwlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlID0g
bWRldi0+cGlwZWxpbmVzWzBdOworCisJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAi
JWRcbiIsIHBpcGUtPm5fc2NhbGVycyk7Cit9CitzdGF0aWMgREVWSUNFX0FUVFJfUk8obl9zY2Fs
ZXJzKTsKKworc3RhdGljIHNzaXplX3QKK3NpZGVfYnlfc2lkZV9zaG93KHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKK3sKKwlzdHJ1
Y3Qga29tZWRhX2RldiAqbWRldiA9IGRldl90b19tZGV2KGRldik7CisKKwlyZXR1cm4gc25wcmlu
dGYoYnVmLCBQQUdFX1NJWkUsICIlZFxuIiwgbWRldi0+c2lkZV9ieV9zaWRlKTsKIH0KLXN0YXRp
YyBERVZJQ0VfQVRUUl9STyhjb25maWdfaWQpOworc3RhdGljIERFVklDRV9BVFRSX1JPKHNpZGVf
Ynlfc2lkZSk7CiAKIHN0YXRpYyBzc2l6ZV90CiBhY2xrX2h6X3Nob3coc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQpAQCAtNTIsNyAr
OTEsMTIgQEAgc3RhdGljIERFVklDRV9BVFRSX1JPKGFjbGtfaHopOwogCiBzdGF0aWMgc3RydWN0
IGF0dHJpYnV0ZSAqa29tZWRhX3N5c2ZzX2VudHJpZXNbXSA9IHsKIAkmZGV2X2F0dHJfY29yZV9p
ZC5hdHRyLAotCSZkZXZfYXR0cl9jb25maWdfaWQuYXR0ciwKKwkmZGV2X2F0dHJfbGluZV9zaXpl
LmF0dHIsCisJJmRldl9hdHRyX25fcGlwZWxpbmVzLmF0dHIsCisJJmRldl9hdHRyX25fbGF5ZXJz
LmF0dHIsCisJJmRldl9hdHRyX25fcmljaF9sYXllcnMuYXR0ciwKKwkmZGV2X2F0dHJfbl9zY2Fs
ZXJzLmF0dHIsCisJJmRldl9hdHRyX3NpZGVfYnlfc2lkZS5hdHRyLAogCSZkZXZfYXR0cl9hY2xr
X2h6LmF0dHIsCiAJTlVMTCwKIH07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
