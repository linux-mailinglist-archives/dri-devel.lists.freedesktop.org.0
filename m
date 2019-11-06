Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449BF1CCC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E466EE23;
	Wed,  6 Nov 2019 17:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603BE6EE1D;
 Wed,  6 Nov 2019 17:51:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afKWtsz6/1rGbw4R5TraapYyeJ6uN5GGS1n06cXatcNJerVX9+6JVXYZ7S7sPEJENHRaRj0j5uDTmcTCW7rC4f61TbZufmpV9Ei41QSSWXRnwdtWupxs/UEDA7j5rn9z8fmM2k28VMmFiDcEcnFMWCn+W6TaT533EoTveMtE1DnD3kONEvMilAuywV//8CsDg14ygQlIlENFrCRNH7iIP9ckdD9RzfXp7I83M8GkYlnChLgJ23NMro5QOfpRAXkZfHrVnxU4iwJlQZnWfHanbYjy5eJ1Ug/2y5p4SdsKsu2nsuPmPnMWy/zk//Dn7g8j+rlIyVGBTYu+6VUZMqNqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fRaMFMMXIG5vfsrhB70NWUa/7t/tshIzlvO8b15v/Q=;
 b=Z9mVLmHEvI/WxEUa6ZzqyRvof43iNb3xeqS7k8Crgc6ecFx6HkImrx00/+M+iwz1o0tXS/PlrvXZmATT3G/aW4MvPOefWXkTgwQk3D/lHJEjmbyt7UBX1Rf+15igyr3sBTKYzEyusGfMMiml/Ylt5U/sginPIKLeXWPWqVKJPo4RM/xBggsXrsDZfbRikNntrjj9pYdItsdy/gUjh5iJyPGw9GarwPp9EolpfziNy5G+N/g/tlWaYmXSCPG0bZFZZCQ1NIbVnGSve947+hb8kqVpWrQYJKAcT++NDNBgEpIX7vrglQpfFD5VbK/yK2t0bf6/gkDrpJ2QuPR909NRKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0012.namprd12.prod.outlook.com
 (2603:10b6:910:16::22) by DM6PR12MB2683.namprd12.prod.outlook.com
 (2603:10b6:5:52::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Wed, 6 Nov
 2019 17:51:21 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CY4PR1201CA0012.outlook.office365.com
 (2603:10b6:910:16::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.22 via Frontend
 Transport; Wed, 6 Nov 2019 17:51:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 17:51:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 11:51:19 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 11:51:19 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 11:51:19 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: 
Subject: [PATCH 3/4] drm/sched: Avoid job cleanup if sched thread is parked.
Date: Wed, 6 Nov 2019 12:51:11 -0500
Message-ID: <1573062672-23698-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(428003)(199004)(189003)(426003)(86362001)(336012)(446003)(70586007)(11346002)(70206006)(50466002)(4326008)(2616005)(476003)(126002)(316002)(16586007)(5660300002)(109986005)(26005)(51416003)(7696005)(186003)(53416004)(76176011)(48376002)(54906003)(44832011)(486006)(8936002)(1671002)(81166006)(478600001)(81156014)(2906002)(8676002)(50226002)(47776003)(36756003)(6666004)(356004)(450100002)(305945005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2683; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1a147cb-f4d0-421b-d931-08d762e1eea8
X-MS-TrafficTypeDiagnostic: DM6PR12MB2683:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2683F194E5A06AA6ADFA76A0EA790@DM6PR12MB2683.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XpMDDfE/cle5BqZ+3yF4QbRrjzBxDqO8IT+dwLnnjS7ra6GN4LMTVKpDlWbE+uG+SY4g0oWpSixDJiEn5dvdzjLW9NAR5bwr1NxTmeA754AvqBY0vFA+Bs03+S6lZBcU7KZYYpZXpjUUubAb/UmcIRjYlriKqAQxG7+FGpH5M5WW5ZbkWD6bB8+gieQ66EklInb49tqesXr63ob6PvAuW2R20HxSRHVZ8uHMrBXT3TOM3upAS1+Bufy/hr8JhfwtcRvcxROErOUKMg6HvCE17WrenjE5bT6LhPRlTSZ6l2F1fgVypSiR48evZU0Rp4qeJ43oXAh9Eukrh3Rag/aVFPGROfuhI47HHmpbOuVwX+FOHlcujGzUvjzr83prBfGH1+m+koO0jZymAGMIO1Z5e7LO3q7sgi0heTlXQdmnPnjYMT0sMneK6PKQ4PEwwLsJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 17:51:20.5669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a147cb-f4d0-421b-d931-08d762e1eea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2683
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fRaMFMMXIG5vfsrhB70NWUa/7t/tshIzlvO8b15v/Q=;
 b=x8stlZFMFmz5ZZc9xBaFB2fkiLvGXrbQ95sqpxnhmhG7zUHwMjqHg4RqXzqiSo/GF5yTtg3p+jG5ZHP8lVahaqtPr6s7i7DoePUTex2mB0EKnl6aHwoSJ+cmKIGKW5EW2QqWWmZgYL0PvUAIhmDzhK5MaOEodYYISTaaKsr/aqE=
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
Cc: Shirish.S@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB0aGUgc2NoZWQgdGhyZWFkIGlzIHBhcmtlZCB3ZSBhc3N1bWUgcmluZ19taXJyb3JfbGlz
dCBpcwpub3QgYWNjZXNzZWQgZnJvbSBoZXJlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6
b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMgfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMKaW5kZXggMzhiYmFkNy4uODBkZGJkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9tYWluLmMKQEAgLTY0Nyw5ICs2NDcsMTMgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVk
X2NsZWFudXBfam9icyhzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQogewogCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7CiAKLQkvKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVv
dXQgd29ya2VyIGlzIHJ1bm5pbmcgKi8KLQlpZiAoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVE
VUxFX1RJTUVPVVQgJiYKLQkgICAgIWNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3Rk
cikpCisJLyoKKwkgKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQgd29ya2Vy
IGlzIHJ1bm5pbmcgIE9SIHRocmVhZAorCSAqIGlzIGJlaW5nIHBhcmtlZCBhbmQgaGVuY2UgYXNz
dW1lZCB0byBub3QgdG91Y2ggcmluZ19taXJyb3JfbGlzdAorCSAqLworCWlmICgoc2NoZWQtPnRp
bWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYKKwkgICAgIWNhbmNlbF9kZWxheWVkX3dv
cmsoJnNjaGVkLT53b3JrX3RkcikpIHx8CisJICAgIF9fa3RocmVhZF9zaG91bGRfcGFyayhzY2hl
ZC0+dGhyZWFkKSkKIAkJcmV0dXJuOwogCiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
