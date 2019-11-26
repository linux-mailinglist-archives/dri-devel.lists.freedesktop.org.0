Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C8109EE6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EA56E366;
	Tue, 26 Nov 2019 13:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CDF6E353
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:38 +0000 (UTC)
Received: from VI1PR08CA0100.eurprd08.prod.outlook.com (2603:10a6:800:d3::26)
 by AM0PR08MB4209.eurprd08.prod.outlook.com (2603:10a6:208:10c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Tue, 26 Nov
 2019 13:16:36 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR08CA0100.outlook.office365.com
 (2603:10a6:800:d3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:36 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:36 +0000
Received: ("Tessian outbound f7868d7ede10:v33");
 Tue, 26 Nov 2019 13:16:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d914095c1eeeccd7
X-CR-MTA-TID: 64aa7808
Received: from a4bda1e7f4c9.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09D6DE19-468D-4F1F-B9A4-A85333043EAF.1; 
 Tue, 26 Nov 2019 13:16:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4bda1e7f4c9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTvJXLYIp5rAgMJhpUqkBWq3XTa26jZ9m+gtVPjhbyA7cgnsQVLFfv38rkhHNWGnnDpumkBQdzZ1hlCXgKjtemyi64DDXZqmIGDpShjaZlfsGAHBoTPL87/TgxWrbuv/D5TMfMf0UoeLnHmBSefSzwfgdwVSK8/4ZuCJOsgwp1wqEqp2UY56mqia2D4Syq+bONRLO3+wXF3WHVcSqutNfNcJNwdNSy1plOfnG/rZFlk47zxkiohVxIWtGSNl5V9WFpeHmf3R3kKBYDBHrzwMJQV2uUXUsD8IzMbziF1nicFZhfvGo6n/qjgc/u13KaKetUHgAmBLEr1VdrjVI85hfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22yLRF+OD4SGmB+ZPAp6mmB9i3wb2rmCRZA/8wtNzW4=;
 b=K0B24MUoiItjJ47K++yO57G7RyvV4IPku5eQ5IFON30OWCql68WD16tLxn4oN1zojh5QVorDbdPYtRFvHcaFhRrkQEUrA9kksZeT0zItE+DiPd0lFcdnrCN/hQebo5N5Lq58l8RMSzivmwnDR+KgrDRa1Wf7Z+ISb3YUKF58XYk2IXbT00f4SmDOQn7CWAkpElKmFnC77+RJwL4YWXerdG0O2H8GLP8k4/Gi2WpJXmA1w0KmOQTs6dEo5T1jogFf8O/x01zkaxiBLRpQ/g/Apa76Yn8XdFnGe9LKxZOGZ2kq2ZJdq8TKv7hMdm19qWEUZ8whR1Ti/SJOEgEMA+W38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4560.eurprd08.prod.outlook.com (20.179.24.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 13:16:27 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:27 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/30] drm/bridge: add support for device links to bridge
Thread-Topic: [PATCH 29/30] drm/bridge: add support for device links to bridge
Thread-Index: AQHVpFu1iHJCIvZyo0WUUQNtpUlixw==
Date: Tue, 26 Nov 2019 13:16:26 +0000
Message-ID: <20191126131541.47393-30-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 42ffda81-6bea-4a46-4735-08d77272dd82
X-MS-TrafficTypeDiagnostic: VI1PR08MB4560:|VI1PR08MB4560:|AM0PR08MB4209:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4209A64F5ED6BD2F6BD312FE8F450@AM0PR08MB4209.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(71190400001)(478600001)(1076003)(66476007)(186003)(26005)(5640700003)(52116002)(64756008)(256004)(8676002)(2351001)(66946007)(54906003)(81156014)(44832011)(3846002)(6116002)(6436002)(2616005)(66556008)(71200400001)(2906002)(11346002)(66446008)(99286004)(14454004)(81166006)(6916009)(5660300002)(25786009)(2501003)(8936002)(102836004)(5024004)(66066001)(36756003)(6486002)(6512007)(386003)(14444005)(4326008)(50226002)(76176011)(316002)(86362001)(7736002)(446003)(6506007)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4560;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IEzpmioFC9HXH/GMPwyuotFzMFChNW9v7z9ednY2Nth2mD3q3HnLQ3/mNFUDO/sQp+pcQWCqRKZG6KrCamm8dDmYhrp5wF1Aam/k9S4N+M1WBbAABYYF9nbc65dMhgKjCNp4YvHOHR0NMIB9Axx77gHi0VUNwDqTJ7R7aQN8r9xujdQofBGY3aZmVhfRicIya/rnP6IvfWPZVzCu2n0pMaSnlqMREjNE71OFOH9FfEflz4+4yWA8mB5ftPtuXMPOAvKkEzdpKeTzE+ut63Ht0YmIJXXQEJNA40mxLpqfW/Wjb9zvrgn+by7e9CODVdLH4hGQHndF/VOFF+R76FIrrp4fP7MiWYM2fioB/xmNTYpDOW+0GAWDJd3h+rx3qjoibmbhQmRxzqA/t954RRsApcjxzmKXdqKQhfE9BV9ODLkhh24tQ+92Y6HuSZxNQIQA
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4560
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(199004)(189003)(22756006)(26826003)(50226002)(47776003)(8746002)(70586007)(8936002)(81156014)(2906002)(81166006)(8676002)(14444005)(6486002)(25786009)(5024004)(316002)(54906003)(386003)(478600001)(66066001)(76176011)(186003)(70206006)(99286004)(2351001)(76130400001)(6506007)(26005)(5660300002)(1076003)(356004)(446003)(11346002)(2616005)(6512007)(6116002)(3846002)(86362001)(36756003)(5640700003)(23756003)(6916009)(4326008)(2501003)(336012)(107886003)(102836004)(106002)(50466002)(305945005)(14454004)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4209;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a0850149-8228-499b-51bd-08d77272d7b7
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHsbkF9x3YnJVgGA6DmuUtOD3+53P3GHGJnIAiTQ1wmADKYkBvOPV1KuIWY8I0iTzLUJtcfA8hHZ+KO4KE0XJ2uQEvDB1JhK3+xvQ05q4WN4Dyl8/T+sft2mZZkscKr+LhC+rzaTItnIVPxp/q0NnSp/JDWJaRN/96bnuJjiISxBs2MPQG05YyjQ0imJMCM3at9KUpZr8kKCb1MGpnGaaWbWUgm+RBP2+V5WHTeE+uMJiCwHXj5ei/6naQgkqB+SfPYhlLMiIn3AdUGo1IfbI/VJcnC8AxLA1JM4JQf2mzgDyYhEooFsYRqn/KkInKuG7aauEuRXRMSU6wckHFYtBiJfqJ3aGDB/cp50Qz8ADdo3FnGZ4HsYHwSLdvfVZD6IUI7oHgW31zWsvvBhd4lJqNkdH3bE55/wTE81Vg8AYjAQHT3zbvdTIQcCLkAEz+d6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:36.3814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ffda81-6bea-4a46-4735-08d77272dd82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22yLRF+OD4SGmB+ZPAp6mmB9i3wb2rmCRZA/8wtNzW4=;
 b=BtYl6AfDKJf5AUHeLBp1Xu0b0ZWHwd5Kh/QJ2ght1+5FzJH9v/eKebCg67AEiuxR9pnVsPfjW9c/W9jwqIaldk62TvrQcyZFLoGTYcTXGwuleChjMm79AZ3MdtrY/77WSmKVoMNm4tOJlcekRAp4ILsksN029qCkcTxVAL8DDhE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22yLRF+OD4SGmB+ZPAp6mmB9i3wb2rmCRZA/8wtNzW4=;
 b=BtYl6AfDKJf5AUHeLBp1Xu0b0ZWHwd5Kh/QJ2ght1+5FzJH9v/eKebCg67AEiuxR9pnVsPfjW9c/W9jwqIaldk62TvrQcyZFLoGTYcTXGwuleChjMm79AZ3MdtrY/77WSmKVoMNm4tOJlcekRAp4ILsksN029qCkcTxVAL8DDhE=
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
 Russell King <rmk+kernel@armlinux.org.uk>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KCkJyaWRnZSBk
ZXZpY2VzIGhhdmUgYmVlbiBhIHBvdGVudGlhbCBmb3Iga2VybmVsIG9vcHMgYXMgdGhlaXIgbGlm
ZXRpbWUKaXMgaW5kZXBlbmRlbnQgb2YgdGhlIERSTSBkZXZpY2UgdGhhdCB0aGV5IGFyZSBib3Vu
ZCB0by4gIEhlbmNlLCBpZiBhCmJyaWRnZSBkZXZpY2UgaXMgdW5ib3VuZCB3aGlsZSB0aGUgcGFy
ZW50IERSTSBkZXZpY2UgaXMgdXNpbmcgdGhlbSwgdGhlCnBhcmVudCBoYXBwaWx5IGNvbnRpbnVl
cyB0byB1c2UgdGhlIGJyaWRnZSBkZXZpY2UsIGNhbGxpbmcgdGhlIGRyaXZlcgphbmQgYWNjZXNz
aW5nIGl0cyBvYmplY3RzIHRoYXQgaGF2ZSBiZWVuIGZyZWVkLgoKVGhpcyBjYW4gY2F1c2Uga2Vy
bmVsIG1lbW9yeSBjb3JydXB0aW9uIGFuZCBrZXJuZWwgb29wcy4KClRvIGNvbnRyb2wgdGhpcywg
dXNlIGRldmljZSBsaW5rcyB0byBlbnN1cmUgdGhhdCB0aGUgcGFyZW50IERSTSBkZXZpY2UKaXMg
dW5ib3VuZCB3aGVuIHRoZSBicmlkZ2UgZGV2aWNlIGlzIHVuYm91bmQsIGFuZCB3aGVuIHRoZSBi
cmlkZ2UKZGV2aWNlIGlzIHJlLWJvdW5kLCBhdXRvbWF0aWNhbGx5IHJlYmluZCB0aGUgcGFyZW50
IERSTSBkZXZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJt
bGludXgub3JnLnVrPgpUZXN0ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNz
b3ZAYXJtLmNvbT4KW3Jld29ya2VkIHRvIHVzZSBkcm1fYnJpZGdlX2luaXQoKSBmb3Igc2V0dGlu
ZyBicmlkZ2UtPmRldmljZV0KU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWls
LmF0YW5hc3NvdkBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgfCA0
OSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9i
cmlkZ2UuaCAgICAgfCAgNCArKysKIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKaW5kZXggY2JlNjgwYWE2ZWFjLi5lMWY4
ZGI4NDY1MWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwpAQCAtMjYsNiArMjYsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L211dGV4Lmg+CiAKICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgorI2luY2x1ZGUg
PGRybS9kcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+CiAKICNpbmNs
dWRlICJkcm1fY3J0Y19pbnRlcm5hbC5oIgpAQCAtMTA5LDYgKzExMCw3IEBAIHZvaWQgZHJtX2Jy
aWRnZV9pbml0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2UgKmRldiwK
IAlicmlkZ2UtPmVuY29kZXIgPSBOVUxMOwogCWJyaWRnZS0+bmV4dCA9IE5VTEw7CiAKKwlicmlk
Z2UtPmRldmljZSA9IGRldjsKICNpZmRlZiBDT05GSUdfT0YKIAlicmlkZ2UtPm9mX25vZGUgPSBk
ZXYtPm9mX25vZGU7CiAjZW5kaWYKQEAgLTQ5Miw2ICs0OTQsMzIgQEAgdm9pZCBkcm1fYXRvbWlj
X2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIEVYUE9SVF9TWU1CT0wo
ZHJtX2F0b21pY19icmlkZ2VfZW5hYmxlKTsKIAogI2lmZGVmIENPTkZJR19PRgorc3RhdGljIHN0
cnVjdCBkcm1fYnJpZGdlICpkcm1fYnJpZGdlX2ZpbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
KwkJCQkJICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBib29sIGxpbmspCit7CisJc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSwgKmZvdW5kID0gTlVMTDsKKwlzdHJ1Y3QgZGV2aWNlX2xpbmsgKmRs
OworCisJbXV0ZXhfbG9jaygmYnJpZGdlX2xvY2spOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeShi
cmlkZ2UsICZicmlkZ2VfbGlzdCwgbGlzdCkKKwkJaWYgKGJyaWRnZS0+b2Zfbm9kZSA9PSBucCkg
eworCQkJZm91bmQgPSBicmlkZ2U7CisJCQlicmVhazsKKwkJfQorCisJaWYgKGZvdW5kICYmIGxp
bmspIHsKKwkJZGwgPSBkZXZpY2VfbGlua19hZGQoZGV2LT5kZXYsIGZvdW5kLT5kZXZpY2UsCisJ
CQkJICAgICBETF9GTEFHX0FVVE9QUk9CRV9DT05TVU1FUik7CisJCWlmICghZGwpCisJCQlmb3Vu
ZCA9IE5VTEw7CisJfQorCisJbXV0ZXhfdW5sb2NrKCZicmlkZ2VfbG9jayk7CisKKwlyZXR1cm4g
Zm91bmQ7Cit9CisKIC8qKgogICogb2ZfZHJtX2ZpbmRfYnJpZGdlIC0gZmluZCB0aGUgYnJpZGdl
IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGRldmljZSBub2RlIGluCiAgKgkJCXRoZSBnbG9iYWwgYnJp
ZGdlIGxpc3QKQEAgLTUwMywyMSArNTMxLDE2IEBAIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19i
cmlkZ2VfZW5hYmxlKTsKICAqLwogc3RydWN0IGRybV9icmlkZ2UgKm9mX2RybV9maW5kX2JyaWRn
ZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogewotCXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7
Ci0KLQltdXRleF9sb2NrKCZicmlkZ2VfbG9jayk7Ci0KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJy
aWRnZSwgJmJyaWRnZV9saXN0LCBsaXN0KSB7Ci0JCWlmIChicmlkZ2UtPm9mX25vZGUgPT0gbnAp
IHsKLQkJCW11dGV4X3VubG9jaygmYnJpZGdlX2xvY2spOwotCQkJcmV0dXJuIGJyaWRnZTsKLQkJ
fQotCX0KLQotCW11dGV4X3VubG9jaygmYnJpZGdlX2xvY2spOwotCXJldHVybiBOVUxMOworCXJl
dHVybiBkcm1fYnJpZGdlX2ZpbmQoTlVMTCwgbnAsIGZhbHNlKTsKIH0KIEVYUE9SVF9TWU1CT0wo
b2ZfZHJtX2ZpbmRfYnJpZGdlKTsKKworc3RydWN0IGRybV9icmlkZ2UgKm9mX2RybV9maW5kX2Jy
aWRnZV9kZXZsaW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJCSAgICAgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnApCit7CisJcmV0dXJuIGRybV9icmlkZ2VfZmluZChkZXYsIG5wLCB0cnVl
KTsKK30KK0VYUE9SVF9TWU1CT0wob2ZfZHJtX2ZpbmRfYnJpZGdlX2RldmxpbmspOwogI2VuZGlm
CiAKIE1PRFVMRV9BVVRIT1IoIkFqYXkgS3VtYXIgPGFqYXlrdW1hci5yc0BzYW1zdW5nLmNvbT4i
KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9icmlkZ2UuaAppbmRleCBkNmQ5ZDUzMDE1NTEuLjY4YjI3YzY5Y2MzZCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaApA
QCAtMzgyLDYgKzM4Miw4IEBAIHN0cnVjdCBkcm1fYnJpZGdlIHsKIAlzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXI7CiAJLyoqIEBuZXh0OiB0aGUgbmV4dCBicmlkZ2UgaW4gdGhlIGVuY29kZXIg
Y2hhaW4gKi8KIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqbmV4dDsKKwkvKiogQGRldmljZTogTGludXgg
ZHJpdmVyIG1vZGVsIGRldmljZSAqLworCXN0cnVjdCBkZXZpY2UgKmRldmljZTsKICNpZmRlZiBD
T05GSUdfT0YKIAkvKiogQG9mX25vZGU6IGRldmljZSBub2RlIHBvaW50ZXIgdG8gdGhlIGJyaWRn
ZSAqLwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zfbm9kZTsKQEAgLTQwNyw2ICs0MDksOCBAQCB2
b2lkIGRybV9icmlkZ2VfaW5pdChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLCBzdHJ1Y3QgZGV2
aWNlICpkZXYsCiAJCSAgICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyAqdGltaW5n
cywKIAkJICAgICB2b2lkICpkcml2ZXJfcHJpdmF0ZSk7CiBzdHJ1Y3QgZHJtX2JyaWRnZSAqb2Zf
ZHJtX2ZpbmRfYnJpZGdlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOworc3RydWN0IGRybV9icmlk
Z2UgKm9mX2RybV9maW5kX2JyaWRnZV9kZXZsaW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJ
CQkJCSAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwogaW50IGRybV9icmlkZ2VfYXR0YWNo
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwK
IAkJICAgICAgc3RydWN0IGRybV9icmlkZ2UgKnByZXZpb3VzKTsKIAotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
