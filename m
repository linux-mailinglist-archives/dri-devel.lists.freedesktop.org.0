Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD749692A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524FD6E866;
	Tue, 20 Aug 2019 19:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790055.outbound.protection.outlook.com [40.107.79.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613B6E866;
 Tue, 20 Aug 2019 19:12:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHgeXu6/+47P01MrznAIRUYt5EtGyO0wJS+ymn3dNaP7YGHMw//c4oKLzq30Du7R3f0ppsdxW6OEu/afgpQbm1579pxTcbA03k/O56D8RoJHdznakpOxf5yU8yFV0POaGJSMOdQV35PRCY08oec65OEXBXlFPOCLp2GsgfhCfnxL6ujqIsDK1f1mfXhLKvXd/4h91DLpotgEa+Ut9MZ91qdhOL+rqfm4bwLBjYAuqn5cPmN+wyuXR9dZOrvl+WL0UsOVC9VU8TqY8P39dTwHD9UEyMwlcDwOB6fCJgSqa0B+Pp7WZq1iYMjseXVFxSYTlx1y3XuE6NJlh3NyetZ+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzTeIu1BntjAS6locUam6LE1vFmGohGNBgHeqnseT3A=;
 b=eumIPNHkesb0eZtsQ7grkzl2IdZP1QB7RhLCiDZnJ6eAgCOG9SipRC3isHK7A4DUjRmX0sZL50C1APzBAlaSTVEzbv8KOSeLP2GF9yCqcJFAiZDuE1nzhzkFdwFI+ckE6wvIP5TcTF/QxLnX+1b/IiuidOToaW+VwP/dDghU3znNCXMAZVS5NVdYVfB0hGQEjbFylArxjhh/r8rE0OAjWqBIR8t8m+dbXuPFZIMzBKgDTBojJleSu/YMyUg7GOjvvs4QVTs6CHnN3io4bKNAc4TgKUQ34MEfeyG0V+ctr8m5HoIN/PhNlkdu2kHn4+HKnF7xBApQxvkb11tno/0VDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by BN7PR12MB2705.namprd12.prod.outlook.com
 (2603:10b6:408:25::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 20 Aug
 2019 19:12:28 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:27 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:24 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 09/14] drm/dp-mst: Export symbols for dpcd read/write
Date: Tue, 20 Aug 2019 15:11:58 -0400
Message-ID: <20190820191203.25807-10-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(450100002)(6666004)(50466002)(336012)(356004)(48376002)(50226002)(5660300002)(53936002)(16586007)(47776003)(316002)(2906002)(110136005)(478600001)(305945005)(76176011)(186003)(51416003)(26005)(4326008)(70206006)(36756003)(81166006)(81156014)(70586007)(1076003)(49486002)(486006)(8936002)(86362001)(4744005)(476003)(11346002)(446003)(426003)(126002)(2616005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4def1dfa-2823-46b7-dd27-08d725a25768
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2705A5BA7B097B80A38B7052EFAB0@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DtyOdje9N/+c6tvl4mysMowdaExgXdVtoF7GCvXYNZF5VcLYIxIRbUetLb6JHlFesfKK9Q+jDRodFcGeTrHOWHqWtB+PI/roBx2W8Rj572i1DNagpJz8WAdYyIsV7bFGsVaNxFxZR7gekluDWE2JeTNjISHIUrxTOslIe7J+r3DGOV33QGrFe4cE9onuORA0CbZ0GmQuH7/aUk3RCZyKxMUWE1CzABlpW3eGL3Dj4AOjI6zaGJofQDHoHaePP1N/d0ACy5NshFRqVRDiDghc/d/Dw2M1z0JmHbMadUo/qCfI1Bpl2PrYvw0515zyjrtIPyemtexC9uoyBMS26D9OrPnAcWOjWUHDieRk3ULUVRiyj2xqLqmYntFPlLGmTBnulEbq7sUbJoySIcPqlfwgBPWl/A0O26GclbmGwgTpxn0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:27.5662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4def1dfa-2823-46b7-dd27-08d725a25768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzTeIu1BntjAS6locUam6LE1vFmGohGNBgHeqnseT3A=;
 b=O52tREZuSkMg1eKtINKWn8z2d9tZYUK0I5n95wgemQDZDd+1Oaxu1lMDh40qTTUtgohttgdFE+IJagMVtx98K2ZZsE8QuL1tpt9DECTM1cNajvx6TMOh2gfW+VljaAU3YLU8Jhj+3MwfhmwMGM51mXIIj4SDjC1gKGdy8HcF/oU=
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

VG8gdXNlIHRoZXNlIGZ1bmN0aW9ucyBpbiBkcm0gZHJpdmVyIGRpcmVjdG9yaWVzLCB0aGV5IG11
c3QgYmUKZXhwb3J0ZWQKClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5j
aXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jCmluZGV4IGI0MGQ5NzVhZWM3Ni4uNWQ1YmQ0MmRhMTdjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTE1MTIsNiArMTUxMiw3IEBAIHNzaXpl
X3QgZHJtX2RwX21zdF9kcGNkX3JlYWQoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAlyZXR1cm4g
ZHJtX2RwX3NlbmRfZHBjZF9yZWFkKHBvcnQtPm1nciwgcG9ydCwKIAkJCQkgICAgIG9mZnNldCwg
c2l6ZSwgYnVmZmVyKTsKIH0KK0VYUE9SVF9TWU1CT0woZHJtX2RwX21zdF9kcGNkX3JlYWQpOwog
CiAvKioKICAqIGRybV9kcF9tc3RfZHBjZF93cml0ZSgpIC0gd3JpdGUgYSBzZXJpZXMgb2YgYnl0
ZXMgdG8gdGhlIERQQ0QgdmlhIHNpZGViYW5kCkBAIC0xNTM1LDYgKzE1MzYsNyBAQCBzc2l6ZV90
IGRybV9kcF9tc3RfZHBjZF93cml0ZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCXJldHVybiBk
cm1fZHBfc2VuZF9kcGNkX3dyaXRlKHBvcnQtPm1nciwgcG9ydCwKIAkJCQkgICAgICBvZmZzZXQs
IHNpemUsIGJ1ZmZlcik7CiB9CitFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfZHBjZF93cml0ZSk7
CiAKIHN0YXRpYyB2b2lkIGRybV9kcF9jaGVja19tc3RiX2d1aWQoc3RydWN0IGRybV9kcF9tc3Rf
YnJhbmNoICptc3RiLCB1OCAqZ3VpZCkKIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
