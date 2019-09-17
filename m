Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2283B4CD7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 13:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A336EBD0;
	Tue, 17 Sep 2019 11:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C606EBD0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 11:26:02 +0000 (UTC)
Received: from VE1PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:803:104::38)
 by HE1PR0801MB2059.eurprd08.prod.outlook.com (2603:10a6:3:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Tue, 17 Sep
 2019 11:25:57 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VE1PR08CA0025.outlook.office365.com
 (2603:10a6:803:104::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.20 via Frontend
 Transport; Tue, 17 Sep 2019 11:25:57 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Tue, 17 Sep 2019 11:25:56 +0000
Received: ("Tessian outbound 96594883d423:v31");
 Tue, 17 Sep 2019 11:25:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c31b3dd893088c5f
X-CR-MTA-TID: 64aa7808
Received: from ed96af2a6d6b.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EE5C799-2460-4FA4-B5CE-1DF4F8ED5121.1; 
 Tue, 17 Sep 2019 11:25:47 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed96af2a6d6b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Sep 2019 11:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/6jK6H7SQnYtiEa4GsOpnaZaAeOWygx32BtNnuTjn4NbiRvcprxPoG3z7OiuDdz0BEZCCrvHyHvbLCbufC/o22uk08G3gelqBo7sX7T+nfxjfEq+aQ1jTz1L4uhRGSmBM5trWrPOWblK0qJJ0nzTOwTkjSozO96MN3n/da8yImdebbDFf1Lxivs9kA/SbY0uY2eRnSokWEGPcnR7Eh8nSFDvGc5JeiSY3zc6M/lfSJU6seqYtJb58nOBnsqTbUGEpwt3hpP0KFh42Vgah9SQVo6TBKl5syte2R8RYM/PGsiTtJRbAT+TjZ0ficMnvrDsdyJ/MIdTNKEyoH7LHcj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPCfEYioEfsWHrPR84jJQb343tIWOQ3Hl3nMGQNyF3M=;
 b=OUMHhJjc/f1LFInNKrZr4X4/SEo6pI+zvfjIwhceE3VsZXEpKeZ20kzmzO771sdiIZljjXz/NHt6UWKZEei8O4pw/3Xp1tLJhP++Ya6zZ/DwAvdtP95zMWe3bmnRwpVNVe6KnCjGmDD9Hota/E7yV4RA7+kg2EA/tOIAVZdng12PGsri042dtg5jlzt5mtQfw3KuOvNDBBWG+MO5P9HS5tkZCKmgJfX4VJjeHMaLKVfMBwM1N/QSca0fiv/T5Kb6pDyoRlZrFK+XATtA/y13TWg0bKrVf282jNFoVkbaZg7pJKD5iszGXsPVXYxi5sis5ySiM72xQUKaXNkEZTQWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Tue, 17 Sep 2019 11:25:44 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 11:25:44 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Adds register dump support for gcu, lup and dou
Thread-Topic: [PATCH] drm/komeda: Adds register dump support for gcu, lup and
 dou
Thread-Index: AQHVbUqkK0KWtTUlrECe2oyL7O6Z7w==
Date: Tue, 17 Sep 2019 11:25:44 +0000
Message-ID: <20190917112525.25490-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:36::17) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e0aa4e38-5628-4dbd-fa32-08d73b61cec5
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB5488; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB5488:|VI1PR08MB5488:|HE1PR0801MB2059:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB20592337DCDC2AE472B854C39F8F0@HE1PR0801MB2059.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1417;OLM:1332;
x-forefront-prvs: 01630974C0
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(476003)(486006)(102836004)(186003)(1076003)(2616005)(2501003)(6506007)(478600001)(26005)(66446008)(64756008)(66556008)(81166006)(66946007)(52116002)(8936002)(8676002)(66476007)(14454004)(305945005)(50226002)(66066001)(7736002)(71190400001)(71200400001)(6636002)(99286004)(5660300002)(86362001)(36756003)(256004)(55236004)(81156014)(386003)(54906003)(2201001)(110136005)(6512007)(25786009)(3846002)(6486002)(6116002)(6436002)(4326008)(2906002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5488;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 1Qu8p/oPEGzUsq8FUfVM1WNMZAemhp1ITpa8Dgy8QHW7d0m5g8bZD0tJ4XREWBKOpBujguRi15nY4XtecKasffrF9UrxDPe0cf/mJRzosAu6PvRsqn+GIQMnVPuJF4O4cgeXDVOphX3tcPtx98oEpQ3LNGWnUmOfJmUbGoCmkwbCfPDWdGHQLjOWmPQLC/TpCiLBKdWkpRMNUanYHF6IanTzgCZohPLbNOdx2gniC6Psu2JeV8s43fbQiPn2SVBMQ1gQLXcX7toO6xrSAgMEWi37qbtwRZPfNmZ90c/5xXO7hBgIfM0qKx1/8pz7DXX/d2UICa3LbOwff0VXj4Geo4UgRHkCpbGSHkIfAlkV35TEi4vksK1mz1NV+igdSB0Zgfa6e1F7XcJrDRm/3VpVt2bzHqyoBnpEtwIJu1mOd7k=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5488
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(189003)(199004)(70586007)(99286004)(186003)(70206006)(26005)(126002)(2501003)(102836004)(66066001)(2616005)(486006)(6506007)(25786009)(476003)(63350400001)(50226002)(478600001)(4326008)(81156014)(6486002)(36756003)(386003)(6512007)(76130400001)(6636002)(8676002)(81166006)(8746002)(110136005)(336012)(8936002)(36906005)(3846002)(1076003)(2201001)(22756006)(54906003)(6116002)(23756003)(47776003)(356004)(86362001)(7736002)(2906002)(316002)(14454004)(5660300002)(50466002)(26826003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB2059;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4ebe53ff-1fc0-496b-f72d-08d73b61c73f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:HE1PR0801MB2059; 
NoDisclaimer: True
X-Forefront-PRVS: 01630974C0
X-Microsoft-Antispam-Message-Info: yrk+aI3rg9r5f150dPRjR3JNXrOvQHPOcMzbVpoplm98B8/F4LNGYGVNlUrAUimz1+02I/B30GOv/QzFAiN+VjtnFjTvlNhjdaYjjKBjgZdExJPc9q+mquIGimbXnX2AaeJ4/ScUrZMaj9Otw/lJPaBjXkQyol5KFRwtfMaGodr3+PdVwU5hXjmNzwra1396yx/3N1GRhQ0zvcystzF17u1YDLqrmKh8Jzo8S2LK9zEgWFeaKV2X+VFfmTxkeUIDRpAszSTvbhSooxaAYjdmYtqfreaVICqNNq9LCZ0FcqYKzicgzApu5DZqKR+94nYzmzE3N5HeGXf4nzrWy/aEZvQH5tCiizKPVSoepgUpMLL3NAaPLbso9X3lUrSgmJKEA8adYAJHleYmUPxn+Y5DNV+xYEj7JEna7F5tFs1lC5c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2019 11:25:56.2491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0aa4e38-5628-4dbd-fa32-08d73b61cec5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPCfEYioEfsWHrPR84jJQb343tIWOQ3Hl3nMGQNyF3M=;
 b=Zk30GWfq09LmpfdfmWiDUuE8TW+mRV28WzPBHUSMqD/PBK8h7aFGweK/fxBUX9OkRTTwPFXqAy3WIDpmjSiuhyrb6lt0kPLfn6CdX5H8k0pC81ERM50uyr7XcTqvJwLBPymN+96UdnkqqHQoGR0GI/wcU6HmTwKTSBJT0lW8CwA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPCfEYioEfsWHrPR84jJQb343tIWOQ3Hl3nMGQNyF3M=;
 b=Zk30GWfq09LmpfdfmWiDUuE8TW+mRV28WzPBHUSMqD/PBK8h7aFGweK/fxBUX9OkRTTwPFXqAy3WIDpmjSiuhyrb6lt0kPLfn6CdX5H8k0pC81ERM50uyr7XcTqvJwLBPymN+96UdnkqqHQoGR0GI/wcU6HmTwKTSBJT0lW8CwA=
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
PgoKQWRkcyB0byBzdXBwb3J0IHJlZ2lzdGVyIGR1bXAgb24gbHB1IGFuZCBkb3Ugb2YgcGlwZWxp
bmUgYW5kIGdjdSBvbiBENzEKCkNoYW5nZXMgc2luY2UgdjE6Ci0gRm9yIGEgY29uc3RhbnQgZm9y
bWF0IHdpdGhvdXQgYWRkaXRpb25hbCBhcmd1bWVudHMsIHVzZSBzZXFfcHV0cygpCmluc3RlYWQg
b2Ygc2VxX3ByaW50ZigpLgoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KLS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfY29tcG9uZW50LmMgICAgfCA4NiArKysrKysrKysrKysrKysrKystCiAuLi4vZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgfCAyMyArKy0tLQogLi4uL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmggIHwgIDIgKwogLi4uL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyAgIHwgIDIgKwogNCBmaWxlcyBjaGFuZ2Vk
LCAxMDEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCmluZGV4IDQw
NzNhNDUyZTI0YS4uN2JhM2MxMzUxNDJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCkBAIC0xMjA2LDYgKzEyMDYs
OTAgQEAgaW50IGQ3MV9wcm9iZV9ibG9jayhzdHJ1Y3QgZDcxX2RldiAqZDcxLAogCXJldHVybiBl
cnI7CiB9CiAKK3N0YXRpYyB2b2lkIGQ3MV9nY3VfZHVtcChzdHJ1Y3QgZDcxX2RldiAqZDcxLCBz
dHJ1Y3Qgc2VxX2ZpbGUgKnNmKQoreworCXUzMiB2WzVdOworCisJc2VxX3B1dHMoc2YsICJcbi0t
LS0tLSBHQ1UgLS0tLS0tXG4iKTsKKworCWdldF92YWx1ZXNfZnJvbV9yZWcoZDcxLT5nY3VfYWRk
ciwgMCwgMywgdik7CisJc2VxX3ByaW50ZihzZiwgIkdMQl9BUkNIX0lEOlx0XHQweCVYXG4iLCB2
WzBdKTsKKwlzZXFfcHJpbnRmKHNmLCAiR0xCX0NPUkVfSUQ6XHRcdDB4JVhcbiIsIHZbMV0pOwor
CXNlcV9wcmludGYoc2YsICJHTEJfQ09SRV9JTkZPOlx0XHQweCVYXG4iLCB2WzJdKTsKKworCWdl
dF92YWx1ZXNfZnJvbV9yZWcoZDcxLT5nY3VfYWRkciwgMHgxMCwgMSwgdik7CisJc2VxX3ByaW50
ZihzZiwgIkdMQl9JUlFfU1RBVFVTOlx0XHQweCVYXG4iLCB2WzBdKTsKKworCWdldF92YWx1ZXNf
ZnJvbV9yZWcoZDcxLT5nY3VfYWRkciwgMHhBMCwgNSwgdik7CisJc2VxX3ByaW50ZihzZiwgIkdD
VV9JUlFfUkFXX1NUQVRVUzpcdDB4JVhcbiIsIHZbMF0pOworCXNlcV9wcmludGYoc2YsICJHQ1Vf
SVJRX0NMRUFSOlx0XHQweCVYXG4iLCB2WzFdKTsKKwlzZXFfcHJpbnRmKHNmLCAiR0NVX0lSUV9N
QVNLOlx0XHQweCVYXG4iLCB2WzJdKTsKKwlzZXFfcHJpbnRmKHNmLCAiR0NVX0lSUV9TVEFUVVM6
XHRcdDB4JVhcbiIsIHZbM10pOworCXNlcV9wcmludGYoc2YsICJHQ1VfU1RBVFVTOlx0XHQweCVY
XG4iLCB2WzRdKTsKKworCWdldF92YWx1ZXNfZnJvbV9yZWcoZDcxLT5nY3VfYWRkciwgMHhEMCwg
Mywgdik7CisJc2VxX3ByaW50ZihzZiwgIkdDVV9DT05UUk9MOlx0XHQweCVYXG4iLCB2WzBdKTsK
KwlzZXFfcHJpbnRmKHNmLCAiR0NVX0NPTkZJR19WQUxJRDA6XHQweCVYXG4iLCB2WzFdKTsKKwlz
ZXFfcHJpbnRmKHNmLCAiR0NVX0NPTkZJR19WQUxJRDE6XHQweCVYXG4iLCB2WzJdKTsKK30KKwor
c3RhdGljIHZvaWQgZDcxX2xwdV9kdW1wKHN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUsIHN0cnVj
dCBzZXFfZmlsZSAqc2YpCit7CisJdTMyIHZbNl07CisKKwlzZXFfcHJpbnRmKHNmLCAiXG4tLS0t
LS0gTFBVJWQgLS0tLS0tXG4iLCBwaXBlLT5iYXNlLmlkKTsKKworCWR1bXBfYmxvY2tfaGVhZGVy
KHNmLCBwaXBlLT5scHVfYWRkcik7CisKKwlnZXRfdmFsdWVzX2Zyb21fcmVnKHBpcGUtPmxwdV9h
ZGRyLCAweEEwLCA2LCB2KTsKKwlzZXFfcHJpbnRmKHNmLCAiTFBVX0lSUV9SQVdfU1RBVFVTOlx0
MHglWFxuIiwgdlswXSk7CisJc2VxX3ByaW50ZihzZiwgIkxQVV9JUlFfQ0xFQVI6XHRcdDB4JVhc
biIsIHZbMV0pOworCXNlcV9wcmludGYoc2YsICJMUFVfSVJRX01BU0s6XHRcdDB4JVhcbiIsIHZb
Ml0pOworCXNlcV9wcmludGYoc2YsICJMUFVfSVJRX1NUQVRVUzpcdFx0MHglWFxuIiwgdlszXSk7
CisJc2VxX3ByaW50ZihzZiwgIkxQVV9TVEFUVVM6XHRcdDB4JVhcbiIsIHZbNF0pOworCXNlcV9w
cmludGYoc2YsICJMUFVfVEJVX1NUQVRVUzpcdFx0MHglWFxuIiwgdls1XSk7CisKKwlnZXRfdmFs
dWVzX2Zyb21fcmVnKHBpcGUtPmxwdV9hZGRyLCAweEMwLCAxLCB2KTsKKwlzZXFfcHJpbnRmKHNm
LCAiTFBVX0lORk86XHRcdDB4JVhcbiIsIHZbMF0pOworCisJZ2V0X3ZhbHVlc19mcm9tX3JlZyhw
aXBlLT5scHVfYWRkciwgMHhEMCwgMywgdik7CisJc2VxX3ByaW50ZihzZiwgIkxQVV9SQVhJX0NP
TlRST0w6XHQweCVYXG4iLCB2WzBdKTsKKwlzZXFfcHJpbnRmKHNmLCAiTFBVX1dBWElfQ09OVFJP
TDpcdDB4JVhcbiIsIHZbMV0pOworCXNlcV9wcmludGYoc2YsICJMUFVfVEJVX0NPTlRST0w6XHQw
eCVYXG4iLCB2WzJdKTsKK30KKworc3RhdGljIHZvaWQgZDcxX2RvdV9kdW1wKHN0cnVjdCBkNzFf
cGlwZWxpbmUgKnBpcGUsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCit7CisJdTMyIHZbNV07CisKKwlz
ZXFfcHJpbnRmKHNmLCAiXG4tLS0tLS0gRE9VJWQgLS0tLS0tXG4iLCBwaXBlLT5iYXNlLmlkKTsK
KworCWR1bXBfYmxvY2tfaGVhZGVyKHNmLCBwaXBlLT5kb3VfYWRkcik7CisKKwlnZXRfdmFsdWVz
X2Zyb21fcmVnKHBpcGUtPmRvdV9hZGRyLCAweEEwLCA1LCB2KTsKKwlzZXFfcHJpbnRmKHNmLCAi
RE9VX0lSUV9SQVdfU1RBVFVTOlx0MHglWFxuIiwgdlswXSk7CisJc2VxX3ByaW50ZihzZiwgIkRP
VV9JUlFfQ0xFQVI6XHRcdDB4JVhcbiIsIHZbMV0pOworCXNlcV9wcmludGYoc2YsICJET1VfSVJR
X01BU0s6XHRcdDB4JVhcbiIsIHZbMl0pOworCXNlcV9wcmludGYoc2YsICJET1VfSVJRX1NUQVRV
UzpcdFx0MHglWFxuIiwgdlszXSk7CisJc2VxX3ByaW50ZihzZiwgIkRPVV9TVEFUVVM6XHRcdDB4
JVhcbiIsIHZbNF0pOworfQorCitzdGF0aWMgdm9pZCBkNzFfcGlwZWxpbmVfZHVtcChzdHJ1Y3Qg
a29tZWRhX3BpcGVsaW5lICpwaXBlLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnNmKQoreworCXN0cnVjdCBk
NzFfcGlwZWxpbmUgKmQ3MV9waXBlID0gdG9fZDcxX3BpcGVsaW5lKHBpcGUpOworCisJZDcxX2xw
dV9kdW1wKGQ3MV9waXBlLCBzZik7CisJZDcxX2RvdV9kdW1wKGQ3MV9waXBlLCBzZik7Cit9CisK
IGNvbnN0IHN0cnVjdCBrb21lZGFfcGlwZWxpbmVfZnVuY3MgZDcxX3BpcGVsaW5lX2Z1bmNzID0g
ewotCS5kb3duc2NhbGluZ19jbGtfY2hlY2sgPSBkNzFfZG93bnNjYWxpbmdfY2xrX2NoZWNrLAor
CS5kb3duc2NhbGluZ19jbGtfY2hlY2sJPSBkNzFfZG93bnNjYWxpbmdfY2xrX2NoZWNrLAorCS5k
dW1wX3JlZ2lzdGVyCQk9IGQ3MV9waXBlbGluZV9kdW1wLAogfTsKKwordm9pZCBkNzFfZHVtcChz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgc3RydWN0IHNlcV9maWxlICpzZikKK3sKKwlzdHJ1Y3Qg
ZDcxX2RldiAqZDcxID0gbWRldi0+Y2hpcF9kYXRhOworCisJZDcxX2djdV9kdW1wKGQ3MSwgc2Yp
OworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rl
di5jCmluZGV4IGQ1NjdhYjdlZDMxNC4uMGI3NjNlYTU0M2FjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jCkBAIC01NjEsMTcgKzU2MSwx
OCBAQCBzdGF0aWMgaW50IGQ3MV9kaXNjb25uZWN0X2lvbW11KHN0cnVjdCBrb21lZGFfZGV2ICpt
ZGV2KQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGtvbWVkYV9kZXZfZnVuY3MgZDcxX2NoaXBf
ZnVuY3MgPSB7Ci0JLmluaXRfZm9ybWF0X3RhYmxlID0gZDcxX2luaXRfZm10X3RibCwKLQkuZW51
bV9yZXNvdXJjZXMJPSBkNzFfZW51bV9yZXNvdXJjZXMsCi0JLmNsZWFudXAJPSBkNzFfY2xlYW51
cCwKLQkuaXJxX2hhbmRsZXIJPSBkNzFfaXJxX2hhbmRsZXIsCi0JLmVuYWJsZV9pcnEJPSBkNzFf
ZW5hYmxlX2lycSwKLQkuZGlzYWJsZV9pcnEJPSBkNzFfZGlzYWJsZV9pcnEsCi0JLm9uX29mZl92
YmxhbmsJPSBkNzFfb25fb2ZmX3ZibGFuaywKLQkuY2hhbmdlX29wbW9kZQk9IGQ3MV9jaGFuZ2Vf
b3Btb2RlLAotCS5mbHVzaAkJPSBkNzFfZmx1c2gsCi0JLmNvbm5lY3RfaW9tbXUJPSBkNzFfY29u
bmVjdF9pb21tdSwKLQkuZGlzY29ubmVjdF9pb21tdSA9IGQ3MV9kaXNjb25uZWN0X2lvbW11LAor
CS5pbml0X2Zvcm1hdF90YWJsZQk9IGQ3MV9pbml0X2ZtdF90YmwsCisJLmVudW1fcmVzb3VyY2Vz
CQk9IGQ3MV9lbnVtX3Jlc291cmNlcywKKwkuY2xlYW51cAkJPSBkNzFfY2xlYW51cCwKKwkuaXJx
X2hhbmRsZXIJCT0gZDcxX2lycV9oYW5kbGVyLAorCS5lbmFibGVfaXJxCQk9IGQ3MV9lbmFibGVf
aXJxLAorCS5kaXNhYmxlX2lycQkJPSBkNzFfZGlzYWJsZV9pcnEsCisJLm9uX29mZl92YmxhbmsJ
CT0gZDcxX29uX29mZl92YmxhbmssCisJLmNoYW5nZV9vcG1vZGUJCT0gZDcxX2NoYW5nZV9vcG1v
ZGUsCisJLmZsdXNoCQkJPSBkNzFfZmx1c2gsCisJLmNvbm5lY3RfaW9tbXUJCT0gZDcxX2Nvbm5l
Y3RfaW9tbXUsCisJLmRpc2Nvbm5lY3RfaW9tbXUJPSBkNzFfZGlzY29ubmVjdF9pb21tdSwKKwku
ZHVtcF9yZWdpc3RlcgkJPSBkNzFfZHVtcCwKIH07CiAKIGNvbnN0IHN0cnVjdCBrb21lZGFfZGV2
X2Z1bmNzICoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
ZDcxL2Q3MV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9kZXYuaAppbmRleCA4NGYxODc4YjY0N2QuLmM3MzU3YzJiOWU2MiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuaApAQCAtNDksNCArNDks
NiBAQCBpbnQgZDcxX3Byb2JlX2Jsb2NrKHN0cnVjdCBkNzFfZGV2ICpkNzEsCiAJCSAgICBzdHJ1
Y3QgYmxvY2tfaGVhZGVyICpibGssIHUzMiBfX2lvbWVtICpyZWcpOwogdm9pZCBkNzFfcmVhZF9i
bG9ja19oZWFkZXIodTMyIF9faW9tZW0gKnJlZywgc3RydWN0IGJsb2NrX2hlYWRlciAqYmxrKTsK
IAordm9pZCBkNzFfZHVtcChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgc3RydWN0IHNlcV9maWxl
ICpzZik7CisKICNlbmRpZiAvKiAhX0Q3MV9ERVZfSF8gKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKaW5kZXggOWQ0ZDUwNzVjYzY0Li40YWEz
MjRkNDY0MDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5jCkBAIC0yNSw2ICsyNSw4IEBAIHN0YXRpYyBpbnQga29tZWRhX3JlZ2lzdGVyX3No
b3coc3RydWN0IHNlcV9maWxlICpzZiwgdm9pZCAqeCkKIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRl
diA9IHNmLT5wcml2YXRlOwogCWludCBpOwogCisJc2VxX3B1dHMoc2YsICJcbj09PT09PSBLb21l
ZGEgcmVnaXN0ZXIgZHVtcCA9PT09PT09PT1cbiIpOworCiAJaWYgKG1kZXYtPmZ1bmNzLT5kdW1w
X3JlZ2lzdGVyKQogCQltZGV2LT5mdW5jcy0+ZHVtcF9yZWdpc3RlcihtZGV2LCBzZik7CiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
