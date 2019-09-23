Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D353BAC7A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 03:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3F589A77;
	Mon, 23 Sep 2019 01:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC8E89A77
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 01:59:43 +0000 (UTC)
Received: from AM6PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:20b:c0::35)
 by HE1PR0801MB2042.eurprd08.prod.outlook.com (2603:10a6:3:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Mon, 23 Sep
 2019 01:59:34 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by AM6PR08CA0047.outlook.office365.com
 (2603:10a6:20b:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 01:59:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 01:59:32 +0000
Received: ("Tessian outbound 55d20e99e8e2:v31");
 Mon, 23 Sep 2019 01:59:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f48b24df6bd95348
X-CR-MTA-TID: 64aa7808
Received: from fbaa96855148.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5BEA2ED-2FCA-4280-B996-33DE8C72E4BC.1; 
 Mon, 23 Sep 2019 01:59:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fbaa96855148.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 01:59:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqekGOIxE3lB01y+m7TftbSui79huAbPo9zzUAyKUldHrPOx23DM3M1uciNGIonDEIeqqbW8TAWQOyrEjvtzRbKxEmjkCPiE4x7Rdsm+8ugbSnAKSgfLuUatSBF9otAmxrTyQSNp8bHk4tHC4Xl/dTs8KFtkvGZ1qHGn56/Po3j5piscPdZb4h+5l7b0WEIax5Yq496iHGwLT8leleDdfzxKtdubNKZ5fqHlZYFFBHSu47TPntinOfzvIi/tNQSDY+acpGZLZOmEUcMxVo7Cu/+pKzHWxoExTFT+efp+IbsM6FYIb7FokCHVh3Sxzv+MxtaWPse+oTATgoF/raBQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkVpM/4SufNqFKctYlV5jXe82yzzwSsY+7peY6Zd000=;
 b=UjXG6808v8n3JVqr0n/xQlmytx6UxuW0reI/+wtBEfK78ZdYflsztgy3+o4NS5Upk2DZOf7d6bQOBog9p61x2J56GfmESAYuD7mC1MBMwBwgdWNz7psntTrdwj0ISn7uLvfvKTo9oMk5ltJhegJbnOupcQSyV34LWykaBErC907OBiANDdzBXw1waYUj4BWOyZDDghfhDjRS5IjJf1woKWIi58mMGMoPiKwcigvQXcaYiGq+48F+//Td2h4Vt04bIVy63hVnIz7Zc3Xsyg+nQsFZKfLSMZ+3YUAJn5eLUfhvjRi+5uki+d3A3f9aeN9wbL+XToCWLh0RxFJfQLx7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB2783.eurprd08.prod.outlook.com (10.170.236.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 01:59:25 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 01:59:25 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Adds power management support
Thread-Topic: [PATCH] drm/komeda: Adds power management support
Thread-Index: AQHVcbKG61D12b8o90a0WJVQdsEzVw==
Date: Mon, 23 Sep 2019 01:59:25 +0000
Message-ID: <20190923015908.26627-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::22) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 94c5abe1-0b33-4b6d-3b54-08d73fc9ad79
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2783; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB2783:|VI1PR08MB2783:|HE1PR0801MB2042:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB2042E001229564F7E0C0CC989F850@HE1PR0801MB2042.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(189003)(199004)(86362001)(36756003)(476003)(6512007)(6306002)(99286004)(6486002)(486006)(25786009)(2616005)(256004)(14444005)(52116002)(305945005)(6636002)(71200400001)(186003)(8676002)(81166006)(7736002)(81156014)(386003)(6506007)(8936002)(26005)(102836004)(71190400001)(6436002)(4326008)(2201001)(55236004)(50226002)(6116002)(2501003)(5660300002)(3846002)(66066001)(66946007)(110136005)(478600001)(966005)(66476007)(66556008)(64756008)(66446008)(54906003)(2906002)(14454004)(1076003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2783;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: m1JXKMmxNHoi3TrcTC6PDgU7RZuOx2Z5rlJLsIpbWKkMTdEHbl/xQWYUiR4P7fwWuEnXVL1+6TlKlG7NRA9sUrINGGAyqAYrbhp+08JsEZ+fGIPRwIb7fB/hNxuo5uERl5LIjk81mIkGlnHU76I1yvBz8iW4UYcVx+eXTrWAFc5s+h0+zwylXksOABvGWFTVOSTU3L+i9DlRF5z8Vv1jEdxjoOfC2paZ94uOFnTlcUJ+mzC3Bu2KAvXHEuKPyxzCBV0HC5OeZleYPUkWh7J4+Y7LmSH1umR9ukthaIw3DQMcvBmtnhyyaKRd/QT3jErcYRPbMr0nDMbu0RrGoHaAEBt/4W48JS4TVSDkXt8/FLXwR+Hc0BxraAtXQiAiFt5ra1o54M3OEZ4gZvT6mYZ+wTF+X2JVxNdcRfJjyc2CyWI=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2783
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(26826003)(356004)(8676002)(2501003)(6306002)(86362001)(14454004)(6486002)(36756003)(486006)(4326008)(102836004)(8746002)(3846002)(81156014)(66066001)(47776003)(99286004)(966005)(26005)(8936002)(6636002)(50226002)(2201001)(22756006)(7736002)(386003)(316002)(186003)(76130400001)(54906003)(305945005)(6116002)(81166006)(14444005)(2906002)(50466002)(36906005)(25786009)(6506007)(1076003)(70586007)(63350400001)(6512007)(478600001)(5660300002)(476003)(2616005)(70206006)(126002)(23756003)(336012)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB2042;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7659b1cb-acf3-4bcb-1c7c-08d73fc9a8d5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:HE1PR0801MB2042; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: Uv0+BkTaQsAQjsXa8iEAV0mqigssx6QgNbbcjXS1VwjRgatGm1froziH9fJJnMfskKzFWmMg4VbaP5fiDHTF+kZGimqcLI8xHrr6ZQDV4m0vb9vTfdFT5S2vmLLawE2t41njCqilzetzm434qTpdXy8UXVVh2qqNiaFcXcSLlIo81ZtbE4OtatYsx3l18P/bmjHSlQwWRnMqLx3y525nPK3NcN/FZlzX5uDtvujGmBgeZQDjHicSR8NnOHhSEmmS4AdE2+qEV7qEoZK6Bgq8VqiabtBbZahWT12H5akgwaq7tA8GXN2vUT5VI84N0vSrBxWA1hJ56Wi1uFaR+enzVAVhyumpnIl06gntZfyMDisbynGyLf8h3aAi+ujs+T3G/exnA1y7K6GF3EGywDojEf4B6lBrUvkOXRIarjK8HAI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 01:59:32.7043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c5abe1-0b33-4b6d-3b54-08d73fc9ad79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2042
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkVpM/4SufNqFKctYlV5jXe82yzzwSsY+7peY6Zd000=;
 b=qQlP2UCn6BwkGQQJUJtBvC3fqVLGz6G6nI8ufVQz0tDErLBD3/M2R49/qtCC351/XnuppR4H8PWDr2N6a8xAt/zuJ0aYjv+2M0UBxkLGOOtl6Ge3hia0vVaJL4R6jJ5y6ePvV5e1cvGCDIV+nmPxXGDctn5RxmczQkBTKGw74uE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkVpM/4SufNqFKctYlV5jXe82yzzwSsY+7peY6Zd000=;
 b=qQlP2UCn6BwkGQQJUJtBvC3fqVLGz6G6nI8ufVQz0tDErLBD3/M2R49/qtCC351/XnuppR4H8PWDr2N6a8xAt/zuJ0aYjv+2M0UBxkLGOOtl6Ge3hia0vVaJL4R6jJ5y6ePvV5e1cvGCDIV+nmPxXGDctn5RxmczQkBTKGw74uE=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBzeXN0ZW0gcG93ZXIgbWFuYWdlbWVudCBzdXBwb3J0IGluIEtNUyBrZXJuZWwgZHJp
dmVyLgoKRGVwZW5kcyBvbjoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy82MjM3Ny8KCkNoYW5nZXMgc2luY2UgdjE6ClNpbmNlIHdlIGhhdmUgdW5pZmllZCBtY2xrL3Bj
bGsvcGlwZWxpbmUtPmFjbGsgdG8gb25lIG1jbGssIHdoaWNoIHdpbGwKYmUgdHVybmVkIG9uL29m
ZiB3aGVuIGNydGMgYXRvbWljIGVuYWJsZS9kaXNhYmxlLCByZW1vdmVkIHJ1bnRpbWUgcG93ZXIK
bWFuYWdlbWVudC4KUmVtb3ZlcyBydW4gdGltZSBnZXQvcHV0IHJlbGF0ZWQgZmxvdy4KQWRkcyB0
byBkaXNhYmxlIHRoZSBhY2xrIHdoZW4gcmVnaXN0ZXIgYWNjZXNzIGZpbmlzaGVkLgoKQ2hhbmdl
cyBzaW5jZSB2MjoKUmViYXNlcyB0byB0aGUgZHJtLW1pc2MtbmV4dCBicmFuY2guCgpTaWduZWQt
b2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29t
PgotLS0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICAx
IC0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8IDY1ICsr
KysrKysrKysrKysrKysrLS0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmggICB8ICAzICsKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2
LmMgICB8IDMwICsrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NydGMuYwppbmRleCAzOGQ1Y2IyMGU5MDguLmI0N2MwZGFiZDBkMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtNSw3
ICs1LDYgQEAKICAqCiAgKi8KICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KLSNpbmNsdWRlIDxsaW51
eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KIAogI2luY2x1ZGUg
PGRybS9kcm1fYXRvbWljLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rldi5jCmluZGV4IGJlZTQ2MzNjZGQ5Zi4uOGEwMzMyNGYwMmE1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwpAQCAtMjU4
LDcgKzI1OCw3IEBAIHN0cnVjdCBrb21lZGFfZGV2ICprb21lZGFfZGV2X2NyZWF0ZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiAJCQkgIHByb2R1Y3QtPnByb2R1Y3RfaWQsCiAJCQkgIE1BTElEUF9DT1JF
X0lEX1BST0RVQ1RfSUQobWRldi0+Y2hpcC5jb3JlX2lkKSk7CiAJCWVyciA9IC1FTk9ERVY7Ci0J
CWdvdG8gZXJyX2NsZWFudXA7CisJCWdvdG8gZGlzYWJsZV9jbGs7CiAJfQogCiAJRFJNX0lORk8o
IkZvdW5kIEFSTSBNYWxpLUQleCB2ZXJzaW9uIHIlZHAlZFxuIiwKQEAgLTI3MSwxOSArMjcxLDE5
IEBAIHN0cnVjdCBrb21lZGFfZGV2ICprb21lZGFfZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCiAJZXJyID0gbWRldi0+ZnVuY3MtPmVudW1fcmVzb3VyY2VzKG1kZXYpOwogCWlmIChlcnIp
IHsKIAkJRFJNX0VSUk9SKCJlbnVtZXJhdGUgZGlzcGxheSByZXNvdXJjZSBmYWlsZWQuXG4iKTsK
LQkJZ290byBlcnJfY2xlYW51cDsKKwkJZ290byBkaXNhYmxlX2NsazsKIAl9CiAKIAllcnIgPSBr
b21lZGFfcGFyc2VfZHQoZGV2LCBtZGV2KTsKIAlpZiAoZXJyKSB7CiAJCURSTV9FUlJPUigicGFy
c2UgZGV2aWNlIHRyZWUgZmFpbGVkLlxuIik7Ci0JCWdvdG8gZXJyX2NsZWFudXA7CisJCWdvdG8g
ZGlzYWJsZV9jbGs7CiAJfQogCiAJZXJyID0ga29tZWRhX2Fzc2VtYmxlX3BpcGVsaW5lcyhtZGV2
KTsKIAlpZiAoZXJyKSB7CiAJCURSTV9FUlJPUigiYXNzZW1ibGUgZGlzcGxheSBwaXBlbGluZXMg
ZmFpbGVkLlxuIik7Ci0JCWdvdG8gZXJyX2NsZWFudXA7CisJCWdvdG8gZGlzYWJsZV9jbGs7CiAJ
fQogCiAJZGV2LT5kbWFfcGFybXMgPSAmbWRldi0+ZG1hX3Bhcm1zOwpAQCAtMjk2LDExICsyOTYs
MTQgQEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVkYV9kZXZfY3JlYXRlKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAlpZiAobWRldi0+aW9tbXUgJiYgbWRldi0+ZnVuY3MtPmNvbm5lY3RfaW9tbXUpIHsK
IAkJZXJyID0gbWRldi0+ZnVuY3MtPmNvbm5lY3RfaW9tbXUobWRldik7CiAJCWlmIChlcnIpIHsK
KwkJCURSTV9FUlJPUigiY29ubmVjdCBpb21tdSBmYWlsZWQuXG4iKTsKIAkJCW1kZXYtPmlvbW11
ID0gTlVMTDsKLQkJCWdvdG8gZXJyX2NsZWFudXA7CisJCQlnb3RvIGRpc2FibGVfY2xrOwogCQl9
CiAJfQogCisJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1kZXYtPmFjbGspOworCiAJZXJyID0gc3lz
ZnNfY3JlYXRlX2dyb3VwKCZkZXYtPmtvYmosICZrb21lZGFfc3lzZnNfYXR0cl9ncm91cCk7CiAJ
aWYgKGVycikgewogCQlEUk1fRVJST1IoImNyZWF0ZSBzeXNmcyBncm91cCBmYWlsZWQuXG4iKTsK
QEAgLTMxMyw2ICszMTYsOCBAQCBzdHJ1Y3Qga29tZWRhX2RldiAqa29tZWRhX2Rldl9jcmVhdGUo
c3RydWN0IGRldmljZSAqZGV2KQogCiAJcmV0dXJuIG1kZXY7CiAKK2Rpc2FibGVfY2xrOgorCWNs
a19kaXNhYmxlX3VucHJlcGFyZShtZGV2LT5hY2xrKTsKIGVycl9jbGVhbnVwOgogCWtvbWVkYV9k
ZXZfZGVzdHJveShtZGV2KTsKIAlyZXR1cm4gRVJSX1BUUihlcnIpOwpAQCAtMzMwLDggKzMzNSwx
MiBAQCB2b2lkIGtvbWVkYV9kZXZfZGVzdHJveShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIAlk
ZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUobWRldi0+ZGVidWdmc19yb290KTsKICNlbmRpZgogCisJ
aWYgKG1kZXYtPmFjbGspCisJCWNsa19wcmVwYXJlX2VuYWJsZShtZGV2LT5hY2xrKTsKKwogCWlm
IChtZGV2LT5pb21tdSAmJiBtZGV2LT5mdW5jcy0+ZGlzY29ubmVjdF9pb21tdSkKLQkJbWRldi0+
ZnVuY3MtPmRpc2Nvbm5lY3RfaW9tbXUobWRldik7CisJCWlmIChtZGV2LT5mdW5jcy0+ZGlzY29u
bmVjdF9pb21tdShtZGV2KSkKKwkJCURSTV9FUlJPUigiZGlzY29ubmVjdCBpb21tdSBmYWlsZWQu
XG4iKTsKIAltZGV2LT5pb21tdSA9IE5VTEw7CiAKIAlmb3IgKGkgPSAwOyBpIDwgbWRldi0+bl9w
aXBlbGluZXM7IGkrKykgewpAQCAtMzU5LDMgKzM2OCw0NyBAQCB2b2lkIGtvbWVkYV9kZXZfZGVz
dHJveShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIAogCWRldm1fa2ZyZWUoZGV2LCBtZGV2KTsK
IH0KKworaW50IGtvbWVkYV9kZXZfcmVzdW1lKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQorewor
CWludCByZXQgPSAwOworCisJY2xrX3ByZXBhcmVfZW5hYmxlKG1kZXYtPmFjbGspOworCisJaWYg
KG1kZXYtPmlvbW11ICYmIG1kZXYtPmZ1bmNzLT5jb25uZWN0X2lvbW11KSB7CisJCXJldCA9IG1k
ZXYtPmZ1bmNzLT5jb25uZWN0X2lvbW11KG1kZXYpOworCQlpZiAocmV0IDwgMCkgeworCQkJRFJN
X0VSUk9SKCJjb25uZWN0IGlvbW11IGZhaWxlZC5cbiIpOworCQkJZ290byBkaXNhYmxlX2NsazsK
KwkJfQorCX0KKworCXJldCA9IG1kZXYtPmZ1bmNzLT5lbmFibGVfaXJxKG1kZXYpOworCitkaXNh
YmxlX2NsazoKKwljbGtfZGlzYWJsZV91bnByZXBhcmUobWRldi0+YWNsayk7CisKKwlyZXR1cm4g
cmV0OworfQorCitpbnQga29tZWRhX2Rldl9zdXNwZW5kKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2
KQoreworCWludCByZXQgPSAwOworCisJY2xrX3ByZXBhcmVfZW5hYmxlKG1kZXYtPmFjbGspOwor
CisJaWYgKG1kZXYtPmlvbW11ICYmIG1kZXYtPmZ1bmNzLT5kaXNjb25uZWN0X2lvbW11KSB7CisJ
CXJldCA9IG1kZXYtPmZ1bmNzLT5kaXNjb25uZWN0X2lvbW11KG1kZXYpOworCQlpZiAocmV0IDwg
MCkgeworCQkJRFJNX0VSUk9SKCJkaXNjb25uZWN0IGlvbW11IGZhaWxlZC5cbiIpOworCQkJZ290
byBkaXNhYmxlX2NsazsKKwkJfQorCX0KKworCXJldCA9IG1kZXYtPmZ1bmNzLT5kaXNhYmxlX2ly
cShtZGV2KTsKKworZGlzYWJsZV9jbGs6CisJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1kZXYtPmFj
bGspOworCisJcmV0dXJuIHJldDsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmgKaW5kZXggOGFjZjhjMDYwMWNjLi40MTQyMDAyMzNiNjQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCkBA
IC0yMjQsNCArMjI0LDcgQEAgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFf
ZXZlbnRzICpldnRzKTsKIHN0YXRpYyBpbmxpbmUgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0
cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKSB7fQogI2VuZGlmCiAKK2ludCBrb21lZGFfZGV2X3Jl
c3VtZShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CitpbnQga29tZWRhX2Rldl9zdXNwZW5kKHN0
cnVjdCBrb21lZGFfZGV2ICptZGV2KTsKKwogI2VuZGlmIC8qX0tPTUVEQV9ERVZfSF8qLwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwppbmRleCA2
OWFjZTZmOTA1NWQuLmQ2YzIyMjJjNWQzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKQEAgLTgsNiArOCw3IEBACiAjaW5jbHVkZSA8bGlu
dXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVk
ZSA8bGludXgvY29tcG9uZW50Lmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fb2YuaD4KICNpbmNsdWRlICJrb21lZGFfZGV2LmgiCiAjaW5jbHVkZSAi
a29tZWRhX2ttcy5oIgpAQCAtMTM2LDEzICsxMzcsNDAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQga29tZWRhX29mX21hdGNoW10gPSB7CiAKIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIGtvbWVkYV9vZl9tYXRjaCk7CiAKK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQga29tZWRh
X3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0cnVjdCBrb21lZGFfZHJ2ICpt
ZHJ2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9ICZt
ZHJ2LT5rbXMtPmJhc2U7CisJaW50IHJlczsKKworCXJlcyA9IGRybV9tb2RlX2NvbmZpZ19oZWxw
ZXJfc3VzcGVuZChkcm0pOworCisJa29tZWRhX2Rldl9zdXNwZW5kKG1kcnYtPm1kZXYpOworCisJ
cmV0dXJuIHJlczsKK30KKworc3RhdGljIGludCBfX21heWJlX3VudXNlZCBrb21lZGFfcG1fcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3Qga29tZWRhX2RydiAqbWRydiA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAmbWRydi0+a21z
LT5iYXNlOworCisJa29tZWRhX2Rldl9yZXN1bWUobWRydi0+bWRldik7CisKKwlyZXR1cm4gZHJt
X21vZGVfY29uZmlnX2hlbHBlcl9yZXN1bWUoZHJtKTsKK30KKworc3RhdGljIGNvbnN0IHN0cnVj
dCBkZXZfcG1fb3BzIGtvbWVkYV9wbV9vcHMgPSB7CisJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMo
a29tZWRhX3BtX3N1c3BlbmQsIGtvbWVkYV9wbV9yZXN1bWUpCit9OworCiBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBrb21lZGFfcGxhdGZvcm1fZHJpdmVyID0gewogCS5wcm9iZQk9IGtv
bWVkYV9wbGF0Zm9ybV9wcm9iZSwKIAkucmVtb3ZlCT0ga29tZWRhX3BsYXRmb3JtX3JlbW92ZSwK
IAkuZHJpdmVyCT0gewogCQkubmFtZSA9ICJrb21lZGEiLAogCQkub2ZfbWF0Y2hfdGFibGUJPSBr
b21lZGFfb2ZfbWF0Y2gsCi0JCS5wbSA9IE5VTEwsCisJCS5wbSA9ICZrb21lZGFfcG1fb3BzLAog
CX0sCiB9OwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
