Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8FBE8A0D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C355D6E3B0;
	Tue, 29 Oct 2019 13:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE72D6E3A8;
 Tue, 29 Oct 2019 13:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmcjtyLpUH/RvzEK6zdyxV0iHAwqI9SXesp9uO7dCHqPab4J2WveXhs6HJOQS4HIh4zK20NTLC322iBNh0d2z3++KTzFj5NPAwDF/u7yVCIV3eSLxvLQfgBfrGJAmXgMNh96hjcZ3uIpkzMF4jj+E56eb/LoWwbuo8Pflrfwz0tX7PZnbRYHRpj2GHecmO2pDnfyXz2MgA7goAE00m6bxRsnUPE2RYtDIb5zUnu3ExcDqW+5CCvDpZ2kU+5E4A2NVcqwg9jL3BpuksX3G7lOxhhz3iR9zwVypkSHYEockGQq4Fn7G4bIDwKhKfK3+nPqB+icvYd1XXuirzeGeiNxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/ntpKjW+oO2aKDOoIIlHhGaqM1KOpuZjbfRzCYKzYQ=;
 b=jrp+UtpIj2JUNIvKssSzz6UGjFJIh4qsTC4lpGJNRCynStyhTD17ycDNHfHpRB0Hty7S8BeFzZG8Z/f55LMAbgaGrzzzNF6XE3EV62pQcyKuiY2WnkcElV1X2zjqStob++4zdJyQ2UDyhd/h2hKqAri0/zzWOBkyaJbBdRx/6Jc7wSG7MlrfHjE3R7wkm4iyfz094/ZvCFTPEmllVlMhZI1+n3EvRpqNCas8zLEq3JS4AtpMpLkAE9tnNQGJj8G4K3Ldup73rKC386GDO8cRojcVQ4EoUOcf5R77xtvt4O8l3FjHsW16jAdiQp6BEXTtPeFPE6r9E4qv55ZKCTOLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:610:57::40)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Tue, 29 Oct
 2019 13:52:56 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CH2PR12CA0030.outlook.office365.com
 (2603:10b6:610:57::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:53 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:53 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:53 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/13] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Tue, 29 Oct 2019 09:52:36 -0400
Message-ID: <20191029135245.31152-5-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(428003)(199004)(189003)(86362001)(81156014)(81166006)(316002)(8676002)(16586007)(2876002)(5660300002)(14444005)(2906002)(47776003)(70586007)(70206006)(305945005)(1076003)(51416003)(53416004)(7696005)(6916009)(486006)(50226002)(186003)(8936002)(2351001)(76176011)(6666004)(356004)(336012)(36756003)(48376002)(50466002)(54906003)(126002)(426003)(2616005)(446003)(4326008)(11346002)(476003)(478600001)(26005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4326; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6126d01b-dafc-4413-c822-08d75c774d0c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4326:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4326F8101B9D0836AC05410FE4610@CH2PR12MB4326.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zc7u2mLudO8jJaXU3SKBjxb/8ozqw002rkAtP4xQQyGxXToJVsidMlN6CJamfmehKxcxevx14qZuGzRcPH2wVhhJN62Yw9iYAJuDeoMdvxQ4dd7cP10mXhZCmSX1/VQXpspU5AHsbPnzVh+vsfi8gr7+TTtO2MoOjfOVJzczkE818+nlX6HtqGStmjqCNFSvTNuDZHgUygHVjOPcFisT76Owf0wYt+p41m77yIaXGlyc64dd6hDK71gyc/Iq4tbczSyWd//sTjq2d0A5mG4BRXZCGKem6Iy8sdLxX7RWKws6fBmnQ6JyYFy/SwCd6Tmnie2q6C5TenkapXPDN+g7xa3DcHtUTZNDT9taP3IKiHvwquys8jG5PdletdvLU16CIZnm3Mm6uWtoYgyqYfpp2t7IM2s5PHS6/emZHnaJwCob8k1YKe5pzc7gUQnRidTN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:55.7970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6126d01b-dafc-4413-c822-08d75c774d0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/ntpKjW+oO2aKDOoIIlHhGaqM1KOpuZjbfRzCYKzYQ=;
 b=qbcQd+J1WEL0M8Pig472xaraJ2VduMQlfMJDoV+UG1eUqSPDfMHxMBjdiTHX6mW6hibECwIKvjbCjH+D6PqS9Ycjm9sRivkRWqjtDvoLUfaoXSOJcW3YR7mjUBeWUsQw74OPV1t/WTHWXp+7biJix2PwpbkxjqUzlyjA/MKTxZQ=
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKSW5zdGVhZCBvZiBo
YXZpbmcgZHJtX2RwX2RwY2RfcmVhZC93cml0ZSBhbmQKZHJtX2RwX21zdF9kcGNkX3JlYWQvd3Jp
dGUgYXMgZW50cnkgcG9pbnRzIGludG8gdGhlCmF1eCBjb2RlLCBoYXZlIGRybV9kcF9kcGNkX3Jl
YWQvd3JpdGUgaGFuZGxlIGJvdGguCgpUaGlzIG1lYW5zIHRoYXQgRFJNIGRyaXZlcnMgY2FuIG1h
a2UgTVNUIERQQ0QgcmVhZC93cml0ZXMuCgp2MjogRml4IHNwYWNpbmcKdjM6IER1bXAgZHBjZCBh
Y2Nlc3Mgb24gTVNUIHJlYWQvd3JpdGVzCnY0OiBGaXggY2FsbGluZyB3cm9uZyBmdW5jdGlvbiBv
biBEUENEIHdyaXRlCgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyB8IDEyICsrLS0tLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYyAgfCAzMSArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9hdXhfZGV2LmMKaW5kZXggMGNmYjM4Njc1NGMzLi4yNTEwNzE3ZDVhMDggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCkBAIC0xNjMsMTEgKzE2Myw3IEBAIHN0YXRpYyBzc2l6
ZV90IGF1eGRldl9yZWFkX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIg
KnRvKQogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0J
CQlyZXMgPSBkcm1fZHBfbXN0X2RwY2RfcmVhZChhdXhfZGV2LT5hdXgsIHBvcywgYnVmLAotCQkJ
CQkJICAgdG9kbyk7Ci0JCWVsc2UKLQkJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+
YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CisJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+
YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CiAKIAkJaWYgKHJlcyA8PSAwKQogCQkJYnJlYWs7CkBAIC0y
MTUsMTEgKzIxMSw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl93cml0ZV9pdGVyKHN0cnVjdCBr
aW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQogCQkJYnJlYWs7CiAJCX0KIAotCQlp
ZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0JCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3Jp
dGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwKLQkJCQkJCSAgICB0b2RvKTsKLQkJZWxzZQotCQkJ
cmVzID0gZHJtX2RwX2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CisJ
CXJlcyA9IGRybV9kcF9kcGNkX3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwog
CiAJCWlmIChyZXMgPD0gMCkKIAkJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXgg
ZmZjNjhkMzA1YWZlLi5hZjFjZDk2OGFkZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAt
MzIsNiArMzIsOCBAQAogI2luY2x1ZGUgPGRybS9kcm1fZHBfaGVscGVyLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9wcmludC5oPgogI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CisjaW5jbHVkZSA8
ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybVAuaD4KIAogI2luY2x1
ZGUgImRybV9jcnRjX2hlbHBlcl9pbnRlcm5hbC5oIgogCkBAIC0yNTEsNyArMjUzLDcgQEAgc3Rh
dGljIGludCBkcm1fZHBfZHBjZF9hY2Nlc3Moc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdTggcmVx
dWVzdCwKIAogLyoqCiAgKiBkcm1fZHBfZHBjZF9yZWFkKCkgLSByZWFkIGEgc2VyaWVzIG9mIGJ5
dGVzIGZyb20gdGhlIERQQ0QKLSAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCisgKiBA
YXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbCAoU1NUIG9yIE1TVCkKICAqIEBvZmZzZXQ6IGFk
ZHJlc3Mgb2YgdGhlIChmaXJzdCkgcmVnaXN0ZXIgdG8gcmVhZAogICogQGJ1ZmZlcjogYnVmZmVy
IHRvIHN0b3JlIHRoZSByZWdpc3RlciB2YWx1ZXMKICAqIEBzaXplOiBudW1iZXIgb2YgYnl0ZXMg
aW4gQGJ1ZmZlcgpAQCAtMjgwLDEzICsyODIsMTggQEAgc3NpemVfdCBkcm1fZHBfZHBjZF9yZWFk
KHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJICogV2UganVz
dCBoYXZlIHRvIGRvIGl0IGJlZm9yZSBhbnkgRFBDRCBhY2Nlc3MgYW5kIGhvcGUgdGhhdCB0aGUK
IAkgKiBtb25pdG9yIGRvZXNuJ3QgcG93ZXIgZG93biBleGFjdGx5IGFmdGVyIHRoZSB0aHJvdyBh
d2F5IHJlYWQuCiAJICovCi0JcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05B
VElWRV9SRUFELCBEUF9EUENEX1JFViwgYnVmZmVyLAotCQkJCSAxKTsKLQlpZiAocmV0ICE9IDEp
Ci0JCWdvdG8gb3V0OworCWlmICghYXV4LT5pc19yZW1vdGUpIHsKKwkJcmV0ID0gZHJtX2RwX2Rw
Y2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9SRUFELCBEUF9EUENEX1JFViwKKwkJCQkJIGJ1
ZmZlciwgMSk7CisJCWlmIChyZXQgIT0gMSkKKwkJCWdvdG8gb3V0OworCX0KIAotCXJldCA9IGRy
bV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgb2Zmc2V0LCBidWZmZXIs
Ci0JCQkJIHNpemUpOworCWlmIChhdXgtPmlzX3JlbW90ZSkKKwkJcmV0ID0gZHJtX2RwX21zdF9k
cGNkX3JlYWQoYXV4LCBvZmZzZXQsIGJ1ZmZlciwgc2l6ZSk7CisJZWxzZQorCQlyZXQgPSBkcm1f
ZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQsIG9mZnNldCwKKwkJCQkJIGJ1
ZmZlciwgc2l6ZSk7CiAKIG91dDoKIAlkcm1fZHBfZHVtcF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFU
SVZFX1JFQUQsIG9mZnNldCwgYnVmZmVyLCByZXQpOwpAQCAtMjk2LDcgKzMwMyw3IEBAIEVYUE9S
VF9TWU1CT0woZHJtX2RwX2RwY2RfcmVhZCk7CiAKIC8qKgogICogZHJtX2RwX2RwY2Rfd3JpdGUo
KSAtIHdyaXRlIGEgc2VyaWVzIG9mIGJ5dGVzIHRvIHRoZSBEUENECi0gKiBAYXV4OiBEaXNwbGF5
UG9ydCBBVVggY2hhbm5lbAorICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgKFNTVCBv
ciBNU1QpCiAgKiBAb2Zmc2V0OiBhZGRyZXNzIG9mIHRoZSAoZmlyc3QpIHJlZ2lzdGVyIHRvIHdy
aXRlCiAgKiBAYnVmZmVyOiBidWZmZXIgY29udGFpbmluZyB0aGUgdmFsdWVzIHRvIHdyaXRlCiAg
KiBAc2l6ZTogbnVtYmVyIG9mIGJ5dGVzIGluIEBidWZmZXIKQEAgLTMxMyw4ICszMjAsMTIgQEAg
c3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1bnNpZ25l
ZCBpbnQgb2Zmc2V0LAogewogCWludCByZXQ7CiAKLQlyZXQgPSBkcm1fZHBfZHBjZF9hY2Nlc3Mo
YXV4LCBEUF9BVVhfTkFUSVZFX1dSSVRFLCBvZmZzZXQsIGJ1ZmZlciwKLQkJCQkgc2l6ZSk7CisJ
aWYgKGF1eC0+aXNfcmVtb3RlKQorCQlyZXQgPSBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4LCBv
ZmZzZXQsIGJ1ZmZlciwgc2l6ZSk7CisJZWxzZQorCQlyZXQgPSBkcm1fZHBfZHBjZF9hY2Nlc3Mo
YXV4LCBEUF9BVVhfTkFUSVZFX1dSSVRFLCBvZmZzZXQsCisJCQkJCSBidWZmZXIsIHNpemUpOwor
CiAJZHJtX2RwX2R1bXBfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LCBi
dWZmZXIsIHJldCk7CiAJcmV0dXJuIHJldDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
