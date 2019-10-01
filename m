Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D4C3A30
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FCD6E849;
	Tue,  1 Oct 2019 16:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770085.outbound.protection.outlook.com [40.107.77.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70056E842;
 Tue,  1 Oct 2019 16:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgKckMM9LOysJyLZZqPhjaoUHHPDth/2wnnu6D4Dfmu8eU5sptZ7QDvydFyLSXk2ALBZlLEpjYeOL1NQOA1gGXDmoWsDMKPSkYk5T7CiS3mhLlnU4Dv3YGyl22+Pc6KkYYL+JAQ6V9uOBe7XuQGUlWo9ZuT/pDmJgIOE9WUyJ/vCX28EMSGzxekACpPH8MKKVI9nPNQqAvUVb9fZIEkmHnBbC3kcpojKDzlVHoQWDfVtf7NXX/c+WNJPpBE1pq7SKP0Kq3FaEMzEX9hrKOaiAsgpK3GmwVV0AVyrjdXtImXHWe863FOBqE8lup9t9eW3wY62q8j8jn+JE0W/i3dlxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXqrtHfQSPxaiufbVLII6yj6EQPhb5eti3WsBg3LExw=;
 b=OBpQmLJwOY+QoU06ymFDJyd12M4otcBSyqml3rgQ4nZ0RznvpnJ+drFeJnnvShhsZRqNGsv5V+h5omgiK3JDCfUH25rTVMgW626NXZjJpS2C3RVO795tCLSK9bDgpRDRz1cVezLR8nQPAFboINpbWuRkxnI1+OqAubnTQs4KQtmE4fPvtYyFUz6ujxDCIUtSoQhJEz070goHruKyB7OpX/bo2hXfZHqZtcxl8rXbrLou58p9zTnjoIIRLoH4q/ZflOblZiqRpdPDX4jPhi4BSYM7AK7TgoSPz5bolBUYqGiizLq7uPQQgpVqrCjkAuqXSDkieKBuXvim7F7OekT4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:208:a8::35)
 by BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 16:17:27 +0000
Received: from CO1NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MN2PR12CA0022.outlook.office365.com
 (2603:10b6:208:a8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.22 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT013.mail.protection.outlook.com (10.152.80.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:26 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:24 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 00/14] DSC MST support for AMDGPU
Date: Tue, 1 Oct 2019 12:17:07 -0400
Message-ID: <20191001161721.13793-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(428003)(189003)(199004)(450100002)(86362001)(6916009)(5660300002)(4326008)(316002)(16586007)(54906003)(2876002)(305945005)(2906002)(47776003)(51416003)(7696005)(356004)(478600001)(50226002)(48376002)(8936002)(70586007)(70206006)(81166006)(81156014)(8676002)(1076003)(14444005)(6666004)(53416004)(486006)(2616005)(126002)(2351001)(476003)(36756003)(426003)(50466002)(186003)(336012)(26005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4148; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a2b4c2e-07d4-4a65-afa2-08d7468ad9d6
X-MS-TrafficTypeDiagnostic: BY5PR12MB4148:
X-Microsoft-Antispam-PRVS: <BY5PR12MB414827F858E77563DF213B0DE49D0@BY5PR12MB4148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrVu9tu9awM2yn521s+mOAh4YGnlLg6Zv0gjelVUYkN8j7B0PMWi/6oCGflugL0ZAXyU3drl5wJjQpZbsav8OnmZ7Z0WMHiUHA5+mzpSGeAugCsY+EnuZYTVyw3nq/8nK0GIlrZ+6y1p3SdpcK2/SMORps6Zzl8jQ+fKvSrKSAGIThxXqGsEt+ikfvGQEKI6Fck+qi6lZZgXquekz7wa83e+VJ5LVO7TSJP9SODsPz8TvnrHvE5FUMmPW7M4NnQrLg+HKdwl2vqXmuFfbhqHMmbQ1jlQziIJzU5eJk++/8nDlrfHXNqx4vV1yoF3ZayqBdQF4+rzqf9qReXU5MsQFQSWS0ZbWGYpGQoj1DhKhZ7fytKsICD3R2gNm7FVXOhcN03vKReKXgcQhJF/da6E9jORcHz6X1LzGzrRhdUtawk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:26.8439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2b4c2e-07d4-4a65-afa2-08d7468ad9d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXqrtHfQSPxaiufbVLII6yj6EQPhb5eti3WsBg3LExw=;
 b=T/7RNv/BVWEe44/ImjWGnt/74ZXTT34mX6zpPlwyPemqr9fxTxRaB51ahUfoREfRO+rEw8MgExMPg1eS1Ucjxm4ND+QZx3xMJqFmBGj58nv/gw/L1Z8ckizsUCHxdhzcX2ziB2RSYMg3k3ceBVlbjXsogWTzb0rEUwB5hUfx74w=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKVGhpcyBzZXQgb2Yg
cGF0Y2hlcyBpcyBhIGNvbnRpbnVhdGlvbiBvZiBEU0MgZW5hYmxlbWVudApwYXRjaGVzIGZvciBB
TURHUFUuIFRoaXMgc2V0IGVuYWJsZXMgRFNDIG9uIE1TVC4gSXQgYWxzbwpjb250YWlucyBpbXBs
ZW1lbnRhdGlvbiBvZiBib3RoIGVuY29kZXIgYW5kIGNvbm5lY3RvcgphdG9taWMgY2hlY2sgcm91
dGluZXMuCgpGaXJzdCAxMiBwYXRjaGVzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIG11bHRpcGxl
Cml0ZXJhdGlvbnMgdG8gdGhlIG1haWxpbmcgbGlzdCBiZWZvcmUuIFRoZXNlIHBhdGNoZXMgd2Vy
ZQpkZXZlbG9wZWQgYnkgRGF2aWQgRnJhbmNpcyBhcyBwYXJ0IG9mIGhpcyB3b3JrIG9uIERTQy4K
Ck90aGVyIDIgcGF0Y2hlcyBhZGQgYXRvbWljIGNoZWNrIGZ1bmN0aW9uYWxpdHkgdG8KZW5jb2Rl
ciBhbmQgY29ubmVjdG9yIHRvIGFsbG9jYXRlIGFuZCByZWxlYXNlIFZDUEkKc2xvdHMgb24gZWFj
aCBzdGF0ZSBhdG9taWMgY2hlY2suIFRoZXNlIGNoYW5nZXMKdXRpbGl6ZSBuZXdseSBhZGRlZCBk
cm1fbXN0X2hlbHBlciBmdW5jdGlvbnMgZm9yCmJldHRlciB0cmFja2luZyBvZiBWQ1BJIHNsb3Rz
LgoKdjI6IHNxdWFzaGVkIHByZXZpb3VzbHkgMyBzZXBhcmF0ZSBhdG9taWMgY2hlY2sgcGF0Y2hl
cywKc2VwYXJhdGUgYXRvbWljIGNoZWNrIGZvciBkc2MgY29ubmVjdG9ycywgdHJhY2sgdmNwaSBh
bmQKcGJuIG9uIGNvbm5lY3RvcnMuCgpEYXZpZCBGcmFuY2lzICgxMik6CiAgZHJtL2RwX21zdDog
QWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1vZGVzCiAgZHJtL2RwX21zdDogUGFyc2UgRkVD
IGNhcGFiaWxpdHkgb24gTVNUIHBvcnRzCiAgZHJtL2RwX21zdDogQWRkIE1TVCBzdXBwb3J0IHRv
IERQIERQQ0QgUi9XIGZ1bmN0aW9ucwogIGRybS9kcF9tc3Q6IEZpbGwgYnJhbmNoLT5udW1fcG9y
dHMKICBkcm0vZHBfbXN0OiBBZGQgaGVscGVycyBmb3IgTVNUIERTQyBhbmQgdmlydHVhbCBEUENE
IGF1eAogIGRybS9kcF9tc3Q6IEFkZCBuZXcgcXVpcmsgZm9yIFN5bmFwdGljcyBNU1QgaHVicwog
IGRybS9hbWQvZGlzcGxheTogVXNlIGNvcnJlY3QgaGVscGVycyB0byBjb21wdXRlIHRpbWVzbG90
cwogIGRybS9hbWQvZGlzcGxheTogSW5pdGlhbGl6ZSBEU0MgUFBTIHZhcmlhYmxlcyB0byAwCiAg
ZHJtL2FtZC9kaXNwbGF5OiBWYWxpZGF0ZSBEU0MgY2FwcyBvbiBNU1QgZW5kcG9pbnRzCiAgZHJt
L2FtZC9kaXNwbGF5OiBXcml0ZSBEU0MgZW5hYmxlIHRvIE1TVCBEUENECiAgZHJtL2FtZC9kaXNw
bGF5OiBNU1QgRFNDIGNvbXB1dGUgZmFpciBzaGFyZQogIGRybS9hbWQvZGlzcGxheTogVHJpZ2dl
ciBtb2Rlc2V0cyBvbiBNU1QgRFNDIGNvbm5lY3RvcnMKCk1pa2l0YSBMaXBza2kgKDIpOgogIGRy
bS9hbWQvZGlzcGxheTogQWRkIE1TVCBhdG9taWMgcm91dGluZXMKICBkcm0vYW1kL2Rpc3BsYXk6
IFJlY2FsY3VsYXRlIFZDUEkgc2xvdHMgZm9yIG5ldyBEU0MgY29ubmVjdG9ycwoKIC4uLi9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDE3OSArKysrKysrCiAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggfCAgIDcgKwogLi4uL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgIDYzICstLQogLi4uL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwgNDQ5ICsrKysrKysrKysr
KysrKysrLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaCAgIHwg
ICA0ICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyAgICB8ICAg
MyArCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyAgfCAgIDMg
KwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgICA3ICst
CiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmggfCAgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgICAgICAgICAgICAgIHwgIDEyICstCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jICAgICAgICAgICAgICAgfCAgMzMgKy0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgICAgICAgICB8IDE3NCArKysrKyst
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICAgfCAgIDMgKy0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyAgICAgICB8ICAgMyArLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHBfbXN0LmMgICAgICAgIHwgICAyICstCiBp
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAgIDcgKwogaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgICA4ICstCiAxNyBm
aWxlcyBjaGFuZ2VkLCA4ODUgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pCgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
