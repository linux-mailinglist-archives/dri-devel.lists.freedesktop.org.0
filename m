Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D210EFC2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202486E2B0;
	Mon,  2 Dec 2019 19:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A255D6E2B4;
 Mon,  2 Dec 2019 19:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q422w5No+jxwuMHMBBvY9VHxAphtXmVw1JCqhlTdYTjwM0/pxRq/VCpUHvj8QmqlIdZY9dUdqtmksfYW0otEuegZ6hqX9wORrRQdEaxcOxShFsyQw8NQCFDOlgrfO8VsPTEGeBy96hmh46pSyuTJ16BzaJwF27/4edqCXhbxdfAK5NChkkGPkCpWRV9wdv15ATljU9W1Hu9x5ubtDsFS/gi6E3QQ0o+NfwEohWcNR4lkpUCNKt1IHbbp+Fjw9aIoWEdp5HXEa7I455k9hTTd6SOThQptbSIOdaTNdxbwV2yKnP5OdZ5AjwX4IRFU28M9nQN23vu4b8Xp1Q+SSBz+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCt1pXlgudQ96j4QNDVi6RsgGMvcnCDMDyOQlkw5Uo0=;
 b=j3nkpYVPKvPvJBzq01p4c4GcPB5hXv678THKHTPDTwYM/3KsWe5U4mWDZDF8hytk+ykyoE4cjiqQQ018X2jhfa55yLWW6ZlZ4Gcki9otZT/486X4I4iw08AWLoQpYt1bLNtc/Ic/KYogveR2IGjJ8uoNNFVVFmACIFATeLZ8MmcXLHQ/7CtVum5BU2kQGcohLYFzVQ6vvdzVBCKQ4w8TUHFrfSbbk2rxJLgFw8JKommJhBUSuSb7jEdVPBRuZ67OxqzGA97h5aIfQajm7uBcfs++QH5Ey/frx4Xi+aominp6Rxs090MmzhrsxmYU06T2O+7qdqkCaWQ8/fTBMw7cNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0089.namprd12.prod.outlook.com (2603:10b6:802:21::24)
 by BN8PR12MB2964.namprd12.prod.outlook.com (2603:10b6:408:43::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Mon, 2 Dec
 2019 19:05:03 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0089.outlook.office365.com
 (2603:10b6:802:21::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Mon, 2 Dec 2019 19:05:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 2 Dec 2019 19:05:02 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 13:05:02 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Dec 2019 13:05:01 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RESEND 2/2] drm/amd/display: Hook up drm interface for DP 1.4 edid
 corruption test
Date: Mon, 2 Dec 2019 14:04:49 -0500
Message-ID: <20191202190449.2864-3-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191202190449.2864-1-Jerry.Zuo@amd.com>
References: <20191202190449.2864-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(428003)(189003)(199004)(4326008)(2616005)(478600001)(426003)(50466002)(11346002)(305945005)(51416003)(7696005)(76176011)(26005)(14444005)(336012)(186003)(53416004)(2906002)(110136005)(54906003)(316002)(16586007)(36756003)(446003)(48376002)(47776003)(50226002)(81166006)(81156014)(8676002)(8936002)(70206006)(70586007)(86362001)(6666004)(356004)(5660300002)(1076003)(2201001)(52103002)(158003001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2964; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6988624f-f267-456b-da7c-08d7775a893a
X-MS-TrafficTypeDiagnostic: BN8PR12MB2964:
X-Microsoft-Antispam-PRVS: <BN8PR12MB296481CC2E88D425FCCDA948E5430@BN8PR12MB2964.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zr4PHsI3D1hb+0t7NgQoEeOm1Zp4LZ8pMB2wcYe3ie86RPDoMqfQWmJqg/pjkk63S0XLf9W8NmwZ15VxIcbUeaDsLaURipfy3hJNoFq/ctWu1+VknesLziWdREX022I2JtPN7y65/TQJQoCb3oOnZwY23LQ/Lr/bd4oHCU7LbKfnDtkEN1USucRJ0JAoSFKXLSNYpnaurO7nMGUUzQCSJ3vidLmsuyfeW2+mfmGsqIGmg5aDpTIYLylagYeh2ABsuPiKMBtJwZZBXM30ZizVy13ZdeMWByyk+cMFkaGtDdD9Jzq2cV8bTrkhjyn1ZFeUt4uD9H7b5noupeyYXBKI9AblEJR8pHSl3oxc8z2oCoHGFizeS380lFcCXcekOSGC75IPt81VXrczlFZ8Sbtien+r8tvYpxMp1PJgn6zZPbzGBVmeIxlMDVpp1ECsSOLQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 19:05:02.8881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6988624f-f267-456b-da7c-08d7775a893a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2964
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCt1pXlgudQ96j4QNDVi6RsgGMvcnCDMDyOQlkw5Uo0=;
 b=Gihyi/mQlH4264+CSwlKpR6KIDqCGAnzdbZKmp6S02/Pe+VASXQtlFmRZNar6b3i4xUHxCvAHFWoauyI9CsiinbJp1pF+0PWg+UQOFe5oxxc1WVWQ17UvP7lc4sT88d3MtGl31xUL1SZdvlr5MJnQUEbszeswA7/yIROeyM7SjA=
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
Cc: rodrigo.siqueira@amd.com, manasi.d.navare@intel.com, Jerry.Zuo@amd.com,
 Alexander.Deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LXYzOiBSZW5hbWUgdG8gYXZvaWQgY29uZnVzaW9uCgpTaWduZWQtb2ZmLWJ5OiBKZXJyeSAoRmFu
Z3poaSkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5k
IDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgIHwgMzUgKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVy
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVs
cGVycy5jCmluZGV4IDExZTU3ODRhYTYyYS4uOTI3ZmRhYzc3YjZmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVy
cy5jCkBAIC01NzUsNiArNTc1LDcgQEAgZW51bSBkY19lZGlkX3N0YXR1cyBkbV9oZWxwZXJzX3Jl
YWRfbG9jYWxfZWRpZCgKIAkJc3RydWN0IGRjX3NpbmsgKnNpbmspCiB7CiAJc3RydWN0IGFtZGdw
dV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSBsaW5rLT5wcml2OworCXN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IgPSAmYWNvbm5lY3Rvci0+YmFzZTsKIAlzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmRkYzsKIAlpbnQgcmV0cnkgPSAzOwogCWVudW0gZGNfZWRpZF9zdGF0dXMgZWRpZF9zdGF0
dXM7CkBAIC01OTIsNiArNTkzLDEyIEBAIGVudW0gZGNfZWRpZF9zdGF0dXMgZG1faGVscGVyc19y
ZWFkX2xvY2FsX2VkaWQoCiAKIAkJZWRpZCA9IGRybV9nZXRfZWRpZCgmYWNvbm5lY3Rvci0+YmFz
ZSwgZGRjKTsKIAorCQlpZiAobGluay0+YXV4X21vZGUgJiYgY29ubmVjdG9yLT5lZGlkX2NvcnJ1
cHQpCisJCQlkcm1fZHBfc2VuZF9yZWFsX2VkaWRfY2hlY2tzdW0oJmFjb25uZWN0b3ItPmRtX2Rw
X2F1eC5hdXgsIGNvbm5lY3Rvci0+cmVhbF9lZGlkX2NoZWNrc3VtKTsKKworCQlpZiAoIWVkaWQg
JiYgY29ubmVjdG9yLT5lZGlkX2NvcnJ1cHQpCisJCQlyZXR1cm4gRURJRF9CQURfQ0hFQ0tTVU07
CisKIAkJaWYgKCFlZGlkKQogCQkJcmV0dXJuIEVESURfTk9fUkVTUE9OU0U7CiAKQEAgLTYxMiwz
NCArNjE5LDYgQEAgZW51bSBkY19lZGlkX3N0YXR1cyBkbV9oZWxwZXJzX3JlYWRfbG9jYWxfZWRp
ZCgKIAkJRFJNX0VSUk9SKCJFRElEIGVycjogJWQsIG9uIGNvbm5lY3RvcjogJXMiLAogCQkJCWVk
aWRfc3RhdHVzLAogCQkJCWFjb25uZWN0b3ItPmJhc2UubmFtZSk7Ci0JaWYgKGxpbmstPmF1eF9t
b2RlKSB7Ci0JCXVuaW9uIHRlc3RfcmVxdWVzdCB0ZXN0X3JlcXVlc3QgPSB7IHswfSB9OwotCQl1
bmlvbiB0ZXN0X3Jlc3BvbnNlIHRlc3RfcmVzcG9uc2UgPSB7IHswfSB9OwotCi0JCWRtX2hlbHBl
cnNfZHBfcmVhZF9kcGNkKGN0eCwKLQkJCQkJbGluaywKLQkJCQkJRFBfVEVTVF9SRVFVRVNULAot
CQkJCQkmdGVzdF9yZXF1ZXN0LnJhdywKLQkJCQkJc2l6ZW9mKHVuaW9uIHRlc3RfcmVxdWVzdCkp
OwotCi0JCWlmICghdGVzdF9yZXF1ZXN0LmJpdHMuRURJRF9SRUFEKQotCQkJcmV0dXJuIGVkaWRf
c3RhdHVzOwotCi0JCXRlc3RfcmVzcG9uc2UuYml0cy5FRElEX0NIRUNLU1VNX1dSSVRFID0gMTsK
LQotCQlkbV9oZWxwZXJzX2RwX3dyaXRlX2RwY2QoY3R4LAotCQkJCQlsaW5rLAotCQkJCQlEUF9U
RVNUX0VESURfQ0hFQ0tTVU0sCi0JCQkJCSZzaW5rLT5kY19lZGlkLnJhd19lZGlkW3NpbmstPmRj
X2VkaWQubGVuZ3RoLTFdLAotCQkJCQkxKTsKLQotCQlkbV9oZWxwZXJzX2RwX3dyaXRlX2RwY2Qo
Y3R4LAotCQkJCQlsaW5rLAotCQkJCQlEUF9URVNUX1JFU1BPTlNFLAotCQkJCQkmdGVzdF9yZXNw
b25zZS5yYXcsCi0JCQkJCXNpemVvZih0ZXN0X3Jlc3BvbnNlKSk7Ci0KLQl9CiAKIAlyZXR1cm4g
ZWRpZF9zdGF0dXM7CiB9Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
