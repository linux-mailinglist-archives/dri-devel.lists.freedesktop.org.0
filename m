Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C09491B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9C36E203;
	Mon, 19 Aug 2019 15:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790089.outbound.protection.outlook.com [40.107.79.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29DF6E1F6;
 Mon, 19 Aug 2019 15:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7BnieuqraupTP8Xx7S3RqOqeb0l7khGPOluwaLYBcImgrZsS+CsJhXUdYj3SDQoEKkxyWQNjRGfsMMTh0Q3z1JO2Zgv7+Hz52R87AquWOQ63l14qYhbddMt1M9Ycmf7yQSZkX2xI+GDv/qC++6RrbIIXN/hgw0JqRyp/R45hVkGWkzhxrY0aGxOD22Ue97yAc6SB0NugA+GHSmFN4qj3rFIYzutv6hGdhnCHRFpc+O0qObtR9lSEjnBUbHGfeIvJ4t5QL7md5sT3VAyzGpjiYA0Dfy5K4v/6oNzr0CTHcgQXEwC4wx3Nn3HWDJRVk+YMopZyEsPCSxs/pJ7NriQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT1ba8Q2pRCQxRAIHe42BbGYQ24a5aVmWWN2HAWJw28=;
 b=cBmFXuiidrpLF8Pgm0lKeBnWNgzEuTM3xBu7ngJEjqeDqslg2cV3IT8IPc4hLy1mDzuT1xhosx1Z5TQl0njy66ZAXW0lekHbOVjvvAhpO2lZOEBR1Ka476IcCIEm9IR7XTWUCVuPVLglubbuYo/pyZjJGevgDKnkbHL2mGj9DsrQiYc8sgU/E0rt+fNjdK09D+nwxP9LiMIDrYhunq6IciMAFc3zPQTTtX+9+RKga6/w6ZemP5EyQ6F4ODVqhcJ6NHpi2vwSVaSKdner3ikbW5FGbu2xfaEUSdTkmhnm43N9dskTpCbQR06mu2bkwO14gPE/byhe5yEYZjB6j8mOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
 CY4PR12MB1528.namprd12.prod.outlook.com (2603:10b6:910:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:50:50 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0054.outlook.office365.com
 (2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:49 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:47 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/14] Revert "drm/amd/display: Fix underscan not using proper
 scaling"
Date: Mon, 19 Aug 2019 11:50:28 -0400
Message-ID: <20190819155038.1771-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(70206006)(450100002)(50466002)(70586007)(305945005)(476003)(126002)(4326008)(6666004)(51416003)(49486002)(356004)(50226002)(8676002)(81166006)(1076003)(8936002)(2906002)(14444005)(48376002)(81156014)(5660300002)(76176011)(16586007)(53936002)(110136005)(2616005)(11346002)(316002)(336012)(26005)(486006)(478600001)(446003)(426003)(47776003)(186003)(86362001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1528; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73954c32-e106-4cdc-fddf-08d724bd021f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1528; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1528:
X-Microsoft-Antispam-PRVS: <CY4PR12MB15288A7596B2510D6E4CE9E2EFA80@CY4PR12MB1528.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T6eIYSHDYaTL/aufNODLTQnyOvhcL7xE2SRtO031BjAutUveE99gXsMIVQzrj2MotW6KgEjUynrnw0WqywoDSh+3f6clef8OIkExUutbM95K6ncUKtfVbGiyKf49bmMDHMgUTF6NiL/VgzXtrKtCLIjWkt98/wW7OLvokc4+a+bwgUVT14DxYWx7L/toXPT7h/ScneIPV6Zu7vhZcyr+9MxqLHSdtOKUqxxjE2HwyNUkB8OXvXJKjia6PxXAHXMSNDko68NnmPqCd/iDd4tB77FeqS7L1gZjmTc36Ke1DcKycctm8mY7azD1C10vBH9kt9iHVqeuQJJXz/GJUQkMD0biWp1FEGuxVH17Kg0gbrDm4UhQL6pkoUmzDM3a9yEBjROCr9hfjXh/cfxKyCN9Or2lTk6kO0mR483N/x3OGDU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:49.7593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73954c32-e106-4cdc-fddf-08d724bd021f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1528
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT1ba8Q2pRCQxRAIHe42BbGYQ24a5aVmWWN2HAWJw28=;
 b=wcHUGUm6l32UaRBGNmmLuVLEyd5Ao/hj/ug4ZAW6XukWP+zrGotIcNMpTZGDNi3f68MmCdTksSeRDEJVK7NbiGuXkBdi71Tiqywy2TcDniPVfYzkGIlNpn7HJPaoEOUAnel4oq5atAGCqZHE0he1TB/2678TQX+vO4IGPff+sqg=
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

VGhpcyByZXZlcnRzIGNvbW1pdCA4MGU4MGVjODE3ZjE2MTU2MGI0MTU5NjA4ZmI0MWJkMjg5YWJl
ZGUzLgoKVGhpcyBjb21taXQgZml4ZWQgYW4gaXNzdWUgd2l0aCB1bmRlcnNjYW4gY29tbWl0cyBu
b3QgdXBkYXRpbmcgYWxsCm5lZWRlZCB0aW1pbmcgdmFsdWVzLCBidXQgdGhyb3VnaCB2YXJpb3Vz
IHJlZmFjdG9ycyBpdCBpcyBubyBsb25nZXIKbmVjZXNzYXJ5LiBJdCBjYXVzZXMgY29ycnVwdGlv
biBvbiBvZG0gY29tYmluZSBieQpvdmVyd3JpdGluZyB0aGUgaGFsdmVkIGhfYWN0aXZlIGluIHRo
ZSBzdHJlYW0gdGltaW5nCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFu
Y2lzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAxMiArLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXggNzdhYzdmNzA3ZWM1Li4xMTg5
ZTMyMDA2MmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwpAQCAt
MjEyNyw3ICsyMTI3LDcgQEAgdm9pZCBkY19jb21taXRfdXBkYXRlc19mb3Jfc3RyZWFtKHN0cnVj
dCBkYyAqZGMsCiAJZW51bSBzdXJmYWNlX3VwZGF0ZV90eXBlIHVwZGF0ZV90eXBlOwogCXN0cnVj
dCBkY19zdGF0ZSAqY29udGV4dDsKIAlzdHJ1Y3QgZGNfY29udGV4dCAqZGNfY3R4ID0gZGMtPmN0
eDsKLQlpbnQgaSwgajsKKwlpbnQgaTsKIAogCXN0cmVhbV9zdGF0dXMgPSBkY19zdHJlYW1fZ2V0
X3N0YXR1cyhzdHJlYW0pOwogCWNvbnRleHQgPSBkYy0+Y3VycmVudF9zdGF0ZTsKQEAgLTIxNjUs
MTYgKzIxNjUsNiBAQCB2b2lkIGRjX2NvbW1pdF91cGRhdGVzX2Zvcl9zdHJlYW0oc3RydWN0IGRj
ICpkYywKIAogCQljb3B5X3N1cmZhY2VfdXBkYXRlX3RvX3BsYW5lKHN1cmZhY2UsICZzcmZfdXBk
YXRlc1tpXSk7CiAKLQkJaWYgKHVwZGF0ZV90eXBlID49IFVQREFURV9UWVBFX01FRCkgewotCQkJ
Zm9yIChqID0gMDsgaiA8IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaisrKSB7Ci0JCQkJc3Ry
dWN0IHBpcGVfY3R4ICpwaXBlX2N0eCA9ICZjb250ZXh0LT5yZXNfY3R4LnBpcGVfY3R4W2pdOwot
Ci0JCQkJaWYgKHBpcGVfY3R4LT5wbGFuZV9zdGF0ZSAhPSBzdXJmYWNlKQotCQkJCQljb250aW51
ZTsKLQotCQkJCXJlc291cmNlX2J1aWxkX3NjYWxpbmdfcGFyYW1zKHBpcGVfY3R4KTsKLQkJCX0K
LQkJfQogCX0KIAogCWNvcHlfc3RyZWFtX3VwZGF0ZV90b19zdHJlYW0oZGMsIGNvbnRleHQsIHN0
cmVhbSwgc3RyZWFtX3VwZGF0ZSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
