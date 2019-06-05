Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0436371
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102C8895EE;
	Wed,  5 Jun 2019 18:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820075.outbound.protection.outlook.com [40.107.82.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ED8895EE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 18:39:49 +0000 (UTC)
Received: from SN1PR12CA0088.namprd12.prod.outlook.com (2603:10b6:802:21::23)
 by BYAPR12MB2662.namprd12.prod.outlook.com (2603:10b6:a03:69::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Wed, 5 Jun
 2019 18:39:47 +0000
Received: from CO1NAM03FT060.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by SN1PR12CA0088.outlook.office365.com
 (2603:10b6:802:21::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22 via Frontend
 Transport; Wed, 5 Jun 2019 18:39:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT060.mail.protection.outlook.com (10.152.81.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Wed, 5 Jun 2019 18:39:46 +0000
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 5 Jun 2019
 13:39:45 -0500
From: Dingchen Zhang <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: actually remove the newline for CRC source name.
Date: Wed, 5 Jun 2019 14:35:56 -0400
Message-ID: <20190605183556.3006-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(86362001)(305945005)(2351001)(8936002)(2906002)(14444005)(356004)(6666004)(48376002)(50466002)(53416004)(4744005)(68736007)(70206006)(70586007)(51416003)(7696005)(426003)(8676002)(478600001)(476003)(316002)(4326008)(5660300002)(36756003)(16586007)(47776003)(486006)(81156014)(81166006)(54906003)(26005)(53936002)(44832011)(1076003)(6916009)(126002)(336012)(2616005)(50226002)(77096007)(186003)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2662; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b568ba24-8aa2-406f-3e10-08d6e9e52ef8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2662; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2662:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2662D5EE558DFCEAFB0EEC5C8D160@BYAPR12MB2662.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SC925LyyGeGi79PyeoN32k5BoRDLyD0eCooyLFNL05mwx+kTLcYJmpwbq0ovyxnbLpsosjei/6Nolm0uS2f3HrwvniDersUbVB13a57dr2nrcFkj+sCoij4OduAoNQ4Sv2/AW4VytaNkUURRcP8ncbK5E+nbQkeKZFwLbzV6CXF1EbbnhXSdPa4FjwKXzEjgYeVyJbTkWZXGHqCqf5UC1XaQZ/Q/F0WPnYtecRBGilW2lFO8i7uyccC/AVzlSP2hk/MjanMIIW0unf5MS05cGseoiL76waebiV3rkzu9Di8VkDTOI1q1WCCHAiEd6z31FK2tq32B8eqNGcHHQMZvfJZAJwirpj2rJV9nrxr1B7ToRsFCV0kPNbt1EfgVrMRX9AVGkEExvwdkJ+4z+cwQ7CbCjCNl2dUg0eJ3DWucWgs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 18:39:46.2405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b568ba24-8aa2-406f-3e10-08d6e9e52ef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKmA3HPKGjHZgIIbcTLa9wzPRx4a11rLUx5stEtJYZ8=;
 b=dVrnXPW3nM4blh798f2V5nocJCGv+77r6naG6eUpL/Yx/awn5EOgRz7BbkTdZPDg9o2EH6pk5/yaT67qFYQLGScv9qwFb3VOPsuHSHdonysQBfOa5q81b75MKUDoqDbYYmt6A1lGQ+mI60BfYIMmDLnaaeIuhoEDVzVeFzvcXpI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Dingchen Zhang <dingchen.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J24tMScgaXMgdGhlIGluZGV4IHRvIHJlcGxhY2UgdGhlIG5ld2xpbmUgY2hhcmFjdGVyIG9mIENS
QyBzb3VyY2UgbmFtZS4KCkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEhhcnJ5
IFdlbnRsYW5kPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERpbmdjaGVu
IFpoYW5nIDxkaW5nY2hlbi56aGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZGVidWdmc19jcmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNf
Y3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKaW5kZXggNTg1MTY5ZjBk
Y2M1Li5lMjBhZGVmOWQ2MjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
c19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKQEAgLTEzMSw4
ICsxMzEsOCBAQCBzdGF0aWMgc3NpemVfdCBjcmNfY29udHJvbF93cml0ZShzdHJ1Y3QgZmlsZSAq
ZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKnVidWYsCiAJaWYgKElTX0VSUihzb3VyY2UpKQogCQly
ZXR1cm4gUFRSX0VSUihzb3VyY2UpOwogCi0JaWYgKHNvdXJjZVtsZW5dID09ICdcbicpCi0JCXNv
dXJjZVtsZW5dID0gJ1wwJzsKKwlpZiAoc291cmNlW2xlbi0xXSA9PSAnXG4nKQorCQlzb3VyY2Vb
bGVuLTFdID0gJ1wwJzsKIAogCXJldCA9IGNydGMtPmZ1bmNzLT52ZXJpZnlfY3JjX3NvdXJjZShj
cnRjLCBzb3VyY2UsICZ2YWx1ZXNfY250KTsKIAlpZiAocmV0KQotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
