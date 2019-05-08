Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE781860C
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B1789B06;
	Thu,  9 May 2019 07:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800083.outbound.protection.outlook.com [40.107.80.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770F897C5;
 Wed,  8 May 2019 11:30:08 +0000 (UTC)
Received: from CY4PR03CA0091.namprd03.prod.outlook.com (2603:10b6:910:4d::32)
 by BLUPR03MB550.namprd03.prod.outlook.com (2a01:111:e400:880::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Wed, 8 May
 2019 11:30:03 +0000
Received: from BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::204) by CY4PR03CA0091.outlook.office365.com
 (2603:10b6:910:4d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Wed, 8 May 2019 11:30:03 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT017.mail.protection.outlook.com (10.152.77.174) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:02 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BU1rk023711
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:01 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:01 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, 
 <linux-pm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-omap@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <devel@driverdev.osuosl.org>, <linux-usb@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <cgroups@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-security-module@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 08/16] cpufreq/intel_pstate: remove NULL entry + use
 match_string()
Date: Wed, 8 May 2019 14:28:34 +0300
Message-ID: <20190508112842.11654-10-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(376002)(396003)(136003)(39860400002)(346002)(2980300002)(199004)(189003)(8676002)(77096007)(47776003)(50466002)(50226002)(26005)(478600001)(336012)(51416003)(186003)(2616005)(1076003)(2201001)(7696005)(246002)(426003)(86362001)(110136005)(106002)(305945005)(126002)(16586007)(446003)(2441003)(316002)(11346002)(54906003)(476003)(486006)(36756003)(107886003)(76176011)(53416004)(8936002)(5660300002)(4326008)(7416002)(356004)(6666004)(7636002)(44832011)(2906002)(48376002)(70586007)(70206006)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB550; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86204a62-8a3c-4b5a-9dba-08d6d3a8834f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:BLUPR03MB550; 
X-MS-TrafficTypeDiagnostic: BLUPR03MB550:
X-Microsoft-Antispam-PRVS: <BLUPR03MB550ACAC1A7934C08542BCC1F9320@BLUPR03MB550.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rxv/XoCD6aaHG0TrRZkKWXDRcX000pKd7bfq3vJ62ePHcuWPHuGNJPBOqwgOijZqx3E8HU+x999IZl+ba88JfR0vYIb7Obj0j1eZUKusZuk8BQ/3y6BrYo03I2LI4DxBWK7qu2MZ9Itfu0i5LUpmIJtONUQwaJE75922TD4j9KqTqEJtt7Oe/4c20rd7gXAxLMfmFvG64Cz4/6AKOCc11G5CrFVaAO+gYxZukEzvn6JfBa8EqYvBAsn6lRm+PFLP0hqCZn/uR2nN9VOclRHqQPxm+Va0rH6apLh63EtDW7LtpBEfmUsSBBtIhzfYTLNJ1UfI6Mz02xdbaV19/8eub1YBOgpTClnEpYZAmVHWy3iJ9vzMVWpkffbsdAGUPXMahcgSR5z55fgI7Obs6j3WIQGQdzC6GP62894A4z71zMk=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:02.9332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86204a62-8a3c-4b5a-9dba-08d6d3a8834f
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB550
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TppapvdTdEWShhGPGCPSH9uz8QgU5Op8E8ytcSMFOwg=;
 b=OQVIVgK5JxJMqIfsuBpJyNhsOscNjrf8QoWcS71HKHv5ECSFl4t6qL8cjbEvHO9onyxqCP7Eiq7Wxh8YLQX/ufSvCV0VABMsC9ZaqNqGS8uuuvsMFWUm0Wa0qvupkiH+emRfafnbKdPIl4OkQQXlSvhfm9OK1pHqR4K81+Fv0Z8=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=analog.com;
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
Cc: gregkh@linuxfoundation.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNoYW5nZSBpcyBtb3N0bHkgY29zbWV0aWMuCgpUaGUgYGVuZXJneV9wZXJmX3N0cmluZ3Ng
IGFycmF5IGlzIHN0YXRpYywgc28gbWF0Y2hfc3RyaW5nKCkgY2FuIGJlIHVzZWQKKHdoaWNoIHdp
bGwgaW1wbGljaXRseSBkbyBhIEFSUkFZX1NJWkUoZW5lcmd5X3BlcmZfc3RyaW5ncykpLgoKVGhl
IG9ubHkgc21hbGwgYmVuZWZpdCBoZXJlLCBpcyB0aGUgcmVkdWN0aW9uIG9mIHRoZSBhcnJheSBz
aXplIGJ5IDEKZWxlbWVudC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxl
eGFuZHJ1LmFyZGVsZWFuQGFuYWxvZy5jb20+Ci0tLQogZHJpdmVycy9jcHVmcmVxL2ludGVsX3Bz
dGF0ZS5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL2ludGVsX3BzdGF0ZS5j
IGIvZHJpdmVycy9jcHVmcmVxL2ludGVsX3BzdGF0ZS5jCmluZGV4IDZlZDFlNzA1YmMwNS4uYWI5
YTBiMzRiOTAwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NwdWZyZXEvaW50ZWxfcHN0YXRlLmMKKysr
IGIvZHJpdmVycy9jcHVmcmVxL2ludGVsX3BzdGF0ZS5jCkBAIC01OTMsOCArNTkzLDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBlbmVyZ3lfcGVyZl9zdHJpbmdzW10gPSB7CiAJInBlcmZv
cm1hbmNlIiwKIAkiYmFsYW5jZV9wZXJmb3JtYW5jZSIsCiAJImJhbGFuY2VfcG93ZXIiLAotCSJw
b3dlciIsCi0JTlVMTAorCSJwb3dlciIKIH07CiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IGVw
cF92YWx1ZXNbXSA9IHsKIAlIV1BfRVBQX1BFUkZPUk1BTkNFLApAQCAtNjgwLDggKzY3OSw4IEBA
IHN0YXRpYyBzc2l6ZV90IHNob3dfZW5lcmd5X3BlcmZvcm1hbmNlX2F2YWlsYWJsZV9wcmVmZXJl
bmNlcygKIAlpbnQgaSA9IDA7CiAJaW50IHJldCA9IDA7CiAKLQl3aGlsZSAoZW5lcmd5X3BlcmZf
c3RyaW5nc1tpXSAhPSBOVUxMKQotCQlyZXQgKz0gc3ByaW50ZigmYnVmW3JldF0sICIlcyAiLCBl
bmVyZ3lfcGVyZl9zdHJpbmdzW2krK10pOworCWZvciAoOyBpIDwgQVJSQVlfU0laRShlbmVyZ3lf
cGVyZl9zdHJpbmdzKTsgaSsrKQorCQlyZXQgKz0gc3ByaW50ZigmYnVmW3JldF0sICIlcyAiLCBl
bmVyZ3lfcGVyZl9zdHJpbmdzW2ldKTsKIAogCXJldCArPSBzcHJpbnRmKCZidWZbcmV0XSwgIlxu
Iik7CiAKQEAgLTcwMSw3ICs3MDAsNyBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9lbmVyZ3lfcGVy
Zm9ybWFuY2VfcHJlZmVyZW5jZSgKIAlpZiAocmV0ICE9IDEpCiAJCXJldHVybiAtRUlOVkFMOwog
Ci0JcmV0ID0gX19tYXRjaF9zdHJpbmcoZW5lcmd5X3BlcmZfc3RyaW5ncywgLTEsIHN0cl9wcmVm
ZXJlbmNlKTsKKwlyZXQgPSBtYXRjaF9zdHJpbmcoZW5lcmd5X3BlcmZfc3RyaW5ncywgc3RyX3By
ZWZlcmVuY2UpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
