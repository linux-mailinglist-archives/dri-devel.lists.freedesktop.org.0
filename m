Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B871C7FE8
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 04:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CE16E904;
	Thu,  7 May 2020 02:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2F76E902;
 Thu,  7 May 2020 02:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg7TnFkzchdS+SI4HVD5kK6ESPg8oEhxQgChkDUgY1MEU6A4cvEKcRJkQjb2xcLXe8opqRu2QyQGhziQFDCsKlMbgpZ1YQ5xKU1BgwsESeZ9MuYdrMgmo7GBxjiNwoSs6Qqabpa3rv8UOecouh47qG7dxUKNxS9mIhdzUmTEXeKIJ+TThU6HVnQuCI58tYNhYQoyik7kPB0+RuGVCg68Ra22r1MO/FgSk5kTS+mWC86jQ4L92j7Q76ix0wA+Xrz16guzBwVrEsRvS/8wP3fO0zF4ZJazpM1jbcFfxSsS/7POnQtMUMs0ZK2HvHAyfUBb3ssVVCuCtKe++VkkGhK91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUmtgQIdLl7VXSipT2HMaP9PQYUv5mjAoaJ+dJ0XIm4=;
 b=hnhBCxLawxDcrjFC5qT/zes2duAH4nIZuIm5+NglVUGnAuGktvVPr3NfRkRCfuEmNIo807Pu2QFHTf+773ULTGkDlLlBIEGPFvWmVDmC9W61/Wcmm6SOw5U1qLIFYzkTWARs13/F9CPvpIu4Bb4CljTaZW17n2UXzb3RujhImSOpbW01Sy4QkhZwY2xBdYL/YwPfrN2J7+G9PIo89Jv/RFXo1ynMYQQjxcr9/Q4bOmO1cF5yj53BdMz5Zq+IB1IYmv+gop+bWn3MqXoaHWFPIK+c3GmoNdfrFqzXjkAHaQ/2ehrDZGOARk/6QpnDiLRO9S7qBIGU/tHPMs7/LAc6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUmtgQIdLl7VXSipT2HMaP9PQYUv5mjAoaJ+dJ0XIm4=;
 b=O+9QUblGdyoeHMoktPcy1wMCPd6QwQg/nX0xYcrN/zrhr8iJcF7x36h4mR9dH8PEkVSg20VXUjzQfsx9Iecn2QJ3hmUQ0g1uwWFkWDtZ+VpzdpmQOqBeBteSMS7vLWaC6sqDGOVxKsQt3nCdD41KryDANtjHZCt0aTgDEEwyLpw=
Received: from MWHPR10CA0061.namprd10.prod.outlook.com (2603:10b6:300:2c::23)
 by CH2PR12MB3749.namprd12.prod.outlook.com (2603:10b6:610:2a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 02:02:30 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::9) by MWHPR10CA0061.outlook.office365.com
 (2603:10b6:300:2c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Thu, 7 May 2020 02:02:30 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 02:02:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 May 2020
 21:02:27 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 May 2020
 21:02:26 -0500
Received: from zhoucm1.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 6 May 2020 21:02:25 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] MAINTAINERS: Remove me from amdgpu maintainers
Date: Thu, 7 May 2020 10:02:21 +0800
Message-ID: <20200507020221.10548-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966005)(33430700001)(70586007)(82740400003)(81166007)(36756003)(450100002)(4744005)(356005)(4326008)(5660300002)(82310400002)(70206006)(8936002)(8676002)(33440700001)(47076004)(426003)(478600001)(186003)(6666004)(86362001)(54906003)(7696005)(1076003)(316002)(2906002)(66574014)(336012)(26005)(110136005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec461c55-db9f-4f9f-8504-08d7f22ab2a0
X-MS-TrafficTypeDiagnostic: CH2PR12MB3749:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3749E3F44BEAEB37A7AC7EB0B4A50@CH2PR12MB3749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yps8GsIhCZLdUHG0UIIv7LPO8Si7iEP3gfeYzLLDAJ+/gYJ8pOPqeNzuSxso5Il/iV9e9J8JJAp/L6WYHSJnHUK8nPxtjt3qMNeLmGZhXUJk0I9iro2IxM/5f8DwXa9A8J5clsIvDW5L0K4cqZyAWHkzD2YBZsSkkuo4JIBaNrAo3w79a1jH1ciIDJqEVY0whZSzZfEbZLlnowzM/vmuo/0V+lcX27ildhfZKl/1E0C0wQ+vOftWPdse9dIAJ+aG+2/V4BI9slZNLCtuosqClKO3yps9YJuOaME3j0s1mTZDcFSjBz1KU+FWWp7OoFbbYElVF1lAV8hCKMfL4Inc0pyHTGC2meRIrAT6lu+p29kC+caSLmSa8EeOcoutcjVKYLYma5terdQog5g8gpcPzSa7ob1DsEPQhdztw/YwXoDKuseaQe8B5w2olnPBVDVGMfhxgzw/ac5Yx8866yH7U/w/wpr167DoS/QIbtanoQrtb6EoZQht0xZqXrAiytJ7NBtUZipv62GsO9NTc1FLLECBAVN64U1VXsgorNKIiDOEKYEljobUOmeAq9v06LzTqs4sIPTjzu8HjpHZIVOrfA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 02:02:29.3927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec461c55-db9f-4f9f-8504-08d7f22ab2a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3749
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alexander.Deucher@amd.com, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R2xhZCB0byBzcGVuZCB0aW1lIG9uIGtlcm5lbCBkcml2ZXIgaW4gcGFzdCB5ZWFycy4KSSd2ZSBt
b3ZlZCB0byBuZXcgZm9jdXMgaW4gdW1kIGFuZCBjb3VsZG4ndCBjb21taXQKZW5vdWdoIHRpbWUg
dG8gZGlzY3Vzc2lvbnMuCgpTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPgotLS0KIE1BSU5UQUlORVJTIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggOTM4
MzE2MDkyNjM0Li40Y2E1MDhiZDRjOWUgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01B
SU5UQUlORVJTCkBAIC0xNDA2Niw3ICsxNDA2Niw2IEBAIEY6CWRyaXZlcnMvbmV0L3dpcmVsZXNz
L3F1YW50ZW5uYQogUkFERU9OIGFuZCBBTURHUFUgRFJNIERSSVZFUlMKIE06CUFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KIE06CUNocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KLU06CURhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpo
b3VAYW1kLmNvbT4KIEw6CWFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCiBTOglTdXBwb3J0
ZWQKIFQ6CWdpdCBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eAotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
