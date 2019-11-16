Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFDFF5F7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DDB6E23B;
	Sat, 16 Nov 2019 22:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790057.outbound.protection.outlook.com [40.107.79.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C6E6E1BD;
 Sat, 16 Nov 2019 22:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQMSX6BtEWSnHS3vJ0MB61s1AJtTmoWOeii3m0ROIrGfYgkJ5tzDjjd6nqAVghNk++ulXjZ0H4J0OFt6zgJgA2V29/tEmucJ/mR6roqjt0r/0pSlums33xtjVC8cN+lZz74L1SWStXYjZSL6E7PJVt/8Vot4B6zItJxgnAXl44WSL28pmrYtw1k1AQT3Z7Dp15dyAymsWH2i2I0Udcb6pWJ0PVjqj4tc//Rqmpl6Uet2MX58hurTJ7ogn10bhwr2NSFm4EAXulO5wPYmN5MWakA1oLmIfDNiVp9CxP3xM8VVuH8hk+x3NgX6h/PfyPsKMyBkI6xDOC9/1GWnGDL6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmtBOOWXG7HUodP6sV5V83dEIhQH4w0BdtClJ8/F4pw=;
 b=bmai4TkKzizNjqmjB7vXarjw1/1IVq5kXYPHjnt0J0GadY8Ded69XXGqueWK7H4k5glhHCIy/sv/sBVJM0meYze7IwYZ9y9C6Oq6cUES6LDVkLHb2Oc8846on4blqhXgqexHAK24ZqITLh8Jp0OODM9Dujs3pgGYCTKqpq9JxqJ9PFxm2rCIprQsvZ3eog1qnN1tbwyIO6GcZe/XQ6BLUWCUWlswvXWxhNB1nWfO7PDf8Xxs+H91AQW34i3LXCwmgyBCzMFr2mF5MLlT4Iohq4m6XKFjO+MYrMLV4K2dRdgbbR7gFr6ppFYRt8ABJJqfl2T40wvAmSGJWueY0VFvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0043.namprd12.prod.outlook.com (2603:10b6:903:129::29)
 by BN8PR12MB3459.namprd12.prod.outlook.com (2603:10b6:408:65::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Sat, 16 Nov
 2019 22:01:35 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::206) by CY4PR12CA0043.outlook.office365.com
 (2603:10b6:903:129::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:34 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:34 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:33 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 04/17] drm/dp_mst: Fill branch->num_ports
Date: Sat, 16 Nov 2019 17:01:15 -0500
Message-ID: <20191116220128.16598-5-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(428003)(199004)(189003)(478600001)(1076003)(2906002)(14444005)(486006)(126002)(4326008)(316002)(54906003)(2876002)(6916009)(16586007)(476003)(446003)(53416004)(48376002)(36756003)(356004)(50466002)(8936002)(70586007)(426003)(6666004)(11346002)(2351001)(86362001)(336012)(26005)(51416003)(2616005)(5660300002)(7696005)(186003)(47776003)(8676002)(81156014)(81166006)(50226002)(305945005)(70206006)(76176011)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3459; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d046eed-df69-461e-028b-08d76ae08be4
X-MS-TrafficTypeDiagnostic: BN8PR12MB3459:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3459266B4017F08D6C97F723E4730@BN8PR12MB3459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +HJPrmydJap576jNjbkS1dbtVeaa7dTaEoqsM9RE8jxSSFhn/qfbFLU81zGkeGQTY27+erE37qbDGyk5acg3hydNIF6jr/lvVJnqM8A6gVf4TYX8kc8x5eb7OjzWm9Zl/Y7AlW2Z9klKbdNtKh3kOVb4mAGc4fF7NzKHdWwuLUh0ksv6jUbgQkwTYwj/lC1gFgPY4VhquOWRL8BfcUwF/MR5G2GtN5XcFOUStNRmli1ZQ6uxNQYfeId7LMWFRC6GZQz1CtclcDrITndvTEFRvIYVPbBp1bhHpOg5KRVEzxjNTCA0U5kYfyKiEXa2Qw5kHThkDqelfNIH4THzZaYtShymZ98runvPeJx25hQLjzlMto0jOv2xGfaN0/YLCiFqKYE7hueadXy3tfA69cXh6sEZx6YlsndI6C64j2wOoJ0BUlc2bgS5ov+5/ONX78ws
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:34.6820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d046eed-df69-461e-028b-08d76ae08be4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3459
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmtBOOWXG7HUodP6sV5V83dEIhQH4w0BdtClJ8/F4pw=;
 b=U7//AYk7oTS7+sp5YYwDkmGdOdGXbODP3gKuEekBz6QcFVmUZMGYzqR/Bk9qSAQV+n31tXTFPrL+YvxOXH99wktoQefQBkfacQDsCW8bwH31tfn983OrRZnGE2cAy7hEG6gua/3UT4XmjC/64QXqcBV0EBPbB7hGd5ctTK/8lsg=
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
Cc: David Francis <David.Francis@amd.com>, Mikita
 Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKVGhpcyBmaWVsZCBv
biBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJdCBpcyBpbml0aWFsaXplZCB0
byB6ZXJvIHdoZW4gdGhlIHBvcnQgaXMga3phbGxvY2NlZC4KV2hlbiBhIHBvcnQgaXMgYWRkZWQg
dG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMsCmFuZCB3aGVuIGEgcG9ydCBpcyByZW1v
dmVkIGZyb20gdGhlIGxpc3QsIGRlY3JlbWVudCBudW1fcG9ydHMuCgp2MjogcmVtZW1iZXIgdG8g
ZGVjcmVtZW50IG9uIHBvcnQgcmVtb3ZhbAp2MzogZG9uJ3QgZXhwbGljaXRseSBpbml0IHRvIDAK
ClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTog
SGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRh
IExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggOWYzNjA0MzU1NzA1Li41
MDI5MjNjMjQ0NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtMTY2
OSw2ICsxNjY5LDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBf
bXN0X2JyYW5jaCAqbXN0YiwKIAkJbXV0ZXhfbG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAkJZHJt
X2RwX21zdF90b3BvbG9neV9nZXRfcG9ydChwb3J0KTsKIAkJbGlzdF9hZGQoJnBvcnQtPm5leHQs
ICZtc3RiLT5wb3J0cyk7CisJCW1zdGItPm51bV9wb3J0cysrOwogCQltdXRleF91bmxvY2soJm1z
dGItPm1nci0+bG9jayk7CiAJfQogCkBAIC0xNzAzLDYgKzE3MDQsNyBAQCBzdGF0aWMgdm9pZCBk
cm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQkJLyogcmVt
b3ZlIGl0IGZyb20gdGhlIHBvcnQgbGlzdCAqLwogCQkJbXV0ZXhfbG9jaygmbXN0Yi0+bWdyLT5s
b2NrKTsKIAkJCWxpc3RfZGVsKCZwb3J0LT5uZXh0KTsKKwkJCW1zdGItPm51bV9wb3J0cy0tOwog
CQkJbXV0ZXhfdW5sb2NrKCZtc3RiLT5tZ3ItPmxvY2spOwogCQkJLyogZHJvcCBwb3J0IGxpc3Qg
cmVmZXJlbmNlICovCiAJCQlkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQpOwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
