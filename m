Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399CEEA41C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2586ED22;
	Wed, 30 Oct 2019 19:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AEB6ED0F;
 Wed, 30 Oct 2019 19:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOnqTo67eLz0n1gz2bTHphnvFc1pS41W4BoiGoxGG7wMf3VodLrLwcQm/0B8erPcY9wpKJH7/UK0zszm0R0ZiPEQmEOiaUBv62EnKHmyg3MpmXShezuRj+L+ob/L63unkVh9FN3pkF55kL0B6dDAjZZZGQjOyykb2bBM/JrQXN8kqH498Rz2VZo1eDFz2MUu9rQkJFdTqxXROG8RXJACgu3Ll5dAKdwZW7ObTiN/L0K4u+rrvQ5m+/o3baB30s3k0wLpgCruWrqQdH7Qe0ccACT+3YchZ/tGKwimjjQ+NAEK2K2FvKzhfR0US6uJxsDpeWEOy4NwjOQ/TyXmMOpnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=EB6SthsCzZ5qzJSM/LIhjT2byKEpFZnGPl7AHQ8/Ghm7juEmggOP79HIJtHrOkx+ccWc/virWBdHRRauWi9rYmT0pq+n4ANB3OiwyN3yQXFaH189wtm4ADRVgrBZ+P/VMkUerSWZBViFHv2g6HEb2GI4p+x88PKYi7UnaxCIYAktIjvpVyMyB0bTH+sCD93xPuYBUejMUS7QxGjtE0+bsKIVkk8mKPqWSmdMkvRIwy+l/KRGyLEnDy/JbL65pJq/tyb15R6SwA4KueM31BlxsmpuF1w2Pb0Ttr6mY59HLmS0aCjgqPswuSZlA4cE5JyxsT0SRwIi2IPb4m/joy5EaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0016.namprd12.prod.outlook.com
 (2603:10b6:301:4a::26) by MW2PR12MB2508.namprd12.prod.outlook.com
 (2603:10b6:907:9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Wed, 30 Oct
 2019 19:24:39 +0000
Received: from CO1NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR1201CA0016.outlook.office365.com
 (2603:10b6:301:4a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT019.mail.protection.outlook.com (10.152.80.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:37 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:37 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:37 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/13] drm/dp_mst: Parse FEC capability on MST ports
Date: Wed, 30 Oct 2019 15:24:21 -0400
Message-ID: <20191030192431.5798-4-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030192431.5798-1-mikita.lipski@amd.com>
References: <20191030192431.5798-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(428003)(189003)(199004)(356004)(2906002)(36756003)(53416004)(2351001)(48376002)(50466002)(47776003)(6666004)(86362001)(305945005)(6916009)(336012)(50226002)(8936002)(4326008)(478600001)(5660300002)(26005)(186003)(76176011)(2876002)(70586007)(70206006)(51416003)(81166006)(7696005)(81156014)(8676002)(446003)(2616005)(1076003)(316002)(426003)(11346002)(54906003)(16586007)(476003)(126002)(486006)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2508; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91367e76-6295-45d2-b0dc-08d75d6ece83
X-MS-TrafficTypeDiagnostic: MW2PR12MB2508:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25080D36D817CF9CE8EE2CE3E4600@MW2PR12MB2508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hPgcN5GCoxcJUNshenrii4fkjVzNlCtgYIgWauuxuE8SlXDCJjzhEY/hC3u1mXDnNqC+ReiUC5WaqychrpxibC1QcKL9yN4TEa2t+MfijKapQJqtu9daY4x3zVyh7Jj8zdznYbXGVuBOJw9pEkt+VvCKCBwtZn0oLet4JAqIPfITFDQex/FrYzTaygZAleBgT2Bw8w6yHbid5aB5Cj214uNG41YYvZmhwiBo8GKr3kmf/sCJS/sUvpsy8eqUsoNPCKXUqQv1UfKWFLnk7G7FnQOEYQ7/pm2j0KjGOHvhPhcEZI7azf56yo7+y2/efrgC/bl0Wls59Tia43Na9/y3Jw5k4ZkYBidt7lJvoSk3TGqFgWNJh+ptQpWDtLFw9ynckDW+mu9mQtI+1jkmFwAjQpfn+DofvHi0TScdAq4A07DWAug8r+qiKailxzkxRneW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:38.7105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91367e76-6295-45d2-b0dc-08d75d6ece83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2508
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=DaxqxdQT8o9PoY/edi3CPWQzUxVGsq1Xx+FVJLrPlmi/9st5IZxFp6wA2k+jGhzdm1pkhtKE09Y8nvDIjB8GOjRIRfRcsCOQ9Lmfw9kUoEqRYSzmfu/xfmiznYz9c17naEwGqKoSQOPNWWKcqox7Zm97/CDgr+30dN+Ef7UhDT8=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKQXMgb2YgRFAxLjQs
IEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5nCmlmIEZFQyBjYW4g
YmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3b3JrLgoKVGhlIGJp
dCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNFUyBhY2sgcmVwbHks
CmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBvZiBEUCBzdGFuZGFy
ZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERTQyBzdXBwb3J0CgpT
dG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwog
aW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8IDMgKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CmluZGV4IDNlN2I3NTUzY2Y0ZC4uOWYzNjA0MzU1NzA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKQEAgLTU1Myw2ICs1NTMsNyBAQCBzdGF0aWMgYm9vbCBkcm1fZHBfc2lk
ZWJhbmRfcGFyc2VfZW51bV9wYXRoX3Jlc291cmNlc19hY2soc3RydWN0IGRybV9kcF9zaWRlYmFu
ZAogewogCWludCBpZHggPSAxOwogCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNlcy5wb3J0X251bWJl
ciA9IChyYXctPm1zZ1tpZHhdID4+IDQpICYgMHhmOworCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNl
cy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lkeF0gJiAweDE7CiAJaWR4Kys7CiAJaWYgKGlkeCA+
IHJhdy0+Y3VybGVuKQogCQlnb3RvIGZhaWxfbGVuOwpAQCAtMjE4Myw2ICsyMTg0LDcgQEAgc3Rh
dGljIGludCBkcm1fZHBfc2VuZF9lbnVtX3BhdGhfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21nciAqbWdyLAogCQkJRFJNX0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNl
cyAlZDogJWQgJWRcbiIsIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVy
LCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5mdWxsX3BheWxvYWRfYndfbnVtYmVyLAog
CQkJICAgICAgIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmF2YWlsX3BheWxvYWRfYndf
bnVtYmVyKTsKIAkJCXBvcnQtPmF2YWlsYWJsZV9wYm4gPSB0eG1zZy0+cmVwbHkudS5wYXRoX3Jl
c291cmNlcy5hdmFpbF9wYXlsb2FkX2J3X251bWJlcjsKKwkJCXBvcnQtPmZlY19jYXBhYmxlID0g
dHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZmVjX2NhcGFibGU7CiAJCX0KIAl9CiAKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IDkxMTZiMmM5NTIzOS4uZjExM2FlMDRmYTg4IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTEwOCw2ICsxMDgsOCBAQCBzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0IHsKIAkgKiBhdWRpby1jYXBhYmxlLgogCSAqLwogCWJvb2wgaGFzX2F1ZGlvOworCisJ
Ym9vbCBmZWNfY2FwYWJsZTsKIH07CiAKIC8qKgpAQCAtMzEyLDYgKzMxNCw3IEBAIHN0cnVjdCBk
cm1fZHBfcG9ydF9udW1iZXJfcmVxIHsKIAogc3RydWN0IGRybV9kcF9lbnVtX3BhdGhfcmVzb3Vy
Y2VzX2Fja19yZXBseSB7CiAJdTggcG9ydF9udW1iZXI7CisJYm9vbCBmZWNfY2FwYWJsZTsKIAl1
MTYgZnVsbF9wYXlsb2FkX2J3X251bWJlcjsKIAl1MTYgYXZhaWxfcGF5bG9hZF9id19udW1iZXI7
CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
