Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD39EA8F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C472892A5;
	Tue, 27 Aug 2019 14:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680071.outbound.protection.outlook.com [40.107.68.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42AF89B65
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAyXOk7DUGOftxcxd/JRbMmUVqvlxjTdP4wKzuSLZzZ5tUXdG+Ewjj/hgih94AgqGbGk56g2vdhypvy9XyKeMZ1q7+pBu8wUyLtojZN/Qv87JZJZh1pocHW5WIoUL7q3UFLRBKItu4AnYCUX1b99dVy4K7vJtbovPFS0eza208/H92+C0KDT4EfgP6PGvUjJ6ozrkChFpVR0tDskb76pWhDKPJtZZI7N0+NhmpgYy/2lK/oIXjeoRlqQFlAlsFyvU9NCSR2N7FZ1Vdb4niRxc+RChBgRTkGSD1jfWPh+1l8OFNxO+Odu1860pqdduB6P+v2KoURuRcybXZBeiP2Y4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7LFtqEZQWMVTKA24TGLE02rUQPQc1QyhuTf96Yscuw=;
 b=iVKmkFeL9yWqJgGeQO2jgxpdQNWR0DYur9oWJfJ+eb24MhBbgknesPiL+o0yFMqOR7dweqn1yUxNfk1o+NJdGMdhfnXfxgEawOStTQoo+cvHBM9SxqRUY43klU61VSJBO8KIckV9mwPlMR6BDzmcYqeHBbbjagCf9gSWomSNwjmx7hWxMDKgZPMk/J8XRR/w24kh4eTSbmDwF+INuLbHBVzCGk27kjWKklKGHPwSKm9kmrgFyRC3QLd+xEHFS1vbxk+i2rMxR/R9IktxuPlcR6W8nTBYfnm0bH+Ifn1HUZGkPRkKU1HVyKxzqruJhsxnv28nv/E9bsp9rKla36mtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:405:4c::20) by MWHPR12MB1277.namprd12.prod.outlook.com
 (2603:10b6:300:f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 27 Aug
 2019 14:13:31 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by BN6PR1201CA0010.outlook.office365.com
 (2603:10b6:405:4c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 14:13:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 14:13:31 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 27 Aug 2019 09:13:30 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 0/6] DSC MST support in DRM
Date: Tue, 27 Aug 2019 10:13:23 -0400
Message-ID: <20190827141329.30767-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(478600001)(126002)(49486002)(305945005)(6916009)(476003)(53936002)(36756003)(2351001)(48376002)(5660300002)(50466002)(70586007)(486006)(86362001)(336012)(70206006)(8676002)(316002)(6666004)(356004)(50226002)(2616005)(16586007)(2906002)(47776003)(26005)(4326008)(186003)(8936002)(81156014)(426003)(81166006)(51416003)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1277; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16b40a94-4265-41fb-3664-08d72af8bd6f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1277; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1277:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12777EDD503C090D614F2067EFA00@MWHPR12MB1277.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zJ0x+gYrAWElgQs0oKPRkEYblcwXwX1BAz2zvxQvBQC7D0tovDSR5QSOyN22xT1RzjYpLVsslsV95FLUNPfhsCVODMbxkPZhACrtWAs6q8lygfTZATsrLmrnTT2px9/SyVMrg9fcdS1i80qza+tvkg+HFj8P/W1QkhFZcYs7h6VoJfx4vlXiWFWvl3ibKxI+OlQ2EDliFCYNVE19jhr8cj0zgldblv741IIUfdEOmPwup//ORf9Fka6HBXY77RFm6+mDge8I/pMiTVnmh57jMAauGpsKt2tA5cc34w0XM25/6HdlfJb/H3Z9tquiDzaHm0xY7Xe+h8rdhxOKsp0v0qrVuPk92p2cBhsQQJpwVsmcaVpl98dZ4S7Jbsmi66fzzTrKxo8S6E1C1tSIDQ5cbsbwmn5B5obQSHHFibn+Hi0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 14:13:31.3201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b40a94-4265-41fb-3664-08d72af8bd6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7LFtqEZQWMVTKA24TGLE02rUQPQc1QyhuTf96Yscuw=;
 b=GYYSXsmKe7ZIDGDeWuLE3jxctj805G/mfbk5uLC3vhQylNNw2a4ibovbRo0s3rAOdDj8e/lp+PEIRpxbUHgnAedkDWKMvKU5fy7EnfCicc3B8vmonrH5c+Be1R/uFnAmcic8WsbPlNwZZH0yl1u2W3YiOHmEiy+tpzwb/K3JmeI=
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
c3Npb24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQoKTm90ZSB0aGF0IGV2ZW4gdGhvdWdo
IGVhY2ggb2YgdGhlc2UgcGF0Y2hlcyBoYXMgUmV2aWV3ZWQtYnksCnRoaXMgcGF0Y2hzZXQgaXMg
bm90IHJlYWR5IGZvciBtZXJnZSwgYmVjYXVzZQphKSBUaGUgbGFzdCB0d28gcGF0Y2hlcyBoYXZl
IGJlZW4gcmV2aWV3ZWQgaW50ZXJuYWxseSBieQpXZW5qaW5nIExpdSwgYnV0IHRoYXQgcmV2aWV3
IGlzIG9ubHkgb2YgdGhlaXIgaW1wbGVtZW50YXRpb24Kb2YgRFAgcG9saWN5LCBub3QgdGhlaXIg
c3R5bGlzdGljIG9yIGFyY2hpdGVjdHVyYWwgc3VpdGFiaWxpdHkKZm9yIHRoZSBrZXJuZWwKYikg
VGhlcmUgaXMgb25nb2luZyBkaXNjdXNzaW9uIG9mIGlmIGFueSBBTUQgTVNUIERTQyBjb2RlCnNo
b3VsZCBiZSBtZXJnZWQgdW50aWwgQU1EIHVzZXMgdGhlIERSTSBNU1QgYXRvbWljIGZyYW1ld29y
awoKdjQ6IFNwbGl0IHBhdGNoc2V0IGFuZCByZWJhc2Ugb250byBkcm0tdGlwCnY1OiBDbGVhbiB1
cCBmb3JtYXR0aW5nLCBtYWtlIG5ldyBxdWlyawp2NjogRml4IHR5cG8sIHNwbGl0IGxhc3QgcGF0
Y2ggaW4gdHdvCnY3OiBGaXggY29tcGlsYXRpb24gd2FybmluZ3MKdjg6IEZpeCBhIG1pc3Npbmcg
bXV0ZXhfdW5sb2NrCnY5OiBSZWZhY3RvciBsYXN0IHBhdGNoCgpEYXZpZCBGcmFuY2lzICg2KToK
ICBkcm0vZHBfbXN0OiBBZGQgUEJOIGNhbGN1bGF0aW9uIGZvciBEU0MgbW9kZXMKICBkcm0vZHBf
bXN0OiBQYXJzZSBGRUMgY2FwYWJpbGl0eSBvbiBNU1QgcG9ydHMKICBkcm0vZHBfbXN0OiBBZGQg
TVNUIHN1cHBvcnQgdG8gRFAgRFBDRCBSL1cgZnVuY3Rpb25zCiAgZHJtL2RwX21zdDogRmlsbCBi
cmFuY2gtPm51bV9wb3J0cwogIGRybS9kcF9tc3Q6IEFkZCBuZXcgcXVpcmsgZm9yIFN5bmFwdGlj
cyBNU1QgaHVicwogIGRybS9kcF9tc3Q6IEFkZCBoZWxwZXJzIGZvciBNU1QgRFNDIGFuZCB2aXJ0
dWFsIERQQ0QgYXV4CgogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVy
cy5jIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAgICAgICAg
ICAgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAgICAg
ICB8ICAzMiArKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAg
ICAgfCAxNzMgKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwX21zdC5jICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2Rpc3AuYyAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZHBfbXN0LmMgICAgICAgIHwgICAyICstCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAg
ICAgICAgICAgICAgICAgfCAgIDcgKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAg
ICAgICAgICAgICAgIHwgICA4ICstCiA5IGZpbGVzIGNoYW5nZWQsIDIxMCBpbnNlcnRpb25zKCsp
LCAzMCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
