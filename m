Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD773112A84
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9A66E8D0;
	Wed,  4 Dec 2019 11:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CC66E8CF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:24 +0000 (UTC)
Received: from VI1PR0802CA0026.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::12) by AM6PR08MB3095.eurprd08.prod.outlook.com
 (2603:10a6:209:45::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:21 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR0802CA0026.outlook.office365.com
 (2603:10a6:800:a9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:20 +0000
Received: ("Tessian outbound 224ffa173bf0:v37");
 Wed, 04 Dec 2019 11:48:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 271b2d51b2fa0437
X-CR-MTA-TID: 64aa7808
Received: from c7e01adb9f43.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A9BA7B3-DECE-4238-B458-7485675675F5.1; 
 Wed, 04 Dec 2019 11:48:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7e01adb9f43.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3KBmBFry88ycHcbZ292v/lLUDldNlRZg2mDqaIlPeYfRNmeyfVJpN1bAfqf3Jqwb5FU+q7KZD+CRcCAcbOh7QxJ5W5WZY9uDzyoZkRal+vSzcbpBzvvOjFTguOsxoDZeJvvr0LWdbp4nQVDlKjV0VNtKOT843SKTUK+bHijxTLJa9VmoxLKcHuygFkC/6Xsa38Puz4zoVn6dZrfsnHGy30vfrSmNVI8ykyDUsXgJEqLlaLvVip+gBRFE0uKO3bDJhBRYZrkjZYsnEavaQ0iN4Q2CPkkfseGDGrsiyUpBjbra39lX5otOzuvP4U7FJcOrGZ5aMNNzZmfSMdETyEGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MgqguEy0jasCHbpHxT7B0woU2qwbfZInWMJIuCHW7o=;
 b=XrL5cmx9TiSu4ia0u/d9zhvtT6G2hMLHXvPlYyaOQB5PoWWH49QqSon2ctVbj2M200LMKr9pg+kqooUljt0Dv9Rvz8gNISMphQG57i0We/0Rc1+E8JKcpSDQNm0tlpHQ2IGcLl/J35NzBW1YUGIx6zyLqV3GMbGqQi/V41/XOUVUPzwtKvTtz+7csPBZK/tcP+dIVi65a/O+fEVniNj8tcHxcHIop8POoAlyMKLg3bc3l6x2m5ZLNOaBg8SvXMYh2nvXYR3bJdygmGmD/0D+w6Xh/tkNoDbRj69paMYDDQ/6LiFEk5qRaXb6M8NyGsOWNSARALnAjWdOJkf6qhWUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:13 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:13 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 13/28] drm/bridge: sil_sii8620: Use drm_bridge_init()
Thread-Topic: [PATCH v2 13/28] drm/bridge: sil_sii8620: Use drm_bridge_init()
Thread-Index: AQHVqpi1+HN3O85Grk+0mnN0hyAIBA==
Date: Wed, 4 Dec 2019 11:48:13 +0000
Message-ID: <20191204114732.28514-14-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: ee160262-9c7c-4596-8908-08d778afdc71
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM6PR08MB3095:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB30958B4E2D4D3B8216955DA58F5D0@AM6PR08MB3095.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
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
X-Microsoft-Antispam-Message-Info-Original: GR/AcZmwU0lSluJBhjpLTa+vSxoxIXHqHOqVeL6WVoBhIles8DCZsbU4TixcHWWXp4q1FSTwfXvgijuhaB6VAHY8EMFn0EecXtqbHfaIW6Q59gg/du+wUYie2AVz43Sfj+uULrEw5Hb4qHGJbQDPkNMQBMfiIhqmoU1hdVKHPYqOyhbL6m6i100BM5BRdzDQI5k4bWB3st6nzuIoV05G9vbMOM3GuK77GFw9f5/vPbSnLHUEdyXqeIAvSevZqJbEGh0U0cgTuvxuk28UAybk1H3nUMAd0dLoAFhQLDy6GqXBEVBiCy5mWQW5AqbDGiFQhp79uPgrtLVcPL6jkEVMLxvpwfRdhnVxz8W0YAn69RMJpnsuaWfXPxwXtd2TbcmptW3oF6yXv4VDwCfMP8UJkos1pgdKHw7NAzXg0hYf9nGmK/7SAzXKtfi4GKGJDM5W
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(199004)(189003)(186003)(5640700003)(11346002)(102836004)(26005)(6512007)(26826003)(2616005)(478600001)(336012)(99286004)(14454004)(8746002)(107886003)(54906003)(25786009)(4326008)(6486002)(6116002)(76176011)(316002)(70586007)(76130400001)(50466002)(70206006)(6506007)(3846002)(22756006)(4744005)(2351001)(50226002)(7736002)(1076003)(81166006)(23756003)(356004)(8936002)(305945005)(5660300002)(81156014)(2501003)(6916009)(8676002)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3095;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6c1ba5c7-6387-4d94-249c-08d778afd7dc
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EAypG+RkQ85b8VCaK0LBYQ+TMg2yzRUDqbYkpM5XLCsIOpIGEHDDE7Y8tDasvu9+WIgEyaeuZd3Myo+sRhLw8cal8+QlB3E6oQYxxI21wnC2jOe6MsMkuRZEypYzP53MXGabHL67y9Lk0HeIZBZg/PeZzVCQOPZzgMUgUI0DflkxJUI+VTkwf0NlPVwFHon/1LOPSS99QLD57VzeY/FLU3kwTWULLF/tkujqYrHyym+HqmXAknvGNNQMvequgsWk+tHLDAjlejErIfDtK/TIPFBJL7mh8+kt6i7G/2vn6czAbI24E0xMSd+5Q8GWGYqghXi4sMLJ4zqbMdE59b9Tk4guh8wbvqAVo5YRn0qaCRGq+dzVqJY5eYn66SgggLyDD1s+5pRVrPWYJrLfuAA/mmZgCQpQ43UfX5+L+oXXzyQHn1SRWIrcoh7YugdO1hSQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:20.8742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee160262-9c7c-4596-8908-08d778afdc71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3095
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MgqguEy0jasCHbpHxT7B0woU2qwbfZInWMJIuCHW7o=;
 b=DpmkmlsQdZVsCELyQGF0SUG7KPT6pP8FwwrKx0677crtdJRZxbQbpImEBcDUoDZ6rL50PYuBOTKDbWKulk3yorYWUKaFoiL8wkI2bOi+FnJsBvzgya2q0o1eaEZCHX6Zm/i28A8Tx8BkhJA1JihBEErbFZoq2CLFWO1sEwewFoc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MgqguEy0jasCHbpHxT7B0woU2qwbfZInWMJIuCHW7o=;
 b=DpmkmlsQdZVsCELyQGF0SUG7KPT6pP8FwwrKx0677crtdJRZxbQbpImEBcDUoDZ6rL50PYuBOTKDbWKulk3yorYWUKaFoiL8wkI2bOi+FnJsBvzgya2q0o1eaEZCHX6Zm/i28A8Tx8BkhJA1JihBEErbFZoq2CLFWO1sEwewFoc=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWwt
c2lpODYyMC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIwLmMKaW5kZXggNGMwZWVmNDA2
ZWIxLi40ODJkYzIyOTEzNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ls
LXNpaTg2MjAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIwLmMKQEAg
LTIzMzcsOCArMjMzNyw3IEBAIHN0YXRpYyBpbnQgc2lpODYyMF9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LAogCiAJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgY3R4KTsKIAotCWN0
eC0+YnJpZGdlLmZ1bmNzID0gJnNpaTg2MjBfYnJpZGdlX2Z1bmNzOwotCWN0eC0+YnJpZGdlLm9m
X25vZGUgPSBkZXYtPm9mX25vZGU7CisJZHJtX2JyaWRnZV9pbml0KCZjdHgtPmJyaWRnZSwgZGV2
LCAmc2lpODYyMF9icmlkZ2VfZnVuY3MsIE5VTEwsIE5VTEwpOwogCWRybV9icmlkZ2VfYWRkKCZj
dHgtPmJyaWRnZSk7CiAKIAlpZiAoIWN0eC0+ZXh0Y29uKQotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
