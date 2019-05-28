Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446992CF33
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 21:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE916E060;
	Tue, 28 May 2019 19:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8776E045;
 Tue, 28 May 2019 19:09:15 +0000 (UTC)
Received: from DM5PR12CA0012.namprd12.prod.outlook.com (2603:10b6:4:1::22) by
 DM5PR1201MB0059.namprd12.prod.outlook.com (2603:10b6:4:54::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Tue, 28 May 2019 19:09:14 +0000
Received: from CO1NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM5PR12CA0012.outlook.office365.com
 (2603:10b6:4:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.17 via Frontend
 Transport; Tue, 28 May 2019 19:09:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT012.mail.protection.outlook.com (10.152.80.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Tue, 28 May 2019 19:09:13 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 28 May 2019
 14:09:12 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] drm/amd/display: Add HDR output metadata support for
 amdgpu
Date: Tue, 28 May 2019 15:08:34 -0400
Message-ID: <20190528190836.10738-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(51416003)(68736007)(186003)(7696005)(356004)(305945005)(6666004)(8676002)(16586007)(450100002)(316002)(81166006)(8936002)(2906002)(86362001)(50226002)(54906003)(81156014)(110136005)(478600001)(426003)(36756003)(44832011)(486006)(476003)(2616005)(126002)(77096007)(53416004)(26005)(53936002)(72206003)(70586007)(4744005)(1076003)(47776003)(5660300002)(4326008)(48376002)(70206006)(50466002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0059; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6d66b41-3ab0-4115-ad49-08d6e39ff93d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0059; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0059:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0059FECF87B0AC7D3AFD4044EC1E0@DM5PR1201MB0059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: X98vLXUx8lyIdhf8dqw8S/JReSEIOtnLB25INUNlAh4TCXBb+XMn4hm8I7Yvg9f+RD/9XCj10ASkfr3o/LbQlSMIExnfH0zgfwt6RFkfu2wEQ5+wjqe5a7JK+JWO2cmC7010E9HMBdmJkAvyjaOBiKoe1XYjg5L0gmYUJae6uyioS+IHcq6WnR9Ovtf/j9bj6bI4TSC7t70WGNYEoWMCN/5t0ogSxc/ZmxGpNbYFTCCplkuWIHXHFaykXj7JPAC4q5V1N3+QphTB8wid/fUKhxA4MrBuneN9auvJM46E8k1qnZHZ4thhphyBJp76YG7V/4DjvTaIKYFrjWTVCDCfG6+ZtLZIGgmnEeLXiixWIVrSuTfBl9mKR5bT6iwGgXZlo5uEYHa0vjZGhsGySbM8HwoRSwCVCwBKMrEQdKaN38Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 19:09:13.8436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d66b41-3ab0-4115-ad49-08d6e39ff93d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrhhiXOLreOXYIEm+bb437IIYLhFcLPFJRYtdhg6E0U=;
 b=z9e8WEZmGCfAMROo7LzzidAN/78j7NU9QfdsOclZyVJkYrCilp8C3h3qg4biqfiBK0djw1/ruO0BQZjGmC08rbPgM25d3dlwY/Hfq1SGG9mJK6G3k5tGmldoqpn1kkCoOrFh1d4urChTkicUZtTKUhPentKtuu1eUokFTRsajTY=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlcyBIRFIgb3V0cHV0IG1ldGFkYXRhIHN1cHBvcnQgaW4g
YW1kZ3B1IHVzaW5nIHRoZQpEUk0gSERSIGludGVyZmFjZSBtZXJnZWQgaW4gZHJtLW1pc2MtbmV4
dC4gRW5hYmxlZCBmb3IgRENFIGFuZCBEQ04gQVNJQ3MKb3ZlciBEUCBhbmQgSERNSS4KCkl0J3Mg
bGltaXRlZCB0byBzdGF0aWMgSERSIG1ldGFkYXRhIHN1cHBvcnQgZm9yIG5vdyBzaW5jZSB0aGF0
J3MgYWxsIHRoZQpEUk0gaW50ZXJmYWNlIHN1cHBvcnRzLiBJdCByZXF1aXJlcyBhIG1vZGVzZXQg
Zm9yIGVudGVyaW5nIGFuZCBleGl0aW5nIEhEUgpidXQgdGhlIG1ldGFkYXRhIGNhbiBiZSBjaGFu
Z2VkIHdpdGhvdXQgb25lLgoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgoKTmljaG9sYXMgS2F6bGF1c2thcyAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBFeHBvc2Ug
SERSIG91dHB1dCBtZXRhZGF0YSBmb3Igc3VwcG9ydGVkIGNvbm5lY3RvcnMKICBkcm0vYW1kL2Rp
c3BsYXk6IE9ubHkgZm9yY2UgbW9kZXNldHMgd2hlbiB0b2dnbGluZyBIRFIKCiAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxNTUgKysrKysrKysrKysrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgMTUxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
