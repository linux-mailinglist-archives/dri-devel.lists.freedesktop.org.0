Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B020B1F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142AD8976D;
	Thu, 16 May 2019 15:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710067.outbound.protection.outlook.com [40.107.71.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8E89745;
 Thu, 16 May 2019 15:26:54 +0000 (UTC)
Received: from SN1PR12CA0084.namprd12.prod.outlook.com (2603:10b6:802:21::19)
 by BN6PR1201MB0050.namprd12.prod.outlook.com (2603:10b6:405:4e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21; Thu, 16 May
 2019 15:26:52 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by SN1PR12CA0084.outlook.office365.com
 (2603:10b6:802:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 15:26:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 15:26:51 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 10:26:50 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] Add DP MST AUX devices
Date: Thu, 16 May 2019 11:17:56 -0400
Message-ID: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(72206003)(8936002)(2616005)(4326008)(8676002)(126002)(23676004)(5820100001)(86362001)(5660300002)(476003)(81166006)(110136005)(450100002)(81156014)(50466002)(53416004)(53936002)(50226002)(305945005)(36756003)(426003)(336012)(478600001)(70586007)(2870700001)(186003)(486006)(70206006)(356004)(68736007)(2906002)(47776003)(86152003)(2876002)(7696005)(77096007)(316002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0050; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 759de67c-b063-495f-eee3-08d6da12eba3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR1201MB0050; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0050:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0050B5AA0706AF831135173C820A0@BN6PR1201MB0050.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fcWm+w/vNgUxPKtzBRERfi54fk7vuBd7yyBfPmAOBdLm+BZdeIMpsXK/jlNsafJmrFz3CeDoWBnwaztvWHxW/5s10Q+DVNq38XNgY47MCT5F8DOjVDwA3o/8JmTCnyXyPks1+HwbhGZlEFhP5GBZneaRNK/4RtzMSQzu4aMAUGUlSC8NCQ6Zm+b46eLcfHcLe9sEVrdHbKttFkaDOqwibLmPTl2f4uDeq/3T9uHfpNNPB/cky0BdT6N0mdTmA61HszlsblWF+Ub/MDIS8BXJ0Tx7Y/Mt5bOEr47cYyL4ceAtV4+Cf/q/JnC+G0aVl/XuViVU1KaJcDITbJ14hKrZ5GrbBLu+zMjt73xOcDApEjUw9J6vkoDMILrkfnskuxRkOrFdWyhfEvbWNSsAllYtTWQ+qcLh6W3Gfhq0wCtAcm4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 15:26:51.5708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 759de67c-b063-495f-eee3-08d6da12eba3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0050
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or4SxxCg8UbImNw220W0tjh4dZ4t+0u97iTtBTBqumE=;
 b=THfyS2oVWmtAJD4SsF/thUYhnQ70DmXw5IM8CsKk7RZlKSlnHJFP2+6eTOqVLP3q68uCXzTZn7Mu+KDGzYh7Mnn7+jzNbZJ7/qoebxfN8BbcVP2NF7nhlatDXIWVfGExx3fiShHDrEP6OhqeSSSc5FufgCxvnvvAKtKaP7JTo9Y=
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpUaGlzIHNlcmllcyBhZGRzIHN1cHBv
cnQgZm9yIE1TVCBBVVggZGV2aWNlcy4gCgpBIG1vcmUgZGVzY3JpcHRpdmUgJ21zdHBhdGgnIGF0
dHJpYnV0ZSBpcyBhbHNvIGFkZGVkIHRvIE1TVCBjb25uZWN0b3IKZGV2aWNlcy4gSW4gYWRkaXRp
b24sIHRoZSBEUCBhdXggZGV2aWNlIGlzIG1hZGUgdG8gYmUgYSBjaGlsZCBvZiB0aGUKY29ycmVz
cG9uZGluZyBjb25uZWN0b3IncyBkZXZpY2Ugd2hlcmUgcG9zc2libGUgKCopLiBUaGlzIGFsbG93
cyB1ZGV2CnJ1bGVzIHRvIHByb3ZpZGUgZGVzY3JpcHRpdmUgc3ltbGlua3MgdG8gdGhlIEFVWCBk
ZXZpY2VzLgoKKCopIFRoaXMgY2FuIG9ubHkgYmUgZG9uZSBvbiBkcml2ZXJzIHRoYXQgcmVnaXN0
ZXIgdGhlaXIgY29ubmVjdG9yIGFuZAphdXggZGV2aWNlcyB2aWEgZHJtX2Nvbm5lY3Rvcl9yZWdp
c3RlcigpIGFuZCBkcm1fZHBfYXV4X3JlZ2lzdGVyKCkKcmVzcGVjdGl2ZWx5LiBUaGUgY29ubmVj
dG9yIGFsc28gbmVlZHMgdG8gYmUgcmVnaXN0ZXJlZCBiZWZvcmUgdGhlIGF1eApkZXZpY2UuCgpM
ZW8gTGkgKDYpOgogIGRybS9kcDogVXNlIG5vbi1jeWNsaWMgaWRyCiAgZHJtL2RwLW1zdDogVXNl
IGNvbm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50CiAgZHJtL3N5c2ZzOiBBZGQgbXN0
cGF0aCBhdHRyaWJ1dGUgdG8gY29ubmVjdG9yIGRldmljZXMKICBkcm0vYW1kL2Rpc3BsYXk6IFVz
ZSBjb25uZWN0b3Iga2RldiBhcyBhdXggZGV2aWNlIHBhcmVudAogIGRybS9icmlkZ2UvYW5hbG9n
aXgtYW54Nzh4eDogVXNlIGNvbm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50CiAgZHJt
L25vdXZlYXU6IFVzZSBjb25uZWN0b3Iga2RldiBhcyBhdXggZGV2aWNlIHBhcmVudAoKVmlsbGUg
U3lyasOkbMOkICgxKToKICBkcm0vZHBfbXN0OiBSZWdpc3RlciBBVVggZGV2aWNlcyBmb3IgTVNU
IHBvcnRzCgogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMg
ICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jICAg
ICAgICAgIHwgIDIyICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAg
ICAgICAgICAgICAgICB8ICAxNyArKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jICAgICAgICAgICAgICB8IDEwNiArKysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fc3lzZnMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIzICsrKysrCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jICAgICAgICB8ICAgMiAr
LQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDQgKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICAg
fCAgIDYgKysKIDggZmlsZXMgY2hhbmdlZCwgMTUyIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9u
cygtKQoKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
