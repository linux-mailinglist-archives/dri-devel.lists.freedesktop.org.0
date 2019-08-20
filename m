Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA39691D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473FE6E85C;
	Tue, 20 Aug 2019 19:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740070.outbound.protection.outlook.com [40.107.74.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACCD6E85B;
 Tue, 20 Aug 2019 19:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmN4uRLnRmEp7ewh6YrPjNUOXoNavVaXTWxQ3ObSJ21Qo8e8K/pIyoukoLsFO8qg9HQxgC2rgZvw4Q97ayBv0FH78wIGpZb3ROoWQ4xqVPooLyNwZkP7Bm5yktmlMeNuUgoS6ghUAvVNBs/C7bSrMTNOOV9LJXEURfHyU6xqg+GQNCHbSWTTUjtwQeKpyjgENvW7RzLzenmSZym5cbE0v1cF8aJuv3wHWagdPGvA9g17Lc6Azyhilm0VIC+WAhJEyl+PfpAqw3Wmda3lKedPQTNdffdP5aJutdyQl6W8x2FnKyjg4mwg9RkP6rEHCVa73A/xg7BUPzoI4kiGDMkcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywSTmYSp/jtxrNMaLPn7VmtQiBN4urC7GQOHwO62wcM=;
 b=cX2EJ2RGe0txl6XGq+r268IZ/o+mZXgsuM2UiIJeSxUYgzTtagMqn7CWWl0mImVR6vjcf9m0EeXRcAo6kkXv+ppynt4dpOresJmsqrejKG7Xth2nXY57whF7/6W2/5ur/YXF1IUnTpN7qoJ5sWG/Yeo6Xvdb0TZw9DUodQ2tGdR+wBUeyCFskgMF7RE1Qa6lRuJXO9/lYTGJ3Z0IDPxi4Fxqqzl/bWWMYwzBYTYB8TkfmP72rBekzQB94ZAnjUB8FNgeWkrIQFzf3CXNYaGlx4pW8g1Gb2yI0wjekbkDzwvo9/edNG2aTMzNPieFGSd9+GbC9frg0n6mK+iliX5Uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0109.namprd12.prod.outlook.com (2603:10b6:0:55::29) by
 MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Tue, 20 Aug 2019 19:12:19 +0000
Received: from BY2NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0109.outlook.office365.com
 (2603:10b6:0:55::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT025.mail.protection.outlook.com (10.152.84.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:18 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:18 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 04/14] Revert "drm/amd/display: Fix underscan not using
 proper scaling"
Date: Tue, 20 Aug 2019 15:11:53 -0400
Message-ID: <20190820191203.25807-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(6666004)(186003)(336012)(26005)(356004)(70206006)(70586007)(76176011)(51416003)(2616005)(446003)(49486002)(426003)(476003)(11346002)(126002)(86362001)(486006)(4326008)(81156014)(8936002)(50226002)(14444005)(81166006)(8676002)(305945005)(110136005)(316002)(16586007)(53936002)(36756003)(50466002)(5660300002)(48376002)(478600001)(2906002)(47776003)(450100002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1280; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d1b8669-b4a9-4625-80de-08d725a2523c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1280; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1280751422918F796CE68514EFAB0@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: v59ffo9SMQHV9ha3lnjZbwZIJ6Ojxgp3xm6lyvAhR+eqIQdijcH1IgCUulWvVZ5i0NIrw4KDxlqonSiRaFPkSqLycIdiqj213KwrMSTT8ASBDFl8P5p1bgCbgUQfJ4S5trLuP7qRk7OMaTBGLcG7LyTcEcWPedCVS/16o48jGfs8IcshvHhITJ+k3YdWtfiH9D8+ez27kAweZM3rFdG+eLNnnRRw4tOnl2IWmr29p7AGMZoBnxZN8iNmQ8F136eSQHbzNoncnrtvzVpmxtiSJl/tFR7oJP/eHuL2u3p1IQCVrODM4n3u1cYBmzAJgMsha4J4Asci+6JjH11D5ZPp5kfi/LuMUrqQgaalqyTqnvyggLmPSMgMXivnBvDiNLiKK1taMmVzV+IrAz7zxKtwSUX42Lu+MoNrbVvKY63QIcg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:18.9189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1b8669-b4a9-4625-80de-08d725a2523c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywSTmYSp/jtxrNMaLPn7VmtQiBN4urC7GQOHwO62wcM=;
 b=krT1y/4QzvuaaVYlEI3Nmw7T3QTmNj19Eq7HoB1NfwFy86wVCLfw7pvxjWo3H+O9PyuTLoqDkK119hDqFAzEq9inHM6fHDR0BVn5La2ku92Y0yvVgZHl+ZdGATeAKSCkYIJD9/sItfhgueKkW93GdAT5ID6tYLU0riW3xh04ihE=
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
aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAxMiArLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXggNzdhYzdmNzA3ZWM1
Li4xMTg5ZTMyMDA2MmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMu
YwpAQCAtMjEyNyw3ICsyMTI3LDcgQEAgdm9pZCBkY19jb21taXRfdXBkYXRlc19mb3Jfc3RyZWFt
KHN0cnVjdCBkYyAqZGMsCiAJZW51bSBzdXJmYWNlX3VwZGF0ZV90eXBlIHVwZGF0ZV90eXBlOwog
CXN0cnVjdCBkY19zdGF0ZSAqY29udGV4dDsKIAlzdHJ1Y3QgZGNfY29udGV4dCAqZGNfY3R4ID0g
ZGMtPmN0eDsKLQlpbnQgaSwgajsKKwlpbnQgaTsKIAogCXN0cmVhbV9zdGF0dXMgPSBkY19zdHJl
YW1fZ2V0X3N0YXR1cyhzdHJlYW0pOwogCWNvbnRleHQgPSBkYy0+Y3VycmVudF9zdGF0ZTsKQEAg
LTIxNjUsMTYgKzIxNjUsNiBAQCB2b2lkIGRjX2NvbW1pdF91cGRhdGVzX2Zvcl9zdHJlYW0oc3Ry
dWN0IGRjICpkYywKIAogCQljb3B5X3N1cmZhY2VfdXBkYXRlX3RvX3BsYW5lKHN1cmZhY2UsICZz
cmZfdXBkYXRlc1tpXSk7CiAKLQkJaWYgKHVwZGF0ZV90eXBlID49IFVQREFURV9UWVBFX01FRCkg
ewotCQkJZm9yIChqID0gMDsgaiA8IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaisrKSB7Ci0J
CQkJc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCA9ICZjb250ZXh0LT5yZXNfY3R4LnBpcGVfY3R4
W2pdOwotCi0JCQkJaWYgKHBpcGVfY3R4LT5wbGFuZV9zdGF0ZSAhPSBzdXJmYWNlKQotCQkJCQlj
b250aW51ZTsKLQotCQkJCXJlc291cmNlX2J1aWxkX3NjYWxpbmdfcGFyYW1zKHBpcGVfY3R4KTsK
LQkJCX0KLQkJfQogCX0KIAogCWNvcHlfc3RyZWFtX3VwZGF0ZV90b19zdHJlYW0oZGMsIGNvbnRl
eHQsIHN0cmVhbSwgc3RyZWFtX3VwZGF0ZSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
