Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C2FFF5F6
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF8A6E202;
	Sat, 16 Nov 2019 22:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730078.outbound.protection.outlook.com [40.107.73.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98236E1F2;
 Sat, 16 Nov 2019 22:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFaq8fAlPFhS+Klrj0Tw4Fsc/kDzLU6rLgftKJPTlxNxUSIhI+5FHynhszDAIg3VGIIcGjD88bVlWuf0zxiNTs54ffW06hoYI35w6iMs56HRjqimJc7wBqoC/EQPUIhOcL3dKweIn3IJKmiUQ2AC2tMs8imf8fKLgVk/4cmL0D17curC2ujlBlPubYUMSDD0qWA/ZrGY776K/TuYuvPPs4X+qNbAMv/BX5/R4NLkViE8MFgS+tQG0XmaPsKtz6eKrwqYZIgQra9OeiVAVrRFdwW0gJHVab2+X1T+hMd5UTG6oqMiUMCxiBfMMprKWwxkwysFL0HjRHEC7mYGdnZ5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV8WCJ89uh2tBErlC+5l8Y55UMZFMakdjbF9gOuW65I=;
 b=g+qY1ZzbustxYGTYZ0RnQpxZFrBgYm+7nLUI0g6cTH4CnFIqHtfsIXFEuW+5uTrqqdmmwvdm873AY2cCVzKBGDCssL7LrwyNWeWaltPfI2T51hu4Y9PcbsqqSpTSBEkWOt+oWTmDnfEHTiNvbGWUNn2vRFOUZtqLAKoxX4TezBm8fq6VTn2l7HyGquLJsFKWsT+3VN8Uo28Sfbf1C5A3jtW71pMZqzcQubZB+Xf8eimnqnycvSDppJwJR8Wfr0fLd0Lez3s+WBvKzhmyMU+m0DeJriQ6FcBwdF3Dnuw1088wx7gFUTeRLEF1GnVBhixvQ6cFdL91qD2q0Z/AT22kiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by BYAPR12MB3080.namprd12.prod.outlook.com
 (2603:10b6:a03:de::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.28; Sat, 16 Nov
 2019 22:01:40 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:38 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:38 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:38 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 13/17] drm/dp_mst: Add helper to trigger modeset on
 affected DSC MST CRTCs
Date: Sat, 16 Nov 2019 17:01:24 -0500
Message-ID: <20191116220128.16598-14-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(428003)(189003)(199004)(5660300002)(2906002)(4326008)(476003)(126002)(336012)(36756003)(48376002)(16586007)(14444005)(50466002)(5024004)(316002)(53416004)(6666004)(356004)(305945005)(54906003)(2876002)(2351001)(486006)(7696005)(51416003)(76176011)(81156014)(81166006)(8676002)(186003)(6916009)(26005)(8936002)(478600001)(426003)(86362001)(11346002)(446003)(2616005)(50226002)(70206006)(70586007)(1076003)(47776003)(17423001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3080; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71fd366b-a9d6-4bea-2469-08d76ae08ed4
X-MS-TrafficTypeDiagnostic: BYAPR12MB3080:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3080EC252B4E32D612AF873FE4730@BYAPR12MB3080.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gci/fea+w5lmdlKOPLsY85gyiifad57R8b1PsgB5tylKLRW9TKhFP5hf8BAdnMGnOUlT2oW8NqY7fyF81qkuMFAd3O721CbG6e9sNLAJDo0bc8+74+c0lgFucP1kS3QvkOTXd6DhiRbOmK4LC9XkHYOCvY+X+vN7urK6OcOHGkrHML4L97KAu1r2ZZA2Eoqqsn1OTCEUbSXMsJ8FIDp1tnoBYwSh2teR/t9qIUS4sUtGeS5GB/NoG001ePSvA1OCbnkKIFkkwYhxfJ1sRtC8kngzVDunVs5H5x5vBbE/v0MrtB/w15z11hxnC4cGD2Qcz3xU4JM+jEdL+8jXkS5ODUadWYDIgZkN4rs2CMpPfyUcolkAJf97oDDQDwzCWIr0Zsi8PHifGANf4Y0ngsneX4gkwerBfNJ+J3kV3QqxZCx0jxoCtmvInswcjHjjyGp8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:39.6099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fd366b-a9d6-4bea-2469-08d76ae08ed4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3080
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV8WCJ89uh2tBErlC+5l8Y55UMZFMakdjbF9gOuW65I=;
 b=ePImrXONA2obfCAYUULrlc+7KkWlUu+wH7pfQcSBhZag7Zs455aIVd77VzNa8ZYAsC0WaRUn1OaJcmoEYVVNxXZaaqWDOVY1Fb6yn7tT1HegsonNcaZcmE6fTjG6xniRzNBPqybxr+mnMmevwT+LMVS5gu/2mDca94fcAD7t8/E=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KV2hlbmV2
ZXIgYSBjb25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgY2hhbmdlZCBvcgp1bmRlcmdvZXMg
YSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRoYXQKdG9wb2xv
Z3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5nZSB0aGVpciByZXF1aXJlZApi
YW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWluZywgYXMgdGhvdWdoIGEgbW9k
ZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFtIGRpZCBub3QgY2hhbmdlIHRp
bWluZy4KCltob3ddCkFkZGluZyBoZWxwZXIgdG8gdHJpZ2dlciBtb2Rlc2V0cyBvbiBNU1QgRFND
IGNvbm5lY3RvcnMKYnkgc2V0dGluZyBtb2RlX2NoYW5nZWQgZmxhZyBvbiBDUlRDcyBpbiB0aGUg
c2FtZSB0b3BvbG9neQphcyBhZmZlY3RlZCBjb25uZWN0b3IKClNpZ25lZC1vZmYtYnk6IE1pa2l0
YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIHwgOTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNs
dWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgIHwgIDIgKwogMiBmaWxlcyBjaGFuZ2Vk
LCA5MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5k
ZXggNTA3MmMxZTNkY2ZlLi40ZDkwODlmZTg0YzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYwpAQCAtNzMsNiArNzMsNyBAQCBzdGF0aWMgYm9vbCBkcm1fZHBfdmFsaWRhdGVf
Z3VpZChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIHN0YXRpYyBpbnQgZHJt
X2RwX21zdF9yZWdpc3Rlcl9pMmNfYnVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpOwogc3RhdGlj
IHZvaWQgZHJtX2RwX21zdF91bnJlZ2lzdGVyX2kyY19idXMoc3RydWN0IGRybV9kcF9hdXggKmF1
eCk7CiBzdGF0aWMgdm9pZCBkcm1fZHBfbXN0X2tpY2tfdHgoc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IpOworc3RhdGljIGJvb2wgZHJtX2RwX21zdF9pc19kc2Nfc3VwcG9ydGVk
KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpOwogCiAjZGVmaW5lIERQX1NUUih4KSBbRFBf
ICMjIHhdID0gI3gKIApAQCAtMzkzNiw2ICszOTM3LDY2IEBAIGRybV9kcF9tc3RfYXRvbWljX2No
ZWNrX3RvcG9sb2d5X3N0YXRlKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAog
CXJldHVybiAwOwogfQogCisvKioKKyAqIGRybV9kcF9tc3RfYWRkX2FmZmVjdGVkX2RzY19jcnRj
cworICogQHN0YXRlOiBQb2ludGVyIHRvIHRoZSBuZXcgJnN0cnVjdCBkcm1fZHBfbXN0X3RvcG9s
b2d5X3N0YXRlCisgKiBAcG9ydDogUG9pbnRlciB0b3RoZSBwb3J0IG9mIGNvbm5lY3RvciB3aXRo
IG5ldyBzdGF0ZQorICoKKyAqIFdoZW5ldmVyIHRoZXJlIGlzIGEgY2hhbmdlIGluIG1zdCB0b3Bv
bG9neQorICogRFNDIGNvbmZpZ3VyYXRpb24gd291bGQgaGF2ZSB0byBiZSByZWNhbGN1bGF0ZWQK
KyAqIHRoZXJlZm9yZSB3ZSBuZWVkIHRvIHRyaWdnZXIgbW9kZXNldCBvbiBhbGwgYWZmZWN0ZWQK
KyAqIENSVENzIGluIHRoYXQgdG9wb2xvZ3kKKyAqCisgKiBTZWUgYWxzbzoKKyAqIGRybV9kcF9t
c3RfYXRvbWljX2VuYWJsZV9kc2MoKQorICovCitpbnQgZHJtX2RwX21zdF9hZGRfYWZmZWN0ZWRf
ZHNjX2NydGNzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwgc3RydWN0IGRybV9kcF9t
c3RfcG9ydCAqcG9ydCkKK3sKKwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqbXN0
X3N0YXRlOworCXN0cnVjdCBkcm1fZHBfdmNwaV9hbGxvY2F0aW9uICpwb3M7CisJc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29u
bl9zdGF0ZTsKKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7CisJc3RydWN0IGRybV9jcnRjX3N0YXRl
ICpjcnRjX3N0YXRlOworCisJaWYgKCFwb3J0KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCW1zdF9z
dGF0ZSA9IGRybV9hdG9taWNfZ2V0X21zdF90b3BvbG9neV9zdGF0ZShzdGF0ZSwgcG9ydC0+bWdy
KTsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkocG9zLCAmbXN0X3N0YXRlLT52Y3BpcywgbmV4dCkg
eworCisJCWNvbm5lY3RvciA9IHBvcy0+cG9ydC0+Y29ubmVjdG9yOworCisJCWlmICghY29ubmVj
dG9yKQorCQkJcmV0dXJuIC1FSU5WQUw7CisKKwkJY29ubl9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0
X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yKTsKKworCQlpZiAoSVNfRVJSKGNvbm5f
c3RhdGUpKQorCQkJcmV0dXJuIFBUUl9FUlIoY29ubl9zdGF0ZSk7CisKKwkJY3J0YyA9IGNvbm5f
c3RhdGUtPmNydGM7CisKKwkJaWYgKCFjcnRjKQorCQkJcmV0dXJuIC1FSU5WQUw7CisKKwkJaWYg
KCFkcm1fZHBfbXN0X2lzX2RzY19zdXBwb3J0ZWQocG9zLT5wb3J0KSkKKwkJCWNvbnRpbnVlOwor
CisJCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9jcnRjX3N0YXRlKG1zdF9zdGF0ZS0+YmFz
ZS5zdGF0ZSwgY3J0Yyk7CisKKwkJaWYgKElTX0VSUihjcnRjX3N0YXRlKSkKKwkJCXJldHVybiBQ
VFJfRVJSKGNydGNfc3RhdGUpOworCisJCURSTV9ERUJVR19BVE9NSUMoIltNU1QgUE9SVDolcF0g
U2V0dGluZyBtb2RlX2NoYW5nZWQgZmxhZyBvbiBDUlRDICVwXG4iLCBwb3J0LCBjcnRjKTsKKwor
CQljcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQgPSB0cnVlOworCX0KKwlyZXR1cm4gMDsKK30KK0VY
UE9SVF9TWU1CT0woZHJtX2RwX21zdF9hZGRfYWZmZWN0ZWRfZHNjX2NydGNzKTsKKwogLyoqCiAg
KiBkcm1fZHBfbXN0X2F0b21pY19lbmFibGVfZHNjIC0gU2V0IERTQyBFbmFibGUgRmxhZyB0byBP
bi9PZmYKICAqIEBzdGF0ZTogUG9pbnRlciB0byB0aGUgbmV3IGRybV9hdG9taWNfc3RhdGUgCkBA
IC00NDMzLDMgKzQ0OTQsMzIgQEAgc3RydWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1
eF9mb3JfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQogCXJldHVybiBOVUxMOwog
fQogRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQpOworCisvKioKKyAq
IGRybV9kcF9tc3RfaXNfZHNjX3N1cHBvcnRlZCgpIC0gVmVyaWZ5IERTQyBzdXBwb3J0IG9uIGNv
bm5lY3RvcgorICogQHBvcnQ6IFRoZSBwb3J0IHRvIGNoZWNrLiBBIGxlYWYgb2YgdGhlIE1TVCB0
cmVlIHdpdGggYW4gYXR0YWNoZWQgZGlzcGxheS4KKyAqCisgKiBBY3F1aXJpbmcgY29ycmVjdCBh
dXggZnJvbSBkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQKKyAqIGFuZCB2ZXJpZnlpbmcgRFBD
RCBmbGFnIHRoYXQgdGhlIGF1eCBpcyBEU0MgY2FwYWJsZQorICoKKyAqIFJldHVybnM6CisgKiBU
cnVlIC8gRmFsc2UgLSBpZiBEU0MgaXMgc3VwcG9ydGVkCisgKi8KK3N0YXRpYyBib29sIGRybV9k
cF9tc3RfaXNfZHNjX3N1cHBvcnRlZChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQorewor
CXN0cnVjdCBkcm1fZHBfYXV4ICpkc2NfYXV4OworCXU4IGVuZHBvaW50X2RzYzsKKworCWRzY19h
dXggPSBkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQocG9ydCk7CisKKwlpZiAoIWRzY19hdXgp
CisJCXJldHVybiBmYWxzZTsKKworCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5hdXgsIERQ
X0RTQ19TVVBQT1JULCAmZW5kcG9pbnRfZHNjLCAxKSA8IDApCisJCXJldHVybiBmYWxzZTsKKwor
CWlmIChlbmRwb2ludF9kc2MgJiBEUF9EU0NfREVDT01QUkVTU0lPTl9JU19TVVBQT1JURUQpCisJ
CXJldHVybiB0cnVlOworCisJcmV0dXJuIGZhbHNlOworfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgK
aW5kZXggNWExMTlhNDBlZDVhLi43ZDFlNWU0MmM5YWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIu
aApAQCAtNjY5LDYgKzY2OSw4IEBAIGludCBkcm1fZHBfbXN0X2F0b21pY19lbmFibGVfZHNjKHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCQkgc3RydWN0IGRybV9kcF9tc3RfcG9y
dCAqcG9ydCwKIAkJCQkgaW50IHBibiwgaW50IHBibl9kaXYsCiAJCQkJIGJvb2wgZW5hYmxlKTsK
K2ludCBkcm1fZHBfbXN0X2FkZF9hZmZlY3RlZF9kc2NfY3J0Y3Moc3RydWN0IGRybV9hdG9taWNf
c3RhdGUgKnN0YXRlLAorCQkJCSAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpOwog
aW50IF9fbXVzdF9jaGVjawogZHJtX2RwX2F0b21pY19yZWxlYXNlX3ZjcGlfc2xvdHMoc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJCSBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1nciwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
