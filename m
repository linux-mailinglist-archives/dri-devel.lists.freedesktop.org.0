Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C72F8DA3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C9E6E12B;
	Tue, 12 Nov 2019 11:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93776E12B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:10:06 +0000 (UTC)
Received: from VI1PR08CA0202.eurprd08.prod.outlook.com (2603:10a6:800:d2::32)
 by VI1PR0802MB2173.eurprd08.prod.outlook.com (2603:10a6:800:a2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Tue, 12 Nov
 2019 11:10:02 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0202.outlook.office365.com
 (2603:10a6:800:d2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.23 via Frontend
 Transport; Tue, 12 Nov 2019 11:10:02 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 11:10:02 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Tue, 12 Nov 2019 11:09:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f627c228f40903a
X-CR-MTA-TID: 64aa7808
Received: from 9f68840dfd37.1 (cr-mta-lb-1.cr-mta-net [104.47.13.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5EF64857-DDAD-4E5E-9E93-CD9DBD241507.1; 
 Tue, 12 Nov 2019 11:09:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f68840dfd37.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Nov 2019 11:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbIs3nBrVNerzE9iH9gLlEw25OIgvyhjWcKc2U7Io6mEICflPr7OFOjwDG0gPx3IGhlc+UA6CDVnv6b/BVUitRYScJtvcCTPDWiu5z6qjeIxYxnW0+hcXY3Y9xQ7VZmOmeQgUvRZshVQyXL5e/gGKUgHsjERH/ccHZQc9nDXx3X3qgSHaBXW4juZEiQlQ6235eL5oeJHg2UW8lzUoXwZv2tD/poBfxf3r0SVdM4ySBlZZheY1kSnbpt9TYbq/6AJarLWBW4dZtJIbL0jjxF4JacuVYrLb8cx8WFnSTnI549owFfNCQBYiAMQyV168PCypXKsGWDe4f1uw1wjFgB9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsZ15Yl+X1HBg9E+9H28CUeamfDtYCZbnyRDQ7bPAes=;
 b=blo76NZTHjwpLFXXZn8oyNGzRXzrfTT/q9/0a/jq9ukd1qnkYMi6HrXxHKX0tI7WwKLykgrCXFJTCERnMFNsakt9ZUPJmV5sByAqaV0HUQg/zTkdKtzcTiCUxIgI9pabRo50rqfLOC+MuH2+1iDNIfs6T4cQfLxXLLe8Y32vlxzMer77KuL5miisw1fMZCb7EV/1HbhYc87bo17X7WG9hXjZtkLC7AovDjmkwSnWZe9KiNT9Fcj1Qkj0PGOVq5xc6Fz80+cInpNKd9HJuNfWa5I9WlbavXTPs7ErkDdx5JPtdADbVXPDOuNdXdhYLKVK3UPCvaxofK+qpGiLrKGU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB4481.eurprd08.prod.outlook.com (20.179.36.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 11:09:50 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 11:09:50 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v10 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v10 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVmUmzadJRLQDUbEqKWZFNceLR8Q==
Date: Tue, 12 Nov 2019 11:09:50 +0000
Message-ID: <20191112110927.20931-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fc4b46f-1ee0-4bcb-deaa-08d76760dd4d
X-MS-TrafficTypeDiagnostic: AM0PR08MB4481:|AM0PR08MB4481:|VI1PR0802MB2173:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2173B74811DBEC0BB90C4423B3770@VI1PR0802MB2173.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(66066001)(110136005)(486006)(8676002)(476003)(81166006)(81156014)(8936002)(103116003)(1076003)(2616005)(186003)(86362001)(2501003)(54906003)(305945005)(25786009)(7736002)(71200400001)(71190400001)(14454004)(256004)(55236004)(36756003)(966005)(316002)(478600001)(14444005)(2171002)(52116002)(102836004)(6486002)(66556008)(50226002)(66476007)(66946007)(6506007)(2906002)(66446008)(386003)(6116002)(3846002)(2201001)(26005)(5660300002)(4326008)(99286004)(6512007)(6306002)(6436002)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4481;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rCmpBL2rLFr67aSbp1R7RJ2zXtrvEnsSbLkuGa7XvZ1637/pGIpG2r/iZXsJe++j4p1zhgFPex1ZzUPTGLLnUecJ8tsyvQm42mETYoZlqI73agPl4ecFgBwj69J7Xwrm5kjfh6fVdLJPAFVnDtRAi/kGSHiGym28CTzo8E6frcbf5Mh++l8SiagNvGgP6UoYIS4/HoNoDzd7tiB2Bz5CP5F41umYAwOxC9HdEVfy8RW3LoPDjgx9Wy6/hM5y3QIXU7rMxiNNmiI2Hhne3HB9+t5xpONyCXEITwaYMyONZ8Vd9HBz1KHGHdRXj91rKqdiljX6nmGwvpTA2Dz4Ep/+1DSSaAgKKpAfPbPT5hyaWVcglTeyHPl2jvxOUqWMX19TVFkTOqxfu+VOebVopgzj8bL5nc7aFOMGLRdNYYxt17dhLr8A1mHHHIPVUZGpAuLs2Gs/Sx4fgppkSZDy398QkUFvabYugYxBNQkil2XPZHE=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4481
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(1110001)(339900001)(199004)(189003)(336012)(102836004)(22756006)(23756003)(6506007)(386003)(316002)(6116002)(476003)(14444005)(2616005)(486006)(36906005)(126002)(356004)(3846002)(1076003)(76130400001)(70586007)(70206006)(110136005)(6306002)(54906003)(6512007)(2201001)(86362001)(5660300002)(305945005)(7736002)(966005)(2906002)(81166006)(8746002)(81156014)(8676002)(50226002)(26826003)(8936002)(478600001)(105606002)(6486002)(14454004)(47776003)(2171002)(36756003)(50466002)(2501003)(26005)(103116003)(186003)(25786009)(99286004)(4326008)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2173;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 364e61cc-bbf5-4f01-f6d1-08d76760d5f5
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LD+YmMwlYcwKnwQy6AiMAGmSpvsJcplvLhHs62VD8xH9ruBXgwWUGu5B7yo+vE855v0NusHXDZ8TZBNdn1KQ8yghh3oiWR8zpZrpt39Ka8oiMsoyQRabAOylsdE9ZcHjUwsnMML3h7z0q/zdzNdgelIU1jWhnN+XRpXFkrUN7sVDwQb5tITjul7Bt9bzbXcky60psDmppVAqD/YS6142xNGxOcn/3v1OxnkYRpJ/Wq6x1ERhvKm9KLteDRu3bkxQ1pcY9dud3tIofSlaQM0Si8iQ2exJiIFXFI8+b4mfmUs9BH3uRJc8Stbh391XtBRqUJlc+DmgpNAZFt1xnM4Riqu29uuvHeJdI7GOwz+MxOy5o8bRNzpTjMdU5NzZzQRHT8vFE4vae3etx2YXc8+mr7NFbrGwFMcbulGwiZcFEwHgxGo3MXYsPL+6NxIJpsrzkIwxjZb3iq9yz7IdD+8gkW5Mom9tmLLQcWFpYO++JC8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 11:10:02.2462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc4b46f-1ee0-4bcb-deaa-08d76760dd4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsZ15Yl+X1HBg9E+9H28CUeamfDtYCZbnyRDQ7bPAes=;
 b=C3yI/m+teFH3O8aDpWSawTGcGCMtsi3LHv/FshxuMHOCiY8gsKv/tcwoHofkr25aTQTlJEuNF3m0QnBQ53TsY+iS2OgUn3TCLptWeL+AJq9aqatwPirN7ksQRmm8UfyeS/rbMbcUf7OHUB1MWRScySgUkwbPEqk9O5mMJOranUQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsZ15Yl+X1HBg9E+9H28CUeamfDtYCZbnyRDQ7bPAes=;
 b=C3yI/m+teFH3O8aDpWSawTGcGCMtsi3LHv/FshxuMHOCiY8gsKv/tcwoHofkr25aTQTlJEuNF3m0QnBQ53TsY+iS2OgUn3TCLptWeL+AJq9aqatwPirN7ksQRmm8UfyeS/rbMbcUf7OHUB1MWRScySgUkwbPEqk9O5mMJOranUQ=
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
NiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgICAgICAgICAgICAgIHwgMzQg
KysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAgICAgICAgICAgICAg
IHwgIDEgKwogOCBmaWxlcyBjaGFuZ2VkLCAxNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
