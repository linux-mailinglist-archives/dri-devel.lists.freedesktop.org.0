Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E8D8E02
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1C36E936;
	Wed, 16 Oct 2019 10:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF216E935
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:34:52 +0000 (UTC)
Received: from VI1PR0801CA0079.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::23) by DB7PR08MB3322.eurprd08.prod.outlook.com
 (2603:10a6:5:26::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Wed, 16 Oct
 2019 10:34:48 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR0801CA0079.outlook.office365.com
 (2603:10a6:800:7d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 10:34:48 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 10:34:47 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Wed, 16 Oct 2019 10:34:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed6632e7ef1f2c9e
X-CR-MTA-TID: 64aa7808
Received: from cc6315660be6.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 647D6AB5-3CFD-4314-A2A5-1A5B8AF87251.1; 
 Wed, 16 Oct 2019 10:34:35 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc6315660be6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 10:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwUverQXsU/W89UymcmONmasOsobpum6QDoN7kgFJvnXYvFG21DMQhFzFGEOPOzIy8ym7MTZZgRTAk3Dp6v/SRO1P4lIDdeZLrO4RIDC9DJjke8Vo0/VtPIUwJWozU9i0D/lEu1Sa8qyrdB161Y5z+7lxPPAKWQTPax8tySwcAUFbB2VoD3ifJlB2m6KfKCxdlh4rxOcO7UU6TJvaRaw52oczyCDGVaj58t6i80DPz80vz/5v8lqO4bEt19VpMJO5CR3jnX3HOY2r3gzNoXQP0HBdhHKT9ukCLQ1HGxSVqtk+85jdRNMv6ojnEPTn7Icjpp0SZhmFEKD4tEVAL+uMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTLIBaRIXBywulqqapRfWZZE7ga1kAVvsh5MVHvOcGM=;
 b=YyicKbbcNMX1Gk29GMsgNBK+baTKuBo6HFM4BMZKHmv1PJNa0CERXkVmbDliMMKHtYnzNEQsueF0gEgIZXMr/6YX/1LhhtyXAJIxlBuQ2sRtKeXQScBuAbANGhXKtlHpAys1J5V9rmC3tS3ThRnxuJ0qykoSRjShM6Y7xe4HhHTs1+5xaYsBrvX9+QfzE5eS8L5YIslkJWBs1dzYmQ/oLDnP6Gq74pMDxQQWzf5zo8sGWpdmtKmM7PLSKseK84xJF7C56tqXhkuMbD7jzMrT4PWDLkHIssW5md5tQrmJnJZ1BB4CteSUrD7S9f6Ru0ubfV+gXkrG4YTQJYKGlBA3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5152.eurprd08.prod.outlook.com (20.179.30.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 10:34:30 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 10:34:30 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v5 4/4] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH v5 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVhA1KKjv8+ZR4kki+4DzZfnBljg==
Date: Wed, 16 Oct 2019 10:34:30 +0000
Message-ID: <20191016103339.25858-5-james.qian.wang@arm.com>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
In-Reply-To: <20191016103339.25858-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:36::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5bab6739-465f-43ac-33da-08d75224777b
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5152:|VE1PR08MB5152:|DB7PR08MB3322:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3322F08D7A8C0DDE478B6DA6B3920@DB7PR08MB3322.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(6506007)(4326008)(2171002)(25786009)(478600001)(66066001)(99286004)(103116003)(76176011)(52116002)(71190400001)(64756008)(71200400001)(256004)(14444005)(66446008)(66476007)(36756003)(66946007)(14454004)(66556008)(8936002)(50226002)(8676002)(386003)(81166006)(81156014)(486006)(26005)(2501003)(186003)(55236004)(2906002)(5660300002)(110136005)(1076003)(305945005)(446003)(2201001)(6486002)(6436002)(11346002)(476003)(6512007)(316002)(6116002)(3846002)(102836004)(54906003)(86362001)(2616005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5152;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: aqLUHqH8Rkexwy/Q+geqpVkYcQCqBlQTlXgJ8kQMtQMwXvmIt93V4vwTGHpzJflQer9pVaAhLXq2ygVREDd+QkdwNdSXgHSk4pItPHhfztur42YsS5hidsnQd9aIETBR2Gngwe95/2OIyk1G6DKsGlQWDVdHvXTj7MH7/86PNQ844wSwkCzDbzCbobBXHVMHk3cQmlk5/nStZcL3NICfc9bSwEul8EDWhFOB90jvwHmxL7eNGlYt4H+99K82fMECccQ9afyep+hKA0pDZ1XOgClSvcUJ2Q4k4KUF7cDUerCwQCjtKBZnnc33TxFLRGjyzMvMi7jvlcSU4yoQHfBXcC7a7sK7rrgR66DTdYf/ihMuKbhAueBgKS6LbDd31vn0+iJBkoC2OK2carzC/8+aIM8cc/tHETBR3JmuAhMNJy4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5152
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(189003)(199004)(36756003)(63350400001)(126002)(70206006)(50466002)(54906003)(26826003)(66066001)(8676002)(7736002)(26005)(76130400001)(4326008)(336012)(478600001)(6512007)(70586007)(22756006)(14444005)(386003)(2906002)(86362001)(6506007)(102836004)(5660300002)(103116003)(2201001)(11346002)(186003)(25786009)(446003)(356004)(14454004)(1076003)(316002)(486006)(6486002)(99286004)(36906005)(8936002)(3846002)(8746002)(2501003)(2616005)(50226002)(305945005)(476003)(47776003)(76176011)(81156014)(6116002)(81166006)(110136005)(2171002)(23756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3322;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4e9eaf6b-3e12-4541-972e-08d752246d1a
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shMxGa/fKlQJb+mA2GoPwQofT/Kma6657Ilv9k1iQ3FELDi1ORbWct/olGadLQlBFkL+z1cu+U6/XXFuVDSH22jmgKtsiAY3yjjIQc/GtLUo4HFeGcyJFIjbHVcU2R/EyA4MBlY/9vCWPu6Cj+WmvOkXgRIM7CKhxJ8gR0QI/F//+8X1TBFkX7fPqGzJnYkWsJ4t5dIq44FaVh1OABPjHYgEazTykZ5pd3KEh4WOAZj4g1I8f9e+9ZJF9L7aaTpPDKIiGK/hFhVEEghuGMaJDenrjWtUlCeQbFdbTHXBiCKdEM7tEfXpt3fNofoMjgZIupZ1XQl0giL0kFppvRNayLAfPOKnINT52/zAE8psEE5HTlCaFUS1ttn0UNlGUJQOsH93ZUE/4gUwjXBnJSL2EoPAlmR0LN4j4U5t61+VEhM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 10:34:47.2537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bab6739-465f-43ac-33da-08d75224777b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3322
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTLIBaRIXBywulqqapRfWZZE7ga1kAVvsh5MVHvOcGM=;
 b=v6LlkbKrB0oh022g70bFJsEIE2XHwbYRLPWUSHmTECKpbdGwFv28zaSIxIXh8C5YccpuypsBQhJiHXCEDBeywE3PAqflPkktKsHM5fqL1LTX5I7C90PZi0ukCpkfR8yHL6Vc/ggnrOJYxaZ9tHHh/g1/BFSzXybo+lXA8zDZ6S4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTLIBaRIXBywulqqapRfWZZE7ga1kAVvsh5MVHvOcGM=;
 b=v6LlkbKrB0oh022g70bFJsEIE2XHwbYRLPWUSHmTECKpbdGwFv28zaSIxIXh8C5YccpuypsBQhJiHXCEDBeywE3PAqflPkktKsHM5fqL1LTX5I7C90PZi0ukCpkfR8yHL6Vc/ggnrOJYxaZ9tHHh/g1/BFSzXybo+lXA8zDZ6S4=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMuCkFk
ZHMgdHdvIGNhcHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1fY29lZmZzIHRvIGtvbWVk
YV9pbXByb2Nfc3RhdGUuCklmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFu
ZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCgp2NTogUmViYXNlIHdpdGggZHJtLW1pc2Mt
bmV4dAoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93
cnkubGlAYXJtLmNvbT4KLS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgMiArKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKysrCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgNiArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYwppbmRleCA2NzQwYjg0MjJmMTEuLjYzYTFiNmY5Y2JiYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYwpAQCAtMTAzMiw3ICsxMDMyLDkgQEAgc3RhdGljIGludCBkNzFfbWVyZ2Vy
X2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRl
KHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAogCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21w
b25lbnRfc3RhdGUgKnN0YXRlKQogeworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9
IHN0YXRlLT5jcnRjLT5zdGF0ZTsKIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0
b19pbXByb2Nfc3Qoc3RhdGUpOworCXN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUgPSB0b19kNzFf
cGlwZWxpbmUoYy0+cGlwZWxpbmUpOwogCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7CiAJdTMy
IGluZGV4LCBtYXNrID0gMCwgY3RybCA9IDA7CiAKQEAgLTEwNDMsNiArMTA0NSwyNCBAQCBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIAlt
YWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXpl
KSk7CiAJbWFsaWRwX3dyaXRlMzIocmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7CiAK
KwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7CisJCW1hc2sgfD0gSVBTX0NUUkxf
RlQgfCBJUFNfQ1RSTF9SR0I7CisKKwkJaWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgeworCQkJbWFs
aWRwX3dyaXRlX2dyb3VwKHBpcGUtPmRvdV9mdF9jb2VmZl9hZGRyLCBGVF9DT0VGRjAsCisJCQkJ
CSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZGUywKKwkJCQkJICAgc3QtPmZnYW1tYV9jb2VmZnMpOwor
CQkJY3RybCB8PSBJUFNfQ1RSTF9GVDsgLyogZW5hYmxlIGdhbW1hICovCisJCX0KKworCQlpZiAo
Y3J0Y19zdC0+Y3RtKSB7CisJCQltYWxpZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9D
T0VGRjAsCisJCQkJCSAgIEtPTUVEQV9OX0NUTV9DT0VGRlMsCisJCQkJCSAgIHN0LT5jdG1fY29l
ZmZzKTsKKwkJCWN0cmwgfD0gSVBTX0NUUkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KKwkJfQor
CX0KKwogCW1hc2sgfD0gSVBTX0NUUkxfWVVWIHwgSVBTX0NUUkxfQ0hENDIyIHwgSVBTX0NUUkxf
Q0hENDIwOwogCiAJLyogY29uZmlnIGNvbG9yIGZvcm1hdCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4IDI1MjAxNTIxMGZiYy4u
MWM0NTJlYTc1OTk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jCkBAIC02MTcsNiArNjE3LDggQEAgc3RhdGljIGludCBrb21lZGFfY3J0
Y19hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCiAKIAljcnRjLT5wb3J0ID0ga2NydGMt
Pm1hc3Rlci0+b2Zfb3V0cHV0X3BvcnQ7CiAKKwlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChj
cnRjLCAwLCB0cnVlLCBLT01FREFfQ09MT1JfTFVUX1NJWkUpOworCiAJcmV0dXJuIGVycjsKIH0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmgKaW5kZXggYmQ2Y2E3Yzg3MDM3Li5hYzg3MjVlMjQ4NTMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAt
MTEsNiArMTEsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVkZSAibWFsaWRwX3V0aWxzLmgiCisjaW5jbHVk
ZSAia29tZWRhX2NvbG9yX21nbXQuaCIKIAogI2RlZmluZSBLT01FREFfTUFYX1BJUEVMSU5FUwkJ
MgogI2RlZmluZSBLT01FREFfUElQRUxJTkVfTUFYX0xBWUVSUwk0CkBAIC0zMjcsNiArMzI4LDgg
QEAgc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgewogCXN0cnVjdCBrb21lZGFfY29tcG9uZW50
X3N0YXRlIGJhc2U7CiAJdTggY29sb3JfZm9ybWF0LCBjb2xvcl9kZXB0aDsKIAl1MTYgaHNpemUs
IHZzaXplOworCXUzMiBmZ2FtbWFfY29lZmZzW0tPTUVEQV9OX0dBTU1BX0NPRUZGU107CisJdTMy
IGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZGU107CiB9OwogCiAvKiBkaXNwbGF5IHRpbWlu
ZyBjb250cm9sbGVyICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA0MmJkYzYzZGNmZmEuLjA5
MzAyMzRhYmI5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC04MDIsNiArODAyLDEyIEBAIGtv
bWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKIAkJc3Qt
PmNvbG9yX2Zvcm1hdCA9IEJJVChfX2ZmcyhhdmFpbF9mb3JtYXRzKSk7CiAJfQogCisJaWYgKGtj
cnRjX3N0LT5iYXNlLmNvbG9yX21nbXRfY2hhbmdlZCkgeworCQlkcm1fbHV0X3RvX2ZnYW1tYV9j
b2VmZnMoa2NydGNfc3QtPmJhc2UuZ2FtbWFfbHV0LAorCQkJCQkgc3QtPmZnYW1tYV9jb2VmZnMp
OworCQlkcm1fY3RtX3RvX2NvZWZmcyhrY3J0Y19zdC0+YmFzZS5jdG0sIHN0LT5jdG1fY29lZmZz
KTsKKwl9CisKIAlrb21lZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+
aW5wdXQsIDApOwogCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAm
aW1wcm9jLT5iYXNlLCAwKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
