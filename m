Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4BEA412
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9FD6ED0F;
	Wed, 30 Oct 2019 19:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64226ED0A;
 Wed, 30 Oct 2019 19:24:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDYqJC+866CQwXLGOzGNJOtzqyV3qIOIxlVzqsfB46GLViNw287rtuo03vbYjuRdWy0T1YKAf+0YdjsQy6mIu9D54QHi/2/mma6+BzTWnPXYL00udPacusJ07iFswU9HK7tH21RCP+y4PGf6ZWXeCROEVLqvbhW843OeydMSVaD1c5qm8kgV5Ne689xFFgF0yStbKfn1ExydnWIwK0SmfRY0Aw9LTFsXbwpz8/9yRRl8mS67cPjkHVUYvOnwnl60Sr38FyebJlNLz6OQdHiMbno6GAbHPK+YPjYoYmM0UE1lSIY2w2ILTVnqkEBYJaw5twAQ9ECAnqpXOkJLJuXMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApGLNk3GJvVJVxzVSLp7dpPFokUa0l3XeKmGRNirLGQ=;
 b=LcvtAHxVbzlEHKoPe4lOOlXRodW7mevTG8H7W0dwSa3gNFz36dNQFHvbC7dtXD5o0kH+oMQ+TS1ARmt+LtDynM/cFY84sAxvmyizE79COA7J7lJ2fxKelG/GqCo8ATU6VIyJC7OvXn73eUZYmELnUYR7BXX8AnXMqxWm6OcJf5Zf4vavUFX32ZJ3D63WcjXXbNP6+9Mb6n/47mQJAUr5voaYrYK8JEyIeCd9bnbfKylGyNPnUV366t0BJVlEzM1UtzXN9oZUAO6jswp6XjkVOy3Hd4qtvRIIKXuXDc6pLhPScKiSiNT8VcJqFobLYn0Rif6zXaWmTe+ufTVppP8rXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0004.namprd12.prod.outlook.com
 (2603:10b6:301:4a::14) by BY5PR12MB4146.namprd12.prod.outlook.com
 (2603:10b6:a03:20d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17; Wed, 30 Oct
 2019 19:24:36 +0000
Received: from CO1NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR1201CA0004.outlook.office365.com
 (2603:10b6:301:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT019.mail.protection.outlook.com (10.152.80.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:34 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:33 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:33 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 00/13] DSC MST support for AMDGPU
Date: Wed, 30 Oct 2019 15:24:18 -0400
Message-ID: <20191030192431.5798-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(199004)(189003)(70206006)(305945005)(48376002)(2876002)(47776003)(5660300002)(50466002)(70586007)(53416004)(1076003)(2906002)(51416003)(2616005)(36756003)(8676002)(356004)(6666004)(7696005)(86362001)(476003)(126002)(2351001)(81166006)(26005)(6916009)(426003)(8936002)(50226002)(54906003)(4326008)(478600001)(186003)(316002)(14444005)(81156014)(486006)(336012)(16586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4146; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d363b401-18b0-41f3-07be-08d75d6ecc3d
X-MS-TrafficTypeDiagnostic: BY5PR12MB4146:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4146F2A0CB3743A2FB24588AE4600@BY5PR12MB4146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3RLMB/pwcrtSlQqVsTfnQehy+Semm5ZX6VsNz+Mx9dmC+yDe3ijF9KxpRPic8bcF3U5BekS2tyvhdrEFUOsisD5G++xm8avi47XyzjB+1yb2Kf5RxbTUKmkOJ0lAdPI/7agHZhvXbuDWUwQw5VtoifbBMi00p8uPTZC/tUvkdeZc0GWSRuy5Vwy1u3rDJ5loTtsTGlZikGdUrIyGm7qO0A8LXEEasV6SGiYlFJKOgfup4k932K7tWEMYgvAKhpINzA9apUsjduqdKSyxXBKNGAktE/rzD14ZHhBGM/gtQlhkJa4Fgkba7w/B3O8E2a/Aj/8M1VQSGaw7osV9rI2QrgT1tfT2coJnSU5PLiLaYmB6BL2/d2nOqmG3z3ytVZXr418CD5PYaZmg/iRSuPBBpquU98SW5D1AQfCoUawT8fOCMb3Ub+kenXaB48pDPF6e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:34.8920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d363b401-18b0-41f3-07be-08d75d6ecc3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApGLNk3GJvVJVxzVSLp7dpPFokUa0l3XeKmGRNirLGQ=;
 b=j3zzoVVp9KcXUpmEhLtcv4rKfjnzPdZ2OMxfGjO3Z6Br+DLjNkQbP83GOIC+shaFRMgGU6/BqWy4Md+hv4VYOPN5xLmBkyLs8mwoOp9qhwtEMJRu0pqBHfOGJCN/EAtsqrQigL0nTU+7vtcpeOT7QXr34ZQGo0U6Ko++u3Ez+Vs=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKClRoaXMgc2V0IG9m
IHBhdGNoZXMgaXMgYSBjb250aW51YXRpb24gb2YgRFNDIGVuYWJsZW1lbnQKcGF0Y2hlcyBmb3Ig
QU1ER1BVLiBUaGlzIHNldCBlbmFibGVzIERTQyBvbiBNU1QuIEl0IGFsc28KY29udGFpbnMgaW1w
bGVtZW50YXRpb24gb2YgYm90aCBlbmNvZGVyIGFuZCBjb25uZWN0b3IKYXRvbWljIGNoZWNrIHJv
dXRpbmVzLgoKRmlyc3QgMTAgcGF0Y2hlcyBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBtdWx0aXBs
ZQppdGVyYXRpb25zIHRvIHRoZSBtYWlsaW5nIGxpc3QgYmVmb3JlLiBUaGVzZSBwYXRjaGVzIHdl
cmUKZGV2ZWxvcGVkIGJ5IERhdmlkIEZyYW5jaXMgYXMgcGFydCBvZiBoaXMgd29yayBvbiBEU0Mu
CgpPdGhlciAzIHBhdGNoZXMgYWRkIGF0b21pYyBjaGVjayBmdW5jdGlvbmFsaXR5IHRvCmVuY29k
ZXIgYW5kIGNvbm5lY3RvciB0byBhbGxvY2F0ZSBhbmQgcmVsZWFzZSBWQ1BJCnNsb3RzIG9uIGVh
Y2ggc3RhdGUgYXRvbWljIGNoZWNrLiBUaGVzZSBjaGFuZ2VzCnV0aWxpemUgbmV3bHkgYWRkZWQg
ZHJtX21zdF9oZWxwZXIgZnVuY3Rpb25zIGZvcgpiZXR0ZXIgdHJhY2tpbmcgb2YgVkNQSSBzbG90
cy4KCnYyOiBzcXVhc2hlZCBwcmV2aW91c2x5IDMgc2VwYXJhdGUgYXRvbWljIGNoZWNrIHBhdGNo
ZXMsCnNlcGFyYXRlIGF0b21pYyBjaGVjayBmb3IgZHNjIGNvbm5lY3RvcnMsIHRyYWNrIHZjcGkg
YW5kCnBibiBvbiBjb25uZWN0b3JzLgoKdjM6IE1vdmVkIG1vZGVzZXQgdHJpZ2dlciBvbiBhZmZl
Y3RlZCBNU1QgZGlzcGxheXMgdG8gRFJNCgp2NDogRml4IHdhcm5pbmdzLCB1c2UgY3VycmVudCBt
b2RlJ3MgYnBjIHJhdGhlciB0aGFuIGRpc3BsYXkncwptYXhpbXVtIGNhcGFibGUgb25lCgpEYXZp
ZCBGcmFuY2lzICgxMCk6CiAgZHJtL2RwX21zdDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFND
IG1vZGVzCiAgZHJtL2RwX21zdDogUGFyc2UgRkVDIGNhcGFiaWxpdHkgb24gTVNUIHBvcnRzCiAg
ZHJtL2RwX21zdDogQWRkIE1TVCBzdXBwb3J0IHRvIERQIERQQ0QgUi9XIGZ1bmN0aW9ucwogIGRy
bS9kcF9tc3Q6IEZpbGwgYnJhbmNoLT5udW1fcG9ydHMKICBkcm0vZHBfbXN0OiBBZGQgaGVscGVy
cyBmb3IgTVNUIERTQyBhbmQgdmlydHVhbCBEUENEIGF1eAogIGRybS9hbWQvZGlzcGxheTogSW5p
dGlhbGl6ZSBEU0MgUFBTIHZhcmlhYmxlcyB0byAwCiAgZHJtL2FtZC9kaXNwbGF5OiBWYWxpZGF0
ZSBEU0MgY2FwcyBvbiBNU1QgZW5kcG9pbnRzCiAgZHJtL2FtZC9kaXNwbGF5OiBXcml0ZSBEU0Mg
ZW5hYmxlIHRvIE1TVCBEUENECiAgZHJtL2FtZC9kaXNwbGF5OiBNU1QgRFNDIGNvbXB1dGUgZmFp
ciBzaGFyZQogIGRybS9kcF9tc3Q6IEFkZCBuZXcgcXVpcmsgZm9yIFN5bmFwdGljcyBNU1QgaHVi
cwoKTWlraXRhIExpcHNraSAoMyk6CiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgTVNUIGF0b21pYyBy
b3V0aW5lcwogIGRybS9kcF9tc3Q6IEFkZCBEU0MgZW5hYmxlbWVudCBoZWxwZXJzIHRvIERSTQog
IGRybS9hbWQvZGlzcGxheTogUmVjYWxjdWxhdGUgVkNQSSBzbG90cyBmb3IgbmV3IERTQyBjb25u
ZWN0b3JzCgogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwg
MTA5ICsrKystCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgg
fCAgIDUgKwogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwg
IDcwICsrLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwg
NDQ5ICsrKysrKysrKysrKysrKysrLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9t
c3RfdHlwZXMuaCAgIHwgICA0ICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
X2h3c3MuYyAgICB8ICAgMyArCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9kc2MuYyAgfCAgIDMgKwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jIHwgICA3ICstCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmggfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgICAgICAgICAg
ICAgIHwgIDEyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jICAgICAgICAgICAg
ICAgfCAgMzMgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgICAgICAg
ICB8IDI3NyArKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9tc3QuYyAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNw
LmMgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RwX21zdC5j
ICAgICAgICB8ICAgMiArLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAg
ICAgICAgIHwgICA3ICsKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgICAg
ICAgICB8ICAxMiArLQogMTcgZmlsZXMgY2hhbmdlZCwgOTI1IGluc2VydGlvbnMoKyksIDc1IGRl
bGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
