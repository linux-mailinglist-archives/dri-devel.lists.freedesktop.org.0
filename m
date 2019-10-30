Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816BEEA41B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD3E6ED20;
	Wed, 30 Oct 2019 19:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F666ED19;
 Wed, 30 Oct 2019 19:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTalwWD0liKCa5Nt2btSRN/iIpO1lmWp+NaKMjm3vB+0mxoEPcYQufqcPmypY8l32tsdIPoqsLnOXRdCvU+i3EoqnoVH1av9q78V9fIc+rbP/dIEgR2iSbV41IhWe5CStiOsqEFc5R0B77QTaNCX2Ia2HtDOWnyhYfTJrBPZ1GchR2jnRJbXcRQcn5N3K2OrW3+CZIjZrU2gZuQWptOwya3kAq6oqo26D7S9DNkNGLfK+bl3vR8f17xwWCC81t5UmdEN2EawrTVkV8x8RUrOumd0YXtYbhbyWvKlIV1jqlJ6S78X7j11v9NrgP0FPgUgjHIMEh5GlR5KWjorBPsWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=UOTJ4JEH0ahfYEUPMizhbdesb5Pxmwc+0KT82Prq2D3qt9/3oZ+pbYc0QYXUar+t2+YHK7oyDpmy4QU3k0VAUT8NrSqLNNkqFRjjtp3QVbp2oDZcvn6G6bo7VPH9uYlSuMkctW5g+TvyaySRdLm02JLdQQ+lhicAipHS4EYPVPxAXtrZCmb+z2bcPH2yMFezXj4+4kkK5A9fSryCUo9NNQQ+ZqxBjVRNUj15DzQO3cepYRlkK3JPkFkZOt7dYjvwzDmUPmnuHMQZqZFWRO0qQrUhhKSoG81BTzeOIrExfHLgiFuIcdladP3CfZ0AasXToBpW3C6Q0Rf8ppukzuxMJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0016.namprd12.prod.outlook.com
 (2603:10b6:301:4a::26) by MN2PR12MB2975.namprd12.prod.outlook.com
 (2603:10b6:208:ce::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Wed, 30 Oct
 2019 19:24:40 +0000
Received: from CO1NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR1201CA0016.outlook.office365.com
 (2603:10b6:301:4a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT019.mail.protection.outlook.com (10.152.80.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:39 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:39 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:38 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/13] drm/dp_mst: Fill branch->num_ports
Date: Wed, 30 Oct 2019 15:24:23 -0400
Message-ID: <20191030192431.5798-6-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030192431.5798-1-mikita.lipski@amd.com>
References: <20191030192431.5798-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(428003)(189003)(199004)(356004)(50466002)(6666004)(70206006)(316002)(54906003)(16586007)(48376002)(6916009)(14444005)(4326008)(53416004)(2876002)(8936002)(76176011)(1076003)(478600001)(476003)(51416003)(50226002)(305945005)(2616005)(81166006)(486006)(8676002)(426003)(2351001)(446003)(81156014)(36756003)(2906002)(11346002)(126002)(7696005)(26005)(336012)(186003)(86362001)(47776003)(70586007)(5660300002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2975; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7891d1a-8018-4527-b39b-08d75d6ecf70
X-MS-TrafficTypeDiagnostic: MN2PR12MB2975:
X-Microsoft-Antispam-PRVS: <MN2PR12MB2975DDDD4DA09E398E68391FE4600@MN2PR12MB2975.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtAYHitLLyscCN8+nDdEE1UhQ0geMEqNJwlaXm3BcpIbesJHTx0wvjfcfrs5IquMP8dKMGvwyI9iHTAm3lyDNXANCBlyA/LXGnAHiiFCgHWpjnh/n+WIk2g4M6W2SfMl0wmoXzzbmxM6DvEb718Sk3BOYEqKBVl6ncu0hhFJxa1nKoi4/nMlr4Lr1jIDaPloh5bUZJ1827GrTZ9On/X5gR7EAdIFJNYWa9GvT8Hmxe2YGJQ5AZcAMCZtN5UfyF/1V8yLoxlQaiM2bjXDmeGKNDGrrOtLv+pFHewRJBHhfzAEI2t7bQW0GVnNNj+eYmGNqort4tAWmt+JB7QMqkAwb0tpqHiN+Xzzd+bY/pHapgcrq+ZNXwR4GRv+GctmC5uB5bqf4sQ09DTC7UVTX4d8KgFqs4FmLqwBvm0rh78KSXsI4dJvYautkQJM9DSqR8DH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:40.2638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7891d1a-8018-4527-b39b-08d75d6ecf70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2975
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=XSwfcGk6bd418SMduMzfPnE2jYWm77pgqBCNgmaJjyqY97ex+JynlXqLaCeU3gENz+iksGtLPkf8aAvymQ2AVhuIDVduuX9ykurKrHQByNHDj+J/uSS7qqmaZxU2jwdiRpgFEo513ROq9KQo7tF3G8ByaaHnOjkRRU/NzVBPiU4=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
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
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDlmMzYwNDM1NTcw
NS4uNTAyOTIzYzI0NDUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAg
LTE2NjksNiArMTY2OSw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hZGRfcG9ydChzdHJ1Y3QgZHJt
X2RwX21zdF9icmFuY2ggKm1zdGIsCiAJCW11dGV4X2xvY2soJm1zdGItPm1nci0+bG9jayk7CiAJ
CWRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnQocG9ydCk7CiAJCWxpc3RfYWRkKCZwb3J0LT5u
ZXh0LCAmbXN0Yi0+cG9ydHMpOworCQltc3RiLT5udW1fcG9ydHMrKzsKIAkJbXV0ZXhfdW5sb2Nr
KCZtc3RiLT5tZ3ItPmxvY2spOwogCX0KIApAQCAtMTcwMyw2ICsxNzA0LDcgQEAgc3RhdGljIHZv
aWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKIAkJCS8q
IHJlbW92ZSBpdCBmcm9tIHRoZSBwb3J0IGxpc3QgKi8KIAkJCW11dGV4X2xvY2soJm1zdGItPm1n
ci0+bG9jayk7CiAJCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7CisJCQltc3RiLT5udW1fcG9ydHMt
LTsKIAkJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAkJCS8qIGRyb3AgcG9ydCBs
aXN0IHJlZmVyZW5jZSAqLwogCQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
