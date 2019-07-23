Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CDE722FE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BEC6E3D6;
	Tue, 23 Jul 2019 23:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044786E3CB;
 Tue, 23 Jul 2019 23:29:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZOEcngTRolepkEWpL8Eyryp2nLF2i0MB5zuurBXh8E9Xudoqq1mWWfvDCV93aXvzmQTbgh9U33aKY2W+DctitAWp9+6FEiIpLfBFaq/jFnlhZI4poi5l1PgpcTU7qK1n0tPGStw6E8AxZ0uahZZF8r0k9hL4iD348wDpQ943X1GYYhLSyDLI3DIfJeCVTNS267N8e+7+y8tIWsq201EBmXoZNbKmFE8ibw+MnuJmgyUuV848BPsvQ1mwPfgvS8RzlzjIGjMh81F0Q43JPnlpAMgb1t4SLp1nwwVQRQWArtOjHlFQQ6m/8/tVwRmRxruq96lA8DqDq2nebqLTc/coA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veGTZHSEcz32Oijm948qLOetrW/g62ANCA/r08its64=;
 b=EVz8LDNlS7daxGnY9aBAUIx2qLGib6In02uzBa1wE/4eOvKlHIrxcYNPLF1sFw0aGdjN53Q7gsbxVXtZvOEFB3mQShOzp1QpkDGrOkuiJBVYjLNj/+iEGNJ4E9NV1fgDD5NrauN06hzCYkFzmhjDHPHAIXI3z/AVnd4UrXDkC5oQgUGSBDUPyH8Qzk5zF15Ix63rE+5SZKj55oa/HZe1IRe8hLYw6gJ3K0GyTV8tA+Kls/0JuyQnVwB3FWLTgR3y/Rpq0WR0XtXQvRO06LcZyIod5vUOi+Fr6XVtDVHL/0L4bOpe2aTWwp1jkAKWor7QuaoBr9mjH7P8B0/4bdFGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:910:16::29) by BN6PR1201MB2481.namprd12.prod.outlook.com
 (2603:10b6:404:a7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Tue, 23 Jul
 2019 23:29:03 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by CY4PR1201CA0019.outlook.office365.com
 (2603:10b6:910:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:02 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:02 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/9] MST AUX Devices (v3)
Date: Tue, 23 Jul 2019 19:27:59 -0400
Message-ID: <20190723232808.28128-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(5660300002)(36756003)(4326008)(6666004)(8676002)(50226002)(50466002)(305945005)(2906002)(8936002)(81166006)(186003)(316002)(68736007)(110136005)(486006)(2870700001)(14444005)(356004)(2876002)(426003)(126002)(26005)(23676004)(81156014)(47776003)(1076003)(2616005)(476003)(54906003)(49486002)(66574012)(336012)(478600001)(86362001)(70206006)(70586007)(53936002)(5820100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2481; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 631faf45-be9a-4633-514d-08d70fc58c06
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB2481; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2481:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2481DCF293DFC722590BB38E82C70@BN6PR1201MB2481.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RT7Ev9zmn4Bm6k9KOki0PJ7eCDbqPjH/zj87redhxsGndYsFK4rOYgwqGdwfAnsza3C0MU19ZSOZ+xKLD1gi++/vaHI0SYb/W7QeqfbGIUs4Fx4kd26Ab1sAEUv61hLnOVS/AEsGT7O84xK68BCENuSkHxhqB5Pb/5rdyldj8BLYeGqtVQcBIZqOWdcguB38EsrtIdqT+5TmFIKz3F7ooyO+mzYAzfIsYoRcf8MFbQdh8yloWdK9Lbikrs+zJcZn16ImGTWIWo3a/3s7KQs7nyOEkysnIjWP5qfi/IXTleZKY4+VWCb+84kAR94rKBisKNFtnuF22my6F2MSy/4P3IQ/h4ubFtgg8id/QOVYXnvddB6NeEDy3NpFvakl3FL7XPIbgIuEJpfxQynzuMK1PrToy1BrxMvBmDOJmDAFgLk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:02.5798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 631faf45-be9a-4633-514d-08d70fc58c06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2481
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veGTZHSEcz32Oijm948qLOetrW/g62ANCA/r08its64=;
 b=WV8LgSuJmbCEVaryfexZV4MStT6MEIzbIPCicOcqaBWvzMoL1Srl9vn20pPJfvGv3WuJ3jU57sO4NFxbYOuvdMPFT67cCIu6SLvQE5pZ149fq/Nde8IZFT8J7Wjwd+mhWAnT6nYSyGnUs1Ova+/aDZf3z+HWciq58Ta2h5AIuh8=
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
Cc: Leo Li <sunpeng.li@amd.com>, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpIZXJlJ3Mgd2hhdCBjaGFuZ2VkIGlu
IHYzOgoKKiBEcm9wcGVkIHBhdGNoIHRvIGV4cG9zZSB0aGUgbXN0LXBhdGggZGV2aWNlIGF0dHJp
YnV0ZSwgaW4gbGlldSBvZgogIG9uZ29pbmcgZGlzY3Vzc2lvbiBmb3IgZGVmaW5pbmcgYSBiZXR0
ZXIgY29ubmVjdG9yIHBhdGggcHJvcGVydHkKKiBDaGFuZ2UgV0FSTl9PTl9PTkNFIC0+IERSTV9F
UlJPUiBvbiBNU1QgZHBjZCByZWFkIGVycm9ycyB0byBhdm9pZAogIHRhaW50aW5nIHRoZSBrZXJu
ZWwKKiBVbndpbmQgaW50ZWxfY29ubmVjdG9yX3JlZ2lzdGVyKCkgb24KICBkcm1fZHBfbXN0X2Nv
bm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKCkgZmFpbHVyZS4KKiBEb2NzdHJpbmcgYW5kIGNvc21ldGlj
IGZpeGVzCgpMZW8gTGkgKDgpOgogIGRybS9kcDogVXNlIG5vbi1jeWNsaWMgaWRyCiAgZHJtL25v
dXZlYXU6IFVzZSBjb25uZWN0b3Iga2RldiBhcyBhdXggZGV2aWNlIHBhcmVudAogIGRybS9icmlk
Z2UvYW5hbG9naXgtYW54Nzh4eDogVXNlIGNvbm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFy
ZW50CiAgZHJtL2FtZC9kaXNwbGF5OiBVc2UgY29ubmVjdG9yIGtkZXYgYXMgYXV4IGRldmljZSBw
YXJlbnQKICBkcm0vaTkxNTogSW1wbGVtZW50IE1TVCBBdXggZGV2aWNlIHJlZ2lzdHJhdGlvbiAo
djIpCiAgZHJtL25vdXZlYXUva21zL252NTA6IEltcGxlbWVudCBNU1QgQXV4IGRldmljZSByZWdp
c3RyYXRpb24KICBkcm0vcmFkZW9uOiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0
aW9uCiAgZHJtL2FtZC9kaXNwbGF5OiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0
aW9uCgpWaWxsZSBTeXJqw6Rsw6QgKDEpOgogIGRybS9kcF9tc3Q6IEVuYWJsZSByZWdpc3RyYXRp
b24gb2YgQVVYIGRldmljZXMgZm9yIE1TVCBwb3J0cwoKIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmMgICB8ICAyNiArKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4LWFueDc4eHguYyAgICAgfCAgMjIgKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2F1eF9kZXYuYyAgICAgICAgICAgICAgfCAgMTggKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jICAgICAgICAgfCAxNDQgKysrKysrKysrKysrKysrKy0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICAgfCAgMzMgKysrLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICAgIHwgIDIwICsrKwogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyAgIHwgICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcF9tc3QuYyAgICAgICAgfCAgMjIgKysrCiBpbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAgIDQgKwogaW5jbHVkZS9k
cm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgIDExICsrCiAxMCBmaWxlcyBj
aGFuZ2VkLCAyNzIgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
