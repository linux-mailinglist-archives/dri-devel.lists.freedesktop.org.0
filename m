Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB082601C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 11:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8C890A8;
	Wed, 22 May 2019 09:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750055.outbound.protection.outlook.com [40.107.75.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35603890A8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:08:11 +0000 (UTC)
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by CY4PR1201MB0055.namprd12.prod.outlook.com (2603:10b6:910:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17; Wed, 22 May
 2019 09:08:09 +0000
Received: from CO1NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16 via Frontend
 Transport; Wed, 22 May 2019 09:08:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT047.mail.protection.outlook.com (10.152.81.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Wed, 22 May 2019 09:08:07 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 22 May 2019
 04:08:05 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <michel@daenzer.net>
Subject: [PATCH 1/2] update drm.h
Date: Wed, 22 May 2019 17:07:59 +0800
Message-ID: <20190522090800.15908-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(126002)(1076003)(478600001)(23676004)(110136005)(7696005)(5660300002)(4326008)(2906002)(36756003)(6666004)(356004)(68736007)(4744005)(81166006)(72206003)(50466002)(2201001)(86362001)(2870700001)(2616005)(26005)(186003)(47776003)(8936002)(476003)(316002)(8676002)(305945005)(5820100001)(336012)(426003)(70586007)(70206006)(53936002)(486006)(81156014)(53416004)(50226002)(77096007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0055; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca6a0c37-b1e6-488c-d0fb-08d6de9501cd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR1201MB0055; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0055:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0055168826691117FA2841F4B4000@CY4PR1201MB0055.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-Forefront-PRVS: 0045236D47
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7KVXeTWsVGAAArZyGL+v0U++5ADMAMfKIFpcvAjHc/oVJgHJvIZYbh7uMln2VBJshBSDfEDDMkShgO3kpwwdK3W5Mbvzd/Ja696QmWOtoWllY5yCgSKdcAiyITmQKKcZs2/qeQra9lUTGVxI/QY78unzpd9tRreJTGfNxRQD5cOQKbAfkzG5IfYY9RXxytTor1YwrUZWO+QSevHyGhBdN1jc3uT4hdtWQL4GTUZ3V+M91IaqfbzqQgty6O5f1TNsS+G6x7REN5JkzLZNHI1cNtEwbiJ3+bQAL4i++qI1NdvYzcPtbWVhmCJXIRgV6Q8gXMXpU3krOVla4cWMFZLBEGDGyXH6MIdxusETEH58ee6v0b+CRqIhSvskG0iTe5mfAxV6r4JVZ7fSHtKJFC3V4SMcRt8r296O88TC9OOBoNY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2019 09:08:07.9301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6a0c37-b1e6-488c-d0fb-08d6de9501cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH0vC5jskikFbEDN/Eb7Jq3exmZmRcyCZ/S7/2yrthA=;
 b=Cn7rqnNeZyFzN+TLtfEy3J/zmJ1DERSmCsJimYM5kOLUR0GhqJ9LL8+kXkmc0+KXnVvtkXDSACNlN4gV9Fuj8Ky9fXGnk/3dqLJO0m+r4eL5aw95jl5OXJiTkpPpFkmVDeluNkNf2S+IF2LJxuYEG2NDeJA7GH5RkglW3mzsRpA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICAgYSkgZGVsdGE6IG9ubHkgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FCiAgIGIpIEdlbmVyYXRl
ZCB1c2luZyBtYWtlIGhlYWRlcnNfaW5zdGFsbC4KICAgYykgR2VuZXJhdGVkIGZyb20gb3JpZ2lu
L2RybS1taXNjLW5leHQgY29tbWl0IDk4MmMwNTAwZmQxYTgwMTJjMzFkM2M5ZGQ4ZGUyODUxMjk5
MDQ2NTYiCgpTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29t
PgpTdWdnZXN0ZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+Ci0tLQog
aW5jbHVkZS9kcm0vZHJtLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtLmggYi9pbmNsdWRlL2RybS9kcm0uaAppbmRl
eCBjODkzZjNiNC4uNDM4YWJkZTMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybS5oCisrKyBi
L2luY2x1ZGUvZHJtL2RybS5oCkBAIC00NCw2ICs0NCw3IEBAIHR5cGVkZWYgdW5zaWduZWQgaW50
IGRybV9oYW5kbGVfdDsKIAogI2Vsc2UgLyogT25lIG9mIHRoZSBCU0RzICovCiAKKyNpbmNsdWRl
IDxzdGRpbnQuaD4KICNpbmNsdWRlIDxzeXMvaW9jY29tLmg+CiAjaW5jbHVkZSA8c3lzL3R5cGVz
Lmg+CiB0eXBlZGVmIGludDhfdCAgIF9fczg7CkBAIC02NDMsNiArNjQ0LDcgQEAgc3RydWN0IGRy
bV9nZW1fb3BlbiB7CiAjZGVmaW5lIERSTV9DQVBfUEFHRV9GTElQX1RBUkdFVAkweDExCiAjZGVm
aW5lIERSTV9DQVBfQ1JUQ19JTl9WQkxBTktfRVZFTlQJMHgxMgogI2RlZmluZSBEUk1fQ0FQX1NZ
TkNPQkoJCTB4MTMKKyNkZWZpbmUgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FCTB4MTQKIAogLyoq
IERSTV9JT0NUTF9HRVRfQ0FQIGlvY3RsIGFyZ3VtZW50IHR5cGUgKi8KIHN0cnVjdCBkcm1fZ2V0
X2NhcCB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
