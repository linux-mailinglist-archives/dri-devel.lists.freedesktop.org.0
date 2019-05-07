Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3F162E2
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 13:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1DB6E7B1;
	Tue,  7 May 2019 11:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740078.outbound.protection.outlook.com [40.107.74.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FBC6E7AD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 11:34:21 +0000 (UTC)
Received: from CY4PR12CA0039.namprd12.prod.outlook.com (2603:10b6:903:129::25)
 by CY4PR12MB1142.namprd12.prod.outlook.com (2603:10b6:903:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Tue, 7 May
 2019 11:34:19 +0000
Received: from DM3NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0039.outlook.office365.com
 (2603:10b6:903:129::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 11:34:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT051.mail.protection.outlook.com (10.152.83.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 11:34:19 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 06:34:17 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 6/7] wrap transfer interfaces
Date: Tue, 7 May 2019 19:33:58 +0800
Message-ID: <20190507113359.16387-6-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507113359.16387-1-david1.zhou@amd.com>
References: <20190507113359.16387-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(2616005)(54906003)(47776003)(1076003)(316002)(6916009)(26005)(53416004)(50466002)(2351001)(48376002)(77096007)(486006)(476003)(126002)(36756003)(70206006)(305945005)(70586007)(11346002)(81156014)(426003)(5660300002)(8936002)(16586007)(86362001)(478600001)(336012)(53936002)(72206003)(446003)(50226002)(8676002)(76176011)(2906002)(51416003)(186003)(7696005)(356004)(6666004)(68736007)(4326008)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1142; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e23320a-5079-46b1-2ee6-08d6d2dff1be
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR12MB1142; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1142:
X-Microsoft-Antispam-PRVS: <CY4PR12MB114243B659C0E35DC7244495B4310@CY4PR12MB1142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +4JSFBS2s8J8/LHDpo2khaQVoX6l8Dcy4mP96PsOImrnZ6Xr97zh3tFtS8mu1813tP9RdFrIpEUYGEthtIsXe5cWIA/Kuthsolt4zu4mJ0/fhfYRK7x66db1epgkO8D/MgXsSX/sCabxqQdWNGRGMbe9iXz2/cCxhQ9OVC4BOfJCqplANRD5rhfJIP0VM69HeSY56x6q7LSrZdLI3l49iRqwo5/5Rvwdq5l+3uaLLzT4oWtdpn7ULgtXuG+QKJA3O91eiwjm+kLfdxT1jkqVM5aSO9EKwcZLGken2810mWBDBOxDwu/ZVvuM4RgKR+v5eEJCV6pLVyP69BCRomSBJi5yWwoY4eWEBbtoIPoYsCVR/GQsebXbQNi5eGpWwhRi/uC/df55VSvHCCcoVTr5uyY9QI4nk6qBMfFRJ3FwHdI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 11:34:19.2935 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e23320a-5079-46b1-2ee6-08d6d2dff1be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMzc/yDIhFGzpxygir/Hw9Hy1VAH1isKOqICaXuG4pI=;
 b=Lcj9kVBXfWpyp9zGqqAXZyi3qxJkN3EY4gmuFvCuiFQPRaYAPdxkVCA4FxnehURcq4V9gCF7DVFEzpdFj+h1B1PCe035B6RAXxu2a9Obj2BzsLTGmz6isEqbvcDj9D9cpvoe/W9dAWgRoSlyz++ddogZPvPDdB0zU6h9XQkXpRU=
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

U2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KLS0tCiBh
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
