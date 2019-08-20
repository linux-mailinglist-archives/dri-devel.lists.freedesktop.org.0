Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B0A9691E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275546E85B;
	Tue, 20 Aug 2019 19:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700060.outbound.protection.outlook.com [40.107.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A556E858;
 Tue, 20 Aug 2019 19:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6rs3yHjcpk12W4bow9ezwCjhSM6IpqbdmXabMZXRyTeNUqBOGRmL2PlGTTovloOmVJ8KbxKiczU+crG0vW6etrXSJNbt56vLPJwDYQKDgLOU/wFwNN++vbfgtGEIXIiwNJZOkcotGPvVu8zxdiWTluFhNgC1Ucsnnvo0hNnnGo8F7MiYGXQchg1z0JY/yYJjSX5LmW0vn5TyZlt8DfzrpPpKIBSfnERmhN7g95Zx8ETQFSGdHg9g4HnwWc7pZxgVEB5CheSRr8BLRa5ueZnI472uvW9jD61tfKjchK+76qihhqpc0qXy7fO+9QItkME4A/Te3S6Y/Yj6t2g1qeing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcumYwHSxR5cVhRbpN3wgIzuxKhPJ9GdIZAOCKyyPmo=;
 b=J9VlfM71hsO5Ef4j+qq04RMmZlM717k14gOZaVEka1/KVTLob6OuQxg2DuUJ9GeBSsKRqGXj69/qRcxXQOSdYHpBIjexLkPu4rZ9NRgDfHPxGbECOpjHZgCF6Ykqshg7nts4nrDOMh2WQiBoe9m9jHeTRn1efBm4lx51dQOyq9x9ol6ONUFMlqHQAiWwubKCJACqRQyMCK3QbMSw/h0X6Srj+jBvw8zQs80g/FivUCtZaz19/vSkbhbht7CRtXygABKPPMNSiwlKPoKzWhYCz6eTX08qKSi21shcrJPShuAXQ3Gu5chEFXvGTmA5ZpKk5xWBcCc3HaMHL0DiknXPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0065.namprd12.prod.outlook.com (2603:10b6:0:56::33) by
 BN6PR12MB1521.namprd12.prod.outlook.com (2603:10b6:405:f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 19:12:15 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0065.outlook.office365.com
 (2603:10b6:0:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:15 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:14 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 01/14] Revert "drm/amd/display: skip dsc config for navi10
 bring up"
Date: Tue, 20 Aug 2019 15:11:50 -0400
Message-ID: <20190820191203.25807-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(53936002)(49486002)(36756003)(336012)(1076003)(2906002)(50226002)(70206006)(4326008)(81166006)(8676002)(81156014)(8936002)(450100002)(5660300002)(51416003)(14444005)(186003)(76176011)(26005)(70586007)(6666004)(86362001)(305945005)(356004)(476003)(2616005)(446003)(11346002)(50466002)(16586007)(48376002)(478600001)(316002)(426003)(126002)(486006)(110136005)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1521; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b302fdd0-5416-463a-a7e4-08d725a25008
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1521; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1521:
X-Microsoft-Antispam-PRVS: <BN6PR12MB152142BB9BCB25F8A2B89D04EFAB0@BN6PR12MB1521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xi+rvO0xv1hcpTV6aYCj4yWuzYprg5u3qliR1pUJXN8HrD7a1Oio49PU8Ya3MUTK17ATEC5h5J5kCsUKreMejQvR49qCDL6/3tCepxi+gSEO4sYTWwObfk+7DKeVcecIaKKcg4xqDOYCG+yKMIlfOJjbqma8E1MylG7AY4mgVJq/KjV1W7TlcAXvozNC4cV2jwhT9j3un8SXeyWPTT4BxH3XkSL5LZ8MnYo+8yeG6hWRMDbDD76a2bunBZt/GgXAY74OvRYIZBFdvKtli11qyllFHJjxO5J9v4T7tYiPohJS9sqSJSeIFi7uFJdgpS6uRk2jgxBNzE5yGo8s8sYgFB867YhcUPaIQqM7N6rt5Ur0yuklTFa9mKIjxBEVB2CHlezBelgH2Q828u0hxF8Os244T1VxSMEktOkfXerB0/o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:15.2317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b302fdd0-5416-463a-a7e4-08d725a25008
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1521
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcumYwHSxR5cVhRbpN3wgIzuxKhPJ9GdIZAOCKyyPmo=;
 b=SX7LY8pKDMIOfh2qvXwKC8s2f0/Bsoh0t0PmQr1DJ2Hp9GH+D6iKQ8Y53xGHGj2wvklpkcblCU67YQ/TSTq09QntyjE/Wc/h0zRg+jJHGsDGJ7bCFe33lTPuj6Mcg2FcCnZi3Ib6y96NZuLo+ucgwLbgUWqPT1hk54jl9qGHqdM=
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

VGhpcyByZXZlcnRzIGNvbW1pdCA1NWFkODFmMzUxMGVjMWExYzE5ZTZhNGQ4YTYzMTk4MTJkMDdk
MjU2LgoKb3B0YyBkc2MgY29uZmlnIHdhcyBjYXVzaW5nIHdhcm5pbmdzIGR1ZSB0byBtaXNzaW5n
IHJlZ2lzdGVyCmRlZmluaXRpb25zLiBXaXRoIHRoZSByZWdpc3RlcnMgcmVzdG9yZWQsIHRoZSBm
dW5jdGlvbiBjYW4KYmUgcmUtZW5hYmxlZAoKVGhlIHJldmVydGVkIGNvbW1pdCBhbHNvIGRpc2Fi
bGVkIHNhbml0eSBjaGVja3MgYW5kIGRzYwpwb3dlciBnYXRpbmcuIFRoZSBzYW5pdHkgY2hlY2sg
d2FybmluZ3MgYXJlIG5vdCBhc3NvY2lhdGVkCndpdGggZHNjLCBhbmQgcG93ZXIgZ2F0aW5nIG9u
IGRzYyBzdGlsbCBoYXMgYW4gaXNzdWUgb24Kbm9uLWRzYyBtb25pdG9ycyB3aGVyZSB0aGUgZHNj
IGhhcmR3YXJlIGJsb2NrIGlzIG5ldmVyIGluaXQKYW5kIHNvIGNhbm5vdCByZXNwb25kIHRvIHBv
d2VyIGdhdGluZyByZXF1ZXN0cy4gVGhlcmVmb3JlLAp0aG9zZSBhcmUgbGVmdCBhcyBpcwoKU2ln
bmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgpSZXZpZXdl
ZC1ieTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxh
dXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jIHwgOSAtLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jCmluZGV4IGFlZGY5ZGUxYzk0Ny4uOTkwNzBlOTMwMjBi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBf
b3B0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9v
cHRjLmMKQEAgLTE5MSwxNSArMTkxLDYgQEAgdm9pZCBvcHRjMl9zZXRfZHNjX2NvbmZpZyhzdHJ1
Y3QgdGltaW5nX2dlbmVyYXRvciAqb3B0YywKIAkJCQkJdWludDMyX3QgZHNjX3NsaWNlX3dpZHRo
KQogewogCXN0cnVjdCBvcHRjICpvcHRjMSA9IERDTjEwVEdfRlJPTV9URyhvcHRjKTsKLQl1aW50
MzJfdCBkYXRhX2Zvcm1hdCA9IDA7Ci0JLyogc2tpcCBpZiBkc2MgbW9kZSBpcyBub3QgY2hhbmdl
ZCAqLwotCWRhdGFfZm9ybWF0ID0gZG1fcmVhZF9yZWcoQ1RYLCBSRUcoT1BUQ19EQVRBX0ZPUk1B
VF9DT05UUk9MKSk7Ci0KLQlkYXRhX2Zvcm1hdCA9IGRhdGFfZm9ybWF0ICYgMHgzMDsgLyogYml0
NTo0ICovCi0JZGF0YV9mb3JtYXQgPSBkYXRhX2Zvcm1hdCA+PiA0OwotCi0JaWYgKGRhdGFfZm9y
bWF0ID09IGRzY19tb2RlKQotCQlyZXR1cm47CiAKIAlSRUdfVVBEQVRFKE9QVENfREFUQV9GT1JN
QVRfQ09OVFJPTCwKIAkJT1BUQ19EU0NfTU9ERSwgZHNjX21vZGUpOwotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
