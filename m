Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC42E9F4D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 22:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7471D6E055;
	Mon,  4 Jan 2021 21:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8A96E055;
 Mon,  4 Jan 2021 21:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHD6w2NjsO8+fxtU24S0m1tf0y/3gUFTjLAe0WXpEi4Yr/60II24hR0SWD6Vn4+V876Jo58yKROG8s+k9Zt0ua9LlVJ3+F9Dvj+07indAmylcvQdFXMUgshZgSdNOPK2s7YI1Lm/8ODOxPB3R/T9fmnuCJG8DcRnor17ahFS5bExhhyOpGbmmmLHyA60KizhEEpSVCZnwr97cUfY7yZVqRMGYxsoozcm+MxfPO1t5SNvlCiNHliW3Duqg9Ch2Jsiksd1WePZVvS645KuqQe36AMJR7H3rbPpuEw/NyGrhKxTifv7z4xMYoMjTzQLmXU6/0+xv58XYmQ0TDzDee85VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkRPBDSGtsZySrTqYlWjwUfn0dhd9qnPcdjJMU6LNBY=;
 b=mstzfVR+nqrGAesB5VINljae0toPN7ZDc6OI7VWYc+aVMBZYEX+hYCpG8DJvxk1pVshq5s5Z52ViKzgIbdte09z02OuATlQA3ax/rvuWpAnVXcWRtsCrc7Xfopa5CSYCJQslsOoz5MOannnza2pbbeMyL04RNeTzAbnkiwOatuUkatLX3rhdQ/Z02SMFWYI9+GH0m97WkSZpn8KEXxiIMnazW8LD+laKewmcnkwpflzcyop1v/3QxXSh001KigTXX+ihzrFPSUTforgiomkfBals/AtPXo0leNwM9EoFsLMnuuhxz4eYKDSJKlp+w2UGlfaoP4DbyVcf8nekhLl1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkRPBDSGtsZySrTqYlWjwUfn0dhd9qnPcdjJMU6LNBY=;
 b=d2O3azC73i/rwHH+cKcqFET2RLQ/MYx40b19slOXZIr8MQaN687AqQ/W9ZcVs296o62shcqkZ5cSq4M/FEItBp7tD4Li7rwOkIbIPD4t0NYtzlCOhA2qFVpKj61+Xl5iGNUQmwS7B3aH/WmTIoKiHuTmJZL2P8I0IC1EQpQ9WA0=
Received: from DM3PR12CA0043.namprd12.prod.outlook.com (2603:10b6:0:56::11) by
 MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.24; Mon, 4 Jan 2021 21:08:22 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::e7) by DM3PR12CA0043.outlook.office365.com
 (2603:10b6:0:56::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 21:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.23 via Frontend Transport; Mon, 4 Jan 2021 21:08:20 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 4 Jan 2021
 15:08:19 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Mon, 4 Jan 2021 15:08:18 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <nicholas.kazlauskas@amd.com>
Subject: [PATCH v3 1/3] drm/amd/display: Add module parameter for freesync
 video mode
Date: Mon, 4 Jan 2021 16:07:58 -0500
Message-ID: <20210104210800.789944-2-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104210800.789944-1-aurabindo.pillai@amd.com>
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb9cdaf9-21e3-4492-5de6-08d8b0f4dd40
X-MS-TrafficTypeDiagnostic: MN2PR12MB4453:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4453AA35DE923D4D934806B68BD20@MN2PR12MB4453.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKZE6F4p73rI6YELZnL5s1B4yyz0x65W7YwSrmrrcmPIQ5B8hvbUuzDYg2faYICWEQS9Tu4CJVrf/7SL6CcEdmHJLALdvhHdIJ3Th1sAkqd/Yq07gLR0JFHL1NSIKvI5+ZSmT2AWn9EePTs3T13T1eS4ojyT+2VvtqTu06bIzWFMkHLEYdgNVkx4JB6boMN/p/Lyuj4YuPL0/Zl9IFXR2NTIen9g6danmmO2cCJ528qZw8at7tT9D9UzOj5nm0eEMk6jLrvhY5VCZrJIJ91ujKnZOPV/21QN5NzvX/iwRJMuNX4fgfd7KZjYrDbCrjv9AAq7j8y/MwRhMlHQQ53H2YOsvdoT3QZQQ3/KQ+CrkZhwlv/2cUd8l6JUHenM3nWEB1mK50qaVAX/mhifek4UT96HLwebvJFiCtSq42hSGLQ+ByxFHmcZ2dYu6d4qekoYGRWeIJ0np20PgXMAI+LDVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(110136005)(8676002)(54906003)(6666004)(4326008)(44832011)(316002)(450100002)(70206006)(70586007)(7696005)(478600001)(5660300002)(2906002)(1076003)(26005)(36756003)(86362001)(2616005)(426003)(186003)(83380400001)(8936002)(47076005)(356005)(336012)(81166007)(6636002)(82740400003)(82310400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 21:08:20.2477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9cdaf9-21e3-4492-5de6-08d8b0f4dd40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, shashank.sharma@amd.com,
 aurabindo.pillai@amd.com, wayne.lin@amd.com, alexander.deucher@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeSZIb3ddCkFkZHMgYSBtb2R1bGUgcGFyYW1ldGVyIHRvIGVuYWJsZSBleHBlcmltZW50YWwg
ZnJlZXN5bmMgdmlkZW8gbW9kZSBtb2Rlc2V0Cm9wdGltaXphdGlvbi4gRW5hYmxpbmcgdGhpcyBt
b2RlIGFsbG93cyB0aGUgZHJpdmVyIHRvIHNraXAgYSBmdWxsIG1vZGVzZXQgd2hlbgpmcmVlc3lu
YyBjb21wYXRpYmxlIG1vZGVzIGFyZSByZXF1ZXN0ZWQgYnkgdGhlIHVzZXJzcGFjZS4gVGhpcyBw
YXJhbXRlcnMgYWxzbwphZGRzIHNvbWUgc3RhbmRhcmQgbW9kZXMgYmFzZWQgb24gdGhlIGNvbm5l
Y3RlZCBtb25pdG9yJ3MgVlJSIHJhbmdlLgoKU2lnbmVkLW9mZi1ieTogQXVyYWJpbmRvIFBpbGxh
aSA8YXVyYWJpbmRvLnBpbGxhaUBhbWQuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZyBhdCBhbWQuY29tPgpSZXZpZXdlZC1ieTogU2hhc2hhbmsgU2hhcm1h
IDxzaGFzaGFuay5zaGFybWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMgfCAxMiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggMTAwYTQzMWYwNzkyLi4xMmIx
M2E5MGVkZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC0xNzcsNiArMTc3
LDcgQEAgZXh0ZXJuIGludCBhbWRncHVfZ3B1X3JlY292ZXJ5OwogZXh0ZXJuIGludCBhbWRncHVf
ZW11X21vZGU7CiBleHRlcm4gdWludCBhbWRncHVfc211X21lbW9yeV9wb29sX3NpemU7CiBleHRl
cm4gdWludCBhbWRncHVfZGNfZmVhdHVyZV9tYXNrOworZXh0ZXJuIHVpbnQgYW1kZ3B1X2V4cF9m
cmVlc3luY192aWRfbW9kZTsKIGV4dGVybiB1aW50IGFtZGdwdV9kY19kZWJ1Z19tYXNrOwogZXh0
ZXJuIHVpbnQgYW1kZ3B1X2RtX2FibV9sZXZlbDsKIGV4dGVybiBzdHJ1Y3QgYW1kZ3B1X21ncHVf
aW5mbyBtZ3B1X2luZm87CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5k
ZXggYjQ4ZDdhM2MyYTExLi4yYmFkYmM4YjIyOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKQEAgLTE1OCw2ICsxNTgsNyBAQCBpbnQgYW1kZ3B1X21lczsKIGludCBh
bWRncHVfbm9yZXRyeSA9IC0xOwogaW50IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGUgPSAtMTsKIGlu
dCBhbWRncHVfdG16OwordWludCBhbWRncHVfZXhwX2ZyZWVzeW5jX3ZpZF9tb2RlOwogaW50IGFt
ZGdwdV9yZXNldF9tZXRob2QgPSAtMTsgLyogYXV0byAqLwogaW50IGFtZGdwdV9udW1fa2NxID0g
LTE7CiAKQEAgLTc4Niw2ICs3ODcsMTcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKGFibWxldmVsLCBh
bWRncHVfZG1fYWJtX2xldmVsLCB1aW50LCAwNDQ0KTsKIE1PRFVMRV9QQVJNX0RFU0ModG16LCAi
RW5hYmxlIFRNWiBmZWF0dXJlICgtMSA9IGF1dG8sIDAgPSBvZmYgKGRlZmF1bHQpLCAxID0gb24p
Iik7CiBtb2R1bGVfcGFyYW1fbmFtZWQodG16LCBhbWRncHVfdG16LCBpbnQsIDA0NDQpOwogCisv
KioKKyAqIERPQzogZXhwZXJpbWVudGFsX2ZyZWVzeW5jX3ZpZGVvICh1aW50KQorICogRW5hYmxl
ZCB0aGUgb3B0aW1pemF0aW9uIHRvIGFkanVzdCBmcm9udCBwb3JjaCB0aW1pbmcgdG8gYWNoaWV2
ZSBzZWFtbGVzcyBtb2RlIGNoYW5nZSBleHBlcmllbmNlCisgKiB3aGVuIHNldHRpbmcgYSBmcmVl
c3luYyBzdXBwb3J0ZWQgbW9kZSBmb3Igd2hpY2ggZnVsbCBtb2Rlc2V0IGlzIG5vdCBuZWVkZWQu
CisgKiBUaGUgZGVmYXVsdCB2YWx1ZTogMCAob2ZmKS4KKyAqLworTU9EVUxFX1BBUk1fREVTQygK
KwlmcmVlc3luY192aWRlbywKKwkiRW5hYmxlIGZyZWVzeW5jIG1vZGVzZXR0aW5nIG9wdGltaXph
dGlvbiBmZWF0dXJlICgwID0gb2ZmIChkZWZhdWx0KSwgMSA9IG9uKSIpOworbW9kdWxlX3BhcmFt
X25hbWVkKGZyZWVzeW5jX3ZpZGVvLCBhbWRncHVfZXhwX2ZyZWVzeW5jX3ZpZF9tb2RlLCB1aW50
LCAwNDQ0KTsKKwogLyoqCiAgKiBET0M6IHJlc2V0X21ldGhvZCAoaW50KQogICogR1BVIHJlc2V0
IG1ldGhvZCAoLTEgPSBhdXRvIChkZWZhdWx0KSwgMCA9IGxlZ2FjeSwgMSA9IG1vZGUwLCAyID0g
bW9kZTEsIDMgPSBtb2RlMiwgNCA9IGJhY28pCi0tIAoyLjMwLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
