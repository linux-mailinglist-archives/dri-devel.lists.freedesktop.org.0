Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E71B345
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 11:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE4A89B84;
	Mon, 13 May 2019 09:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750043.outbound.protection.outlook.com [40.107.75.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB9889B84;
 Mon, 13 May 2019 09:53:29 +0000 (UTC)
Received: from BN4PR12CA0019.namprd12.prod.outlook.com (2603:10b6:403:2::29)
 by SN6SPR01MB0031.namprd12.prod.outlook.com (2603:10b6:805:78::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Mon, 13 May
 2019 09:53:27 +0000
Received: from CO1NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by BN4PR12CA0019.outlook.office365.com
 (2603:10b6:403:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Mon, 13 May 2019 09:53:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT033.mail.protection.outlook.com (10.152.80.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 09:53:27 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 04:53:25 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 6/7] wrap transfer interfaces
Date: Mon, 13 May 2019 17:53:04 +0800
Message-ID: <20190513095305.14110-6-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513095305.14110-1-david1.zhou@amd.com>
References: <20190513095305.14110-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(376002)(136003)(2980300002)(428003)(199004)(189003)(2906002)(7696005)(76176011)(356004)(5820100001)(6666004)(68736007)(486006)(305945005)(126002)(1076003)(36756003)(23676004)(50466002)(478600001)(186003)(5660300002)(47776003)(26005)(77096007)(2870700001)(70206006)(54906003)(110136005)(81166006)(81156014)(336012)(446003)(426003)(8676002)(316002)(70586007)(476003)(53936002)(72206003)(86362001)(2616005)(11346002)(8936002)(53416004)(50226002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6SPR01MB0031; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ee88b7-a189-44fd-8587-08d6d788d8cf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN6SPR01MB0031; 
X-MS-TrafficTypeDiagnostic: SN6SPR01MB0031:
X-Microsoft-Antispam-PRVS: <SN6SPR01MB0031E98EFCF64659EF35743BB40F0@SN6SPR01MB0031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fyW7lv6Jot1H3lSUFQkct2G2OW5XYdmpvreocxpOkRjsMGAwaMzWFQ2MT1omDMCdqy7Zspoydgolvx6EdSKD04jCV4o50LAViuCJhgtuZZXD0eDhPmMWtA4QAIrhRPwEAcyNG8gSr2a6OFxhmV19lPzlzbjrj3IErLlqCV2jE08dsb0WIBRolzvfFNh3ry8CGbQKUnUdczDM1rUpXtzOKVWlwKbFFnzYlieeZysp8gCOts5e7zj+18ia0GebPLP1xtWtoYSbWIljxWW8cKZxDbrTd7RpEiYbIunKyDpTH04DAzIyZR9SG5sZ7Uyco1ZiWZGEaFS0MhWZ4YIccM2bhguwWgEvxTvPgwVlfi23b8yqgXbDdFTGU6EVZpxldMuLGn/dMPvG1JUnbT7QP5iGBorh15Zrl2JKFu97JZmlo4k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 09:53:27.0428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee88b7-a189-44fd-8587-08d6d788d8cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6SPR01MB0031
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4WCEkh3Y1nXOwyC7oJVUdOizQp0ruTyyAl/1vAOQY=;
 b=ad3mC2zFSme4H+BtW3gUQ3yvVCxaJQjJ3AMDg+ExoSJvtzNHiMi4MWH+LhBVcxoKbWrkB6Ufs1M1mGtT64VDSyF4cdARb1pq9tx8KGlTz1mQ6GFLAWdaSE8IEelWB2iTRsfB8fYRrDzAiA7NZ+D2SBd9e+VkgoHPA5mjLssSmyc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KQWNrZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBhbWRn
cHUvYW1kZ3B1LmggICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiBhbWRncHUvYW1kZ3B1
X2NzLmMgfCAxNiArKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1LmggYi9hbWRncHUvYW1kZ3B1LmgKaW5k
ZXggZDI0ODBkYmUuLjlkOWIwODMyIDEwMDY0NAotLS0gYS9hbWRncHUvYW1kZ3B1LmgKKysrIGIv
YW1kZ3B1L2FtZGdwdS5oCkBAIC0xNjg1LDYgKzE2ODUsMjggQEAgaW50IGFtZGdwdV9jc19zeW5j
b2JqX2ltcG9ydF9zeW5jX2ZpbGUyKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKIAkJCQkJdWlu
dDMyX3Qgc3luY29iaiwKIAkJCQkJdWludDY0X3QgcG9pbnQsCiAJCQkJCWludCBzeW5jX2ZpbGVf
ZmQpOworCisvKioKKyAqICB0cmFuc2ZlciBiZXR3ZWVuIHN5bmNib2pzLgorICoKKyAqIFxwYXJh
bSAgIGRldgkJLSBcYyBbaW5dIGRldmljZSBoYW5kbGUKKyAqIFxwYXJhbSAgIGRzdF9oYW5kbGUJ
LSBcYyBbaW5dIHN5bmMgb2JqZWN0IGhhbmRsZQorICogXHBhcmFtICAgZHN0X3BvaW50CS0gXGMg
W2luXSB0aW1lbGluZSBwb2ludCwgMCBwcmVzZW50cyBkc3QgaXMgYmluYXJ5CisgKiBccGFyYW0g
ICBzcmNfaGFuZGxlCS0gXGMgW2luXSBzeW5jIG9iamVjdCBoYW5kbGUKKyAqIFxwYXJhbSAgIHNy
Y19wb2ludAktIFxjIFtpbl0gdGltZWxpbmUgcG9pbnQsIDAgcHJlc2VudHMgc3JjIGlzIGJpbmFy
eQorICogXHBhcmFtICAgZmxhZ3MJLSBcYyBbaW5dIGZsYWdzCisgKgorICogXHJldHVybiAgIDAg
b24gc3VjY2Vzc1xuCisgKiAgICAgICAgICA8MCAtIE5lZ2F0aXZlIFBPU0lYIEVycm9yIGNvZGUK
KyAqCisgKi8KK2ludCBhbWRncHVfY3Nfc3luY29ial90cmFuc2ZlcihhbWRncHVfZGV2aWNlX2hh
bmRsZSBkZXYsCisJCQkgICAgICAgdWludDMyX3QgZHN0X2hhbmRsZSwKKwkJCSAgICAgICB1aW50
NjRfdCBkc3RfcG9pbnQsCisJCQkgICAgICAgdWludDMyX3Qgc3JjX2hhbmRsZSwKKwkJCSAgICAg
ICB1aW50NjRfdCBzcmNfcG9pbnQsCisJCQkgICAgICAgdWludDMyX3QgZmxhZ3MpOworCiAvKioK
ICAqIEV4cG9ydCBhbiBhbWRncHUgZmVuY2UgYXMgYSBoYW5kbGUgKHN5bmNvYmogb3IgZmQpLgog
ICoKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVfY3MuYyBiL2FtZGdwdS9hbWRncHVfY3MuYwpp
bmRleCBkYWNhNDQyMS4uOTc3ZmEzY2YgMTAwNjQ0Ci0tLSBhL2FtZGdwdS9hbWRncHVfY3MuYwor
KysgYi9hbWRncHUvYW1kZ3B1X2NzLmMKQEAgLTgxNyw2ICs4MTcsMjIgQEAgb3V0OgogCXJldHVy
biByZXQ7CiB9CiAKK2RybV9wdWJsaWMgaW50IGFtZGdwdV9jc19zeW5jb2JqX3RyYW5zZmVyKGFt
ZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKKwkJCQkJICB1aW50MzJfdCBkc3RfaGFuZGxlLAorCQkJ
CQkgIHVpbnQ2NF90IGRzdF9wb2ludCwKKwkJCQkJICB1aW50MzJfdCBzcmNfaGFuZGxlLAorCQkJ
CQkgIHVpbnQ2NF90IHNyY19wb2ludCwKKwkJCQkJICB1aW50MzJfdCBmbGFncykKK3sKKwlpZiAo
TlVMTCA9PSBkZXYpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJuIGRybVN5bmNvYmpUcmFu
c2ZlcihkZXYtPmZkLAorCQkJCSAgZHN0X2hhbmRsZSwgZHN0X3BvaW50LAorCQkJCSAgc3JjX2hh
bmRsZSwgc3JjX3BvaW50LAorCQkJCSAgZmxhZ3MpOworfQorCiBkcm1fcHVibGljIGludCBhbWRn
cHVfY3Nfc3VibWl0X3JhdyhhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJCQkJICAgIGFtZGdw
dV9jb250ZXh0X2hhbmRsZSBjb250ZXh0LAogCQkJCSAgICBhbWRncHVfYm9fbGlzdF9oYW5kbGUg
Ym9fbGlzdF9oYW5kbGUsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
