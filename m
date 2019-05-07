Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6F162DD
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 13:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC6C89B33;
	Tue,  7 May 2019 11:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810073.outbound.protection.outlook.com [40.107.81.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C306E7A7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 11:34:07 +0000 (UTC)
Received: from SN1PR12CA0085.namprd12.prod.outlook.com (2603:10b6:802:21::20)
 by DM6PR12MB3482.namprd12.prod.outlook.com (2603:10b6:5:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Tue, 7 May
 2019 11:34:06 +0000
Received: from DM3NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by SN1PR12CA0085.outlook.office365.com
 (2603:10b6:802:21::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 11:34:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT025.mail.protection.outlook.com (10.152.82.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 11:34:05 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 06:34:04 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 1/7] addr cs chunk for syncobj timeline
Date: Tue, 7 May 2019 19:33:53 +0800
Message-ID: <20190507113359.16387-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(4326008)(54906003)(1076003)(2351001)(47776003)(53936002)(316002)(16586007)(72206003)(53416004)(4744005)(5660300002)(70206006)(70586007)(6666004)(356004)(51416003)(8676002)(86362001)(6916009)(77096007)(26005)(186003)(7696005)(48376002)(426003)(50466002)(305945005)(68736007)(476003)(478600001)(2906002)(8936002)(81166006)(81156014)(50226002)(36756003)(336012)(486006)(2616005)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3482; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55493767-a2fb-4946-bcb7-08d6d2dfe97a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB3482; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3482:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3482817D34568793B64B4008B4310@DM6PR12MB3482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QGMW2T8L93F4AHHDeKlUJTFYG5rLvmNB6ZEnJfNNp/IbvLM7chny/d9p+NaQUPxE+/CcL+doNHieBZpfj3MDti3AhIt+vsbexW8VxanEYiyrHHKej7QvE7dCWpncCsLvi3MbBwFbRzCQlr8RESOAF8WqqqKNUx0mXgo5WxSOAxfAMhcjbfDskG+IymNq8xIieImcGnp4JtuapcYXKhXLrpSnipjgiJ7Fot33DxDDSzVGd2Bi9nppmKrr+AZfT7A6Sjrtx7QxRWySPoBRLat8gDLyriAlFQzEAI++mS/p/B0TMIJPsuXrxr4/FxGZ0NgiEw6nmJ9MWJdz8qnU6QqZX9bq4vWYAGZr5OcNOL+QzL6mjwbLj138RwcWKFcWy39vNmIN0BiJZANzmNfq42XIY8CmhmyCQu2fyV78yTu1/qs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 11:34:05.4367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55493767-a2fb-4946-bcb7-08d6d2dfe97a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3482
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOHRlHHZ+DypBrmpA4L/KP9xtGw9nwsTjEvzOHVhQiA=;
 b=sS5uxwfHZylsSmFfrUrWbmcK82CvKNvcFrZdp2fL54VCPD/Ju4J4M72INZ+qf7RO/oIPldP4osPnmMK1z7U6kkSsizGlt4TUQpvdTCypC7nAIFxrpgO7ogkDCT7s2LpRGIz2ORYYlOxY47Z/JB2hoqrJ2SwrxbzNceb9Vs5noEQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KLS0tCiBp
bmNsdWRlL2RybS9hbWRncHVfZHJtLmggfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaCBiL2lu
Y2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAppbmRleCBkMDcwMWZmYy4uM2QwMzE4ZTYgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL2RybS9hbWRncHVfZHJt
LmgKQEAgLTUyOCw2ICs1MjgsOCBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fdmEgewogI2RlZmlu
ZSBBTURHUFVfQ0hVTktfSURfU1lOQ09CSl9PVVQgICAgIDB4MDUKICNkZWZpbmUgQU1ER1BVX0NI
VU5LX0lEX0JPX0hBTkRMRVMgICAgICAweDA2CiAjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9TQ0hF
RFVMRURfREVQRU5ERU5DSUVTCTB4MDcKKyNkZWZpbmUgQU1ER1BVX0NIVU5LX0lEX1NZTkNPQkpf
VElNRUxJTkVfV0FJVCAgICAweDA4CisjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9TWU5DT0JKX1RJ
TUVMSU5FX1NJR05BTCAgMHgwOQogCiBzdHJ1Y3QgZHJtX2FtZGdwdV9jc19jaHVuayB7CiAJX191
MzIJCWNodW5rX2lkOwpAQCAtNjA4LDYgKzYxMCwxMyBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9jc19j
aHVua19zZW0gewogCV9fdTMyIGhhbmRsZTsKIH07CiAKK3N0cnVjdCBkcm1fYW1kZ3B1X2NzX2No
dW5rX3N5bmNvYmogeworCV9fdTMyIGhhbmRsZTsKKwlfX3UzMiBmbGFnczsKKwlfX3U2NCBwb2lu
dDsKK307CisKKwogI2RlZmluZSBBTURHUFVfRkVOQ0VfVE9fSEFORExFX0dFVF9TWU5DT0JKCTAK
ICNkZWZpbmUgQU1ER1BVX0ZFTkNFX1RPX0hBTkRMRV9HRVRfU1lOQ09CSl9GRAkxCiAjZGVmaW5l
IEFNREdQVV9GRU5DRV9UT19IQU5ETEVfR0VUX1NZTkNfRklMRV9GRAkyCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
