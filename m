Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE778EBE28
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 07:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76F96F717;
	Fri,  1 Nov 2019 06:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727136F717
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 06:54:25 +0000 (UTC)
Received: from VI1PR0802CA0036.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::22) by HE1PR0801MB1788.eurprd08.prod.outlook.com
 (2603:10a6:3:88::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Fri, 1 Nov
 2019 06:54:21 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR0802CA0036.outlook.office365.com
 (2603:10a6:800:a9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.19 via Frontend
 Transport; Fri, 1 Nov 2019 06:54:20 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 06:54:20 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 01 Nov 2019 06:54:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27ccc1771b6db4c7
X-CR-MTA-TID: 64aa7808
Received: from 342a855bf8bd.2 (cr-mta-lb-1.cr-mta-net [104.47.12.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89644E4E-0FCB-43A1-92BA-E04135A9C2D9.1; 
 Fri, 01 Nov 2019 06:54:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 342a855bf8bd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Nov 2019 06:54:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSaHuYlcqiw1WhwdFABg0ouu6zfXknHmL3nCwwH8ShUgTwoKM1LBWaczD6ySZscWYrBvKtVTOUQaTkjUKnlJtjJ3IckrMbKxDMnM3w+bEwmsXnmvu+rK1QUqklGFqy5l16MVWNFJfgIGCu23MOE3Exo42wsF/xou6BFkT78UOBr9NG258JaygACueJFNwYG6Dbm0txQpNK1M8X6Trtxddic72fpMp5xEVnp/PfL2GHlxPPvuNxknSLiQHd9MN8fDozXVT1FgWDLbZM6iRdG2MkpNVB03nUVrVSSDWUUB07I8ZZJklgI1Hmso+aU8OgiASj5QBXm6D/I6Ow/PVRZuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=cif8TLhpGae9vvoB/yRbA9Pf1Iowi4P78+/7lNc+xN5do6P8Bl2VTyHIk5ovhlXby9Fxn5r9EcfRl/y736/m7lZ9nY6yZs0NU/EoF+MtiEobS04PvQNk8t8/UGZm0GDji4qwbbmmikqD6vctb+3EOJxRxSrzfjhA7qvwVHHZrFVMo7SEEx+gsVpiqSKFFqg46qn8EsRVxOT7ZOs1FwMI2Ht/QJ05x4eIcoaiXAK274z7+3VRe2sDngD+lnrG7Bs4Seif/bWTSdS9L2StUmtWHgXgh+t30oL7X6K9BncN9qxMSBrl+BFZf9gmTZUEmJejiwhiD9cfBCKRvVhUO3tuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1SPR01MB0002.eurprd08.prod.outlook.com (20.179.193.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 06:54:11 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2387.030; Fri, 1 Nov 2019
 06:54:11 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v8 4/4] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH v8 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVkIEqK7frcEGc3kG9AqJwM+vaIw==
Date: Fri, 1 Nov 2019 06:54:10 +0000
Message-ID: <20191101065319.29251-5-james.qian.wang@arm.com>
References: <20191101065319.29251-1-james.qian.wang@arm.com>
In-Reply-To: <20191101065319.29251-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c3e6a63b-12a1-4d38-c37d-08d75e98528b
X-MS-TrafficTypeDiagnostic: VE1SPR01MB0002:|VE1SPR01MB0002:|HE1PR0801MB1788:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1788F7DDF29F8F6DA3622BC4B3620@HE1PR0801MB1788.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
x-forefront-prvs: 020877E0CB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(66066001)(446003)(11346002)(2616005)(486006)(36756003)(8676002)(14454004)(5660300002)(476003)(103116003)(2501003)(2171002)(86362001)(3846002)(6116002)(305945005)(2201001)(25786009)(1076003)(6512007)(66476007)(52116002)(71200400001)(71190400001)(386003)(55236004)(6506007)(6436002)(102836004)(6486002)(7736002)(14444005)(186003)(99286004)(8936002)(110136005)(4326008)(54906003)(50226002)(478600001)(64756008)(2906002)(66446008)(81156014)(66556008)(316002)(66946007)(81166006)(76176011)(256004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1SPR01MB0002;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BNzzA4Kjin9yYjpGXKXnDDkrSkKd1qyeprWHxOBFS9bmohvVVDQUwWUX7hqhN4z7HScNODUPMrXRBy+EgV4T3zQzOlcEd62SJ8koRshI0VZrsvV/aW3OC7ma/OG8rCbpGmmIxfvtmc5N6mdFMHOOXKtux/2zBwO3SER83brFu8QA4bhmX7p4ofvYjrUXVh2piZS5y2BQeRk4hhEUaCq0gcdfoTqZT3QiqVTzCpn/hCVeN1tSKWrZAlhub60zO2N9i2TU6yU5xEigNRxhEhl0tUL6MCoFHYTarHBBRhYlj4frk2iKkMVvtTZz33PkgU4S+7BtgL1rjz65yAOzWyEZWqp9HB/HtZ8Qj9LXqJFcNMoJoq8yrz1jnB2b0tSEZdPDbV3yWM+u+ruF2X/lkJ+/JAS8Okm46D2/KxrlnR0MIHW668oTjTvtz6V2Hl7CwOmS
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1SPR01MB0002
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(1110001)(339900001)(199004)(189003)(81156014)(26826003)(8676002)(81166006)(478600001)(105606002)(14454004)(6486002)(25786009)(50226002)(36906005)(26005)(54906003)(23756003)(8936002)(8746002)(99286004)(6512007)(70206006)(4326008)(70586007)(76176011)(110136005)(2171002)(316002)(76130400001)(386003)(36756003)(6506007)(102836004)(50466002)(186003)(1076003)(22756006)(7736002)(2906002)(66066001)(47776003)(2501003)(305945005)(86362001)(14444005)(2201001)(336012)(5660300002)(486006)(476003)(103116003)(126002)(3846002)(2616005)(6116002)(11346002)(446003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1788;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c1abd58-5aa8-4e1a-e3a1-08d75e984c64
NoDisclaimer: True
X-Forefront-PRVS: 020877E0CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhcCqIQApXNZDLh89O3Kd6BX1alrfDsr+p22SMkFuUi6Cnb67h4hNiwa1bzQEs3w+XUgyAk202QqXA9DuEvXpxHu8pZ8w0Mky6ecOm3ZkubV5fM/b0h9WMwjzVkwZ7BfinFmbY+R1fesSmDU0nzgdJFQP/yGJlEh8VMabxXphfFBsXygnzm1V0hbVrvR9oHug4P3HzDtwxlKCPRfZjD5G2LtRGykQ+hMOwnadkzFC+moNYwBwnyL0wwyCMur8UTCEzMsT9g99nlRLc3Zdjx5r1PuhVdlXu1cg0ezTq75+aP0OpYTb6WRfLKnMCKjhGoNrJurVn5SBfg+t5mAscTRnHbDYYQDG+ACq15zESbCgpLcqGIaegRxgQB3eOYevIfW/CPfj2vDcxO1A9adDRca8Zg2S6qJVojQXMfH+sWIVShrldvoD4k0v4qqRPMjCr3E
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 06:54:20.8074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e6a63b-12a1-4d38-c37d-08d75e98528b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1788
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=4XZkux5NumDAb2H8tdwo3YGExFmR5M8cPoEUTp5y6rDG9SrQBdFP93+qytUdQrGIiMaASVsz9L4H0hRQFd84porZY2rG9Fc4tack8klNVHH/Z1J+yDIUdpiWU4M654pOJvXwA/JsQGkYJjJ+DTOYF6qK9CicLDinw/dl+ENxG08=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQq3bHNRrYQiNPP2nRVJpod47h6p3GxLvGsKKnTnHo=;
 b=4XZkux5NumDAb2H8tdwo3YGExFmR5M8cPoEUTp5y6rDG9SrQBdFP93+qytUdQrGIiMaASVsz9L4H0hRQFd84porZY2rG9Fc4tack8klNVHH/Z1J+yDIUdpiWU4M654pOJvXwA/JsQGkYJjJ+DTOYF6qK9CicLDinw/dl+ENxG08=
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
cnkubGlAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbT4KLS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgMiArKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKysrCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgNiArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYwppbmRleCBmMGJhMjZlMjgyYzMuLmI2NTE3YzQ2ZTY3MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYwpAQCAtMTA0NCw3ICsxMDQ0LDkgQEAgc3RhdGljIGludCBkNzFfbWVyZ2Vy
X2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRl
KHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAogCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21w
b25lbnRfc3RhdGUgKnN0YXRlKQogeworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9
IHN0YXRlLT5jcnRjLT5zdGF0ZTsKIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0
b19pbXByb2Nfc3Qoc3RhdGUpOworCXN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUgPSB0b19kNzFf
cGlwZWxpbmUoYy0+cGlwZWxpbmUpOwogCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7CiAJdTMy
IGluZGV4LCBtYXNrID0gMCwgY3RybCA9IDA7CiAKQEAgLTEwNTUsNiArMTA1NywyNCBAQCBzdGF0
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
