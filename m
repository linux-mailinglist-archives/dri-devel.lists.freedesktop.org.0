Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2524820B2A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EAD897DC;
	Thu, 16 May 2019 15:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790073.outbound.protection.outlook.com [40.107.79.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9A989781;
 Thu, 16 May 2019 15:27:01 +0000 (UTC)
Received: from SN1PR12CA0079.namprd12.prod.outlook.com (2603:10b6:802:21::14)
 by SN6SPR01MB0031.namprd12.prod.outlook.com (2603:10b6:805:78::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16; Thu, 16 May
 2019 15:26:59 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0079.outlook.office365.com
 (2603:10b6:802:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 15:26:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 15:26:59 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 10:26:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/nouveau: Use connector kdev as aux device parent
Date: Thu, 16 May 2019 11:18:03 -0400
Message-ID: <1558019883-12397-8-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(136003)(2980300002)(428003)(199004)(189003)(86152003)(86362001)(47776003)(14444005)(6666004)(316002)(16586007)(2906002)(2876002)(305945005)(76176011)(356004)(68736007)(336012)(426003)(186003)(26005)(53936002)(54906003)(51416003)(77096007)(11346002)(446003)(486006)(126002)(476003)(2616005)(70586007)(7696005)(81166006)(8676002)(81156014)(50226002)(8936002)(70206006)(110136005)(50466002)(53416004)(36756003)(72206003)(478600001)(4326008)(5660300002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6SPR01MB0031; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c02361c-0b40-40c4-09f7-08d6da12f048
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN6SPR01MB0031; 
X-MS-TrafficTypeDiagnostic: SN6SPR01MB0031:
X-Microsoft-Antispam-PRVS: <SN6SPR01MB0031D18D58000900A7AC707F820A0@SN6SPR01MB0031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LsIRz3z4c9vqUyMHuiUFtVEMysCAyL4T/yloKIb4aMPMgqBBOEhd2P6Qeq+1rmhuxTxFvI97vJ2yOxsaHcZdcKEMphLfdT8qXkQXWrDFrTMTi+ZMoSA7/UyNZSo13uUswyIZpjHHz0hS7OsYE2S5xFWv5MUxWybYiaes8lK5rKEACsHH19GjRuMhTv+ElaBPlhjpB1hLEg5YQlV1XmM1uKkWEw5lIIavFASPIgZAwK/N8R0uBSn7evfpY/EvgSuFytIuswryThXk9FkhQox67ErgC4iklKmEf7WrnNx5MHdk5H9tgbn+OiZ2SK97TjM9W87m0RikLxfRBFwl5hWi29+SRFa0zMKxW1aDsdspaYv3K/rpWZ+U43tNzgozaCuHhVkBGOJN36d8TQElXIJ6xZMEOBlpGjBc9/5P02LR5IE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 15:26:59.3562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c02361c-0b40-40c4-09f7-08d6da12f048
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6SPR01MB0031
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYz6ywD0mRc2HFLTNUZB3qFvZZRg0n2VDSmWEiuxgCU=;
 b=JIsJtPsPDWflz01KfMieeJLVXpHawu/aCNvRGrBXp6uVLaK1MBaCPCeT1exxUrVJSUSHK2y6eB8nCaa08zodGAKp9e4Bw+Owk+hFXBjcq63TmUr0BAJm8zxTLyojIQryGVSF+6LH3gTimIlSmca/lhkNJn8+Xgmsz6GKHaxbU7s=
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
Cc: Leo Li <sunpeng.li@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYt
Ynk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9j
b25uZWN0b3IuYwppbmRleCAzZjQ2M2M5Li43Mzg3ODJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKQEAgLTEzNDUsNyArMTM0NSw3IEBAIG5vdXZlYXVf
Y29ubmVjdG9yX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlicmVhazsKIAljYXNl
IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydDoKIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RP
Ul9lRFA6Ci0JCW52X2Nvbm5lY3Rvci0+YXV4LmRldiA9IGRldi0+ZGV2OworCQludl9jb25uZWN0
b3ItPmF1eC5kZXYgPSBjb25uZWN0b3ItPmtkZXY7CiAJCW52X2Nvbm5lY3Rvci0+YXV4LnRyYW5z
ZmVyID0gbm91dmVhdV9jb25uZWN0b3JfYXV4X3hmZXI7CiAJCXNucHJpbnRmKGF1eF9uYW1lLCBz
aXplb2YoYXV4X25hbWUpLCAic29yLSUwNHgtJTA0eCIsCiAJCQkgZGNiZS0+aGFzaHQsIGRjYmUt
Pmhhc2htKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
