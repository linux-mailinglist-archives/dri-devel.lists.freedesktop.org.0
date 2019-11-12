Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01111F8D01
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4596EB01;
	Tue, 12 Nov 2019 10:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-eopbgr120053.outbound.protection.outlook.com [40.107.12.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED816EB01
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:40:32 +0000 (UTC)
Received: from DB6PR0802CA0034.eurprd08.prod.outlook.com (2603:10a6:4:a3::20)
 by PR2PR08MB4636.eurprd08.prod.outlook.com (2603:10a6:101:23::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Tue, 12 Nov
 2019 10:40:30 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by DB6PR0802CA0034.outlook.office365.com
 (2603:10a6:4:a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Tue, 12 Nov 2019 10:40:30 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 10:40:29 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Tue, 12 Nov 2019 10:40:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4077bbbc7a62a59
X-CR-MTA-TID: 64aa7808
Received: from 6634627f527e.2 (cr-mta-lb-1.cr-mta-net [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 230940A3-5F62-400B-B287-3134D5A2DDF8.1; 
 Tue, 12 Nov 2019 10:40:20 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6634627f527e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Nov 2019 10:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZ43ipfjr9Q4zVBIvErYIsLvMMWYxzWMvElNfBY90uTIpvtsmScpmqk0a7nVj7eptb1u01dFDYrZV5ATTfC9Cj+7xTIhjrqkEp3QaRKhl2dlfMeh78B/pHS/g7XkIjfiMfFUoYgQSLB2OmroR6Rgkh2SCX4mvy/a/wDPqV9IRj3Ah84TBs1mvt/tpAnPvmfxuUe/lZhRU2lcVXRUSuCvgUACrZxKyWA9g93e9wkHtltZEDfWEjdE0NglK/qHhNqRemPmnIOLGO6vO+MLyrQfRM5ylxKcoPJdpnuvZx3ZH+MOwLoFb8Uc5TJ2h/Et7Z1zDPy78fC03LFirqLz1lI2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOrt6sxuikDY8QGRHGli7q4d5cAkxgKVtJe6VeR/bEY=;
 b=JUhN1tX76e9Z2EqGxTPsM8ZsQagfwJwzUghQfKZKXUBI5LL0AZr9e0WGDzUMc7soppgjvCwvH+FbVo8CFPQfHWyBuHObaWcktILxQ/wX5hUVfH28PeXwRxTx2gblKL4peKiK2HeLkc5+dlBDIlRHBM0I/eoBegR35Le7JXMLKMEut8wdS0tpvjAm4wC5iTDl7sP1h7coGxTGYZ5WmGn9ytbbILwxzd8B0Z61sQVQgYdMpNGI08IKMQQWv5cDme6yb+vE3H7pvqg8KEKtormRptcohmjIZsXzz96vB872zd1BGDDNYw3qFL9yIWxZ3bgAlM3BCUjIovqUAbX9bREGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB4082.eurprd08.prod.outlook.com (20.178.119.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 12 Nov 2019 10:40:17 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 10:40:17 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v9 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v9 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVmUWS62NJlvjRSU6V3as2Z4d7/A==
Date: Tue, 12 Nov 2019 10:40:16 +0000
Message-ID: <20191112103956.19074-1-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5f96e5d5-0224-4019-6d48-08d7675cbcc0
X-MS-TrafficTypeDiagnostic: AM0PR08MB4082:|AM0PR08MB4082:|PR2PR08MB4636:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR2PR08MB4636645D82F383B7B76818A5B3770@PR2PR08MB4636.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(199004)(189003)(86362001)(6306002)(6512007)(478600001)(66066001)(54906003)(110136005)(316002)(5660300002)(6486002)(966005)(14454004)(2171002)(2616005)(6436002)(25786009)(476003)(2201001)(14444005)(1076003)(6506007)(8936002)(386003)(99286004)(2906002)(4326008)(55236004)(102836004)(103116003)(256004)(66946007)(66556008)(66476007)(64756008)(66446008)(6116002)(3846002)(52116002)(26005)(81166006)(81156014)(8676002)(186003)(7736002)(486006)(71190400001)(71200400001)(36756003)(305945005)(50226002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4082;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YQNxvY1TyNPbjgLVrwD4W2Cl9fYqdTnz0++6QyG54AYDaPkIRgRhdKmBEqkLVaiqjGjKbMBqXRUrR0N2Bpd/c+geLJPrZgdbCqjt+TvAfAv2VvrUE6tuUQiNpdX/VeR79uRO92Ty7bdLJUFxwupaitqnvgcz7f3TZjC+4QjxdvHR2ojAQYjeMaj2F0Xi9h+ps5M4ZL1MZXpQyxcSxtRFKQSzNo1Xg8wlpj2Zlb00ocpVjZpwqS9G5T8Ryx88DWYK+dcXDRYa5DWRZPYeD18fTUpYcQ3TGDC7MMg9DB6v2iuPrBh0KsZXIkamB8rKj7Q/wfVNnKEeULzqqldTmfRN7Z6igBhoYXJ4OYI+EzyzK4BaVinJsthYn39BRQM03W1rhA15v0u525pxXUiAYMzgQrmKZmixbM/ACZIkHsgQazDlne4b7bRcmM/qGCVLNkzk
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(1110001)(339900001)(199004)(189003)(6306002)(99286004)(1076003)(70586007)(4326008)(2171002)(6506007)(386003)(54906003)(316002)(110136005)(70206006)(26005)(186003)(14444005)(105606002)(22756006)(102836004)(5660300002)(66066001)(47776003)(50466002)(478600001)(26826003)(2501003)(6116002)(3846002)(356004)(36906005)(25786009)(6486002)(6512007)(305945005)(7736002)(2616005)(36756003)(14454004)(966005)(23756003)(8936002)(8746002)(126002)(476003)(2906002)(486006)(50226002)(103116003)(8676002)(2201001)(81156014)(81166006)(86362001)(76130400001)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4636;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0907dd31-87d0-4095-d2bf-08d7675cb4fe
X-MS-Exchange-PUrlCount: 3
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnClBoPoLOmAla04aw1T772250VOzKKBRstwaSDtcDRuB/rmpKDF532lJQ3cpuf5zvT8nVJ75W5Xtru/xleBpczZO94D+EmOci9B6UwQJ8QsuLedwoqdyy4agu4o6Kaq0IpOvnAR2D3+F4r+qGKdbQbBYDoTYGH7Pd2NYXVAflvMtUEr1Pj2SuPYIFgAJTaKAX1uWYs/2O967rdMGrb99hl8EbH+IMDo2JHBBiSAXr4shZxYsVeQudLNJgw5fr5BhaUkm0cTec5YaVFiIEvxbQTUqUVR+fpRYmaitN2wRzFk3PJUVfmFaQY/0v9DkEeHw2RoB2xyBAOSVD/fLzsUjMcpn/mgZ3GOwO59STEZqZnUcCGJfiOqX+K1ra5+MdB1RNCLw+umsNYyHKgvbPmuBb4QcP55i2J5mkvuR0MNESlZXEKxYLqFXMgoHgXtnhUOx6N1MA9nz0CkwXpllHBH7LOWPMQbhm8aHbMsj7AgM5E=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 10:40:29.6953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f96e5d5-0224-4019-6d48-08d7675cbcc0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOrt6sxuikDY8QGRHGli7q4d5cAkxgKVtJe6VeR/bEY=;
 b=BYfthaSu9HHZ2+PaeV0/vpwllc7OFmiGAkfM+qBe2Sd6Gnwwz9ROP22yxllZDrBocRWPCUeR24n0tMrLGvqwShE3qUlaKmtAup2rU92vx6dyZ6CHEbCWuhdk2LDISkKivHFXu1vYvBVIiYWi5CfltDH5clfBdRV/9XWZgGZsal4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOrt6sxuikDY8QGRHGli7q4d5cAkxgKVtJe6VeR/bEY=;
 b=BYfthaSu9HHZ2+PaeV0/vpwllc7OFmiGAkfM+qBe2Sd6Gnwwz9ROP22yxllZDrBocRWPCUeR24n0tMrLGvqwShE3qUlaKmtAup2rU92vx6dyZ6CHEbCWuhdk2LDISkKivHFXu1vYvBVIiYWi5CfltDH5clfBdRV/9XWZgGZsal4=
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

VGhpcyBzZXJpZXMgYWN0dWFsbHkgYXJlIHJlZ3JvdXBlZCBmcm9tOgotIGRybS9rb21lZGE6IEVu
YWJsZSBsYXllci9wbGFuZSBjb2xvci1tZ210OgogIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvNjA4OTMvCgotIGRybS9rb21lZGE6IEVuYWJsZSBDUlRDIGNvbG9yLW1n
bXQKICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxMzcwLwoKRm9y
IHJlbW92aW5nIHRoZSBkZXBlbmRlbmNlIG9uOgotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvMzA4NzYvCgpMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgx
KToKICBkcm0va29tZWRhOiBBZGRzIGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gc3VwcG9ydCBm
b3IgRE9VLUlQUwoKamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDMpOgog
IGRybS9rb21lZGE6IEFkZCBhIG5ldyBoZWxwZXIgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1f
bigpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcygpCiAgZHJtL2tv
bWVkYTogQWRkIGRybV9jdG1fdG9fY29lZmZzKCkKCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNv
bnZlcnNpb24gZnVuY3Rpb24gczMxXzMyX3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNo
YXJlZCBoZWxwZXIuCgp2NDoKICBBZGRyZXNzIHJldmlldyBjb21tZW50cyBmcm9tIE1paGFpLCBE
YW5pZWwgYW5kIElsaWEuCgpWNToKLSBJbmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVl
IG9mIG0gKFFtLm4pLgotIFJlYmFzZSB3aXRoIGRybS1taXNjLW5leHQKCnY2OgogIEFsbG93cyBt
ID09IDAgYWNjb3JkaW5nIHRvIE1paGFpbCdzIGNvbW1lbnRzLgoKdjk6CiAgUmViYXNlCgpMb3dy
eSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgxKToKICBkcm0va29tZWRhOiBBZGRzIGdhbW1h
IGFuZCBjb2xvci10cmFuc2Zvcm0gc3VwcG9ydCBmb3IgRE9VLUlQUwoKamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDMpOgogIGRybTogQWRkIGEgbmV3IGhlbHBlciBkcm1f
Y29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkKICBkcm0va29tZWRhOiBBZGQgZHJtX2x1dF90b19m
Z2FtbWFfY29lZmZzKCkKICBkcm0va29tZWRhOiBBZGQgZHJtX2N0bV90b19jb2VmZnMoKQoKIC4u
Li9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDIwICsrKysrKwog
Li4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgNjYgKysrKysr
KysrKysrKysrKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5o
ICAgIHwgMTAgKystCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMu
YyAgfCAgMiArCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAg
fCAgMyArCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAg
NiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgICAgICAgICAgICAgIHwgMzUg
KysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAgICAgICAgICAgICAg
IHwgIDEgKwogOCBmaWxlcyBjaGFuZ2VkLCAxNDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
