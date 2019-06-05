Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB893621D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B40892CD;
	Wed,  5 Jun 2019 17:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CE08922E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 17:11:54 +0000 (UTC)
Received: from DM6PR12CA0023.namprd12.prod.outlook.com (2603:10b6:5:1c0::36)
 by BN7PR12MB2658.namprd12.prod.outlook.com (2603:10b6:408:29::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Wed, 5 Jun
 2019 17:11:52 +0000
Received: from BY2NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM6PR12CA0023.outlook.office365.com
 (2603:10b6:5:1c0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.22 via Frontend
 Transport; Wed, 5 Jun 2019 17:11:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT017.mail.protection.outlook.com (10.152.84.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Wed, 5 Jun 2019 17:11:51 +0000
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 5 Jun 2019
 12:11:51 -0500
From: Dingchen Zhang <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm: Set crc->opened = false before setting crc source to
 NULL.
Date: Wed, 5 Jun 2019 13:06:39 -0400
Message-ID: <20190605170639.8368-2-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605170639.8368-1-dingchen.zhang@amd.com>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(2906002)(1076003)(77096007)(4744005)(426003)(336012)(11346002)(44832011)(486006)(186003)(356004)(6666004)(2351001)(51416003)(7696005)(26005)(70206006)(16586007)(4326008)(36756003)(70586007)(68736007)(53936002)(6916009)(446003)(126002)(305945005)(47776003)(316002)(476003)(14444005)(2616005)(50466002)(53416004)(86362001)(48376002)(81166006)(81156014)(8676002)(8936002)(478600001)(50226002)(76176011)(5660300002)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2658; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27fd16c1-2d9b-41cc-76f6-08d6e9d8e73d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2658; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2658:
X-Microsoft-Antispam-PRVS: <BN7PR12MB265893C1F60A7368B8DB3E0B8D160@BN7PR12MB2658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b7g5q+oMksbE3yOHuq5dquoXOrNTMbUU0SPKc6VO8yXydMHyDzeN2qAyAZU43lnjaQIWdJbo/bq1XSCrZNMW2M3V76LemX6Sa0MClfvQQAE3nmSmxBeeVeR/RBR3LibrocYG4021T5OdSc81gVD6aOIemyYjh4dSAnddgr5BuOE90LWu6fTHdKtEjnOnlBxNuSGPGpWluhdnENs8v7BPBVnYg/o25MeVc2Hk4pRxjF8ty+sXLSj5tr5AfuYJbn1VXNjTsG2BmU3jJe2l2OnpwrlLlQhBDT0xXeGwKjguljKUIoCSes5uHjOz03mC4FKTi0YWtIPbC/QeN4cAYZI7aQ5u67AG30PTaLkSnUKf17K1xYjEFe+OO2ujQK3yOvFNsCr74lp0cetP+Txy634Yxh6yfgH86wjpWs7NRWQ9hps=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 17:11:51.9765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fd16c1-2d9b-41cc-76f6-08d6e9d8e73d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2658
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ank6LjURYOTzj/L52ts4tx5sEgwzEI2x29HXro7EiNM=;
 b=IaBRMdLhp+BSr9jtTX0svyI3Ke1Kuj9FZBD16NG3mr8l5aUFEjzZbSmeN1cFjr1U4oWdU3LGAV9hMng6rrWLYXGF3y8E8DWFKTRxHvvq/dOJg98iPyYrwPqpkR2l95cFpRy74hEP+lX2luO6Mnk1djb0V+CudImthM4iGfYa7v0=
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
Cc: Dingchen Zhang <dingchen.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dG8gdGVybWluYXRlIHRoZSB3aGlsZS1sb29wIGluIGRybV9kcF9hdXhfY3JjX3dvcmsgd2hlbiBk
cm1fZHBfc3RhcnQvc3RvcF9jcmMKYXJlIGNhbGxlZCBpbiB0aGUgaG9vayB0byBzZXQgY3JjIHNv
dXJjZS4KCkNjOkxlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPiwgSGFycnkgPEhhcnJ5LldlbnRs
YW5kQGFtZC5jb20+LCBOaWNrIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IERpbmdjaGVuIFpoYW5nIDxkaW5nY2hlbi56aGFuZ0BhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
c19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwppbmRleCBlMjBhZGVm
OWQ2MjMuLjBlOGJjYzEzMDM4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1
Z2ZzX2NyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwpAQCAtMjQ5
LDYgKzI0OSwxMyBAQCBzdGF0aWMgaW50IGNydGNfY3JjX3JlbGVhc2Uoc3RydWN0IGlub2RlICpp
bm9kZSwgc3RydWN0IGZpbGUgKmZpbGVwKQogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGZpbGVw
LT5mX2lub2RlLT5pX3ByaXZhdGU7CiAJc3RydWN0IGRybV9jcnRjX2NyYyAqY3JjID0gJmNydGMt
PmNyYzsKIAorCS8qIHRlcm1pbmF0ZSB0aGUgaW5maW5pdGUgd2hpbGUgbG9vcCBpZiAnZHJtX2Rw
X2F1eF9jcmNfd29yaycgcnVubmluZyAqLworCWlmIChjcmMtPm9wZW5lZCkgeworCQlzcGluX2xv
Y2tfaXJxKCZjcmMtPmxvY2spOworCQljcmMtPm9wZW5lZCA9IGZhbHNlOworCQlzcGluX3VubG9j
a19pcnEoJmNyYy0+bG9jayk7CisJfQorCiAJY3J0Yy0+ZnVuY3MtPnNldF9jcmNfc291cmNlKGNy
dGMsIE5VTEwpOwogCiAJc3Bpbl9sb2NrX2lycSgmY3JjLT5sb2NrKTsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
