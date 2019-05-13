Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E43F1B33B
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 11:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCA189AEB;
	Mon, 13 May 2019 09:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810057.outbound.protection.outlook.com [40.107.81.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7C89AEB;
 Mon, 13 May 2019 09:53:14 +0000 (UTC)
Received: from SN1PR12CA0083.namprd12.prod.outlook.com (2603:10b6:802:21::18)
 by BYAPR12MB2662.namprd12.prod.outlook.com (2603:10b6:a03:69::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.20; Mon, 13 May
 2019 09:53:13 +0000
Received: from CO1NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by SN1PR12CA0083.outlook.office365.com
 (2603:10b6:802:21::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Mon, 13 May 2019 09:53:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT051.mail.protection.outlook.com (10.152.80.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 09:53:12 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 04:53:10 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 1/7] addr cs chunk for syncobj timeline
Date: Mon, 13 May 2019 17:52:59 +0800
Message-ID: <20190513095305.14110-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(4744005)(126002)(50226002)(1076003)(486006)(476003)(8936002)(86362001)(186003)(2616005)(70206006)(72206003)(53936002)(316002)(77096007)(70586007)(26005)(36756003)(47776003)(336012)(5660300002)(356004)(68736007)(426003)(2906002)(16586007)(478600001)(6666004)(305945005)(50466002)(48376002)(53416004)(4326008)(81166006)(54906003)(81156014)(7696005)(8676002)(110136005)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2662; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2655dbd-87c3-4e63-fe10-08d6d788cfeb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2662; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2662:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26626046DD5DAD397A4041FFB40F0@BYAPR12MB2662.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: imizr17V8Ti9INPaNQ/9k4E26Tp8pEFAeAA5bqfqVMnB2rVCcnu0/E1qzA53i0oeOoaMv1Xm77/mHt4txYVMMHDiRAPxRZ4oUl0Qw5dIAN7vxO8uWmUyAmrc1yRypuxFij0CZx2wDazMQejyCEZqyHq4GOo2fyHyBN1d8DjJg2H/g9XoNHqKvvxWO0BhMILsf0HAAJRQk4qU4v1zjJyTR7YDirH08XQd5OAwUhQL+0H2xcfL4GvCnrOb96LwjxlldolDUtBA9eu4sqTCU2mLa+GQnBiD01jABnLdZ2hh/fARC4bJfi/STWhpFxFbG0GBzYcOQRZ+utVhn/Ua4wxbHkiACaq9lXF+WhVNL30BfqGSZTP1gcTqbrHoOH9RqOYhpLOBgiU4u4UglpcuAJV6ZJsdDEPIzBEqVfmO/QIn7FE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 09:53:12.1175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2655dbd-87c3-4e63-fe10-08d6d788cfeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOHRlHHZ+DypBrmpA4L/KP9xtGw9nwsTjEvzOHVhQiA=;
 b=jDTZ9FkCriyUR3cFovD1mkH5Z5Wj5IBrJr2kq8SfDRfX7UA85VJnZRUSvFFT7zIeoyh5rzD6OvC9tgrILP8Ws4HsMqwIOUDYWgDoGAcG9uXMsW49FC0n6zyWwJdEL4W9czETQObQ/PAMJTOyD6Gsp7Oc/Oi0WsKESMVxhHFK5WQ=
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
