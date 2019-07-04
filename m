Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209765FD38
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513AC6E3AE;
	Thu,  4 Jul 2019 19:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700077.outbound.protection.outlook.com [40.107.70.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D596E3AE;
 Thu,  4 Jul 2019 19:06:22 +0000 (UTC)
Received: from BN8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:60::22)
 by BN6PR12MB1841.namprd12.prod.outlook.com (2603:10b6:404:103::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 19:06:21 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0009.outlook.office365.com
 (2603:10b6:408:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.17 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:20 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:19 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/10] Enable MST Aux devices (v2)
Date: Thu, 4 Jul 2019 15:05:09 -0400
Message-ID: <20190704190519.29525-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(428003)(53754006)(199004)(189003)(5820100001)(6666004)(356004)(47776003)(478600001)(86362001)(2876002)(305945005)(1076003)(8676002)(53936002)(81156014)(81166006)(72206003)(426003)(70586007)(26005)(54906003)(126002)(5660300002)(186003)(50226002)(2906002)(316002)(77096007)(68736007)(8936002)(2616005)(50466002)(486006)(4326008)(70206006)(476003)(2870700001)(36756003)(110136005)(49486002)(336012)(23676004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1841; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf1f90f9-fef5-4457-13d5-08d700b2b31d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1841; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1841:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1841CFEBDCC46BA266B88A6982FA0@BN6PR12MB1841.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Oaj//xcd9X/T4RZw1rKYYCEHCd42s6EQPkLp4TT8v7k/Qeme8ELngsXSnN7MFlOI33pZ2ue1mZyItXkMBGQ7+OmHmw1BeLtDcq5s39tOe5Hd20J/kDJoXqfxcRcEop3fi5ysLDGqIGHJHFYfAxjGRHNL/+4Cz79Qr+Lo4eb5UAxSioty3pgkMZmq+KZ46lC+zfN7TT5wJ3ctfkiIyG3iNMxluhE7BX0AmNiqLWyU0TigukhjQfJUjku1JsHiY1igSJD92AzE3XWhZl4M0Ele1rPWskGsJZkz95S3kYWCPcbYuNHpGJYn4PVE7zNzethShE6bCudaYSmNUhKxs4qiGecRHaOK2XnJioCDzOVumtYgQZ8RS0nVJ8ej+IppKkff2rxRF72BkMcBcaBJ2g7MfPzK/+NrhecLzmF9wGcRIvA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:20.2508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1f90f9-fef5-4457-13d5-08d700b2b31d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1841
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi8ZeDBProilqFYO+bSNQQII9lQsOzp3DUmrK3KRsqc=;
 b=LroZ9Xoqr7JyXmBZB017miOFsL8b8R74zab3xuZ9U/n8vz4pAetXNL64fD0o8nru28vViZJ6l/IVOAVM1zBkJ8AtrFvPF8rkclNvCSlqXkAlHpJe5/4gXbNoV+jPIz4w8llyI/VQ+tDl443x4R2UUCMVRIlhm4G66S3uNYedh18=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpIaSBhbGwsCgpIZXJlJ3MgdGhlIHNl
Y29uZCByZXZpc2lvbiBvZiBwYXRjaGVzIHRvIGVuYWJsZSBtc3QgYXV4IGRldmljZXMuCgp2MiBm
aXhlcyBhbiBhdXggZGV2aWNlIHVucmVnaXN0cmF0aW9uIGlzc3VlIGR1cmluZyBkcml2ZXIgdW5s
b2FkLiBTZWUKcGF0Y2ggMi8xMCBmb3IgZGV0YWlscy4gQ29uc2VxdWVudGx5LCBkcml2ZXJzIHN1
cHBvcnRpbmcgbXN0IGFyZQptb2RpZmllZCB0byB1c2UgdGhlIG5ldyBtc3QgY29ubmVjdG9yIGxh
dGUgcmVnaXN0ZXIgYW5kIGVhcmx5IHVucmVnaXN0ZXIKaGVscGVycy4KClRoYW5rcywKTGVvCgpM
ZW8gTGkgKDkpOgogIGRybS9kcDogVXNlIG5vbi1jeWNsaWMgaWRyCiAgZHJtL3N5c2ZzOiBBZGQg
bXN0cGF0aCBhdHRyaWJ1dGUgdG8gY29ubmVjdG9yIGRldmljZXMKICBkcm0vbm91dmVhdTogVXNl
IGNvbm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50CiAgZHJtL2JyaWRnZS9hbmFsb2dp
eC1hbng3OHh4OiBVc2UgY29ubmVjdG9yIGtkZXYgYXMgYXV4IGRldmljZSBwYXJlbnQKICBkcm0v
YW1kL2Rpc3BsYXk6IFVzZSBjb25uZWN0b3Iga2RldiBhcyBhdXggZGV2aWNlIHBhcmVudAogIGRy
bS9pOTE1OiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0aW9uCiAgZHJtL25vdXZl
YXUva21zL252NTA6IEltcGxlbWVudCBNU1QgQXV4IGRldmljZSByZWdpc3RyYXRpb24KICBkcm0v
cmFkZW9uOiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0aW9uCiAgZHJtL2FtZC9k
aXNwbGF5OiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0aW9uCgpWaWxsZSBTeXJq
w6Rsw6QgKDEpOgogIGRybS9kcF9tc3Q6IEVuYWJsZSByZWdpc3RyYXRpb24gb2YgQVVYIGRldmlj
ZXMgZm9yIE1TVCBwb3J0cwoKIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMgICB8ICAyNiArKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4
eHguYyAgICAgfCAgMjIgKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAg
ICAgICAgICAgfCAgMTkgKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
ICAgICAgICAgfCAxMzcgKysrKysrKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5
c2ZzLmMgICAgICAgICAgICAgICAgICAgfCAgMjMgKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwX21zdC5jICAgfCAgMjkgKysrLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jICAgICAgIHwgIDIwICsrKwogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9jb25uZWN0b3IuYyAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9kcF9tc3QuYyAgICAgICAgfCAgMjIgKysrCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmggICAgICAgICAgICAgICAgICAgfCAgIDQgKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9o
ZWxwZXIuaCAgICAgICAgICAgICAgIHwgIDExICsrCiAxMSBmaWxlcyBjaGFuZ2VkLCAyODUgaW5z
ZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
