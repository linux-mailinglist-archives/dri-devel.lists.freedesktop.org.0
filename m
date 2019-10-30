Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EDBEA41D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6090E6ED28;
	Wed, 30 Oct 2019 19:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3716ED24;
 Wed, 30 Oct 2019 19:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwzJq6vIiz7P2DCo+u/UR0IwjsWexQ1q2iMMifitoUPj9YgMBD356maTQGuQsOuTbQAWTSqqAvhjIVy7qtnv2aSXAZCvQ868rN9kebTS6NT7n+ab8tK7WLvq4m8lMkVtA+7pv2STYB3meXHt0Vf7C5q0Tu9niyClZX+nAkAYh8Qz9gGj9nUPGWmpeZ8u2nVE90Jr2YYG4jgC47GvM5wuxST8t8/vcjWvEPU+qbKPKm/djS6Kt12V31EEO0rccFEDiu3q4bRTx/IePtMFIgV2YhoeuM6sI+s4a3/tz9sYPGcbCI7e7EYG509fA6lohlqDhP0OMsIA8374uKe+QWEfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icV3H2JyaFwOXyzqYMv6r0eGNW8TaXttRevfZbt/zC4=;
 b=Jiz4Kfmk3IB0ELs0P24W5fH0ETX5z3Gqe6t+U+RalCW2+xTYpE8cgYxZp/MP8zpp9tqtpU8QQ++IMCW1ulToDiecSGYsi+/QBTIiUnwE2urI950DALv5BJtrqcr0pE/VTFNcR8hqbplltWq7CVanZe23OJOKVaYFCi5RL64eI+r+HvI5FOFTH9GIp8o0WM5EWQQl1B7lbpiHhDf/qBMoo6GKv5st0E1ZVOcUVeH7I6v5eJV4RuljFEmuAkBIxzFFP2wee0haLICy8zIcwgMfx/k+GOKE0PSevunBacWEilt7ZBxfumozw9+vWxG302ozYsf2R7X9PA+GlxIZw6NGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:301:4a::24) by DM5PR1201MB0265.namprd12.prod.outlook.com
 (2603:10b6:4:58::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Wed, 30 Oct
 2019 19:24:44 +0000
Received: from CO1NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MWHPR1201CA0014.outlook.office365.com
 (2603:10b6:301:4a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT019.mail.protection.outlook.com (10.152.80.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:43 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:43 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:43 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/13] drm/amd/display: Write DSC enable to MST DPCD
Date: Wed, 30 Oct 2019 15:24:28 -0400
Message-ID: <20191030192431.5798-11-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030192431.5798-1-mikita.lipski@amd.com>
References: <20191030192431.5798-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(199004)(189003)(36756003)(336012)(2616005)(81166006)(11346002)(426003)(47776003)(26005)(8676002)(6916009)(81156014)(186003)(486006)(86362001)(5660300002)(7696005)(51416003)(1076003)(4326008)(446003)(305945005)(14444005)(126002)(476003)(8936002)(76176011)(478600001)(50226002)(316002)(2876002)(2351001)(50466002)(16586007)(53416004)(54906003)(48376002)(356004)(70586007)(70206006)(2906002)(6666004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0265; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff2af6fd-e468-4355-fde6-08d75d6ed1b9
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0265:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0265F4718720D318A6E9A36FE4600@DM5PR1201MB0265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8hNUz/VfXlN9ylA7s0I/+e66oJzJdHqZUktKWObOAk31mtrbAqhWnsGl93zRw/hM2WAZQhyVBHJgnahXetOpvP+58TbhIUEbwlHFJ9NbkoMQeMIbq1kIsvwXrnUig2MX653H/wGeQw/0dvyfQ5kbEAbcYdh9ssNT8B91e/o2L/zrDOz4v2CvEh1za0lnKwfEZO7CUBT6V+WiQOnkkGaEVldZDv3sqsWo3bkHIdW4EoXjrj9uHEUdh+66EPNDnkLzaZzdmAUu+dA9YIxSsgpNuTHC1FajRBLdH8e44Y1UhPyMjrgIo253jjOGAvvH3CvR4zQGgrYUvqaezSBlweOCgjMrjQHJHEgO+s8fUQxoVDKCxd/2ddAw/wBT5fendnC/O7R5uQQsZVk3cDhKF4C8glJz4dmGpoea9r5TO2v3OvbcGdvqNamIW1q8Lt/1ZCMp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:44.1006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2af6fd-e468-4355-fde6-08d75d6ed1b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icV3H2JyaFwOXyzqYMv6r0eGNW8TaXttRevfZbt/zC4=;
 b=JuSSvxAmoLwlfBVu0XVHOqH2tyOHJ2I8lmPeaQqD8ajqeDMIyajLsCsGDyTLGkfMKLxsXAwRzBy3xlH8KBcSS1LS6AN9Y1/ED0SbVmyxj/wvcj9FvsOkgsAjtz3T8hT6sQFCLN8eXXV6tmU79+n0w5JsnblP6xKRRfX7RHSFAO4=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKUmV3b3JrIHRoZSBk
bV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxlIHRoZSBNU1QgY2Fz
ZS4KClVzZSB0aGUgY2FjaGVkIGRzY19hdXggZmllbGQuCgpSZXZpZXdlZC1ieTogV2VuamluZyBM
aXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgfCAxOSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCAx
YjJjYzg1YjQ4MTUuLjIxNDRiNjVmNDgwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzcsNiAr
MzcsNyBAQAogI2luY2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5jbHVk
ZSAiYW1kZ3B1X2RtX2lycS5oIgorI2luY2x1ZGUgImFtZGdwdV9kbV9tc3RfdHlwZXMuaCIKIAog
I2luY2x1ZGUgImRtX2hlbHBlcnMuaCIKIApAQCAtNTIxLDggKzUyMiwyNCBAQCBib29sIGRtX2hl
bHBlcnNfZHBfd3JpdGVfZHNjX2VuYWJsZSgKICkKIHsKIAl1aW50OF90IGVuYWJsZV9kc2MgPSBl
bmFibGUgPyAxIDogMDsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsK
KworCWlmICghc3RyZWFtKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoc3RyZWFtLT5zaWduYWwg
PT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUX01TVCkgeworCQlhY29ubmVjdG9yID0gKHN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKKworCQlp
ZiAoIWFjb25uZWN0b3ItPmRzY19hdXgpCisJCQlyZXR1cm4gZmFsc2U7CisKKwkJcmV0dXJuIChk
cm1fZHBfZHBjZF93cml0ZShhY29ubmVjdG9yLT5kc2NfYXV4LCBEUF9EU0NfRU5BQkxFLCAmZW5h
YmxlX2RzYywgMSkgPj0gMCk7CisJfQorCisJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9U
WVBFX0RJU1BMQVlfUE9SVCkKKwkJcmV0dXJuIGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgs
IHN0cmVhbS0+bGluaywgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOwogCi0JcmV0dXJu
IGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgsIHN0cmVhbS0+c2luay0+bGluaywgRFBfRFND
X0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOworCXJldHVybiBmYWxzZTsKIH0KICNlbmRpZgogCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
