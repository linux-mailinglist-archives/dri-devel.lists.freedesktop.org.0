Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2051610F646
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 05:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893F06E37F;
	Tue,  3 Dec 2019 04:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE636E379;
 Tue,  3 Dec 2019 04:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J71c4cvywPEJLk7VBK1uWNBZGB1ZWDqWvvyOKroMDm4sRhpo6kuDrZV2SE9awkZr8Mo1OoI56vCE8glxNbNFT7XFKi2cDtLyxZ3Cvvbof1FnEidhGgLZpnCNVwnqHuK3pVOt0u/M1lE9vxnMRTfgs9z3b2gF0dB4YO2UpFGbh5hj1rCfXoCavNWK/wXgSxS5mhOmJRN3l1FoQIFjwcCBeiJjhuveCS0eTEiyWgzpYPMPV73yQJrr7U1fL7PvBXFKqp0KFB5CCXmTuNFYxM1Xyh5b/pXgzmY1AeU0yz++K0buRYSB/px033S1Nt3RlUChZATdWG9vmxSWj/naJnFPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeY9sOvJKgySrocSHq00gqKYwLNel0jO87Qw+qq9LBE=;
 b=enU+TDv+3muHluwFvrPOEnUBdkwrYkaO7XT0/inOsItnYscYvxAlryIFblzgLzoP9/YQy4rZaB5jsAWrNsYMLu2wxXrw54P7HjKYsB3xlYYFFz09gJ8sopAZ4Nf6gIgUarBpmPCBYD3JDORkfgc9/mn2Q7NjAvXGlSdc5ZY5ocjsKasNACWyJbJ2KcdrE0Lh46UsvMZ0UOttHxLeeg1QBEub4JX77C7oMKaeSUM783QQZvkPZJn8lYttf6mCw20cepdMwnxEwiQJyZ7mXdofTfeOi0/2nPpNex0stgiRq5j7IyzctueA7XNbQX715YzayXf1KglAwV9vXIObs+BP1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:610:57::32)
 by MWHPR12MB1693.namprd12.prod.outlook.com (2603:10b6:301:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 04:24:57 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by CH2PR12CA0022.outlook.office365.com
 (2603:10b6:610:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 04:24:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 04:24:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 22:24:56 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 22:24:55 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 2 Dec 2019 22:24:53 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
Date: Tue, 3 Dec 2019 12:24:23 +0800
Message-ID: <20191203042423.5961-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(428003)(199004)(189003)(478600001)(53416004)(305945005)(2906002)(5660300002)(110136005)(16586007)(54906003)(36756003)(86362001)(316002)(70206006)(47776003)(6666004)(356004)(14444005)(48376002)(50466002)(426003)(2616005)(336012)(26005)(186003)(51416003)(70586007)(7696005)(50226002)(1076003)(8936002)(4326008)(81156014)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1693; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e08dec3-5780-4c79-c087-08d777a8c0b2
X-MS-TrafficTypeDiagnostic: MWHPR12MB1693:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1693B1A99FB8172AB9322998FC420@MWHPR12MB1693.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDQ5iLelibsaEKE/18ibpCu83g/AHaD8t5mNFJZocvb3R4IZZSI7IHymavGq96F3gy/jXcTMLn4Cx0bAf+mBPvmmFygIYAmmVb/6XoYz0kNlMqTZcPHzTyQGDz+meXma9y0FbNDWJirOcjC9MgbxfoqIfWJBNshz5NI0QLEAJdPOcjLOJlVxBKthenn2sSQiy5BN5MQBKr7TJ6MesuWjnQIyCxBjvpCrr+3V7x9f4teWhMZhIPA6ZVoQ9iKJsmIdodAOPnzbaHjHwmApipeLUiounmIZGecXZGT3p2FhUOrWXoZYU35xe0ijBJQAESq9MNNPbOXQ3fNsdhBnRtE1p1Z9+JAwr+qnwEyYdhAeH62ggPZCUPyCGrdwNS7dZWPqdoSVm7INtPgFLeto5Ozzd6khnCeCKGVispi7jfbLd1+vC9Rd/IL/CYFHum6JIEiH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 04:24:56.6493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e08dec3-5780-4c79-c087-08d777a8c0b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1693
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeY9sOvJKgySrocSHq00gqKYwLNel0jO87Qw+qq9LBE=;
 b=caOjoGuNaJ0njtMjUiltEvRJlmf/rT/DwF+t/9wtyDZ609EPotuSvb9Eg92OGlG6YTPF2MQCAyTUyVaBq3H7paeQmi5OoMQ3pJHany726GMqt8EzLLLN72favcaLPFAIW3pZCPYaqV5+BVe79U1B0RqUSTdUF6ldANApH5xpFVQ=
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KSWYgdGhlIHBheWxvYWRfc3RhdGUgaXMgRFBfUEFZTE9BRF9ERUxFVEVfTE9DQUwgaW4g
c2VyaWVzLCBjdXJyZW50CmNvZGUgZG9lc24ndCBkZWxldGUgdGhlIHBheWxvYWQgYXQgY3VycmVu
dCBpbmRleCBhbmQganVzdCBtb3ZlIHRoZQppbmRleCB0byBuZXh0IG9uZSBhZnRlciBzaHVmZmxp
bmcgcGF5bG9hZHMuCgpbSG93XQpEcm9wIHRoZSBpKysgaW5jcmVhc2luZyBwYXJ0IGluIGZvciBs
b29wIGhlYWQgYW5kIGRlY2lkZSB3aGV0aGVyCnRvIGluY3JlYXNlIHRoZSBpbmRleCBvciBub3Qg
YWNjb3JkaW5nIHRvIHBheWxvYWRfc3RhdGUgb2YgY3VycmVudApwYXlsb2FkLgoKQ2hhbmdlcyBz
aW5jZSB2MToKKiBSZWZpbmUgdGhlIGNvZGUgdG8gaGF2ZSBpdCBlYXN5IHJlYWRpbmcKKiBBbWVu
ZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gbWVldCB0aGUgd2F5IGNvZGUgaXMgbW9kaWZpZWQgbm93
LgoKU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CmluZGV4IDgxZTkyYjI2MGQ3YS4uNGVmNmRlY2MwNTUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKQEAgLTMxNzYsOSArMzE3NiwxMSBAQCBpbnQgZHJtX2RwX3VwZGF0ZV9w
YXlsb2FkX3BhcnQxKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQogCQkJZHJt
X2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsKIAl9CiAKLQlmb3IgKGkgPSAwOyBpIDwg
bWdyLT5tYXhfcGF5bG9hZHM7IGkrKykgewotCQlpZiAobWdyLT5wYXlsb2Fkc1tpXS5wYXlsb2Fk
X3N0YXRlICE9IERQX1BBWUxPQURfREVMRVRFX0xPQ0FMKQorCWZvciAoaSA9IDA7IGkgPCBtZ3It
Pm1heF9wYXlsb2FkczsgLyogZG8gbm90aGluZyAqLykgeworCQlpZiAobWdyLT5wYXlsb2Fkc1tp
XS5wYXlsb2FkX3N0YXRlICE9IERQX1BBWUxPQURfREVMRVRFX0xPQ0FMKSB7CisJCQlpKys7CiAJ
CQljb250aW51ZTsKKwkJfQogCiAJCURSTV9ERUJVR19LTVMoInJlbW92aW5nIHBheWxvYWQgJWRc
biIsIGkpOwogCQlmb3IgKGogPSBpOyBqIDwgbWdyLT5tYXhfcGF5bG9hZHMgLSAxOyBqKyspIHsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
