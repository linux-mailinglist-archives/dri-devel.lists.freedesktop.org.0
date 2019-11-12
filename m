Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F88F9018
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 14:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2416D6E152;
	Tue, 12 Nov 2019 13:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140083.outbound.protection.outlook.com [40.107.14.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABABE6E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:00:18 +0000 (UTC)
Received: from VI1PR08CA0127.eurprd08.prod.outlook.com (2603:10a6:800:d4::29)
 by AM4PR08MB2868.eurprd08.prod.outlook.com (2603:10a6:205:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.25; Tue, 12 Nov
 2019 13:00:16 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0127.outlook.office365.com
 (2603:10a6:800:d4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Tue, 12 Nov 2019 13:00:15 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 13:00:15 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Tue, 12 Nov 2019 13:00:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1799604380bfb410
X-CR-MTA-TID: 64aa7808
Received: from 270b23c31c09.2 (cr-mta-lb-1.cr-mta-net [104.47.12.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18A76887-E649-4A4C-A6B3-31ABDFB69281.1; 
 Tue, 12 Nov 2019 13:00:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 270b23c31c09.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Nov 2019 13:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQTfQFsWHYZo7UozFo+jj71JnhDV4h+uqsBuOemfkqklhS78QKK6orG4w8sb1RsktzL/CGIcN4MUzM6R9d9rZ7alyOnGHuDW6lvxADVF8pqIqFR9CnkZONxaWbRb02V9nw5z/YXKeVDSal2Qlu09w0yLgt3mVOQ215Ie5ZbKP9lXXyOpmQX1Mv9AbjI61lIaCQB07vPbpMp4GjUPXfLdzsEXMQOHwhXYrmiflgntXSGKprwEh5qILuwKLpOQJvsnao6OyPTS601ADXPnwAGpYMUFHU0yXK/L6HuHsSVxjuSMH+S/iCqpzS4khphYqUYYfVka43PB4KO5yw1zTDLpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGSG3OsrBK5mca62KLUkrkoOtNqh/LjsByI8Zo5wnkw=;
 b=AZPM2C/djiEr0ICS2E3YdFkwlH0eIDqi1q53lGun33u2pQWzvn6kElAUr+x1KWoyWKnBYh8IfNQL0eOA55SE5ZpOjpwETvboZC/kBagcDnrFlfYD/rx8cqnwXQDPc56kPxEttoXwuOzexY9bTk8enGHeyXB0tA38vSxFL9GKvufjz+SX8tTRKKjVtxxJnLx13L1BetP7U3w5EQG5kLyuczGx0NQuwOrKB6sDb13aQ+RQgklenEOXaf1zzlpZ7El1FaGH5C2du0UMzkfgYBXyrtY/rgSJp6gsnjPoO2Gs460bOKeYy/UbpLAMbSFrr+f41K2aMPJu7Xf+8ZcxHuc1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4256.eurprd08.prod.outlook.com (20.179.24.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Tue, 12 Nov 2019 13:00:00 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 13:00:00 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 5/5] drm/komeda: add rate limiting disable to
 err_verbosity
Thread-Topic: [PATCH v2 5/5] drm/komeda: add rate limiting disable to
 err_verbosity
Thread-Index: AQHVlWB4xMPbXmf91UG5tobxnmp6wKeGJX6AgAFh7oA=
Date: Tue, 12 Nov 2019 13:00:00 +0000
Message-ID: <39367348.R9gcQaf2xt@e123338-lin>
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
 <20191107114155.54307-6-mihail.atanassov@arm.com>
 <20191111155313.iiz37se2f7526ehp@e110455-lin.cambridge.arm.com>
In-Reply-To: <20191111155313.iiz37se2f7526ehp@e110455-lin.cambridge.arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: CWXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:73::32) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4f93f38-0aec-4b61-7d90-08d767704346
X-MS-TrafficTypeDiagnostic: VI1PR08MB4256:|VI1PR08MB4256:|AM4PR08MB2868:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB2868B25CF135B0CA367BD6748F770@AM4PR08MB2868.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(396003)(136003)(346002)(376002)(189003)(199004)(66556008)(6436002)(6486002)(256004)(3846002)(66476007)(6116002)(6512007)(64756008)(66446008)(316002)(7736002)(305945005)(6636002)(229853002)(86362001)(14454004)(99286004)(186003)(6246003)(4326008)(54906003)(11346002)(8936002)(76176011)(476003)(81156014)(81166006)(8676002)(66066001)(6862004)(26005)(33716001)(2906002)(71200400001)(9686003)(14444005)(66946007)(5660300002)(71190400001)(6506007)(486006)(25786009)(102836004)(386003)(52116002)(446003)(478600001)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4256;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: e2f8KHCz/1sOGhieRAEWXqA+UesI6xYOTFobOqAq47ivAVExHa7ntRsDcz+84C4Fo1P3I4KsGsg7pliKRrmPBrnfrtc/VaJeJrRyCBNr6ipK342OSmR676DLqoArM4YRZ3YxQGj5pmuCNoWGEsI+DyptN2/9FF5/lsLhs3Wq5QRkWSMLiXXVZtmyTojSDIIde78A6H2eLcHRHoA09k9AfEpbYDC1kQNB1cDkylUHiDgle74Eq5+VEH6ZGznQOyrinXK/6XNQLXqHK1IumyL9rHTL1euHFVoDIeZIGtL3ZY0q7UyRFzr8yHXtYmDm2TkNUR02ACQFJrZPBjfOSuTqKoXcG/CBPROwcjk4URo/E6CuCHb87IqXAtO+Ubdfwht1UJ8r+Ao4t1qsHcL1b5J0Do4hluvUJTWaG1J6lvSBlenLOO9JXWupYq86Fhgpr4ck
Content-ID: <716ADF14EB76E445AEE28A0E484F8C7B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4256
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(396003)(39860400002)(346002)(136003)(1110001)(339900001)(189003)(199004)(436003)(70206006)(26005)(126002)(2486003)(6862004)(23676004)(476003)(4326008)(70586007)(25786009)(14454004)(305945005)(486006)(86362001)(76176011)(5660300002)(6246003)(47776003)(107886003)(9686003)(50466002)(6512007)(99286004)(11346002)(6486002)(66066001)(229853002)(386003)(446003)(14444005)(102836004)(6506007)(22756006)(33716001)(6116002)(3846002)(6636002)(186003)(105606002)(81166006)(81156014)(8936002)(8676002)(76130400001)(478600001)(336012)(36906005)(316002)(54906003)(356004)(7736002)(26826003)(2906002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB2868;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0ac6da1f-655f-4a43-2c6d-08d767703a06
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hltm6Qozndzi2EZq/wA7xjyRnwfl+qyvVNV6xRUBxmvwxFqeaxuGP8FolniSZGEmBcNEr0eFAjVNK9Q2PYP3RDruODxpmmDY5KlGZJY9yU3Kjj3OdPYXH3QN/t+t+mRKvPEvKr5X2h9zMTTA+w2FfkNVcCY8LYuPJJBYnxs6ZS9txvC63z2zVHaICZX7b5GVAooxlXSXMrCxHVPqVFHRO7cZvvpzBgtHSMeUvJ1eQxudGR7UEEm9XgBUHUYLPtktZKE2NyvLkrguniqZF7KgmXs/do3dQTQJH3sTh7j276jbOrMIkwX6Gy+D4eIH+MJ9pf7tO6MwlXz/h8RSyHkegH1U/OCDQqxUJAV38fhuImQBYkp2kdVuZwz564Nut+LdRzY8VZWBhyOG1WSH2AbThW/tDiRIHzNOAej5kzNJZ6krdHk3TwDGO7/kk1miJawO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 13:00:15.7794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f93f38-0aec-4b61-7d90-08d767704346
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGSG3OsrBK5mca62KLUkrkoOtNqh/LjsByI8Zo5wnkw=;
 b=M8OQ1OEHlEcEqJqUaqLREDoph9mUVhC65YXm8DDh+i2WNsDKCFYAYoKaN239QdKCFBEFG4iYUmobt4QcU6IWRTpOMPlzF3O1XzwB70zSZbDH316tKbXsmDDW7pF5k7FF+JEQIgnNb4ATJiyv0MZAylzjBxx6s5urFHmny9uKTTM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGSG3OsrBK5mca62KLUkrkoOtNqh/LjsByI8Zo5wnkw=;
 b=M8OQ1OEHlEcEqJqUaqLREDoph9mUVhC65YXm8DDh+i2WNsDKCFYAYoKaN239QdKCFBEFG4iYUmobt4QcU6IWRTpOMPlzF3O1XzwB70zSZbDH316tKbXsmDDW7pF5k7FF+JEQIgnNb4ATJiyv0MZAylzjBxx6s5urFHmny9uKTTM=
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
Cc: "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCAxMSBOb3ZlbWJlciAyMDE5IDE1OjUzOjE0IEdNVCBMaXZpdSBEdWRhdSB3cm90
ZToNCj4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTE6NDI6NDRBTSArMDAwMCwgTWloYWlsIEF0
YW5hc3NvdiB3cm90ZToNCj4gPiBJdCdzIHBvc3NpYmxlIHRvIGdldCBtdWx0aXBsZSBldmVudHMg
aW4gYSBzaW5nbGUgZnJhbWUvZmxpcCwgc28gYWRkIGFuDQo+ID4gb3B0aW9uIHRvIHByaW50IHRo
ZW0gYWxsLg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPg0KPiANCj4gRm9y
IHRoZSB3aG9sZSBzZXJpZXM6DQo+IA0KPiBBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1
ZGF1QGFybS5jb20+DQoNClRoYW5rcywgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0Lg0KDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IExpdml1DQo+IA0KPiA+IC0tLQ0KPiA+IA0KPiA+ICB2MjogQ2xl
YW4gdXAgY29udGludWF0aW9uIGxpbmUgd2FybmluZyBmcm9tIGNoZWNrcGF0Y2guDQo+ID4gDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAy
ICsrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50
LmMgfCAyICstDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmgNCj4gPiBpbmRleCBkOWZjOWM0ODg1OWEuLjE1ZjUyZTMwNGMwOCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5oDQo+ID4gQEAgLTIyNCw2ICsyMjQsOCBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7DQo+ID4g
ICNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9JTkZPX0VWRU5UUyBCSVQoMikNCj4gPiAgCS8qIER1
bXAgRFJNIHN0YXRlIG9uIGFuIGVycm9yIG9yIHdhcm5pbmcgZXZlbnQuICovDQo+ID4gICNkZWZp
bmUgS09NRURBX0RFVl9QUklOVF9EVU1QX1NUQVRFX09OX0VWRU5UIEJJVCg4KQ0KPiA+ICsJLyog
RGlzYWJsZSByYXRlIGxpbWl0aW5nIG9mIGV2ZW50IHByaW50cyAobm9ybWFsbHkgb25lIHBlciBj
b21taXQpICovDQo+ID4gKyNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9ESVNBQkxFX1JBVEVMSU1J
VCBCSVQoMTIpDQo+ID4gIH07DQo+ID4gIA0KPiA+ICBzdGF0aWMgaW5saW5lIGJvb2wNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZl
bnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMN
Cj4gPiBpbmRleCA3ZmQ2MjQ3NjFhMmIuLmJmMjY5NjgzZjgxMSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYw0KPiA+
IEBAIC0xMTksNyArMTE5LDcgQEAgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21l
ZGFfZXZlbnRzICpldnRzLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiA+ICAJLyogcmVkdWNl
IHRoZSBzYW1lIG1zZyBwcmludCwgb25seSBwcmludCB0aGUgZmlyc3QgZXZ0IGZvciBvbmUgZnJh
bWUgKi8NCj4gPiAgCWlmIChldnRzLT5nbG9iYWwgfHwgaXNfbmV3X2ZyYW1lKGV2dHMpKQ0KPiA+
ICAJCWVuX3ByaW50ID0gdHJ1ZTsNCj4gPiAtCWlmICghZW5fcHJpbnQpDQo+ID4gKwlpZiAoIShl
cnJfdmVyYm9zaXR5ICYgS09NRURBX0RFVl9QUklOVF9ESVNBQkxFX1JBVEVMSU1JVCkgJiYgIWVu
X3ByaW50KQ0KPiA+ICAJCXJldHVybjsNCj4gPiAgDQo+ID4gIAlpZiAoZXJyX3ZlcmJvc2l0eSAm
IEtPTUVEQV9ERVZfUFJJTlRfRVJSX0VWRU5UUykNCj4gPiAtLSANCj4gPiAyLjIzLjANCj4gPiAN
Cj4gDQo+IC0tIA0KPiA9PT09PT09PT09PT09PT09PT09PQ0KPiB8IEkgd291bGQgbGlrZSB0byB8
DQo+IHwgZml4IHRoZSB3b3JsZCwgIHwNCj4gfCBidXQgdGhleSdyZSBub3QgfA0KPiB8IGdpdmlu
ZyBtZSB0aGUgICB8DQo+ICBcIHNvdXJjZSBjb2RlISAgLw0KPiAgIC0tLS0tLS0tLS0tLS0tLQ0K
PiAgICAgwq9cXyjjg4QpXy/Crw0KPiANCg0KDQotLSANCk1paGFpbA0KDQoNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
