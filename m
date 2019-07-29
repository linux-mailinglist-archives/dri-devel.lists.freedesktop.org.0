Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7239178733
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 10:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F28A89954;
	Mon, 29 Jul 2019 08:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0321989954
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 08:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h32LhRNiFiKnHSILcFtDm/bxlOz6+DI9AekujlGIpNVEVg+U/+dAY+PA4b19Iv/u2pLeonoHdQZtjkls2PG8Sibg2ujf+1jkeeciYdQg73sLhFWg7o7Ndr0r1ZSRUQzXeQsmkw1ufPQ2d4bfohq+0QEmJXkvMkxo7ljScD5lukcAgkF1Ed7fxG53ClZddvZUpvNwqHq2eikwtDQ6wxEzPzpsJ/j3UXgQD3bhrsINHC3+n1J48OUlEyOOKtArvClCOo2rc/dDJbNm770A6ILMPuDIGzGfn4vkdEY5wcZZ6aKwaxDIk8jh/FZ0/7oxPhWBwXQ4i8hCw9qcYB1w0yCFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meJOfGJTqAtLy2cy77W3hJVcGzdbBbY4ejyA0CblLfc=;
 b=BAW84XybzQc0FLzHg2ehDKabt/AWXRGqh7PWLPoyW1BDT5lSZxdiUO1wI/ao9CrBgIvDhbOG+zUqO0VsAZuk11GxcHHs2omcgl5d69got4xxGTZzz266HyxnOjSzRFLoWWcwP93jNk5oSCzC+VBjIZxMmksOXut/AtScQ52YFX17bs4oK/beiBFXDNc53LdMTmBsMK1ZXnPYu2nqcOT0baYq4EAaUQfwzaSDU9EKqBss8TUu8dqAd8Wy3Df5kPIryNfqpiLW8AdMZ2RaNCGQUReKULQod55FvIE+tg9LHcg02pSH2on/AJERtccaFKIYZA4MpeYJ+Wfm5IEgOKsF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0043.namprd12.prod.outlook.com (2603:10b6:301:2::29)
 by MN2PR12MB3518.namprd12.prod.outlook.com (2603:10b6:208:101::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Mon, 29 Jul
 2019 08:20:46 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR12CA0043.outlook.office365.com
 (2603:10b6:301:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.15 via Frontend
 Transport; Mon, 29 Jul 2019 08:20:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Mon, 29 Jul 2019 08:20:45 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 29 Jul 2019
 03:20:44 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/syncobj: remove boring message
Date: Mon, 29 Jul 2019 16:20:39 +0800
Message-ID: <20190729082039.23837-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(2980300002)(428003)(189003)(199004)(68736007)(81166006)(81156014)(2351001)(8676002)(6916009)(50466002)(356004)(6666004)(48376002)(50226002)(86362001)(8936002)(2906002)(478600001)(70206006)(1076003)(53936002)(51416003)(7696005)(5660300002)(305945005)(126002)(336012)(426003)(186003)(4744005)(47776003)(36756003)(26005)(53416004)(14444005)(2616005)(476003)(16586007)(486006)(4326008)(316002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3518; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02a6c5a8-2dc4-4b12-d4a4-08d713fda796
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3518; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3518F80390F470863671A40EB4DD0@MN2PR12MB3518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-Forefront-PRVS: 01136D2D90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EBPlozdV7FiC8/IHYHNoXCgApI57Syrs5cpH3V4+SDBAeO7D3+htlKS8Aow7kG1UXYOc0L+HURanwknyXcGV1XvJPBmesXF1CGhc9i9IsfvBIIaCBWoIv1wpIlr2wSG1NzVzc2URB12IJhFNGB7so4kl7r0EYM6dWT1tnlmFgG1vD0wAaAQGK/x6VYfiP0AKSfI4UQI6otN6Wlf6E0xMUU9nlVNsHZlF8ixLM51lLT8V6V783eU0MOgFFxRNH/xHBFR63awjFYE035dhA6UjNvWhJojaAFEML3KjjTnNMpSqUGDugxfFDobRhxR83+wZUVz/zO9P+EqcKd3xSByZ8QmVFo5/mVSnnMUdvvCp2HDNzmwC/0llWHvUO9CoZRl5ZrYadxC608FfEKDeqQBXKEblJThbbWAXKmxqA/mDlzs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2019 08:20:45.4277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a6c5a8-2dc4-4b12-d4a4-08d713fda796
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meJOfGJTqAtLy2cy77W3hJVcGzdbBbY4ejyA0CblLfc=;
 b=TWkNghilvA1jQuGVAxQy+Eait2AkNOTVV7EUUuYk6pQsZ3q9m0nAJ9Jxi7OIDa14UDfJRePeiS+AJBOLcAFdOSD0QFwlpCrCca7EPhExx22i/ULLI5PBclUOTdj+npUfqLLLUvuUvVOgjQLicw+3PbjMY3CodVmSjxWqpoi/QTs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgbm9ybWFsIHRoYXQgYmluYXJ5IHN5bmNvYmogcmVwbGFjZXMgdGhlIHVuZGVybHlpbmcg
ZmVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMyAtLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKaW5kZXggOTI5ZjdjNjRmOWEy
Li5iYzdlYzE2NzllNGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCkBAIC0xNTEsOSArMTUxLDYgQEAg
dm9pZCBkcm1fc3luY29ial9hZGRfcG9pbnQoc3RydWN0IGRybV9zeW5jb2JqICpzeW5jb2JqLAog
CXNwaW5fbG9jaygmc3luY29iai0+bG9jayk7CiAKIAlwcmV2ID0gZHJtX3N5bmNvYmpfZmVuY2Vf
Z2V0KHN5bmNvYmopOwotCS8qIFlvdSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGlt
ZWxpbmUsIHdoaWNoIGNvdWxkIGNhdXNlIHBheWxvYWQgcmV0dXJuZWQgZnJvbSBxdWVyeV9pb2N0
bCBpcyAwISAqLwotCWlmIChwcmV2ICYmIHByZXYtPnNlcW5vID49IHBvaW50KQotCQlEUk1fRVJS
T1IoIllvdSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUhXG4iKTsKIAlk
bWFfZmVuY2VfY2hhaW5faW5pdChjaGFpbiwgcHJldiwgZmVuY2UsIHBvaW50KTsKIAlyY3VfYXNz
aWduX3BvaW50ZXIoc3luY29iai0+ZmVuY2UsICZjaGFpbi0+YmFzZSk7CiAKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
