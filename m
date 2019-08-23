Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2E9B7A6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 22:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB006ED36;
	Fri, 23 Aug 2019 20:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDC16ED35
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 20:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9h/mG2cez86qDX0mtZFjL+dPsGWVll3gXqePmg55d+GKdtorLPCPv+9SDBWZDzpDBxulbjouY2dv7EELfB/QGLisZQ8VPMFyK1F48S5+nuFA5aozW3v8Zs9Hsu6zNeJemJq/vkaDL3ZuYf3EeLbBGpnL0ELOHYc9dx+4ZTQvU6JFhjA7kA4asexYplMDCLJxj8u04ngeHD0MLi2vFq6OkM491smfrLJi+MOzoB+A3BvZu5UBxtsld2Y9fdJ4zNz7wQhkNvhHlqzadh+IhjWjB17pDZqtTBke0fGFd3lstqYnPDPawuu2wpVY8TBPlkwZKV7b4Y7wPkv44SO6e+SLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWaSj/iw7+/CYT4eoZmAhXg+sSYZ6blqzubtmABBqwo=;
 b=QEqZT1Vsq/ddbVMIZnxwEsNqXSMRFxsOr4s7Z4qVSdDbKQ0a+KFjxQCpZASROsjkE54oc5KF9WYzwpPTOF2Y4qjKws/riqhlJF0Es/ueCbv9P9WFNk1oTNAUtbvvIuWHt4CAowdKqS4da03uKFTK9GvswesAuQ9FsmFpeVifj4Cl0MX4FAC5ofV2ilxW+MKy2wDtnuxDtX2jxh4E4yz9FbfjfoiciHuvh1mDd5pwcjELiqzTRGwgvc3m6dP2pxklN3Ip1g82iub28SkEfUzPXlIK3ulE1wfsBmgyg85y0APp4nBdTYUpcTTI92DIbd0FR9qkaToOqXI3rNlj68N60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0037.namprd12.prod.outlook.com (2603:10b6:903:129::23)
 by MWHPR12MB1536.namprd12.prod.outlook.com (2603:10b6:301:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Fri, 23 Aug
 2019 20:28:12 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by CY4PR12CA0037.outlook.office365.com
 (2603:10b6:903:129::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Fri, 23 Aug 2019 20:28:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 23 Aug 2019 20:28:11 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 23 Aug 2019 15:28:11 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 0/5] DSC MST support in DRM
Date: Fri, 23 Aug 2019 16:28:04 -0400
Message-ID: <20190823202809.15934-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(199004)(189003)(2616005)(6666004)(50466002)(126002)(426003)(16586007)(36756003)(476003)(47776003)(26005)(2351001)(186003)(70586007)(48376002)(336012)(86362001)(70206006)(356004)(478600001)(51416003)(486006)(316002)(6916009)(305945005)(1076003)(49486002)(5660300002)(50226002)(81156014)(4326008)(8676002)(53936002)(8936002)(81166006)(4744005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1536; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5be7808-bece-44da-f887-08d728086b48
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1536; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1536:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1536694FC91EC0180FCB839DEFA40@MWHPR12MB1536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0138CD935C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fs638a1NJyEMlY7TuQ03FFMIz83TJ84JUpfimIuLlipwfV2d2/52Ed6+CHYhnaL8eaGNrg30c0iRFEoUT4iPI+6NVCAkYVd3lwSh162rp7MEyYlvjOyFE7bRjbwu5LIRmykZO52M7PdIepkw83T94+9l9R29fPfvQeDr8vNHncrHM3ms5xDhquIRpSg6euOxfnQX6D369BwDmRBxvfsoVbhoSZ6qQT1L0Grg8HDbViXBkH0vWaf5zhAfjCSKjPiN7T7UMPBesklmcrfOcG86uLUyUOpsPAZpHPh/b/SVtu49M1cl+LAM2ouT2R5vAUv2mHmAERCyKqL4ki57qVbDD1AsVefhV0RMViUOq23M5fe9xEUXoXJUUAEV/yG9d/YRMLmMc3DFjFetpk0IN2s4PCmAVZQmvrJBe5FKviId6eE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2019 20:28:11.9737 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5be7808-bece-44da-f887-08d728086b48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWaSj/iw7+/CYT4eoZmAhXg+sSYZ6blqzubtmABBqwo=;
 b=ZrXJN51GLuhWlJEau3h994aRCIyBcntULVdtC71oWuyKPOof4WHNkifI81QIfh1eoqqjtogCRrtI7BR4nPjYrJey+/V9JUNYkdyV86qxUTd/SkQMlND9kEGDuCw9BhfoDoln2pVUEThqAYofKi9LjrJq7PDRYc6ihX8JH25IDyI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5lY2Vzc2FyeSBzdXBwb3J0IGZvciBNU1QgRFNDLgooRGlzcGxheSBTdHJlYW0gQ29tcHJl
c3Npb24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQoKdjQ6IFNwbGl0IHBhdGNoc2V0IGFu
ZCByZWJhc2Ugb250byBkcm0tdGlwCnY1OiBDbGVhbiB1cCBmb3JtYXR0aW5nLCBtYWtlIG5ldyBx
dWlyawoKRGF2aWQgRnJhbmNpcyAoNSk6CiAgZHJtL2RwX21zdDogQWRkIFBCTiBjYWxjdWxhdGlv
biBmb3IgRFNDIG1vZGVzCiAgZHJtL2RwX21zdDogUGFyc2UgRkVDIGNhcGFiaWxpdHkgb24gTVNU
IHBvcnRzCiAgZHJtL2RwX21zdDogQWRkIE1TVCBzdXBwb3J0IHRvIERQIERQQ0QgUi9XIGZ1bmN0
aW9ucwogIGRybS9kcF9tc3Q6IEZpbGwgYnJhbmNoLT5udW1fcG9ydHMKICBkcm0vZHBfbXN0OiBB
ZGQgaGVscGVyIGZvciBmaW5kaW5nIHJpZ2h0IGF1eCB0byBlbmFibGUvcXVlcnkgRFNDCgogLi4u
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAgICAgICB8ICAzMiArKy0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgfCAxNjcgKysrKysrKysr
KysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICAg
fCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyAgICAgICB8
ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHBfbXN0LmMgICAgICAgIHwg
ICAyICstCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAg
IDcgKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgICA4
ICstCiA5IGZpbGVzIGNoYW5nZWQsIDIwNCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkK
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
