Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1BB93C8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 17:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4C26FD34;
	Fri, 20 Sep 2019 15:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50085.outbound.protection.outlook.com [40.107.5.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233086FD34
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 15:13:23 +0000 (UTC)
Received: from VE1PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:803:104::28)
 by VI1PR0801MB1791.eurprd08.prod.outlook.com (2603:10a6:800:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.21; Fri, 20 Sep
 2019 15:13:17 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VE1PR08CA0015.outlook.office365.com
 (2603:10a6:803:104::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Fri, 20 Sep 2019 15:13:17 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Fri, 20 Sep 2019 15:13:16 +0000
Received: ("Tessian outbound 55d20e99e8e2:v31");
 Fri, 20 Sep 2019 15:13:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cde9029c192f773
X-CR-MTA-TID: 64aa7808
Received: from 39f800606a31.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A7B99B7-D9A7-40FC-B7A0-D593564F94C9.1; 
 Fri, 20 Sep 2019 15:13:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39f800606a31.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 20 Sep 2019 15:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrNo9lENFewbZKtyUyLVJp+DFeA44nNNqvT89clT55H18bnKBlFrqiBVjw3XBZ0m+QIZQxKtmE9DjRnIl4mhg/BkMt1dVu0Jo9R2ce7NROx8NFWecEPSiEAnMbh10bXf/g/IkQtGAbH557Ob/3jCvVr4ud/pZXpjEbc3bH5uBOWBBxYGhP12FBjVix7nALq/l83O9JuqJyvGWuS8BEXtALDQKfBHaJlZ8o5BYKasDY2skF/X+gwWYXbfV3JkoxjBf3bff6jc1czfzgpfAfcBKoPU8Asuo+pMzrTgfxg9berVuZWfDUz9ir6EAQROHP4i9FK/iXs63ikg47Q7HNKM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OYJOJuPXA6yB6I/WI2dRcfUzMgHWMkgvuo1vjf6P8g=;
 b=i9Qiya58VbjaOxIz+cqB5Uss4QhHy3bA81XntiqKgw2gfw9da5rFgUN9jEoag8gpYgmBZRKRux6Nhnc07IUc9Hz9vx3PO3QEWo8Bbx4a92f1atbuBNOm6sNvgGP/2+iCz+AzMPep3H5HNXdUJcf+QllwTE0o4Ankj1IC7OtpcZqYYvEjXV7FR1C0VAQemV1HhhQqOlgq3eFnmMSHLsRmGdXqMHD4sYLq3kgCNCryqirZolIEq+LxahLb0rh4a9dSTNxsx6Xg+TmJ1F/h6MpzcNSG1H+ucztoxsAAPy/L9fqE7ZiBQyuYLhq7DZBlqKnB5fZQoXqmN7X8COft/CwVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3486.eurprd08.prod.outlook.com (20.177.59.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 15:13:08 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f%7]) with mapi id 15.20.2263.023; Fri, 20 Sep 2019
 15:13:08 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/komeda: Use IRQ_RETVAL shorthand in d71_irq_handler
Thread-Topic: [PATCH] drm/komeda: Use IRQ_RETVAL shorthand in d71_irq_handler
Thread-Index: AQHVb8XpefZcvGvZNkuWrwlyThjxiA==
Date: Fri, 20 Sep 2019 15:13:08 +0000
Message-ID: <20190920151247.25128-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P123CA0043.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::31)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 050e33e2-8f6c-49c0-21cf-08d73ddd102d
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3486; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3486:|VI1PR08MB3486:|VI1PR0801MB1791:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB17911F9B8F946612E60FEFE58F880@VI1PR0801MB1791.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
x-forefront-prvs: 0166B75B74
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(199004)(189003)(478600001)(71200400001)(66066001)(476003)(256004)(486006)(25786009)(2616005)(305945005)(7736002)(5640700003)(6486002)(14444005)(36756003)(6512007)(6436002)(6916009)(71190400001)(14454004)(8676002)(81156014)(2906002)(4326008)(8936002)(2351001)(44832011)(81166006)(50226002)(4744005)(2501003)(86362001)(99286004)(316002)(6116002)(66476007)(3846002)(5660300002)(52116002)(386003)(1076003)(66446008)(102836004)(186003)(66946007)(64756008)(66556008)(54906003)(6506007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3486;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: hCQsvnu/medACvQiMwB60m5pCNXda8usqpgYu5l89Z5okjxTU2TQ4JOjBAUMq2cGqpA/XMXAE3fznJyhYacdMw3BfM2aBLzYEsjBwy+KbgVTewGXVQUzcoyhU6AAwchp4IQ45rtjicRMN1nW3B8iCK0fWOOo6QGsxyuzDlR+7bVBXGttexc1pHmcaz0qKS/lug8VX4teFbl4L6pss6dgkedoWa43IZ6mqfOgIyylnpjzGuvpAAKQJcghBH3yWbDNFtvzAeE2qoqWX9K1SUXeMi35pguLe5uU9F67YVMx4WqXC03MugkgcSMbNzt1S59ZocNa6Wg1Qs44tTs32+4H/1iENGp6pXaBpz6tn3FhsWi3UdRlIUcvdLRTKZJASDctU2noSeD18ffk9czPxrXZcAaFItT1+pcnndrQEXvgAKs=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3486
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(6512007)(36906005)(107886003)(8746002)(316002)(70586007)(70206006)(63350400001)(54906003)(76130400001)(23756003)(356004)(6506007)(386003)(66066001)(26005)(50226002)(102836004)(50466002)(81166006)(47776003)(2351001)(81156014)(36756003)(8676002)(99286004)(6116002)(486006)(2501003)(3846002)(2906002)(186003)(336012)(22756006)(25786009)(6486002)(126002)(7736002)(14444005)(4326008)(14454004)(305945005)(1076003)(26826003)(86362001)(478600001)(6916009)(476003)(5640700003)(8936002)(2616005)(4744005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1791;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8d390d60-e8ff-4185-611f-08d73ddd0b68
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0801MB1791; 
NoDisclaimer: True
X-Forefront-PRVS: 0166B75B74
X-Microsoft-Antispam-Message-Info: fKPCdTWc8c0+s9ZBAnps/dtb4vCCnB1uM9XzM7sYqTCVo0fcFh/lfqzKSQz2e+cWNBfz5Or7yo0xiiMqWl5WoeEvhQ3eZeCSf6hfDP7yrni8snk+CC2/ZjCEo5VyEjDA5ttRIiY6nNuPt7Tr9XkS5Q8KD7a3gCj9OJHsXzBw9IG/DY06kxuBK4cgXg5DeMDafrPMjYgyhyhLIRqXS4cF1xWtj0m4I17+/jIjCCdOKq9uTyu5ggHngSYUUiufriB1RYwyw5Nnqj25M2tFMinZnM1lbaIrSh5sPJGU60dcJ6q3hl00CCMK2SqUjTPU4BrKZEKhYZdy+qLhu/7ZPi5/mI5f9epJl7yFw273gM/1ekPGlk6A7VfcRfPbEGBtjReSjFcAh69sS+lANqdn09bGpWD2bwdjWL7Yav/EYL2lC2U=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2019 15:13:16.3273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050e33e2-8f6c-49c0-21cf-08d73ddd102d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1791
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OYJOJuPXA6yB6I/WI2dRcfUzMgHWMkgvuo1vjf6P8g=;
 b=nBYnjbHQ1TZO0qkVsQlWxHusxKBd82ChbmJwMHdexItuVj8sssmppgG1hl50+VxV/An7qn9cpcUTqX5XLxT5ufISdhPhnMXM947pLyrXPJEByjMH4orrdDY8F96gxa0sGsymA5M+PUQ5UQ0/wlsz80remcpxyabBlWlyPL547Zo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OYJOJuPXA6yB6I/WI2dRcfUzMgHWMkgvuo1vjf6P8g=;
 b=nBYnjbHQ1TZO0qkVsQlWxHusxKBd82ChbmJwMHdexItuVj8sssmppgG1hl50+VxV/An7qn9cpcUTqX5XLxT5ufISdhPhnMXM947pLyrXPJEByjMH4orrdDY8F96gxa0sGsymA5M+PUQ5UQ0/wlsz80remcpxyabBlWlyPL547Zo=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gY2hhbmdlIGluIGJlaGF2aW91cjsgSVJRX1JFVFZBTCBpcyBhYm91dCB0d2ljZSBhcyBwb3B1
bGFyIGFzCm1hbnVhbGx5IHdyaXRpbmcgb3V0IHRoZSB0ZXJuYXJ5LgoKU2lnbmVkLW9mZi1ieTog
TWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwppbmRleCBkNTY3YWI3ZWQzMTQu
LjFiNDIwOTU5NjllNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9kZXYuYwpAQCAtMTk1LDcgKzE5NSw3IEBAIGQ3MV9pcnFfaGFuZGxlcihzdHJ1
Y3Qga29tZWRhX2RldiAqbWRldiwgc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpCiAJaWYgKGdj
dV9zdGF0dXMgJiBHTEJfSVJRX1NUQVRVU19QSVBFMSkKIAkJZXZ0cy0+cGlwZXNbMV0gfD0gZ2V0
X3BpcGVsaW5lX2V2ZW50KGQ3MS0+cGlwZXNbMV0sIGdjdV9zdGF0dXMpOwogCi0JcmV0dXJuIGdj
dV9zdGF0dXMgPyBJUlFfSEFORExFRCA6IElSUV9OT05FOworCXJldHVybiBJUlFfUkVUVkFMKGdj
dV9zdGF0dXMpOwogfQogCiAjZGVmaW5lIEVOQUJMRURfR0NVX0lSUVMJKEdDVV9JUlFfQ1ZBTDAg
fCBHQ1VfSVJRX0NWQUwxIHwgXAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
