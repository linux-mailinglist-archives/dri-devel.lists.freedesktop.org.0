Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578C984ED
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1E46E9D6;
	Wed, 21 Aug 2019 20:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087F86E9C5;
 Wed, 21 Aug 2019 20:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAH932ELuImIZFH1UCA408sn1gIH2EuIoPeyOlylUbgb4BlV1FjRgjcg9xttnhZ3welED3O/BTshjbEbrb0t3dl4ipl3uHEwKiQ0MDWNhUo+xt31VElNQ2GEGc2xuHXCK5/tvRcJ7/vXLgDeCWeq7huI71UMIdhVPXBMZIH0TQXsqnYlPjhDnkXavPp57YXDo2S3SiuBo1+bOwNomJ10iQXAb4kKHW6b0KNneKv9F9ApnB937ZWf5Fcq7dcd48SNIUixrODvnqbdbEFg42F2Ou6k+P7NUisD2gYVUkqI7OMUz2w1fh5awTIBkNYtlu/MGknv+TZ71z+V1fW8b4ja0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywSTmYSp/jtxrNMaLPn7VmtQiBN4urC7GQOHwO62wcM=;
 b=LhYBA9auydYxnyj/XcZ2EL9/OTXYzstnePgBgHWyw/lx9TM/T69AcTgw0AzQ8zeyjGQFkewtMJu74dnrIJNnoe7NTkk7vtcs5bWoHLMJXnWBA7OT58EjpfxGTTtZ5KQUfzqs1sPaDXrqWMt8gYHS8UN0P/gUrSccfU0TvJbKqlN2zbBuSpZozSct4DU/aSqTWPcCIvXC7UDLrc31js/sqt1N4lkqb20q9Gy4djNGIRPg6iDwOXrtnmsjbQaBOFtwKRK+ksLGlqEVlvgzu/qWFWwHHJlwMmp0bNivs8jFvFOES+1qInBs0gsdGB5fUaOfvaLLxxEaaRBuK4Xr78jnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0006.namprd12.prod.outlook.com (2603:10b6:403:2::16)
 by CY4PR12MB1526.namprd12.prod.outlook.com (2603:10b6:910:4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Wed, 21 Aug
 2019 20:01:46 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by BN4PR12CA0006.outlook.office365.com
 (2603:10b6:403:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:45 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:36 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 04/16] Revert "drm/amd/display: Fix underscan not using
 proper scaling"
Date: Wed, 21 Aug 2019 16:01:17 -0400
Message-ID: <20190821200129.11575-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(2980300002)(428003)(189003)(199004)(49486002)(446003)(126002)(426003)(486006)(336012)(476003)(186003)(110136005)(51416003)(48376002)(14444005)(76176011)(305945005)(6666004)(36756003)(2906002)(2616005)(5660300002)(508600001)(356004)(86362001)(11346002)(50466002)(8676002)(16586007)(8936002)(81166006)(81156014)(26005)(47776003)(50226002)(53936002)(1076003)(450100002)(70586007)(70206006)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1526; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 854bd94e-4782-4dc6-7a56-08d7267264f8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1526; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1526:
X-Microsoft-Antispam-PRVS: <CY4PR12MB152632DE4B345B8C512F6ACAEFAA0@CY4PR12MB1526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: x/XuMzitMp5dTkhelsEzghP30CLNDp0xoAFMd186rp7kY8MaMPr0oUBM1f0NHyAOTWJTeE8gQAOvaGLxaokH6LjyBJwBkrT3+BAuzBHRgJQKV7DM3ru8w3EsAL2tMUPqYNx27xwwXgRucB8q4K7LmBu3Jfs2Z4aRWv9JzhjwMS8wtT+ycUExSGR9u/WPahzqRzJlbLrtKUkqGqEBNDi3kTleB92Tb4NgmJU8KBDbkWaoBwHA8xtASf9CkTiDrMwiVEHNdhVrp4tTGhMk5jtffzXV4wR3kvh2M8nuVVq2hTiJlFLlMcML9SjF42mCEsLlrqfp5tJLyfcxobIqfGCHL/sKjEJx0BRTTf21qb/ac7UfAFcq4eXa5tTZjpWfpRmo2O5gLmxaqjNCT7U1k66KUCbN9nwRng/GgpdmgPniHfk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:45.6285 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 854bd94e-4782-4dc6-7a56-08d7267264f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1526
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywSTmYSp/jtxrNMaLPn7VmtQiBN4urC7GQOHwO62wcM=;
 b=KqBiTZRtbPTTB948Q+a2dbxwFiqkoL1XfxkIsoefl8/oYhpbFZKw4YYKrPR7pM+QtMizouxK4OjdPRwUEFENCjKG6+HG1YF6lLAlPBAEDYvAF0q8HCyae5GcXhFpZ5hmGaQYjlUPsa44e7zjYGkkSxS8jc1oLMvDVht8N2y2QwM=
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
