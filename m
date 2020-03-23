Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB818F714
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A2389E03;
	Mon, 23 Mar 2020 14:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7610F89E03
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9kW6vX1EMGNyOCBUhUiv9TEDOpM311WUa5PfWgq8sp7XHe6zfd0W3JBenxAOFjh+wHGQMFG2tRTqnjtoxeFjj+P+w/U1Cfd6mMrVIdeAxVGpL4U134FhbcMaCIjHAWPX2r5HpDPyh2uMd8vJRcFpT1Ck6kGxmP9zmpecRBF1ZHAIggNyhK1nSg4DQADfLysQsR/z9EKRVvXtQ4svPof1aN1Ym34gFhgEarKkr8qCiWkmr+n99lHMbCdKwPJe5dVE64zaGfCE5CKZO0d7F3Xoplc58S9q+6iyqhMwAiLqbpqkIs4o7snE/Z37O4Dxa/+2WHT9CaeM7H65BBajilYXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idqMWQlVaIN1sp/GUg9pAR9ajMCl6lcJWz9MkW66qME=;
 b=Tr4xZA2rbTp2RVXq+JOFn2n4FGxZ5iw/2eh8m94Bo7q8sKFB4BTTMizXHB5URuTmaksPrL7yt+02IQzraqzsetRlQixdDEk3ijrbKLqdQrL5ipFCJRWPjqnWYvCWUn0mIXXUB+4olz3a/2xN8lua4X2HZuLVgh9ZD+h2bqxEMBAa8AI36PKy//xKSn6H/oOJ50WGVQnyjzcS35afnQsWraUALkejnzk+QKLVaaEFIA3nKPqISh7mbNn6UFZMPmqdS0BhkihCJCMMUbmp1uli2e0Yc0ilCfV5W/KOkuCh47iYbbjGBrc79J8umyTereWu8I55iU3IXTt1dF0SWhJyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idqMWQlVaIN1sp/GUg9pAR9ajMCl6lcJWz9MkW66qME=;
 b=QuaZS04pFw76AxKDOh9ut6243ExsK8rig/ytKanShVMOzI4I1EzmoODVqrQKxGwYr2WLYh0F3Ktki7d9BxZ11AlP6iG+JO78JIcv4xC+776r/EtXFsUIBiTFALVxcX8LAtiMAvdnwZeiIFCR8v3bhlRe72uGyZaIHXFZPWGFdTQ=
Received: from BL0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:2d::42)
 by BN7PR12MB2737.namprd12.prod.outlook.com (2603:10b6:408:30::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 14:39:35 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:208:2d:cafe::58) by BL0PR03CA0029.outlook.office365.com
 (2603:10b6:208:2d::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend
 Transport; Mon, 23 Mar 2020 14:39:35 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 14:39:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 23 Mar
 2020 09:39:34 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 23 Mar
 2020 09:39:34 -0500
Received: from yttao-code-machine.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 23 Mar 2020 09:39:33 -0500
From: Yintian Tao <yttao@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/scheduler: fix rare NULL ptr race
Date: Mon, 23 Mar 2020 22:39:31 +0800
Message-ID: <20200323143931.3931-1-yttao@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39850400004)(396003)(428003)(199004)(46966005)(5660300002)(8936002)(2616005)(7696005)(336012)(1076003)(66574012)(478600001)(36756003)(186003)(2906002)(26005)(426003)(316002)(6916009)(8676002)(4326008)(356004)(47076004)(81156014)(70586007)(70206006)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2737; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94f30abd-8c07-42b1-215d-08d7cf380180
X-MS-TrafficTypeDiagnostic: BN7PR12MB2737:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2737B3E22F4F1B3417761258E5F00@BN7PR12MB2737.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-Forefront-PRVS: 0351D213B3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5UMZJaUmy5wuEsoGc1FjkicHtdbFUY1NqHIRNlkc4Hq8BlhqXhC9VP4c4B4VGvy5cYo6EyyATaXE+oQ29AAzcR0ggXrvGMF1CO2f7zXMPLG09pkTTQ3ZCN/SMBEQiVslbxQP+fqAUqH1hKN1azaYqpEZgxUOmCd5XhrL+Q6t0oJP/5nMnI0YT8FvRsnRhpzF6ukupP1skh6UZaenCYY6GjBCswcfIhr5hhLJwaV3mpceUixn3Y4iE8fEzZlErOEfedldoVT4jFQqsgJacwBBv/VQMCWH77R8QMqa1yDNgh+X3RDRe0oLmodMRJPCjICck2DK4gkItW21dMUCewb9NSvk6iXZb/Jf491eRaHhtn9vzC7hXyBL9dz/nzrdB2L7wkvZ09T0OhOz7vU3BeT3tqFdU2Fk4xBiH12U9rrv6ytjIi33c/c9nYb7LZJ93sOAkZWU2B7Rbka4iiFe77MjmMxEp5ybGtU5ZdyX9D67/fKWrla1wUcCdZmeeBBy+Vyts69NiCoFgg/cgY9xqrn7A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 14:39:34.6067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f30abd-8c07-42b1-215d-08d7cf380180
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2737
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgb25lIG9uZSBjb3JuZXIgY2FzZSBhdCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZAp3
aGljaCB3aWxsIHJhaXNlIHRoZSBOVUxMIHBvaW50ZXIgcHJvYmxlbSBqdXN0IGxpa2UgYmVsb3cu
Ci0+ZG1hX2ZlbmNlX3NpZ25hbAogICAgLT5kbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZAoJLT50ZXN0
X2FuZF9zZXRfYml0CmhlcmUgdHJpZ2dlciBkbWFfZmVuY2VfcmVsZWFzZSBoYXBwZW4gZHVlIHRv
IHRoZSB6ZXJvIG9mIGZlbmNlIHJlZmNvdW50LgoKLT5kbWFfZmVuY2VfcHV0CiAgICAtPmRtYV9m
ZW5jZV9yZWxlYXNlCgktPmRybV9zY2hlZF9mZW5jZV9yZWxlYXNlX3NjaGVkdWxlZAoJICAgIC0+
Y2FsbF9yY3UKaGVyZSBtYWtlIHRoZSB1bmlvbiBmbGVkIOKAnGNiX2xpc3TigJ0gYXQgZmluaXNo
ZWQgZmVuY2UKdG8gTlVMTCBiZWNhdXNlIHN0cnVjdCByY3VfaGVhZCBjb250YWlucyB0d28gcG9p
bnRlcgp3aGljaCBpcyBzYW1lIGFzIHN0cnVjdCBsaXN0X2hlYWQgY2JfbGlzdAoKVGhlcmVmb3Jl
LCB0byBob2xkIHRoZSByZWZlcmVuY2Ugb2YgZmluaXNoZWQgZmVuY2UgYXQgZHJtX3NjaGVkX3By
b2Nlc3Nfam9iCnRvIHByZXZlbnQgdGhlIG51bGwgcG9pbnRlciBkdXJpbmcgZmluaXNoZWQgZmVu
Y2UgZG1hX2ZlbmNlX3NpZ25hbAoKWyAgNzMyLjkxMjg2N10gQlVHOiBrZXJuZWwgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDA4ClsgIDczMi45MTQ4MTVd
ICNQRjogc3VwZXJ2aXNvciB3cml0ZSBhY2Nlc3MgaW4ga2VybmVsIG1vZGUKWyAgNzMyLjkxNTcz
MV0gI1BGOiBlcnJvcl9jb2RlKDB4MDAwMikgLSBub3QtcHJlc2VudCBwYWdlClsgIDczMi45MTY2
MjFdIFBHRCAwIFA0RCAwClsgIDczMi45MTcwNzJdIE9vcHM6IDAwMDIgWyMxXSBTTVAgUFRJClsg
IDczMi45MTc2ODJdIENQVTogNyBQSUQ6IDAgQ29tbTogc3dhcHBlci83IFRhaW50ZWQ6IEcgICAg
ICAgICAgIE9FICAgICA1LjQuMC1yYzcgIzEKWyAgNzMyLjkxODk4MF0gSGFyZHdhcmUgbmFtZTog
UUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgcmVsLTEuOC4yLTAt
ZzMzZmJlMTMgYnkgcWVtdS1wcm9qZWN0Lm9yZyAwNC8wMS8yMDE0ClsgIDczMi45MjA5MDZdIFJJ
UDogMDAxMDpkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCsweDNlLzB4MTAwClsgIDczMi45Mzg1Njld
IENhbGwgVHJhY2U6ClsgIDczMi45MzkwMDNdICA8SVJRPgpbICA3MzIuOTM5MzY0XSAgZG1hX2Zl
bmNlX3NpZ25hbCsweDI5LzB4NTAKWyAgNzMyLjk0MDAzNl0gIGRybV9zY2hlZF9mZW5jZV9maW5p
c2hlZCsweDEyLzB4MjAgW2dwdV9zY2hlZF0KWyAgNzMyLjk0MDk5Nl0gIGRybV9zY2hlZF9wcm9j
ZXNzX2pvYisweDM0LzB4YTAgW2dwdV9zY2hlZF0KWyAgNzMyLjk0MTkxMF0gIGRtYV9mZW5jZV9z
aWduYWxfbG9ja2VkKzB4ODUvMHgxMDAKWyAgNzMyLjk0MjY5Ml0gIGRtYV9mZW5jZV9zaWduYWwr
MHgyOS8weDUwClsgIDczMi45NDM0NTddICBhbWRncHVfZmVuY2VfcHJvY2VzcysweDk5LzB4MTIw
IFthbWRncHVdClsgIDczMi45NDQzOTNdICBzZG1hX3Y0XzBfcHJvY2Vzc190cmFwX2lycSsweDgx
LzB4YTAgW2FtZGdwdV0KCnYyOiBob2xkIHRoZSBmaW5pc2hlZCBmZW5jZSBhdCBkcm1fc2NoZWRf
cHJvY2Vzc19qb2IgaW5zdGVhZCBvZgogICAgYW1kZ3B1X2ZlbmNlX3Byb2Nlc3MKdjM6IHJlc3Vt
ZSB0aGUgYmxhbmsgbGluZQoKU2lnbmVkLW9mZi1ieTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYwppbmRleCBhMThlYWJmNjkyZTQuLjhlNzMxZWQwZDlkOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTY1MSw3ICs2NTEsOSBAQCBzdGF0aWMgdm9p
ZCBkcm1fc2NoZWRfcHJvY2Vzc19qb2Ioc3RydWN0IGRtYV9mZW5jZSAqZiwgc3RydWN0IGRtYV9m
ZW5jZV9jYiAqY2IpCiAKIAl0cmFjZV9kcm1fc2NoZWRfcHJvY2Vzc19qb2Ioc19mZW5jZSk7CiAK
KwlkbWFfZmVuY2VfZ2V0KCZzX2ZlbmNlLT5maW5pc2hlZCk7CiAJZHJtX3NjaGVkX2ZlbmNlX2Zp
bmlzaGVkKHNfZmVuY2UpOworCWRtYV9mZW5jZV9wdXQoJnNfZmVuY2UtPmZpbmlzaGVkKTsKIAl3
YWtlX3VwX2ludGVycnVwdGlibGUoJnNjaGVkLT53YWtlX3VwX3dvcmtlcik7CiB9CiAKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
