Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8EEF0324
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 17:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBD56EAF0;
	Tue,  5 Nov 2019 16:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690063.outbound.protection.outlook.com [40.107.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6286EAED;
 Tue,  5 Nov 2019 16:37:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7tN79cOya89EKTR12k2JxcYqXg/ctgIxupYaliZ2SFZ8NtcqkAW8gk4ggEAm7OrsA5MiCgSPOlNad1qGlccvGUwQH3LtQPfgr+oew7Swe1f/WQUHpdWCvEE1oLl/DwySjxvNNinEkIkErc83LGEFz2nahNx2lvD1hLzKY+YLeAZwXBtMUjHhOU8YIsGEiOx2loBApdDjweggNk9DfdCgp0lpyX1fMdwmSioMVbA/gTOxPQRK+/tTwkYOWVwOFE13Ye1WJM/0S5UHA2fI7QLuEZy6T0PwjdNRgNngLNC/4b+2Hup6D/rRVkOqJPLXEonp+GuIBE1zmqYNM0bpoJb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPKUiB7ndkymeOXbJvKFGu+AL/cfF3r7mPK+22VTmdI=;
 b=Z0icfBILvDEK+O+u6wmhTWZq8ldUIiWAeLeCcyUYX/wjkkVLNFu+dPgk0taI4XV2h3GUv3AAEQQ9E7s6mZ+dJ5Ajo90jxHUmx27DONZbV5fnmKHWXddxjdAepuX50H7umRVYvWyW5JjOItt+EiZcXB8G8I9p3auJKM+f4WGuO4F+stee8aGAlp+X7yWR6qRZuN5rfXNePqAUoAQ5glYXVILzDS1s/sP0xfl3apn+Km2LAARGgFPlxnkNuFTiykU3hn5fSG9ITnRdY0IG/F/wMCBNVcc+YaHFyrHDdwgnTCCahO7oWVJtKEMjFgvKZbmV7ndBsOXBPRZlJvfBah9z9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:910:16::25) by BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Tue, 5 Nov
 2019 16:37:52 +0000
Received: from CO1NAM03FT018.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by CY4PR1201CA0015.outlook.office365.com
 (2603:10b6:910:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Tue, 5 Nov 2019 16:37:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT018.mail.protection.outlook.com (10.152.80.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 16:37:51 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 5 Nov 2019
 10:37:49 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 5 Nov 2019 10:37:48 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4] drm: Add support for DP 1.4 Compliance edid corruption
 test 4.2.2.6
Date: Tue, 5 Nov 2019 11:37:40 -0500
Message-ID: <20191105163740.3093-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191104211145.30553-1-Jerry.Zuo@amd.com>
References: <20191104211145.30553-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(199004)(189003)(8936002)(5660300002)(14444005)(50226002)(2906002)(6666004)(356004)(8676002)(81166006)(81156014)(53416004)(305945005)(50466002)(4326008)(70206006)(47776003)(86362001)(48376002)(26005)(478600001)(51416003)(316002)(11346002)(126002)(486006)(446003)(2616005)(476003)(36756003)(7696005)(426003)(336012)(1076003)(54906003)(186003)(110136005)(16586007)(76176011)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2806; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15955631-7b8a-4d48-9709-08d7620e8009
X-MS-TrafficTypeDiagnostic: BYAPR12MB2806:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2806DAED32F29E449312311DE57E0@BYAPR12MB2806.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ds/1anScCsmSKYAyV0EYEPqGAiKdXxr6ZggepdvkxCU3XcKFi2qBJxgaGl2MZLydpo5aOd91VnLs1cysjQo38Bm6++eRCEIIyiU7LlIhC3bHli7M5bETQZ/XK9+E7nq5a/YgBscMCSVtJUDOUV+/4Xjz5BIrgVH/HFa68fBX3ml204I/F5Rh4ZJXtLqkrEAfTcrjEQFrPg7ie8VGWIqp7bWfvSiQUlWq38x320NuFEGY2+qXSlhXmTc9/GciCNuzRtgE/9ciZ+avalaWxW231zdHjkKXO2LXYZdLPIRkOOYvI1jXETYZ53/2FVgN12dq30ZN5+mVpXp03Q0BftjPM1lgU9npcnyy8ZJNuwQiRAkoh03QNFzkqowP25LMas9pOj11+Lex0i1/kEC5nuf7J1uUknOEkMD3bUeiBCieHLb0Gl1DCsH8UKnAVtWaMKv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 16:37:51.1649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15955631-7b8a-4d48-9709-08d7620e8009
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPKUiB7ndkymeOXbJvKFGu+AL/cfF3r7mPK+22VTmdI=;
 b=qQeQ8yMszheh8RV8gSSpFPN2TKBZzfkGD0Dr7MR6mxwC352Y+5AKnIfWl1eBncQJvE6W4W3TBwzLP69dF/R8hLjQE/yAKq3uurQJWeaMQr7ucnhFLZAsG5SxdkMiidXrg61Y4aUbrkvST8s0yAC/uI2mzYfC6veVL/uq4DqJuzE=
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
Cc: manasi.d.navare@intel.com, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFAgMS40IGVkaWQgY29ycnVwdGlvbiB0ZXN0IHJlcXVpcmVzIHNvdXJjZSBEVVQgdG8gd3JpdGUg
Y2FsY3VsYXRlZApDUkMsIG5vdCB0aGUgY29ycnVwdGVkIENSQyBmcm9tIHJlZmVyZW5jZSBzaW5r
LgoKUmV0dXJuIHRoZSBjYWxjdWxhdGVkIENSQyBiYWNrLCBhbmQgaW5pdGlhdGUgdGhlIHJlcXVp
cmVkIHNlcXVlbmNlLgoKLXYyOiBIYXZlIHNlcGFyYXRlIHJvdXRpbmUgZm9yIHJldHVybmluZyBy
ZWFsIENSQwoKLXYzOiBSZXdyaXRlIGNoZWNrc3VtIGNvbXB1dGF0aW9uIHJvdXRpbmUgdG8gYXZv
aWQgZHVwbGljYXRlZCBjb2RlLgogICAgIFJlbmFtZSB0byBhdm9pZCBjb25mdXNpb24KCi12NDog
Rml4IGEgbWlub3IgdHlwby4KClNpZ25lZC1vZmYtYnk6IEplcnJ5IChGYW5nemhpKSBadW8gPEpl
cnJ5Llp1b0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgfCAz
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jICAgICAgfCAxOCArKysrKysrKysrKysrKystLS0KIGluY2x1ZGUvZHJtL2RybV9j
b25uZWN0b3IuaCAgICAgfCAgNyArKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgg
ICAgIHwgIDMgKysrCiA0IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggZmZjNjhkMzA1YWZlLi4yMmEwZTk2
NmVhOWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMzM2LDYgKzMzNiw0MiBAQCBpbnQg
ZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0YXR1cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogfQog
RVhQT1JUX1NZTUJPTChkcm1fZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKTsKIAorLyoqCisgICog
ZHJtX2RwX3NlbmRfcmVhbF9lZGlkX2NoZWNrc3VtKCkgLSBzZW5kIGJhY2sgcmVhbCBlZGlkIGNo
ZWNrc3VtIHZhbHVlCisgICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAgKiBAcmVh
bF9lZGlkX2NoZWNrc3VtOiByZWFsIGVkaWQgY2hlY2tzdW0gZm9yIHRoZSBsYXN0IGJsb2NrCisg
ICoKKyAgKiBSZXR1cm5zIHRydWUgb24gc3VjY2VzcworICAqLworYm9vbCBkcm1fZHBfc2VuZF9y
ZWFsX2VkaWRfY2hlY2tzdW0oc3RydWN0IGRybV9kcF9hdXggKmF1eCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdTggcmVhbF9lZGlkX2NoZWNrc3VtKQoreworICAgICAgICB1OCBs
aW5rX2VkaWRfcmVhZCA9IDAsIGF1dG9fdGVzdF9yZXEgPSAwOworICAgICAgICB1OCB0ZXN0X3Jl
c3AgPSAwOworCisgICAgICAgIGRybV9kcF9kcGNkX3JlYWQoYXV4LCBEUF9ERVZJQ0VfU0VSVklD
RV9JUlFfVkVDVE9SLCAmYXV0b190ZXN0X3JlcSwgMSk7CisgICAgICAgIGF1dG9fdGVzdF9yZXEg
Jj0gRFBfQVVUT01BVEVEX1RFU1RfUkVRVUVTVDsKKworICAgICAgICBkcm1fZHBfZHBjZF9yZWFk
KGF1eCwgRFBfVEVTVF9SRVFVRVNULCAmbGlua19lZGlkX3JlYWQsIDEpOworICAgICAgICBsaW5r
X2VkaWRfcmVhZCAmPSBEUF9URVNUX0xJTktfRURJRF9SRUFEOworCisgICAgICAgIGlmICghYXV0
b190ZXN0X3JlcSB8fCAhbGlua19lZGlkX3JlYWQpIHsKKyAgICAgICAgICAgICAgICBEUk1fREVC
VUdfS01TKCJTb3VyY2UgRFVUIGRvZXMgbm90IHN1cHBvcnQgVEVTVF9FRElEX1JFQURcbiIpOwor
ICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKKyAgICAgICAgfQorCisgICAgICAgIGRybV9k
cF9kcGNkX3dyaXRlKGF1eCwgRFBfREVWSUNFX1NFUlZJQ0VfSVJRX1ZFQ1RPUiwgJmF1dG9fdGVz
dF9yZXEsIDEpOworCisgICAgICAgIC8qIHNlbmQgYmFjayBjaGVja3N1bSBmb3IgdGhlIGxhc3Qg
ZWRpZCBleHRlbnNpb24gYmxvY2sgZGF0YSAqLworICAgICAgICBkcm1fZHBfZHBjZF93cml0ZShh
dXgsIERQX1RFU1RfRURJRF9DSEVDS1NVTSwgJnJlYWxfZWRpZF9jaGVja3N1bSwgMSk7CisKKyAg
ICAgICAgdGVzdF9yZXNwIHw9IERQX1RFU1RfRURJRF9DSEVDS1NVTV9XUklURTsKKyAgICAgICAg
ZHJtX2RwX2RwY2Rfd3JpdGUoYXV4LCBEUF9URVNUX1JFU1BPTlNFLCAmdGVzdF9yZXNwLCAxKTsK
KworICAgICAgICByZXR1cm4gdHJ1ZTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX3NlbmRfcmVh
bF9lZGlkX2NoZWNrc3VtKTsKKwogLyoqCiAgKiBkcm1fZHBfbGlua19wcm9iZSgpIC0gcHJvYmUg
YSBEaXNwbGF5UG9ydCBsaW5rIGZvciBjYXBhYmlsaXRpZXMKICAqIEBhdXg6IERpc3BsYXlQb3J0
IEFVWCBjaGFubmVsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IDgyYTRjZWVkM2ZjZi4uZmY2NGU1ZjFmZWI2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYwpAQCAtMTM0OCwxMCArMTM0OCwxOSBAQCBzdGF0aWMgaW50IGRybV9l
ZGlkX2Jsb2NrX2NoZWNrc3VtKGNvbnN0IHU4ICpyYXdfZWRpZCkKIHsKIAlpbnQgaTsKIAl1OCBj
c3VtID0gMDsKLQlmb3IgKGkgPSAwOyBpIDwgRURJRF9MRU5HVEg7IGkrKykKKworCWZvciAoaSA9
IDA7IGkgPCBFRElEX0xFTkdUSCAtIDE7IGkrKykKIAkJY3N1bSArPSByYXdfZWRpZFtpXTsKIAot
CXJldHVybiBjc3VtOworCXJldHVybiAoMHgxMDAgLSBjc3VtKTsKK30KKworc3RhdGljIGJvb2wg
ZHJtX2VkaWRfYmxvY2tfY2hlY2tzdW1fZGlmZihjb25zdCB1OCAqcmF3X2VkaWQsIHU4IHJlYWxf
Y2hlY2tzdW0pCit7CisJaWYgKHJhd19lZGlkW0VESURfTEVOR1RIIC0gMV0gIT0gcmVhbF9jaGVj
a3N1bSkKKwkJcmV0dXJuIHRydWU7CisJZWxzZQorCQlyZXR1cm4gZmFsc2U7CiB9CiAKIHN0YXRp
YyBib29sIGRybV9lZGlkX2lzX3plcm8oY29uc3QgdTggKmluX2VkaWQsIGludCBsZW5ndGgpCkBA
IC0xNDA5LDcgKzE0MTgsNyBAQCBib29sIGRybV9lZGlkX2Jsb2NrX3ZhbGlkKHU4ICpyYXdfZWRp
ZCwgaW50IGJsb2NrLCBib29sIHByaW50X2JhZF9lZGlkLAogCX0KIAogCWNzdW0gPSBkcm1fZWRp
ZF9ibG9ja19jaGVja3N1bShyYXdfZWRpZCk7Ci0JaWYgKGNzdW0pIHsKKwlpZiAoZHJtX2VkaWRf
YmxvY2tfY2hlY2tzdW1fZGlmZihyYXdfZWRpZCwgY3N1bSkpIHsKIAkJaWYgKGVkaWRfY29ycnVw
dCkKIAkJCSplZGlkX2NvcnJ1cHQgPSB0cnVlOwogCkBAIC0xNTcyLDYgKzE1ODEsOSBAQCBzdGF0
aWMgdm9pZCBjb25uZWN0b3JfYmFkX2VkaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwKIAkJCSAgICAgICBwcmVmaXgsIERVTVBfUFJFRklYX05PTkUsIDE2LCAxLAogCQkJICAgICAg
IGJsb2NrLCBFRElEX0xFTkdUSCwgZmFsc2UpOwogCX0KKworCS8qIENhbGN1bGF0ZSByZWFsIGNo
ZWNrc3VtIGZvciB0aGUgbGFzdCBlZGlkIGV4dGVuc2lvbiBibG9jayBkYXRhICovCisJY29ubmVj
dG9yLT5yZWFsX2VkaWRfY2hlY2tzdW0gPSBkcm1fZWRpZF9ibG9ja19jaGVja3N1bShlZGlkICsg
ZWRpZFsweDdlXSAqIEVESURfTEVOR1RIKTsKIH0KIAogLyogR2V0IG92ZXJyaWRlIG9yIGZpcm13
YXJlIEVESUQgKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAppbmRleCA2ODFjYjU5MGY5NTIuLmViMGQ4YzdiMzVm
ZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaApAQCAtMTM0NSw2ICsxMzQ1LDEzIEBAIHN0cnVjdCBkcm1fY29u
bmVjdG9yIHsKIAkgKiByZXYxLjEgNC4yLjIuNgogCSAqLwogCWJvb2wgZWRpZF9jb3JydXB0Owor
CS8qKgorICAgICAgICAgKiBAcmVhbF9lZGlkX2NoZWNrc3VtOiByZWFsIGVkaWQgY2hlY2tzdW0g
dmFsdWUgZm9yIGNvcnJ1cHRlZCBlZGlkIGJsb2NrLgorICAgICAgICAgKiBSZXF1aXJlZCBpbiBE
aXNwbGF5cG9ydCAxLjQgY29tcGxpYW5jZSB0ZXN0aW5nCisgICAgICAgICAqIHJldjEuMSA0LjIu
Mi42CisgICAgICAgICAqLworICAgICAgICB1aW50OF90IHJlYWxfZWRpZF9jaGVja3N1bTsKKwog
CiAJLyoqIEBkZWJ1Z2ZzX2VudHJ5OiBkZWJ1Z2ZzIGRpcmVjdG9yeSBmb3IgdGhpcyBjb25uZWN0
b3IgKi8KIAlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzX2VudHJ5OwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4
IDVhNzk1MDc1ZDVkYS4uODQ3MDlkNzgxMGY4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBAIC0xMzgzLDYg
KzEzODMsOSBAQCBzdGF0aWMgaW5saW5lIHNzaXplX3QgZHJtX2RwX2RwY2Rfd3JpdGViKHN0cnVj
dCBkcm1fZHBfYXV4ICphdXgsCiBpbnQgZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0YXR1cyhzdHJ1
Y3QgZHJtX2RwX2F1eCAqYXV4LAogCQkJCSB1OCBzdGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0p
OwogCitib29sIGRybV9kcF9zZW5kX3JlYWxfZWRpZF9jaGVja3N1bShzdHJ1Y3QgZHJtX2RwX2F1
eCAqYXV4LAorCQkJCSAgICB1OCByZWFsX2VkaWRfY2hlY2tzdW0pOworCiAvKgogICogRGlzcGxh
eVBvcnQgbGluawogICovCi0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
