Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87CABC288
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD6D6E98C;
	Tue, 24 Sep 2019 07:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150058.outbound.protection.outlook.com [40.107.15.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8526E98C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:26:26 +0000 (UTC)
Received: from DB7PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:5:16::16) by
 AM6PR08MB4454.eurprd08.prod.outlook.com (2603:10a6:20b:bf::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 07:26:22 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by DB7PR08CA0003.outlook.office365.com
 (2603:10a6:5:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Tue, 24 Sep 2019 07:26:21 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Tue, 24 Sep 2019 07:26:20 +0000
Received: ("Tessian outbound 96594883d423:v31");
 Tue, 24 Sep 2019 07:26:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cda21f6be1be124b
X-CR-MTA-TID: 64aa7808
Received: from 621e70ca2ba0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE4A5AFC-25C9-4936-81B7-6EDA065A4D1F.1; 
 Tue, 24 Sep 2019 07:26:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 621e70ca2ba0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2019 07:26:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFw3E3qlZO1lgH17ijz7O2N303r+SI14zHctYS0VOa5YsxeQSq7yV1CR6YFtrfXups+Q1OabUJtX8myw8P9yL5e0d/28a0oBGUtBzM9Hshh5yxOQNL99Ap8yci1TdnIi8FsjbKKnsAfR0J0QvxXET/PveiarMH7a3fCfAEUfUyk7VFQ7nYfsTAS62TO8tH1m6rXWjV1gqLVC/EYqAvWt6zlBwloXoICnA1sC3+mhDPVMgtxpRUsxasbsSIAKS62jq97AMVXXmH+scgsOosDhw/f9JKXPd5pE23W1z+2FznEZXA8I8CT43hcGktKrhVBhVBKjWBBwpALLPV4eIa4HAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1qONKm7zLfHHGS3KQK0e+VJDfs5imqssR67PDyd8Cw=;
 b=jxJvRwZRqwMhT+zdLowUfcB1Oh0ZeZ/F0OrBkoMCceDHiftSq887p//1DkvzJ7LPr7JutIO8G8T0qcZXzPBCQMllM9sheeKYakNy18wEkcT+MnHFS8r1ks86l6ZjQ1W81zkiNhWiIEx78cUOJL0kRDenvByS9tM37U+I3bnP4/blNbdiFM6YxZeZvoK6E85+SK5l8Ho2qWGT5vsymzaoSimUBB6l5WkdvxoFMvNhk38Qkr4/pkCqR0aOWya2WHwSjHHGnpZutMSI2w2tlxAqduv6Np+Wc4PXmCyl9qiLCJJYxxBAQ3zcTVKFDjCF6D0xgqNQAe5eQLWX/BBMG62cng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3998.eurprd08.prod.outlook.com (20.178.126.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 07:26:08 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:26:08 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 0/2] drm/komeda: Add layer line size support
Thread-Topic: [PATCH v2 0/2] drm/komeda: Add layer line size support
Thread-Index: AQHVcqlVmhY/YSfl3kekDKd3eVM8yw==
Date: Tue, 24 Sep 2019 07:26:08 +0000
Message-ID: <20190924072552.32446-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 54acb936-0e95-4eca-d80b-08d740c07ee4
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3998; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3998:|VI1PR08MB3998:|AM6PR08MB4454:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4454200A3E39F9E6D5CF72FF9F840@AM6PR08MB4454.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0170DAF08C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(199004)(189003)(50226002)(102836004)(478600001)(55236004)(66556008)(316002)(4326008)(66946007)(2501003)(25786009)(476003)(186003)(66066001)(2616005)(52116002)(26005)(6506007)(386003)(54906003)(99286004)(4744005)(5660300002)(6116002)(66446008)(3846002)(966005)(8936002)(486006)(1076003)(86362001)(8676002)(110136005)(66476007)(64756008)(81156014)(6486002)(36756003)(6636002)(71200400001)(71190400001)(14454004)(2906002)(6512007)(81166006)(2201001)(6306002)(7736002)(6436002)(305945005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3998;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: pKRgByjyqqXtp/ZvUhrE8C1DL3iojvf/kywFJ1TwGl27gLMD0F10yWg2qfNreQE2OnyxOhz6uu3LrCVUVRO6PqHCUN1SktGL6KLHjyykRsm2pRYZi38bXjEI//UwMEpirgPvSLaN/uA44KtbRzXn13vXzk9zhF1+bNkYwgnsBucFGOpXhHtUAQkCqhW+yq6jTsbSOgJk7xnL2A29aslTKmrkpqBXkuvtYPy8iCBHf+sb1bRGp/IOrHa2kNjCzKt9LvQzeQVdECgExyi9hjmfND1ENynxZeQQn9Ec+1pp/HR+y3wLP/UzR64MdS7RpB1YrUmV+DyDj1Y459zYWzStu0JwPu9ndo1RwzhOqTVtsNLxy8KfuA/jmD/y/nC1X6aUoClPbgFCncc3xbfOg1qu+TEwKHs3FsSye91Nv2itjJU=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3998
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(189003)(199004)(4744005)(54906003)(336012)(81156014)(2616005)(6306002)(110136005)(305945005)(66066001)(476003)(1076003)(6512007)(81166006)(966005)(126002)(50466002)(316002)(63350400001)(356004)(6636002)(76130400001)(102836004)(26826003)(23756003)(478600001)(36906005)(36756003)(7736002)(70206006)(8746002)(8936002)(70586007)(486006)(22756006)(14454004)(86362001)(26005)(2501003)(186003)(6486002)(50226002)(5660300002)(99286004)(3846002)(386003)(6506007)(2906002)(8676002)(47776003)(6116002)(25786009)(2201001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4454;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f16ea686-3245-4a24-8da6-08d740c0774f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB4454; 
NoDisclaimer: True
X-Forefront-PRVS: 0170DAF08C
X-Microsoft-Antispam-Message-Info: x3i5LSeH2CicY3Nlj4NpRaEN9WkhcukD7jqw15GPnJmw2+gZmcITLgEMfA/9binlYNZaicohGJr590SYLSaXxzGIznYkqDfipucclyGXyjaDPNnWYkGN4YyJUZmU5GgzBfno7XjxXAU9sIVbWq94tIntNCN+Qeu7t0kyFuV6r669VOUroVcE8iGAuUtaMYKQ3hQDrSLZT0e+tQ3JLEIHDVcSDVOWl1yANbcJgDCA89tl8DqxcBFKzBwOiHAOJUmw2lDHIujwAq4XBSr0t1YxAPJCCVkqGOs8G69r2HE1YphRCfCZKGvjOnbp5NxNQIPrEG5Zmgo/7eBKfltnFLcJ3vbpKtL/KM8SZYxSkkqYDZVfUUei0fhoecFS3QvkZ0d0owerU/rPObPYou+Inq/gikyF0dW0PzIBYdSSpd30iko=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 07:26:20.2499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54acb936-0e95-4eca-d80b-08d740c07ee4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1qONKm7zLfHHGS3KQK0e+VJDfs5imqssR67PDyd8Cw=;
 b=2/rbwzHd83C4OPAtTczUFpdyilkvoFwrvY7MuzsI01iVzi0VjK5ZN2oGeBVMHFOGBLLSiL4Nv1puTMWXV9fTQMWsZIGT5wFZbh/pVNPmm5ONVNwhhWmgJRBu6eRwfVxor5LV85NeyYrIHDPcy+zLoNRu3Udqn8lyolAN/DGebco=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1qONKm7zLfHHGS3KQK0e+VJDfs5imqssR67PDyd8Cw=;
 b=2/rbwzHd83C4OPAtTczUFpdyilkvoFwrvY7MuzsI01iVzi0VjK5ZN2oGeBVMHFOGBLLSiL4Nv1puTMWXV9fTQMWsZIGT5wFZbh/pVNPmm5ONVNwhhWmgJRBu6eRwfVxor5LV85NeyYrIHDPcy+zLoNRu3Udqn8lyolAN/DGebco=
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

SGksCgpGcm9tIEQzMiBldmVyeSBjb21wb25lbnQgaGF2ZSBhIGxpbmUgc2l6ZSByZWdpc3RlciB0
byBpbmRpY2F0ZSBpbnRlcm5hbApmaWZvIHNpemUsIGluc3RlYWQgb2YgdXNpbmcgdGhlIGdsb2Jh
bCBsaW5lX3N6LgoKVGhpcyBzZXJpZSBhaW1zIGF0IGFkZGluZyB0aGUgbGF5ZXIgbGluZSBzaXpl
IHN1cHBvcnQgYW5kIGNoZWNrCmFjY29yZGluZ2x5IG9uIGJvdGggRDcxIGFuZCBEMzIgb3IgbmV3
ZXIuCgpEZXBlbmRzIG9uOgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzYyMzc3LwpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYyMTgxLwoK
Q2hhbmdlcyBzaW5jZSB2MToKUmViYXNlcyB0byBkcm0tbWlzYy1uZXh0IGJyYW5jaC4KCkxvd3J5
IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDIpOgogIGRybS9rb21lZGE6IEFkZCBsaW5lIHNp
emUgc3VwcG9ydAogIGRybS9rb21lZGE6IEFkZHMgbGF5ZXIgaG9yaXpvbnRhbCBpbnB1dCBzaXpl
IGxpbWl0YXRpb24gY2hlY2sgZm9yIEQ3MQoKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYyAgICB8IDEwNiArKysrKysrKysrKysrKysrLS0KIC4uLi9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCB8ICAgOSArLQogLi4uL2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgICAyICsKIC4uLi9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8ICAxNyArKysKIDQgZmlsZXMgY2hhbmdlZCwg
MTE5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
