Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB9394921
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1885D6E215;
	Mon, 19 Aug 2019 15:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710079.outbound.protection.outlook.com [40.107.71.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCEA6E1F6;
 Mon, 19 Aug 2019 15:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgkRu9hi1GXk9r9x9q3/ca/FnAeP4+Zj7XDlqZrkU8s5injmDDksYsrTbXDYqpidWr2O3jhCRvWJeSNeJiUEka0uadpUoJPuhizBO8SF6T40Bg2BV52kBpTZOZy2i6xSah13Rf0rccCcEOI0IkvhdEKMoj2KHf9SrEOJqwL4+lCqcSU8qanRXYOKAfrPw5gOWrD0wdjagGlOjmftTdLrLQipOHDEviOuwyBlX66LTRGTR28WDUq2D1S5/T3QcYnaK0ejmJpiPGo4RqVqWcqNQIAx+uz4VSDoE5rs+3OMgCWqieZRSXYAlXnKjfIE0zGO0T3qU4XPVZS1rwcBZ2f0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4emURVaqKiHRKtKebbU/RRGtVrUJo5/Yq/SLV2qNrGM=;
 b=OukGjwKLUmqnai9MPHsPvWMENi4RKmHPxJhprSWxPLAch8XT1rmjGRQaeg+sl/LL/G6otWBM/dxLdvaETHwmqJ2FRvnP5O6qekuXldCaKRwbN99tjc4dmiqGtyI3zv2xu40jKvPSebtepv7Poe/D8k0R+e0kvos9c+FQ5UB83PwVYbKNEbXhxGUmLMUOnBH12JQt4s9ZYcE19VaS8aBSa0zXDmHEXVLI6WfZOxptjEhIzPm0RUnoyaZvCBcdOGqgRwoms3KLD9v9hfGZ3wUWPP1NyuAGj6yVw393yRYl6gm3HgebhCZnZFazyayQIsYM+SimrqRWOs0/R9z2rY/GbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0046.namprd12.prod.outlook.com (2603:10b6:0:56::14) by
 DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:50:54 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM3PR12CA0046.outlook.office365.com
 (2603:10b6:0:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:54 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:49 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/14] drm/dp-mst: Export symbols for dpcd read/write
Date: Mon, 19 Aug 2019 11:50:33 -0400
Message-ID: <20190819155038.1771-10-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(316002)(81156014)(305945005)(50226002)(51416003)(50466002)(478600001)(2906002)(48376002)(4326008)(86362001)(356004)(6666004)(47776003)(76176011)(4744005)(8936002)(70206006)(81166006)(110136005)(16586007)(8676002)(49486002)(186003)(5660300002)(450100002)(36756003)(1076003)(26005)(336012)(446003)(11346002)(426003)(53936002)(486006)(126002)(476003)(2616005)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f3c0eb2-f3eb-4dba-adba-08d724bd04b5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1276ECB9779ECAB52C6AF2A4EFA80@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: snkMGFEQ8ayGJL9uZeD5Q8yCghGsvSIIot5FfgQmLCCjBVSQHctl7QmQ/55pYfKpFodE5FEQ0Hx43oLbRZ09zuDjVpvc8zoOpN5ynr9alTm7Iy+6/n1Pj2A04Q0CgdrPSnCVptDfb/qbwTRUglrjTAIXg/Aagol6nVXqi9m8pS92uWJfokwL4kKWNWrwcR5ihMNWdkCTbrvECImCNETgNxSJwdo2tD95Rbtpkn/nA3Dzwy1ySvD0eY+u3uPjiGkaljnRcHAI1wPyGbJ/QCQ0IiaeJks661w6dIsFct93ZY4GmLJa03LHE88xQDhQv4DPMSUxRcW0ayMdOZ7MqqWX5GQZIhaJ2M49LXjHC4kIEzmK4FFhLEjXCROeBIvQx6Q8h+MqD0IeEC3TPe2FWKBqVA6LvgMGIEtt6x8fifCh+P0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:54.1047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3c0eb2-f3eb-4dba-adba-08d724bd04b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4emURVaqKiHRKtKebbU/RRGtVrUJo5/Yq/SLV2qNrGM=;
 b=GlWm2UWr5uAljzjVK/Cfgm9z62HKs+fFV7wIE/UHbvnmgYEknbCPRIIYSS2Q5WQxhuvTbT4XXozmF7sInb43gd8MEiDk0UNMI2skU9b5CQ/hfgHF7LBxeeS5Pe31vhBxPwykNRa4LH5pLn+P0YfvVDlp9Z6wO7FEPcaJlb9nXaI=
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
X21zdF90b3BvbG9neS5jCmluZGV4IDUzYTBhZDE2ZTM3Yi4uNWEwNzI1NzFjYjQ0IDEwMDY0NAot
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
