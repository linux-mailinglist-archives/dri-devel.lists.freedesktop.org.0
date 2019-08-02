Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C17F1EA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E476ED92;
	Fri,  2 Aug 2019 09:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30042.outbound.protection.outlook.com [40.107.3.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142246ED92
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:43:32 +0000 (UTC)
Received: from VI1PR0802CA0019.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::29) by AM5PR0802MB2596.eurprd08.prod.outlook.com
 (2603:10a6:203:98::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Fri, 2 Aug
 2019 09:43:28 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR0802CA0019.outlook.office365.com
 (2603:10a6:800:aa::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.15 via Frontend
 Transport; Fri, 2 Aug 2019 09:43:28 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 2 Aug 2019 09:43:26 +0000
Received: ("Tessian outbound cc8a947d4660:v26");
 Fri, 02 Aug 2019 09:43:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d3f901cf4190d08f
X-CR-MTA-TID: 64aa7808
Received: from 9eb9efb7f3be.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1829F428-FC2D-4444-92A1-277576AFEA34.1; 
 Fri, 02 Aug 2019 09:43:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9eb9efb7f3be.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2019 09:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr8LYsL3o1rHOXQYKfMekFWabsz2VNwp6FNGV2Ig4xRKRXeHiumoOCEo+fqf9uddeMa5Hdv58ywxWXb6/Dnojz19CtiLEE3qD7nVzWPKlxusYZ2wG1uAzz1Tz236OnVYKHRyRHYWkKNn6dpEkMNr1I6753waFYw5ZzvvDSSbTmf4ETZ/VX5Sgk//d8VaHHD1Imav8+yfoE6gXVPMBZDvCrClWppOb4KaqGyN18agKpYU75NC25kI5xj4RdYzbljl7sZFblTekm6IOtKF8VCGR7chhPXzB0S+Jb1BK3LWxm/18NpcebJexeNW5lgIRodAsxJ8LII0Qtv/609wtZYN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC3jbMbQ63MLQHJ9M4BjOtJXh3cP2Zhrf529IOH33DA=;
 b=iZu50nqrIW1VrYNRmv6ohA/7ID5MoQqVDoidAT11er8KNr6DnWH4jd6/FOpt6MzZOvWlX0H2/Kr6LDAfN8S+a/l4iEz597bnpzF+p7eDt1X7O6c8+F6W83ZI1Izpi/JFZoeil1Z3H3E+btKHROwW9f1xKQykANe4qkj1G/8SWrN7V5aGkvxFEKlu5lz7zA88h91o32Dl/EwNUQRI/cvdgjuqat6nROsB9dgRUxZ8uHpfldvNk3WGebsMovrEvYFQT70syv4ixtgXon2oHHm7dRSDwbQzc8ycy+JAVw9nwefhMJs4o7pJpkpCuyO6oMwPzWz/OLjAWBGhr4qNbpAIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3551.eurprd08.prod.outlook.com (20.177.61.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 2 Aug 2019 09:43:10 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 09:43:10 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Adds error event print functionality
Thread-Topic: [PATCH] drm/komeda: Adds error event print functionality
Thread-Index: AQHVSRayAboXOjuz1kKxLGlCvtrW0Q==
Date: Fri, 2 Aug 2019 09:43:10 +0000
Message-ID: <1564738954-6101-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7a788a7a-238f-47d7-0c10-08d7172dde70
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3551; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3551:|AM5PR0802MB2596:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25961BDB352E1655ADE68B509FD90@AM5PR0802MB2596.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 011787B9DD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(189003)(199004)(6506007)(386003)(110136005)(54906003)(7736002)(6512007)(6436002)(3846002)(6116002)(2906002)(476003)(2201001)(6636002)(478600001)(53936002)(99286004)(305945005)(86362001)(36756003)(68736007)(81156014)(66556008)(52116002)(5660300002)(256004)(66066001)(64756008)(66476007)(71190400001)(55236004)(2501003)(26005)(66446008)(81166006)(2616005)(71200400001)(8936002)(102836004)(186003)(486006)(8676002)(66946007)(4326008)(316002)(14454004)(50226002)(25786009)(6486002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3551;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: WvC8Qx3KUb8OXLDJwp7ISuNNvzSa17XYNrR7e/UFTLzm4rK+TWVo1mhrMXPPPREShLpEp9L6zrdP88tpV0YgrbT9B7brqkckGaA7FKXabfHcVc32FV6UUK4UYMg3vK7ibtJlcm5X2zelgtdGss43M2CmzGKedAbN8pPbq0OL0HwD3+86fCO0Lqe6MWqlT0vIwE21YIKgYOBlT6a72L1gP2RlHwEApBY5SQjyQAnYNHVHiBc7yGjQGnYn68/e912sPGRNM+pOSWqm8XUrymf9Y+vAio2ENBt1djgpB2j63Up9R6OVTh7ERTElNxsMLmZrUnWdFb8rXY0MGlLmS91Wesu/03ICfLd1YH9K6g8+6izOfaM4REb2iGvbAv5EchjCb/WM0DdOcimEaA2FF1Mc+KJANP5y94dHZitDzuhg9tY=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3551
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(199004)(189003)(2201001)(6636002)(36756003)(22756006)(478600001)(7736002)(386003)(25786009)(14454004)(14444005)(3846002)(6116002)(356004)(81166006)(26005)(8746002)(102836004)(8936002)(26826003)(336012)(2501003)(66066001)(99286004)(4326008)(50226002)(186003)(47776003)(8676002)(110136005)(2616005)(36906005)(63350400001)(6506007)(2906002)(63370400001)(126002)(23756003)(305945005)(81156014)(486006)(54906003)(476003)(6512007)(86362001)(5660300002)(50466002)(316002)(70586007)(6486002)(70206006)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2596;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 13fb864a-7427-4f8d-6899-08d7172dd4b6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0802MB2596; 
NoDisclaimer: True
X-Forefront-PRVS: 011787B9DD
X-Microsoft-Antispam-Message-Info: j0OYrqmimaVMlittUmrQa3dEPMIzVP6qXSgRS6ida0w7Gl8V1YqXz7lTQpKz1k6q3XADoUkuXOr+fFNUx8BUYdQCiqxs2IGIaLZIEKmrNTbUQE8qBZudtOrX+a4fChI0twJTTvANZGW22YCUzgyU8J/FU3J43t3oQLGBnYx2s6AnQ6g23C+707r+cznXkI7MuOdwhcezSagfSIXWNjXaW2VOgtmq3XKOxucfo3qtYFWiyT5n0TLwrDtxCQ2EHrxCkWGdW1G4nnzw2gMeNggCTJRb8WMLTmgD3KlwlZv1/83gJfg9dvbi9u+r2AwXriA5OsNsfBhRMhzi+2xanfZVauxQjeLDc8tmKe04AVcygrw3b2F82C7xQge0Sc8ND/hKC38nR2ykf9e1vc3uUv6kF65RoHSYNLpnz6tzZ2dF4cw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 09:43:26.7485 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a788a7a-238f-47d7-0c10-08d7172dde70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2596
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC3jbMbQ63MLQHJ9M4BjOtJXh3cP2Zhrf529IOH33DA=;
 b=znfkw8G+oLa7ha582+IX+kJunrfpyThkxrr/z0nJDSH5ehRM+j/zCNAcS1sztSyZ6dAkt0t0bA1a22v7B9bfLZGVgkmCzTA7Z0GgXQN1sCB+R4Uqycv60PPqKRaNuaGuMFsoOuOreWDw8upNxAuzf+PS2ptexLJQtj0aZC8JseU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC3jbMbQ63MLQHJ9M4BjOtJXh3cP2Zhrf529IOH33DA=;
 b=znfkw8G+oLa7ha582+IX+kJunrfpyThkxrr/z0nJDSH5ehRM+j/zCNAcS1sztSyZ6dAkt0t0bA1a22v7B9bfLZGVgkmCzTA7Z0GgXQN1sCB+R4Uqycv60PPqKRaNuaGuMFsoOuOreWDw8upNxAuzf+PS2ptexLJQtj0aZC8JseU=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyB0byBwcmludCB0aGUgZXZlbnQgbWVzc2FnZSB3aGVuIGVycm9yIGhhcHBlbnMgYW5k
IHRoZSBzYW1lIGV2ZW50CndpbGwgbm90IGJlIHByaW50ZWQgdW50aWwgbmV4dCB2c3luYy4KCkNo
YW5nZXMgc2luY2UgdjI6CjEuIFJlZmluZSBrb21lZGFfc3ByaW50ZigpOwoyLiBOb3QgdXNpbmcg
U1RSX1NaIG1hY3JvIGZvciB0aGUgc3RyaW5nIHNpemUgaW4ga29tZWRhX3ByaW50X2V2ZW50cygp
LgoKQ2hhbmdlcyBzaW5jZSB2MToKMS4gSGFuZGxpbmcgdGhlIGV2ZW50IHByaW50IGJ5IENPTkZJ
R19LT01FREFfRVJST1JfUFJJTlQ7CjIuIENoYW5naW5nIHRoZSBtYXggc3RyaW5nIHNpemUgdG8g
MjU2LgoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93
cnkubGlAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvS2NvbmZpZyAg
ICAgICAgICAgICAgIHwgICA2ICsKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
TWFrZWZpbGUgICAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmggICB8ICAxNSArKysKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2V2ZW50LmMgfCAxNDAgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgICB8ICAgNCArCiA1IGZp
bGVzIGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L0tjb25maWcKaW5kZXggY2VjMDYzOS4uZTg3ZmY4NiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L0tjb25maWcKQEAgLTEyLDMgKzEyLDkgQEAgY29uZmlnIERSTV9LT01FREEKIAkg
IFByb2Nlc3NvciBkcml2ZXIuIEl0IHN1cHBvcnRzIHRoZSBENzEgdmFyaWFudHMgb2YgdGhlIGhh
cmR3YXJlLgogCiAJICBJZiBjb21waWxlZCBhcyBhIG1vZHVsZSBpdCB3aWxsIGJlIGNhbGxlZCBr
b21lZGEuCisKK2NvbmZpZyBEUk1fS09NRURBX0VSUk9SX1BSSU5UCisJYm9vbCAiRW5hYmxlIGtv
bWVkYSBlcnJvciBwcmludCIKKwlkZXBlbmRzIG9uIERSTV9LT01FREEKKwloZWxwCisJICBDaG9v
c2UgdGhpcyBvcHRpb24gdG8gZW5hYmxlIGVycm9yIHByaW50aW5nLgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUKaW5kZXggNWMzOTAwYy4uZjA5NWExYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCkBAIC0yMiw0ICsy
Miw2IEBAIGtvbWVkYS15ICs9IFwKIAlkNzEvZDcxX2Rldi5vIFwKIAlkNzEvZDcxX2NvbXBvbmVu
dC5vCiAKK2tvbWVkYS0kKENPTkZJR19EUk1fS09NRURBX0VSUk9SX1BSSU5UKSArPSBrb21lZGFf
ZXZlbnQubworCiBvYmotJChDT05GSUdfRFJNX0tPTUVEQSkgKz0ga29tZWRhLm8KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKaW5kZXggZDFjODZi
Ni4uZTI4ZTdlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZGV2LmgKQEAgLTQwLDYgKzQwLDE3IEBACiAjZGVmaW5lIEtPTUVEQV9FUlJfVFRORwkJ
CUJJVF9VTEwoMzApCiAjZGVmaW5lIEtPTUVEQV9FUlJfVFRGCQkJQklUX1VMTCgzMSkKIAorI2Rl
ZmluZSBLT01FREFfRVJSX0VWRU5UUwlcCisJKEtPTUVEQV9FVkVOVF9VUlVOCXwgS09NRURBX0VW
RU5UX0lCU1kJfCBLT01FREFfRVZFTlRfT1ZSIHxcCisJS09NRURBX0VSUl9URVRPCQl8IEtPTUVE
QV9FUlJfVEVNUgl8IEtPTUVEQV9FUlJfVElUUiB8XAorCUtPTUVEQV9FUlJfQ1BFCQl8IEtPTUVE
QV9FUlJfQ0ZHRQl8IEtPTUVEQV9FUlJfQVhJRSB8XAorCUtPTUVEQV9FUlJfQUNFMAkJfCBLT01F
REFfRVJSX0FDRTEJfCBLT01FREFfRVJSX0FDRTIgfFwKKwlLT01FREFfRVJSX0FDRTMJCXwgS09N
RURBX0VSUl9EUklGVFRPCXwgS09NRURBX0VSUl9GUkFNRVRPIHxcCisJS09NRURBX0VSUl9aTUUJ
CXwgS09NRURBX0VSUl9NRVJSCXwgS09NRURBX0VSUl9UQ0YgfFwKKwlLT01FREFfRVJSX1RUTkcJ
CXwgS09NRURBX0VSUl9UVEYpCisKKyNkZWZpbmUgS09NRURBX1dBUk5fRVZFTlRTCUtPTUVEQV9F
UlJfQ1NDRQorCiAvKiBtYWxpZHAgZGV2aWNlIGlkICovCiBlbnVtIHsKIAlNQUxJX0Q3MSA9IDAs
CkBAIC0yMDcsNCArMjE4LDggQEAgc3RydWN0IGtvbWVkYV9kZXYgewogCiBzdHJ1Y3Qga29tZWRh
X2RldiAqZGV2X3RvX21kZXYoc3RydWN0IGRldmljZSAqZGV2KTsKIAorI2lmZGVmIENPTkZJR19E
Uk1fS09NRURBX0VSUk9SX1BSSU5UCit2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtv
bWVkYV9ldmVudHMgKmV2dHMpOworI2VuZGlmCisKICNlbmRpZiAvKl9LT01FREFfREVWX0hfKi8K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2
ZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5j
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmEzNmZiODYKLS0tIC9kZXYvbnVs
bAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5j
CkBAIC0wLDAgKzEsMTQwIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAor
LyoKKyAqIChDKSBDT1BZUklHSFQgMjAxOSBBUk0gTGltaXRlZC4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KKyAqIEF1dGhvcjogSmFtZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
KyAqCisgKi8KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CisKKyNpbmNsdWRlICJrb21lZGFf
ZGV2LmgiCisKK3N0cnVjdCBrb21lZGFfc3RyIHsKKwljaGFyICpzdHI7CisJdTMyIHN6OworCXUz
MiBsZW47Cit9OworCisvKiByZXR1cm4gMCBvbiBzdWNjZXNzLCAgPCAwIG9uIG5vIHNwYWNlLgor
ICovCitzdGF0aWMgaW50IGtvbWVkYV9zcHJpbnRmKHN0cnVjdCBrb21lZGFfc3RyICpzdHIsIGNv
bnN0IGNoYXIgKmZtdCwgLi4uKQoreworCXZhX2xpc3QgYXJnczsKKwlpbnQgbnVtLCBmcmVlX3N6
OworCWludCBlcnI7CisKKwlmcmVlX3N6ID0gc3RyLT5zeiAtIHN0ci0+bGVuIC0gMTsKKwlpZiAo
ZnJlZV9zeiA8PSAwKQorCQlyZXR1cm4gLUVOT1NQQzsKKworCXZhX3N0YXJ0KGFyZ3MsIGZtdCk7
CisKKwludW0gPSB2c25wcmludGYoc3RyLT5zdHIgKyBzdHItPmxlbiwgZnJlZV9zeiwgZm10LCBh
cmdzKTsKKworCXZhX2VuZChhcmdzKTsKKworCWlmIChudW0gPCBmcmVlX3N6KSB7CisJCXN0ci0+
bGVuICs9IG51bTsKKwkJZXJyID0gMDsKKwl9IGVsc2UgeworCQlzdHItPmxlbiA9IHN0ci0+c3og
LSAxOworCQllcnIgPSAtRU5PU1BDOworCX0KKworCXJldHVybiBlcnI7Cit9CisKK3N0YXRpYyB2
b2lkIGV2dF9zcHJpbnRmKHN0cnVjdCBrb21lZGFfc3RyICpzdHIsIHU2NCBldnQsIGNvbnN0IGNo
YXIgKm1zZykKK3sKKwlpZiAoZXZ0KQorCQlrb21lZGFfc3ByaW50ZihzdHIsIG1zZyk7Cit9CisK
K3N0YXRpYyB2b2lkIGV2dF9zdHIoc3RydWN0IGtvbWVkYV9zdHIgKnN0ciwgdTY0IGV2ZW50cykK
K3sKKwlpZiAoZXZlbnRzID09IDBVTEwpIHsKKwkJa29tZWRhX3NwcmludGYoc3RyLCAiTm9uZSIp
OworCQlyZXR1cm47CisJfQorCisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZF
TlRfVlNZTkMsICJWU1lOQ3wiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9F
VkVOVF9GTElQLCAiRkxJUHwiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9F
VkVOVF9FT1csICJFT1d8Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZF
TlRfTU9ERSwgIk9QLU1PREV8Iik7CisKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVE
QV9FVkVOVF9VUlVOLCAiVU5ERVJSVU58Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBL
T01FREFfRVZFTlRfT1ZSLCAiT1ZFUlJVTnwiKTsKKworCS8qIEdMQiBlcnJvciAqLworCWV2dF9z
cHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9NRVJSLCAiTUVSUnwiKTsKKwlldnRfc3By
aW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfRlJBTUVUTywgIkZSQU1FVE98Iik7CisKKwkv
KiBET1UgZXJyb3IgKi8KKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfRFJJ
RlRUTywgIkRSSUZUVE98Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJS
X0ZSQU1FVE8sICJGUkFNRVRPfCIpOworCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURB
X0VSUl9URVRPLCAiVEVUT3wiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9F
UlJfQ1NDRSwgIkNTQ0V8Iik7CisKKwkvKiBMUFUgZXJyb3JzIG9yIGV2ZW50cyAqLworCWV2dF9z
cHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VWRU5UX0lCU1ksICJJQlNZfCIpOworCWV2dF9z
cHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9BWElFLCAiQVhJRXwiKTsKKwlldnRfc3By
aW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQUNFMCwgIkFDRTB8Iik7CisJZXZ0X3Nwcmlu
dGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0FDRTEsICJBQ0UxfCIpOworCWV2dF9zcHJpbnRm
KHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9BQ0UyLCAiQUNFMnwiKTsKKwlldnRfc3ByaW50Zihz
dHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQUNFMywgIkFDRTN8Iik7CisKKwkvKiBMUFUgVEJVIGVy
cm9ycyovCisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RDRiwgIlRDRnwi
KTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVFRORywgIlRUTkd8Iik7
CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RJVFIsICJUSVRSfCIpOwor
CWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9URU1SLCAiVEVNUnwiKTsKKwll
dnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVFRGLCAiVFRGfCIpOworCisJLyog
Q1UgZXJyb3JzKi8KKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ1BFLCAi
Q09QUk9DfCIpOworCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9aTUUsICJa
TUV8Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0NGR0UsICJDRkdF
fCIpOworCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9URU1SLCAiVEVNUnwi
KTsKKworCWlmIChzdHItPmxlbiA+IDAgJiYgKHN0ci0+c3RyW3N0ci0+bGVuIC0gMV0gPT0gJ3wn
KSkgeworCQlzdHItPnN0cltzdHItPmxlbiAtIDFdID0gMDsKKwkJc3RyLT5sZW4tLTsKKwl9Cit9
CisKK3N0YXRpYyBib29sIGlzX25ld19mcmFtZShzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqYSkKK3sK
KwlyZXR1cm4gKGEtPnBpcGVzWzBdIHwgYS0+cGlwZXNbMV0pICYKKwkgICAgICAgKEtPTUVEQV9F
VkVOVF9GTElQIHwgS09NRURBX0VWRU5UX0VPVyk7Cit9CisKK3ZvaWQga29tZWRhX3ByaW50X2V2
ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cykKK3sKKwl1NjQgcHJpbnRfZXZ0cyA9IEtP
TUVEQV9FUlJfRVZFTlRTOworCXN0YXRpYyBib29sIGVuX3ByaW50ID0gdHJ1ZTsKKworCS8qIHJl
ZHVjZSB0aGUgc2FtZSBtc2cgcHJpbnQsIG9ubHkgcHJpbnQgdGhlIGZpcnN0IGV2dCBmb3Igb25l
IGZyYW1lICovCisJaWYgKGV2dHMtPmdsb2JhbCB8fCBpc19uZXdfZnJhbWUoZXZ0cykpCisJCWVu
X3ByaW50ID0gdHJ1ZTsKKwlpZiAoIWVuX3ByaW50KQorCQlyZXR1cm47CisKKwlpZiAoKGV2dHMt
Pmdsb2JhbCB8IGV2dHMtPnBpcGVzWzBdIHwgZXZ0cy0+cGlwZXNbMV0pICYgcHJpbnRfZXZ0cykg
eworCQljaGFyIG1zZ1syNTZdOworCQlzdHJ1Y3Qga29tZWRhX3N0ciBzdHI7CisKKwkJc3RyLnN0
ciA9IG1zZzsKKwkJc3RyLnN6ICA9IHNpemVvZihtc2cpOworCQlzdHIubGVuID0gMDsKKworCQlr
b21lZGFfc3ByaW50Zigmc3RyLCAiZ2N1OiAiKTsKKwkJZXZ0X3N0cigmc3RyLCBldnRzLT5nbG9i
YWwpOworCQlrb21lZGFfc3ByaW50Zigmc3RyLCAiLCBwaXBlc1swXTogIik7CisJCWV2dF9zdHIo
JnN0ciwgZXZ0cy0+cGlwZXNbMF0pOworCQlrb21lZGFfc3ByaW50Zigmc3RyLCAiLCBwaXBlc1sx
XTogIik7CisJCWV2dF9zdHIoJnN0ciwgZXZ0cy0+cGlwZXNbMV0pOworCisJCURSTV9FUlJPUigi
ZXJyIGRldGVjdDogJXNcbiIsIG1zZyk7CisKKwkJZW5fcHJpbnQgPSBmYWxzZTsKKwl9Cit9CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCmluZGV4
IDQxOWE4YjAuLjBmYWZjMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5jCkBAIC00Nyw2ICs0NywxMCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qg
a29tZWRhX2ttc19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogCW1lbXNldCgmZXZ0
cywgMCwgc2l6ZW9mKGV2dHMpKTsKIAlzdGF0dXMgPSBtZGV2LT5mdW5jcy0+aXJxX2hhbmRsZXIo
bWRldiwgJmV2dHMpOwogCisjaWZkZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQKKwlr
b21lZGFfcHJpbnRfZXZlbnRzKCZldnRzKTsKKyNlbmRpZgorCiAJLyogTm90aWZ5IHRoZSBjcnRj
IHRvIGhhbmRsZSB0aGUgZXZlbnRzICovCiAJZm9yIChpID0gMDsgaSA8IGttcy0+bl9jcnRjczsg
aSsrKQogCQlrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoJmttcy0+Y3J0Y3NbaV0sICZldnRzKTsK
LS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
