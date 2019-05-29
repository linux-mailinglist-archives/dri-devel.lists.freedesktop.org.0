Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E22DFBD
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 16:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFD46E334;
	Wed, 29 May 2019 14:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679866E334;
 Wed, 29 May 2019 14:29:48 +0000 (UTC)
Received: from CY4PR12CA0039.namprd12.prod.outlook.com (2603:10b6:903:129::25)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17; Wed, 29 May
 2019 14:29:47 +0000
Received: from DM3NAM03FT044.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by CY4PR12CA0039.outlook.office365.com
 (2603:10b6:903:129::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Wed, 29 May 2019 14:29:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT044.mail.protection.outlook.com (10.152.82.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Wed, 29 May 2019 14:29:46 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 29 May 2019 09:29:45 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/sched: Fix make htmldocs warnings.
Date: Wed, 29 May 2019 10:29:40 -0400
Message-ID: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(4744005)(336012)(478600001)(53416004)(426003)(2616005)(50466002)(86362001)(48376002)(126002)(70586007)(70206006)(5660300002)(476003)(44832011)(68736007)(356004)(6666004)(486006)(2201001)(36756003)(72206003)(8676002)(305945005)(110136005)(316002)(16586007)(47776003)(53936002)(8936002)(2906002)(4326008)(50226002)(77096007)(26005)(51416003)(7696005)(186003)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 279fc4be-fe06-4569-b820-08d6e4421982
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12796A7E83656AB43A1789E3EA1F0@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-Forefront-PRVS: 0052308DC6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZiNCVfvgoYeEvQtXEOFEVwy4nklEZkXvQO0e1DfTEFbbqdozKFTOuBtjmaMzOijiDNltYKBjxb3nnFQ2GDp16ijRxCuYfqeTLzdJY/IREfpRPpqIZKp9bx3u7hzKiz1wt7flHerbrdyJumYFZJpVQllX5YF7F6Dyep3TEwTXZepJHCI5f2CpsAvdqnFO/3zhwe34OhdfW7wXZz+xiPtckZ3OUhm+capw1UQQnZph5Ner9YiC8xjsqRdBXHclhHH6sr1vOLWTGPHuNOpA0vWE7W6TO7fs+LJLZkd/BnRgPvW53nFdHiXWzWY0ZSAbrEw4Z2jTGTR09oaElYv71DbJQLOnEm1OjwQzApy0/4Tk2uvsisHUEe983hN4Qzb3bod+PMfanLwwkRE/RkqloAT78kT5js5FvITfDS7Ohj3MttY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2019 14:29:46.4033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 279fc4be-fe06-4569-b820-08d6e4421982
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRx8Ikx4BtOmOriHAKteJSJHMAW0V7BLeobHoSdz4bg=;
 b=C7gcDNJ8R0+MSN8+WYomviyCnCGmVMx4CKP+z0OXU19bS+DSn2yvcxNsObv7L17908XCl/tQrqJ7U0OnQbhhV5m1Fxrw2QwmLRRwMpy1FaE5WaIzXqR2NkH9Y9s6y7iHirKOfpFDBvzT48IUh9gH+5xFTv1eE1Ei6Gj7nsreYMc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=permerror action=none header.from=amd.com;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYwppbmRleCA0OWU3ZDA3Li5jMTA1OGVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYwpAQCAtMzUzLDYgKzM1Myw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3Nj
aGVkX2luY3JlYXNlX2thcm1hKTsKICAqIGRybV9zY2hlZF9zdG9wIC0gc3RvcCB0aGUgc2NoZWR1
bGVyCiAgKgogICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UKKyAqIEBiYWQ6IGpvYiB3aGlj
aCBjYXVzZWQgdGhlIHRpbWUgb3V0CiAgKgogICogU3RvcCB0aGUgc2NoZWR1bGVyIGFuZCBhbHNv
IHJlbW92ZXMgYW5kIGZyZWVzIGFsbCBjb21wbGV0ZWQgam9icy4KICAqIE5vdGU6IGJhZCBqb2Ig
d2lsbCBub3QgYmUgZnJlZWQgYXMgaXQgbWlnaHQgYmUgdXNlZCBsYXRlciBhbmQgc28gaXQncwpA
QCAtNDIyLDYgKzQyMyw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX3N0b3ApOwogICogZHJt
X3NjaGVkX2pvYl9yZWNvdmVyeSAtIHJlY292ZXIgam9icyBhZnRlciBhIHJlc2V0CiAgKgogICog
QHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UKKyAqIEBmdWxsX3JlY292ZXJ5OiBwcm9jZWVkIHdp
dGggY29tcGxldGUgc2NoZWQgcmVzdGFydAogICoKICAqLwogdm9pZCBkcm1fc2NoZWRfc3RhcnQo
c3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCwgYm9vbCBmdWxsX3JlY292ZXJ5KQotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
