Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B4CE8A19
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3BC6E3D2;
	Tue, 29 Oct 2019 13:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAB26E3C1;
 Tue, 29 Oct 2019 13:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM4EjLXrx0yATGfzYx1pDL9atwp6sGQBAdAJd6A5pJWwZakn8Xc9ECjyMNEWWFHpoKUpY2Uu3uPxolBm2bUzMcG9wZYYePPo/aOdbvYnu2/6pO0kVazstXCA2r4HCZxSCq3XEX+0JbOqTYOBh5aHf+WDWZet6eBINxTRAi0HPkPJ9ffibKU+oWOTykjeG+ug5WkBd/dnRZHFq3G8aQVTVbgWvgFQLdek0EemDbKiOAAQXPgytspbrqB4hFf8QKgr3PVMqz6pLAUuMUikJAVVDUOVIlQSPSyzaBH2cVRzzxjv96xlFkejft3RO+Pf62POtsF3xNwSJKxpOX6q/TNd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnEiCA6Vgu/cT7PLsH3dGseoeVDmyywcZLnSA7pfB1A=;
 b=RHWtciqcsDBDKZ4JnCUGDLJf+wggYa3xEYjipStr1cic/6PlL368taxjAoeh7qz3TgoetajX+tuSmBsKWpEDlP7eeE6XwBDDF3vRQS+bHgMIhmt7Bdf1dB1WIceaa6Wa1zBFYCWcasozIJU/0l4oDxsh/xADn27s75QABl4Gr3n8vuG2aXGrl4d/4DKLwWj7UOBJPmUPYvQfookEopec59p2vMiwaq8OC5x1xWeZRXajhu2K4sf7U+H3r6w8Xf0Dp6TlS88OZN9LDbHKDA3Zl7UYcGW3rCY/BcnypqL2PMQ+Y6jAZm5OQcq/LIqXP+2AF5EUWI8vVyy/bSdQijGzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0018.namprd12.prod.outlook.com (2603:10b6:610:57::28)
 by DM5PR12MB1914.namprd12.prod.outlook.com (2603:10b6:3:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17; Tue, 29 Oct
 2019 13:52:57 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CH2PR12CA0018.outlook.office365.com
 (2603:10b6:610:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:56 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:56 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:55 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/13] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Tue, 29 Oct 2019 09:52:39 -0400
Message-ID: <20191029135245.31152-8-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(428003)(199004)(189003)(26005)(476003)(2906002)(478600001)(8676002)(186003)(1076003)(2351001)(2876002)(81156014)(486006)(54906003)(36756003)(14444005)(76176011)(305945005)(86362001)(7696005)(4326008)(51416003)(50226002)(316002)(81166006)(6916009)(70206006)(336012)(356004)(5660300002)(48376002)(16586007)(70586007)(8936002)(50466002)(126002)(11346002)(426003)(53416004)(446003)(47776003)(6666004)(2616005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1914; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9feb897f-2b33-4576-b958-08d75c774e01
X-MS-TrafficTypeDiagnostic: DM5PR12MB1914:
X-Microsoft-Antispam-PRVS: <DM5PR12MB19140C83715AEE21A59A60B0E4610@DM5PR12MB1914.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4YfVhW0jkyJHHJGcaMrJ76GH3KBsLkc/l+5MKsPoPp+VANH2whCGupoXdnvEWBEbUFFYSj7wg4PTC2w/cETEiHjCfHsonFRJJ6i6HREI+eJsBa1wvyEn2EGPl1C5CDWWOeQB/5p5zbPB6WKaVtUYHe0luvQQ4yQSvpDBLKlC6D+BrLxhLvRS9pSCadIRklIHa7rpMa6UROGsQRGeLtN77KbbY7yHHK6/F/HH1c8EywnjHihpTAPc/P7gRd0KrVZb5ruB7gR6MxZ4e7weCjyvMMLsSy88XT4vABPceTW+2eYX7DZJ7qd3KmBgG4MQPdZ0RjpJUje5RS1pl7pZMjcuXtfnIKurmy8DLqJ/2s/rWlsyrk9bpPZwvHzvKJInQpuxMRPWyJLDXPE+2u1YGcHkSJSO4/xQxSuAyD4dj0BQqdzX2P7zU9YB3t46F9HvcaRk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:57.4152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9feb897f-2b33-4576-b958-08d75c774e01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnEiCA6Vgu/cT7PLsH3dGseoeVDmyywcZLnSA7pfB1A=;
 b=4JRgrTo8af/OgclBJoiWdaCGa2IvQ6VSzyUCRVlxIJpaJGTdAiKvK7IBGC+8V9TSK5hjiYPWlM/hPBTMtrgoCXmsdUwdvg4X5L9lgqC3nOR8ZgCPSGJJN+Wv4rJDOqx3zTP/Iog9YakUNglw7NYekfhq+M4ioVPskIVgOFzcd8c=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKU3luYXB0aWNzIERQ
MS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQgdmlydHVhbCBEUENE
IHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQg
ZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNlIGh1YnMgaGF2ZSBt
YW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRvIGRldGVjdCB0aGlz
IGNhc2UuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9oZWxwZXIuYyAgICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgIHwgIDcgKysrKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggYWYxY2Q5Njhh
ZGZkLi4wMmZhOGMzZDlhODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMTI3MSw2ICsx
MjcxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcGNkX3F1aXJrIGRwY2RfcXVpcmtfbGlzdFtd
ID0gewogCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwgQklU
KERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9LAogCS8qIENINzUxMSBzZWVtcyB0byBsZWF2ZSBTSU5L
X0NPVU5UIHplcm9lZCAqLwogCXsgT1VJKDB4MDAsIDB4MDAsIDB4MDApLCBERVZJQ0VfSUQoJ0Mn
LCAnSCcsICc3JywgJzUnLCAnMScsICcxJyksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19T
SU5LX0NPVU5UKSB9LAorCS8qIFN5bmFwdGljcyBEUDEuNCBNU1QgaHVicyBjYW4gc3VwcG9ydCBE
U0Mgd2l0aG91dCB2aXJ0dWFsIERQQ0QgKi8KKwl7IE9VSSgweDkwLCAweENDLCAweDI0KSwgREVW
SUNFX0lEX0FOWSwgdHJ1ZSwgQklUKERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9E
UENEKSB9LAogfTsKIAogI3VuZGVmIE9VSQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKaW5kZXggZDhmOWJhMjdiNTU5Li5kNWRmMDIzMTVlMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwpAQCAtNDIyMiw2ICs0MjIyLDcgQEAgc3RydWN0IGRybV9kcF9hdXgg
KmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0
KQogewogCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKmltbWVkaWF0ZV91cHN0cmVhbV9wb3J0Owog
CXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKmZlY19wb3J0OworCXN0cnVjdCBkcm1fZHBfZGVzYyBk
ZXNjID0geyAwIH07CiAKIAlpZiAoIXBvcnQpCiAJCXJldHVybiBOVUxMOwpAQCAtNDI3NCw2ICs0
Mjc1LDMyIEBAIHN0cnVjdCBkcm1fZHBfYXV4ICpkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQo
c3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKIAlpZiAoZHJtX2RwX21zdF9pc192aXJ0dWFs
X2RwY2QocG9ydCkpCiAJCXJldHVybiAmcG9ydC0+YXV4OwogCisJLyoKKwkgKiBTeW5hcHRpY3Mg
cXVpcmsKKwkgKiBBcHBsaWVzIHRvIHBvcnRzIGZvciB3aGljaDoKKwkgKiAtIFBoeXNpY2FsIGF1
eCBoYXMgU3luYXB0aWNzIE9VSQorCSAqIC0gRFB2MS40IG9yIGhpZ2hlcgorCSAqIC0gUG9ydCBp
cyBvbiBwcmltYXJ5IGJyYW5jaCBkZXZpY2UKKwkgKiAtIE5vdCBhIFZHQSBhZGFwdGVyIChEUF9E
V05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKQorCSAqLworCWlmICghZHJtX2RwX3JlYWRfZGVzYyhw
b3J0LT5tZ3ItPmF1eCwgJmRlc2MsIHRydWUpKQorCQlyZXR1cm4gTlVMTDsKKworCWlmIChkcm1f
ZHBfaGFzX3F1aXJrKCZkZXNjLCBEUF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBD
RCkgJiYKKwkgICAgcG9ydC0+bWdyLT5kcGNkW0RQX0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8x
NCAmJgorCSAgICBwb3J0LT5wYXJlbnQgPT0gcG9ydC0+bWdyLT5tc3RfcHJpbWFyeSkgeworCQl1
OCBkb3duc3RyZWFtcG9ydDsKKworCQlpZiAoZHJtX2RwX2RwY2RfcmVhZCgmcG9ydC0+YXV4LCBE
UF9ET1dOU1RSRUFNUE9SVF9QUkVTRU5ULAorCQkJCSAgICAgJmRvd25zdHJlYW1wb3J0LCAxKSA8
IDApCisJCQlyZXR1cm4gTlVMTDsKKworCQlpZiAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NU
Uk1fUE9SVF9QUkVTRU5UKSAmJgorCQkgICAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NUUk1f
UE9SVF9UWVBFX01BU0spCisJCSAgICAgIT0gRFBfRFdOX1NUUk1fUE9SVF9UWVBFX0FOQUxPRykp
CisJCQlyZXR1cm4gcG9ydC0+bWdyLT5hdXg7CisJfQorCiAJcmV0dXJuIE5VTEw7CiB9CiBFWFBP
UlRfU1lNQk9MKGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydCk7CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5k
ZXggNmUxNzQxMGEwNDE3Li42MWVmMzUxYzVmY2EgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTE0NjAs
NiArMTQ2MCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7CiAJICogVGhlIGRyaXZlciBzaG91bGQg
aWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4KIAkgKi8KIAlEUF9EUENEX1FVSVJL
X05PX1NJTktfQ09VTlQsCisJLyoqCisJICogQERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklS
VFVBTF9EUENEOgorCSAqCisJICogVGhlIGRldmljZSBzdXBwb3J0cyBNU1QgRFNDIGRlc3BpdGUg
bm90IHN1cHBvcnRpbmcgVmlydHVhbCBEUENELgorCSAqIFRoZSBEU0MgY2FwcyBjYW4gYmUgcmVh
ZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXggaW5zdGVhZC4KKwkgKi8KKwlEUF9EUENEX1FVSVJLX0RT
Q19XSVRIT1VUX1ZJUlRVQUxfRFBDRCwKIH07CiAKIC8qKgotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
