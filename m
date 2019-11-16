Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B5FF5E1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405BD6E1B8;
	Sat, 16 Nov 2019 22:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790050.outbound.protection.outlook.com [40.107.79.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148C56E054;
 Sat, 16 Nov 2019 22:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZvXapIaVKHnNHyQSG9dEdyqvsIOVrXv05iOJpttWVIqZziPwEeY6ZWV8TWnQ977/0HqcVi1dI62KTEejs2wid7UPERQkP69rRqhyUcHV+yujCL+vjoJgBd/Z5yn0+zp4+GtWb1LtZXA6seUEunFqxtiOTGkKSjq023EvJUlu6/nKkNtx8u+CdgzQG2WSN0Q7wmYPLjxQxoJDRwBMmmj34kmyqvZmlWkERdGtKSprao55RVeAfIDyL/4ULXKJoO3ZXqw+qnE3WUC1gMH0D/5tpMXko2PtAFVMusKm6TbPz6Hz0CPVY0ASxjqKGDuql5T9tTqzh4wDBHS3d+GmaTTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAYNxOnyzH6qFx4+yokhIpnQyKg7L05s06t7ATwH82E=;
 b=Mn1wMtayBarVtMWRhWTzRw+w99Seck8bT283hFMzgmJwmx1kUYJdXpO3JZVuXkAl/pYA2FNV3JYDcbcmKrUp6mm9/SvncwQ7HpAvPUbp+yzXa68LfXgph2wXOFmROvKx9Gxaps8KmXwhsN8F4CZXFnTcFaxyj1W3Wmn+BTDhSZUAUdZcRM+sVpO1rfScHKXALLg7H9sB6Dz0KPnhWZGAuk5XrXQAtuHPSV5V094soVgoAgreAXKVdjfZE5WXJRde/O651g7v+dqogvLTFC6dBr4HaeVe6N536Vui58UreVhBZUUQt8JYnO46LXuzcfl55zBIcfLSH9u8QX3nbMaIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by DM5PR1201MB2552.namprd12.prod.outlook.com
 (2603:10b6:3:e3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.29; Sat, 16 Nov
 2019 22:01:33 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:31 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:30 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:30 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 00/17] DSC MST support for DRM and AMDGPU
Date: Sat, 16 Nov 2019 17:01:11 -0500
Message-ID: <20191116220128.16598-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(428003)(189003)(199004)(53416004)(70586007)(2906002)(47776003)(81156014)(81166006)(70206006)(8676002)(356004)(6666004)(50226002)(2876002)(8936002)(1076003)(6916009)(486006)(2616005)(126002)(476003)(336012)(26005)(426003)(7696005)(51416003)(186003)(5660300002)(478600001)(50466002)(48376002)(14444005)(4326008)(305945005)(86362001)(36756003)(16586007)(316002)(54906003)(2351001)(63370400001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2552; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:3; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85efeb72-799e-4cd0-d8dc-08d76ae08a40
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2552:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2552082FEAB525036EC308D5E4730@DM5PR1201MB2552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOvA8buReH/eYwOWQ/qiNG2EXFe7GsDfAmVxqdLRzwF9b67FBtfPGtXPCf54xw8ZuHXXThsUN2fb0RiI1UccEVxsyljbxotNENBYYI697o05k5m+7/oqdhvnORS5vaJ1jbtQhN1RW6dM+TkUVMb/e5LwYuAr9yyCwIr6UoQRfEYYOH6+h643kZsRfmWMmFlE0ynW7audajoHy6lWl4fWXp5aQf/12TxX6geLi9Mazo9IRMpJmTHBjf0pwIbyrzNBjCaZu7b6mvucgU2DloHe3m1tYL0NJ13h1vIfPFeVmcq3MNUhEZBYYtjQIZNgALtIft37g/FgiKpms25cy1ABhSMDRfcGs2eROkNvBNGPI2jY96yR83gwmIzZS9HPLxVtTVcdJvtv2X7bLJ4T0rDVgPrfAYmSitI4kiX7nQXJCqB4A5+3nj2jrbaK+6TS84ov
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:31.9357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85efeb72-799e-4cd0-d8dc-08d76ae08a40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2552
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAYNxOnyzH6qFx4+yokhIpnQyKg7L05s06t7ATwH82E=;
 b=FHGl71ejdv3yuAGJwP8UDYMGW0cPXWYCNgEN4slUOwFOW4V2ZdB91K7VJR7VA7ZIohE7lSwOa0N9lQ/J2kSTQ3hdsuwUmqkHQpIABR0Z5P5bBrHsReUK7kr0NvcJrhY6EYzdgaoJqDKoz7xtgPMbo0BqZzjxhMTLidu2NOK0bqo=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKUGF0Y2hlcyBhcmUg
YmFzZWQgb2YgYW1kLXN0YWdpbmctZHJtLW5leHQsIHRoZSBmb2xsb3cgdXAKc2V0IG9mIHBhdGNo
ZXMgd2lsbCBiZSBzZW50IGZvciBkcm0tdGlwCgpUaGlzIHNldCBvZiBwYXRjaGVzIGlzIGEgY29u
dGludWF0aW9uIG9mIERTQyBlbmFibGVtZW50CnBhdGNoZXMgZm9yIEFNREdQVS4gVGhpcyBzZXQg
ZW5hYmxlcyBEU0Mgb24gTVNULiBJdCBhbHNvCmNvbnRhaW5zIGltcGxlbWVudGF0aW9uIG9mIGJv
dGggZW5jb2RlciBhbmQgY29ubmVjdG9yCmF0b21pYyBjaGVjayByb3V0aW5lcy4KClRoZXNlIHBh
dGNoZXMgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gbXVsdGlwbGUKaXRlcmF0aW9ucyB0byB0aGUg
bWFpbGluZyBsaXN0IGJlZm9yZS4gVGhlc2UgcGF0Y2hlcyB3ZXJlCmRldmVsb3BlZCBieSBEYXZp
ZCBGcmFuY2lzIGFzIHBhcnQgb2YgaGlzIHdvcmsgb24gRFNDLgoKdjI6IHNxdWFzaGVkIHByZXZp
b3VzbHkgMyBzZXBhcmF0ZSBhdG9taWMgY2hlY2sgcGF0Y2hlcywKc2VwYXJhdGUgYXRvbWljIGNo
ZWNrIGZvciBkc2MgY29ubmVjdG9ycywgdHJhY2sgdmNwaSBhbmQKcGJuIG9uIGNvbm5lY3RvcnMu
Cgp2MzogTW92ZWQgbW9kZXNldCB0cmlnZ2VyIG9uIGFmZmVjdGVkIE1TVCBkaXNwbGF5cyB0byBE
Uk0KCnY0OiBGaXggd2FybmluZ3MsIHVzZSBjdXJyZW50IG1vZGUncyBicGMgcmF0aGVyIHRoYW4g
ZGlzcGxheSdzCm1heGltdW0gY2FwYWJsZSBvbmUKCnY1OiBNb3ZpbmcgYnJhbmNoJ3MgYmFuZHdp
ZHRoIHZhbGlkYXRpb24gdG8gRFJNLApBZGRlZCBmdW5jdGlvbiB0byBlbmFibGUgRFNDIHBlciBw
b3J0IGluIERSTQoKdjY6IENvbXB1dGUgZmFpciBzaGFyZSB1c2VzIERSTSBoZWxwZXIgZm9yIEJX
IHZhbGlkYXRpb24KCnY3OiBBZGQgaGVscGVyIHRvIG92ZXJ3cml0ZSBQQk4gZGl2aWRlciBwZXIg
c2xvdCwKICAgIEFkZCBoZWxwZXIgZnVuY3Rpb24gdG8gdHJpZ2dlciBtb2Rlc2V0IG9uIGFmZmVj
dGVkIERTQyBjb25uZWN0b3JzCmluIERSTQoKRGF2aWQgRnJhbmNpcyAoOSk6CiAgZHJtL2RwX21z
dDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1vZGVzCiAgZHJtL2RwX21zdDogUGFyc2Ug
RkVDIGNhcGFiaWxpdHkgb24gTVNUIHBvcnRzCiAgZHJtL2RwX21zdDogQWRkIE1TVCBzdXBwb3J0
IHRvIERQIERQQ0QgUi9XIGZ1bmN0aW9ucwogIGRybS9kcF9tc3Q6IEZpbGwgYnJhbmNoLT5udW1f
cG9ydHMKICBkcm0vZHBfbXN0OiBBZGQgaGVscGVycyBmb3IgTVNUIERTQyBhbmQgdmlydHVhbCBE
UENEIGF1eAogIGRybS9hbWQvZGlzcGxheTogSW5pdGlhbGl6ZSBEU0MgUFBTIHZhcmlhYmxlcyB0
byAwCiAgZHJtL2FtZC9kaXNwbGF5OiBWYWxpZGF0ZSBEU0MgY2FwcyBvbiBNU1QgZW5kcG9pbnRz
CiAgZHJtL2FtZC9kaXNwbGF5OiBXcml0ZSBEU0MgZW5hYmxlIHRvIE1TVCBEUENECiAgZHJtL2Ft
ZC9kaXNwbGF5OiBNU1QgRFNDIGNvbXB1dGUgZmFpciBzaGFyZQogIGRybS9kcF9tc3Q6IEFkZCBu
ZXcgcXVpcmsgZm9yIFN5bmFwdGljcyBNU1QgaHVicwoKCk1pa2l0YSBMaXBza2kgKDgpOgogIGRy
bS9kcF9tc3Q6IE1hbnVhbGx5IG92ZXJ3cml0ZSBQQk4gZGl2aWRlciBmb3IgY2FsY3VsYXRpbmcg
dGltZXNsb3RzCiAgZHJtL2RwX21zdDogQWRkIERTQyBlbmFibGVtZW50IGhlbHBlcnMgdG8gRFJN
CiAgZHJtL2RwX21zdDogQWRkIGJyYW5jaCBiYW5kd2lkdGggdmFsaWRhdGlvbiB0byBNU1QgYXRv
bWljIGNoZWNrCiAgZHJtL2RwX21zdDogQWRkIGhlbHBlciB0byB0cmlnZ2VyIG1vZGVzZXQgb24g
YWZmZWN0ZWQgRFNDIE1TVCBDUlRDcwogIGRybS9hbWQvZGlzcGxheTogQWRkIFBCTiBwZXIgc2xv
dCBjYWxjdWxhdGlvbiBmb3IgRFNDCiAgZHJtL2FtZC9kaXNwbGF5OiBSZWNhbGN1bGF0ZSBWQ1BJ
IHNsb3RzIGZvciBuZXcgRFNDIGNvbm5lY3RvcnMKICBkcm0vYW1kL2Rpc3BsYXk6IFRyaWdnZXIg
bW9kZXNldHMgb24gTVNUIERTQyBjb25uZWN0b3JzCgogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTE3ICsrKystCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggfCAgIDEgKwogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1faGVscGVycy5jIHwgIDE5ICstCiAuLi4vZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX21zdF90eXBlcy5jICAgfCAzOTUgKysrKysrKysrKysrKysrKy0KIC4uLi9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmggICB8ICAgNSArCiAuLi4vZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMgICAgfCAgIDMgKwogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMgIHwgICAzICsKIC4uLi9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8ICAgNyArLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfYXV4X2Rldi5jICAgICAgICAgICAgICB8ICAxMiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYyAgICAgICAgICAgICAgIHwgIDMzICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jICAgICAgICAgfCA0MDEgKysrKysrKysrKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICAgfCAgIDUgKy0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyAgICAgICB8ICAgNiArLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHBfbXN0LmMgICAgICAgIHwgICAyICstCiBpbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAgIDcgKwogaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgIDE5ICstCiAxNyBmaWxlcyBjaGFu
Z2VkLCA5ODkgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
