Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBF5FD40
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F186E3C6;
	Thu,  4 Jul 2019 19:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4526E3BF;
 Thu,  4 Jul 2019 19:06:28 +0000 (UTC)
Received: from BN8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:60::22)
 by BN8PR12MB2849.namprd12.prod.outlook.com (2603:10b6:408:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 4 Jul
 2019 19:06:27 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0009.outlook.office365.com
 (2603:10b6:408:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.17 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:25 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:21 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/nouveau: Use connector kdev as aux device parent
Date: Thu, 4 Jul 2019 15:05:13 -0400
Message-ID: <20190704190519.29525-5-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(86362001)(2870700001)(8676002)(81166006)(81156014)(426003)(11346002)(50226002)(446003)(5660300002)(68736007)(53936002)(4744005)(49486002)(76176011)(486006)(8936002)(47776003)(1076003)(476003)(51416003)(2616005)(356004)(6666004)(126002)(36756003)(4326008)(336012)(2906002)(77096007)(26005)(54906003)(48376002)(14444005)(316002)(2876002)(110136005)(305945005)(72206003)(478600001)(186003)(70586007)(70206006)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2849; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f326c6e9-8fa0-4f03-856e-08d700b2b659
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB2849; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB2849:
X-Microsoft-Antispam-PRVS: <BN8PR12MB284971AE11308A7AD029229882FA0@BN8PR12MB2849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mekOEeCpLNS1e8BO/hImfgK+K43PaW9+0GfMPlv43JNFRb63BTlBCHpzgfJWFhoM27+YYefSU9Ahd8H9JX/iC/7wCTVYDBgGHpyOWku7SlsGU0ynCnhpeNOT1O8R9G8qnrngJz1D1CdlWdSfVailRusTRJTEl2YrX6V3in88PU84V/vmB55odSFtfqMXMUDFIjvZY/y1cKmaX5dhY4QE61vu7TILp6xjUxpvwvwvpoRfGRrSLNHDUEuY+OaaMKz37N4uRmnsBPrqA/nmXo1UflrQDoFLR4SCHlae9s0D0EwyTiA8ivHmUo9S4R9bdY8uMm2ggBI/LnWx/276+RVxZJ9bXhW1BcuN2GRE+TPc9F9yrqDUb697y5ziQ6rZLhg/UhImjMfYl63d2olszKRzbMADYNnZ4xs575OkPIBkh+Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:25.6748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f326c6e9-8fa0-4f03-856e-08d700b2b659
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cETKXBe2JhrNZoq6j4UwZscJQJyW6UwVltMrHrXS2HU=;
 b=mvdF06f9D3lyewza6mEG4WNooJvk7mBrLgy5QCMXN9u/CLuC21pJgzUehfSRJdVFmv9yR6Z/jKDBz8XGA8Lw2J4hKqdeoEePvZ+vPPI5ABV547ijjARBK5UqdJYAmU05y1QgRFes63mfrI0IzOaPOS9V1RkwU+QD/Dguc+82m78=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
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
Cc: Leo Li <sunpeng.li@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCmluZGV4IDQxMTZlZTYyYWRhZi4uZTMy
ZGVmMDllZjg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nv
bm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9y
LmMKQEAgLTEzNDYsNyArMTM0Niw3IEBAIG5vdXZlYXVfY29ubmVjdG9yX2NyZWF0ZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAogCQlicmVhazsKIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNw
bGF5UG9ydDoKIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFA6Ci0JCW52X2Nvbm5lY3Rvci0+
YXV4LmRldiA9IGRldi0+ZGV2OworCQludl9jb25uZWN0b3ItPmF1eC5kZXYgPSBjb25uZWN0b3It
PmtkZXY7CiAJCW52X2Nvbm5lY3Rvci0+YXV4LnRyYW5zZmVyID0gbm91dmVhdV9jb25uZWN0b3Jf
YXV4X3hmZXI7CiAJCXNucHJpbnRmKGF1eF9uYW1lLCBzaXplb2YoYXV4X25hbWUpLCAic29yLSUw
NHgtJTA0eCIsCiAJCQkgZGNiZS0+aGFzaHQsIGRjYmUtPmhhc2htKTsKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
