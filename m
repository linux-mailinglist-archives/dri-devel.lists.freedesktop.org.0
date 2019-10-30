Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40DEA525
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 22:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10C6EB93;
	Wed, 30 Oct 2019 21:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680045.outbound.protection.outlook.com [40.107.68.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2129B6EB90;
 Wed, 30 Oct 2019 21:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1YZW6lQKf9I6NLS9NSJb8WVtM5wB6+8CnxEfrSDJ9P07I435xgVB3cExtIU7mZR6I1DvTAe6JukegE4pboZ/UcPHsMy878QZpp9Oy4XVnJsYo0vprtQzPfRNA/KzxxNU1qD2CVf0fTAOGBV4jUmvB0C4XAQtOfbTQCTwLiUkV0hBIkWt3sYBw1KSwS/0v51WZPZD5KEhlEUCIzdrXVA4mchQ/ofK37AB61v0ugOJP2afbQH2mQF8vpmq6B52TfRvzi/85w5ywblAQVOGZE/WObowGnWHKANk315+19SY6KMc+ggeWFVwZWg6ZV6RWGkG3VfqFnAW5/GM6bPlM/yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDpExfp37vFf0jHlRfLG5rwQtPJqCDU9nHBj+4i5Rbo=;
 b=AueowZIn0sft9wZY5NzkwiCbKrUzSXexp7TsLa8QrYWeo4fAHyBPQnxh3KX1oLUWSDVFf7oFYp00h4EoRtAV8KdbyAex+34BPTJbESI6pDeQ+GCccoZZxPvFC1ZPLovKq8X1GAlyyWMd94npzbtjkMjHCDaD4IP+Zo75O/AdppcSlVYZgNfflFRs4FiBnXYLeDVKgOy5Q/zxNviC4pBMrNgbjfkIee/Nq8vkyli422CKsyAnu34MrRDBWS35m0GZzPm+PUO9RGOzN04Ejw347ZCBEAnsAOFKyrIvjK9NCln1PqcKb7AsvW5j1K3sRQw73JhOnLi69JuwH+xKx1/o9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0002.namprd12.prod.outlook.com (2603:10b6:4:1::12) by
 CY4PR1201MB0023.namprd12.prod.outlook.com (2603:10b6:910:1f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17; Wed, 30 Oct
 2019 21:09:07 +0000
Received: from DM3NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM5PR12CA0002.outlook.office365.com
 (2603:10b6:4:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.18 via Frontend
 Transport; Wed, 30 Oct 2019 21:09:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT006.mail.protection.outlook.com (10.152.82.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 21:09:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 16:09:06 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 16:09:06 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 16:09:05 -0500
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/2] Changes for DP 1.4 Compliance test 4.2.2.6
Date: Wed, 30 Oct 2019 17:08:42 -0400
Message-ID: <20191030210844.19803-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(189003)(199004)(70206006)(81166006)(426003)(305945005)(8676002)(50226002)(81156014)(356004)(6666004)(50466002)(4744005)(7696005)(478600001)(336012)(51416003)(5660300002)(47776003)(53416004)(8936002)(1076003)(16586007)(86362001)(316002)(48376002)(476003)(36756003)(110136005)(54906003)(186003)(70586007)(4326008)(126002)(486006)(2906002)(2616005)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0023; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09fa65a9-287e-4c7f-09a8-08d75d7d66a5
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0023:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00238AB5255B2F31C724B759E5600@CY4PR1201MB0023.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5pGcKbVCVgckZ0Mv8+p3UKIPW60iOdxDGiudIUcLc4tVMFP32J84Ar5uXHdpGsAjGln21cG5o8OCknn9m1qq53KTzrGAK/dudE4sHz/A0nBuENTxPbCFPsXGTSUzlnSlnsg88YuQmWDocWcswZqSEP6D3QhQvaCJFluH56N3Y8lqBZtcE0PmUNW1nI/PDvMP3vFu9qAfIcZa0cV18UlN6I6l0x+YX3FCp/dsBZGuDuo597tkUBp7M0/Tl5Phf+fKQ3p+fH5E6QDOaqgOA+wdt9oga7FQZf9Cai5igJjsjKVq/EoE2xH5+NNQDe4658QZtwtYKDqz3/LCyQxkKbjINMjNXQoXVl1pKoAYXr06oq9TuRwIDdSMjqeOUTYCkhj//LCM2Q21XTKzIITvrS6yqo5TlSKn2tfIUg79dDggR4valMaBe9dOLvfKclJf/Lh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 21:09:06.9740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fa65a9-287e-4c7f-09a8-08d75d7d66a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0023
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDpExfp37vFf0jHlRfLG5rwQtPJqCDU9nHBj+4i5Rbo=;
 b=y3pJD7kYTbWB+fpsOh7wpR4qhPsjVesTQatW0z1xekOVjeFs9aFI9AG5ZL8Ts3oE2mf7+ol+GuyABDT8taGiFcAHbV1ahIV6XIxpHrXWWeWEf1Qwcc1Ed26v/ZzG6k1c0Vl8eUqBUElklh7KgaIgQqleRDsYGxb1n5BfTyY4DVk=
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
Cc: manasi.d.navare@intel.com, Jerry.Zuo@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VW5saWtlIERQIDEuMiBDb21wbGlhbmNlIHRlc3QgNC4yLjIuNiwgRFAgMS40IHJlcXVpcmVzIHRv
IGNhbGN1bGF0ZSByZWFsCkNSQyB2YWx1ZSBvZiB0aGUgbGFzdCBlZGlkIGRhdGEgYmxvY2ssIGFu
ZCB3cml0ZSBpdCBiYWNrLgoKQ3VycmVudCBlZGlkIENSQyBjYWxjdWxhdGUgcm91dGluZSBhZGRz
IHRoZSBsYXN0IENSQyBieXRlLCBhbmQgY2hlY2sgaWYKbm9uLXplcm8gb3Igbm90LiBOZWVkIHRv
IHJldHVybiB0aGUgYWN0dWFsIENSQyB2YWx1ZSB3aGVuIGNvcnJ1cHRpb24gaXMKZGV0ZWN0ZWQu
ICAgIAoKSmVycnkgKEZhbmd6aGkpIFp1byAoMik6CiAgZHJtOiBBZGQgc3VwcG9ydCBmb3IgRFAg
MS40IENvbXBsaWFuY2UgZWRpZCBjb3JydXB0aW9uIHRlc3QgNC4yLjIuNgogIGRybS9hbWQvZGlz
cGxheTogSG9vayB1cCBkcm0gaW50ZXJmYWNlIGZvciBEUCAxLjQgZWRpZCBjb3JydXB0aW9uIHRl
c3QKCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jICB8
IDM1ICsrKysrLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
YyAgICAgICAgICAgICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKyst
LQogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NyArKysrKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArKwogNSBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlv
bnMoLSkKCi0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
