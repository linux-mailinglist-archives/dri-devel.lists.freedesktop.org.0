Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F694913
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383EB6E1F2;
	Mon, 19 Aug 2019 15:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FB66E1D5;
 Mon, 19 Aug 2019 15:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scv+VA1N0u/ikOU2e3ohGqmee84ZVuWE7reysHb6M/wq8y+rMdDja3hhS3yIZXzuytNUpkUdWxYc2cZUawt95VaSTY9hlQR4om5Low1CbuolhvkAhKIFTZAOc0L8p4tcbFFxjbgTtd//afkaJbcp0Qs2Ad72yyqdC8dh/3A0+WLyZLaVGlse/mXtxHdFRYaqZMJMKTT0mDpVWZnV+fHcj7DexmjClPSJHqO1j9xmo2zZEccIUo+WgRuqtNyFNHhBYAvvgXXDxrArCzrMko+48kjTpBdRNAKdApSuKuZyP/ra8wlYlVXVOOQg1+bdRHBxWaU9h6iyMbRKwLBBGWDvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGOHMp66D4RwNQshVsZbhZYpolMPc6WtZGb1C0wncjk=;
 b=KHk/AWUW8e6r7PXvFGkD1Zkr+m1Z8qlxqTiFpPqd9lZkwKgwCuQq5keqYrwzMUv3/pP+9l++5DrRc8diRR2UNivJhi/WtGLSkWSQAO2CDHNAR7lc+DFcO8Zk1AM5R4gDFg37Ffgz5e+XC80EY4D/H4h5IsJlLhwa6RS4EMZcOeO/XSMBenAou+HUihS5wJNcKiOAmbKFXnVQPNcJy2Tvae1grEXltX9L5w2mWIGTSL/h/VGUYZhyklnr1+ODcDInO2EE3vfDY32lbUfYbGACOH2ySpPu5wXl4cnwJgyi/1o5YcOWVwqoHy9VFDB2/wEu9tdEKEGqIqacvPtNUPrUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
 DM6PR12MB2716.namprd12.prod.outlook.com (2603:10b6:5:49::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:50:47 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0054.outlook.office365.com
 (2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:46 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:46 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/14] Revert "drm/amd/display: skip dsc config for navi10
 bring up"
Date: Mon, 19 Aug 2019 11:50:25 -0400
Message-ID: <20190819155038.1771-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(2616005)(5660300002)(446003)(476003)(126002)(336012)(26005)(14444005)(186003)(478600001)(486006)(4326008)(426003)(51416003)(11346002)(50466002)(53936002)(76176011)(305945005)(50226002)(47776003)(1076003)(450100002)(70586007)(6666004)(48376002)(356004)(2906002)(16586007)(36756003)(86362001)(8676002)(81156014)(81166006)(49486002)(8936002)(110136005)(316002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2716; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88193383-a983-4424-a216-08d724bd005b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2716; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2716:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2716C282A7E722D28EF186B6EFA80@DM6PR12MB2716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SAr5uWrADHv/05pW8PovmCNm1toPbBhS24cflzHqRItzJmINxsexyYWsARVqVv6+8mNPsTrU7MdCaOSth50/UyeBwML6MqjY7FkvagYTHE5e8g7QOSUtdvOe8/nYhtYgn56N+3HWFu30S3HQg79dmQuKbi08dJXgFShhnOujApdvXZDZoGEWFW2lt3Tm2uBncbKsnOmsu/1aufCqxdzgO0v/XfR20DpBu+C/s6qlXrCddRpqIoQzI4ep1g0z9vfQJ8dxlhqFDyKPn6UpeXBTdBRqDFFSUfrbJjM3duLN5LgUkB9LD7rnwX6+zOhptYV9qQ0yCbpnvIyhRDoqvv4MnMv5BtiYIpgRc0RV5ND7hEhvKYDXL1JpTdGDCOfR2SsKwfaK4eYY7hBW9KvwAHlM+6fL+dHlJYRjZ7/isakEVsU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:46.8127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88193383-a983-4424-a216-08d724bd005b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGOHMp66D4RwNQshVsZbhZYpolMPc6WtZGb1C0wncjk=;
 b=B+UD8ZP3gFU4EIIBMM2CeiwCS+Rj3RdhZZscy/O0je0F6otayvcHM170p2NI1xxoxZgPlUILa3gjA9Smj4zWZxrsn0lqpPvspA7Y2Fpci5NL5HWQKzyNp6RzenjCZuChViOXzxe8Sy/XxRMEs3Rl8wdbgLklqAl1SJ8STktW0Ro=
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

VGhpcyByZXZlcnRzIGNvbW1pdCA1NWFkODFmMzUxMGVjMWExYzE5ZTZhNGQ4YTYzMTk4MTJkMDdk
MjU2LgoKb3B0YyBkc2MgY29uZmlnIHdhcyBjYXVzaW5nIHdhcm5pbmdzIGR1ZSB0byBtaXNzaW5n
IHJlZ2lzdGVyCmRlZmluaXRpb25zLiBXaXRoIHRoZSByZWdpc3RlcnMgcmVzdG9yZWQsIHRoZSBm
dW5jdGlvbiBjYW4KYmUgcmUtZW5hYmxlZAoKVGhlIHJldmVydGVkIGNvbW1pdCBhbHNvIGRpc2Fi
bGVkIHNhbml0eSBjaGVja3MgYW5kIGRzYwpwb3dlciBnYXRpbmcuIFRoZSBzYW5pdHkgY2hlY2sg
d2FybmluZ3MgYXJlIG5vdCBhc3NvY2lhdGVkCndpdGggZHNjLCBhbmQgcG93ZXIgZ2F0aW5nIG9u
IGRzYyBzdGlsbCBoYXMgYW4gaXNzdWUgb24Kbm9uLWRzYyBtb25pdG9ycyB3aGVyZSB0aGUgZHNj
IGhhcmR3YXJlIGJsb2NrIGlzIG5ldmVyIGluaXQKYW5kIHNvIGNhbm5vdCByZXNwb25kIHRvIHBv
d2VyIGdhdGluZyByZXF1ZXN0cy4gVGhlcmVmb3JlLAp0aG9zZSBhcmUgbGVmdCBhcyBpcwoKU2ln
bmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgpSZXZpZXdl
ZC1ieTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jIHwgOSAtLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfb3B0Yy5jCmluZGV4IGFlZGY5ZGUxYzk0Ny4uOTkwNzBlOTMwMjBiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMK
QEAgLTE5MSwxNSArMTkxLDYgQEAgdm9pZCBvcHRjMl9zZXRfZHNjX2NvbmZpZyhzdHJ1Y3QgdGlt
aW5nX2dlbmVyYXRvciAqb3B0YywKIAkJCQkJdWludDMyX3QgZHNjX3NsaWNlX3dpZHRoKQogewog
CXN0cnVjdCBvcHRjICpvcHRjMSA9IERDTjEwVEdfRlJPTV9URyhvcHRjKTsKLQl1aW50MzJfdCBk
YXRhX2Zvcm1hdCA9IDA7Ci0JLyogc2tpcCBpZiBkc2MgbW9kZSBpcyBub3QgY2hhbmdlZCAqLwot
CWRhdGFfZm9ybWF0ID0gZG1fcmVhZF9yZWcoQ1RYLCBSRUcoT1BUQ19EQVRBX0ZPUk1BVF9DT05U
Uk9MKSk7Ci0KLQlkYXRhX2Zvcm1hdCA9IGRhdGFfZm9ybWF0ICYgMHgzMDsgLyogYml0NTo0ICov
Ci0JZGF0YV9mb3JtYXQgPSBkYXRhX2Zvcm1hdCA+PiA0OwotCi0JaWYgKGRhdGFfZm9ybWF0ID09
IGRzY19tb2RlKQotCQlyZXR1cm47CiAKIAlSRUdfVVBEQVRFKE9QVENfREFUQV9GT1JNQVRfQ09O
VFJPTCwKIAkJT1BUQ19EU0NfTU9ERSwgZHNjX21vZGUpOwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
