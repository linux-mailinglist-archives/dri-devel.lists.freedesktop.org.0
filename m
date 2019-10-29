Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4DE8A09
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440F6E3A4;
	Tue, 29 Oct 2019 13:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CD86E39B;
 Tue, 29 Oct 2019 13:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tbh8wzg4m2AlM0+we/mPr0aKv4Lx2LV+MjYDH7fm7ilx2E3QhDQJ5njM1OFdosoAua9ppL4cPzEawRhElwsmlcFi8mm6iGTNdLhIC0Qs485MWEEKuqRFdJTSmPTnMAQg9rtpXlxV2uCeeegRegrKzTw5C1HencWgFLbhDfi6vxSQDeVdk1dx39mEBMKewO5uBKPQX83+j0Go2QSvg1HUWqBAUzR5KnFRy3APXTkYj/jRurSb4rPZjAf89lCx2z55hW1kmTqjRrBZIpP6VPym87piEHIRuxztswcfs6MBm4CJO8Fx+1ApodO0gnqfeKx2GYMcN1LTNB77dNjVD+pLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK8OQhWG3ghSmIN5C6LBJk9IivZYUG7hyGqjqfaxDRM=;
 b=dIhsL0FfCLHzE7Zo1P5lUtrdm/D645ec7b3ge0BLXFXW7LcAVXe6s19OqwawO/2ZpvefmIQMdwUCs0QlX6GEKFetHcGHECyI9mOVlQMBesO2+lkhd+nxUgIfGgzadmEzkCtYg3QLaQexUh/BwwubzE+uFaUP3LvqlEdOAJEXhtgONaugR5TE8XWGuE7Fj2rUXQ7Os5yW4Li8wADAuDrYFkOsVSQ0ozpgC0ORzc9bKETjGa2XoN8BfUQEWUezlu/3s/h7EwvlH6X5yppTpJCE3hpRgpZdq5K3biPdW5+Q0wpKW7R38byn2ECl4KFejvjzm7I0BQrE0AzyiFK/W25IfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0023.namprd12.prod.outlook.com (2603:10b6:4:1::33) by
 SN1PR12MB2462.namprd12.prod.outlook.com (2603:10b6:802:29::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 13:52:50 +0000
Received: from CO1NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM5PR12CA0023.outlook.office365.com
 (2603:10b6:4:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.17 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT014.mail.protection.outlook.com (10.152.80.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:48 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:47 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:47 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 00/13] DSC MST support for AMDGPU
Date: Tue, 29 Oct 2019 09:52:32 -0400
Message-ID: <20191029135245.31152-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(428003)(199004)(189003)(14444005)(5660300002)(2876002)(47776003)(70586007)(51416003)(4326008)(7696005)(1076003)(186003)(2351001)(70206006)(50226002)(305945005)(48376002)(50466002)(478600001)(54906003)(16586007)(6916009)(316002)(26005)(86362001)(81166006)(81156014)(36756003)(486006)(2616005)(8676002)(476003)(126002)(6666004)(356004)(2906002)(336012)(426003)(8936002)(63370400001)(53416004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2462; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc37e71-ce43-462d-241f-08d75c774943
X-MS-TrafficTypeDiagnostic: SN1PR12MB2462:
X-Microsoft-Antispam-PRVS: <SN1PR12MB246270F3E04479A18F306349E4610@SN1PR12MB2462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvQyGTWDyWoyFRXmSohbB97N6S7RFZpKpWRZkLQAPi1UyLElSQg9ZlPtup5MpMP9K8ODkSU6/66Ik8+of/ipIf4REHmq4MoByCnpcQ9No7/paFQ1YNxernewSFs+tZsTLirNow+1lpF8ljbHlrTFLXI3d4NukiAF0dnQxGcVn5btsN+g0ZvF9Xaq+5uMpubbEHL7hz3cjdV9wQZY/EcRliCiqTuLds8jt36JGjPO3zVoBVfg3X1XyB3dSGm6yNNGmC/1j3S8P2bXQQM/PxukwJTd10JJCQ/FjKQqLWbh7y1ihUkg0NaLih5ACWCJ4zaGaYzEto6fLH4hl1wiYHaltdpqOY6smJJErcvNQ7kiPJ6lczi6HL6mzv+SMn3PWQd2GcIK5GOWmFUb+ucH9DA20+bWYJ5dXkh6G+DnpYWk6dBJDwPpfA6gQdQilF+Rz4+R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:49.3783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc37e71-ce43-462d-241f-08d75c774943
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2462
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK8OQhWG3ghSmIN5C6LBJk9IivZYUG7hyGqjqfaxDRM=;
 b=RRjVFV1NosNcvv5XgxvP1tAuaMjSMlFA4rOxIwMzGIG/U9YbjTGX0YnkesodgDQDth8RiAhVqCqfdAPlR7AA83oY5w2NSjoXvEWv+N0njYt4/X98yrUsXVsidQuDccHYVM/FhAfeMB5noJiC/mOWVSzd82qJwrzdff0pSo5s3KY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=temperror action=none
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
Y3RlZCBNU1QgZGlzcGxheXMgdG8gRFJNCgpEYXZpZCBGcmFuY2lzICgxMCk6CiAgZHJtL2RwX21z
dDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1vZGVzCiAgZHJtL2RwX21zdDogUGFyc2Ug
RkVDIGNhcGFiaWxpdHkgb24gTVNUIHBvcnRzCiAgZHJtL2RwX21zdDogQWRkIE1TVCBzdXBwb3J0
IHRvIERQIERQQ0QgUi9XIGZ1bmN0aW9ucwogIGRybS9kcF9tc3Q6IEZpbGwgYnJhbmNoLT5udW1f
cG9ydHMKICBkcm0vZHBfbXN0OiBBZGQgaGVscGVycyBmb3IgTVNUIERTQyBhbmQgdmlydHVhbCBE
UENEIGF1eAogIGRybS9hbWQvZGlzcGxheTogSW5pdGlhbGl6ZSBEU0MgUFBTIHZhcmlhYmxlcyB0
byAwCiAgZHJtL2FtZC9kaXNwbGF5OiBWYWxpZGF0ZSBEU0MgY2FwcyBvbiBNU1QgZW5kcG9pbnRz
CiAgZHJtL2FtZC9kaXNwbGF5OiBXcml0ZSBEU0MgZW5hYmxlIHRvIE1TVCBEUENECiAgZHJtL2Ft
ZC9kaXNwbGF5OiBNU1QgRFNDIGNvbXB1dGUgZmFpciBzaGFyZQogIGRybS9kcF9tc3Q6IEFkZCBu
ZXcgcXVpcmsgZm9yIFN5bmFwdGljcyBNU1QgaHVicwoKTWlraXRhIExpcHNraSAoMyk6CiAgZHJt
L2FtZC9kaXNwbGF5OiBBZGQgTVNUIGF0b21pYyByb3V0aW5lcwogIGRybS9kcF9tc3Q6IEFkZCBE
U0MgZW5hYmxlbWVudCBoZWxwZXJzIHRvIERSTQogIGRybS9hbWQvZGlzcGxheTogUmVjYWxjdWxh
dGUgVkNQSSBzbG90cyBmb3IgbmV3IERTQyBjb25uZWN0b3JzCgogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTA3ICsrKystCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggfCAgIDUgKwogLi4uL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgIDcwICsrLQogLi4uL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwgNDQ5ICsrKysrKysrKysrKysrKysrLQogLi4u
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaCAgIHwgICA0ICsKIC4uLi9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyAgICB8ICAgMyArCiAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyAgfCAgIDMgKwogLi4uL2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgICA3ICstCiAuLi4vZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmggfCAgIDEgKwogZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9hdXhfZGV2LmMgICAgICAgICAgICAgIHwgIDEyICstCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jICAgICAgICAgICAgICAgfCAgMzMgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgICAgICAgICB8IDI3NyArKysrKysrKysrLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyAgIHwgICAzICstCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2RwX21zdC5jICAgICAgICB8ICAgMiArLQogaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGluY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgICAgICAgICB8ICAxMiArLQogMTcgZmlsZXMgY2hh
bmdlZCwgOTIzIGluc2VydGlvbnMoKyksIDc1IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
