Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28966FF5FB
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0C66E25E;
	Sat, 16 Nov 2019 22:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800071.outbound.protection.outlook.com [40.107.80.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8F96E1F2;
 Sat, 16 Nov 2019 22:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1wWHLJf6EfbFHJkIVHRjcq80Mjv4IJRQt0bNYvBATIMkyWo3i9B1HKEIbNZfxBesnzxevmjt6fHSzu4g8H0Cy/IeSdYtrLke3ETenoaF6/Cl8ZxLpDMmfJfEhbAr/PhHCf3JM1YOYqRKd1H4DtuQZJzEzHXVHQB7KFGloNZSAbV9efyzaao6z6qaJ4ivyj2lGZjKvjDg9hbckdyQCmpWTcR1CNORkT0i8bvlmdjsRtKbKqWX8Cdz7NwhMcZG8YxbP6fvf3GiaJeKYw49vIHB7jti6krrmFftLvXCQsWMs2sCtaZpWKtYiBLPrwHEIsSCjuOnB7kSXN2GU2pGcWS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2AA3O+Vq5A9PsnwVzzRadrnhU7cSSGXglsJRv45JJk=;
 b=VQbJ2cKakKtM0fpcFevGxDON7z1U86PeOfvCwvoOwc/ArXPeznN2i4Y3kj1LcWRhYG8r2ZIySgTFRNOYTkMyc98xENUAiGb+6qoEocxzv6p+EFZRCB9vkI5UOth1FLeuvouEJ9+igu/RM3IQlEPVIWlCZv+ufiqvYfH2AZMjaSy9DCMrYtunMZooiAWVwJ61FeaVAvxtlNZblIC0UrERlstGRN5yATmeO9lZ82tv2HFFFS6b4sLEhgusP0UeZvXVpG4JRCOPMCk1h6sf1sMgwJro5hpH1AcdT+oPm+KFlFTl4I3xV3Cu7ANTBnYo7Xy23BCZ3kqLLhlN7OiHFPLGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by DM6PR12MB2748.namprd12.prod.outlook.com
 (2603:10b6:5:43::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Sat, 16 Nov
 2019 22:01:40 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:37 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:37 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:36 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 10/17] drm/dp_mst: Manually overwrite PBN divider for
 calculating timeslots
Date: Sat, 16 Nov 2019 17:01:21 -0500
Message-ID: <20191116220128.16598-11-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39850400004)(376002)(136003)(428003)(199004)(189003)(8936002)(186003)(5660300002)(486006)(14444005)(4326008)(2616005)(126002)(6666004)(356004)(53416004)(476003)(2906002)(36756003)(50226002)(7696005)(54906003)(2351001)(51416003)(16586007)(316002)(26005)(6916009)(305945005)(47776003)(76176011)(478600001)(70206006)(81156014)(336012)(86362001)(48376002)(1076003)(81166006)(8676002)(11346002)(446003)(50466002)(426003)(2876002)(70586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2748; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c41a990a-4cfe-4416-3e01-08d76ae08f42
X-MS-TrafficTypeDiagnostic: DM6PR12MB2748:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2748BA5898442888702048C0E4730@DM6PR12MB2748.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9QcJvqvZZYEhd092F/oGv/TivnSXgcv89lJtTTA3vzsmREmgNKQQEjmqC/d0Nx8NsPF+bs955ZfgNGs2sbvRuq4hm6WJqi4cAB1yu3VDSVeOfZr76MCsEEnzXw1GN8EiLDxKOW9bF4SN6Lpjn6Z3uI2C0oVN8Q7JY0rj/9I3SR09jLq7obeObDujVk+TFQuvbHTKph+4ABsSBW4agr16iUNc1Mei+hcsZieUGOgAEUlDLtg0ZSYsIcsSHmaS9PntMBXIxwQ888OLx5D/ePbx5GFLfaHi5dlOBiJEl+lsvMFE5vLeVcZB4kZTKbn/Veb/f1dVselqP2se+TDu7ESwg8LP3QMNUhGJbVTsUMddUA7+be2l4cBnz9WMZXEzuOmJcmkpAlC2KPrE8TtXR8PSGLDfuff7RAyL5OzPsqS+T+XZoqyqCql/oUYEDwZhXmBr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:40.3335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c41a990a-4cfe-4416-3e01-08d76ae08f42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2748
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2AA3O+Vq5A9PsnwVzzRadrnhU7cSSGXglsJRv45JJk=;
 b=2EVOwVn/If+EZUtuT6c0dtuVcoZu2Yu8I6W6owpyw6A6fuwPPy/0zRXnLcHPAzkpJpSwPVEYvJXcqevb0M/DSnAdfh6IJW+GTC04Jw0rRgy7hXrsC5GJa1soIVnekM1dWC/Oa+t+Ygjqf1C6AHgPQXvSjxkSMrXdVtJy6rc/1Tk=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KRm9yIERT
QyBjYXNlIHdlIGNhbm5vdCBhbHdheXMgdXNlIHRvcG9sb2d5IG1hbmFnZXIncyBQQk4gZGl2aWRl
cgp2YXJpYWJsZS4gVGhlIGRlZmF1bHQgZGl2aWRlciBkb2VzIG5vdCB0YWtlIEZFQyBpbnRvIGFj
Y291bnQuClRoZXJlZm9yZSB3ZSBzaG91bGQgYWxsb3cgZHJpdmVyIHRvIGNhbGN1bGF0ZSBpdHMg
b3duIGRpdmlkZXIgYmFzZWQKb24gdGhlIGxpbmsgcmF0ZSBhbmQgY291bnQgaXRzIGhhbmRsaW5n
LCBhcyBpdCBpcyBodyBzcGVjaWZpYy4KW2hvd10KUGFzcyBwYm5fZGl2IGFzIGFuIGFyZ3VtZW50
LCB3aGljaCB3aWxsIGJlIHVzZWQgaWYgaXRzIG1vcmUgdGhhbgp6ZXJvLCBvdGhlcndpc2UgZGVm
YXVsdCB0b3BvbG9neSBtYW5hZ2VyJ3MgcGJuX2RpdiB3aWxsIGJlIHVzZWQuCgpTaWduZWQtb2Zm
LWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDMgKystCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgICAgIHwgOSArKysrKysrLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgICAgICAgfCAyICst
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgICAgICAgICAgIHwgMyAr
Ky0KIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAz
ICsrLQogNSBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IDZjMzJiNzNjNTE5Ny4uMzY1N2EyNmNlMWQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQ5NzIsNyArNDk3Miw4
IEBAIHN0YXRpYyBpbnQgZG1fZW5jb2Rlcl9oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlciwKIAlkbV9uZXdfY29ubmVjdG9yX3N0YXRlLT52Y3BpX3Nsb3RzID0g
ZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsCiAJCQkJCQkJCQkgICBtc3RfbWdy
LAogCQkJCQkJCQkJICAgbXN0X3BvcnQsCi0JCQkJCQkJCQkgICBkbV9uZXdfY29ubmVjdG9yX3N0
YXRlLT5wYm4pOworCQkJCQkJCQkJICAgZG1fbmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+cGJuLAorCQkJ
CQkJCQkJICAgMCk7CiAJaWYgKGRtX25ld19jb25uZWN0b3Jfc3RhdGUtPnZjcGlfc2xvdHMgPCAw
KSB7CiAJCURSTV9ERUJVR19BVE9NSUMoImZhaWxlZCBmaW5kaW5nIHZjcGkgc2xvdHM6ICVkXG4i
LCAoaW50KWRtX25ld19jb25uZWN0b3Jfc3RhdGUtPnZjcGlfc2xvdHMpOwogCQlyZXR1cm4gZG1f
bmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+dmNwaV9zbG90czsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCmluZGV4IGQ1ZGYwMjMxNWUxNC4uOTRiYjI1OWFiNzNlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTMyMTEsNiArMzIxMSw3IEBAIHN0YXRpYyBpbnQg
ZHJtX2RwX2luaXRfdmNwaShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKICAq
IEBtZ3I6IE1TVCB0b3BvbG9neSBtYW5hZ2VyIGZvciB0aGUgcG9ydAogICogQHBvcnQ6IHBvcnQg
dG8gZmluZCB2Y3BpIHNsb3RzIGZvcgogICogQHBibjogYmFuZHdpZHRoIHJlcXVpcmVkIGZvciB0
aGUgbW9kZSBpbiBQQk4KKyAqIEBwYm5fZGl2OiBkaXZpZGVyIGZvciBEU0MgbW9kZSB0aGF0IHRh
a2VzIEZFQyBpbnRvIGFjY291bnQKICAqCiAgKiBBbGxvY2F0ZXMgVkNQSSBzbG90cyB0byBAcG9y
dCwgcmVwbGFjaW5nIGFueSBwcmV2aW91cyBWQ1BJIGFsbG9jYXRpb25zIGl0CiAgKiBtYXkgaGF2
ZSBoYWQuIEFueSBhdG9taWMgZHJpdmVycyB3aGljaCBzdXBwb3J0IE1TVCBtdXN0IGNhbGwgdGhp
cyBmdW5jdGlvbgpAQCAtMzIzNyw3ICszMjM4LDggQEAgc3RhdGljIGludCBkcm1fZHBfaW5pdF92
Y3BpKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogICovCiBpbnQgZHJtX2Rw
X2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAog
CQkJCSAgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCi0JCQkJICBzdHJ1Y3Qg
ZHJtX2RwX21zdF9wb3J0ICpwb3J0LCBpbnQgcGJuKQorCQkJCSAgc3RydWN0IGRybV9kcF9tc3Rf
cG9ydCAqcG9ydCwgaW50IHBibiwKKwkJCQkgIGludCBwYm5fZGl2KQogewogCXN0cnVjdCBkcm1f
ZHBfbXN0X3RvcG9sb2d5X3N0YXRlICp0b3BvbG9neV9zdGF0ZTsKIAlzdHJ1Y3QgZHJtX2RwX3Zj
cGlfYWxsb2NhdGlvbiAqcG9zLCAqdmNwaSA9IE5VTEw7CkBAIC0zMjcwLDcgKzMyNzIsMTAgQEAg
aW50IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSwKIAlpZiAoIXZjcGkpCiAJCXByZXZfc2xvdHMgPSAwOwogCi0JcmVxX3Nsb3RzID0g
RElWX1JPVU5EX1VQKHBibiwgbWdyLT5wYm5fZGl2KTsKKwlpZiAocGJuX2RpdiA8PSAwKQorCQlw
Ym5fZGl2ID0gbWdyLT5wYm5fZGl2OworCisJcmVxX3Nsb3RzID0gRElWX1JPVU5EX1VQKHBibiwg
cGJuX2Rpdik7CiAKIAlEUk1fREVCVUdfQVRPTUlDKCJbQ09OTkVDVE9SOiVkOiVzXSBbTVNUIFBP
UlQ6JXBdIFZDUEkgJWQgLT4gJWRcbiIsCiAJCQkgcG9ydC0+Y29ubmVjdG9yLT5iYXNlLmlkLCBw
b3J0LT5jb25uZWN0b3ItPm5hbWUsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9tc3QuYwppbmRleCBkZmFjNDUwODQxZGYuLjIxMjNhYzI5MzlmMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCkBAIC02NSw3ICs2NSw3IEBAIHN0
YXRpYyBpbnQgaW50ZWxfZHBfbXN0X2NvbXB1dGVfbGlua19jb25maWcoc3RydWN0IGludGVsX2Vu
Y29kZXIgKmVuY29kZXIsCiAJCQkJCQkgICAgICAgZmFsc2UpOwogCiAJCXNsb3RzID0gZHJtX2Rw
X2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsICZpbnRlbF9kcC0+bXN0X21nciwKLQkJCQkJ
CSAgICAgIHBvcnQsIGNydGNfc3RhdGUtPnBibik7CisJCQkJCQkgICAgICBwb3J0LCBjcnRjX3N0
YXRlLT5wYm4sIDApOwogCQlpZiAoc2xvdHMgPT0gLUVERUFETEspCiAJCQlyZXR1cm4gc2xvdHM7
CiAJCWlmIChzbG90cyA+PSAwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5j
CmluZGV4IGM0NTgzMjIzMGNjYy4uMjdjNWZmOTlmNzdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jCkBAIC03ODQsNyArNzg0LDggQEAgbnY1MF9tc3RvX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJaWYgKGNydGNfc3RhdGUtPm1vZGVf
Y2hhbmdlZCkgewogCQlzbG90cyA9IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0YXRl
LCAmbXN0bS0+bWdyLAogCQkJCQkJICAgICAgbXN0Yy0+cG9ydCwKLQkJCQkJCSAgICAgIGFzeWgt
PmRwLnBibik7CisJCQkJCQkgICAgICBhc3loLT5kcC5wYm4sCisJCQkJCQkgICAgICAwKTsKIAkJ
aWYgKHNsb3RzIDwgMCkKIAkJCXJldHVybiBzbG90czsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgK
aW5kZXggNGNmNzM4NTQ1ZGZiLi5mYzE5MDk0YjA2YzMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIu
aApAQCAtNjYxLDcgKzY2MSw4IEBAIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlICpk
cm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUoc3RydWN0IGRybV9hCiBpbnQgX19tdXN0
X2NoZWNrCiBkcm1fZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyhzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
ciwKLQkJCSAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQsIGludCBwYm4pOworCQkJ
ICAgICAgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwgaW50IHBibiwKKwkJCSAgICAgIGlu
dCBwYm5fZGl2KTsKIGludCBfX211c3RfY2hlY2sKIGRybV9kcF9hdG9taWNfcmVsZWFzZV92Y3Bp
X3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCQkgc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
