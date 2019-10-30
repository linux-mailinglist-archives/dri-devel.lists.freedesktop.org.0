Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5166AEA42B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F246ED2D;
	Wed, 30 Oct 2019 19:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CD26ED21;
 Wed, 30 Oct 2019 19:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPgCsBJ8Ly+/Y0SbQDbd5e2LBLdsdasEorBawZcsjBm2PDVApX7otRNDOXghfmrHqbVDPN6yY459EBKn8Uks5T347HhEt9CLVjk45FJa6fQEzCaA418v2cDeKinRbKFshxxG4WdYmCPegVJGybQDF5gApukh6DDZhCQjZVq6uCvIczYrspmx001nICnO6zsqge9ZFeJeVhh0XCyE0uothPwilJh9uf+B5swh1qte7ea11quwOKpLGrfaOlX17ex4raA2n7oVmioSnVSZV5whp0IhDXLNpLgB56OR7CUNBLgqO7bOB1ygbuMZfisfxYDRCXcJhzaq7uTTj8l+0cRI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkZfMZTy6TpgAzkuEIp4iBCPrLY4q8lXm3jprfuLTzU=;
 b=FSqIDW+rpxFQDpSJTxgvMEe3ORDFtK41uO6cvacjXUkBZV98YHskHmTgO7Y8asqAv/GZzmZj+FBk1Qt6C+0W7e+o9rjpt+Z794WAz4m3WQMqnKnMoG3wpMMj1MYpZgjcKRDcanf1BeJNscwaLzNNDVKNgUyNe2pl9HSCCJ840CFnZYYD11FPx5baBXJzOdq2iXHWS/Ooj9DKeFqYZOvP3+XWnt0RBiluK+vETVpq/IsGig0mWn31bKbZ9O2kvQM8g66yr0OWBGSuKcXR9YDXsnZTNt9snUOSGaza6svBfOJu+miN6xIiM10o6s6qnHjlwDmuWWLwAdpXLE5OMecJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0020.namprd12.prod.outlook.com (2603:10b6:610:57::30)
 by DM5PR12MB1259.namprd12.prod.outlook.com (2603:10b6:3:75::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17; Wed, 30 Oct
 2019 19:24:44 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CH2PR12CA0020.outlook.office365.com
 (2603:10b6:610:57::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.23 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:42 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:42 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:42 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/13] drm/amd/display: Validate DSC caps on MST endpoints
Date: Wed, 30 Oct 2019 15:24:27 -0400
Message-ID: <20191030192431.5798-10-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030192431.5798-1-mikita.lipski@amd.com>
References: <20191030192431.5798-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(428003)(199004)(189003)(2351001)(70586007)(6666004)(5660300002)(356004)(16586007)(50466002)(8676002)(7696005)(76176011)(478600001)(316002)(305945005)(2906002)(446003)(11346002)(51416003)(54906003)(2876002)(336012)(426003)(48376002)(70206006)(53416004)(86362001)(81156014)(47776003)(50226002)(1076003)(81166006)(36756003)(6916009)(486006)(26005)(14444005)(2616005)(126002)(186003)(476003)(15650500001)(8936002)(4326008)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1259; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 301f9d59-0cf7-4455-0042-08d75d6ed173
X-MS-TrafficTypeDiagnostic: DM5PR12MB1259:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1259A4718DD89C6FDF2412EFE4600@DM5PR12MB1259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3LBiPvCcJl8DCcGRgzo+WuHigCuNihkBEByei8DCfY/WFPXgS/iRLlqTjaajfqFU/SXlwDfipLOboBuECW+TAZZF15OPw3gbQAIQp8e3zbV9ofniu8caWnTRtkbpD2l7XG/1BkJ4cZ62fHX81NhHudmoY7OfUjM8Ph7MnY+TocZzeR/9G6mssIkV7YCxjeas7r4DWWIAmfEmx/KhXLU1zhbHyvyNxLer41SDQgvQto2r+MK7iERFCsTsSTR8gPOuBF9932i5cnkzJPD88u0Ef4WTHQxGB1OWvI+RHv6cyMGpVSaoq7XcClTwuCFzm0TnzdTZelECDkF6YjoznpKbCYVZ5/qacZNec0yRrLDswnN7QtPKoQm6u/TsuoUM0JcjUaRuihCcDB3Wt0rXu4Pq1BUQR2QvWFcfM+h5BM2/H/6V5NPtPsYwUD7uIeW5bJv3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:43.6343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 301f9d59-0cf7-4455-0042-08d75d6ed173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1259
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkZfMZTy6TpgAzkuEIp4iBCPrLY4q8lXm3jprfuLTzU=;
 b=UySd8IoDJQt7Mqi6A9LnPktkvlqCB95R4u8bVzd+bnpv84ZkelLeFXH3bCkmCNAqo2OWlPvKKKdtGXcjLIoFid2cl6p0iS2VCisWrsDnBofeHzBJXKKEIe7Ztuu5DWbP0tNERFXi+P7PJrp83lBoDbqGjGuNJZBvwFXioQL1FUk=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRHVyaW5nIE1TVCBt
b2RlIGVudW1lcmF0aW9uLCBpZiBhIG5ldyBkY19zaW5rIGlzIGNyZWF0ZWQsCnBvcHVsYXRlIGl0
IHdpdGggZHNjIGNhcHMgYXMgYXBwcm9wcmlhdGUuCgpVc2UgZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0IHRvIGdldCB0aGUgcmF3IGNhcHMsCnRoZW4gcGFyc2UgdGhlbSBvbnRvIGRjX3Npbmsg
d2l0aCBkY19kc2NfcGFyc2VfZHNjX2RwY2QuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdl
bmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZy
YW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmggfCAgMyArKwogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYyAgIHwgMzEgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKaW5kZXggOTEwYzg1OThmYWY5Li4zN2NhMTkxYTVi
MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uaApAQCAtMjc5LDYgKzI3OSw5IEBAIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yIHsK
IAlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0OwogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVj
dG9yICptc3RfcG9ydDsKIAlzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKm1zdF9lbmNvZGVyOworI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJc3RydWN0IGRybV9kcF9hdXggKmRz
Y19hdXg7CisjZW5kaWYKIAogCS8qIFRPRE8gc2VlIGlmIHdlIGNhbiBtZXJnZSB3aXRoIGRkY19i
dXMgb3IgbWFrZSBhIGRtX2Nvbm5lY3RvciAqLwogCXN0cnVjdCBhbWRncHVfaTJjX2FkYXB0ZXIg
KmkyYzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKaW5kZXggMWExN2VhMWI0MmUwLi44MDRhMDAwODJi
ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBAIC0yNSw2ICsyNSw3IEBACiAKICNpbmNsdWRl
IDxsaW51eC92ZXJzaW9uLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSAiZG1fc2VydmljZXMu
aCIKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKQEAgLTE4OCw2
ICsxODksMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGRtX2Rw
X21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRncHVfZG1f
bXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAogfTsKIAorI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCitzdGF0aWMgYm9vbCB2YWxpZGF0ZV9kc2NfY2Fwc19vbl9jb25u
ZWN0b3Ioc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpCit7CisJc3RydWN0
IGRjX3NpbmsgKmRjX3NpbmsgPSBhY29ubmVjdG9yLT5kY19zaW5rOworCXN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKnBvcnQgPSBhY29ubmVjdG9yLT5wb3J0OworCXU4IGRzY19jYXBzWzE2XSA9IHsg
MCB9OworCisJYWNvbm5lY3Rvci0+ZHNjX2F1eCA9IGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9y
dChwb3J0KTsKKworCWlmICghYWNvbm5lY3Rvci0+ZHNjX2F1eCkKKwkJcmV0dXJuIGZhbHNlOwor
CisJaWYgKGRybV9kcF9kcGNkX3JlYWQoYWNvbm5lY3Rvci0+ZHNjX2F1eCwgRFBfRFNDX1NVUFBP
UlQsIGRzY19jYXBzLCAxNikgPCAwKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoIWRjX2RzY19w
YXJzZV9kc2NfZHBjZChkc2NfY2FwcywgTlVMTCwgJmRjX3NpbmstPnNpbmtfZHNjX2NhcHMuZHNj
X2RlY19jYXBzKSkKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisjZW5kaWYK
Kwogc3RhdGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCiB7CiAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSB0
b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CkBAIC0yMzAsMTAgKzI1MywxNiBAQCBz
dGF0aWMgaW50IGRtX2RwX21zdF9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikKIAkJLyogZGNfbGlua19hZGRfcmVtb3RlX3NpbmsgcmV0dXJucyBhIG5ldyByZWZlcmVu
Y2UgKi8KIAkJYWNvbm5lY3Rvci0+ZGNfc2luayA9IGRjX3Npbms7CiAKLQkJaWYgKGFjb25uZWN0
b3ItPmRjX3NpbmspCisJCWlmIChhY29ubmVjdG9yLT5kY19zaW5rKSB7CiAJCQlhbWRncHVfZG1f
dXBkYXRlX2ZyZWVzeW5jX2NhcHMoCiAJCQkJCWNvbm5lY3RvciwgYWNvbm5lY3Rvci0+ZWRpZCk7
CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorCQkJaWYgKCF2YWxpZGF0
ZV9kc2NfY2Fwc19vbl9jb25uZWN0b3IoYWNvbm5lY3RvcikpCisJCQkJbWVtc2V0KCZhY29ubmVj
dG9yLT5kY19zaW5rLT5zaW5rX2RzY19jYXBzLAorCQkJCSAgICAgICAwLCBzaXplb2YoYWNvbm5l
Y3Rvci0+ZGNfc2luay0+c2lua19kc2NfY2FwcykpOworI2VuZGlmCisJCX0KIAl9CiAKIAlkcm1f
Y29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
