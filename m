Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB6B6D83
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5671C72AC7;
	Wed, 18 Sep 2019 20:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730072.outbound.protection.outlook.com [40.107.73.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD90F72ABE;
 Wed, 18 Sep 2019 20:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDPt1VjDKpe0l4A9CYAq8H1Y0tTnE4oEuMdZvfVMCPYx67E2euFpD6B4XZi16nhJtlz4GLvFNSCbeHl0C+0mH9Wc95zLP9SL8JJw1R1kpDoXNlBJTNpf2sC7DhztzoYk6baA/eA5efvqdKUf6N++R6lvSekyj+nnQ8C3akpcFD/JGjXSqKulvv27WsQbPa76eVCxqVgolsoN2s/AlKKHVc4FWk3nU339Yd5unzFHA03WKAGWvv7SRzR/0Td5ikyauenF44m2yEHsHTxpKNOhsICX+BNrWOJi6+7UxKZaZkZv4TbUhJ4+tVAPLoRQ/ogPeWNDbbtML3ltgzxEqV1dIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p621iuph0vsvd4Mm9f01nW7utFUORSyluAkxanbCAvo=;
 b=Wm8lIt1yoyh24xC7nx/D+aSMY3wbHBo+jG6dpW2hpl7lyQn1553k4Hl6clZWugwmLZaBvQfDs7TXOFwk/NPFtJm2sp9qHUoWr57yJSDlyp0E9bqDqVB7ba5EgOUsk3FaLZVMmYbX7lhk4xXc1fK0loyrC1qIoGMSgUOk2dLvYq2wRRYXvTKnWozV7PxeMXhF8sBKZUfr77Hh7p6JT9YMAzl2+1j6oaNrk5dJ993V9OlDrAQbWOQINyHUc9/hPTtUtgZASLO46WaU0SZylz8GwPtpS3DGjYK0kPd5TbAg+S3lSZ0ZjwTJLAF9BdCE9BfoNRHEaWf1bmh3ZoCpzrhhrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 MN2PR12MB3422.namprd12.prod.outlook.com (2603:10b6:208:ce::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 20:26:56 +0000
Received: from DM3NAM03FT058.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Wed, 18 Sep 2019 20:26:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT058.mail.protection.outlook.com (10.152.82.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:26:55 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:26:54 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/15]  DSC MST support for AMDGPU
Date: Wed, 18 Sep 2019 16:26:37 -0400
Message-ID: <cover.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(428003)(199004)(189003)(50226002)(16586007)(126002)(486006)(36756003)(426003)(50466002)(5660300002)(2351001)(86362001)(54906003)(14444005)(476003)(2906002)(8936002)(6916009)(305945005)(26005)(2616005)(186003)(81166006)(478600001)(81156014)(316002)(7696005)(2876002)(336012)(53416004)(8676002)(48376002)(4326008)(47776003)(70206006)(51416003)(450100002)(6666004)(356004)(70586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3422; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e0b112e-1520-4246-7116-08d73c768c8a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MN2PR12MB3422; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3422:
X-Microsoft-Antispam-PRVS: <MN2PR12MB342211C86863C8E82E163568E48E0@MN2PR12MB3422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2VvuupFiF6MGzSLu2jQ7Egxj65ie7iNT4/nVd3uAyyg+EEOPgP+96ciID1YF6izD1JGFlkA0DTqF+UctC3EsxQNfpstI6b/oUPedxtKbF/aq/tSVkRAGc5nDhlsknnOaL2PD1e96GDUR8bioOFGW+IUb0IXB9URDuMuQf5vWzx2zJDIXLxgYi1UqLqSFjznRAm7x8TtxcXug8Md/PtK1ANlvYxUxOK15Ac4DMyzeMN8mvILAh3r5hEKXonMkmVMOSEkC/wYqAE33pmZv/skxv6iuUxsK3ZY6j5XVIAX5XXSGOd35XC32VqMnSEocCpWxeot2fCnPW6xrmoxT6FGZGJqQbdZi0zUIzBj9qrhBRCzy7mlgq0qpe+r4cj/DxOH3/2JQZENRYsGbd/OI9hDwrLdIDKiyK2MfkTUv976nscg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:26:55.6604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0b112e-1520-4246-7116-08d73c768c8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p621iuph0vsvd4Mm9f01nW7utFUORSyluAkxanbCAvo=;
 b=ljlBpumeCWx+Ch6/Z8saTvZqJr+BRtXqgeuWrLXqGYDQH3MbY41LEQProds65KPd6aNTEHnOYwwTc9Fp78v1nzu1LuRUwYS2Vyu8wUjD2P/2JeoqhEi5bURCV6mLKqivQo3N0OGgaaILwTAx1zQH4atOhe80aT2oba99PbGnpw8=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKVGhpcyBzZXQgb2Yg
cGF0Y2hlcyBpcyBhIGNvbnRpbnVhdGlvbiBvZiBEU0MgZW5hYmxlbWVudApwYXRjaGVzIGZvciBB
TURHUFUuIFRoaXMgc2V0IGVuYWJsZXMgRFNDIG9uIE1TVC4KCkZpcnN0IDMgcGF0Y2hlcyBhZGQg
YXRvbWljIGNoZWNrIGZ1bmN0aW9uYWxpdHkgdG8KZW5jb2RlciBhbmQgY29ubmVjdG9yIHRvIGFs
bG9jYXRlIGFuZCByZWxlYXNlIFZDUEkKc2xvdHMgb24gZWFjaCBzdGF0ZSBhdG9taWMgY2hlY2su
IFRoZXNlIGNoYW5nZXMKdXRpbGl6ZSBuZXdseSBhZGRlZCBkcm1fbXN0X2hlbHBlciBmdW5jdGlv
bnMgZm9yCmJldHRlciB0cmFja2luZyBvZiBWQ1BJIHNsb3RzLgoKT3RoZXIgMTIgcGF0Y2hlcyBo
YXZlIGJlZW4gaW50cm9kdWNlZCBpbiBtdWx0aXBsZQppdGVyYXRpb25zIHRvIHRoZSBtYWlsaW5n
IGxpc3QgYmVmb3JlLiBUaGVzZSBwYXRjaGVzIHdlcmUKZGV2ZWxvcGVkIGJ5IERhdmlkIEZyYW5j
aXMgYXMgcGFydCBvZiBoaXMgd29yayBvbiBEU0MuCgpEYXZpZCBGcmFuY2lzICgxMik6CiAgZHJt
L2RwX21zdDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1vZGVzCiAgZHJtL2RwX21zdDog
UGFyc2UgRkVDIGNhcGFiaWxpdHkgb24gTVNUIHBvcnRzCiAgZHJtL2RwX21zdDogQWRkIE1TVCBz
dXBwb3J0IHRvIERQIERQQ0QgUi9XIGZ1bmN0aW9ucwogIGRybS9kcF9tc3Q6IEZpbGwgYnJhbmNo
LT5udW1fcG9ydHMKICBkcm0vZHBfbXN0OiBBZGQgaGVscGVycyBmb3IgTVNUIERTQyBhbmQgdmly
dHVhbCBEUENEIGF1eAogIGRybS9kcF9tc3Q6IEFkZCBuZXcgcXVpcmsgZm9yIFN5bmFwdGljcyBN
U1QgaHVicwogIGRybS9hbWQvZGlzcGxheTogVXNlIGNvcnJlY3QgaGVscGVycyB0byBjb21wdXRl
IHRpbWVzbG90cwogIGRybS9hbWQvZGlzcGxheTogSW5pdGlhbGl6ZSBEU0MgUFBTIHZhcmlhYmxl
cyB0byAwCiAgZHJtL2FtZC9kaXNwbGF5OiBWYWxpZGF0ZSBEU0MgY2FwcyBvbiBNU1QgZW5kcG9p
bnRzCiAgZHJtL2FtZC9kaXNwbGF5OiBXcml0ZSBEU0MgZW5hYmxlIHRvIE1TVCBEUENECiAgZHJt
L2FtZC9kaXNwbGF5OiBNU1QgRFNDIGNvbXB1dGUgZmFpciBzaGFyZQogIGRybS9hbWQvZGlzcGxh
eTogVHJpZ2dlciBtb2Rlc2V0cyBvbiBNU1QgRFNDIGNvbm5lY3RvcnMKCk1pa2l0YSBMaXBza2kg
KDMpOgogIGRybS9hbWRncHU6IEFkZCBlbmNvZGVyIGF0b21pYyBjaGVjawogIGRybS9hbWRncHU6
IEFkZCBjb25uZWN0b3IgYXRvbWljIGNoZWNrCiAgZHJtL2FtZGdwdTogdmFsaWRhdGUgbXN0IHRv
cG9sb2d5IGluIGF0b21pYyBjaGVjawoKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyB8IDE1MyArKysrKysKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uaCB8ICAgMyArCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgfCAgMzcgKy0KIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMgICB8IDQ1MSArKysrKysrKysrKysrKysrKy0KIC4uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmggICB8ICAgNCArCiAuLi4vZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGlua19od3NzLmMgICAgfCAgIDMgKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMgIHwgICAzICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8ICAgNyArLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9yZXNvdXJjZS5oIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4
X2Rldi5jICAgICAgICAgICAgICB8ICAxMiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxw
ZXIuYyAgICAgICAgICAgICAgIHwgIDM0ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jICAgICAgICAgfCAxNzQgKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZHBfbXN0LmMgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmMgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2RwX21zdC5jICAgICAgICB8ICAgMiArLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5o
ICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVy
LmggICAgICAgICAgICAgICB8ICAgOCArLQogMTcgZmlsZXMgY2hhbmdlZCwgODY2IGluc2VydGlv
bnMoKyksIDM5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
