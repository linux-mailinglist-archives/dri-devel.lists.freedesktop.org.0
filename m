Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962F104DAE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61EE6E16F;
	Thu, 21 Nov 2019 08:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00048.outbound.protection.outlook.com [40.107.0.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6EC6E16F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:17:48 +0000 (UTC)
Received: from VI1PR08CA0109.eurprd08.prod.outlook.com (2603:10a6:800:d4::11)
 by VI1PR08MB4573.eurprd08.prod.outlook.com (2603:10a6:803:e7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.26; Thu, 21 Nov
 2019 08:17:43 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VI1PR08CA0109.outlook.office365.com
 (2603:10a6:800:d4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Thu, 21 Nov 2019 08:17:43 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 08:17:43 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Thu, 21 Nov 2019 08:17:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 730f22fbe99feacc
X-CR-MTA-TID: 64aa7808
Received: from f395dae5f728.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E449D34A-4FF7-40D3-A9DF-9DBA5F9EB3BA.1; 
 Thu, 21 Nov 2019 08:17:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f395dae5f728.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 08:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIv5LFb116FgCsNaJ8AK9isKXnQw9lVAP4J0D3C55Z84p1BQvz4Lknu9Q7rM94o1TWQOTkY17sxmhiWhqdruN2+f3mRKKx4Jk3qjtmFrdfou2lIusH0b2cXVsVissMf7y83Qafbj/ilwTXhR2JYQZ0vs1bCUUJgn0iUKuPg7mcrcv8VXN2Uef67pt+bi6iNq4T1ff2K8TY+2zWGGrxV7s1m3gtUAopf1F9lN5lZ8SBBY6+kQUELQ7pvarXUJoPaAvnh5T9U2T8JmWpGi/3tfyFewRqv78yK0s0f2nFWABBwN+O/MLEiZkBd8KG9mlEHo8OXwQv8V3FCFy97ISYPdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6KAgV9VNacs05IlHwdZGzekRkk3LW/r5ghdHaKNrGE=;
 b=OtZ4BXfZ1U5nGDYVn9NttZUu8TzAiIieV/PWFDpnEWPD6P4H83z4PUBhvtrYJPWrRxKvS0Xux/nuvv7tMDGc0TfQ1QwVvuIxGYOlVcrNbVr6xU8N8c0pFs+mlVKCp4VVwhXomal+EIb9h549dpL0pjou/G22UIfBPBFHhjYyadsQiNIOfTzrwSK1aUwyy+itghAi3LQ8OphoorfTZd+1+TXkq8tdKWCfvGhj8oKII6tBkEYHzlke7tJO1CEo4l3FZJK3vadbiy6IKX4bYG8HvgFO7KS2H/2zKdTxyVBeUtrvVdS8roy6cRRxBpj01BTYW9NGdnWtflNQSYIHtlhPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4910.eurprd08.prod.outlook.com (10.255.114.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 21 Nov 2019 08:17:34 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 08:17:34 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 0/2] drm/komeda: Add new product "D32" support
Thread-Topic: [PATCH v2 0/2] drm/komeda: Add new product "D32" support
Thread-Index: AQHVoEQgs9VqsrNWe0K3imLeTJdC+Q==
Date: Thu, 21 Nov 2019 08:17:34 +0000
Message-ID: <20191121081717.29518-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cdfed0d5-519b-458a-f1ed-08d76e5b48aa
X-MS-TrafficTypeDiagnostic: VE1PR08MB4910:|VE1PR08MB4910:|VI1PR08MB4573:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4573EA6B21E41D2D201804C6B34E0@VI1PR08MB4573.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(136003)(39850400004)(53754006)(189003)(199004)(6116002)(3846002)(2616005)(6486002)(478600001)(86362001)(4326008)(102836004)(6636002)(71190400001)(26005)(71200400001)(54906003)(110136005)(14454004)(186003)(2501003)(6436002)(316002)(6512007)(99286004)(25786009)(2906002)(66946007)(64756008)(7736002)(66556008)(4744005)(66066001)(305945005)(1076003)(66476007)(256004)(14444005)(36756003)(52116002)(386003)(6506007)(55236004)(81166006)(81156014)(8676002)(50226002)(103116003)(66446008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4910;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Yu5DnEVTF1yhV7q+5bi+wJg9zUWMfU09CWnPoMONrKB9DttjbnPbusRbeIjnTma1LAOodoIVPkyeMzdDN5n1I30V7hlHBAZ1uc0S8V033/E4gd/i3YpUJpBLvEBeR/GwfwwMruLhhKabFu2dU9E0z4tBjIPBM0WOxwWnbjMd4+8Tmf8kfALgOPkSTg0F75xm1GTpXjH/qcuNoFMJyYoSEPYzoPlNIOzyWGX8WQDpU+m8q9g2BJF1KjfFOrdHdG9PA2ldWnNzJcvOKAtNAYXd5m168XLzCpj3h2eTA0BpkjNG0yk9tqv0moF4chF0szet8a2/aKfaOGvzt5T6YfoCs4FPnCw3rNj9800KAEAekLpR63u9f7fToGsbb86GJyse7/PC3KNIu5SUWtzg4+ZimjomjYjjhMxlnmiDUhX/g9ehI9+AF64DHSun8MXnAksF
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(1110001)(339900001)(199004)(189003)(53754006)(50466002)(50226002)(6486002)(4326008)(356004)(99286004)(2501003)(70586007)(8676002)(14454004)(5660300002)(22756006)(25786009)(6512007)(316002)(8936002)(105606002)(8746002)(36756003)(23756003)(110136005)(4744005)(2906002)(14444005)(2616005)(47776003)(6636002)(6116002)(66066001)(3846002)(70206006)(76130400001)(81156014)(54906003)(7736002)(26826003)(386003)(86362001)(6506007)(81166006)(186003)(26005)(478600001)(1076003)(102836004)(103116003)(336012)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4573;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e53269a-c3c5-48cf-bdb4-08d76e5b42df
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yp6MI/xmpZYMUhOPSMwOYYO7z6xc18ckx978Z5FoF8oUsFdPQyhpNtHq/Uk+uM9MU3B4MOzVJYZQd4dxVhR4/+Q3kZ2aTq5l5GJrHECo9MeSKYGPnkC3tdmNLJmlJjOkq8p32WcYKta00c681WY7wka83ds1NQvFidCwAuPIKIDtPzI5P3yCjtizRqiqZ6FDVvF6VdyWnePiDZLvXEpjBOGb2iRKX2J9sbw72zN44YSdUE02q2fq0Jy0xsGKR/pRbIOgQuyqiuCEX/WMd6pfb9CgUn+LxCUx4aKQiCiIpIBsB5zQXCXaDlaI3325GGteyGVb+u/APi+XiCnmI6/0Te63SrO5JlyRomt/2CcZ+FCwLHlKG8EH15VKv8H0ZZJfEvdcb9J1mlalcQSeevqfsGXz63JFx803XYZykDZByTo/ctPY0aEf7zp/HAuAR5zi
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 08:17:43.5915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfed0d5-519b-458a-f1ed-08d76e5b48aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4573
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6KAgV9VNacs05IlHwdZGzekRkk3LW/r5ghdHaKNrGE=;
 b=znInJritgqwHfmdC1e/nIc6E6tu8TRC1VWdoHGR3uL1/S1kDTbfAcGwM8+sXW1qL6JdcQdYabB+NqYHPjGPp5/+o/+LRJ3K6Qnq381x2EQWw+8q2nwNzC+zMHaoS2SJorF/NHmw5p8PPATPh/xPkSbnkcTqmgF1b6zfD3CiBpVY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6KAgV9VNacs05IlHwdZGzekRkk3LW/r5ghdHaKNrGE=;
 b=znInJritgqwHfmdC1e/nIc6E6tu8TRC1VWdoHGR3uL1/S1kDTbfAcGwM8+sXW1qL6JdcQdYabB+NqYHPjGPp5/+o/+LRJ3K6Qnq381x2EQWw+8q2nwNzC+zMHaoS2SJorF/NHmw5p8PPATPh/xPkSbnkcTqmgF1b6zfD3CiBpVY=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsOgoKVGhpcyBzZXJpZXMgZW5hYmxlcyBuZXcgcHJvZHVjdCAiRDMyIiBzdXBwb3J0Cgp2
MjogUmViYXNlCgpqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMik6CiAg
ZHJtL2tvbWVkYTogVXBkYXRlIHRoZSBjaGlwIGlkZW50aWZ5CiAgZHJtL2tvbWVkYTogRW5hYmxl
IG5ldyBwcm9kdWN0IEQzMiBzdXBwb3J0CgogLi4uL2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21h
bGlkcF9wcm9kdWN0LmggIHwgIDMgKy0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9j
b21wb25lbnQuYyAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcx
L2Q3MV9kZXYuYyAgfCA3MCArKysrKysrKysrKysrLS0tLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmggfCAxMyArKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5jICAgfCA2MCArKysrKysrKy0tLS0tLS0tCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAxNCArLS0tCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jICAgfCAxMCArLS0KIDcgZmlsZXMg
Y2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKyksIDcwIGRlbGV0aW9ucygtKQoKLS0KMi4yMC4xCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
