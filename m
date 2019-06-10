Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E775A3B6B0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 16:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7789890DF;
	Mon, 10 Jun 2019 14:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690054.outbound.protection.outlook.com [40.107.69.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F8C890DF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:05:25 +0000 (UTC)
Received: from MN2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:208:a8::41)
 by DM6PR12MB2668.namprd12.prod.outlook.com (2603:10b6:5:4a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Mon, 10 Jun
 2019 14:05:23 +0000
Received: from BY2NAM03FT055.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by MN2PR12CA0028.outlook.office365.com
 (2603:10b6:208:a8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.15 via Frontend
 Transport; Mon, 10 Jun 2019 14:05:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT055.mail.protection.outlook.com (10.152.85.245) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Mon, 10 Jun 2019 14:05:23 +0000
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 10 Jun 2019
 09:05:22 -0500
From: Dingchen Zhang <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: remove the newline for CRC source name.
Date: Mon, 10 Jun 2019 09:47:51 -0400
Message-ID: <20190610134751.14356-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(1076003)(8676002)(5660300002)(6916009)(86362001)(16586007)(426003)(50226002)(77096007)(47776003)(54906003)(2351001)(53936002)(336012)(186003)(53416004)(81156014)(44832011)(6666004)(356004)(486006)(478600001)(81166006)(2906002)(316002)(26005)(2616005)(126002)(72206003)(476003)(50466002)(7696005)(4326008)(51416003)(68736007)(48376002)(36756003)(8936002)(70586007)(70206006)(14444005)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2668; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2bb9f38-bfe4-4209-cf69-08d6edacae3e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2668; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2668:
X-Microsoft-Antispam-PRVS: <DM6PR12MB266805B4B7F7669C3B80440E8D130@DM6PR12MB2668.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 0064B3273C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wXaawJHhaWrcyehlsMFbMPQ+kw/1SFJJqf9Q23XEft047s6MpX07j7xRAwP5KzPejuFOUfI5lV+8smIkvT83D+2oh+0EklEYyBjHtu+rLQpxhPSUy/Of89W/DKlqdCH2JugV9sbUgsnlWQ8BUiK77WYftAeyhyOgFM2XXnuGnDXTze/L7QrLyezTo1poCmZdBKsweJzpHR7vMbDn2NqO4kwpkf4wAN/7dhlmakpNIzPVmj69cwzQ/le7Yy+5KsRXE1on7GHo5LVNXK7luSyXpKz8WhCsMwDM5hqhOfEEsW9jksCOTRD/5x9kBckFGFSjec7hJrVO7xUoFtE0OsYKZJWpGm/PofeUZsd5t+Zo9rF3+VPTmIC3BVLv5vD6pLLWm4yVfLHSwPA7YkqOPEQbrW24ZgNP8yIhQrTkGLdKILw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2019 14:05:23.0771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bb9f38-bfe4-4209-cf69-08d6edacae3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2668
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNvJwHx7xXdq3CAa7ISGLq/I8Wo6Tgulg+jBEGAyWAI=;
 b=NPxdDgWFmX+mf+g26V5ioYIi4rmut28w/Pz9HQMqEGWFukUFS/oneSTGpcFm0o/JaZt7fl/sHUFRTxJNuYUmtbBbtL93lnSjMEx1lnQfFC7/W95lv8oVCA79Xg28bPGCJBcGAFfOtOIm+BXn3yTlOXGQT8a/E/njrsbZFAz6EiY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dingchen Zhang <dingchen.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dXNlcnNwYWNlIG1heSB0cmFuc2ZlciBhIG5ld2xpbmUsIGFuZCB0aGlzIHRlcm1pbmF0aW5nIG5l
d2xpbmUKaXMgcmVwbGFjZWQgYnkgYSAnXDAnIHRvIGF2b2lkIGZvbGxvd3VwIGlzc3Vlcy4KCids
ZW4tMScgaXMgdGhlIGluZGV4IHRvIHJlcGxhY2UgdGhlIG5ld2xpbmUgb2YgQ1JDIHNvdXJjZSBu
YW1lLgoKdjM6IHR5cG8gZml4IChTYW0pCgp2MjogdXBkYXRlIHBhdGNoIHN1YmplY3QsIGJvZHkg
YW5kIGZvcm1hdC4gKFNhbSkKCkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEhh
cnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBEaW5nY2hlbiBaaGFuZyA8ZGluZ2NoZW4u
emhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCmluZGV4IDU4NTE2OWYwZGNjNS4uZGFjMjY3ZTg0MGFm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCkBAIC0xMzEsOCArMTMxLDggQEAgc3RhdGlj
IHNzaXplX3QgY3JjX2NvbnRyb2xfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIg
X191c2VyICp1YnVmLAogCWlmIChJU19FUlIoc291cmNlKSkKIAkJcmV0dXJuIFBUUl9FUlIoc291
cmNlKTsKIAotCWlmIChzb3VyY2VbbGVuXSA9PSAnXG4nKQotCQlzb3VyY2VbbGVuXSA9ICdcMCc7
CisJaWYgKHNvdXJjZVtsZW4gLSAxXSA9PSAnXG4nKQorCQlzb3VyY2VbbGVuIC0gMV0gPSAnXDAn
OwogCiAJcmV0ID0gY3J0Yy0+ZnVuY3MtPnZlcmlmeV9jcmNfc291cmNlKGNydGMsIHNvdXJjZSwg
JnZhbHVlc19jbnQpOwogCWlmIChyZXQpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
