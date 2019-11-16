Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E8FF5EF
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7959C6E1ED;
	Sat, 16 Nov 2019 22:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AE86E1BD;
 Sat, 16 Nov 2019 22:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G146EOiOldQdFPUhR4bQg/JdmGmg9sPQqNpSiwYww79ykXFT3fihAOYz1xfrWYWiaPRC+53OUmhCmLeMuy7XhNbgkD2Pj+EnpdG8U6SlDP6/aJlVTbdumT7KakNYReFOmCztldtfPmK9B6+HBtLxE0plP3k3yJGioyoL2M3VfgLXncPfzC/xEClJgCxlXRSQq6b73gFTpwfn0NoVfZzmD++YN5goebqJNy9Nb7rJI1K2BtM59QIkaMHxRVe0SdjvznCgyTmbuZO5WX4P+A940mDRCdlUY9ZZzAljKpyoSAjoUe8D3EVSLWjiMBrB+fVjRdmeoThEWpPv3KQmuaO68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTodLTZAP+8jfwQY0weyYwS8j96zYlC2FWxnAFndJHg=;
 b=k3uPMUjWf9SndLdce78W4VdnJc+taUABs//5FTSKyI0flqjSN7FpOf/D+8IZi6FVTAjM8PuUQwPBy4qtbbw7s/TTNZoOg7cWGu/lLYGEKGfNuWAJaTmZCMLF1yptqnLkSRmlTtMfAyNSvLGG8MJ59ZecXC2OlOUg48wHFgdQSFFiHONF+SNY8aYvuT/lGhHL9KjsuKwnIEmf623SSDAYhrXTRdAFDAafq4pZMAfTcRLub0pmhM6d6AnwqT5nNCMElXryuyc5kzzElt6XbFzp1S+EZIhxfeYB3EHeW+3VWDrrIylDMMDJiTyLO0PYV6oscuvwg3hKTQHKTXkc7LBe6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by BY5PR12MB4050.namprd12.prod.outlook.com
 (2603:10b6:a03:207::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Sat, 16 Nov
 2019 22:01:38 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:36 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:36 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:36 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 09/17] drm/amd/display: Write DSC enable to MST DPCD
Date: Sat, 16 Nov 2019 17:01:20 -0500
Message-ID: <20191116220128.16598-10-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(428003)(199004)(189003)(11346002)(2351001)(26005)(2616005)(86362001)(426003)(36756003)(48376002)(446003)(53416004)(51416003)(336012)(5660300002)(6666004)(50466002)(356004)(8936002)(70586007)(70206006)(50226002)(305945005)(186003)(7696005)(47776003)(81166006)(81156014)(8676002)(478600001)(76176011)(1076003)(2906002)(6916009)(2876002)(16586007)(54906003)(476003)(14444005)(126002)(486006)(316002)(4326008)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4050; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43221a70-b290-49af-4daf-08d76ae08dbf
X-MS-TrafficTypeDiagnostic: BY5PR12MB4050:
X-Microsoft-Antispam-PRVS: <BY5PR12MB40505FE5C82363649851B603E4730@BY5PR12MB4050.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7c8TwKgrMmCVBsZZmZTYBxan+XjOtokMrsLgbahRCiI3yHM0hPXTJfrN0oUX0uitTM4KaxnzaQqBAvsYdeodacBYuFbDzxm8091UpWVucejbTd0JF0XpPmXuI5+SMRJ2pOuC/qDLUeF99AJSgHZYDdJBb04uIENe/Er6Wdh8GQH3X7rGfo1WT7mrqMVhyUVG4VKhE7LWvMmNZcOpnSozxPvDwVfXgpMtvLQ6L9DVOatC0gefFk0GTjNAP32/cFZmvT4YtFsM6djQKwCW+pIdiWGgUwzfzAXqxwacpNp1tqTZ96lBMDNn2GAW9hH/NNdRHULyT3Osi+oLUKvXH8oas75SP5iMxRrb5B7Z5HFvT530yiMTOn/DjNgCVe5y3CIpKkT4ehWh8qBtp64CqxVieeEC7D1r6ueHLoo3BZsLhWNj6UstF0JcztCFr7Q8V87
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:37.7966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43221a70-b290-49af-4daf-08d76ae08dbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTodLTZAP+8jfwQY0weyYwS8j96zYlC2FWxnAFndJHg=;
 b=SfKXv2o7bKpK6MTPGVBAhGqlELvjsFU8YwrXdup/HRs7iynm5I/9idKYsrfJYNDV3PNjjfYD2IfawXqpXXgcK5OFKODyP7WEfdlarnATh9L6FbSswBfL1PfiHsJtJecssUJO4WdGWe/JgMhMirFTMNZbJPO2AWsTxJttb6QOpg8=
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
Cc: David Francis <David.Francis@amd.com>, Mikita
 Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKUmV3b3JrIHRoZSBk
bV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxlIHRoZSBNU1QgY2Fz
ZS4KClVzZSB0aGUgY2FjaGVkIGRzY19hdXggZmllbGQuCgpSZXZpZXdlZC1ieTogV2VuamluZyBM
aXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRh
LmxpcHNraUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYyB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCmluZGV4IDY2ZjI2
NmE1ZTEwYi4uMDY5YjdhNmY1NTk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCkBAIC0zNyw2ICszNyw3
IEBACiAjaW5jbHVkZSAiZGMuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKICNpbmNsdWRlICJh
bWRncHVfZG1faXJxLmgiCisjaW5jbHVkZSAiYW1kZ3B1X2RtX21zdF90eXBlcy5oIgogCiAjaW5j
bHVkZSAiZG1faGVscGVycy5oIgogCkBAIC01MTYsOCArNTE3LDI0IEBAIGJvb2wgZG1faGVscGVy
c19kcF93cml0ZV9kc2NfZW5hYmxlKAogKQogewogCXVpbnQ4X3QgZW5hYmxlX2RzYyA9IGVuYWJs
ZSA/IDEgOiAwOworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yOworCisJ
aWYgKCFzdHJlYW0pCisJCXJldHVybiBmYWxzZTsKKworCWlmIChzdHJlYW0tPnNpZ25hbCA9PSBT
SUdOQUxfVFlQRV9ESVNQTEFZX1BPUlRfTVNUKSB7CisJCWFjb25uZWN0b3IgPSAoc3RydWN0IGFt
ZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0tPmRtX3N0cmVhbV9jb250ZXh0OworCisJCWlmICgh
YWNvbm5lY3Rvci0+ZHNjX2F1eCkKKwkJCXJldHVybiBmYWxzZTsKKworCQlyZXR1cm4gKGRybV9k
cF9kcGNkX3dyaXRlKGFjb25uZWN0b3ItPmRzY19hdXgsIERQX0RTQ19FTkFCTEUsICZlbmFibGVf
ZHNjLCAxKSA+PSAwKTsKKwl9CisKKwlpZiAoc3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZUEVf
RElTUExBWV9QT1JUKQorCQlyZXR1cm4gZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwgc3Ry
ZWFtLT5saW5rLCBEUF9EU0NfRU5BQkxFLCAmZW5hYmxlX2RzYywgMSk7CiAKLQlyZXR1cm4gZG1f
aGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwgc3RyZWFtLT5zaW5rLT5saW5rLCBEUF9EU0NfRU5B
QkxFLCAmZW5hYmxlX2RzYywgMSk7CisJcmV0dXJuIGZhbHNlOwogfQogCiBib29sIGRtX2hlbHBl
cnNfaXNfZHBfc2lua19wcmVzZW50KHN0cnVjdCBkY19saW5rICpsaW5rKQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
