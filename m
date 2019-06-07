Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14813981D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 23:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74323890C7;
	Fri,  7 Jun 2019 21:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790051.outbound.protection.outlook.com [40.107.79.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98B2890C7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 21:57:08 +0000 (UTC)
Received: from MWHPR12CA0069.namprd12.prod.outlook.com (2603:10b6:300:103::31)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Fri, 7 Jun
 2019 21:57:06 +0000
Received: from CO1NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by MWHPR12CA0069.outlook.office365.com
 (2603:10b6:300:103::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.13 via Frontend
 Transport; Fri, 7 Jun 2019 21:57:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT064.mail.protection.outlook.com (10.152.81.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Fri, 7 Jun 2019 21:57:06 +0000
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 7 Jun 2019
 16:57:05 -0500
From: Dingchen Zhang <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: remove the newline for CRC source name.
Date: Fri, 7 Jun 2019 17:38:17 -0400
Message-ID: <20190607213817.11767-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(81166006)(53936002)(81156014)(426003)(8936002)(8676002)(2906002)(50226002)(478600001)(356004)(16586007)(4326008)(51416003)(68736007)(7696005)(5660300002)(6666004)(336012)(48376002)(14444005)(86362001)(50466002)(1076003)(126002)(72206003)(2616005)(2351001)(54906003)(44832011)(36756003)(6916009)(186003)(26005)(77096007)(47776003)(316002)(486006)(305945005)(53416004)(70206006)(70586007)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66df2217-9cb3-4f8c-e612-08d6eb9314fe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12799A6519F6EBDB34DAC4568D100@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 0061C35778
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7RgCagIN9RRRunTuo/1kmp8pHknXq5tjeQu/qxoVneG3Qs2ra+91LC+rUI5pIEAaUUOtRpDu/6awhRqQ/hVjmUYgXiCqqWLhb5v2CQnspeHa+wLR/gOZr2vvYo1ge4yx/Xt6AVYkJkvJqMUy0G1BeAZD9VBWUMBVwo2hqIKMNDaM9Xtdr0FFlpC0T0+hHFXI7A1xxYorBzkv0Zd7ZkCS6yBAB7s2jlZJsy+ElMP8CIzsE9iclVp1p2pD3O9YihG1+TVcIGPvtJCpQaLs2bJks/Nhtd6o8Ie5Scmtgc+gN9iNMl9LAZ/mnp1F7N2hqv4KFVK3m7KxBHqKTmZA492Xbrwv+SVjzx/CIgcgosRCrATGSDrG3lJ4/564OYju+KoS5iqid1+uQKmrl0Zaboz7fBJHYQWEmJ/QqDp+q7obJSA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2019 21:57:06.2481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66df2217-9cb3-4f8c-e612-08d6eb9314fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8kg5yfYUrgy8WOJ7va8iqg86hUMfvzWYFMKz+6I/BQ=;
 b=FMAfYcso2/LLbGl2yDlaSDlQDJZZL0nIv8RSqT144t0gzEUTP/bVxB0U2gtfsX8sJom/LR5UDbsm2c34QTJY4kmvEO2OrxtZLgWiT2kY8qAk4rLWYAX1iH1TKDqyNN8YWf7uzoz+fX+to6nlfF0jhMLJky4kHQKj0OOnKIdp84w=
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
d2xpbmUKaXMgcmVwbGFjZWQgYnkgYSAnXDAnIHRvIGF2b2lkIGZvbGxvd3VwIGlzc3Vlcy4KCidu
LTEnIGlzIHRoZSBpbmRleCB0byByZXBsYWNlIHRoZSBuZXdsaW5lIG9mIENSQyBzb3VyY2UgbmFt
ZS4KCnYyOiB1cGRhdGUgcGF0Y2ggc3ViamVjdCwgYm9keSBhbmQgZm9ybWF0LiAoU2FtKQoKQ2M6
IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPEhhcnJ5Lldl
bnRsYW5kQGFtZC5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25l
ZC1vZmYtYnk6IERpbmdjaGVuIFpoYW5nIDxkaW5nY2hlbi56aGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3Jj
LmMKaW5kZXggNTg1MTY5ZjBkY2M1Li5kYWMyNjdlODQwYWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmMKQEAgLTEzMSw4ICsxMzEsOCBAQCBzdGF0aWMgc3NpemVfdCBjcmNfY29udHJvbF93
cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKnVidWYsCiAJaWYgKElT
X0VSUihzb3VyY2UpKQogCQlyZXR1cm4gUFRSX0VSUihzb3VyY2UpOwogCi0JaWYgKHNvdXJjZVts
ZW5dID09ICdcbicpCi0JCXNvdXJjZVtsZW5dID0gJ1wwJzsKKwlpZiAoc291cmNlW2xlbiAtIDFd
ID09ICdcbicpCisJCXNvdXJjZVtsZW4gLSAxXSA9ICdcMCc7CiAKIAlyZXQgPSBjcnRjLT5mdW5j
cy0+dmVyaWZ5X2NyY19zb3VyY2UoY3J0Yywgc291cmNlLCAmdmFsdWVzX2NudCk7CiAJaWYgKHJl
dCkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
