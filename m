Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C545E200ED
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 10:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BCF8930C;
	Thu, 16 May 2019 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710076.outbound.protection.outlook.com [40.107.71.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1E2892F1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 08:07:41 +0000 (UTC)
Received: from DM3PR12CA0077.namprd12.prod.outlook.com (2603:10b6:0:57::21) by
 CY4PR1201MB0053.namprd12.prod.outlook.com (2603:10b6:910:23::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.24; Thu, 16 May
 2019 08:07:39 +0000
Received: from DM3NAM03FT054.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM3PR12CA0077.outlook.office365.com
 (2603:10b6:0:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 08:07:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT054.mail.protection.outlook.com (10.152.83.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 08:07:38 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 03:07:37 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 6/7] wrap transfer interfaces
Date: Thu, 16 May 2019 16:07:13 +0800
Message-ID: <20190516080714.14980-6-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516080714.14980-1-david1.zhou@amd.com>
References: <20190516080714.14980-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(189003)(199004)(68736007)(336012)(4326008)(2906002)(53416004)(186003)(356004)(6666004)(53936002)(23676004)(50466002)(7696005)(76176011)(2870700001)(316002)(426003)(486006)(110136005)(2616005)(476003)(126002)(446003)(11346002)(50226002)(1076003)(36756003)(478600001)(8676002)(81166006)(81156014)(5660300002)(47776003)(70586007)(5820100001)(70206006)(8936002)(86362001)(77096007)(26005)(72206003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0053; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3d39459-061f-43d9-37f3-08d6d9d59010
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR1201MB0053; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0053:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0053A10985DCF8E57FB65E1EB40A0@CY4PR1201MB0053.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vTeKuYEP8iapE+iL6ZPHMmIlma/jiQB/2SUfMf19wVPf9zxe4QpJgk8vfdXIoPa7uMwZcD1+58j3N9lVu6B9ROjsxfPFV+FmBJvUdfidA7Z2yZ2PkuAFgzwtLo/gtuAA7fd7QVn9X9rLMHY4NAcVPiUF/lMr/lK8ScIULlSPli0RX7yL/vKzEKSOhSrAjRefplLJUeITK7LJrf8FFFyVnJWzM5tuZAhxzLwDfFg/9K54UFMj+gqhAPa+w2URjGb+H8N6XFNTzWvOMWoqYwzXuvBJo/r1dFKEmBEITrOQpUhy0z9xiXj94VdXhzCHkSlznNy8fMJyFxw/v3jehAJWoFqVV8BYOPMhKVIkbQku4TwoTJCwfm9vfLeHBRCOlclo1bqdo7wpjcL5Ny5DRzvdUnM7qXbTbjqmpv5bGoBX6tY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 08:07:38.6716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d39459-061f-43d9-37f3-08d6d9d59010
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dbko5WAdMGbIMIXiM5liwDe1ouAXfmmK+tTPp9O2aA=;
 b=EFGWAe6i70ghroTrjKWcwVanx0AEWjyLu1XRb7qLGP4k3g6PmpAJ71/DPhO67xBilH38gUxg/RLVGOw/h3yM/hlN6BLQI8Th2i2k9icfaadivzMQ3t2tjBgFG99cUTvJuAO4Hxs0cgFsi/YZbicaEl2iEKB0LggG1Dl8FQKhytY=
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

U2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KQWNrZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQWNrZWQtYnk6
IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KLS0tCiBh
bWRncHUvYW1kZ3B1LmggICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiBhbWRncHUvYW1k
Z3B1X2NzLmMgfCAxNiArKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1LmggYi9hbWRncHUvYW1kZ3B1LmgK
aW5kZXggZDI0ODBkYmUuLjlkOWIwODMyIDEwMDY0NAotLS0gYS9hbWRncHUvYW1kZ3B1LmgKKysr
IGIvYW1kZ3B1L2FtZGdwdS5oCkBAIC0xNjg1LDYgKzE2ODUsMjggQEAgaW50IGFtZGdwdV9jc19z
eW5jb2JqX2ltcG9ydF9zeW5jX2ZpbGUyKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKIAkJCQkJ
dWludDMyX3Qgc3luY29iaiwKIAkJCQkJdWludDY0X3QgcG9pbnQsCiAJCQkJCWludCBzeW5jX2Zp
bGVfZmQpOworCisvKioKKyAqICB0cmFuc2ZlciBiZXR3ZWVuIHN5bmNib2pzLgorICoKKyAqIFxw
YXJhbSAgIGRldgkJLSBcYyBbaW5dIGRldmljZSBoYW5kbGUKKyAqIFxwYXJhbSAgIGRzdF9oYW5k
bGUJLSBcYyBbaW5dIHN5bmMgb2JqZWN0IGhhbmRsZQorICogXHBhcmFtICAgZHN0X3BvaW50CS0g
XGMgW2luXSB0aW1lbGluZSBwb2ludCwgMCBwcmVzZW50cyBkc3QgaXMgYmluYXJ5CisgKiBccGFy
YW0gICBzcmNfaGFuZGxlCS0gXGMgW2luXSBzeW5jIG9iamVjdCBoYW5kbGUKKyAqIFxwYXJhbSAg
IHNyY19wb2ludAktIFxjIFtpbl0gdGltZWxpbmUgcG9pbnQsIDAgcHJlc2VudHMgc3JjIGlzIGJp
bmFyeQorICogXHBhcmFtICAgZmxhZ3MJLSBcYyBbaW5dIGZsYWdzCisgKgorICogXHJldHVybiAg
IDAgb24gc3VjY2Vzc1xuCisgKiAgICAgICAgICA8MCAtIE5lZ2F0aXZlIFBPU0lYIEVycm9yIGNv
ZGUKKyAqCisgKi8KK2ludCBhbWRncHVfY3Nfc3luY29ial90cmFuc2ZlcihhbWRncHVfZGV2aWNl
X2hhbmRsZSBkZXYsCisJCQkgICAgICAgdWludDMyX3QgZHN0X2hhbmRsZSwKKwkJCSAgICAgICB1
aW50NjRfdCBkc3RfcG9pbnQsCisJCQkgICAgICAgdWludDMyX3Qgc3JjX2hhbmRsZSwKKwkJCSAg
ICAgICB1aW50NjRfdCBzcmNfcG9pbnQsCisJCQkgICAgICAgdWludDMyX3QgZmxhZ3MpOworCiAv
KioKICAqIEV4cG9ydCBhbiBhbWRncHUgZmVuY2UgYXMgYSBoYW5kbGUgKHN5bmNvYmogb3IgZmQp
LgogICoKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVfY3MuYyBiL2FtZGdwdS9hbWRncHVfY3Mu
YwppbmRleCBkYWNhNDQyMS4uOTc3ZmEzY2YgMTAwNjQ0Ci0tLSBhL2FtZGdwdS9hbWRncHVfY3Mu
YworKysgYi9hbWRncHUvYW1kZ3B1X2NzLmMKQEAgLTgxNyw2ICs4MTcsMjIgQEAgb3V0OgogCXJl
dHVybiByZXQ7CiB9CiAKK2RybV9wdWJsaWMgaW50IGFtZGdwdV9jc19zeW5jb2JqX3RyYW5zZmVy
KGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKKwkJCQkJICB1aW50MzJfdCBkc3RfaGFuZGxlLAor
CQkJCQkgIHVpbnQ2NF90IGRzdF9wb2ludCwKKwkJCQkJICB1aW50MzJfdCBzcmNfaGFuZGxlLAor
CQkJCQkgIHVpbnQ2NF90IHNyY19wb2ludCwKKwkJCQkJICB1aW50MzJfdCBmbGFncykKK3sKKwlp
ZiAoTlVMTCA9PSBkZXYpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJuIGRybVN5bmNvYmpU
cmFuc2ZlcihkZXYtPmZkLAorCQkJCSAgZHN0X2hhbmRsZSwgZHN0X3BvaW50LAorCQkJCSAgc3Jj
X2hhbmRsZSwgc3JjX3BvaW50LAorCQkJCSAgZmxhZ3MpOworfQorCiBkcm1fcHVibGljIGludCBh
bWRncHVfY3Nfc3VibWl0X3JhdyhhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJCQkJICAgIGFt
ZGdwdV9jb250ZXh0X2hhbmRsZSBjb250ZXh0LAogCQkJCSAgICBhbWRncHVfYm9fbGlzdF9oYW5k
bGUgYm9fbGlzdF9oYW5kbGUsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
