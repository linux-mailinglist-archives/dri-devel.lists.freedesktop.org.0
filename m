Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1166203DA
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15238932A;
	Thu, 16 May 2019 10:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4868932A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:46:49 +0000 (UTC)
Received: from MWHPR12CA0058.namprd12.prod.outlook.com (2603:10b6:300:103::20)
 by BYAPR12MB2664.namprd12.prod.outlook.com (2603:10b6:a03:69::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.25; Thu, 16 May
 2019 10:46:48 +0000
Received: from CO1NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0058.outlook.office365.com
 (2603:10b6:300:103::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 10:46:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT042.mail.protection.outlook.com (10.152.81.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 16 May 2019 10:46:47 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 05:46:46 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm] enable syncobj test depending on capability
Date: Thu, 16 May 2019 18:46:42 +0800
Message-ID: <20190516104642.21450-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(428003)(199004)(189003)(336012)(126002)(476003)(2616005)(486006)(316002)(86362001)(8676002)(70586007)(8936002)(70206006)(72206003)(478600001)(81166006)(50226002)(81156014)(36756003)(186003)(16586007)(53416004)(26005)(68736007)(305945005)(77096007)(5660300002)(426003)(110136005)(2906002)(1076003)(4326008)(53936002)(47776003)(356004)(7696005)(48376002)(51416003)(6666004)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2664; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af39ad06-3122-4021-9633-08d6d9ebcba3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2664; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2664:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2664B59934CA7C225B519138B40A0@BYAPR12MB2664.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RfMA+1IfMOq1vb0oeI1+OIxKxRz7tm4vkUSvQr8tQzMR7a4H+obT0IInaRojkt3kziH2kESmsiTafRRi9VVApnURtrrFZqW8GSe4sf8q0LcStCFgMV2nJgraU7Lt7dy+HEEwswxqjrNozntcsn3gV+nO9zljOhnjAD5zpZ0r/8WvDXtorvpfu+GQIkhWBCoK+aV/fOVeK50+I7Wll1j7yJNCt3D6k9bOtAtuZL7fdwvDcn7UkTQXxjj8DLanv+79DexjNiVssgi2jQZ8HIFsbJS/qeUJt5KWrQDUqDXGjpbkeo75+ULdWa0q0SC/n3kELvzPhRd5TsTkQat+5bfWKiDXhCxDYL5HO8EOjZ6LBryfJWMkglkj9fINtv2V3LltZ1KAZ3VwfzKlCZ0PNKvmMmB+ciFznoFhUvyYBQw6gbM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 10:46:47.4539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af39ad06-3122-4021-9633-08d6d9ebcba3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTgBAFso4z+zaqkBN1Rfq8vI9B7S+LmfHa/l1ZRzlwI=;
 b=iP8MxGJHE8TG5hnbiYY51DIpm97/jYJnxvtMUUYuIfzdpQz/XX3mJ2St08s8+LsUuWmK7jv0KljKz89cZ/Of95PFa5b3wWbv3yIoA/T+j4eLcVSX8qKxJhffCuCkigMUJnxyiVqrWxRhq6CuM3+9sIOBY5QltCNb44OGwQBhh/k=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmVhdHVyZSBpcyBjb250cm9sbGVkIGJ5IERSTV9DQVBfU1lOQ09CSl9USU1FTElORSBkcm0gY2Fw
YWJpbGl0eS4KClNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5j
b20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtLmggICAgICAgICAgICB8IDEgKwogdGVzdHMvYW1kZ3B1
L3N5bmNvYmpfdGVzdHMuYyB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtLmggYi9pbmNsdWRlL2RybS9kcm0u
aAppbmRleCBjODkzZjNiNC4uNTMyNzg3YmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybS5o
CisrKyBiL2luY2x1ZGUvZHJtL2RybS5oCkBAIC02NDMsNiArNjQzLDcgQEAgc3RydWN0IGRybV9n
ZW1fb3BlbiB7CiAjZGVmaW5lIERSTV9DQVBfUEFHRV9GTElQX1RBUkdFVAkweDExCiAjZGVmaW5l
IERSTV9DQVBfQ1JUQ19JTl9WQkxBTktfRVZFTlQJMHgxMgogI2RlZmluZSBEUk1fQ0FQX1NZTkNP
QkoJCTB4MTMKKyNkZWZpbmUgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FCTB4MTQKIAogLyoqIERS
TV9JT0NUTF9HRVRfQ0FQIGlvY3RsIGFyZ3VtZW50IHR5cGUgKi8KIHN0cnVjdCBkcm1fZ2V0X2Nh
cCB7CmRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvc3luY29ial90ZXN0cy5jIGIvdGVzdHMvYW1k
Z3B1L3N5bmNvYmpfdGVzdHMuYwppbmRleCBhMGM2MjdkNy4uODY5ZWQ4OGUgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL2FtZGdwdS9zeW5jb2JqX3Rlc3RzLmMKKysrIGIvdGVzdHMvYW1kZ3B1L3N5bmNvYmpf
dGVzdHMuYwpAQCAtMjIsNiArMjIsNyBAQAogKi8KIAogI2luY2x1ZGUgIkNVbml0L0Jhc2ljLmgi
CisjaW5jbHVkZSAieGY4NmRybS5oIgogCiAjaW5jbHVkZSAiYW1kZ3B1X3Rlc3QuaCIKICNpbmNs
dWRlICJhbWRncHVfZHJtLmgiCkBAIC0zNiw2ICszNywxMyBAQCBzdGF0aWMgdm9pZCBhbWRncHVf
c3luY29ial90aW1lbGluZV90ZXN0KHZvaWQpOwogCiBDVV9CT09MIHN1aXRlX3N5bmNvYmpfdGlt
ZWxpbmVfdGVzdHNfZW5hYmxlKHZvaWQpCiB7CisJaW50IHI7CisJdWludDY0X3QgY2FwID0gMDsK
KworCXIgPSBkcm1HZXRDYXAoZHJtX2FtZGdwdVswXSwgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5F
LCAmY2FwKTsKKwlpZiAociB8fCBjYXAgPT0gMCkKKwkJcmV0dXJuIENVX0ZBTFNFOworCiAJcmV0
dXJuIENVX1RSVUU7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
