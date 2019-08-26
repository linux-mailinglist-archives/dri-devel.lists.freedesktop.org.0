Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471F9D561
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7D889AC6;
	Mon, 26 Aug 2019 18:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790044.outbound.protection.outlook.com [40.107.79.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0C089AC6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArrVPy4m+8h8coGOwD8W4JWPmWU91UMV0ZatkiYUcdElwXIbk3SXITRD+N/dJRqL4Jaf1iGK9CygXviG+opVHOXrCOOXsmf+eFV1JJvdpMHhwrQY0sudTh6T6TPjGmEi62cr4yvjh6a0lPOOt74ergOXFhEIk+JKp2nwGxik59MMfh6QaFEaUVNRSBAthhA6m7WgttCXdfnL4VR0lQycetquXfOwK1cChnzshabCqOaJ6fL0E7UY79044AbrMCShMYSFLj7EHUkpwq8gpzH3eNTL45gvKhsO3U4AIZrxEqyLocwsyRbb1TnEFYuNyba8lh6+jom+n7AhL7f9Ld3AmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48k2TIpLtpUBW6T6RYrXwF8CxRZCvesTezukgQPp3b8=;
 b=GsOlzkBjariPc2jVUw6mBT1iwJK4KmhaG82Nylx7kDPCv7saaJ73ktEbtW0p6npaae7/rZRav2XZJEMzzuVbCRO3Cs20JLRcwiY4fxc/GqaIgBCzxfGayOLaMcd2r+y6AUyMN0fXh6vL2qi2PSLWr7NbGY5mg62qMyfBXO0L/hfWEzxI98jNGENYCy6ULAx5YsV1OG8rBuB4TncZI0POWxMIpa57lZj0WWnqE3ubjGXtrt3/R0A6sx0H0IYddascZ/eiFG66ENIW2jtVKL2ObBU1diwhAgsD6iM1mmcfUxxzAAHxrbnvEtfhpRkKjBbnOyp0hNSZJm7WrT0roHZqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:301:4a::16) by BN7PR12MB2705.namprd12.prod.outlook.com
 (2603:10b6:408:25::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Mon, 26 Aug
 2019 18:05:15 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR1201CA0006.outlook.office365.com
 (2603:10b6:301:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Mon, 26 Aug 2019 18:05:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 18:05:14 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 13:05:14 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 0/6] DSC MST support in DRM
Date: Mon, 26 Aug 2019 14:05:01 -0400
Message-ID: <20190826180507.17802-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(396003)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(53936002)(8936002)(50226002)(50466002)(48376002)(36756003)(51416003)(316002)(81156014)(8676002)(47776003)(16586007)(81166006)(126002)(486006)(426003)(2616005)(2351001)(186003)(26005)(49486002)(86362001)(476003)(6916009)(478600001)(2906002)(1076003)(5660300002)(336012)(356004)(70586007)(70206006)(4326008)(305945005)(6666004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edce6be6-5bfa-400d-4312-08d72a4ff22e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB270598367846F70B9D0FA0E1EFA10@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jZ1KVeMlCX0PXrSOM03T9LcGJ2G/WWfEDyTsQvjW2WuqYXYqzcCNmSoz+9OiX6agtS0/o3iHeSuZbw0Ri7/FE5ii7tX1ba5bxIl0KAPmZMTn0Fwn2hiAIA5+cToUxrpxtgJcmcFD+Aqm0LZQ0f2NKkoPEnwb6MSZ4V7GneKu63FlxL3ht9plH6imNfrQkJ5Faq6Elk5Q7lHuFK+2QZxIkF27bDEVWJ65otjtdDz6CxFtusOAxh5LvwWqrMyLHPtaG09lyhMeTCt+S1sxWZFoVJSZwrdCz5PJPhxLJAF4q/bGUv9gH7O3SLiLxPlOTXO8BCdWgto3WmEo907tzCfsK4iIgdvo70D3OkDdbs20ws4FZFSGubGLd+2yEsKLWtTiP+JzBm14wVCLEZvp5sfke/BIzCEPZBQ/hR7SJK+qA2Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 18:05:14.8274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edce6be6-5bfa-400d-4312-08d72a4ff22e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48k2TIpLtpUBW6T6RYrXwF8CxRZCvesTezukgQPp3b8=;
 b=Jjh0b06477ukPuc3hMtJE3a4K6IRI/C4jhHfQg2+GrQvLv1n7JUhmSjCsqEu1h2iGOf5VQjbPlO/O1YhMCSZUHM9o2rwHyg6RLAyETPIL8mcG4YB9uhvNnGiGrCI9Rhz0z9I8Nx1D+2Ry8LHcqY2eyU/rBy1G+7wGLjb77ss3B4=
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

QWRkIG5lY2Vzc2FyeSBzdXBwb3J0IGZvciBNU1QgRFNDLgooRGlzcGxheSBTdHJlYW0gQ29tcHJl
c3Npb24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQoKdjQ6IFNwbGl0IHBhdGNoc2V0IGFu
ZCByZWJhc2Ugb250byBkcm0tdGlwCnY1OiBDbGVhbiB1cCBmb3JtYXR0aW5nLCBtYWtlIG5ldyBx
dWlyawp2NjogRml4IHR5cG8sIHNwbGl0IGxhc3QgcGF0Y2ggaW4gdHdvCnY3OiBGaXggY29tcGls
YXRpb24gd2FybmluZ3MKdjg6IEZpeCBhIG1pc3NpbmcgbXV0ZXhfdW5sb2NrCgpEYXZpZCBGcmFu
Y2lzICg2KToKICBkcm0vZHBfbXN0OiBBZGQgUEJOIGNhbGN1bGF0aW9uIGZvciBEU0MgbW9kZXMK
ICBkcm0vZHBfbXN0OiBQYXJzZSBGRUMgY2FwYWJpbGl0eSBvbiBNU1QgcG9ydHMKICBkcm0vZHBf
bXN0OiBBZGQgTVNUIHN1cHBvcnQgdG8gRFAgRFBDRCBSL1cgZnVuY3Rpb25zCiAgZHJtL2RwX21z
dDogRmlsbCBicmFuY2gtPm51bV9wb3J0cwogIGRybS9kcF9tc3Q6IEFkZCBuZXcgcXVpcmsgZm9y
IFN5bmFwdGljcyBNU1QgaHVicwogIGRybS9kcF9tc3Q6IEFkZCBoZWxwZXJzIGZvciBNU1QgRFND
IGFuZCB2aXJ0dWFsIERQQ0QgYXV4CgogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1faGVscGVycy5jIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAg
ICAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAg
ICAgICAgICAgICB8ICAzMiArKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jICAgICAgICAgfCAxNzIgKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL2Rpc3AuYyAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHBfbXN0LmMgICAgICAgIHwgICAyICstCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmggICAgICAgICAgICAgICAgICAgfCAgIDcgKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9o
ZWxwZXIuaCAgICAgICAgICAgICAgIHwgICA4ICstCiA5IGZpbGVzIGNoYW5nZWQsIDIwOSBpbnNl
cnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
