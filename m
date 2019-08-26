Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51D9D160
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB3E89E15;
	Mon, 26 Aug 2019 14:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4B89E15
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3k1Sit2syc7nSBLYqC4blsuTXqrRsDaVU3fq92py3L86TKhEnBh/iz/qzkPLBC2XdoqCJf0chSvZErfGcW7qDBBOjQU0cR/bdnT9UjlobsgsIprPBjG2+VOOzpiBXJt4tskDovDAtnShLAt+mAZ3QZjYH3c7X+tJ8GSgcvfJiyZd6lHRueummvGP42xt65qSlcx1FqWAxAAXK+dd2q++qfT1lR7wDe9oMC7MbS/bdeP/ruIwb3mZfvyixFQB6b7C9H97RHh+gd6I3huLXDiKejR71Kkr2EKG4sRieSBE6Y49FbXfb4N2k0TwM+cyBTiYMafIa1JApbbbNhIKxnyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmcyyzAv2Bnon88yENwJSthK1iNwvcbLv/cDSX8nNpI=;
 b=HJFcJizESxAhHrdZvGLzj5QxWZcwymapTsnn3SASwHkNO6drQh3Izb4QwbZuh/ysaGz1MGdewn468zf1emIRsRowPfCylrdpTB0RS7vB6f6oVq4CJw6hpj1ZzSzKw+B1bBw780G39UJgIBErPDz+2eszssnTihNL1gRSrsK2GcWizDBrLPlbLwALfVLkoeUL4WhmjSQ86Vh1EFQvHD1uV4LpW0b13N0JzuEhM423KjmJu4otKLDS1R0CejR1Z2g9rc3JuwCILYA2awnWY6M5FVvzQL/cyC+2tqsihTCdrwMfPtcYwfCZKLTGrcDuLbQBJZOKZWBmzeIxccF0+J4Sug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0066.namprd12.prod.outlook.com (2603:10b6:3:103::28)
 by BN7PR12MB2705.namprd12.prod.outlook.com (2603:10b6:408:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Mon, 26 Aug
 2019 14:09:22 +0000
Received: from BY2NAM03FT058.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0066.outlook.office365.com
 (2603:10b6:3:103::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 14:09:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT058.mail.protection.outlook.com (10.152.85.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 14:09:19 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 09:09:06 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 0/6] DSC MST support in DRM
Date: Mon, 26 Aug 2019 10:08:57 -0400
Message-ID: <20190826140903.12580-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(5660300002)(478600001)(2906002)(1076003)(6666004)(4744005)(70586007)(70206006)(356004)(4326008)(305945005)(316002)(51416003)(486006)(126002)(8676002)(81156014)(16586007)(81166006)(47776003)(50226002)(8936002)(53936002)(36756003)(50466002)(48376002)(49486002)(186003)(86362001)(476003)(6916009)(26005)(2351001)(2616005)(426003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c58c38e-e83b-4784-83e6-08d72a2efd08
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27053E922080BDF1DD5884D2EFA10@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 35d1qIkEt7OHhgvv9137Wz7LTzeOQN0J6+GxQqgtfovAqn4glZK22VQH6dUd5kVg5S3hIYDBg1cYTvhZTN5brYc9m+uOncJN7Tuer5osclRN3IOqiOPEDAA6PxSNkiJRL+RgxJ912aDv69TSrwjKaGLVOTrLNVNSik5LbUGmOcEubOPW4HNXFgNWznd6m+HNCmyz9aTM5KNBaYtyNiqoN3pSgxYcGm6fbiXrYMUwH9CKfGkh7p7PLKd68ad3V5ID/F4nLsRwQJOSKwv0Kn10Oj+DdoQ3FX01AC0U1YmOTj6le40oue5QA4wViS34QdKm4XzuqhSrEtVd15am0LuHHyIwpXKoRVFcPNsXXp4TuZX8ERqmKNKd3wnyg+8fgKGk08EeSkJnE/jmU4KnttRfOxGPwYVomn496PeyaR/pGDY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 14:09:19.6949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c58c38e-e83b-4784-83e6-08d72a2efd08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmcyyzAv2Bnon88yENwJSthK1iNwvcbLv/cDSX8nNpI=;
 b=wrhapWyLcnPggGgAkGvof4J04HTvP1RKKeLs2m6fWgzZZaiIp5eyRatSah94kAZUxAMW3KnGO4PXooiFDQyBJ4d8ilxWdyGGPin7os7zdwkyS/jRNSgkAVdb5VwHEY/I+5gq8khxOvT0HFxckwQcAz/+LgnJ7VRv9yhji2O8Dvc=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5lY2Vzc2FyeSBzdXBwb3J0IGZvciBNU1QgRFNDLgooRGlzcGxheSBTdHJlYW0gQ29tcHJl
c3Npb24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQoKdjQ6IFNwbGl0IHBhdGNoc2V0IGFu
ZCByZWJhc2Ugb250byBkcm0tdGlwCnY1OiBDbGVhbiB1cCBmb3JtYXR0aW5nLCBtYWtlIG5ldyBx
dWlyawp2NjogRml4IHR5cG8sIHNwbGl0IGxhc3QgcGF0Y2ggaW4gdHdvCgpEYXZpZCBGcmFuY2lz
ICg2KToKICBkcm0vZHBfbXN0OiBBZGQgUEJOIGNhbGN1bGF0aW9uIGZvciBEU0MgbW9kZXMKICBk
cm0vZHBfbXN0OiBQYXJzZSBGRUMgY2FwYWJpbGl0eSBvbiBNU1QgcG9ydHMKICBkcm0vZHBfbXN0
OiBBZGQgTVNUIHN1cHBvcnQgdG8gRFAgRFBDRCBSL1cgZnVuY3Rpb25zCiAgZHJtL2RwX21zdDog
RmlsbCBicmFuY2gtPm51bV9wb3J0cwogIGRybS9kcF9tc3Q6IEFkZCBuZXcgcXVpcmsgZm9yIFN5
bmFwdGljcyBNU1QgaHVicwogIGRybS9kcF9tc3Q6IEFkZCBoZWxwZXJzIGZvciBNU1QgRFNDIGFu
ZCB2aXJ0dWFsIERQQ0QgYXV4CgogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
aGVscGVycy5jIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAg
ICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAg
ICAgICAgICB8ICAzMiArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
ICAgICAgICAgfCAxNjggKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwX21zdC5jICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Rpc3AuYyAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZHBfbXN0LmMgICAgICAgIHwgICAyICstCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVy
LmggICAgICAgICAgICAgICAgICAgfCAgIDcgKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxw
ZXIuaCAgICAgICAgICAgICAgIHwgICA4ICstCiA5IGZpbGVzIGNoYW5nZWQsIDIwNSBpbnNlcnRp
b25zKCspLCAzMCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
