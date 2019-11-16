Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F4FF5FF
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940336E270;
	Sat, 16 Nov 2019 22:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78E16E1ED;
 Sat, 16 Nov 2019 22:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igBG8F8yZKSBvWyZbmE3Cm5l1Wro5LqE5lJJygMv0+4wfyd8JWuyyfPnDL9NCJyHz9vTdJfgYSKaelGZ/erEDRP3dqd9zU7XAV/ob0CcWNer5LnjRJZxXDMiWUSlF8L8PBLACPo/S+aYu+CpPU+VMIKEEos2LscC4+h1iIZNgo3OMcbEND8Xl6z0w2crAB/CPerFTsFjJ5F38W39VTAsPwpzEmeGBiiaWP1FUn0caLg6/f9fGG5LVMdhzTPNEWjl0MxbLrUbLsv2XE3C7PP8zyHgSXVXcWk7UF1g/6E9iXD5H3QLEF6oNue2nyFThhOnP5G3opyU+Eg6593TvpLoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7tRPK+iip7jp7gTIgzLFG4hMyHc/UqLL3TzNXoaJjk=;
 b=e5AO+vD/YIUhZvl4bYKOPRznrKqbTQJvW/CPwMfi74AtuSGAVVzZnqLExVak748wXPNkycU4AmVUWpAzL/MNXUsnisIdbju21XZipMBqrmj23AsDHvn/tt0ul55pDNePLw/aNti0rqhXS9ZCXs5OZB48U7HUihIqPnxKvQlcRc2fiMovzUzXjZbueS0GqQxmwUMNUmlSs8jgx2G+D53SK0lqDVcExOf6ViNfjrbioUoYa1DThvQ0vGZSx6KU45fiN812HOPlKnXAgjHVV1KM0eKnPbLUACoF22QjEooRzfngRL48DT3U4r0iapgbr1FyI85K6MhVXndVGmXivC6Jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by DM5PR1201MB0010.namprd12.prod.outlook.com
 (2603:10b6:3:e3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.29; Sat, 16 Nov
 2019 22:01:39 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:37 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:37 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:37 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 11/17] drm/dp_mst: Add DSC enablement helpers to DRM
Date: Sat, 16 Nov 2019 17:01:22 -0500
Message-ID: <20191116220128.16598-12-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(428003)(199004)(189003)(8936002)(426003)(70586007)(478600001)(2876002)(476003)(14444005)(70206006)(47776003)(2616005)(305945005)(186003)(53416004)(11346002)(446003)(486006)(356004)(6666004)(7696005)(76176011)(126002)(26005)(51416003)(336012)(2906002)(5660300002)(6916009)(50226002)(36756003)(50466002)(2351001)(4326008)(1076003)(48376002)(81166006)(316002)(8676002)(16586007)(81156014)(86362001)(54906003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0010; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 209276d0-7475-4898-9d28-08d76ae08e6c
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0010:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0010F6D64BC56A882527CCCFE4730@DM5PR1201MB0010.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 74ywBDhqbYv3bXuUPV/rNFwHkGQRskrhzaotpeqFdSnhH5ptDsbMG3sRwAaDQPCa9x6dMkFhRThZIIOWTP0Vzg2qGL8CXHqGc+9Ec2krctgW+9fvu1hOiXHoXcG6dJ2lexlxzDFUuRjrP8uhFxX3FtfRiWJmKKjQ5NRY3MYCPM2PJyfJZ7c4NoS+9JkjyS1FUFeijQ1S3MZHtTK1Z+MCl5dDZc4bdLR3ENSgvM7LgPzXme8C2y+9wCXs7n6R/YC6+1P33LuayEJIZvOa5Sp9zJ57hHrq8/ow7vUPpEJ2lmyP81LlbZbtsXFIcJB06hEsoeMc0vjdq8v0DMM8wy8vhKiF+QOqlrwTslNOcGWjnffDDGmPp8qpc51dCBeMQboc2nlR/6bKrx7ZB0evhIvB9wEWojnDyYQLxQywbcqm/ulfxz9KBpbkoLur8S+MspCw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:38.9314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 209276d0-7475-4898-9d28-08d76ae08e6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0010
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7tRPK+iip7jp7gTIgzLFG4hMyHc/UqLL3TzNXoaJjk=;
 b=ADt++C13jygK1RAh+KicCzhXiBq9oJwBdjFC6/O4yO/T8EFpzFAet4aqWkMW647VcIAQGeCe+CAsidGrG/FLUtFWQSS5X/gqWMQVjWDkHSWVAIDa6PwRteCA4AEilwsOYJ+CWZDTEV2VQi1kTqJeFTCuGyP1B6qxLjmhkPkZ0u8=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKQWRkaW5nIGEgaGVs
cGVyIGZ1bmN0aW9uIHRvIGJlIGNhbGxlZCBieQpkcml2ZXJzIG91dHNpZGUgb2YgRFJNIHRvIGVu
YWJsZSBEU0Mgb24KdGhlIE1TVCBwb3J0cy4KCkZ1bmN0aW9uIGlzIGNhbGxlZCB0byByZWNhbGN1
bGF0ZSBWQ1BJIGFsbG9jYXRpb24KaWYgRFNDIGlzIGVuYWJsZWQgYW5kIHJhaXNlIHRoZSBEU0Mg
ZmxhZyB0byBlbmFibGUuCkluIGNhc2Ugb2YgZGlzYWJsaW5nIERTQyB0aGUgZmxhZyBpcyBzZXQg
dG8gZmFsc2UKYW5kIHJlY2FsY3VsYXRpb24gb2YgVkNQSSBzbG90cyBpcyBleHBlY3RlZCB0byBi
ZSBkb25lCmluIGVuY29kZXIncyBhdG9taWNfY2hlY2suCgp2Mjogc3F1YXNoIHNlcGFyYXRlIGZ1
bmN0aW9ucyBpbnRvIG9uZSBhbmQgY2FsbCBpdCBwZXIKcG9ydAoKQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA2MSArKysrKysrKysr
KysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAg
fCAgNSArKysKIDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDk0YmIyNTlhYjczZS4uOThjYzkzZDVkZGQ3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTM4NzYsNiArMzg3Niw2NyBA
QCBkcm1fZHBfbXN0X2F0b21pY19jaGVja190b3BvbG9neV9zdGF0ZShzdHJ1Y3QgZHJtX2RwX21z
dF90b3BvbG9neV9tZ3IgKm1nciwKIAlyZXR1cm4gMDsKIH0KIAorLyoqCisgKiBkcm1fZHBfbXN0
X2F0b21pY19lbmFibGVfZHNjIC0gU2V0IERTQyBFbmFibGUgRmxhZyB0byBPbi9PZmYKKyAqIEBz
dGF0ZTogUG9pbnRlciB0byB0aGUgbmV3IGRybV9hdG9taWNfc3RhdGUgCisgKiBAcG9pbnRlcjog
UG9pbnRlciB0byB0aGUgYWZmZWN0ZWQgTVNUIFBvcnQKKyAqIEBwYm46IE5ld2x5IHJlY2FsY3Vs
YXRlZCBidyByZXF1aXJlZCBmb3IgbGluayB3aXRoIERTQyBlbmFibGVkCisgKiBAcGJuX2Rpdjog
RGl2aWRlciB0byBjYWxjdWxhdGUgY29ycmVjdCBudW1iZXIgb2YgcGJuIHBlciBzbG90CisgKiBA
ZW5hYmxlOiBCb29sZWFuIGZsYWcgZW5hYmxpbmcgb3IgZGlzYWJsaW5nIERTQyBvbiB0aGUgcG9y
dAorICoKKyAqIFRoaXMgZnVuY3Rpb24gZW5hYmxlcyBEU0Mgb24gdGhlIGdpdmVuIFBvcnQKKyAq
IGJ5IHJlY2FsY3VsYXRpbmcgaXRzIHZjcGkgZnJvbSBwYm4gcHJvdmlkZWQKKyAqIGFuZCBzZXRz
IGRzY19lbmFibGUgZmxhZyB0byBrZWVwIHRyYWNrIG9mIHdoaWNoCisgKiBwb3J0cyBoYXZlIERT
QyBlbmFibGVkCisgKgorICovCitpbnQgZHJtX2RwX21zdF9hdG9taWNfZW5hYmxlX2RzYyhzdHJ1
Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCisJCQkJIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQg
KnBvcnQsCisJCQkJIGludCBwYm4sIGludCBwYm5fZGl2LAorCQkJCSBib29sIGVuYWJsZSkKK3sK
KwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqbXN0X3N0YXRlOworCXN0cnVjdCBk
cm1fZHBfdmNwaV9hbGxvY2F0aW9uICpwb3M7CisJYm9vbCBmb3VuZCA9IGZhbHNlOworCWludCB2
Y3BpID0gMDsKKworCW1zdF9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X21zdF90b3BvbG9neV9zdGF0
ZShzdGF0ZSwgcG9ydC0+bWdyKTsKKworCWlmIChJU19FUlIobXN0X3N0YXRlKSkKKwkJcmV0dXJu
IFBUUl9FUlIobXN0X3N0YXRlKTsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkocG9zLCAmbXN0X3N0
YXRlLT52Y3BpcywgbmV4dCkgeworCQlpZiAocG9zLT5wb3J0ID09IHBvcnQpIHsKKwkJCWZvdW5k
ID0gdHJ1ZTsKKwkJCWJyZWFrOworCQl9CisJfQorCisJaWYgKCFmb3VuZCkgeworCQlEUk1fREVC
VUdfQVRPTUlDKCJbTVNUIFBPUlQ6JXBdIENvdWxkbid0IGZpbmQgVkNQSSBhbGxvY2F0aW9uIGlu
IG1zdCBzdGF0ZSAlcFxuIiwKKwkJCQkgcG9ydCwgbXN0X3N0YXRlKTsKKwkJcmV0dXJuIC1FSU5W
QUw7CisJfQorCisJaWYgKHBvcy0+ZHNjX2VuYWJsZWQgPT0gZW5hYmxlKSB7CisJCURSTV9ERUJV
R19BVE9NSUMoIltNU1QgUE9SVDolcF0gRFNDIGZsYWcgaXMgYWxyZWFkeSBzZXQgdG8gJWQsIHJl
dHVybmluZyAlZCBWQ1BJIHNsb3RzXG4iLAorCQkJCSBwb3J0LCBlbmFibGUsIHBvcy0+dmNwaSk7
CisJCXZjcGkgPSBwb3MtPnZjcGk7CisJfQorCisJaWYgKGVuYWJsZSkgeworCQl2Y3BpID0gZHJt
X2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsIHBvcnQtPm1nciwgcG9ydCwgcGJuLCBw
Ym5fZGl2KTsKKwkJRFJNX0RFQlVHX0FUT01JQygiW01TVCBQT1JUOiVwXSBFbmFibGluZyBEU0Mg
ZmxhZywgcmVhbGxvY2F0aW5nICVkIFZDUEkgc2xvdHMgb24gdGhlIHBvcnRcbiIsCisJCQkJIHBv
cnQsIHZjcGkpOworCQlpZiAodmNwaSA8IDApCisJCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwlw
b3MtPmRzY19lbmFibGVkID0gZW5hYmxlOworCisJcmV0dXJuIHZjcGk7Cit9CitFWFBPUlRfU1lN
Qk9MKGRybV9kcF9tc3RfYXRvbWljX2VuYWJsZV9kc2MpOwogLyoqCiAgKiBkcm1fZHBfbXN0X2F0
b21pY19jaGVjayAtIENoZWNrIHRoYXQgdGhlIG5ldyBzdGF0ZSBvZiBhbiBNU1QgdG9wb2xvZ3kg
aW4gYW4KICAqIGF0b21pYyB1cGRhdGUgaXMgdmFsaWQKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCmlu
ZGV4IGZjMTkwOTRiMDZjMy4uYjFiMDBkZTMwODNiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9k
cm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgK
QEAgLTQzMSw2ICs0MzEsNyBAQCBzdHJ1Y3QgZHJtX2RwX3BheWxvYWQgewogc3RydWN0IGRybV9k
cF92Y3BpX2FsbG9jYXRpb24gewogCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7CiAJaW50
IHZjcGk7CisJYm9vbCBkc2NfZW5hYmxlZDsKIAlzdHJ1Y3QgbGlzdF9oZWFkIG5leHQ7CiB9Owog
CkBAIC02NjMsNiArNjY0LDEwIEBAIGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCSAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X3Rv
cG9sb2d5X21nciAqbWdyLAogCQkJICAgICAgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwg
aW50IHBibiwKIAkJCSAgICAgIGludCBwYm5fZGl2KTsKK2ludCBkcm1fZHBfbXN0X2F0b21pY19l
bmFibGVfZHNjKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKKwkJCQkgc3RydWN0IGRy
bV9kcF9tc3RfcG9ydCAqcG9ydCwKKwkJCQkgaW50IHBibiwgaW50IHBibl9kaXYsCisJCQkJIGJv
b2wgZW5hYmxlKTsKIGludCBfX211c3RfY2hlY2sKIGRybV9kcF9hdG9taWNfcmVsZWFzZV92Y3Bp
X3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCQkgc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
