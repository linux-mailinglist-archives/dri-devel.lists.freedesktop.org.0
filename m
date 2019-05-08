Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED018604
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C679189B70;
	Thu,  9 May 2019 07:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1347F897CD;
 Wed,  8 May 2019 11:30:17 +0000 (UTC)
Received: from DM6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:5:40::14) by
 SN2PR03MB2272.namprd03.prod.outlook.com (2603:10b6:804:d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 8 May 2019 11:30:13 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by DM6PR03CA0001.outlook.office365.com
 (2603:10b6:5:40::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Wed, 8 May 2019 11:30:13 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:12 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BUBS3023758
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:11 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:11 -0400
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
Subject: [PATCH 10/16] pinctrl: armada-37xx: use new match_string()
 helper/macro
Date: Wed, 8 May 2019 14:28:36 +0300
Message-ID: <20190508112842.11654-12-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(189003)(199004)(50466002)(126002)(70586007)(476003)(246002)(106002)(2441003)(36756003)(478600001)(5660300002)(2906002)(70206006)(356004)(6666004)(44832011)(305945005)(53416004)(16586007)(446003)(11346002)(7636002)(316002)(2616005)(1076003)(486006)(51416003)(426003)(8936002)(7696005)(50226002)(336012)(2201001)(48376002)(107886003)(8676002)(86362001)(26005)(7416002)(4326008)(54906003)(110136005)(76176011)(186003)(47776003)(77096007)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR03MB2272; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54ae17f8-e934-4104-71ba-08d6d3a88946
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:SN2PR03MB2272; 
X-MS-TrafficTypeDiagnostic: SN2PR03MB2272:
X-Microsoft-Antispam-PRVS: <SN2PR03MB2272F1E636EAB1142DBF6EF8F9320@SN2PR03MB2272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xfAt8yPIASeIU4SWpAqv7wYVf6rgReoRasBfXu5VkYF5De6r3ChaB98QtwmzFohT7XLUcZv/paBIBGQNzEFCX/rtqn6SNp5cB2YDe1+lv35blIEB09SYcVLlHsYG9cnjNobxye4mP+4dqP11iC3pADRTivOXvbA+Tp0kI3oa4q5J5BL/KnwnnV9B5YLYrUzgEVd4bfoVd7faUQkPXj/dE3Vaf7ISG1AGagwFjfSKKsCgRru7kvI+k/bvrGow8wB5BEPLRNA7GLImCROlk0ZyBozdsEtLuar+oZzScBl6Q+M52D0eHyDc06BKyfl3wepAHxzTYDdZ5odpexJoia97/Y2agzfCyaYjbE1Nby4ArE3NQ7GcIz5zZeXT3zQbIOkDzZYrDXqhS0aaP4Yn31I6ed817wNoRQ0uge0Z2pdkt6I=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:12.0247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ae17f8-e934-4104-71ba-08d6d3a88946
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2272
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1chwJ3hc4UTJ3blAlYUngE824WdNkP//hIXWmk1Ja8A=;
 b=DrUwW+HfBrwsEl2in+cz4S+PdeJEOhXU7fVfQQf7K1/7Bu4CQyX95NdYXd/oxxKLzmfA94Sp9RgysVQgxHHyK+aXVQgutw8CgBlEx5J1hG33ICxZPO0+0bHw7kb6PXGJmCSPuSxrDr+dHRaQH2ilSb5oPUIKVnknHgETTrV7qvg=
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

VGhlIGNoYW5nZSBpcyBtb3N0bHkgY29zbWV0aWMuCgpUaGUgYGFybWFkYV8zN3h4X3Bpbl9ncm91
cGAgc3RydWN0IGlzIGRlZmluZWQgYXMuCnN0cnVjdCBhcm1hZGFfMzd4eF9waW5fZ3JvdXAgewog
ICAgICAgIGNvbnN0IGNoYXIgICAgICAqbmFtZTsKICAgICAgICB1bnNpZ25lZCBpbnQgICAgc3Rh
cnRfcGluOwogICAgICAgIHVuc2lnbmVkIGludCAgICBucGluczsKICAgICAgICB1MzIgICAgICAg
ICAgICAgcmVnX21hc2s7CiAgICAgICAgdTMyICAgICAgICAgICAgIHZhbFtOQl9GVU5DU107CiAg
ICAgICAgdW5zaWduZWQgaW50ICAgIGV4dHJhX3BpbjsKICAgICAgICB1bnNpZ25lZCBpbnQgICAg
ZXh0cmFfbnBpbnM7CiAgICAgICAgY29uc3QgY2hhciAgICAgICpmdW5jc1tOQl9GVU5DU107CiAg
ICAgICAgdW5zaWduZWQgaW50ICAgICpwaW5zOwp9OwoKVGhlIGBmdW5jc2AgZmllbGQgaXMgYSBz
dGF0aWMgYXJyYXkgb2Ygc3RyaW5ncywgc28gdXNpbmcgdGhlCm5ldyBgbWF0Y2hfc3RyaW5nKClg
IGhlbHBlciAod2hpY2ggZG9lcyBhbiBpbXBsaWNpdCBBUlJBWV9TSVpFKGdwLT5mdW5jcykpCnNo
b3VsZCBiZSBmaW5lLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFyZGVsZWFuIDxhbGV4YW5k
cnUuYXJkZWxlYW5AYW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJzL3BpbmN0cmwvbXZlYnUvcGluY3Ry
bC1hcm1hZGEtMzd4eC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tdmVidS9waW5j
dHJsLWFybWFkYS0zN3h4LmMgYi9kcml2ZXJzL3BpbmN0cmwvbXZlYnUvcGluY3RybC1hcm1hZGEt
Mzd4eC5jCmluZGV4IDA3YTViY2FhMDA2Ny4uNjhiMGRiNWVmNWU5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL3BpbmN0cmwvbXZlYnUvcGluY3RybC1hcm1hZGEtMzd4eC5jCisrKyBiL2RyaXZlcnMvcGlu
Y3RybC9tdmVidS9waW5jdHJsLWFybWFkYS0zN3h4LmMKQEAgLTM0OCw3ICszNDgsNyBAQCBzdGF0
aWMgaW50IGFybWFkYV8zN3h4X3BteF9zZXRfYnlfbmFtZShzdHJ1Y3QgcGluY3RybF9kZXYgKnBj
dGxkZXYsCiAJZGV2X2RiZyhpbmZvLT5kZXYsICJlbmFibGUgZnVuY3Rpb24gJXMgZ3JvdXAgJXNc
biIsCiAJCW5hbWUsIGdycC0+bmFtZSk7CiAKLQlmdW5jID0gX19tYXRjaF9zdHJpbmcoZ3JwLT5m
dW5jcywgTkJfRlVOQ1MsIG5hbWUpOworCWZ1bmMgPSBtYXRjaF9zdHJpbmcoZ3JwLT5mdW5jcywg
bmFtZSk7CiAJaWYgKGZ1bmMgPCAwKQogCQlyZXR1cm4gLUVOT1RTVVBQOwogCkBAIC05MzgsNyAr
OTM4LDcgQEAgc3RhdGljIGludCBhcm1hZGFfMzd4eF9maWxsX2Z1bmMoc3RydWN0IGFybWFkYV8z
N3h4X3BpbmN0cmwgKmluZm8pCiAJCQlzdHJ1Y3QgYXJtYWRhXzM3eHhfcGluX2dyb3VwICpncCA9
ICZpbmZvLT5ncm91cHNbZ107CiAJCQlpbnQgZjsKIAotCQkJZiA9IF9fbWF0Y2hfc3RyaW5nKGdw
LT5mdW5jcywgTkJfRlVOQ1MsIG5hbWUpOworCQkJZiA9IG1hdGNoX3N0cmluZyhncC0+ZnVuY3Ms
IG5hbWUpOwogCQkJaWYgKGYgPCAwKQogCQkJCWNvbnRpbnVlOwogCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
