Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19845112A88
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93776E8D2;
	Wed,  4 Dec 2019 11:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348F16E8D2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:23 +0000 (UTC)
Received: from VE1PR08CA0013.eurprd08.prod.outlook.com (2603:10a6:803:104::26)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:18 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VE1PR08CA0013.outlook.office365.com
 (2603:10a6:803:104::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:18 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:18 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Wed, 04 Dec 2019 11:48:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7627a8a30590dbf4
X-CR-MTA-TID: 64aa7808
Received: from a83b0422c187.12
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA34D32C-9E51-47F9-9857-E42DB5C7A577.1; 
 Wed, 04 Dec 2019 11:48:12 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 a83b0422c187.12 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUFyKGLDv8P+18xYbOG805g1B+VKWZ/is0j+0N3/5mJ/vpNnIODRwb6SoPLMf9ecB0ZeVkkWGSlFsJ8/Hb/gbX8KFrh5jJYFkiGRuULvX8mq+kiUy6MJRIk3PvpHp0/vzio5FfkrzGBVrAZ5bVB3hYYj2PHucPqN0KDckKxlLRdjITYue4qx1C0n0q7i27i1JfYGa8v/qE2Y1ohqSdmJMl/ZzKF6N9IfGFaTQfaBhTfAM/dFKCmqpGjFUGLVXAbA4Ty5a+uUPL8h6cQKO5qkBi7rVprhwj/3TMMqqGI0dEZ6ISDBi+IwIoOSX7nYjamRRKz6oyPMqIbzNqsSJhlBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br0IlITciAKMvoJF61FmiO4/HJaoP04jFIkFIztPEYA=;
 b=FcHV6oyJvyq7H//1R/6aWcRZ2iqzxk4fNsPW38wY+mwly+A2N35wbtrSgeHvvWROLDR4+j1SEe37jXQQWOUjrxmlLuDm5rmrRE+hA0p/vn0SMQ8vXLjv8BQyIStF4rMWioLzGaSHcefMh9tsYERaezmjY8G7cAywg0N33CUq1EUAJEmnMid+qskdOjfnLD/9zvnNhXi1z1vz8Rg1e04OLVEFH6AOvowKRixav4Ei2OTH1ON9/nbpCVWOdl14+SW471A9XoIjgr3ayUtHLDb2pXG8jmHdwoeqhAxNsn95P2yfqoKvogAKT4VIQXSRRPdbU7ZvfXNhiFQDraj5eZYELg==
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
 11:48:10 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 10/28] drm/bridge: ps8622: Use drm_bridge_init()
Thread-Topic: [PATCH v2 10/28] drm/bridge: ps8622: Use drm_bridge_init()
Thread-Index: AQHVqpizay7d4VaJM0yJ4GyAV6AMEA==
Date: Wed, 4 Dec 2019 11:48:10 +0000
Message-ID: <20191204114732.28514-11-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 94f3f9ca-7190-4301-8e4b-08d778afdad3
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM7PR08MB5320:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53200ED3B17ECC4E747A9DD78F5D0@AM7PR08MB5320.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: W4PlH/TcKXIKVdX9JPXJP0R19/a92nQgR2DgxDQoZlPVetYuDugHHLEEkrV3l/vlsizDHViEAk2dz2fxS6ImMUMUqrsNsv9yWic18B9wMbiQaMT7FnWjaB2EFay8hKfmBwkceFcfYTfOim/Gbl3IyCOenpVmlJn0wDLPcjM6RNnk5FE7s/6OOqsURqqoMct5g2DzKew3P5TxeheUvNz4VBGn5oyevoXE1c9HExKKKPaZqM+cFbmrGwTkILlpTboYgpQJF+g7JTCpWMRcNjv3+xfv/JVFvP/XLz8+zUcoR6V65dKH4h5D0hFhmUQZWQ4LTusLaFmJTS7FMCuX4nde4psfJ+dqoWjKORg9E+emmWIvpcob3JcXrhca0smrQ/5BP0c8vq6U+mnm8zvRe5gJs1KlqzDtgdcJXtK9AjEZOAb6ydf3KWpKAbGeNMrpiAdA
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(186003)(1076003)(6916009)(2501003)(50466002)(76130400001)(26826003)(6116002)(478600001)(6506007)(25786009)(26005)(102836004)(14454004)(2351001)(99286004)(4326008)(70586007)(4744005)(50226002)(107886003)(70206006)(86362001)(54906003)(336012)(2616005)(8746002)(81156014)(81166006)(5660300002)(8676002)(8936002)(11346002)(305945005)(7736002)(6512007)(36756003)(6486002)(3846002)(316002)(22756006)(5640700003)(356004)(2906002)(23756003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5320;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4ed00b8f-41c3-49c1-63c0-08d778afd649
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7DP/QoZeWDe+ncSdiDLeXiv16Sz7imPTNRT9bTJ/m78lJ83Hz+3Q7IXWEnuCiCTL2XRhvxxJz6sD56EnrPLEzqrJpVLqITGO3XpeBW9Xdg6j6Ja84iIH1ZSpYQoESeOtr3+huHhCryexujtOTYQd1zLaeiNvuHfIT4uJNVfwQzr5qwet/i+KWLqgYe7ay3UK0JegtROIcDOWmsw/dqeYlRkE9RxHBBNFPgikzYOJDKKhkXPsRNEcTLpjhTkn3y6s7Jg+X4A5lSLVPJPWdwCsI2R/yKEtDeAbRoTNen0VzTweCPATqmWbn32jCmY8tCNBTvXyf5GXm2RxeQ/TuPXis3PauPV1pvVDmBcjOHnU7Yl+F2mVJ6w9s5cSqFZqlWZ4UTkBi4U+qbCXzs6dsbguu/Bt4q4EOTvEjMVfoevafaTgVF5yzNfR43ipfXANHCy
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:18.1461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f3f9ca-7190-4301-8e4b-08d778afdad3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br0IlITciAKMvoJF61FmiO4/HJaoP04jFIkFIztPEYA=;
 b=uUNDc+HHCbMYXzI6UrL/Cx/cB4W9VkAX2bV96BJdpqNIO1mGf9xR+8XoVf8maf3vVW+KeuDd8UnBTClvPsNK0HD7WNHOH5j6d06L6phbAr42kkO31bRbuVO8/vQQwy8SyORqZ4dQC5tyaVYYBe8gcaJw8QZkeikw2AtIV585JAE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br0IlITciAKMvoJF61FmiO4/HJaoP04jFIkFIztPEYA=;
 b=uUNDc+HHCbMYXzI6UrL/Cx/cB4W9VkAX2bV96BJdpqNIO1mGf9xR+8XoVf8maf3vVW+KeuDd8UnBTClvPsNK0HD7WNHOH5j6d06L6phbAr42kkO31bRbuVO8/vQQwy8SyORqZ4dQC5tyaVYYBe8gcaJw8QZkeikw2AtIV585JAE=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJh
ZGUtcHM4NjIyLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFyYWRlLXBz
ODYyMi5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjIyLmMKaW5kZXggYjdh
NzJkZmRjYWMzLi44NDU0ZGJiMjM4YmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvcGFyYWRlLXBzODYyMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFyYWRlLXBz
ODYyMi5jCkBAIC01ODgsOCArNTg4LDcgQEAgc3RhdGljIGludCBwczg2MjJfcHJvYmUoc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCwKIAkJcHM4NjIyLT5ibC0+cHJvcHMuYnJpZ2h0bmVzcyA9IFBT
ODYyMl9NQVhfQlJJR0hUTkVTUzsKIAl9CiAKLQlwczg2MjItPmJyaWRnZS5mdW5jcyA9ICZwczg2
MjJfYnJpZGdlX2Z1bmNzOwotCXBzODYyMi0+YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9mX25vZGU7
CisJZHJtX2JyaWRnZV9pbml0KCZwczg2MjItPmJyaWRnZSwgZGV2LCAmcHM4NjIyX2JyaWRnZV9m
dW5jcywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJnBzODYyMi0+YnJpZGdlKTsKIAog
CWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQsIHBzODYyMik7Ci0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
