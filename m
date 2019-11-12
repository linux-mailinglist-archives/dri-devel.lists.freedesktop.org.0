Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A905F8D04
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2976EB03;
	Tue, 12 Nov 2019 10:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0066EB03
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:40:37 +0000 (UTC)
Received: from VI1PR0801CA0068.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::12) by AM5PR0802MB2402.eurprd08.prod.outlook.com
 (2603:10a6:203:a1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Tue, 12 Nov
 2019 10:40:34 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR0801CA0068.outlook.office365.com
 (2603:10a6:800:7d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Tue, 12 Nov 2019 10:40:34 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 10:40:34 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Tue, 12 Nov 2019 10:40:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0223c4c3e8757ecc
X-CR-MTA-TID: 64aa7808
Received: from de65cc25b090.2 (cr-mta-lb-1.cr-mta-net [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F759FE6A-C118-4ADD-B299-F8CF3F1BE2B2.1; 
 Tue, 12 Nov 2019 10:40:26 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de65cc25b090.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 12 Nov 2019 10:40:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLzOZrLe+GNCkmAUFv7kFffBcSZ9epXDbttamNCXgD7oDrmVKsTzsfWgD6pxAdoT4gScY311G0o5oAgJHPrNnMxQXRQeE74lRkRPOuuRe/u1lF1agKeFRpSb/SVNX5ECj0hJbiqDSGVFz+zc7ZQnBDt9WLJEu6xF9fqzZlRfkgtsOfB3aJU7fmiE7QflcES+IZ1RSx3EVtolR7F9V1cdOjrcf4BuFtbybn9jCYBsUsSixhSN3sFwAR+PmTQF6THmge3vHYbHSZFdApqw6YYlWWPww1+Kmik1dJ74g3BKlilMePr1HxMxJZ4autZC0F1B7N57cJ7p1VezH9Ht8BwiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xvTegslMD5L2ZURhngFfxlrPcslIxpmCTDULZVxcYM=;
 b=KqFg0vtulZoKcY3rAUtPXwRLL8t6VsRXhphh1OFG+6PyhUMWmc7LmgHMGyeItCiMs80/EvbUoQiOYBQe0f4GOEQBthhU/23X1jqrRujJ6gxM3+Uj7SoCAQJc26bA6SK8IXeADu/QMQVyQ6TUjDZbaHXaKW2aHELcEYgg1n8zDcLA1SVF/wqbLtsUvs4NoNi9YFPeWdnoeEf58/hRdD9CUINtJVWEhdn18P/ZJq0vA+Q0zYNdt1rZKixUReuwse2c0U9y6hX88Oxi99W/WBK7vpFQKiLkGY7C2r0i4avBVlXoXFE0OVgAeQiKEEmzykp1Oo6/mTi1uq+9D3fFdJmhWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB4082.eurprd08.prod.outlook.com (20.178.119.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 12 Nov 2019 10:40:24 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 10:40:24 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v9 1/4] drm: Add a new helper drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v9 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVmUWWuw5SiCc2fkWBYrtItjbs1w==
Date: Tue, 12 Nov 2019 10:40:24 +0000
Message-ID: <20191112103956.19074-2-james.qian.wang@arm.com>
References: <20191112103956.19074-1-james.qian.wang@arm.com>
In-Reply-To: <20191112103956.19074-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:203:72::27) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a17d7899-1e41-4200-cab4-08d7675cbf57
X-MS-TrafficTypeDiagnostic: AM0PR08MB4082:|AM0PR08MB4082:|AM5PR0802MB2402:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2402BC43FB4A301D3F153758B3770@AM5PR0802MB2402.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(199004)(189003)(86362001)(6512007)(478600001)(66066001)(54906003)(110136005)(316002)(5660300002)(6486002)(14454004)(2171002)(11346002)(446003)(2616005)(6436002)(25786009)(476003)(2201001)(5024004)(1076003)(6506007)(8936002)(386003)(99286004)(2906002)(4326008)(55236004)(102836004)(103116003)(256004)(66946007)(66556008)(66476007)(64756008)(66446008)(6116002)(3846002)(52116002)(26005)(81166006)(81156014)(8676002)(186003)(7736002)(486006)(71190400001)(71200400001)(36756003)(305945005)(76176011)(50226002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4082;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ReJv4jvD7YQLbC0YnVJnn44xbYNi/jreBYFSKCUPDERxW6BYEVnTbfKfzuvIuwcOlQwa3WBAFr3tx/1jbCPU36cuQmE4qbQq4RYeGWlhC99Wd6ZH8w5rozz1xaBWsttThognlCVnN8fBlehCtj7ELL9JI+vkwvK+DNbVqUuuFlWnxd4/66HRw9aL16ahl9R6/oExbhJtP2oN8Ey6MEGBz5B/+CUDLPwnziKrhSb7CofYSxt+NLZVKH/ULXbtDqvgBsxKZx+WmdDTtDOWRyamxR9Y+Zy8ohEn1Jctrn7Smk8YXH+yBCUx4U2zNa+jnOd8vAKhVBkvi1G4n3SIsfnqOxPMNHJY4Kg8Ldyf6t2ZC7DarguxahpShWkhZQTZNWWxxAtC4tzWuUEHzs7UZubtbfR3MU9ePBdGeQJssqWq0cESobbWavLbE+JauN/IuOK5
Content-ID: <FDC123B376106B4E906BEB65FED792E5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(1110001)(339900001)(189003)(199004)(103116003)(86362001)(26826003)(2201001)(478600001)(22756006)(6486002)(107886003)(81166006)(81156014)(8676002)(6512007)(105606002)(2171002)(4326008)(36756003)(186003)(14454004)(66066001)(47776003)(99286004)(70206006)(356004)(1076003)(70586007)(102836004)(6506007)(386003)(26005)(2906002)(2501003)(126002)(2616005)(11346002)(476003)(5660300002)(50226002)(446003)(486006)(5024004)(336012)(436003)(54906003)(8936002)(76130400001)(316002)(305945005)(7736002)(23676004)(2486003)(36906005)(25786009)(3846002)(76176011)(110136005)(50466002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2402;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8aa1d5c2-c8ce-41c6-da6a-08d7675cb94f
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4L4V1nW02LywWohksim4KOqOSrQvCF//Hvy+oEeNNUKV+mFLTxo2YSdaPMsUhDWW7RfZwtWEvDayvIi2Ilov2kCeJRc2YVOv7Z1QfLzgqu3BCR3RC96tJS13JgZ54ZQtREfB63M/YcucPDJzbbfDKLAs+6uHWK6ZwN5XjmJlvo96LvafQBGtspphou3kW3pK9Qq1e3WeMqVMIvGoI8nKgF4XDHawWv9zJhTLLF8gdG42i79ZVeybtOQkcSdsuwEvMy4WF17aLp6D2E6O3gDvHKemURoym7P5AkOXzn2yQ0B5j/kmh+lgitZaeR4bMT1U5VAvrhl06bqZMe7tn1ARVWPDM3M5BdmfdFrcgA7eAu7rdN0V+LIlcLU+XQRI29021faUVta3+N5cx3f99YzfpZBx/JfOpy1e6TsloNsUbCobkBUL6D02sdkpIyAa4os/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 10:40:34.0407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17d7899-1e41-4200-cab4-08d7675cbf57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xvTegslMD5L2ZURhngFfxlrPcslIxpmCTDULZVxcYM=;
 b=ryJcvghUMnexM7ge7eE8VundpyqFzbWEbOk9bopnKiSpStzppcSqhMFC82RU5tTWDJkNeXTndiYw59OOvpAEnarwQ3dqoqET/EatuoTlLfyFwIm8bS1vJ06i68MfhFL6uc3w64x3wtlrClnrZKINUhQ7ynir1Bk+tar+9Jnv0pY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xvTegslMD5L2ZURhngFfxlrPcslIxpmCTDULZVxcYM=;
 b=ryJcvghUMnexM7ge7eE8VundpyqFzbWEbOk9bopnKiSpStzppcSqhMFC82RU5tTWDJkNeXTndiYw59OOvpAEnarwQ3dqoqET/EatuoTlLfyFwIm8bS1vJ06i68MfhFL6uc3w64x3wtlrClnrZKINUhQ7ynir1Bk+tar+9Jnv0pY=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkg
Zm9yIGRyaXZlciB0bw0KY29udmVydCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3Mg
Y29tcGxlbWVudCB0aGF0IHN1cHBvcnRlZCBieQ0KaGFyZHdhcmUuDQoNClY0OiBBZGRyZXNzIE1p
aGFpLCBEYW5pZWwgYW5kIElsaWEncyByZXZpZXcgY29tbWVudHMuDQpWNTogSW5jbHVkZXMgdGhl
IHNpZ24gYml0IGluIHRoZSB2YWx1ZSBvZiBtIChRbS5uKS4NClY2OiBBbGxvd3MgbSA9IDAgYWNj
b3JkaW5nIHRvIE1paGFpbCdzIGNvbW1lbnRzLg0KVjc6IEFkZHJlc3MgTWloYWlsJ3MgY29tbWVu
dHMuDQpWODogVXNlIHR5cGUgJ3UzMicgdG8gcmVwbGFjZSAndWludDMyX3QnDQp2OTogUmViYXNl
DQoNClNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4NClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292
IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+DQpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3Jf
bWdtdC5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL2Ry
bS9kcm1fY29sb3JfbWdtdC5oICAgICB8ICAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMNCmluZGV4IDRjZTVjNmQ4ZGU5OS4u
OWRlMTBhYmM3YTk2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jDQpAQCAtMTMyLDkgKzEz
Miw0NCBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1
dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikNCiB9DQogRVhQT1JUX1NZTUJPTChkcm1fY29sb3Jf
bHV0X2V4dHJhY3QpOw0KDQorLyoqDQorICogZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbg0K
KyAqDQorICogQHVzZXJfaW5wdXQ6IGlucHV0IHZhbHVlDQorICogQG06IG51bWJlciBvZiBpbnRl
Z2VyIGJpdHMsIG9ubHkgc3VwcG9ydCBtIDw9IDMyLCBpbmNsdWRlIHRoZSBzaWduLWJpdA0KKyAq
IEBuOiBudW1iZXIgb2YgZnJhY3Rpb25hbCBiaXRzLCBvbmx5IHN1cHBvcnQgbiA8PSAzMg0KKyAq
DQorICogQ29udmVydCBhbmQgY2xhbXAgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gKHNp
Z25lZCAyJ3MgY29tcGxlbWVudCkuDQorICogVGhlIHNpZ24tYml0IEJJVChtK24tMSkgYW5kIGFi
b3ZlIGFyZSAwIGZvciBwb3NpdGl2ZSB2YWx1ZSBhbmQgMSBmb3IgbmVnYXRpdmUNCisgKiB0aGUg
cmFuZ2Ugb2YgdmFsdWUgaXMgWy0yXihtLTEpLCAyXihtLTEpIC0gMl4tbl0NCisgKg0KKyAqIEZv
ciBleGFtcGxlDQorICogQSBRMy4xMiBmb3JtYXQgbnVtYmVyOg0KKyAqIC0gcmVxdWlyZWQgYml0
OiAzICsgMTIgPSAxNWJpdHMNCisgKiAtIHJhbmdlOiBbLTJeMiwgMl4yIC0gMl7iiJIxNV0NCisg
Kg0KKyAqIE5PVEU6IHRoZSBtIGNhbiBiZSB6ZXJvIGlmIGFsbCBiaXRfcHJlY2lzaW9uIGFyZSB1
c2VkIHRvIHByZXNlbnQgZnJhY3Rpb25hbA0KKyAqICAgICAgIGJpdHMgbGlrZSBRMC4zMg0KKyAq
Lw0KK3U2NCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHU2NCB1c2VyX2lucHV0LCB1MzIg
bSwgdTMyIG4pDQorew0KKwl1NjQgbWFnID0gKHVzZXJfaW5wdXQgJiB+QklUX1VMTCg2MykpID4+
ICgzMiAtIG4pOw0KKwlib29sIG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMp
KTsNCisJczY0IHZhbDsNCisNCisJV0FSTl9PTihtID4gMzIgfHwgbiA+IDMyKTsNCisNCisJdmFs
ID0gY2xhbXBfdmFsKG1hZywgMCwgbmVnYXRpdmUgPw0KKwkJCQlCSVRfVUxMKG4gKyBtIC0gMSkg
OiBCSVRfVUxMKG4gKyBtIC0gMSkgLSAxKTsNCisNCisJcmV0dXJuIG5lZ2F0aXZlID8gLXZhbCA6
IHZhbDsNCit9DQorRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsN
CisNCiAvKioNCiAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBt
YW5hZ2VtZW50IHByb3BlcnRpZXMNCiAgKiBAY3J0YzogRFJNIENSVEMNCisgKg0KICAqIEBkZWdh
bW1hX2x1dF9zaXplOiB0aGUgc2l6ZSBvZiB0aGUgZGVnYW1tYSBsdXQgKGJlZm9yZSBDU0MpDQog
ICogQGhhc19jdG06IHdoZXRoZXIgdG8gYXR0YWNoIGN0bV9wcm9wZXJ0eSBmb3IgQ1NDIG1hdHJp
eA0KICAqIEBnYW1tYV9sdXRfc2l6ZTogdGhlIHNpemUgb2YgdGhlIGdhbW1hIGx1dCAoYWZ0ZXIg
Q1NDKQ0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRl
L2RybS9kcm1fY29sb3JfbWdtdC5oDQppbmRleCBkMWM2NjJkOTJhYjcuLjk5N2E0MmFiMjlmNSAx
MDA2NDQNCi0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgNCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9jb2xvcl9tZ210LmgNCkBAIC0zMCw2ICszMCw3IEBAIHN0cnVjdCBkcm1fY3J0YzsN
CiBzdHJ1Y3QgZHJtX3BsYW5lOw0KDQogdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVp
bnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24pOw0KK3U2NCBkcm1fY29s
b3JfY3RtX3MzMV8zMl90b19xbV9uKHU2NCB1c2VyX2lucHV0LCB1MzIgbSwgdTMyIG4pOw0KDQog
dm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQog
CQkJCXVpbnQgZGVnYW1tYV9sdXRfc2l6ZSwNCi0tDQoyLjIwLjENCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
