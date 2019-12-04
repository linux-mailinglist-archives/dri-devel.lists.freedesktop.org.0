Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5B112A83
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C9B6E8CF;
	Wed,  4 Dec 2019 11:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130088.outbound.protection.outlook.com [40.107.13.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1A26E8CF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:20 +0000 (UTC)
Received: from VI1PR0801CA0079.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::23) by VI1PR08MB3487.eurprd08.prod.outlook.com
 (2603:10a6:803:88::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Wed, 4 Dec
 2019 11:48:17 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR0801CA0079.outlook.office365.com
 (2603:10a6:800:7d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:16 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:16 +0000
Received: ("Tessian outbound 15590139dbb5:v37");
 Wed, 04 Dec 2019 11:48:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a342c5dfa3edf21e
X-CR-MTA-TID: 64aa7808
Received: from a83b0422c187.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D87E0BE-5A85-463A-8541-C3256AAA9683.1; 
 Wed, 04 Dec 2019 11:48:10 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a83b0422c187.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5MggrRW2E/HAmB0VwVERjZZyhEJWHwQqDN5ozzvU/VSE7CbiSgP6ms2Vc5cPAeiE4dyYeJtPgPNUQjh69WVX+LJmi4TJ7xLZoXFiThUaPRyMdDytkXBJzHEaXDiKT7DPlxRFHfSk9FB1Ji7U6BNm3jXUC73SileqO1qMEKQX5H1Rb76OWDVdit+5Q6ipq07GVxCcIMlZHWL68ucVNvPnhojqXfjlkzA3ehIzDggkyWqAhxDdp+gk+yMk9rnd3yWD+HzWeuyjgIckWqwrECgvkmWrpQRpX36HJDn0cUUVo1YRXETURsL1XJXqWHUojvEYjQJIPCX0qea+unLWnSqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=528OVsPgmledT3KzwsU137Xb39xXYhXTngkZrmxaBXM=;
 b=gxBeW+3E1xf7wgfmiuT142BMvsU3Vq0i3iGiJ9hLgX6zXurAhnO6jAFxeWHZFFVdAmNcaFPZxRrLr/FqtD7tQQ6b4F32EgMeeAieUbJ8O4KKRmys5nxHzK5X7p1pd54l6dIcfie8E7gnaZmExfgqW1IkmFLRUGTNRo9r9Qb1gFtwkMXSTZpRhM3XxfxL097WRFfOVVcX8oDgZUNyv7sxZFdVRVER7e+xrDebj4RVtSj4Yoch7FFuQwgbDb8otcA5fSD0yIlWkAcKWIQ5ONu/TtZnBUek1pfbxjhHgrOSFlFXs7OYo3bfWK4q3/AdvJGoMfBPEA+13J3qNlgtVgTgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:08 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:08 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 07/28] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use
 drm_bridge_init()
Thread-Topic: [PATCH v2 07/28] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 Use drm_bridge_init()
Thread-Index: AQHVqpiymrXEMj6obkmjm7/En3p3CA==
Date: Wed, 4 Dec 2019 11:48:08 +0000
Message-ID: <20191204114732.28514-8-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 19ee85c4-8696-49bb-f0a0-08d778afda02
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|VI1PR08MB3487:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3487382FE452FACA63316CB38F5D0@VI1PR08MB3487.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(7416002)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(14444005)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MKdSEqua5txfkgGZXQHs3C/HeGq0rfWVoEDU7HSDz4KJdhsLrEgBREJIvY6EuDqbMGS56ok1PYCTd399k+QCOjlCgXo+hl6PZQQgkUrQsSIPluEjo8Jg/pRt48S3yTEzb84XCO/L8rUHqjLZmlh3IZ6IleqZfyIVk0vS2tPeGHxcxJ0zdjMI18XQDGwYysgYKDS8x7H5/4ShSbLAAaTL7IGrHpbMomFOF2iv0WKsqM8OC4DtXhPWjykllyJUtgMaetmeDFuTgjVTRSVytDlK/UHufkbtox8Eslf4h/wTcRbyOmm03hPYVA8BHjIAIb2PzlS+XVkLi7hZTvLcOV9MlPPDnJ2IJPoRpEazlljV+mTOhGqELAc0aZsadsCgg35cek6oz5FVaWBQptfyPvd2UL72L3sEMuZaISjN1ey3DxazrrA9iTiofhkbXYVWGwn8
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(189003)(199004)(70206006)(14454004)(1076003)(36906005)(54906003)(478600001)(11346002)(2616005)(316002)(3846002)(26826003)(6116002)(70586007)(25786009)(5640700003)(50466002)(99286004)(6512007)(81166006)(81156014)(6916009)(26005)(6486002)(23756003)(8676002)(76130400001)(76176011)(36756003)(6506007)(102836004)(14444005)(107886003)(22756006)(4326008)(50226002)(305945005)(2351001)(356004)(7736002)(5660300002)(4744005)(186003)(2906002)(2501003)(336012)(8746002)(8936002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3487;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e0c94f08-2ef8-41aa-905b-08d778afd4c7
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5SrrW+MoTivDxMcRdokP7KY0cUhy9jsZX4Raie5hPXFgl1imz66q+ja3/IAgsnqlf0DNaoDAIcYlqH9F6oRL/0cS4C3tvYp2ySAu3Fkj21jNoSorShllC+s4Z/Afj6KQNWPp9NJDEmOg5b6vuGNistUiSasCj23S0SsL7WLnrDeMvBiIqF2krReRDweyOHtt0fXNNmZergG6sEv6NtYjh1PEpLMpd9UyzPm79hjhowqhzhXuwKn+JUkAP6QpuZX7n+P3XzwN/vzKIUhNfhNEPKFVW924LzzmAeKrV2QWtBtu2/25bklgbFHFMy7CTF0w1fJ8ue19oaL/svY/UAf7uZ2A0LVDos8ZMUu6mnSvZIu8OcBi8gVf3mtT3rGE9TlD1fG3xG54t8M1sRnteb4QB7IQk0J9A8Kt+TGkbGl/AeNjhDk4lp4n5rH9WVt6T8X
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:16.7839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ee85c4-8696-49bb-f0a0-08d778afda02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=528OVsPgmledT3KzwsU137Xb39xXYhXTngkZrmxaBXM=;
 b=JDz3HQWPwH+NjMGBH2yYBGHDiHQOOZfQs1cQ13uOd2EPRsx293z8LA9C/+6zgmA20OIQ0+28eaJnnaw0AcrJ37/Hibgz4NwU7XmgLk6Rv0rp7HsMIf+Ag+bEDAMP+yEftwNgulU+PU4fCtDpFfIUSEzEddUkLBnzBoePIlzLd5g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=528OVsPgmledT3KzwsU137Xb39xXYhXTngkZrmxaBXM=;
 b=JDz3HQWPwH+NjMGBH2yYBGHDiHQOOZfQs1cQ13uOd2EPRsx293z8LA9C/+6zgmA20OIQ0+28eaJnnaw0AcrJ37/Hibgz4NwU7XmgLk6Rv0rp7HsMIf+Ag+bEDAMP+yEftwNgulU+PU4fCtDpFfIUSEzEddUkLBnzBoePIlzLd5g=
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
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9tZWdh
Y2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1zdGRweHh4eC1nZS1iODUwdjMtZncuYwppbmRleCBlOGE0
OWY2MTQ2YzYuLmQ1NjdjZDYzODEwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMKQEAgLTMwMyw4ICszMDMs
OCBAQCBzdGF0aWMgaW50IHN0ZHA0MDI4X2dlX2I4NTB2M19md19wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqc3RkcDQwMjhfaTJjLAogCWkyY19zZXRfY2xpZW50ZGF0YShzdGRwNDAyOF9pMmMsIGdl
X2I4NTB2M19sdmRzX3B0cik7CiAKIAkvKiBkcm0gYnJpZGdlIGluaXRpYWxpemF0aW9uICovCi0J
Z2VfYjg1MHYzX2x2ZHNfcHRyLT5icmlkZ2UuZnVuY3MgPSAmZ2VfYjg1MHYzX2x2ZHNfZnVuY3M7
Ci0JZ2VfYjg1MHYzX2x2ZHNfcHRyLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKKwlk
cm1fYnJpZGdlX2luaXQoJmdlX2I4NTB2M19sdmRzX3B0ci0+YnJpZGdlLCBkZXYsICZnZV9iODUw
djNfbHZkc19mdW5jcywKKwkJCU5VTEwsIE5VTEwpOwogCWRybV9icmlkZ2VfYWRkKCZnZV9iODUw
djNfbHZkc19wdHItPmJyaWRnZSk7CiAKIAkvKiBDbGVhciBwZW5kaW5nIGludGVycnVwdHMgc2lu
Y2UgcG93ZXIgdXAuICovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
