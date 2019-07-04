Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFE5FD3D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F420A6E3BB;
	Thu,  4 Jul 2019 19:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710082.outbound.protection.outlook.com [40.107.71.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B486E3BF;
 Thu,  4 Jul 2019 19:06:27 +0000 (UTC)
Received: from BN8PR12CA0034.namprd12.prod.outlook.com (20.178.208.47) by
 MWHPR12MB1853.namprd12.prod.outlook.com (10.175.55.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Thu, 4 Jul 2019 19:06:24 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN8PR12CA0034.outlook.office365.com
 (2603:10b6:408:60::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:24 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:21 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/10] drm/sysfs: Add mstpath attribute to connector devices
Date: Thu, 4 Jul 2019 15:05:12 -0400
Message-ID: <20190704190519.29525-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(426003)(86362001)(336012)(51416003)(2870700001)(81166006)(72206003)(81156014)(2906002)(53936002)(50466002)(486006)(49486002)(356004)(5660300002)(77096007)(2616005)(476003)(47776003)(2876002)(54906003)(110136005)(11346002)(6666004)(126002)(446003)(316002)(76176011)(305945005)(48376002)(4326008)(14444005)(26005)(1076003)(68736007)(70586007)(70206006)(478600001)(186003)(50226002)(36756003)(8676002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1853; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc20d7b8-f4ca-4eb6-d8cd-08d700b2b553
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1853; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1853:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1853757709206FA7D1FF65B582FA0@MWHPR12MB1853.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NtA94wCP+Wy/Y4xDCVJRST0bs6MUx9P1WCksDqjlosRRSBdy+sMLARUnItaPWHGDMk1DZB7AZgvdzaUTekS9S9LpwOurZH5ybw44hF4UMza8yuE2FMnfbtGRZVua0dnlTotTROXl6vjuaps7YWTgXzNbm9bhPttLMdhExWWgQF+4vsZQX8+Sk+gnxyN84CfSHn3jcokeaV2ZfWDfnGXnOrDNjgd9mt/ToIiWE/MpuihKZi7N76i1y90gisr/jlmfE/TLbPjkIhhXx/uuRiztOv7pgUn3Gt5uXkZDs0qY78SZ4IvbQBX1G23QACvdzhuh07lwBZs0AvjzuUdphVQzKHAXbKl5HjdBrBSss/jSwEzNmcD6Yd/LXVchO0YpxLdGe4JCDoWKxDPMgeyUljMOccS3WYMI6gMThxRRTykcCpk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:24.0049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc20d7b8-f4ca-4eb6-d8cd-08d700b2b553
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+3gst5YjhqJe3AaE/ls5vzkvJ8xbYHZVWH9mcDD4os=;
 b=P3jWJwtPI7mpC3wrvBOGapSD85WX6g9zUGAS0E9+W5rKKCULU/sLvSHLtYFuIEbuA0WJjBqXcGXoaW29T3+razRPqdL76mxeGGyrouEfUsFzXJNvtBZGYM40iCaYYU5sD7t1l91QLl2kH5stE0H/sK8Pn8MRayur/qAwM9KdlMk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpUaGlzIGNhbiBiZSB1c2VkIHRvIGNy
ZWF0ZSBtb3JlIGRlc2NyaXB0aXZlIHN5bWxpbmtzIGZvciBNU1QgYXV4CmRldmljZXMuIENvbnNp
ZGVyIHRoZSBmb2xsb3dpbmcgdWRldiBydWxlOgoKU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYi
LCBTVUJTWVNURU1TPT0iZHJtIiwgQVRUUlN7bXN0cGF0aH09PSI/KiIsCglTWU1MSU5LKz0iZHJt
X2RwX2F1eC9ieS1wYXRoLyRhdHRye21zdHBhdGh9IgoKVGhlIGZvbGxvd2luZyBzeW1saW5rcyB3
aWxsIGJlIGNyZWF0ZWQgKGRlcGVuZGluZyBvbiB5b3VyIE1TVCB0b3BvbG9neSk6CgokIGxzIC9k
ZXYvZHJtX2RwX2F1eC9ieS1wYXRoLwpjYXJkMC1tc3Q6MC0xICBjYXJkMC1tc3Q6MC0xLTEgIGNh
cmQwLW1zdDowLTEtOCAgY2FyZDAtbXN0OjAtOAoKU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9zeXNmcy5jCmluZGV4IGFkMTA4MTBiYzk3Mi4uNTNmZDFmNzFlOTAwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9z
eXNmcy5jCkBAIC0yMzYsMTYgKzIzNiwzOSBAQCBzdGF0aWMgc3NpemVfdCBtb2Rlc19zaG93KHN0
cnVjdCBkZXZpY2UgKmRldmljZSwKIAlyZXR1cm4gd3JpdHRlbjsKIH0KIAorc3RhdGljIHNzaXpl
X3QgbXN0cGF0aF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldmljZSwKKwkJCSAgICBzdHJ1Y3QgZGV2
aWNlX2F0dHJpYnV0ZSAqYXR0ciwKKwkJCSAgICBjaGFyICpidWYpCit7CisJc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciA9IHRvX2RybV9jb25uZWN0b3IoZGV2aWNlKTsKKwlzc2l6ZV90
IHJldCA9IDA7CisJY2hhciAqcGF0aDsKKworCW11dGV4X2xvY2soJmNvbm5lY3Rvci0+ZGV2LT5t
b2RlX2NvbmZpZy5tdXRleCk7CisJaWYgKCFjb25uZWN0b3ItPnBhdGhfYmxvYl9wdHIpCisJCWdv
dG8gdW5sb2NrOworCisJcGF0aCA9IGNvbm5lY3Rvci0+cGF0aF9ibG9iX3B0ci0+ZGF0YTsKKwly
ZXQgPSBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgImNhcmQlZC0lc1xuIiwKKwkJICAgICAgIGNv
bm5lY3Rvci0+ZGV2LT5wcmltYXJ5LT5pbmRleCwgcGF0aCk7CisKK3VubG9jazoKKwltdXRleF91
bmxvY2soJmNvbm5lY3Rvci0+ZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7CisJcmV0dXJuIHJldDsK
K30KKwogc3RhdGljIERFVklDRV9BVFRSX1JXKHN0YXR1cyk7CiBzdGF0aWMgREVWSUNFX0FUVFJf
Uk8oZW5hYmxlZCk7CiBzdGF0aWMgREVWSUNFX0FUVFJfUk8oZHBtcyk7CiBzdGF0aWMgREVWSUNF
X0FUVFJfUk8obW9kZXMpOworc3RhdGljIERFVklDRV9BVFRSX1JPKG1zdHBhdGgpOwogCiBzdGF0
aWMgc3RydWN0IGF0dHJpYnV0ZSAqY29ubmVjdG9yX2Rldl9hdHRyc1tdID0gewogCSZkZXZfYXR0
cl9zdGF0dXMuYXR0ciwKIAkmZGV2X2F0dHJfZW5hYmxlZC5hdHRyLAogCSZkZXZfYXR0cl9kcG1z
LmF0dHIsCiAJJmRldl9hdHRyX21vZGVzLmF0dHIsCisJJmRldl9hdHRyX21zdHBhdGguYXR0ciwK
IAlOVUxMCiB9OwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
