Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E710B109EDC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4A36E340;
	Tue, 26 Nov 2019 13:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE216E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:19 +0000 (UTC)
Received: from VI1PR08CA0096.eurprd08.prod.outlook.com (2603:10a6:800:d3::22)
 by VI1PR0801MB1822.eurprd08.prod.outlook.com (2603:10a6:800:5c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:17 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0096.outlook.office365.com
 (2603:10a6:800:d3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:17 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:17 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Tue, 26 Nov 2019 13:16:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fffb61ce6bbc02b2
X-CR-MTA-TID: 64aa7808
Received: from 0334c95094c9.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D6D01C9-52D0-4AC9-BFD7-3E0C84E4FAC9.1; 
 Tue, 26 Nov 2019 13:16:11 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0334c95094c9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0wCYST6tErq5F47pDNzbOqQfMhb9NkEfGrEm9n30BBpRVTrglxvdAvm9J0yOb5j6r8PmTkl23sk0YyFB7Sv/0jHliD+Fee93TSk2HMQZRLSAHKWhP9wnQxQh7yDM79NovXP45JW6k70RebEnUipNZTCXkeDoTZomyjHbQAhPAOPk7pgrHVhe3ZAAWaK0rUEk2nd7sdaIocznWWMKwrInENKqt2jeq0PU06OQHof3pcP7oCQ2SS8LFovrT3dUBQvvGd4U099o3YVOQL/fEJM81GH1FbVtYKuhvOgK0H9Q7OgzJYl10dp3EfrCvU67b5PBR/o0UjmjBm6KCZA3rTrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br0IlITciAKMvoJF61FmiO4/HJaoP04jFIkFIztPEYA=;
 b=Uk87qBZ8z7gUaOlCqOcH9Vu4EwdVbPWd8/2WTzrXwCW1oMGE2pt9OTdzRf5tOijBf1NhfxGkv293rH9XCxtRT6TbQXbv1TIfN5Y6rONr+U+6YY0Qt/cGIcPO3Sd4e88Fr4W/1HSletMn3zl0pKlP9CpsIRS8vjSy9rVJJTvEI6TUzgIT7EQ31oN/175AjaIx60aBXxqhCyaLPHPQnkr3GoPxjKPmjR1DhhNzNoxTcmHXWrb+EVElR2Oz8uOIzahJvk5JCK2NwzXclFKWsPqeScivrZgKIb3KU4GFcMfQyH662f8wzpS53y/50ErV+wmhun3QwIPcxtfXhzoU0IwyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:09 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:09 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/30] drm/bridge: ps8622: Use drm_bridge_init()
Thread-Topic: [PATCH 11/30] drm/bridge: ps8622: Use drm_bridge_init()
Thread-Index: AQHVpFurg5txLQ+NAkCgI2Ac0kEZ+Q==
Date: Tue, 26 Nov 2019 13:16:09 +0000
Message-ID: <20191126131541.47393-12-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e89cf2a-f0c8-4985-03b3-08d77272d246
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|VI1PR0801MB1822:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB182294B8D98142F0044E72A88F450@VI1PR0801MB1822.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pTxPhTopEbIKcwrYDQLgGUtBKDndqB41AqImQqeneDxjNqe3pirM3MWVk1UWnY/JL+ywhpTjzlJY8hjkvmmNU5yvvneG/AbMDaQDUH2DGAtrlV5ndNEemZU6wnOuGPycV7cNUL3u5iDjRqXh7728dHQvX0xnLZ1Mpxo7QslW9mLR3ynZ36hBixdY5b7ic2w/e1orl0sEHkPV6oL0dd3MqOnBxDi+ey3wuKuWJG6XEq7K5e1PIG4oAMTWmOrgPFD6Gy0D76eAg2Oh4lPV2H1taXFirFrkdSpfj/65+THi7x/vShxwAw33l4cvJkN71hUIbSjiKYoRlRpBuLArjt7RPviYiohHWLOGzsuJulr0uYEBkHu3ZzVkpC0P7k+5vP8m9lZ0R1ZFF+ji2reYGUeI8CQc7j0YaN/Dui+/Kq/hOqLGFB1y1yTSkWWUwkjaSTyv
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(189003)(199004)(99286004)(6916009)(76176011)(102836004)(36756003)(66066001)(86362001)(7736002)(2906002)(50466002)(76130400001)(2351001)(26005)(186003)(2616005)(446003)(6116002)(3846002)(81156014)(81166006)(11346002)(6486002)(22756006)(336012)(5640700003)(26826003)(25786009)(107886003)(4744005)(6512007)(70206006)(2501003)(1076003)(54906003)(50226002)(8936002)(6506007)(386003)(23756003)(356004)(305945005)(36906005)(14454004)(316002)(4326008)(8746002)(8676002)(5660300002)(478600001)(70586007)(106002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1822;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 451d2042-b35a-4780-882e-08d77272cd55
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KQr/2UoalxiJkb7ClDncP6fhr9qwP8eWzEXzx57sYRO6bCcGgoNZ5DyXpa6kEmZKhSKFQaoFEDNR5jYpEwifezaAr8GaRBli8h+aa1oB6P4oGBSadQ4xt/NaqzOCGwBWxwYDfXTpoCW/Jr3/Lt4wN2+Qv+K683yXePEMYl5WmbpGnGw4+WsSZuY6/1wP7k+8P8ktWTDMG/lGhuWh1GxL3BCwYXug1qxSl7a4fIXdAKoTHUy4+ScyLh78h3cCD4qza764ckyr9V0NqcXtrFE1bt0GbKBGHwpA6ftc4D3NaxahlX+6yrqfw+GV+wY7qr3E5T8twPTmpSCXbcjvsvp0YJAt2LYNonSQtugeA+lKmkLykZqFOSeknefUC85bihZZmmAvZYFAi2QZgzxRP0MEY2/SCYV/Jyomr8YAB9g9jRWhoLljsK99bFFNmhyKrKZK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:17.4735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e89cf2a-f0c8-4985-03b3-08d77272d246
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1822
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br0IlITciAKMvoJF61FmiO4/HJaoP04jFIkFIztPEYA=;
 b=VhKEMutKzCHNWDbnslmhKSh2qKB+9LLi44FACy6k/QU/mNPy2xSye7+hFyOewP3hIPO3MyBOEH2+N1bmF0G9O8rFks3xfb8dhQC3ndoH3yl9LCdTf6xPka9y0tApgilZVStc6b+KNZBbbtXmKrhKoWFIWF+YwQ7dXQkk01/eQzI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br0IlITciAKMvoJF61FmiO4/HJaoP04jFIkFIztPEYA=;
 b=VhKEMutKzCHNWDbnslmhKSh2qKB+9LLi44FACy6k/QU/mNPy2xSye7+hFyOewP3hIPO3MyBOEH2+N1bmF0G9O8rFks3xfb8dhQC3ndoH3yl9LCdTf6xPka9y0tApgilZVStc6b+KNZBbbtXmKrhKoWFIWF+YwQ7dXQkk01/eQzI=
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
