Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC219959C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F646EB38;
	Thu, 22 Aug 2019 13:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790078.outbound.protection.outlook.com [40.107.79.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612026EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dy462jDp/+ZkYw4sFkpJVMgitIGiML5DVXDNcFbJTEEq+3ZLUi1ksQXmI3Ln+Kz7KvnZdvqtUvtaxbefb4x8FWUPGDXqW/JJlvHpoR/tpXCik9ETSvJRVvu6JZB+y40d1E4j7kZtikqmrh//ZbzsN2ntlHUZTEb4IZ/juPxzayzi1ax4lF6L9V3z8walFyzkutIvO2p9o/B0sBXi69aJXmEvltn4h835ZYIkEvaygVhdWdwlBPgqSNrcwbsWHs5MEYCd6BdNKH3L+7SsHIFjRR/sRSZPJ6jM9i3geiQp2jIZzuTZ95UQ1rFoXI5vMWgwxspH62ZeZRx6sPPPGq+LBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNwlk+wubGNhFxcMt/XAg8ooX2AVWJu4dpmra59d0AY=;
 b=B2v50BFPxK7GnJ96qII4r+kAcO/44qUu5v30zL2pOsLO3AfxyED0rSkIGFI2oh94FIOjEosurM3zvFRWHQkZ7YtA3ZKjZjYE2rytJboGk0HUNSZVYGMC7qdpbChfdMOHBdqGvJyVVJgqCke2YaaltLGjyMZC1boQkbTFpdKXyvCHdYj8MJ9lWH9jMxndCG/DYQDL0DpkFEoiv+aA8B8BwUiHlsuXkzkN0HyFSWnDhhA0jv+kQ1myYaos0/xUdtaE5PQDe3+WZjM1kKeHbnNFbpLQ4vCdtNZWz8v2BiTS/Ad86HL8aUponvWHCu+GN7vyOZZ32D1n/UqvgyCDpdj8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0077.namprd12.prod.outlook.com (2603:10b6:0:57::21) by
 MWHPR12MB1533.namprd12.prod.outlook.com (2603:10b6:301:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 13:57:46 +0000
Received: from CO1NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by DM3PR12CA0077.outlook.office365.com
 (2603:10b6:0:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.17 via Frontend
 Transport; Thu, 22 Aug 2019 13:57:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT023.mail.protection.outlook.com (10.152.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Thu, 22 Aug 2019 13:57:44 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 22 Aug 2019 08:57:44 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/5] MST DSC support in drm-mst
Date: Thu, 22 Aug 2019 09:57:36 -0400
Message-ID: <20190822135741.12923-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(16586007)(81166006)(336012)(5660300002)(476003)(47776003)(2616005)(426003)(51416003)(36756003)(126002)(26005)(316002)(8676002)(1076003)(6916009)(486006)(186003)(8936002)(4326008)(2906002)(50226002)(4744005)(356004)(70206006)(70586007)(2351001)(53936002)(49486002)(48376002)(81156014)(478600001)(50466002)(305945005)(86362001)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1533; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adc77334-022f-4c15-3c2b-08d72708b553
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1533; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1533:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1533395118CD2B3266CC5322EFA50@MWHPR12MB1533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 01371B902F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fHyKGD/Rb0rGj1ZkR0Th3HjxRpbJD80hM7cmecXcDVYzCqzan285XCVfyf6fxnvjUb6i1T3VNdfesTuNvvDCzfmAbZfvZ8p9Z4pZxLrfIu+y7G1ZxHFKvV7Oy5gqx6O7rRaTyWbjAMKiQo0xSo/X1xy8W5jZ/RWBlltErBif30IB5coaPdROINzVKPGLBuFYClCe2qxw5qzwmHBC3fpAsXOJliWotzu0Rx4PapprEnzUBYAc4Qkyq9/QD/FSERETBp8IerirzNE3AwcTc3YIozta2llYg08n14pReGlVlI0nMokz31oKbQf2ww65ug2qxyWyy0+bo/Dllqoc4q12Cm4NDUDqcTx/ArwCvoBCZpdvW0RWsmNqX6fjRDnYpAjUAmbb0dAqHb8oo4+VKcp0tY794xTXmd/nl9dkQhrAfGM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 13:57:44.8524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc77334-022f-4c15-3c2b-08d72708b553
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNwlk+wubGNhFxcMt/XAg8ooX2AVWJu4dpmra59d0AY=;
 b=Y/akWrXNhHvI1SpUwu9Nh95GIKWAqaNt7EvXrM7iVQq3coq01ZYrmGP7zV9eh9EqqMjpTuuoRPi1iiavE/4FkEDbLET2bol7l3/fEujg0e3tjnMGjDBshyi2F+ibwu7dZ3jTnU9XFOrvoVzpKhAY7eSdf8wgvlgUlIHNhr7Hz3s=
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

QWRkIG5lY2Vzc2FyeSBzdXBwb3J0IGZvciBNU1QgRFNDLgooRGlzcGxheSBTdHJlYW0gQ09tcHJl
c3Npb24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQoKdjQ6IFNwbGl0IHBhdGNoc2V0IGFu
ZCByZWJhc2Ugb250byBkcm0tdGlwCgpEYXZpZCBGcmFuY2lzICg1KToKICBkcm0vZHAtbXN0OiBB
ZGQgUEJOIGNhbGN1bGF0aW9uIGZvciBEU0MgbW9kZXMKICBkcm0vZHAtbXN0OiBQYXJzZSBGRUMg
Y2FwYWJpbGl0eSBvbiBNU1QgcG9ydHMKICBkcm0vZHAtbXN0OiBBZGQgTVNUIHN1cHBvcnQgdG8g
RFAgRFBDRCBSL1cgZnVuY3Rpb25zCiAgZHJtL2RwLW1zdDogRmlsbCBicmFuY2gtPm51bV9wb3J0
cwogIGRybS9kcC1tc3Q6IEFkZCBoZWxwZXJzIGZvciBxdWVyeWluZyBhbmQgZW5hYmxpbmcgTVNU
IERTQwoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jICAgICAgfCAgMTIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyNDMgKysrKysrKysrKysrKysrKysrKysrKysr
KysKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAgIDggKy0KIDQgZmls
ZXMgY2hhbmdlZCwgMjYwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
